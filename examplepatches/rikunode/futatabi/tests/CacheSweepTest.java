package dev.rikunode.futatabi.bridge;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.FileTime;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class CacheSweepTest {
    private static int assertions;
    private static final long NOW = 1_800_000_000_000L;
    private static final long OLD = NOW - 48 * CacheSweep.HOUR;
    private static final long RECENT = NOW - 1000;
    private static final String CUSTOM = "MyJsonCacheManager", DEFAULT = "libCachedImageData";

    private static void check(boolean ok, String label) {
        assertions++;
        if (!ok) throw new AssertionError(label);
    }
    private static String name(int n, String ext) {
        return String.format("%08x-0000-1000-8000-000000000000.%s", n, ext);
    }
    private static Path add(Path dir, String name, int bytes, long time) throws Exception {
        Path p = dir.resolve(name);
        Files.write(p, new byte[bytes]);
        Files.setLastModifiedTime(p, FileTime.fromMillis(time));
        return p;
    }
    private static Map<String, CacheSweep.Row> row(String path, long touched, String url) throws Exception {
        Map<String, CacheSweep.Row> m = new HashMap<>();
        CacheSweep.addRow(m, path, touched, url);
        return m;
    }
    private static CacheSweep.Snapshot scan(Path r, String n, Map<String, CacheSweep.Row> rows, Set<String> pins) throws Exception {
        return CacheSweep.inspect(r, n, rows, pins, NOW, Long.MAX_VALUE);
    }

    public static void main(String[] args) throws Exception {
        Path r = Files.createTempDirectory("futatabi-cache-test");
        try {
            Path a = Files.createDirectory(r.resolve(CUSTOM));
            Path b = Files.createDirectory(r.resolve(DEFAULT));
            Path upload = Files.createDirectory(r.resolve("file_picker"));
            Path config = Files.createDirectory(r.resolve("shared_prefs"));
            Path attachment = add(upload, name(50, "jpg"), 90, OLD);
            Path prefs = add(config, "FlutterSharedPreferences.xml", 20, OLD);
            Path pinned = add(a, name(1, "jpg"), 70, OLD);
            Path orphan = add(a, name(2, "jpg"), 80, OLD);
            Path recent = add(a, name(3, "webm"), 60, RECENT);
            Path unknown = add(a, "saved.jpg", 50, OLD);
            Path local = add(a, name(4, "png"), 40, OLD);
            Path old = add(a, name(5, "mp4"), 100, OLD);
            Path newer = add(b, name(6, "jpg"), 100, OLD + CacheSweep.HOUR);
            Map<String, CacheSweep.Row> ar = row(old.getFileName().toString(), OLD, "https://example.invalid/a");
            CacheSweep.addRow(ar, local.getFileName().toString(), OLD, "file:///draft");
            Map<String, CacheSweep.Row> br = row(newer.getFileName().toString(), OLD + CacheSweep.HOUR, "http://example.invalid/b");
            Set<String> pins = Collections.singleton(pinned.getFileName().toString());
            CacheSweep.Snapshot sa = scan(r, CUSTOM, ar, pins), sb = scan(r, DEFAULT, br, pins);
            check(sa.bytes == 400 && sb.bytes == 100, "before totals");
            check(sa.unlisted == 260 && sa.registered == 140 && sa.eligibleOrphanBytes == 80, "ledger and orphan eligibility split");
            check(sa.imageBytes == 240 && sa.videoBytes == 160, "extension split");
            check(Files.exists(orphan) && Files.exists(old), "diagnosis read-only");
            CacheSweep.apply(Arrays.asList(sa, sb), 330, Long.MAX_VALUE);
            check(!Files.exists(orphan), "old orphan reclaimed");
            check(!Files.exists(old) && Files.exists(newer), "oldest registered across both directories");
            check(sa.removed == 180 && sa.deleted == 2 && sb.removed == 0, "actual removed bytes");
            check(sa.orphanRemovedBytes == 80 && sa.budgetRemovedBytes == 100, "separate removal evidence");
            check(Files.exists(pinned), "persisted draft protected");
            check(Files.exists(recent), "recent orphan protected");
            check(Files.exists(unknown), "unknown filename protected");
            check(Files.exists(local), "nonremote ledger entry protected");
            check(Files.exists(attachment) && Files.exists(prefs), "other directories untouched");

            Path missing = add(a, name(7, "jpg"), 80, OLD);
            CacheSweep.Snapshot noLedger = scan(r, CUSTOM, null, Collections.emptySet());
            CacheSweep.apply(Collections.singletonList(noLedger), 0, Long.MAX_VALUE);
            check(Files.exists(missing) && noLedger.removed == 0, "unknown ledger fail closed");
            CacheSweep.Snapshot noPins = scan(r, CUSTOM, Collections.emptyMap(), null);
            CacheSweep.apply(Collections.singletonList(noPins), 0, Long.MAX_VALUE);
            check(Files.exists(missing) && noPins.removed == 0, "unknown drafts fail closed");

            Path change = add(a, name(8, "file"), 20, OLD);
            CacheSweep.Snapshot changed = scan(r, CUSTOM, Collections.emptyMap(), pins);
            Files.write(change, new byte[21]);
            CacheSweep.apply(Collections.singletonList(changed), 0, Long.MAX_VALUE);
            check(Files.exists(change) && changed.failures > 0, "modified file not removed");

            Path registered = add(b, name(9, "webp"), 100, OLD);
            Map<String, CacheSweep.Row> reg = row(registered.getFileName().toString(), OLD, "https://example.invalid/c");
            Path nested = Files.createDirectory(b.resolve("unexpected"));
            Path nestedFile = add(nested, name(10, "jpg"), 55, OLD);
            CacheSweep.Snapshot partial = scan(r, DEFAULT, reg, Collections.emptySet());
            CacheSweep.apply(Collections.singletonList(partial), 0, Long.MAX_VALUE);
            check(!partial.complete && Files.exists(registered) && Files.exists(nestedFile), "partial scan no registered trim");
            CacheSweep.Snapshot expired = CacheSweep.inspect(r, DEFAULT, reg, Collections.emptySet(), NOW, 0);
            check(!expired.complete && expired.candidates.isEmpty(), "scan deadline");
            CacheSweep.apply(Collections.singletonList(scan(r, DEFAULT, reg, Collections.emptySet())), 0, 0);
            check(Files.exists(registered), "delete deadline");
            Path isolated = add(a, name(12, "jpg"), 90, OLD);
            Map<String, CacheSweep.Row> isolatedRows = row(isolated.getFileName().toString(), OLD, "https://example.invalid/d");
            CacheSweep.Snapshot valid = scan(r, CUSTOM, isolatedRows, pins);
            CacheSweep.apply(Arrays.asList(valid, partial), 10, Long.MAX_VALUE);
            check(!Files.exists(isolated) && Files.exists(registered), "unknown namespace does not block verified budget or permit uncertain deletion");

            String json = "[{\"_id\":1,\"url\":\"https://example.invalid/a\",\"relativePath\":\"" +
                    name(11, "jpg") + "\",\"validTill\":" + NOW + ",\"touched\":" + OLD + "}]";
            check(CacheSweep.jsonRows(json).size() == 1, "upstream JSON schema");
            check(CacheSweep.jsonRows("[]").isEmpty(), "valid empty ledger");
            for (String invalid : new String[]{"", "{", "[]garbage", "[{}]", json.replace(name(11, "jpg"), "../escape"),
                    json.replace("\"_id\":1", "\"_id\":\"1\""), json.replace("\"url\":\"https://example.invalid/a\"", "\"url\":1"),
                    json.substring(0, json.length() - 1) + "," + json.substring(1)}) {
                boolean refused = false;
                try { CacheSweep.jsonRows(invalid); } catch (Exception expected) { refused = true; }
                check(refused, "invalid JSON refused");
            }
            System.out.println("PASS CacheSweepTest " + assertions + " assertions");
        } finally {
            try (java.util.stream.Stream<Path> paths = Files.walk(r)) {
                for (Path p : (Iterable<Path>) paths.sorted(java.util.Comparator.reverseOrder())::iterator)
                    Files.deleteIfExists(p);
            }
        }
    }
}
