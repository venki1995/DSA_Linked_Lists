class LinkedList
	attr_accessor :head, :tail
	def initialize
		@head= nil
		@tail=nil
	end

	def append(x)
		node=Node.new(x)
		if @head.nil?
			@head=node
			@tail=@head
		else
		@tail.next_node = node
		@tail=node
		end		
	end
	def prepend(value)
		node=Node.new(value)
		if @head.nil?
			@head=node
			@tail=@head
		else
			node.next_node=@head
			@head=node
		end
	end
	def size
		count = 0
		current=@head
		until current.nil?
		 count +=1
		 current=current.next_node
		end
		count
	end

	def head
		@head.val
	end

	def tail
		@tail.val
	end

	def at(index)
		i=0
		node=@head
		until i==index
			node=node.next_node
			i+=1
		end
		node.val
	end

	def pop
		i=0
		node=@head
		until i>=self.size-1
			node=node.next_node
			i+=1
		end
		@tail=node
		
	end

	def contains?(value)
		node=@head
		until node==nil
			if node.val==value
				return true
			end
			node=node.next_node
		end
		return false
	end

	def find?(data)
		i=0
		index=nil
		node=@head
		until node.nil?
			if node.val== data
				index=i
				break
			end
			node=node.next_node
			i+=1
		end
		index
	end

	def to_s
		node=@head
		ll=""
		until node.nil?
			ll+= "(#{node.val}) ->"
			node=node.next_node
		end

		ll << "nil"
		ll
	end

	def insert_at(data,index)
		if index==0
			prepend(data)
		elsif index==self.size
			append(data)
		else
			node=Node.new(data)
			node.val=data
			active_node=@head
			count=0
			until count ==index-1
				active_node=active_node.next_node
				count+=1
			end
			node.next_node=active_node.next_node
			active_node.next_node=node
		end
	end

	def remove_at(index)
		if index<=1
			@head.value=nil
			@head=@head.next_node
		elsif index==self.size-1
			pop
		else
			count = 0
      		active_node = @head
      		until count == index - 1
        		active_node = active_node.next_node
        		count += 1
      		end
      		active_node.next_node.val= nil
      		active_node.next_node = active_node.next_node.next_node
      	end
    end
end



class Node

	attr_accessor :val, :next_node
	
	def initialize(value)
		@val=value
		@next_node=next_node
	end


end
