package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Verified, atomic on-demand cache for reviewed theme packs. */
public final class GboardCustomThemeRepository {
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private GboardCustomThemeRepository() { }

    public interface Progress { void update(long downloaded, long total); }

    public static boolean isCached(Context context, GboardCustomThemeCatalog.Pack pack) {
        try {
            File cached = cachedPack(context, pack);
            return cached.isFile() && pack.sha256.equals(sha256(cached));
        } catch (Throwable ignored) { return false; }
    }

    /** UI-only marker; verified files are committed atomically, so existence is sufficient. */
    public static boolean isCachePresent(Context context, GboardCustomThemeCatalog.Pack pack) {
        try {
            return cachedPack(context, pack).isFile();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static int deletePackCache(Context context, GboardCustomThemeCatalog.Pack pack) {
        int removed = 0;
        try {
            File cached = cachedPack(context, pack);
            File staging = new File(cached.getParentFile(), pack.sha256 + ".part");
            if (cached.delete()) removed++;
            if (staging.delete()) removed++;
        } catch (Throwable ignored) {
            // Cache deletion is best-effort and never touches installed themes.
        }
        return removed;
    }

    public static File extractTheme(Context context, GboardCustomThemeCatalog.Pack pack,
            GboardCustomThemeCatalog.Theme theme, Progress progress) throws Exception {
        File outer = resolvePack(context, pack, progress);
        File exports = new File(cacheRoot(context), "exports");
        ensureDirectory(exports);
        File output = new File(exports, safeName(theme.name) + "-" + UUID.randomUUID() + ".zip");
        try (ZipFile zip = new ZipFile(outer)) {
            ZipEntry entry = zip.getEntry(theme.entry);
            if (entry == null || entry.isDirectory()) throw new IOException("Theme is missing from pack");
            if (entry.getSize() > GboardThemeImportContract.MAX_INNER_THEME_BYTES) {
                throw new IOException("Theme exceeds size limit");
            }
            try (InputStream input = zip.getInputStream(entry)) {
                copyBounded(input, output, GboardThemeImportContract.MAX_INNER_THEME_BYTES, null, -1L);
            }
            return output;
        } catch (Exception failure) {
            output.delete();
            throw failure;
        }
    }

    public static int clearCache(Context context) {
        int removed = 0;
        File root;
        try { root = cacheRoot(context); } catch (IOException ignored) { return 0; }
        for (String child : new String[]{"packs", "exports"}) {
            File[] files = new File(root, child).listFiles();
            if (files == null) continue;
            for (File file : files) if (file.isFile() && file.delete()) removed++;
        }
        return removed;
    }

    private static File resolvePack(Context context, GboardCustomThemeCatalog.Pack pack,
            Progress progress) throws Exception {
        File cached = cachedPack(context, pack);
        if (cached.isFile() && pack.sha256.equals(sha256(cached))) {
            if (progress != null) progress.update(pack.bytes, pack.bytes);
            return cached;
        }
        cached.delete();
        File staging = new File(cached.getParentFile(), pack.sha256 + ".part");
        staging.delete();
        HttpURLConnection connection = null;
        try {
            URL url = new URL(pack.url);
            if (!"https".equalsIgnoreCase(url.getProtocol())) throw new IOException("HTTPS is required");
            connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("Accept", "application/zip, application/octet-stream");
            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) throw new IOException("Theme source HTTP " + status);
            long length = connection.getContentLengthLong();
            if (length > GboardThemeImportContract.MAX_SOURCE_BYTES) throw new IOException("Pack exceeds size limit");
            try (InputStream input = connection.getInputStream()) {
                copyBounded(input, staging, GboardThemeImportContract.MAX_SOURCE_BYTES,
                        progress, length > 0 ? length : pack.bytes);
            }
            if (!pack.sha256.equals(sha256(staging))) throw new IOException("Pack SHA-256 mismatch");
            if (!staging.renameTo(cached)) throw new IOException("Cannot commit theme pack cache");
            return cached;
        } finally {
            if (connection != null) connection.disconnect();
            if (!cached.isFile()) staging.delete();
        }
    }

    private static File cachedPack(Context context, GboardCustomThemeCatalog.Pack pack) throws IOException {
        File packs = new File(cacheRoot(context), "packs");
        ensureDirectory(packs);
        return new File(packs, pack.sha256 + ".pack");
    }

    private static File cacheRoot(Context context) throws IOException {
        File root = new File(context.getCacheDir(), "custom-theme-gallery");
        ensureDirectory(root);
        return root;
    }

    private static void ensureDirectory(File directory) throws IOException {
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create cache directory");
    }

    private static void copyBounded(InputStream input, File destination, long limit,
            Progress progress, long totalBytes) throws IOException {
        long total = 0L;
        byte[] buffer = new byte[32 * 1024];
        try (FileOutputStream output = new FileOutputStream(destination, false)) {
            int read;
            while ((read = input.read(buffer)) >= 0) {
                if (read == 0) continue;
                total += read;
                if (total > limit) throw new IOException("Theme data exceeds size limit");
                output.write(buffer, 0, read);
                if (progress != null) progress.update(total, totalBytes);
            }
            output.flush();
            output.getFD().sync();
        }
        if (total == 0L) throw new IOException("Theme data is empty");
    }

    private static String sha256(File file) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (InputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[32 * 1024];
            int read;
            while ((read = input.read(buffer)) >= 0) if (read > 0) digest.update(buffer, 0, read);
        }
        StringBuilder hex = new StringBuilder(64);
        for (byte value : digest.digest()) hex.append(String.format(Locale.US, "%02x", value & 0xff));
        return hex.toString();
    }

    private static String safeName(String value) { return value.replaceAll("[^A-Za-z0-9._-]", "_"); }
}
