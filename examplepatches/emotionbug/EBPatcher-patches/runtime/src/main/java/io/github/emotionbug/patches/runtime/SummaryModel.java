package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.os.Build;
import android.os.Process;
import dalvik.system.DexClassLoader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.NoSuchAlgorithmException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Pinned public model metadata and an isolated, verified native inference dependency loader. */
final class SummaryModel {
    static final String ASSETS = "ebpatcher/summary/";
    enum Role {
        GEMMA("gemma", "Gemma text summaries", "model.json", ".litertlm", "verified_model", ""),
        WHISPER("whisper", "Whisper transcription", "whisper-model.json", ".bin", "verified_whisper_model", "whisper_");

        final String key, label, asset, extension, verifiedKey, settingPrefix;
        Role(String key, String label, String asset, String extension, String verifiedKey, String settingPrefix) {
            this.key = key; this.label = label; this.asset = asset; this.extension = extension;
            this.verifiedKey = verifiedKey; this.settingPrefix = settingPrefix;
        }
        static Role from(String key) {
            for (Role role : values()) if (role.key.equals(key)) return role;
            return null;
        }
        String setting(String key) { return settingPrefix + key; }
    }
    final Role role;
    final String id, title, url, sha256, licenseUrl, licenseName;
    final long size;
    private static final SummaryModel[] cached = new SummaryModel[Role.values().length];
    private static Class<?> engineType;

    SummaryModel(Role role, JSONObject object) throws JSONException, IOException {
        this.role = role;
        id = object.getString("id"); title = object.getString("title"); url = object.getString("url");
        sha256 = object.getString("sha256"); size = object.getLong("size");
        licenseUrl = object.getString("licenseUrl"); licenseName = object.getString("licenseName");
        if (!url.startsWith("https://") || !licenseUrl.startsWith("https://") || !sha256.matches("[0-9a-f]{64}") || size <= 0)
            throw new IOException("Invalid pinned metadata for " + role.label);
    }
    static synchronized SummaryModel get(Context context, Role role) throws IOException {
        if (cached[role.ordinal()] == null) {
            try { cached[role.ordinal()] = new SummaryModel(role, new JSONObject(assetText(context, role.asset))); }
            catch (JSONException | IOException error) { throw new IOException("Unable to load pinned metadata for " + role.label, error); }
        }
        return cached[role.ordinal()];
    }
    static boolean available(Context context) {
        try {
            get(context, Role.GEMMA); get(context, Role.WHISPER);
            return true;
        } catch (IOException error) { return false; }
    }
    File directory(Context context) {
        File root = new File(context.getNoBackupFilesDir(), "ebpatcher-models");
        // Keep the existing Gemma path and verified marker valid when its metadata is unchanged.
        return role == Role.GEMMA ? root : new File(root, role.key);
    }
    File file(Context context) { return new File(directory(context), sha256 + role.extension); }
    File part(Context context) { return new File(directory(context), sha256 + ".part"); }
    boolean ready(Context context) {
        File model = file(context);
        return model.isFile() && model.length() == size && sha256.equals(SummaryStore.get(context).setting(role.verifiedKey, ""));
    }

    boolean outdated(Context context, SummaryStore store) {
        String installed = store.setting(role.verifiedKey, "");
        return !sha256.equals(installed) && installed.matches("[0-9a-f]{64}")
                && new File(directory(context), installed + role.extension).isFile();
    }

