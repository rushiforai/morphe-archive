import app.afterglow.extension.diagnostics.LogPolicy;
import app.afterglow.extension.diagnostics.LogStore;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public final class DebugLogTest {
    private static int count;
    private static void check(String name, boolean condition) {
        count++; if (!condition) throw new AssertionError(name);
    }
    public static void main(String[] args) throws Exception {
        String[][] groups = {
            {"debugLogDownloads", "download", "dl-start", "downloader", "extractor-player", "selector", "ffmpeg", "action-sheet"},
            {"debugLogPlayerUI", "overlay", "shorts-ui", "vc-resolve", "fullscreen"},
            {"debugLogPremiumControls", "premium-controls", "premium-ctrl-action"}, {"debugLogPiP", "pip-player"},
            {"debugLogProbes", "offline-route", "ctor"}
        };
        for (String[] group : groups) for (int i = 1; i < group.length; i++) {
            String category = group[i];
            check("category " + category, group[0].equals(LogPolicy.categoryKey(category)));
            check("master OFF " + category, !LogPolicy.allows(false, false, category, true));
            check("category OFF " + category, !LogPolicy.allows(true, false, category, false));
            check("category ON " + category, LogPolicy.allows(true, false, category, true));
            check("Firehose overrides " + category, LogPolicy.allows(false, true, category, false));
        }
        check("future category passes master", LogPolicy.allows(true, false, "future", false));
        check("future respects master OFF", !LogPolicy.allows(false, false, "future", true));
        check("null category", LogPolicy.allows(true, false, null, false));
        String safe = LogPolicy.redact("url https://example.invalid/watch?v=private /data/user/0/private/file "
                + "file:///storage/emulated/0/private.txt cookie=secret; videoID=private-id, prompt=private prompt\nOK");
        check("URL redacted", !safe.contains("example.invalid") && safe.contains("<url>"));
        check("Android paths redacted", !safe.contains("/data/") && !safe.contains("/storage/") && safe.contains("<path>"));
        check("secrets redacted", !safe.contains("secret") && !safe.contains("private-id") && !safe.contains("private prompt"));
        check("line retained", safe.endsWith("\nOK"));
        check("Apple paths redacted", LogPolicy.redact("/private/var/mobile/Documents/file").equals("<path>"));
        check("message bound", LogPolicy.redact("a".repeat(2000)).equals("a".repeat(1024) + "…<truncated>"));
        check("category cannot forge line", !LogPolicy.categoryName("bad\n[other]").contains("\n"));
        Path directory = Files.createTempDirectory("afterglow-log-files-");
        try {
            LogStore store = new LogStore(directory.toFile());
            check("empty", store.body().isEmpty() && store.recent().isEmpty());
            store.append("00:00:00.000", "overlay", "authorization=private-token");
            check("disk redaction", store.body().contains("authorization=<redacted>") && !store.body().contains("private-token"));
            check("persist across store instances", new LogStore(directory.toFile()).body().equals(store.body()));
            store.clear();
            for (int i = 0; i < 205; i++) store.append("00:00:00.000", "test", "entry-" + i);
            List<String> ring = store.recent();
            check("ring bound", ring.size() == 200 && ring.get(0).endsWith("entry-5") && ring.get(199).endsWith("entry-204"));
            ring.clear(); check("ring copy isolation", store.recent().size() == 200);
            for (int i = 0; i < 1200; i++) store.append("00:00:00.000", "test", "x".repeat(1024));
            Path file = directory.resolve("ytag-debug.log"), backup = directory.resolve("ytag-debug.log.1");
            check("rotation creates backup", Files.size(backup) >= LogStore.ROLL_BYTES);
            check("current bounded", Files.size(file) < LogStore.ROLL_BYTES + 1200);
            check("backup bounded", Files.size(backup) < LogStore.ROLL_BYTES + 1200);
            store.clear(); check("clear both files and ring", !Files.exists(file) && !Files.exists(backup) && store.recent().isEmpty());
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Runnable write = () -> {
                try { for (int i = 0; i < 100; i++) store.append("00:00:00.000", Thread.currentThread().getName(), "entry-" + i); }
                catch (Throwable error) { failure.set(error); }
            };
            Thread first = new Thread(write, "first"), second = new Thread(write, "second");
            first.start(); second.start(); first.join(); second.join();
            check("concurrent complete lines", failure.get() == null && store.body().lines().count() == 200 && store.body().lines().distinct().count() == 200);
            Path blocked = directory.resolve("not-a-directory"); Files.writeString(blocked, "fixture");
            LogStore broken = new LogStore(blocked.toFile());
            try { broken.append("00:00:00.000", "test", "retained"); throw new AssertionError("Expected IO failure"); }
            catch (java.io.IOException expected) { check("ring survives disk failure", broken.recent().get(0).endsWith("retained")); }
        } finally {
            try (java.util.stream.Stream<Path> files = Files.walk(directory)) {
                for (Path path : files.sorted(java.util.Comparator.reverseOrder()).toList()) Files.delete(path);
            }
        }
        System.out.println("PASS debug log: " + count + " checks");
    }
}
