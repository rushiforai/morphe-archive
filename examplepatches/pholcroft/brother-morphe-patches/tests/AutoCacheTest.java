import android.content.Context;
import java.net.InetAddress;
import java.util.Arrays;
import com.brother.sdk.network.BrDatagramSocket;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpRequest;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpResult;
import com.brother.sdk.common.socket.devicemanagement.snmp.westhawk.*;
import app.template.extension.extension.AutoCache;
import app.template.extension.extension.Diagnostics;

public class AutoCacheTest {
    static void check(boolean x,String label){if(!x)throw new AssertionError(label);}
    static SnmpResult success(String oid,AsnObject value){SnmpResult r=new SnmpResult();r.results=new Varbind[]{new Varbind(oid,value)};return r;}
    public static void main(String[] args)throws Exception{
        Context c=new Context();AutoCache.init(c);
        BrDatagramSocket first=new BrDatagramSocket(InetAddress.getByName("192.0.2.1"));
        BrDatagramSocket second=new BrDatagramSocket(InetAddress.getByName("192.0.2.2"));
        String mac="1.3.6.1.2.1.2.2.1.6.1";
        AutoCache.record(first,new SnmpRequest(mac,-96),success(mac,new AsnOctets(new byte[]{2,1,2,3,4,1})));
        AutoCache.record(second,new SnmpRequest(mac,-96),success(mac,new AsnOctets(new byte[]{2,1,2,3,4,2})));
        String oid="1.3.6.1.2.1.43.1.1.1",no="1.3.6.1.2.1.43.1.1.2",num="1.3.6.1.2.1.43.1.1.3";
        SnmpRequest request=new SnmpRequest(oid,-96);
        check(AutoCache.lookup(first,request)==null,"first request must be live");
        AutoCache.record(first,request,success(oid,new AsnOctets(new byte[]{0,1,-1})));
        SnmpResult saved=(SnmpResult)AutoCache.lookup(first,request);
        check(Arrays.equals(saved.results[0].getValue().bytes,new byte[]{0,1,-1}),"octets changed");
        check(AutoCache.lookup(second,request)==null,"printer isolation");
        AutoCache.record(first,new SnmpRequest(num,-96),success(num,new AsnInteger(-9)));
        saved=(SnmpResult)AutoCache.lookup(first,new SnmpRequest(num,-96));
        check(((AsnInteger)saved.results[0].getValue()).number==-9,"integer changed");
        SnmpResult absent=new SnmpResult();absent.state=SnmpResult.SnmpState.ErrorRequestNoSuchName;
        AutoCache.record(first,new SnmpRequest(no,-96),absent);
        check(((SnmpResult)AutoCache.lookup(first,new SnmpRequest(no,-96))).state==SnmpResult.SnmpState.ErrorRequestNoSuchName,"noSuchName");
        SnmpResult timeout=new SnmpResult();timeout.state=SnmpResult.SnmpState.ErrorRequestTimeout;
        AutoCache.record(second,request,timeout);check(AutoCache.lookup(second,request)==null,"timeout must not be cached");
        check(AutoCache.lookup(first,new SnmpRequest(oid,-95))==null,"GETNEXT must stay live");
        check(AutoCache.lookup(first,new SnmpRequest(oid,-96,2))==null,"multi request must stay live");
        AutoCache.setEnabled(false);check(AutoCache.lookup(first,request)==null,"disabled cache must bypass");
        AutoCache.setEnabled(true);AutoCache.init(c);check(AutoCache.lookup(first,request)==null,"re-enable must verify identity");AutoCache.record(first,new SnmpRequest(mac,-96),success(mac,new AsnOctets(new byte[]{2,1,2,3,4,1})));check(AutoCache.lookup(first,request)!=null,"persist across init after identity check");
        AutoCache.clearPrinter("192.0.2.1");check(AutoCache.lookup(first,request)==null,"clear printer");
        AutoCache.record(first,new SnmpRequest(mac,-96),success(mac,new AsnOctets(new byte[]{2,1,2,3,4,1})));
        Diagnostics.clear();Diagnostics.start();
        check(AutoCache.lookup(first,request)==null,"diagnostic miss");
        AutoCache.record(first,request,success(oid,new AsnOctets(new byte[]{65,66,67})));
        check(AutoCache.lookup(first,request)!=null,"diagnostic hit");
        String diag=Diagnostics.csv();check(Diagnostics.count()==2 && diag.contains("printer") && diag.contains("cache") && diag.contains("QUJD"),"live and cached responses recorded");
        AutoCache.setEnabled(false);AutoCache.lookup(first,request);AutoCache.record(first,request,success(oid,new AsnInteger(42)));
        check(Diagnostics.count()==3 && Diagnostics.csv().contains("42"),"record live response while cache disabled");
        Diagnostics.stop();AutoCache.setEnabled(true);
        check(AutoCache.printerName("192.0.2.2").equals("Saved printer"),"missing description fallback");
        AutoCache.record(second,new SnmpRequest(mac,-96),success(mac,new AsnOctets(new byte[]{2,1,2,3,4,2})));
        String descriptionOid="1.3.6.1.2.1.25.3.2.1.3.1";
        AutoCache.record(second,new SnmpRequest(descriptionOid,-96),success(descriptionOid,new AsnOctets("Brother Example Printer".getBytes(java.nio.charset.StandardCharsets.UTF_8))));
        check(AutoCache.printerName("192.0.2.2").equals("Brother Example Printer"),"use captured printer description");
        System.out.println("Automatic cache tests passed");
    }
}

