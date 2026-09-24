package app.morphe.extension.shared.patches;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.UnknownHostException;
import java.net.URL;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import app.morphe.extension.shared.Logger;

/**
 * Unified CDN asset downloader for both authentic Google Fonts and AI/MDD models.
 * Handles atomic file writes (.tmp -> rename), retry logic with backoff,
 * content verification, permission adjustments, and concurrent download deduplication.
 */
public final class CdnAssetDownloader {
    private static final String TAG = "CdnAssetDownloader";
    private static final Set<String> ACTIVE_DOWNLOADS = Collections.synchronizedSet(new HashSet<>());
    private static final int BUFFER_SIZE = 16384;
    private static final int DEFAULT_MAX_RETRIES = 10;
    private static final int CONNECT_TIMEOUT_MS = 15000;
    private static final int READ_TIMEOUT_MS = 60000;
    // How long to wait after a DNS failure before retrying (DNS drops typically last ~60s)
    private static final long DNS_BACKOFF_MS = 35_000L;
    // How long to wait after a generic network error
    private static final long NET_BACKOFF_MS = 3_000L;

    private CdnAssetDownloader() {}

    /**
     * Downloads an asset from the given CDN URL to the destination file.
     * Uses atomic temporary file writes to prevent corrupted or partial downloads.
     *
     * @param urlStr   CDN URL
     * @param destFile Target destination file
     * @return true if destination file exists and is valid, false otherwise.
     */
    public static boolean download(String urlStr, File destFile) {
        return download(urlStr, destFile, DEFAULT_MAX_RETRIES);
    }

