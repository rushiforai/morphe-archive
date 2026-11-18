import app.template.extension.extension.ActivityRecorder;
import app.template.extension.extension.RequestRecord;
import java.util.ArrayList;
import java.util.List;

public class ActivityRecorderTest {
    public static void main(String[] args) {
        final long[] now = {0};
        List<ActivityRecorder.Completed> completed = new ArrayList<>();
        ActivityRecorder recorder = new ActivityRecorder(() -> now[0], completed::add);
        ActivityRecorder.Token a = recorder.begin("printer", "1.2.3");
        ActivityRecorder.Token b = recorder.begin("printer", "1.2.4");
        now[0] = 10000000000L;
        recorder.complete(b, false, new byte[]{2});
        recorder.tick();
        if (!completed.isEmpty()) throw new AssertionError("pending requests keep burst open");
        recorder.complete(a, true, new byte[]{1});
        recorder.complete(a, true, new byte[]{9});
        now[0] += 2999000000L; recorder.tick();
        if (!completed.isEmpty()) throw new AssertionError("not yet idle for 3 seconds");
        now[0] += 1000000L; recorder.tick();
        if (completed.size() != 1 || completed.get(0).requests.size() != 2 || !completed.get(0).requests.get(0).oid.equals("1.2.3"))
            throw new AssertionError("completion must preserve request order and ignore duplicate completion");
        ActivityRecorder.Token old = recorder.begin("printer", "1.2.5");
        recorder.clear("printer"); recorder.complete(old, false, new byte[]{3});
        now[0] += 4000000000L; recorder.tick();
        if (completed.size() != 1) throw new AssertionError("clear must invalidate pending callbacks");
        ActivityRecorder.Token stale = recorder.begin("printer", "1.2.6");
        recorder.complete(stale, false, new byte[]{4});
        now[0] += 3000000000L;
        ActivityRecorder.Completed snapshot = recorder.takeReady().get(0);
        recorder.clear("printer");
        if (recorder.isCurrent(snapshot)) throw new AssertionError("clear must invalidate already queued publications");
        ActivityRecorder.Token fresh = recorder.begin("printer", "1.2.7");
        recorder.complete(fresh, false, new byte[]{5});
        now[0] += 3000000000L;
        if (!recorder.isCurrent(recorder.takeReady().get(0))) throw new AssertionError("new generation must remain valid");
        List<ActivityRecorder.Token> many = new ArrayList<>();
        for (int i=0;i<4097;i++) many.add(recorder.begin("other", "1.2.3"));
        for (int i=0;i<4096;i++) recorder.complete(many.get(i), false, null);
        now[0] += 4000000000L;
        if (!recorder.takeReady().isEmpty()) throw new AssertionError("overflow request must remain outstanding");
        recorder.complete(many.get(4096), false, null);
        now[0] += 3000000000L;
        ActivityRecorder.Completed overflow = recorder.takeReady().get(0);
        if (overflow.complete || overflow.requests.size()!=4096) throw new AssertionError("overflow must be marked incomplete");
        ActivityRecorder.Token early = recorder.begin("late-tick", "1.2.1");
        recorder.complete(early, false, null);
        now[0] += 4000000000L;
        ActivityRecorder.Token later = recorder.begin("late-tick", "1.2.2");
        recorder.complete(later, false, null);
        now[0] += 3000000000L;
        recorder.tick();
        if (completed.size()!=3 || completed.get(1).requests.size()!=1 || completed.get(2).requests.size()!=1)
            throw new AssertionError("a delayed scheduler must not merge separate bursts");
        ActivityRecorder.Token failure = recorder.begin("failed", "1.2.8");
        recorder.fail(failure, "timeout");
        now[0] += 3000000000L;
        ActivityRecorder.Completed failed = recorder.takeReady().get(0);
        if (failed.complete || failed.requests.get(0).outcome != RequestRecord.Outcome.TIMEOUT)
            throw new AssertionError("a timed-out request is terminal but prevents replay");
        RequestRecord.Details details = new RequestRecord.Details("192.0.2.1",161,1,19,1000,2,"opaque","integer","success",500);
        ActivityRecorder.Token detailed = recorder.begin("printer2", "1.2.9", details);
        recorder.complete(detailed, true, new byte[]{7});
        now[0] += 3000000000L;
        RequestRecord stored = recorder.takeReady().get(0).requests.get(0);
        if (stored.details == null || stored.details.requestId != 19 || stored.response()[0] != 7)
            throw new AssertionError("request replay parameters and observed response must be retained together");
    }
}
