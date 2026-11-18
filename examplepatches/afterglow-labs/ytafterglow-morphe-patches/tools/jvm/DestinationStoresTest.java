package app.afterglow.extension.destinations;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import app.afterglow.extension.settings.PropertyList;

/** Real persistence, portable plist, namespace isolation, and interrupted-revision regressions. */
public final class DestinationStoresTest {
    private static int checks;
    interface Action { void run() throws Exception; }
    static void check(boolean value, String message) { checks++; if (!value) throw new AssertionError(message); }
    static void rejects(Action action, String message) throws Exception {
        boolean rejected = false; try { action.run(); } catch (Exception expected) { rejected = true; }
        check(rejected, message);
    }
    public static void main(String[] args) throws Exception {
        File base = new File(args[0]); base.mkdirs();
        File aiPath = new File(base, "ai");
        AiHomeLibrary ai = new AiHomeLibrary(aiPath);
        check(ai.saved().isEmpty() && ai.recent().isEmpty(), "fresh prompt library");
        check(ai.ideas().size() == 4, "four native quick ideas");
        check(AiHomeLibrary.normalize("  hello\n\tworld\u00a0 ").equals("hello world"), "normalize all whitespace");
        rejects(() -> AiHomeLibrary.normalize(" \n"), "reject empty prompt");
        rejects(() -> AiHomeLibrary.normalize("x".repeat(4001)), "prompt limit");
        check(AiHomeLibrary.normalize("x".repeat(4000)).length() == 4000, "prompt boundary");
        ai.save(null, "deep  science", "Science", true, 1234567890000L);
        String id = (String) ai.saved().get(0).get("identifier");
        check(ai.recent().isEmpty(), "saving does not invent native runs");
        ai.recordRun("deep science", 1234567900000L);
        check(id.equals(ai.recent().get(0).get("identifier")), "native run retains saved identity");
        check(ai.recent().get(0).get("lastUsedAt").equals(1234567900.0), "iOS epoch seconds");
        ai.recordRun("deep\nscience", 1234567910000L);
        check(ai.recent().size() == 1, "recent prompt deduplication");
        ai.save(id, "deep science", "Renamed", false, 1234567920000L);
        check(ai.recent().get(0).get("name").equals("Renamed") && ai.recent().get(0).get("favorite").equals(false), "saved metadata propagates");
        check(ai.recent().get(0).get("lastUsedAt").equals(1234567910.0), "rename does not invent last run");
        ai.delete(id);
        check(ai.saved().isEmpty() && ai.recent().size() == 1, "delete saved preserves history");
        for (int i = 0; i < 55; i++) ai.recordRun("prompt " + i, i * 1000L);
        check(ai.recent().size() == 50 && ai.recent().get(0).get("text").equals("prompt 54"), "recent bounded and newest first");
        ai.save(null, "saved", "Keep", true, 1);
        ai.clearRecent(); check(ai.recent().isEmpty() && ai.saved().size() == 1, "clear history preserves saved");
        byte[] exported = ai.exportLibrary(); Files.write(new File(base, "ai-export.plist").toPath(), exported);
        Map<String, Object> portable = AtomicDocument.map(PropertyList.read(exported));
        check(portable.size() == 3 && portable.get("schemaVersion").equals(1L), "exact iOS portable root");
        AiHomeLibrary imported = new AiHomeLibrary(new File(base, "imported")); imported.importLibrary(exported);
        check(imported.saved().equals(ai.saved()), "prompt XML round trip");
        ai.setIdeas(new ArrayList<>()); check(ai.ideas().isEmpty(), "quick ideas may be empty");
        List<String> tooMany = new ArrayList<>(); for (int i = 0; i < 13; i++) tooMany.add("idea " + i);
        rejects(() -> ai.setIdeas(tooMany), "12 ideas limit"); check(ai.ideas().isEmpty(), "invalid ideas roll back");
        ai.setIdeas(Arrays.asList(" a ", "b")); check(ai.ideas().get(0).equals("a"), "quick idea normalization");
        File blocked = new File(aiPath, "history.next.json"); blocked.mkdir();
        rejects(() -> ai.save(null, "must not persist", "blocked", false, 1), "I/O failure reported");
        check(ai.saved().size() == 1, "failed write cannot mutate memory"); blocked.delete();
        ai.save(null, "newest", "Latest", false, 2);
        Files.writeString(new File(aiPath, "history.json").toPath(), "broken");
        AiHomeLibrary recovered = new AiHomeLibrary(aiPath);
        check(recovered.saved().size() == 1 && recovered.recoveryMessage() != null, "previous valid generation recovery");
        check(Files.readString(new File(aiPath, "history.json").toPath()).equals("broken"), "reading preserves corrupt evidence");
        recovered.save(null, "recovery", "Recovered", false, 3);
        check(Arrays.stream(aiPath.list()).anyMatch(name -> name.contains("damaged-")), "corrupt generation retained after new save");
        rejects(() -> imported.importLibrary("not plist".getBytes()), "invalid import rejected");
        check(imported.saved().size() == 1, "failed import keeps library");

        File experimentPath = new File(base, "experiments"); ExperimentStore experiments = new ExperimentStore(experimentPath);
        check(!experiments.bypass() && !experiments.recoveryRequired() && !experiments.pending(), "fresh experiment state");
        experiments.setOverride("package.a", 12, 0, true, true);
        experiments.setOverride("package.b", 12, 0, false, true);
        check(experiments.value("package.a", 12, 0).equals(true) && experiments.value("package.b", 12, 0).equals(false), "same ID in different native packages is isolated");
        check(experiments.value("package.a", 12, 1) == null, "native type isolation");
        experiments.setOverride("package.a", 13, 1, Long.MAX_VALUE, true);
        check(experiments.value("package.a", 13, 1).equals(Long.MAX_VALUE), "signed 64-bit precision");
        rejects(() -> experiments.setOverride("package.a", 14, 1, true, true), "bool is not integer");
        rejects(() -> experiments.setOverride("package.a", 14, 2, Double.NaN, true), "reject NaN");
        rejects(() -> experiments.setOverride("package.a", 14, 2, Double.POSITIVE_INFINITY, true), "reject infinity");
        rejects(() -> ExperimentStore.parseValue(1, "9223372036854775808"), "integer overflow rejected");
        rejects(() -> ExperimentStore.parseValue(0, "1"), "strict boolean input");
        experiments.setOverride("package.a", 15, 3, "literal $ and <xml>", true);
        check(experiments.value("package.a", 15, 3).equals("literal $ and <xml>"), "literal string preserved");
        experiments.setBypass(true); check(experiments.value("package.a", 12, 0) == null, "global bypass wins");
        experiments.setBypass(false); check(experiments.value("package.a", 12, 0).equals(true), "bypass preserves profile");
        ExperimentStore crash = new ExperimentStore(experimentPath);
        check(crash.recoveryRequired() && crash.value("package.a", 12, 0) == null, "uncleared pending revision bypasses at restart");
        crash.markKnownGood(crash.revision()); check(crash.recoveryRequired(), "recovery cannot auto-approve pending profile");
        crash.retryPending(); check(!crash.recoveryRequired() && crash.value("package.a", 12, 0).equals(true), "explicit retry begins a new pending trial");
        long trialRevision = crash.revision(); crash.setOverride("package.a", 12, 0, false, true);
        crash.markKnownGood(trialRevision); check(crash.pending(), "stale foreground timer cannot verify a newer revision");
        crash.markKnownGood(crash.revision()); check(!crash.pending(), "current foreground trial checkpoints");
        ExperimentStore clean = new ExperimentStore(experimentPath);
        check(!clean.recoveryRequired() && clean.value("package.a", 12, 0).equals(false), "verified startup restores local profile");
        check(clean.value("package.a", 13, 1).equals(Long.MAX_VALUE), "integer precision survives disk");
        clean.create("Backup", true); clean.create("Empty", false);
        rejects(() -> clean.create("Backup", false), "duplicate profile name rejected");
        clean.resetActive(); check(clean.overrides().isEmpty(), "reset affects active profile");
        clean.activate("Backup"); check(clean.overrides().size() == 4, "inactive duplicate kept");
        clean.resetFlag("package.a", 12);
        check(clean.value("package.a", 12, 0) == null && clean.value("package.b", 12, 0).equals(false), "per-package flag reset");
        clean.favorite("package.a", 12, true); clean.favorite("package.b", 12, true);
        clean.favorite("package.a", 12, false); check(clean.favorites().equals(Arrays.asList("package.b:12")), "favorites namespace isolation");
        clean.restoreKnownGood(); check(clean.activeProfile().equals("Default") && clean.overrides().size() == 4, "known-good snapshot restored");
        check(clean.profiles().contains("Backup") && clean.profiles().contains("Empty"), "recovery preserves other profiles");
        clean.rename("Backup", "Renamed"); check(clean.profiles().contains("Renamed") && !clean.profiles().contains("Backup"), "profile rename");
        rejects(() -> clean.delete("Default"), "cannot delete active profile");
        clean.delete("Empty"); check(!clean.profiles().contains("Empty"), "delete inactive profile");
        byte[] profile = clean.exportProfile("Renamed"); Files.write(new File(base, "experiment-export.plist").toPath(), profile);
        ExperimentStore other = new ExperimentStore(new File(base, "other")); other.importProfile(profile); other.activate("Renamed");
        check(other.overrides().size() == 3 && other.value("package.a", 13, 1).equals(Long.MAX_VALUE), "profile XML round trip and precision");
        rejects(() -> other.importProfile(profile), "duplicate import rejected");
        File failedWrite = new File(new File(base, "other"), "profiles.next.json"); failedWrite.mkdir();
        rejects(() -> other.setOverride("package.a", 30, 0, true, true), "experiment storage failure reported");
        check(other.value("package.a", 30, 0) == null, "failed experiment write leaves effective values unchanged");
        System.out.println("PASS " + checks + " destination store checks");
    }
}
