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
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import org.json.JSONObject;

/** Downloads and permanently stores the versioned Custom Theme preview bundle. */
public final class GboardCustomThemePreviewRepository {
    public static final String VERSION = "v1";
    public static final String URL =
            "https://github.com/jasonwu1994/Gboard-patches/releases/download/"
                    + "custom-theme-previews-v1/custom-theme-previews-v1.zip";
    public static final String SHA256 =
            "368af5064b2e8ed62800417efd6fa015d12c74a94553002823eade85d8213ee9";

    private static final long MAX_COMPRESSED_BYTES = 12L * 1024L * 1024L;
    private static final long MAX_EXPANDED_BYTES = 16L * 1024L * 1024L;
    private static final long MAX_ENTRY_BYTES = 1L * 1024L * 1024L;
    private static final long MAX_MANIFEST_BYTES = 64L * 1024L;
    private static final long MAX_INDEX_BYTES = 256L * 1024L;
    private static final int MAX_ENTRY_COUNT = 600;
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private static final String ASSET_PREFIX = "gboard-custom-themes/";
    private static final String INDEX_FILE = "preview-index.txt";
    private static final Object INSTALL_LOCK = new Object();

    private static String validatedRootPath;
    private static long validatedMarkerModified;
    private static long validatedManifestModified;
    private static long validatedManifestLength;

    private GboardCustomThemePreviewRepository() { }

    public interface Progress {
        void update(long downloaded, long total);
        void preparing();
    }

    public static boolean isInstalled(Context context) {
        File root = versionRoot(context);
        try {
            validateInstalledBundle(root);
            rememberValidated(root);
            return true;
        } catch (Exception ignored) {
            forgetValidated();
            return false;
        }
    }

    /** Returns a validated local preview file, or null when the bundle is not installed. */
    public static File resolve(Context context, String assetPath) {
        if (assetPath == null || !assetPath.startsWith(ASSET_PREFIX + "previews/")) {
            return null;
        }
        File root = versionRoot(context);
        if (!wasValidated(root) && !isInstalled(context)) return null;
        String relative = assetPath.substring((ASSET_PREFIX + "previews/").length());
        if (relative.isEmpty() || relative.contains("\\") || relative.contains("..")
                || relative.indexOf('\0') >= 0) return null;
        try {
            File file = new File(root, "previews/" + relative);
            String rootPath = root.getCanonicalPath() + File.separator;
            if (!file.getCanonicalPath().startsWith(rootPath) || !file.isFile()) return null;
            return file;
        } catch (IOException ignored) {
            return null;
        }
    }

    public static void ensureInstalled(Context context, Progress progress) throws Exception {
        synchronized (INSTALL_LOCK) {
            if (isInstalled(context)) return;
            File parent = previewsParent(context);
            File archive = new File(parent, VERSION + ".zip.part");
            File staging = new File(parent, ".staging-" + VERSION);
            deleteRecursively(staging);
            archive.delete();
            download(archive, progress);
            if (progress != null) progress.preparing();
            try {
                installVerifiedArchiveLocked(context, archive);
            } finally {
                archive.delete();
            }
        }
    }

    /** Installs an already authenticated archive. Package-private for filesystem behavior tests. */
    static void installVerifiedArchive(Context context, File archive) throws Exception {
        synchronized (INSTALL_LOCK) {
            installVerifiedArchiveLocked(context, archive);
        }
    }

    private static void installVerifiedArchiveLocked(Context context, File archive) throws Exception {
        File parent = previewsParent(context);
        File staging = new File(parent, ".staging-" + VERSION);
        deleteRecursively(staging);
        extractValidated(archive, staging);
        File marker = new File(staging, ".complete");
        File index = new File(staging, INDEX_FILE);
        try {
            writeUtf8(marker, sha256(index) + "\n");
        } catch (Exception failure) {
            deleteRecursively(staging);
            throw failure;
        }
        validateInstalledBundle(staging);
        File destination = versionRoot(context);
        File oldDestination = new File(parent, VERSION + ".old");
        deleteRecursively(oldDestination);
        forgetValidated();
        if (destination.exists() && !destination.renameTo(oldDestination)) {
            deleteRecursively(staging);
            throw new IOException("Cannot stage existing preview bundle");
        }
        if (!staging.renameTo(destination)) {
            if (oldDestination.isDirectory()) oldDestination.renameTo(destination);
            deleteRecursively(staging);
            throw new IOException("Cannot commit preview bundle");
        }
        try {
            validateInstalledBundle(destination);
            rememberValidated(destination);
            deleteRecursively(oldDestination);
            pruneOlderVersionDirectories(parent);
        } catch (Exception failure) {
            deleteRecursively(destination);
            if (oldDestination.isDirectory()) oldDestination.renameTo(destination);
            throw failure;
        }
    }

