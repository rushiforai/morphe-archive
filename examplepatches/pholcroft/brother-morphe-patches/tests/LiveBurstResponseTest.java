import android.content.Context;
import java.net.InetAddress;
import com.brother.sdk.network.BrDatagramSocket;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpRequest;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpResult;
import com.brother.sdk.common.socket.devicemanagement.snmp.westhawk.*;
import app.template.extension.extension.AutoCache;
import app.template.extension.extension.CommunicationTiming;

public class LiveBurstResponseTest {
    public static void main(String[] args)throws Exception{
        AutoCache.init(new Context());String ip="192.0.2.55",mac="1.3.6.1.2.1.2.2.1.6.1",oid="1.3.6.1.2.1.1.1.0";
        BrDatagramSocket socket=new BrDatagramSocket(InetAddress.getByName(ip));
        SnmpRequest identify=new SnmpRequest(mac,-96);AutoCache.lookup(socket,identify);
        SnmpResult identity=new SnmpResult();identity.results=new Varbind[]{new Varbind(mac,new AsnOctets(new byte[]{2,1,2,3,4,5}))};AutoCache.record(socket,identify,identity);
        SnmpRequest request=new SnmpRequest(oid,-96);AutoCache.lookup(socket,request);
        SnmpResult live=new SnmpResult();live.results=new Varbind[]{new Varbind(oid,new AsnOctets(new byte[]{65}))};AutoCache.record(socket,request,live);
        if(AutoCache.lookup(socket,new SnmpRequest(oid,-96))==null)throw new AssertionError("third request should be served from cache");
        CommunicationTiming.finishAll();CommunicationTiming.Snapshot snapshot=CommunicationTiming.latestSnapshot(ip);
        if(snapshot==null||snapshot.responses().size()!=3||!"octets:QQ==".equals(snapshot.responses().get(1))||!"octets:QQ==".equals(snapshot.responses().get(2)))
            throw new AssertionError("live and cached results must be retained at their original positions");
        if(snapshot.cacheSources().get(1)||!snapshot.cacheSources().get(2))throw new AssertionError("each response must retain its original source");
        if(AutoCache.lookup(socket,new SnmpRequest(oid,-96))==null)throw new AssertionError("later request should be cached");
        CommunicationTiming.finishAll();
        CommunicationTiming.Snapshot later=CommunicationTiming.latestSnapshot(ip);
        if(!"02:01:02:03:04:05".equals(later.verifiedMac))throw new AssertionError("a later burst should retain its currently verified printer identity");
    }
}
