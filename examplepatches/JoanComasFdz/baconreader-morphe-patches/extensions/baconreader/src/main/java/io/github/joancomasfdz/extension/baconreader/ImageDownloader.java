// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;

/**
 * Downloads images to a cache folder, reporting the progress, so a progress bar can be shown
 * while they load. Glide, which shows them, does not report download progress.
 */
public final class ImageDownloader {
    public interface Listener {
        /**
         * @param received Bytes received so far.
         * @param total    Size of the image, or -1 when the server does not tell it.
         */
        void onProgress(long received, long total);

        void onDownloaded(File file);

        void onFailed();
    }

    private static final String CACHE_FOLDER = "revanced_comment_images";
    private static final long CACHE_MAX_BYTES = 100L * 1024 * 1024;
    private static final long PROGRESS_INTERVAL_MS = 100;
    private static final int TIMEOUT_MS = 15000;

    private static final ExecutorService DOWNLOADER = Executors.newFixedThreadPool(3);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /**
     * Downloads running, and the listeners waiting for them. Only used on the main thread.
     */
    private static final Map<String, List<Listener>> IN_PROGRESS = new HashMap<>();

    private ImageDownloader() {
    }

    /**
     * The cached file of an image, or null when it is not downloaded yet.
     */
    public static File cached(Context context, String url) {
        File file = cacheFile(context, url);
        return file.isFile() ? file : null;
    }

    /**
     * Downloads the image in the background. Must be called on the main thread, the listener is called on it.
     */
    public static void download(Context context, final String url, final Listener listener) {
        final File file = cacheFile(context, url);
        if (file.isFile()) {
            listener.onDownloaded(file);
            return;
        }

        // The comment can be shown again (scrolled back, refreshed) while its image downloads:
        // the new view follows the download already running.
        List<Listener> waiting = IN_PROGRESS.get(url);
        if (waiting != null) {
            waiting.add(listener);
            return;
        }
        final List<Listener> listeners = new ArrayList<>();
        listeners.add(listener);
        IN_PROGRESS.put(url, listeners);

        final Listener all = new Listener() {
            @Override
            public void onProgress(long received, long total) {
                for (Listener l : listeners) l.onProgress(received, total);
            }

            @Override
            public void onDownloaded(File downloaded) {
                IN_PROGRESS.remove(url);
                for (Listener l : listeners) l.onDownloaded(downloaded);
            }

            @Override
            public void onFailed() {
                IN_PROGRESS.remove(url);
                for (Listener l : listeners) l.onFailed();
            }
        };
        DOWNLOADER.execute(() -> {
            try {
                fetchWithRetry(url, file, all);
                file.setLastModified(System.currentTimeMillis());
                MAIN.post(() -> all.onDownloaded(file));
                trimCache(file.getParentFile());
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not download " + url, ex);
                MAIN.post(all::onFailed);
            }
        });
    }

    /**
     * Downloads, trying again after network errors and server errors.
     */
    private static void fetchWithRetry(String url, File file, Listener listener) throws Exception {
        for (int attempt = 1; ; attempt++) {
            try {
                fetch(url, file, listener);
                return;
            } catch (HttpStatusException ex) {
                // Missing or forbidden images will not appear by asking again.
                boolean retry = ex.status >= 500 || ex.status == 408 || ex.status == 429;
                if (!retry || attempt >= GlideUtils.MAX_ATTEMPTS) throw ex;
            } catch (java.io.IOException ex) {
                if (attempt >= GlideUtils.MAX_ATTEMPTS) throw ex;
            }
            final int failed = attempt;
            Logger.printInfo(() -> "Download failed (attempt " + failed + "), trying again: " + url);
            Thread.sleep(GlideUtils.RETRY_DELAY_MS * attempt);
        }
    }

    private static final class HttpStatusException extends Exception {
        final int status;

        HttpStatusException(int status) {
            super("HTTP " + status);
            this.status = status;
        }
    }

    private static void fetch(String url, File file, final Listener listener) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        File partial = new File(file.getPath() + ".part");
        try {
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            int status = connection.getResponseCode();
            if (status != HttpURLConnection.HTTP_OK) throw new HttpStatusException(status);

            final long total = connection.getContentLength();
            long received = 0;
            long lastReport = 0;
            try (InputStream in = connection.getInputStream(); OutputStream out = new FileOutputStream(partial)) {
                byte[] buffer = new byte[16 * 1024];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                    received += read;
                    long now = SystemClock.uptimeMillis();
                    if (now - lastReport >= PROGRESS_INTERVAL_MS) {
                        lastReport = now;
                        final long soFar = received;
                        MAIN.post(() -> listener.onProgress(soFar, total));
                    }
                }
            }
            if (!partial.renameTo(file)) throw new IllegalStateException("Could not save " + file);
        } finally {
            connection.disconnect();
            //noinspection ResultOfMethodCallIgnored
            partial.delete();
        }
    }

    private static File cacheFile(Context context, String url) {
        File folder = new File(context.getCacheDir(), CACHE_FOLDER);
        //noinspection ResultOfMethodCallIgnored
        folder.mkdirs();
        return new File(folder, sha1(url));
    }

    /**
     * Removes the oldest images while the cache is bigger than its limit.
     */
    private static synchronized void trimCache(File folder) {
        File[] files = folder == null ? null : folder.listFiles();
        if (files == null) return;
        long size = 0;
        for (File file : files) size += file.length();
        if (size <= CACHE_MAX_BYTES) return;

        Arrays.sort(files, Comparator.comparingLong(File::lastModified));
        for (File file : files) {
            if (size <= CACHE_MAX_BYTES) break;
            size -= file.length();
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    private static String sha1(String text) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-1").digest(text.getBytes("UTF-8"));
            StringBuilder hex = new StringBuilder();
            for (byte b : digest) hex.append(String.format("%02x", b));
            return hex.toString();
        } catch (Exception ex) {
            return Integer.toHexString(text.hashCode());
        }
    }
}
