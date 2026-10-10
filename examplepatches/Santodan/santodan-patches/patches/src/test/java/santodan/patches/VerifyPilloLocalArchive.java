package santodan.patches;

import software.santodan.extension.pillobackup.LocalArchive;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.zip.*;

/** Actual ZIP/filesystem tests, including every persistent restore transaction phase. */
public final class VerifyPilloLocalArchive {
    static void check(boolean condition, String reason) { if (!condition) throw new AssertionError(reason); }
    static void put(File file, String content) throws Exception { file.getParentFile().mkdirs(); Files.writeString(file.toPath(), content); }
    static String get(File file) throws Exception { return Files.readString(file.toPath()); }
    static Map<String, byte[]> entries(File archive) throws Exception {
        Map<String, byte[]> result = new LinkedHashMap<>();
        try (ZipFile zip = new ZipFile(archive)) {
            for (Enumeration<? extends ZipEntry> items = zip.entries(); items.hasMoreElements();) {
                ZipEntry entry = items.nextElement();
                try (InputStream input = zip.getInputStream(entry)) { result.put(entry.getName(), input.readAllBytes()); }
            }
        }
        return result;
    }
    static File zip(File work, String name, Map<String, byte[]> entries) throws Exception {
        File file = new File(work, name);
        try (ZipOutputStream zip = new ZipOutputStream(new FileOutputStream(file))) {
            for (Map.Entry<String, byte[]> entry : entries.entrySet()) {
                zip.putNextEntry(new ZipEntry(entry.getKey())); zip.write(entry.getValue()); zip.closeEntry();
            }
        }
        return file;
    }
    static void rejected(File archive, File stage) throws Exception {
        try { LocalArchive.extract(archive, stage); throw new AssertionError("Accepted damaged backup"); }
        catch (IOException expected) { check(!stage.exists(), "Failed validation left staged data"); }
    }
    static File side(File file, String suffix) { return new File(file.getParentFile(), file.getName() + suffix); }
    static Map<String, File> targets(File work) throws Exception {
        Map<String, File> roots = new LinkedHashMap<>();
        File database = new File(work, "current/pillo.db"), files = new File(work, "current/files");
        put(database, "old database"); put(new File(files, "old.txt"), "old attachment");
        roots.put("database", database); roots.put("files", files);
        roots.put("database-wal", new File(work, "current/pillo.db-wal"));
        return roots;
    }
    static File stage(File work) throws Exception {
        File stage = new File(work, "stage");
        put(new File(stage, "data/database"), "restored database");
        put(new File(stage, "data/files/new.txt"), "restored attachment");
        return stage;
    }
    public static void main(String[] args) throws Exception {
        File parent = new File(args[0]); parent.mkdirs();
        File work = Files.createTempDirectory(parent.toPath(), "pillo-archive-").toFile();
        try {
            Map<String, File> roots = new LinkedHashMap<>();
            for (String root : List.of("database", "preferences", "files", "no_backup", "external")) roots.put(root, new File(work, "source/" + root));
            put(roots.get("database"), "SQLite fixture bytes");
            put(new File(roots.get("preferences"), "pillo_preferences.xml"), "<map><string name='unit'>kg</string></map>");
            put(new File(roots.get("files"), "a.txt"), "medication data");
            put(new File(roots.get("files"), "b.txt"), "diary photos");
            put(new File(roots.get("files"), "databasebackup/old.sqlite3"), "excluded previous cloud backups");
            roots.get("no_backup").mkdirs();
            put(new File(roots.get("external"), "照片/photo.bin"), "image bytes");
            File backup = new File(work, "backup.zip");
            LocalArchive.write(backup, roots);
            // Windows cannot create Android's colon filenames. Keep real readable
            // backing files, but expose their Android names to the exporter.
            File backing = new File(roots.get("files"), "a.txt");
            String androidName = "PersistedInstallation.[DEFAULT]:fixture.json";
            File androidFile = new File(backing.getPath()) {
                @Override public String getName() { return androidName; }
            };
            File directory = roots.get("files");
            File androidDirectory = new File(directory.getPath()) {
                @Override public File getCanonicalFile() { return this; }
                @Override public File[] listFiles() { return new File[]{androidFile}; }
            };
            Map<String, File> androidRoots = new LinkedHashMap<>(roots);
            androidRoots.put("files", androidDirectory);
            File androidBackup = new File(work, "android-names.zip");
            LocalArchive.write(androidBackup, androidRoots);
            Map<String, byte[]> androidEntries = entries(androidBackup);
            check(Arrays.equals(androidEntries.get("data/files/" + androidName),
                Files.readAllBytes(backing.toPath())), "Android colon filename was not exported intact");
            if (File.separatorChar != '\\') {
                File androidStage = new File(work, "android-names");
                LocalArchive.extract(androidBackup, androidStage);
                check(get(new File(androidStage, "data/files/" + androidName)).equals(get(backing)),
                    "Android colon filename did not round-trip");
            } else rejected(androidBackup, new File(work, "windows-colon"));
            System.out.println("PASS: Android Firebase colon filenames export intact; Windows alternate streams are rejected");
            // Deterministically model a background writer changing a file when
            // export opens it. A second source read would capture different bytes.
            File changingBacking = new File(work, "changing-source/value.txt");
            put(changingBacking, "initial");
            int[] sourceReads = {0};
            File changingFile = new File(changingBacking.getPath()) {
                @Override public String getPath() {
                    StackTraceElement[] stack = Thread.currentThread().getStackTrace();
                    if (stack.length > 2 && stack[2].getClassName().equals("java.io.FileInputStream")) {
                        try { put(changingBacking, "background update " + (++sourceReads[0])); }
                        catch (Exception error) { throw new RuntimeException(error); }
                    }
                    return super.getPath();
                }
            };
            File changingDirectory = new File(changingBacking.getParent()) {
                @Override public File getCanonicalFile() { return this; }
                @Override public File[] listFiles() { return new File[]{changingFile}; }
            };
            Map<String, File> changingRoots = new LinkedHashMap<>(roots);
            changingRoots.put("files", changingDirectory);
            File changingBackup = new File(work, "changing.zip"), changingStage = new File(work, "changing-stage");
            LocalArchive.write(changingBackup, changingRoots);
            check(sourceReads[0] == 1, "Export must open each live source exactly once");
            LocalArchive.extract(changingBackup, changingStage);
            check(get(new File(changingStage, "data/files/value.txt")).equals("background update 1"),
                "Manifest size/checksum did not match the captured background update");
            System.out.println("PASS: background file updates export with matching sizes/checksums and a single source read");
            File extracted = new File(work, "extracted");
            JSONObject manifest = LocalArchive.extract(backup, extracted);
            check(manifest.getJSONArray("roots").length() == 5, "Roots not preserved");
            check(get(new File(extracted, "data/database")).equals("SQLite fixture bytes"), "Database changed");
            check(get(new File(extracted, "data/preferences/pillo_preferences.xml")).contains("kg"), "Preferences missing");
            check(get(new File(extracted, "data/external/照片/photo.bin")).equals("image bytes"), "Unicode attachment missing");
            check(new File(extracted, "data/no_backup").isDirectory(), "Empty root not preserved");
            check(!new File(extracted, "data/files/databasebackup").exists(), "Nested backups included");
            Map<String, byte[]> original = entries(backup), changed = new LinkedHashMap<>(original);
            changed.put("data/files/a.txt", "corrupted bytes".getBytes(StandardCharsets.UTF_8));
            rejected(zip(work, "corrupt.zip", changed), new File(work, "bad-corrupt"));
            changed = new LinkedHashMap<>(original); changed.put("../escaped.txt", new byte[]{1});
            rejected(zip(work, "traversal.zip", changed), new File(work, "bad-path"));
            check(!new File(work, "escaped.txt").exists(), "Path traversal wrote outside staging");
            changed = new LinkedHashMap<>(original); changed.put("data/files/../../escaped.txt", new byte[]{1});
            rejected(zip(work, "nested-traversal.zip", changed), new File(work, "bad-nested"));
            for (String unsafe : List.of("C:/escaped.txt", "data/files/..\\escaped.txt", "data/files/./escaped.txt")) {
                changed = new LinkedHashMap<>(original); changed.put(unsafe, new byte[]{1});
                rejected(zip(work, "unsafe-" + unsafe.hashCode() + ".zip", changed), new File(work, "bad-" + unsafe.hashCode()));
            }
            changed = new LinkedHashMap<>(original); changed.remove("data/database");
            rejected(zip(work, "missing.zip", changed), new File(work, "bad-missing"));
            changed = new LinkedHashMap<>(original); changed.put("data/files/unindexed.txt", new byte[]{1});
            rejected(zip(work, "extra.zip", changed), new File(work, "bad-extra"));
            for (String kind : List.of("version", "package", "oversize", "duplicate-index", "checksum")) {
                JSONObject altered = new JSONObject(new String(original.get("manifest.json"), StandardCharsets.UTF_8));
                if (kind.equals("version")) altered.put("appVersion", "0.6.21");
                if (kind.equals("package")) altered.put("package", "another.app");
                if (kind.equals("oversize")) altered.getJSONArray("files").getJSONObject(0).put("size", LocalArchive.MAX_BYTES + 1);
                if (kind.equals("duplicate-index")) altered.getJSONArray("files").put(altered.getJSONArray("files").getJSONObject(0));
                if (kind.equals("checksum")) altered.getJSONArray("files").getJSONObject(0).put("sha256", "wrong");
                changed = new LinkedHashMap<>(original); changed.put("manifest.json", altered.toString().getBytes(StandardCharsets.UTF_8));
                rejected(zip(work, kind + ".zip", changed), new File(work, "bad-" + kind));
            }
            // Replace equal-length filenames in ZIP local and central headers to create duplicate entries.
            byte[] raw = Files.readAllBytes(backup.toPath());
            byte[] from = "data/files/b.txt".getBytes(StandardCharsets.UTF_8), to = "data/files/a.txt".getBytes(StandardCharsets.UTF_8);
            for (int i = 0; i + from.length <= raw.length; i++) {
                boolean match = true; for (int j = 0; j < from.length; j++) if (raw[i+j] != from[j]) { match = false; break; }
                if (match) System.arraycopy(to, 0, raw, i, to.length);
            }
            File duplicate = new File(work, "duplicate.zip"); Files.write(duplicate.toPath(), raw);
            rejected(duplicate, new File(work, "bad-duplicate"));
            System.out.println("PASS: database, preferences, internal/external attachments and empty roots round-trip; damaged, incompatible, oversized, duplicate and unsafe archives rejected");

            for (String phase : List.of("normal", "prepared", "applying", "committed", "failure")) {
                File test = new File(work, phase); Map<String, File> targets = targets(test);
                File stage = stage(test), journal = new File(test, "journal.json");
                if (phase.equals("normal")) LocalArchive.apply(stage, journal, targets);
                else {
                    LocalArchive.prepare(stage, journal, targets);
                    check(get(targets.get("database")).equals("old database"), "Preparation changed live data");
                    if (phase.equals("applying")) {
                        JSONObject originals = new JSONObject();
                        for (Map.Entry<String, File> root : targets.entrySet()) originals.put(root.getKey(), root.getValue().exists());
                        LocalArchive.atomicText(journal, new JSONObject().put("state", "applying").put("originals", originals).toString());
                        File db = targets.get("database"); check(db.renameTo(side(db, ".santodan-old")), "Fixture move failed");
                        check(side(db, ".santodan-new").renameTo(db), "Fixture move failed");
                    } else if (phase.equals("committed")) LocalArchive.commit(journal, targets);
                    else if (phase.equals("failure")) {
                        File files = targets.get("files");
                        targets.put("files", new File(files.getPath()) { @Override public boolean renameTo(File target) { return false; } });
                        try { LocalArchive.commit(journal, targets); throw new AssertionError("Commit failure ignored"); }
                        catch (IOException expected) { }
                    }
                    LocalArchive.recover(journal, targets);
                }
                boolean installed = phase.equals("normal") || phase.equals("committed");
                check(get(targets.get("database")).equals(installed ? "restored database" : "old database"), "Database state wrong after " + phase);
                check(new File(targets.get("files"), installed ? "new.txt" : "old.txt").exists(), "Attachments wrong after " + phase);
                check(!journal.exists(), "Journal not cleaned after " + phase);
                for (File target : targets.values()) check(!side(target, ".santodan-new").exists() && !side(target, ".santodan-old").exists(), "Left temporary data after " + phase);
                check(!LocalArchive.recover(journal, targets), "Recovery is not idempotent");
            }
            System.out.println("PASS: preparation leaves live data untouched; successful restore, interrupted preparation/commit, committed cleanup and injected rename failure recover correctly");
        } finally { LocalArchive.delete(work); }
    }
}
