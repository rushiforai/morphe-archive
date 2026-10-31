package app.morphe.extension.chmate;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
public final class MediaAttemptGateTest {
    static int checks;
    static void check(boolean ok){if(!ok)throw new AssertionError("case "+checks);checks++;}
    public static void main(String[] args)throws Exception{
        MediaAttemptGate gate=new MediaAttemptGate(128,60000);
        for(int i=0;i<128;i++)check(gate.begin("old"+i,0));
        check(!gate.begin("overflow",61000)); // running jobs never expire
        for(int i=0;i<128;i++)gate.finish("old"+i,false,61000);
        check(!gate.begin("new",120999));
        check(gate.begin("new",121000)); // all expired failures can be reclaimed
        check(!gate.begin("new",999999));
        gate.finish("new",true,999999);
        for(int i=0;i<1000;i++){check(gate.begin("success"+i,1000000));gate.finish("success"+i,true,1000000);}
        check(gate.begin("cancel",1000000));gate.cancel("cancel");check(gate.begin("cancel",1000000));
        MediaAttemptGate single=new MediaAttemptGate(10,60000);ExecutorService workers=Executors.newFixedThreadPool(8);
        AtomicInteger accepted=new AtomicInteger();List<Future<?>> futures=new ArrayList<>();
        for(int i=0;i<100;i++)futures.add(workers.submit(()->{if(single.begin("same",1))accepted.incrementAndGet();}));
        for(Future<?> f:futures)f.get();workers.shutdown();check(accepted.get()==1);
        System.out.println("PASS media retry gate "+checks);
    }
}
