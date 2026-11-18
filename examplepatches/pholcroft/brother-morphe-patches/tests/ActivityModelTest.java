import app.template.extension.extension.ActivityBurst;
import app.template.extension.extension.RequestRecord;
import app.template.extension.extension.PrinterRecord;
import app.template.extension.extension.ReplayRun;
import java.util.ArrayList;
import java.util.List;

public class ActivityModelTest {
    public static void main(String[] args) {
        byte[] bytes = {1, 2};
        RequestRecord first = new RequestRecord("token1", 0, "1.2.3", 10, 20, true, bytes);
        RequestRecord second = new RequestRecord("token2", 1, "1.2.3", 21, 30, false, bytes);
        List<RequestRecord> requests = new ArrayList<>();
        requests.add(first); requests.add(second);
        ActivityBurst.Ref ref = new ActivityBurst.Ref("printer", "burst", 42);
        ActivityBurst burst = new ActivityBurst(ref, 1000, 20, requests);
        bytes[0] = 9; requests.clear();
        if (burst.requests().size() != 2 || burst.requests().get(0).response()[0] != 1)
            throw new AssertionError("a completed burst must own immutable request data");
        byte[] result = first.response(); result[0] = 7;
        if (first.response()[0] != 1) throw new AssertionError("response bytes must be defensively copied");
        if (burst.ref.sequence != 42 || !burst.requests().get(0).oid.equals(burst.requests().get(1).oid))
            throw new AssertionError("sequence and repeated requests must be retained");
        try { burst.requests().clear(); throw new AssertionError("request list must be immutable"); }
        catch (UnsupportedOperationException expected) { }
        List<String> addresses = new ArrayList<>(); addresses.add("192.0.2.1");
        PrinterRecord printer = new PrinterRecord("printer", "Example", "192.0.2.1", "00:11:22:33:44:55", addresses, false);
        addresses.add("192.0.2.2");
        if (printer.addressHistory().size() != 1 || printer.addressChanged)
            throw new AssertionError("printer identity and address history must be immutable");
        List<ReplayRun.RequestResult> results = new ArrayList<>();
        byte[] observed = {3};
        results.add(new ReplayRun.RequestResult("token1", observed));
        ReplayRun run = new ReplayRun("run", ref, "192.0.2.1", 10, results);
        results.clear(); observed[0] = 4;
        if (!run.source.burstId.equals("burst") || run.results().size() != 1 || run.results().get(0).response()[0] != 3)
            throw new AssertionError("replay must retain its source and immutable results");
        RequestRecord.Details details = new RequestRecord.Details("192.0.2.1", 161, 1, 99, 1000, 2, "context", "integer", "success", 900);
        RequestRecord detailed = new RequestRecord("token3", 2, "1.2.3", 30, 40, true, new byte[]{5}, details);
        if (detailed.details.requestId != 99 || detailed.details.sampleNanos != 900 || !detailed.details.contextId.equals("context"))
            throw new AssertionError("request parameters and estimate provenance must survive recording");
        ActivityBurst.Coverage coverage = new ActivityBurst.Coverage(true, false, 1, 2);
        ActivityBurst recorded = new ActivityBurst(ref, 1000, 40, java.util.Arrays.asList(first, second, detailed), "192.0.2.1", coverage);
        if (!recorded.coverage.requestsComplete || recorded.coverage.responsesComplete || recorded.coverage.matchedSamples != 1)
            throw new AssertionError("request completeness must be separate from comparison coverage");
    }
}
