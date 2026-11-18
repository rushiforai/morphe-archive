import app.template.extension.extension.SequenceAllocator;
import java.util.ArrayDeque;
import java.util.concurrent.Executor;

public class SequenceAllocatorTest {
    private static final class Queue implements Executor {
        final ArrayDeque<Runnable> tasks=new ArrayDeque<>();
        public void execute(Runnable r){tasks.add(r);}void run(){while(!tasks.isEmpty())tasks.remove().run();}
    }
    public static void main(String[] args){
        Queue queue=new Queue();long[] next={1};
        SequenceAllocator allocator=new SequenceAllocator(count->{long start=next[0];next[0]+=count;return start;},queue,4);
        if(allocator.take()!=-1)throw new AssertionError("unreserved numbers must never be invented");
        queue.run();
        if(allocator.take()!=1||allocator.take()!=2||allocator.take()!=3||allocator.take()!=4)
            throw new AssertionError("reserved numbers must be handed out in order");
        if(allocator.take()!=-1)throw new AssertionError("exhausted block must not block or fabricate a number");
        queue.run();
        if(allocator.take()!=5)throw new AssertionError("the next durable block must continue the sequence");
    }
}