    /** Caller holds download and summary locks; old weights survive every pre-publication failure. */
    void publish(Context context, SummaryStore store, long received, String receivedHash) throws IOException {
        File pending = part(context);
        if (received != size || pending.length() != size) throw new IOException("Model size mismatch; download rejected");
        if (!sha256.equals(receivedHash)) throw new IOException("Model SHA-256 mismatch; download rejected");
        if (!pending.setReadOnly()) throw new IOException("Unable to protect the verified model file");
        // No copy fallback: the new model must be fully verified before atomic publication.
        Files.move(pending.toPath(), file(context).toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
        store.setSetting(role.verifiedKey, sha256);
    }

    /** Only obsolete published weights for this role; never another role or any partial transfer. */
    void removeObsolete(Context context) throws IOException {
        File[] files = directory(context).listFiles();
        if (files == null) throw new IOException("Unable to read private model storage");
        String current = sha256 + role.extension;
        for (File old : files) {
            String name = old.getName();
            if (old.isFile() && !name.equals(current) && name.endsWith(role.extension)
                    && name.substring(0, name.length() - role.extension.length()).matches("[0-9a-f]{64}")
                    && !old.delete()) throw new IOException("New model is ready, but an older model could not be removed");
        }
    }
    boolean hasFiles(Context context) {
        File[] files = directory(context).listFiles();
        if (files != null) for (File file : files) if (owns(file)) return true;
        return false;
    }
    void deleteFiles(Context context) throws IOException {
        File[] files = directory(context).listFiles();
        if (files == null) {
            if (directory(context).exists()) throw new IOException("Unable to read private storage for " + role.label);
            return;
        }
        for (File file : files) if (owns(file) && !file.delete())
            throw new IOException("Unable to delete " + role.label + " model data");
    }
    private boolean owns(File file) {
        return file.isFile() && (file.getName().endsWith(role.extension) || file.getName().endsWith(".part"));
    }
    static String assetText(Context context, String name) throws IOException {
        try (InputStream input = context.getAssets().open(ASSETS + name); ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096]; int count;
            while ((count = input.read(buffer)) != -1) {
                if (bytes.size() + count > 1024 * 1024) throw new IOException("Engine metadata is too large");
                bytes.write(buffer, 0, count);
            }
            return bytes.toString(StandardCharsets.UTF_8.name());
        }
    }
    static MessageDigest digest() {
        try { return MessageDigest.getInstance("SHA-256"); }
        catch (NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }
    static String hex(byte[] bytes) {
        char[] chars = new char[bytes.length * 2]; final char[] digits = "0123456789abcdef".toCharArray();
        for (int i = 0; i < bytes.length; i++) { chars[i * 2] = digits[(bytes[i] >>> 4) & 15]; chars[i * 2 + 1] = digits[bytes[i] & 15]; }
        return new String(chars);
    }
    static synchronized Class<?> engine(Context context) throws Exception {
        if (engineType != null) return engineType;
        if (!Process.is64Bit()) throw new IOException("On-device summaries require a 64-bit application process");
        JSONArray entries = new JSONArray(assetText(context, "engine-files.json"));
        String abi = null, engineHash = null;
        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.getJSONObject(i);
            if ("engine.zip".equals(entry.getString("path"))) engineHash = entry.getString("sha256");
        }
        if (engineHash == null || !engineHash.matches("[0-9a-f]{64}")) throw new IOException("Missing verified engine archive");
        for (String candidate : Build.SUPPORTED_64_BIT_ABIS) {
            for (int i = 0; i < entries.length(); i++) {
                if (entries.getJSONObject(i).getString("path").startsWith("lib/" + candidate + "/")) { abi = candidate; break; }
            }
            if (abi != null) break;
        }
        if (abi == null) throw new IOException("No local inference engine for this CPU architecture");
        File directory = new File(context.getNoBackupFilesDir(), "ebpatcher-engine/" + engineHash);
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Unable to create private engine directory");
        File libraries = new File(directory, "lib");
        if (!libraries.isDirectory() && !libraries.mkdirs()) throw new IOException("Unable to create private native library directory");
        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.getJSONObject(i); String path = entry.getString("path");
            if (!"engine.zip".equals(path) && !path.startsWith("lib/" + abi + "/")) continue;
            String name = path.substring(path.lastIndexOf('/') + 1);
            if (!name.matches("[A-Za-z0-9_.-]+") || ".".equals(name) || "..".equals(name)) throw new IOException("Invalid engine asset path");
            File destination = new File("engine.zip".equals(path) ? directory : libraries, name);
            extract(context, path, destination, entry.getLong("size"), entry.getString("sha256"));
        }
        ClassLoader loader = new DexClassLoader(new File(directory, "engine.zip").getPath(),
                context.getCodeCacheDir().getPath(), libraries.getPath(), ClassLoader.getSystemClassLoader());
        engineType = loader.loadClass("io.github.emotionbug.summaryengine.OfflineEngine");
        return engineType;
    }
    private static void extract(Context context, String asset, File destination, long size, String hash) throws IOException {
        if (size < 0 || !hash.matches("[0-9a-f]{64}")) throw new IOException("Invalid engine integrity metadata");
        MessageDigest digest = digest(); byte[] buffer = new byte[65536];
        if (destination.isFile() && destination.length() == size) {
            try (InputStream input = new java.io.FileInputStream(destination)) {
                int count; while ((count = input.read(buffer)) != -1) digest.update(buffer, 0, count);
            }
            if (hash.equals(hex(digest.digest()))) return;
        }
        digest.reset();
        File temporary = new File(destination.getPath() + ".part");
        if (temporary.exists() && !temporary.delete()) throw new IOException("Unable to replace incomplete engine asset");
        long total = 0;
        try (InputStream input = context.getAssets().open(ASSETS + asset); FileOutputStream output = new FileOutputStream(temporary)) {
            // Android 14+ requires dynamically loaded code to be read-only; retain this open write FD only.
            if (!temporary.setReadOnly()) throw new IOException("Unable to protect private engine asset");
            int count; while ((count = input.read(buffer)) != -1) {
                total += count; if (total > size) throw new IOException("Engine asset size mismatch");
                digest.update(buffer, 0, count); output.write(buffer, 0, count);
            }
            output.getFD().sync();
        } catch (IOException | RuntimeException error) { temporary.delete(); throw error; }
        if (total != size || !hash.equals(hex(digest.digest()))) { temporary.delete(); throw new IOException("Engine asset SHA-256 mismatch"); }
        if (!temporary.renameTo(destination)) { temporary.delete(); throw new IOException("Unable to publish verified engine asset"); }
    }
}
