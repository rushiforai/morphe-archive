import android.content.Context;
import app.template.extension.extension.AutoCache;
import app.template.extension.extension.CommunicationTiming;
import app.template.extension.extension.ReplayEngine;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;

public class PendingBurstTest {
    public static void main(String[] args)throws Exception{
        AutoCache.init(new Context());String ip="192.0.2.61";
        CommunicationTiming.request(ip);
        CommunicationTiming.Capture token=CommunicationTiming.capture(ip,new ReplayEngine.Spec("1.2.3","public",0,1,161,1000,1));
        Field bursts=CommunicationTiming.class.getDeclaredField("BURSTS");bursts.setAccessible(true);
        Object burst=((Map<?,?>)bursts.get(null)).get(ip);
        Field last=burst.getClass().getDeclaredField("last");last.setAccessible(true);
        Method finish=CommunicationTiming.class.getDeclaredMethod("finishIfIdle",String.class,burst.getClass());finish.setAccessible(true);
        last.setLong(burst,System.nanoTime()/1000000L-4000);
        finish.invoke(null,ip,burst);
        if(CommunicationTiming.latestSnapshot(ip)!=null)throw new AssertionError("an outstanding request must keep its burst open");
        CommunicationTiming.finishAll();
        if(CommunicationTiming.latestSnapshot(ip)!=null)throw new AssertionError("stopping diagnostics must not force a pending burst complete");
        CommunicationTiming.finishCapture(token);
        last.setLong(burst,System.nanoTime()/1000000L-4000);finish.invoke(null,ip,burst);
        if(CommunicationTiming.latestSnapshot(ip)==null)throw new AssertionError("the burst should finish after the request terminates and becomes idle");
    }
}
