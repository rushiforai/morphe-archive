package app.morphe.extension.discord.bunny.recovery;

import android.util.Base64;
import android.util.Log;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;

/** One bounded, private previous version per stable plugin identity. */
final class PluginRollbackManager {
    private static final String TAG = "BunnyRecovery";
    private static final int MAX_PLUGIN_BYTES = 16 * 1024 * 1024;
    private final File bunnyRoot;
    private final RecoveryStore store;

    PluginRollbackManager(File bunnyRoot, RecoveryStore store) {
        this.bunnyRoot = bunnyRoot;
        this.store = store;
    }

    synchronized boolean preserve(String id, String kind) {
        try {
            JSONObject rollback = "vendetta".equals(kind) ? vendettaSnapshot(id) : modernSnapshot(id);
            if (rollback == null) return false;
            write(fileFor(id), rollback.toString().getBytes(StandardCharsets.UTF_8));
            return true;
        } catch (Throwable error) {
            Log.e(TAG, "Could not preserve previous plugin version", error);
            return false;
        }
    }

    synchronized boolean has(String id) {
        return id != null && fileFor(id).isFile();
    }

    synchronized void restore(String id) throws Exception {
        File file = fileFor(id);
        if (!file.isFile()) throw new IllegalStateException("No previous version is available for " + id);
        JSONObject rollback = new JSONObject(new String(read(file), StandardCharsets.UTF_8));
        if (!id.equals(rollback.optString("id"))) throw new IllegalStateException("Rollback identity mismatch");
        if ("vendetta".equals(rollback.optString("kind"))) {
            File storage = new File(new File(bunnyRoot, "vd_mmkv"), "VENDETTA_PLUGINS");
            JSONObject root = storage.isFile() ? new JSONObject(new String(read(storage), StandardCharsets.UTF_8)) : new JSONObject();
            root.put(id, rollback.getJSONObject("entry"));
            atomicWrite(storage, root.toString().getBytes(StandardCharsets.UTF_8));
        } else if ("modern".equals(rollback.optString("kind"))) {
            File manifest = safePluginFile("plugins/manifests/", id, ".json");
            File script = safePluginFile("plugins/scripts/", id, ".js");
            atomicWrite(manifest, rollback.getString("manifest").getBytes(StandardCharsets.UTF_8));
            atomicWrite(script, Base64.decode(rollback.getString("script"), Base64.DEFAULT));
        } else {
            throw new IllegalStateException("Unknown plugin rollback kind");
        }
    }

    private JSONObject vendettaSnapshot(String id) throws Exception {
        File storage = new File(new File(bunnyRoot, "vd_mmkv"), "VENDETTA_PLUGINS");
        if (!storage.isFile() || storage.length() > MAX_PLUGIN_BYTES) return null;
        JSONObject entry = new JSONObject(new String(read(storage), StandardCharsets.UTF_8)).optJSONObject(id);
        if (entry == null || !entry.has("js")) return null;
        return new JSONObject().put("version", 1).put("kind", "vendetta").put("id", id).put("entry", entry);
    }

    private JSONObject modernSnapshot(String id) throws Exception {
        File manifest = safePluginFile("plugins/manifests/", id, ".json");
        File script = safePluginFile("plugins/scripts/", id, ".js");
        if (!manifest.isFile() || !script.isFile() || manifest.length() > MAX_PLUGIN_BYTES || script.length() > MAX_PLUGIN_BYTES) return null;
        return new JSONObject().put("version", 1).put("kind", "modern").put("id", id)
                .put("manifest", new String(read(manifest), StandardCharsets.UTF_8))
                .put("script", Base64.encodeToString(read(script), Base64.NO_WRAP));
    }

    private File safePluginFile(String prefix, String id, String suffix) throws Exception {
        File root = new File(bunnyRoot, prefix);
        File file = new File(root, id + suffix);
        String rootPath = root.getCanonicalPath() + File.separator;
        if (!file.getCanonicalPath().startsWith(rootPath)) throw new IllegalArgumentException("Unsafe plugin identity");
        return file;
    }

    private File fileFor(String id) {
        return store.file("plugin-rollback-" + digest(id == null ? "" : id) + ".json");
    }

    private static String digest(String value) {
        try {
            byte[] bytes = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder();
            for (int i = 0; i < 12; i++) result.append(String.format(Locale.ROOT, "%02x", bytes[i] & 0xff));
            return result.toString();
        } catch (Throwable ignored) { return Integer.toHexString(value.hashCode()); }
    }

    private static byte[] read(File file) throws Exception {
        if (file.length() > MAX_PLUGIN_BYTES) throw new IllegalStateException("Plugin rollback data is too large");
        byte[] bytes = new byte[(int) file.length()];
        try (FileInputStream input = new FileInputStream(file)) {
            int offset = 0;
            while (offset < bytes.length) { int count = input.read(bytes, offset, bytes.length - offset); if (count < 0) break; offset += count; }
            if (offset != bytes.length) throw new IllegalStateException("Short plugin rollback read");
        }
        return bytes;
    }

    private static void write(File file, byte[] data) throws Exception {
        File parent = file.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IllegalStateException("Could not create rollback directory");
        try (FileOutputStream output = new FileOutputStream(file)) { output.write(data); output.getFD().sync(); }
    }

    private static void atomicWrite(File target, byte[] data) throws Exception {
        File parent = target.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IllegalStateException("Could not create plugin directory");
        File temp = new File(parent, target.getName() + ".rollback-tmp");
        write(temp, data);
        RecoveryStore.atomicReplace(temp, target);
    }
}
