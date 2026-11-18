import android.content.Context;
import java.net.InetAddress;
import com.brother.sdk.network.BrDatagramSocket;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpRequest;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpResult;
import com.brother.sdk.common.socket.devicemanagement.snmp.westhawk.*;
import app.template.extension.extension.AutoCache;

public class ClearCacheRaceTest {
    static final String MAC="1.3.6.1.2.1.2.2.1.6.1",DATA="1.3.6.1.2.1.1.1.0";
    static final byte[] IDENT={2,1,2,3,4,5};
    static SnmpRequest req(String id){return new SnmpRequest(id,-96);}
    static SnmpResult value(String id,byte[] bytes){SnmpResult r=new SnmpResult();r.results=new Varbind[]{new Varbind(id,new AsnOctets(bytes))};return r;}
    static void check(boolean b,String msg){if(!b)throw new AssertionError(msg);}
    static void identify(BrDatagramSocket s){AutoCache.lookup(s,req(MAC));AutoCache.record(s,req(MAC),value(MAC,IDENT));}
    public static void main(String[] args)throws Exception{
        AutoCache.init(new Context());BrDatagramSocket s=new BrDatagramSocket(InetAddress.getByName("192.0.2.70"));
        identify(s);AutoCache.lookup(s,req(DATA));AutoCache.record(s,req(DATA),value(DATA,new byte[]{65}));
        check(AutoCache.lookup(s,req(DATA))!=null,"setup cache");AutoCache.clearPrinter("192.0.2.70");
        identify(s);check(AutoCache.lookup(s,req(DATA))==null,"clear must remove old value");
        AutoCache.record(s,req(DATA),value(DATA,new byte[]{66}));SnmpResult fresh=(SnmpResult)AutoCache.lookup(s,req(DATA));
        check(fresh!=null && fresh.results[0].getValue().bytes[0]==66,"fresh response can be learned after clear");
        AutoCache.lookup(s,req(MAC));AutoCache.clearPrinter("192.0.2.70");AutoCache.record(s,req(MAC),value(MAC,IDENT));
        check(AutoCache.printers().isEmpty(),"in-flight identity reply from before clear must not repopulate cache");
        String other="1.3.6.1.2.1.1.2.0";check(AutoCache.lookup(s,req(other))==null,"second object must go live");AutoCache.clearAll();AutoCache.record(s,req(other),value(other,new byte[]{67}));identify(s);
        check(AutoCache.lookup(s,req(other))==null,"in-flight data reply from before clear-all must not be restored");
        AutoCache.clearAll();java.util.concurrent.CountDownLatch sent=new java.util.concurrent.CountDownLatch(1),cleared=new java.util.concurrent.CountDownLatch(1);
        Thread worker=new Thread(()->{try{AutoCache.lookup(s,req(MAC));sent.countDown();cleared.await();AutoCache.record(s,req(MAC),value(MAC,IDENT));}catch(Exception e){throw new RuntimeException(e);}});
        worker.start();sent.await();AutoCache.clearAll();cleared.countDown();worker.join();
        check(AutoCache.printers().isEmpty(),"clear from another thread must invalidate an in-flight response");
        AutoCache.lookup(s,req(MAC));AutoCache.record(s,req(MAC),null);AutoCache.clearAll();AutoCache.record(s,req(MAC),value(MAC,IDENT));
        check(AutoCache.printers().isEmpty(),"a failed decode followed by clear must not lose the request epoch");
        BrDatagramSocket otherPrinter=new BrDatagramSocket(InetAddress.getByName("192.0.2.71"));
        AutoCache.lookup(otherPrinter,req(MAC));AutoCache.record(otherPrinter,req(MAC),value(MAC,new byte[]{2,1,2,3,4,6}));String otherOid="1.3.6.1.2.1.1.3.0";
        AutoCache.lookup(otherPrinter,req(otherOid));AutoCache.clearPrinter("192.0.2.70");AutoCache.record(otherPrinter,req(otherOid),value(otherOid,new byte[]{68}));
        check(AutoCache.lookup(otherPrinter,req(otherOid))!=null,"clearing one printer must not drop another printer's in-flight response");
        long generation=AutoCache.generation();AutoCache.clearAll();
        AutoCache.saveTimingIfCurrent("192.0.2.70",123,1,0,0,0,120,1,generation);
        check(AutoCache.timingValue("192.0.2.70","latest").isEmpty(),"a delayed completed timing cannot reappear after clear");
        System.out.println("Clear cache and in-flight response checks passed");
    }
}