    /**
     * Downloads an asset with configurable retry count.
     */
    public static boolean download(String urlStr, File destFile, int maxRetries) {
        if (urlStr == null || urlStr.isEmpty() || destFile == null) {
            return false;
        }

        if (destFile.exists() && destFile.length() > 0) {
            return true;
        }

        String pathKey = destFile.getAbsolutePath();
        if (!ACTIVE_DOWNLOADS.add(pathKey)) {
            Logger.printDebug(() -> TAG + ": Download already in progress for " + destFile.getName());
            return false;
        }

        File parentDir = destFile.getParentFile();
        if (parentDir != null && !parentDir.exists()) {
            parentDir.mkdirs();
        }
        unlockDirectory(parentDir);

        File tempFile = new File(destFile.getAbsolutePath() + ".tmp");
        if (tempFile.exists()) {
            tempFile.delete();
        }

        try {
            for (int attempt = 1; attempt <= maxRetries; attempt++) {
                final int currentAttempt = attempt;
                try {
                    Logger.printDebug(() -> TAG + ": Downloading " + destFile.getName() + " from " + urlStr + " (attempt " + currentAttempt + "/" + maxRetries + ")");

                    URL url = new URL(urlStr);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Mobile)");
                    conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
                    conn.setReadTimeout(READ_TIMEOUT_MS);
                    conn.setInstanceFollowRedirects(true);

                    int responseCode = conn.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_MOVED_PERM || responseCode == HttpURLConnection.HTTP_MOVED_TEMP) {
                        String redirectUrl = conn.getHeaderField("Location");
                        if (redirectUrl != null && !redirectUrl.isEmpty()) {
                            conn.disconnect();
                            url = new URL(redirectUrl);
                            conn = (HttpURLConnection) url.openConnection();
                            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Mobile)");
                            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
                            conn.setReadTimeout(READ_TIMEOUT_MS);
                            responseCode = conn.getResponseCode();
                        }
                    }

                    if (responseCode >= 200 && responseCode < 300) {
                        long expectedLength = conn.getContentLengthLong();
                        long totalBytesRead = 0;

                        try (InputStream is = new BufferedInputStream(conn.getInputStream());
                             FileOutputStream fos = new FileOutputStream(tempFile)) {
                            byte[] buffer = new byte[BUFFER_SIZE];
                            int read;
                            while ((read = is.read(buffer)) != -1) {
                                fos.write(buffer, 0, read);
                                totalBytesRead += read;
                            }
                            fos.flush();
                        }

                        // Verify integrity against Content-Length if provided
                        if (expectedLength > 0 && totalBytesRead != expectedLength) {
                            final long finalBytesRead = totalBytesRead;
                            Logger.printInfo(() -> TAG + ": Incomplete download for " + destFile.getName() + " (read " + finalBytesRead + " of " + expectedLength + " bytes). Retrying...");
                            tempFile.delete();
                            Thread.sleep(1500);
                            continue;
                        }

                        if (tempFile.exists() && tempFile.length() > 0) {
                            if (destFile.exists()) {
                                destFile.delete();
                            }
                            boolean renamed = tempFile.renameTo(destFile);
                            if (renamed) {
                                destFile.setReadable(true, false);
                                destFile.setWritable(true, false);
                                final long finalSize = destFile.length();
                                Logger.printInfo(() -> TAG + ": Successfully downloaded " + destFile.getName() + " (" + finalSize + " bytes)");
                                return true;
                            } else {
                                Logger.printInfo(() -> TAG + ": Failed to rename temp file to " + destFile.getAbsolutePath());
                            }
                        }
                    } else {
                        final int finalStatusCode = responseCode;
                        Logger.printInfo(() -> TAG + ": HTTP " + finalStatusCode + " while downloading " + destFile.getName() + " from " + urlStr);
                    }
                } catch (Throwable t) {
                    Logger.printInfo(() -> TAG + ": Error downloading " + destFile.getName() + " on attempt " + currentAttempt + ": " + t.getMessage());
                    if (tempFile.exists()) {
                        tempFile.delete();
                    }
                    // DNS failures need a long wait — the router drop typically lasts 30-90s.
                    // Generic errors only need a short backoff.
                    boolean isDnsFailure = (t instanceof UnknownHostException)
                            || (t.getMessage() != null && t.getMessage().contains("No address associated with hostname"));
                    long waitMs = isDnsFailure ? DNS_BACKOFF_MS : (NET_BACKOFF_MS * attempt);
                    if (isDnsFailure) {
                        Logger.printInfo(() -> TAG + ": DNS failure detected, waiting " + (waitMs / 1000) + "s before retry...");
                    }
                    try {
                        Thread.sleep(waitMs);
                    } catch (InterruptedException ignored) {}
                }
            }
        } finally {
            if (tempFile.exists()) {
                tempFile.delete();
            }
            ACTIVE_DOWNLOADS.remove(pathKey);
        }

        return destFile.exists() && destFile.length() > 0;
    }

    /**
     * Unlocks file permissions for the given directory to ensure downloads can write.
     */
    public static void unlockDirectory(File dir) {
        if (dir == null || !dir.exists()) return;
        try {
            File parent = dir;
            while (parent != null && parent.getAbsolutePath().contains("datadownload")) {
                parent.setExecutable(true, false);
                parent = parent.getParentFile();
            }
            dir.setReadable(true, false);
            dir.setWritable(true, false);
            dir.setExecutable(true, false);
            File[] children = dir.listFiles();
            if (children != null) {
                for (File child : children) {
                    child.setReadable(true, false);
                    child.setWritable(true, false);
                    if (child.isDirectory()) {
                        child.setExecutable(true, false);
                    }
                }
            }
        } catch (Throwable ignored) {}
    }

    /**
     * Locks file permissions to read-only/executable to safeguard against GMS deletion.
     */
    public static void lockDirectory(File dir) {
        if (dir == null || !dir.exists()) return;
        try {
            File parent = dir;
            while (parent != null && parent.getAbsolutePath().contains("datadownload")) {
                parent.setExecutable(true, false);
                parent = parent.getParentFile();
            }
            File[] files = dir.listFiles();
            if (files != null) {
                for (File f : files) {
                    f.setWritable(false, false);
                    f.setReadable(true, false);
                    f.setExecutable(true, false);
                }
            }
            dir.setWritable(false, false);
            dir.setReadable(true, false);
            dir.setExecutable(true, false);
        } catch (Throwable ignored) {}
    }
}
