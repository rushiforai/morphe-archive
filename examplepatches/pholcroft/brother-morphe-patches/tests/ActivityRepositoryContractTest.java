import app.template.extension.extension.ActivityRepository;
import app.template.extension.extension.PrinterRecord;
import java.util.Collections;

public class ActivityRepositoryContractTest {
    public static void main(String[] args) {
        ActivityRepository repo = new ActivityRepository();
        PrinterRecord first = repo.resolveVerified("192.0.2.1", "00:11:22:33:44:55", "Printer");
        repo.putCached(first.id, "oid", "answer", repo.generation(first.id));
        PrinterRecord moved = repo.resolveVerified("192.0.2.2", "00:11:22:33:44:55", "Printer");
        if (!first.id.equals(moved.id) || !moved.addressChanged || !"answer".equals(repo.getCached(moved.id, "oid")))
            throw new AssertionError("verified moved printer must retain identity and cache");
        PrinterRecord other = repo.resolveVerified("192.0.2.2", "00:11:22:33:44:66", "Printer");
        if (first.id.equals(other.id) || repo.getCached(other.id, "oid") != null)
            throw new AssertionError("a different MAC at a reused address must not inherit data");
        long old = repo.generation(first.id); repo.clear(first.id);
        if (repo.putCached(first.id, "oid", "stale", old)) throw new AssertionError("clear must reject queued writes");
        PrinterRecord rediscovered = repo.resolveVerified("192.0.2.1", "00:11:22:33:44:55", "Printer");
        if (first.id.equals(rediscovered.id) || repo.getCached(rediscovered.id, "oid") != null)
            throw new AssertionError("rediscovery after clear must create a fresh identity");
    }
}
