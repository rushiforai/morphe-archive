import android.content.Context;
import app.template.extension.extension.*;
import java.nio.charset.StandardCharsets;

public class HistoryMapperTest {
    public static void main(String[] args){
        AutoCache.init(new Context());CommunicationTiming.setSequenceSource(()->17);
        String ip="192.0.2.81";ReplayEngine.Spec spec=new ReplayEngine.Spec("1.2.3","sensitive",1,7,161,1000,2);
        CommunicationTiming.request(ip);CommunicationTiming.Capture capture=CommunicationTiming.capture(ip,spec);
        CommunicationTiming.captureCachedResponse(capture,"integer:5",40);CommunicationTiming.finishAll();
        ActivityBurst burst=HistoryMapper.map(ip,"printer","burst",CommunicationTiming.latestSnapshot(ip),s->"opaque");
        RequestRecord r=burst.requests().get(0);
        if(burst.ref.sequence!=17||!r.cached||r.details.sampleNanos!=40000000L||!r.details.contextId.equals("opaque"))throw new AssertionError("record must retain sequence, source, sample and context ID");
        if(!"integer:5".equals(new String(r.response(),StandardCharsets.UTF_8)))throw new AssertionError("record must retain observed value");
        if(r.details.contextId.contains("sensitive"))throw new AssertionError("credential must not appear in durable record");
        CommunicationTiming.request(ip);CommunicationTiming.Capture failed=CommunicationTiming.capture(ip,spec);
        CommunicationTiming.failCapture(failed);CommunicationTiming.finishAll();
        ActivityBurst incomplete=HistoryMapper.map(ip,"printer","incomplete",CommunicationTiming.latestSnapshot(ip),s->"opaque");
        if(incomplete.coverage.requestsComplete||incomplete.requests().get(0).outcome!=RequestRecord.Outcome.ERROR)
            throw new AssertionError("terminal failure must be retained but must not be replayable");
    }
}
