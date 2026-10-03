/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

public final class MediaTransfer {
    private static final String USER_AGENT =
            "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 " +
                    "Chrome/131 Mobile Safari/537.36";

    private MediaTransfer() {
    }

    public interface ProgressListener {
        void onProgress(long downloadedBytes, long totalBytes);
    }

    public static long download(
            MediaVariant variant,
            File target,
            ProgressListener progress
    ) throws Exception {
        if (variant == null || variant.url == null || variant.url.isEmpty()) {
            throw new IllegalArgumentException("Media variant has no URL");
        }
        File parent = target.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IllegalStateException("Could not create download cache");
        }
        if (target.exists() && !target.delete()) {
            throw new IllegalStateException("Could not replace cached media");
        }

        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(variant.url)
                    .openConnection();
            connection.setInstanceFollowRedirects(true);
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setRequestProperty(
                    "Referer",
                    "https://www.facebook.com/"
            );
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Accept-Encoding", "identity");

            int response = connection.getResponseCode();
            if (response == HttpURLConnection.HTTP_PARTIAL) {
                throw new IllegalStateException(
                        "Server returned partial media"
                );
            }
            if (response != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("HTTP " + response);
            }

            String responseType = connection.getContentType();
            String normalizedType = responseType == null
                    ? ""
                    : responseType.toLowerCase(Locale.US);
            if (normalizedType.startsWith("text/") ||
                    normalizedType.contains("json") ||
                    normalizedType.contains("xml") ||
                    normalizedType.startsWith("image/")) {
                throw new IllegalStateException(
                        "Server returned " + responseType
                );
            }

            long declaredBytes = connection.getContentLengthLong();
            if (progress != null) {
                progress.onProgress(0, declaredBytes);
            }

            long downloadedBytes = 0;
            try (InputStream input = connection.getInputStream();
                 FileOutputStream output = new FileOutputStream(target)) {
                byte[] buffer = new byte[64 * 1024];
                int count;
                while ((count = input.read(buffer)) >= 0) {
                    if (Thread.currentThread().isInterrupted()) {
                        throw new InterruptedException(
                                "Media download was cancelled"
                        );
                    }
                    if (count == 0) continue;
                    output.write(buffer, 0, count);
                    downloadedBytes += count;
                    if (progress != null) {
                        progress.onProgress(
                                downloadedBytes,
                                declaredBytes
                        );
                    }
                }
                output.getFD().sync();
            }

            long minimumBytes = variant.isAudio()
                    ? 8L * 1024L
                    : 128L * 1024L;
            if (downloadedBytes < minimumBytes) {
                throw new IllegalStateException(
                        "Downloaded media was too small"
                );
            }
            if (declaredBytes > 0 && downloadedBytes < declaredBytes) {
                throw new IllegalStateException(
                        "Download ended before the full media arrived"
                );
            }
            if (!looksLikeIsoBaseMedia(target)) {
                throw new IllegalStateException(
                        "Server returned an invalid media track"
                );
            }
            return downloadedBytes;
        } catch (Exception error) {
            if (target.exists()) {
                //noinspection ResultOfMethodCallIgnored
                target.delete();
            }
            throw error;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static boolean looksLikeIsoBaseMedia(File file) {
        byte[] header = new byte[12];
        try (FileInputStream input = new FileInputStream(file)) {
            int count = input.read(header);
            if (count < 12) return false;
            String box = new String(header, 4, 4, "US-ASCII");
            return "ftyp".equals(box) ||
                    "styp".equals(box) ||
                    "moof".equals(box);
        } catch (Throwable ignored) {
            return false;
        }
    }
}
