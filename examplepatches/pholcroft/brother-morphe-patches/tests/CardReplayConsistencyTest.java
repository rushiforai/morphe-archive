import android.content.Context;
import app.template.extension.extension.AutoCache;
import app.template.extension.extension.CommunicationTiming;
import app.template.extension.extension.ReplayEngine;
import java.util.List;

/** Regression: the card's completed activity and its replay must match. */
public class CardReplayConsistencyTest {
    public static void main(String[] args) {
        AutoCache.init(new Context());
        String endpoint = "192.0.2.21";
        ReplayEngine.Spec first = new ReplayEngine.Spec("1.2.3", "public", 0, 1, 161, 1000, 1);
        ReplayEngine.Spec second = new ReplayEngine.Spec("1.2.4", "public", 0, 2, 161, 1000, 1);
        ReplayEngine.Spec newer = new ReplayEngine.Spec("1.2.5", "public", 0, 3, 161, 1000, 1);
        CommunicationTiming.request(endpoint); CommunicationTiming.finishCapture(CommunicationTiming.capture(endpoint, first));
        CommunicationTiming.request(endpoint); CommunicationTiming.finishCapture(CommunicationTiming.capture(endpoint, second));
        CommunicationTiming.finishAll();
        if (!"2".equals(AutoCache.timingRequestCount(endpoint, "latest")))
            throw new AssertionError("card should describe the two-request completed burst");
        CommunicationTiming.request(endpoint); CommunicationTiming.finishCapture(CommunicationTiming.capture(endpoint, newer));
        CommunicationTiming.Snapshot displayed = CommunicationTiming.latestSnapshot(endpoint);
        List<ReplayEngine.Spec> selected = displayed == null ? null : displayed.requests();
        if (selected == null || selected.size() != 2 || !selected.get(0).oid.equals(first.oid)
                || !selected.get(1).oid.equals(second.oid))
            throw new AssertionError("replay selected a different burst than the card");
        CommunicationTiming.finishAll();
        if (displayed.requests().size()!=2 || CommunicationTiming.latestSnapshot(endpoint).requests().size()!=1)
            throw new AssertionError("displayed snapshot must not change when a later burst finishes");
        if(!CommunicationTiming.isValidSnapshot(endpoint,displayed))throw new AssertionError("older displayed burst must remain valid");
        CommunicationTiming.discard(endpoint);
        if(CommunicationTiming.isValidSnapshot(endpoint,displayed))throw new AssertionError("clearing must invalidate old menu references");
    }
}
