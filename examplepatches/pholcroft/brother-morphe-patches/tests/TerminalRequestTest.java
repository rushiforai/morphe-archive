import android.content.Context;
import java.net.InetAddress;
import com.brother.sdk.network.BrDatagramSocket;
import com.brother.sdk.common.socket.devicemanagement.snmp.SnmpRequest;
import app.template.extension.extension.AutoCache;
import app.template.extension.extension.CommunicationTiming;

public class TerminalRequestTest {
    public static void main(String[] args)throws Exception{
        AutoCache.init(new Context());String ip="192.0.2.62";
        BrDatagramSocket s=new BrDatagramSocket(InetAddress.getByName(ip));
        AutoCache.lookup(s,new SnmpRequest("1.2.3",-96));
        CommunicationTiming.finishAll();
        if(CommunicationTiming.latestSnapshot(ip)!=null)throw new AssertionError("request still in flight");
        AutoCache.finishRequest();AutoCache.finishRequest();
        CommunicationTiming.finishAll();
        if(CommunicationTiming.latestSnapshot(ip)==null)throw new AssertionError("terminal failure must release its burst exactly once");
        if(CommunicationTiming.latestSnapshot(ip).requests()!=null)throw new AssertionError("a failed request must not be presented as a complete replayable burst");
    }
}
