package nl.johninnl.gboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.UserManager;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Where the downloaded runtime and models live, and the user's choices.
 *
 * <p>Everything sits in Gboard's credential-encrypted no-backup storage, so it is never
 * backed up and is unavailable before the first unlock; Gboard then keeps its own voice
 * typing. A file only counts as installed when it has its exact size and a marker that
 * records the checksum it was verified against.
 */
public final class ParakeetStore {
    private ParakeetStore() {}

    private static final String PREFS = "morphe_parakeet";
    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_MODEL = "model";
    private static final String MARKER = ".verified";

    static boolean unlocked(Context context) {
        if (Build.VERSION.SDK_INT < 24) return true;
        UserManager users = context.getSystemService(UserManager.class);
        return users == null || users.isUserUnlocked();
    }

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    public static boolean enabled(Context context) {
        return prefs(context).getBoolean(KEY_ENABLED, false);
    }

    public static void setEnabled(Context context, boolean enabled) {
        prefs(context).edit().putBoolean(KEY_ENABLED, enabled).apply();
    }

    public static ParakeetCatalog.Model selectedModel(Context context) {
        return ParakeetCatalog.model(prefs(context).getString(KEY_MODEL, ParakeetCatalog.ULTRA.id));
    }

    public static void selectModel(Context context, ParakeetCatalog.Model model) {
        prefs(context).edit().putString(KEY_MODEL, model.id).apply();
    }

    static File root(Context context) {
        return new File(context.getNoBackupFilesDir(), "morphe-parakeet");
    }

    static File runtimeDir(Context context) {
        return new File(new File(root(context), "runtime"), ParakeetCatalog.RUNTIME_VERSION);
    }

    static File runtimeLibrary(Context context) {
        return new File(runtimeDir(context), ParakeetCatalog.RUNTIME_LIBRARY);
    }

    static File modelDir(Context context, ParakeetCatalog.Model model) {
        return new File(new File(root(context), "models"), model.id);
    }

    static File cacheDir(Context context) {
        return new File(root(context), "downloads");
    }

    static File vadModel(Context context) {
        return new File(runtimeDir(context), ParakeetCatalog.VAD_MODEL.name);
    }

    public static boolean runtimeInstalled(Context context) {
        return verified(runtimeLibrary(context), ParakeetCatalog.RUNTIME_LIBRARY_SIZE, ParakeetCatalog.RUNTIME_LIBRARY_SHA256)
                && verified(vadModel(context), ParakeetCatalog.VAD_MODEL.size, ParakeetCatalog.VAD_MODEL.sha256);
    }

    public static boolean modelInstalled(Context context, ParakeetCatalog.Model model) {
        File dir = modelDir(context, model);
        for (ParakeetCatalog.Asset file : model.files) {
            if (!verified(new File(dir, file.name), file.size, file.sha256)) return false;
        }
        return true;
    }

    /** True when voice typing should use Parakeet right now. Never throws. */
    public static boolean active(Context context) {
        try {
            if (!unlocked(context) || !enabled(context)) return false;
            if (!supportsArm64()) return false;
            return runtimeInstalled(context) && modelInstalled(context, selectedModel(context));
        } catch (RuntimeException e) {
            return false;
        }
    }

    public static boolean supportsArm64() {
        for (String abi : Build.SUPPORTED_ABIS) if ("arm64-v8a".equals(abi)) return true;
        return false;
    }

    /** Bytes still to download before [model] can be used, including the shared runtime. */
    public static long missingBytes(Context context, ParakeetCatalog.Model model) {
        long total = 0;
        if (!verified(runtimeLibrary(context), ParakeetCatalog.RUNTIME_LIBRARY_SIZE, ParakeetCatalog.RUNTIME_LIBRARY_SHA256)) {
            total += ParakeetCatalog.RUNTIME_ARCHIVE.size;
        }
        ParakeetCatalog.Asset vad = ParakeetCatalog.VAD_MODEL;
        if (!verified(vadModel(context), vad.size, vad.sha256)) total += vad.size;
        File dir = modelDir(context, model);
        for (ParakeetCatalog.Asset file : model.files) {
            if (!verified(new File(dir, file.name), file.size, file.sha256)) total += file.size;
        }
        return total;
    }

    /** Bytes the model's verified files occupy on disk. */
    public static long installedBytes(Context context, ParakeetCatalog.Model model) {
        long total = 0;
        File dir = modelDir(context, model);
        for (ParakeetCatalog.Asset file : model.files) {
            File f = new File(dir, file.name);
            if (f.isFile()) total += f.length();
            File partial = new File(cacheDir(context), model.id + "-" + file.name + ".part");
            if (partial.isFile()) total += partial.length();
        }
        return total;
    }

    public static void deleteModel(Context context, ParakeetCatalog.Model model) {
        File dir = modelDir(context, model);
        for (ParakeetCatalog.Asset file : model.files) {
            new File(dir, file.name + MARKER).delete();
            new File(dir, file.name).delete();
            new File(cacheDir(context), model.id + "-" + file.name + ".part").delete();
        }
        dir.delete();
    }

    /**
     * Makes the downloaded runtime library read-only. Android 17 refuses to load a native library
     * the app can still write (THROW_ERROR_FOR_WRITABLE_DCL for apps targeting API 37, switched on
     * by an ART update), which would leave Gboard on its own recognizer. True when it is read-only.
     */
    static boolean sealLibrary(File library) {
        if (!library.canWrite()) return true;
        library.setWritable(false, false);
        return !library.canWrite();
    }

    static boolean verified(File file, long size, String sha256) {
        if (!file.isFile() || file.length() != size) return false;
        File marker = new File(file.getPath() + MARKER);
        if (!marker.isFile() || marker.length() > 128) return false;
        try {
            return sha256.equals(new String(readAll(marker), StandardCharsets.US_ASCII).trim());
        } catch (IOException e) {
            return false;
        }
    }

    static void markVerified(File file, String sha256) throws IOException {
        File marker = new File(file.getPath() + MARKER);
        try (FileOutputStream out = new FileOutputStream(marker)) {
            out.write(sha256.getBytes(StandardCharsets.US_ASCII));
            out.getFD().sync();
        }
    }

    static String sha256(File file) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            MessageDigest digest = digest();
            byte[] buffer = new byte[1 << 16];
            for (int n; (n = in.read(buffer)) > 0; ) digest.update(buffer, 0, n);
            return hex(digest.digest());
        }
    }

    static MessageDigest digest() {
        try {
            return MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
    }

    static String hex(byte[] bytes) {
        StringBuilder out = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) out.append(Character.forDigit((b >> 4) & 0xf, 16)).append(Character.forDigit(b & 0xf, 16));
        return out.toString();
    }

    private static byte[] readAll(File file) throws IOException {
        byte[] data = new byte[(int) file.length()];
        try (FileInputStream in = new FileInputStream(file)) {
            int off = 0;
            while (off < data.length) {
                int n = in.read(data, off, data.length - off);
                if (n < 0) throw new IOException("short read");
                off += n;
            }
        }
        return data;
    }
}
