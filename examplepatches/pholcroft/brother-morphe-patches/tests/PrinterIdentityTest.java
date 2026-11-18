import android.content.Context;
import java.net.InetAddress;
import com.brother.sdk.network.BrDatagramSocket;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpRequest;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpResult;
import com.brother.sdk.common.socket.devicemanagement.snmp.westhawk.*;
import app.template.extension.extension.AutoCache;

public class PrinterIdentityTest {
    static final String MAC="1.3.6.1.2.1.2.2.1.6.1", DATA="1.3.6.1.2.1.1.1.0";
    static final byte[] A={2,1,2,3,4,5}, B={2,1,2,3,4,6}, INVALID={0,0,0,0,0,0};
    static void check(boolean x,String m){if(!x)throw new AssertionError(m);}
    static BrDatagramSocket socket(String ip)throws Exception{return new BrDatagramSocket(InetAddress.getByName(ip));}
    static SnmpRequest request(String oid){return new SnmpRequest(oid,-96);}
    static void record(BrDatagramSocket s,String oid,byte[] value){SnmpRequest q=request(oid);AutoCache.lookup(s,q);SnmpResult r=new SnmpResult();r.results=new Varbind[]{new Varbind(oid,new AsnOctets(value))};AutoCache.record(s,q,r);}
    static void restart()throws Exception{java.lang.reflect.Method m=AutoCache.class.getDeclaredMethod("resetVerification");m.setAccessible(true);m.invoke(null);}
    public static void main(String[] args)throws Exception{
        Context c=new Context();AutoCache.init(c);BrDatagramSocket old=socket("192.0.2.10"), moved=socket("192.0.2.20"), other=socket("192.0.2.30");
        record(old,MAC,A);record(old,DATA,new byte[]{65});AutoCache.saveTiming("192.0.2.10",1200,3,0);check(AutoCache.lookup(old,request(DATA))!=null,"initial cache should work after identifying printer");
        check(AutoCache.lookup(old,request(MAC))==null,"hardware identity must be checked live");
        check(AutoCache.lookup(old,request(DATA))==null,"cache unavailable while identity check pending");
        record(old,MAC,A);check(AutoCache.lookup(old,request(DATA))!=null,"verified cache resumes after live check");
        restart();check(AutoCache.lookup(old,request(DATA))==null,"do not trust stale IP before verifying identity");
        record(old,MAC,A);check(AutoCache.lookup(old,request(DATA))!=null,"same identity restores cache");
        check(AutoCache.lookup(moved,request(DATA))==null,"new address starts uncached");record(moved,MAC,A);
        check(AutoCache.lookup(moved,request(DATA))!=null,"same hardware at new IP must reuse cache");
        check(AutoCache.timingValue("192.0.2.20","baseline").equals("1200"),"timing summary follows moved printer");
        check(AutoCache.hasChangedAddress("192.0.2.20"),"mark address change");
        check(AutoCache.lookup(old,request(DATA))==null,"old IP cannot reuse moved printer cache");
        record(old,MAC,B);check(AutoCache.lookup(old,request(DATA))==null,"different printer must not get old data");record(old,DATA,new byte[]{66});
        restart();record(old,MAC,A);check(AutoCache.lookup(old,request(DATA))!=null,"returning printer A is recognised");
        record(other,MAC,B);SnmpResult b=(SnmpResult)AutoCache.lookup(other,request(DATA));check(b!=null && b.results[0].getValue().bytes[0]==66,"displaced printer B retains its cache");
        BrDatagramSocket unknown=socket("192.0.2.40");record(unknown,DATA,new byte[]{67});check(AutoCache.lookup(unknown,request(DATA))==null,"unidentified printer cannot use staged responses");record(unknown,MAC,INVALID);check(AutoCache.lookup(unknown,request(DATA))==null,"invalid identity must not enable reuse");
        BrDatagramSocket fresh=socket("192.0.2.41");record(fresh,DATA,new byte[]{68});check(AutoCache.lookup(fresh,request(DATA))==null,"staged response is not served before identity");record(fresh,MAC,new byte[]{2,1,2,3,4,7});check(AutoCache.lookup(fresh,request(DATA))!=null,"live responses before identity are retained after verification");
        AutoCache.clearAll();check(AutoCache.printers().isEmpty(),"clear all removes saved identities");record(other,MAC,B);check(AutoCache.lookup(other,request(DATA))==null,"clear all removes archived responses too");
        AutoCache.clearAll();AutoCache.writeString("mac|192.0.2.50","02:01:02:03:04:05");AutoCache.writeString("entry|192.0.2.50|"+DATA,"octets:QQ==");
        BrDatagramSocket upgraded=socket("192.0.2.60");record(upgraded,MAC,A);check(AutoCache.lookup(upgraded,request(DATA))!=null,"legacy saved cache must migrate");check(AutoCache.hasChangedAddress("192.0.2.60"),"legacy move must be marked");
        System.out.println("Printer identity and address change checks passed");
    }
}
