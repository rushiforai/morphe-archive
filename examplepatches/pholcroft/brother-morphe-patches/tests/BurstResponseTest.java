import android.content.Context;
import app.template.extension.extension.AutoCache;
import app.template.extension.extension.CommunicationTiming;
import app.template.extension.extension.ReplayEngine;

public class BurstResponseTest {
    public static void main(String[] args){
        AutoCache.init(new Context());String ip="192.0.2.42";long[] sequence={8};CommunicationTiming.setSequenceSource(()->sequence[0]++);
        ReplayEngine.Spec spec=new ReplayEngine.Spec("1.2.3","public",0,1,161,1000,1);
        CommunicationTiming.request(ip);CommunicationTiming.Capture a=CommunicationTiming.capture(ip,spec);
        CommunicationTiming.request(ip);CommunicationTiming.Capture b=CommunicationTiming.capture(ip,spec);
        CommunicationTiming.captureResponse(b,"integer:2");CommunicationTiming.captureResponse(a,"integer:1");
        CommunicationTiming.finishAll();CommunicationTiming.Snapshot snapshot=CommunicationTiming.latestSnapshot(ip);
        if(snapshot.sequence!=8)throw new AssertionError("sequence must be assigned when the burst starts");
        if(!"integer:1".equals(snapshot.responses().get(0))||!"integer:2".equals(snapshot.responses().get(1)))
            throw new AssertionError("responses must be matched to request occurrence, not OID or completion order");
        if(snapshot.startOffsetsNanos().size()!=2 || snapshot.endOffsetsNanos().size()!=2 || snapshot.startOffsetsNanos().get(0)>snapshot.endOffsetsNanos().get(0))
            throw new AssertionError("each recorded response needs a matching request interval");
        try{snapshot.responses().set(0,"changed");throw new AssertionError("snapshot responses must be immutable");}
        catch(UnsupportedOperationException expected){}
        CommunicationTiming.discard(ip);CommunicationTiming.captureResponse(a,"stale");
        if(CommunicationTiming.isValidSnapshot(ip,snapshot))throw new AssertionError("cleared snapshot must remain invalid");
    }
}
