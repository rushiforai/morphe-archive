package app.morphe.extension.chmate;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public final class NgPlainTextCacheTest {
    static int checks;
    static void check(boolean ok){if(!ok)throw new AssertionError("case "+checks);checks++;}
    public static void main(String[] args)throws Exception{
        AtomicInteger conversions=new AtomicInteger();
        NgPlainTextCache.Converter converter=s->{conversions.incrementAndGet();return "plain:"+s;};
        NgPlainTextCache cache=new NgPlainTextCache(3,100);
        check(cache.plain(null,converter).equals("")&&conversions.get()==0);
        check(cache.plain("",converter).equals("plain:"));
        check(cache.plain("",converter).equals("plain:")&&conversions.get()==1);
        check(cache.plain("Aa",converter).equals("plain:Aa"));
        check(cache.plain("BB",converter).equals("plain:BB")); // String hash collision must remain distinct.
        check(cache.plain(new String("Aa"),converter).equals("plain:Aa")&&conversions.get()==3);
        cache.plain("new",converter);int before=conversions.get();cache.plain("",converter);check(conversions.get()==before+1);
        NgPlainTextCache tiny=new NgPlainTextCache(10,12);
        tiny.plain("a",converter);tiny.plain("b",converter);before=conversions.get();tiny.plain("a",converter);check(conversions.get()==before+1);
        String large="x".repeat(100);before=conversions.get();tiny.plain(large,converter);tiny.plain(large,converter);check(conversions.get()==before+2);
        NgPlainTextCache repeat=new NgPlainTextCache(512,1_000_000);
        before=conversions.get();for(int i=0;i<5000;i++)check(repeat.plain("<b>同一の荒らし本文</b>",converter).equals("plain:<b>同一の荒らし本文</b>"));
        check(conversions.get()==before+1);
        before=conversions.get();repeat.plain("<b>編集された本文</b>",converter);check(conversions.get()==before+1);
        repeat.configure(0,1_000_000);before=conversions.get();repeat.plain("same",converter);repeat.plain("same",converter);check(conversions.get()==before+2);
        repeat.configure(512,0);before=conversions.get();repeat.plain("",converter);repeat.plain("",converter);check(conversions.get()==before+2);
        repeat.configure(512,1_000_000);before=conversions.get();repeat.plain("same",converter);repeat.plain("same",converter);check(conversions.get()==before+1);
        repeat.configure(1,1_000_000);repeat.plain("other",converter);before=conversions.get();repeat.plain("same",converter);check(conversions.get()==before+1);
        repeat.configure(Integer.MAX_VALUE,Integer.MAX_VALUE);before=conversions.get();repeat.plain("big-limit",converter);repeat.plain("big-limit",converter);check(conversions.get()==before+1);
        NgPlainTextCache racing=new NgPlainTextCache(3,1000);
        CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
        var executor=Executors.newFixedThreadPool(2);
        try{
            Future<String> blocked=executor.submit(()->racing.plain("slow",s->{entered.countDown();try{release.await();}catch(InterruptedException e){throw new RuntimeException(e);}return s;}));
            check(entered.await(2,TimeUnit.SECONDS));
            Future<String> fast=executor.submit(()->racing.plain("fast",s->s));
            check(fast.get(2,TimeUnit.SECONDS).equals("fast")); // conversion does not hold cache lock
            racing.configure(0,0);release.countDown();check(blocked.get(2,TimeUnit.SECONDS).equals("slow"));
            check(racing.plain("slow",s->"fresh").equals("fresh")); // a conversion started before disable cannot insert later
        }finally{release.countDown();executor.shutdownNow();}
        System.out.println("PASS "+checks+" cache checks; identical 5000 inputs invoke converter once; conversion does not hold cache lock");
    }
}