    private static void download(File destination, Progress progress) throws Exception {
        HttpURLConnection connection = null;
        boolean verified = false;
        try {
            URL url = new URL(URL);
            if (!"https".equalsIgnoreCase(url.getProtocol())) {
                throw new IOException("HTTPS is required");
            }
            connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("Accept", "application/zip, application/octet-stream");
            int response = connection.getResponseCode();
            if (response < 200 || response >= 300) throw new IOException("Preview HTTP " + response);
            if (!"https".equalsIgnoreCase(connection.getURL().getProtocol())) {
                throw new IOException("Preview redirect must use HTTPS");
            }
            long length = connection.getContentLengthLong();
            if (length > MAX_COMPRESSED_BYTES) throw new IOException("Preview bundle is too large");
            try (InputStream input = connection.getInputStream()) {
                copyBounded(input, destination, MAX_COMPRESSED_BYTES, progress,
                        length > 0 ? length : -1L);
            }
            if (!SHA256.equals(sha256(destination))) {
                throw new IOException("Preview bundle SHA-256 mismatch");
            }
            verified = true;
        } finally {
            if (connection != null) connection.disconnect();
            if (!verified) destination.delete();
        }
    }

    private static void extractValidated(File archive, File staging) throws Exception {
        if (!staging.mkdirs()) throw new IOException("Cannot create preview staging directory");
        long expanded = 0L;
        long previewBytes = 0L;
        int entries = 0;
        int previewEntries = 0;
        List<String> previewIndex = new ArrayList<String>();
        try (ZipFile zip = new ZipFile(archive)) {
            for (java.util.Enumeration<? extends ZipEntry> it = zip.entries(); it.hasMoreElements();) {
                ZipEntry entry = it.nextElement();
                if (entry.isDirectory()) continue;
                entries++;
                if (entries > MAX_ENTRY_COUNT) throw new IOException("Too many preview files");
                String name = entry.getName();
                if (!isSafeEntry(name)) throw new IOException("Unsafe preview path");
                long declared = entry.getSize();
                if (declared > MAX_ENTRY_BYTES) throw new IOException("Preview file is too large");
                File output = new File(staging, name);
                File parent = output.getParentFile();
                if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
                    throw new IOException("Cannot create preview directory");
                }
                try (InputStream input = zip.getInputStream(entry)) {
                    long copied = copyBounded(input, output, MAX_ENTRY_BYTES,
                            null, -1L);
                    expanded += copied;
                    if (name.startsWith("previews/")) {
                        previewEntries++;
                        previewBytes += copied;
                        previewIndex.add(copied + "\t" + name);
                    }
                    if (expanded > MAX_EXPANDED_BYTES) {
                        throw new IOException("Preview bundle expands beyond limit");
                    }
                }
            }
        } catch (Exception failure) {
            deleteRecursively(staging);
            throw failure;
        }
        File manifestFile = new File(staging, "manifest.json");
        if (entries < 2 || !manifestFile.isFile()
                || !new File(staging, "previews").isDirectory()) {
            deleteRecursively(staging);
            throw new IOException("Preview bundle is incomplete");
        }
        try {
            JSONObject manifest = new JSONObject(readUtf8(manifestFile));
            if (manifest.getInt("schemaVersion") != 1
                    || !VERSION.equals(manifest.getString("bundleVersion"))
                    || manifest.getInt("previewCount") != previewEntries
                    || manifest.getLong("totalUncompressedBytes") != previewBytes) {
                throw new IOException("Preview manifest does not match bundle contents");
            }
        } catch (Exception failure) {
            deleteRecursively(staging);
            throw failure;
        }
        try {
            Collections.sort(previewIndex);
            writeUtf8(new File(staging, INDEX_FILE), joinLines(previewIndex));
        } catch (Exception failure) {
            deleteRecursively(staging);
            throw failure;
        }
    }

    private static void validateInstalledBundle(File root) throws Exception {
        File marker = new File(root, ".complete");
        File manifestFile = new File(root, "manifest.json");
        File indexFile = new File(root, INDEX_FILE);
        File previewsRoot = new File(root, "previews");
        if (!marker.isFile() || !manifestFile.isFile() || !indexFile.isFile()
                || !previewsRoot.isDirectory()) {
            throw new IOException("Preview bundle is incomplete");
        }
        if (marker.length() < 64L || marker.length() > 128L
                || manifestFile.length() <= 0L || manifestFile.length() > MAX_MANIFEST_BYTES
                || indexFile.length() <= 0L || indexFile.length() > MAX_INDEX_BYTES) {
            throw new IOException("Preview metadata has invalid size");
        }
        JSONObject manifest = new JSONObject(readUtf8(manifestFile));
        int expectedCount = manifest.getInt("previewCount");
        long expectedBytes = manifest.getLong("totalUncompressedBytes");
        if (manifest.getInt("schemaVersion") != 1
                || !VERSION.equals(manifest.getString("bundleVersion"))
                || expectedCount <= 0 || expectedCount >= MAX_ENTRY_COUNT
                || expectedBytes <= 0L || expectedBytes > MAX_EXPANDED_BYTES) {
            throw new IOException("Preview manifest is invalid");
        }

        String recordedIndexHash = readUtf8(marker).trim();
        if (recordedIndexHash.length() != 64
                || !recordedIndexHash.equalsIgnoreCase(sha256(indexFile))) {
            throw new IOException("Preview index is not committed");
        }
        Map<String, Long> expectedFiles = parseIndex(indexFile, expectedCount, expectedBytes);

        String rootPath = root.getCanonicalPath() + File.separator;
        int actualCount = 0;
        long actualBytes = 0L;
        Deque<File> pending = new ArrayDeque<File>();
        pending.add(previewsRoot);
        while (!pending.isEmpty()) {
            File directory = pending.removeFirst();
            File[] children = directory.listFiles();
            if (children == null) throw new IOException("Cannot inspect preview directory");
            for (File child : children) {
                if (!child.getCanonicalPath().startsWith(rootPath)) {
                    throw new IOException("Preview path escapes cache root");
                }
                if (child.isDirectory()) {
                    pending.addLast(child);
                    continue;
                }
                String relative = root.toURI().relativize(child.toURI()).getPath();
                if (!child.isFile() || !isSafeEntry(relative)) {
                    throw new IOException("Unexpected preview cache entry");
                }
                long length = child.length();
                Long expectedLength = expectedFiles.remove(relative);
                if (expectedLength == null || length != expectedLength.longValue()
                        || length <= 0L || length > MAX_ENTRY_BYTES) {
                    throw new IOException("Preview cache entry has invalid size");
                }
                actualCount++;
                actualBytes += length;
                if (actualCount > expectedCount || actualBytes > expectedBytes) {
                    throw new IOException("Preview cache exceeds manifest");
                }
            }
        }
        if (!expectedFiles.isEmpty() || actualCount != expectedCount
                || actualBytes != expectedBytes) {
            throw new IOException("Preview cache does not match manifest");
        }
    }

    private static Map<String, Long> parseIndex(File indexFile, int expectedCount,
            long expectedBytes) throws Exception {
        Map<String, Long> files = new HashMap<String, Long>();
        long bytes = 0L;
        String text = readUtf8(indexFile);
        for (String line : text.split("\n")) {
            if (line.endsWith("\r")) line = line.substring(0, line.length() - 1);
            if (line.isEmpty()) continue;
            int separator = line.indexOf('\t');
            if (separator <= 0 || separator == line.length() - 1) {
                throw new IOException("Invalid preview index entry");
            }
            long length;
            try {
                length = Long.parseLong(line.substring(0, separator));
            } catch (NumberFormatException failure) {
                throw new IOException("Invalid preview index size", failure);
            }
            String path = line.substring(separator + 1);
            if (!isSafeEntry(path) || length <= 0L || length > MAX_ENTRY_BYTES
                    || files.put(path, Long.valueOf(length)) != null) {
                throw new IOException("Invalid preview index path");
            }
            bytes += length;
            if (files.size() > expectedCount || bytes > expectedBytes) {
                throw new IOException("Preview index exceeds manifest");
            }
        }
        if (files.size() != expectedCount || bytes != expectedBytes) {
            throw new IOException("Preview index does not match manifest");
        }
        return files;
    }

    private static synchronized void rememberValidated(File root) throws IOException {
        File marker = new File(root, ".complete");
        File manifest = new File(root, "manifest.json");
        validatedRootPath = root.getCanonicalPath();
        validatedMarkerModified = marker.lastModified();
        validatedManifestModified = manifest.lastModified();
        validatedManifestLength = manifest.length();
    }

    private static synchronized boolean wasValidated(File root) {
        if (validatedRootPath == null) return false;
        try {
            File marker = new File(root, ".complete");
            File manifest = new File(root, "manifest.json");
            return validatedRootPath.equals(root.getCanonicalPath())
                    && marker.isFile() && manifest.isFile()
                    && marker.lastModified() == validatedMarkerModified
                    && manifest.lastModified() == validatedManifestModified
                    && manifest.length() == validatedManifestLength;
        } catch (IOException ignored) {
            return false;
        }
    }

    private static synchronized void forgetValidated() {
        validatedRootPath = null;
        validatedMarkerModified = 0L;
        validatedManifestModified = 0L;
        validatedManifestLength = 0L;
    }

    private static boolean isSafeEntry(String name) {
        return name.equals("manifest.json") || (name.startsWith("previews/")
                && !name.endsWith("/") && !name.contains("\\") && !name.contains("..")
                && name.indexOf('\0') < 0
                && (name.endsWith(".jpg") || name.endsWith(".jpeg")
                || name.endsWith(".png") || name.endsWith(".webp")));
    }

    private static long copyBounded(InputStream input, File destination, long limit,
            Progress progress, long totalBytes) throws IOException {
        long total = 0L;
        byte[] buffer = new byte[32 * 1024];
        try (FileOutputStream output = new FileOutputStream(destination, false)) {
            int read;
            while ((read = input.read(buffer)) >= 0) {
                if (read == 0) continue;
                total += read;
                if (total > limit) throw new IOException("Preview data exceeds size limit");
                output.write(buffer, 0, read);
                if (progress != null) progress.update(total, totalBytes);
            }
            output.flush();
            output.getFD().sync();
        }
        if (total == 0L) throw new IOException("Preview data is empty");
        return total;
    }

    private static File previewsParent(Context context) {
        File parent = new File(context.getFilesDir(), "custom-theme-gallery/previews");
        if (!parent.isDirectory() && !parent.mkdirs()) {
            throw new IllegalStateException("Cannot create preview directory");
        }
        return parent;
    }

    private static File versionRoot(Context context) {
        return new File(previewsParent(context), VERSION);
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

    private static String readUtf8(File file) throws IOException {
        byte[] bytes = new byte[(int) file.length()];
        int offset = 0;
        try (InputStream input = new FileInputStream(file)) {
            while (offset < bytes.length) {
                int read = input.read(bytes, offset, bytes.length - offset);
                if (read < 0) break;
                offset += read;
            }
        }
        if (offset != bytes.length) throw new IOException("Cannot read preview manifest");
        return new String(bytes, java.nio.charset.StandardCharsets.UTF_8);
    }

    private static void writeUtf8(File file, String value) throws IOException {
        byte[] bytes = value.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        try (FileOutputStream output = new FileOutputStream(file, false)) {
            output.write(bytes);
            output.flush();
            output.getFD().sync();
        }
    }

    private static String joinLines(List<String> lines) {
        StringBuilder result = new StringBuilder();
        for (String line : lines) result.append(line).append('\n');
        return result.toString();
    }

    private static void deleteRecursively(File file) {
        if (file == null || !file.exists()) return;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) deleteRecursively(child);
        file.delete();
    }

    private static void pruneOlderVersionDirectories(File parent) {
        long currentVersion = numericVersion(VERSION);
        if (currentVersion < 0L) return;
        try {
            File[] children = parent.listFiles();
            if (children == null) return;
            for (File child : children) {
                long candidateVersion = numericVersion(child.getName());
                if (!child.isDirectory() || candidateVersion < 0L
                        || candidateVersion >= currentVersion) {
                    continue;
                }
                deleteVersionTreeSafely(parent, child);
            }
        } catch (Throwable ignored) {
            // An installed current bundle remains valid when legacy cleanup is unavailable.
        }
    }

    private static long numericVersion(String value) {
        if (value == null || value.length() < 2 || value.charAt(0) != 'v') return -1L;
        for (int index = 1; index < value.length(); index++) {
            if (!Character.isDigit(value.charAt(index))) return -1L;
        }
        try {
            return Long.parseLong(value.substring(1));
        } catch (NumberFormatException ignored) {
            return -1L;
        }
    }

    private static void deleteVersionTreeSafely(File root, File file) {
        try {
            File canonicalRoot = root.getCanonicalFile();
            File canonicalFile = file.getCanonicalFile();
            File canonicalParent = file.getParentFile().getCanonicalFile();
            File expectedFile = new File(canonicalParent, file.getName()).getAbsoluteFile();
            String rootPath = canonicalRoot.getPath() + File.separator;
            if (!canonicalFile.equals(expectedFile)
                    || !canonicalFile.getPath().startsWith(rootPath)) {
                return;
            }
            File[] children = file.listFiles();
            if (children != null) {
                for (File child : children) deleteVersionTreeSafely(root, child);
            }
            file.delete();
        } catch (IOException | SecurityException ignored) {
            // Never follow an unexpected filesystem edge while pruning old preview versions.
        }
    }
}
