package software.santodan.extension.pillobackup;

import org.json.JSONArray;
import org.json.JSONObject;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.*;

/** Versioned, verified local archive. No live data is modified while validating. */
public final class LocalArchive {
    public static final long MAX_BYTES = 2L * 1024 * 1024 * 1024;
    static final int MAX_FILES = 50000;
    static final Set<String> ROOTS = new HashSet<>(Arrays.asList("database", "preferences", "files", "no_backup", "external"));
    private LocalArchive() {}

    public static void write(File destination, Map<String, File> roots) throws Exception {
        if (!roots.containsKey("database") || !roots.get("database").isFile()) throw new IOException("Pillo database is missing.");
        Map<String, File> files = new TreeMap<>();
        for (Map.Entry<String, File> root : roots.entrySet()) {
            if (!ROOTS.contains(root.getKey())) throw new IOException("Unknown backup root.");
            File canonical = root.getValue().getCanonicalFile();
            collect(canonical, canonical, "data/" + root.getKey(), files);
        }
        if (files.size() > MAX_FILES) throw new IOException("Too many files to back up.");
        JSONObject manifest = new JSONObject().put("format", "santodan-pillo-local-backup").put("version", 1)
            .put("package", "xyz.rtrvr.pillo").put("appVersion", "0.6.20").put("createdAt", System.currentTimeMillis())
            .put("roots", new JSONArray(roots.keySet()));
        JSONArray index = new JSONArray();
        try (ZipOutputStream zip = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(destination)))) {
            long total = 0;
            for (Map.Entry<String, File> file : files.entrySet()) {
                zip.putNextEntry(new ZipEntry(file.getKey()));
                MessageDigest checksum = MessageDigest.getInstance("SHA-256");
                long size;
                // Read each live file once. The index describes the captured bytes,
                // even when background services replace the source during export.
                try (InputStream input = new java.security.DigestInputStream(
                        new BufferedInputStream(new FileInputStream(file.getValue())), checksum)) {
                    size = transfer(input, zip, MAX_BYTES - total);
                }
                zip.closeEntry();
                total += size;
                index.put(new JSONObject().put("path", file.getKey()).put("size", size)
                    .put("sha256", hex(checksum.digest())));
            }
            manifest.put("files", index);
            byte[] metadata = manifest.toString().getBytes(StandardCharsets.UTF_8);
            if (metadata.length > 8 * 1024 * 1024) throw new IOException("Backup index is too large.");
            zip.putNextEntry(new ZipEntry("manifest.json")); zip.write(metadata); zip.closeEntry();
        }
        // Verify the actual archive independently; no second read of live app files.
        try (ZipFile zip = new ZipFile(destination)) {
            for (int i = 0; i < index.length(); i++) {
                JSONObject row = index.getJSONObject(i);
                try (InputStream input = zip.getInputStream(zip.getEntry(row.getString("path")))) {
                    if (zip.getEntry(row.getString("path")).getSize() != row.getLong("size")
                        || !row.getString("sha256").equals(digest(input))) throw new IOException("Backup verification failed.");
                }
            }
        }
    }

    private static void collect(File base, File file, String path, Map<String, File> output) throws IOException {
        if (!file.exists()) return;
        String expected = file.getAbsolutePath();
        if (!file.getCanonicalPath().equals(expected)) throw new IOException("Symbolic links cannot be backed up.");
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children == null) throw new IOException("Cannot read backup directory.");
            for (File child : children) {
                if (path.equals("data/files") && (child.getName().equals("databasebackup") || child.getName().equals("databasebackup-temp"))) continue;
                collect(base, child, path + "/" + child.getName(), output);
            }
        } else if (file.isFile()) { validatePath(path); output.put(path, file); }
        else throw new IOException("Unsupported file in backup.");
    }

    public static JSONObject extract(File archive, File stage) throws Exception {
        if (stage.exists()) throw new IOException("Restore staging directory already exists.");
        if (!stage.mkdirs()) throw new IOException("Cannot create restore staging directory.");
        try (ZipFile zip = new ZipFile(archive)) {
            Set<String> actual = new HashSet<>();
            Enumeration<? extends ZipEntry> enumeration = zip.entries();
            while (enumeration.hasMoreElements()) {
                ZipEntry entry = enumeration.nextElement();
                if (entry.isDirectory() || !actual.add(entry.getName()) || actual.size() > MAX_FILES + 1)
                    throw new IOException("Invalid or duplicate archive entry.");
                if (!entry.getName().equals("manifest.json")) validatePath(entry.getName());
            }
            ZipEntry metadata = zip.getEntry("manifest.json");
            if (metadata == null) throw new IOException("This is not a Pillo local backup.");
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            try (InputStream input = zip.getInputStream(metadata)) { transfer(input, bytes, 8 * 1024 * 1024); }
            JSONObject manifest = new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
            if (!manifest.getString("format").equals("santodan-pillo-local-backup") || manifest.getInt("version") != 1
                || !manifest.getString("package").equals("xyz.rtrvr.pillo") || !manifest.getString("appVersion").equals("0.6.20"))
                throw new IOException("Backup format or Pillo version is incompatible.");
            Set<String> roots = new HashSet<>();
            JSONArray rootList = manifest.getJSONArray("roots");
            for (int i = 0; i < rootList.length(); i++) {
                String root = rootList.getString(i);
                if (!ROOTS.contains(root) || !roots.add(root)) throw new IOException("Invalid backup root.");
                if (!root.equals("database") && !new File(stage, "data/" + root).mkdirs()) throw new IOException("Cannot stage backup root.");
            }
            if (!roots.contains("database")) throw new IOException("Backup has no database.");
            Set<String> expected = new HashSet<>(); expected.add("manifest.json");
            JSONArray index = manifest.getJSONArray("files");
            long total = 0;
            for (int i = 0; i < index.length(); i++) {
                JSONObject row = index.getJSONObject(i);
                String path = row.getString("path"); validatePath(path);
                if (!roots.contains(path.split("/")[1]) || !expected.add(path)) throw new IOException("Invalid backup index.");
                long size = row.getLong("size");
                if (size < 0 || size > MAX_BYTES || (total += size) > MAX_BYTES) throw new IOException("Backup exceeds 2 GB.");
                ZipEntry entry = zip.getEntry(path);
                if (entry == null || entry.getSize() != size) throw new IOException("Backup is incomplete.");
                File target = new File(stage, path);
                // Android filenames may contain colons. On a Windows verification
                // host they denote alternate data streams, which cannot be restored.
                if (File.separatorChar == '\\' && path.indexOf(':') >= 0)
                    throw new IOException("Android filenames containing colons require Android to restore.");
                if (!target.getCanonicalPath().startsWith(stage.getCanonicalPath() + File.separator)) throw new IOException("Unsafe archive path.");
                File parent = target.getParentFile();
                if (!parent.isDirectory() && !parent.mkdirs()) throw new IOException("Cannot create staging directory.");
                try (InputStream input = zip.getInputStream(entry); OutputStream output = new BufferedOutputStream(new FileOutputStream(target))) {
                    if (transfer(input, output, size) != size) throw new IOException("Truncated backup entry.");
                }
                if (!digest(target).equals(row.getString("sha256"))) throw new IOException("Backup checksum mismatch.");
            }
            if (!actual.equals(expected) || !new File(stage, "data/database").isFile()) throw new IOException("Invalid backup contents.");
            return manifest;
        } catch (Exception error) { delete(stage); throw error; }
    }

    private static void validatePath(String path) throws IOException {
        // Colons are ordinary Android filename characters (including Firebase
        // installation/preferences names). Fixed roots and component checks below
        // prevent absolute paths and traversal without rejecting those files.
        if (path.indexOf('\\') >= 0 || path.indexOf('\0') >= 0) throw new IOException("Unsafe archive path.");
        String[] parts = path.split("/", -1);
        if (parts.length < 2 || !parts[0].equals("data") || !ROOTS.contains(parts[1])) throw new IOException("Unknown archive path.");
        for (String part : parts) if (part.isEmpty() || part.equals(".") || part.equals("..")) throw new IOException("Unsafe archive path.");
        if (parts[1].equals("database") && parts.length != 2) throw new IOException("Invalid database entry.");
    }

    public static long transfer(InputStream input, OutputStream output, long limit) throws IOException {
        byte[] buffer = new byte[65536]; long total = 0; int count;
        while ((count = input.read(buffer)) != -1) {
            if ((total += count) > limit) throw new IOException("File exceeds the allowed size.");
            output.write(buffer, 0, count);
        }
        return total;
    }

    private static String digest(File file) throws Exception {
        try (InputStream input = new BufferedInputStream(new FileInputStream(file))) { return digest(input); }
    }
    private static String digest(InputStream input) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256"); byte[] buffer = new byte[65536]; int count;
        while ((count = input.read(buffer)) != -1) digest.update(buffer, 0, count);
        return hex(digest.digest());
    }
    private static String hex(byte[] bytes) {
        StringBuilder text = new StringBuilder();
        for (byte b : bytes) text.append(String.format(Locale.ROOT, "%02x", b & 255));
        return text.toString();
    }

    /** Called only on app-owned staging paths and fixed restore roots. */
    public static void delete(File file) throws IOException {
        if (!file.exists()) return;
        if (file.isDirectory()) {
            File[] children = file.listFiles(); if (children == null) throw new IOException("Cannot read cleanup directory.");
            for (File child : children) {
                if (!child.getCanonicalPath().startsWith(file.getCanonicalPath() + File.separator)) throw new IOException("Unsafe cleanup link.");
                delete(child);
            }
        }
        if (!file.delete()) throw new IOException("Cannot remove temporary backup data.");
    }

    static void copy(File source, File target) throws IOException {
        if (!source.getCanonicalPath().equals(source.getAbsolutePath())) throw new IOException("Unsafe copy link.");
        if (source.isDirectory()) {
            if (!target.mkdirs()) throw new IOException("Cannot create restore directory.");
            File[] children = source.listFiles(); if (children == null) throw new IOException("Cannot read restore directory.");
            for (File child : children) copy(child, new File(target, child.getName()));
        } else {
            try (InputStream input = new FileInputStream(source); FileOutputStream output = new FileOutputStream(target)) {
                transfer(input, output, MAX_BYTES); output.getFD().sync();
            }
        }
    }

    static File sibling(File target, String suffix) { return new File(target.getParentFile(), target.getName() + suffix); }
    static void move(File source, File target) throws IOException { if (!source.renameTo(target)) throw new IOException("Cannot replace restored data."); }

    public static void atomicText(File target, String text) throws IOException {
        File temporary = sibling(target, ".tmp");
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(text.getBytes(StandardCharsets.UTF_8)); output.getFD().sync();
        }
        // Android supports POSIX atomic replacement on API 21+. The reflective JVM
        // fallback lets the same transaction code be tested on Windows without
        // introducing java.nio.file (API 26) references into the Android runtime.
        try {
            Class<?> os;
            try { os = Class.forName("android.system.Os"); }
            catch (ClassNotFoundException jvm) {
                Class<?> path = Class.forName("java.nio.file.Path"), option = Class.forName("java.nio.file.CopyOption");
                Object options = java.lang.reflect.Array.newInstance(option, 2);
                Class<?> standard = Class.forName("java.nio.file.StandardCopyOption");
                java.lang.reflect.Array.set(options, 0, standard.getField("REPLACE_EXISTING").get(null));
                java.lang.reflect.Array.set(options, 1, standard.getField("ATOMIC_MOVE").get(null));
                Object from = File.class.getMethod("toPath").invoke(temporary), to = File.class.getMethod("toPath").invoke(target);
                Class.forName("java.nio.file.Files").getMethod("move", path, path, options.getClass()).invoke(null, from, to, options);
                return;
            }
            os.getMethod("rename", String.class, String.class).invoke(null, temporary.getAbsolutePath(), target.getAbsolutePath());
        } catch (ReflectiveOperationException error) { throw new IOException("Cannot write restore journal atomically.", error); }
    }

    public static String readText(File source) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        try (InputStream input = new FileInputStream(source)) { transfer(input, output, 8 * 1024 * 1024); }
        return new String(output.toByteArray(), StandardCharsets.UTF_8);
    }

    /** Each replacement is prepared on the target filesystem. Rollback survives process death. */
    public static void prepare(File stage, File journal, Map<String, File> targets) throws Exception {
        if (journal.exists()) throw new IOException("An earlier restore requires recovery.");
        JSONObject originals = new JSONObject();
        for (Map.Entry<String, File> root : targets.entrySet()) {
            if (sibling(root.getValue(), ".santodan-new").exists() || sibling(root.getValue(), ".santodan-old").exists())
                throw new IOException("Restore temporary path is occupied.");
            originals.put(root.getKey(), root.getValue().exists());
        }
        atomicText(journal, new JSONObject().put("state", "preparing").put("originals", originals).toString());
        try {
            for (Map.Entry<String, File> root : targets.entrySet()) {
                File next = sibling(root.getValue(), ".santodan-new");
                File source = new File(stage, "data/" + root.getKey());
                if (source.exists()) copy(source.getCanonicalFile(), next);
            }
            atomicText(journal, new JSONObject().put("state", "prepared").put("originals", originals).toString());
        } catch (Exception error) { recover(journal, targets); throw error; }
    }

    /** Startup commits only renames; large file copying happened on a worker beforehand. */
    public static void commit(File journal, Map<String, File> targets) throws Exception {
        JSONObject prepared = new JSONObject(readText(journal));
        if (!prepared.getString("state").equals("prepared")) throw new IOException("Restore was not prepared.");
        JSONObject originals = new JSONObject();
        Iterator<String> keys = prepared.getJSONObject("originals").keys();
        Map<String, File> selected = new LinkedHashMap<>();
        while (keys.hasNext()) {
            String key = keys.next(); File target = targets.get(key);
            if (target == null) throw new IOException("Restore storage is unavailable.");
            selected.put(key, target); originals.put(key, target.exists());
        }
        atomicText(journal, new JSONObject().put("state", "applying").put("originals", originals).toString());
        try {
            for (File target : selected.values()) {
                if (target.exists()) move(target, sibling(target, ".santodan-old"));
                File next = sibling(target, ".santodan-new");
                if (next.exists()) move(next, target);
            }
            atomicText(journal, new JSONObject().put("state", "committed").put("originals", originals).toString());
        } catch (Exception error) {
            recover(journal, targets);
            throw error;
        }
    }

    public static void apply(File stage, File journal, Map<String, File> targets) throws Exception {
        prepare(stage, journal, targets);
        commit(journal, targets);
        recover(journal, targets);
    }

    public static boolean recover(File journal, Map<String, File> targets) throws Exception {
        if (!journal.exists()) return false;
        JSONObject state = new JSONObject(readText(journal));
        boolean committed = state.getString("state").equals("committed");
        boolean applying = state.getString("state").equals("applying");
        if (!committed && !applying && !state.getString("state").equals("preparing") && !state.getString("state").equals("prepared"))
            throw new IOException("Invalid restore journal.");
        JSONObject originals = state.getJSONObject("originals");
        // Only keys present in the journal were part of the interrupted transaction.
        Iterator<String> keys = originals.keys();
        while (keys.hasNext()) {
            String key = keys.next(); File target = targets.get(key);
            if (target == null) throw new IOException("Restore storage is unavailable.");
            File old = sibling(target, ".santodan-old");
            if (committed) delete(old);
            else if (applying && old.exists()) { delete(target); move(old, target); }
            else if (applying && !originals.getBoolean(key)) delete(target);
            delete(sibling(target, ".santodan-new"));
        }
        delete(journal);
        return committed;
    }
}
