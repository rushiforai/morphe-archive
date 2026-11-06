package app.template.extension.pinterest;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/** Video download handler, adapted from archivesteak/Quest (GPL-3.0). */
public final class MenuDownloadPatch {
    private static final String TAG = "ProteusPinterest";
    private static final ThreadLocal<Boolean> HANDLED = new ThreadLocal<>();
    private MenuDownloadPatch() {}

    /** Called just before the app handles its Download image menu item. */
    public static void onDownloadClick(Context context, Object pin) {
        HANDLED.remove();
        if (context == null || pin == null) return;
        try {
            List<Map<String, ?>> lists = new ArrayList<>();
            add(lists, PinModel.getVideoList(pin));
            try {
                addPages(lists, PinModel.getStoryPages(pin));
                addPages(lists, PinModel.getStoryPagesPreview(pin));
            } catch (RuntimeException error) {
                Log.w(TAG, "Couldn't inspect all Idea Pin pages", error);
                if (lists.isEmpty()) throw error;
            }
            if (lists.isEmpty()) return; // Keep Pinterest's own image downloader.
            HANDLED.set(Boolean.TRUE);
            String hlsCandidate = null;
            for (Map<String, ?> list : lists) {
                Map<String, String> urls = new LinkedHashMap<>();
                for (Map.Entry<String, ?> entry : list.entrySet()) {
                    Object encoding = entry.getValue();
                    if (encoding != null) urls.put(entry.getKey(), PinModel.getVideoUrl(encoding));
                }
                String direct = PinterestVideoUrls.findMp4(urls);
                if (direct != null) {
                    enqueue(context, direct);
                    return;
                }
                for (String url : urls.values()) {
                    if (hlsCandidate == null) hlsCandidate = PinterestVideoUrls.hlsCandidate(url);
                }
            }
            if (hlsCandidate == null) {
                Toast.makeText(context, "No downloadable MP4 is available for this video", Toast.LENGTH_LONG).show();
                return;
            }
            checkCandidate(context.getApplicationContext(), hlsCandidate);
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not inspect Pinterest media", error);
            // If inspection fails, don't silently save a video Pin's cover image.
            HANDLED.set(Boolean.TRUE);
            Toast.makeText(context, "Could not inspect this Pin's media", Toast.LENGTH_LONG).show();
        }
    }

    /** Suppress the app's image download only if this tap was handled as video. */
    public static boolean onAppDownload(Object onDone) {
        boolean handled = Boolean.TRUE.equals(HANDLED.get());
        HANDLED.remove();
        if (!handled) return false;
        try {
            Class.forName("kotlin.jvm.functions.Function0").getMethod("invoke").invoke(onDone);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Could not close download menu", error);
        }
        return true;
    }

    private static void add(List<Map<String, ?>> lists, Map<String, ?> value) {
        if (value != null && !value.isEmpty()) lists.add(value);
    }

    private static void addPages(List<Map<String, ?>> lists, List<?> pages) {
        if (pages == null) return;
        for (Object page : pages) {
            if (page == null) continue;
            add(lists, PinModel.getPageVideoList(page));
            List<?> blocks = PinModel.getPageBlocks(page);
            if (blocks != null) for (Object block : blocks) if (block != null) add(lists, PinModel.getBlockVideoList(block));
        }
    }

    private static void enqueue(Context context, String url) {
        DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
        if (manager == null) throw new IllegalStateException("Download manager unavailable");
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                .setMimeType("video/mp4")
                .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                .setDestinationInExternalPublicDir(Environment.DIRECTORY_MOVIES,
                        "Pinterest/pin-" + UUID.randomUUID() + ".mp4");
        manager.enqueue(request);
        Toast.makeText(context, "Downloading video", Toast.LENGTH_SHORT).show();
    }

    private static void checkCandidate(Context context, String url) {
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            boolean available = false;
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setRequestMethod("HEAD");
                connection.setConnectTimeout(10000);
                connection.setReadTimeout(10000);
                int response = connection.getResponseCode();
                String contentType = connection.getContentType();
                available = response >= 200 && response < 300 &&
                        PinterestVideoUrls.isTrustedMp4(connection.getURL().toString()) &&
                        (contentType == null || contentType.startsWith("video/") ||
                                contentType.startsWith("application/octet-stream"));
            } catch (Exception error) {
                Log.w(TAG, "Could not check video candidate", error);
            } finally {
                if (connection != null) connection.disconnect();
            }
            final boolean found = available;
            main.post(() -> {
                try {
                    if (found) enqueue(context, url);
                    else Toast.makeText(context, "No downloadable MP4 is available for this video", Toast.LENGTH_LONG).show();
                } catch (RuntimeException error) {
                    Log.w(TAG, "Could not enqueue video", error);
                    Toast.makeText(context, "Video download could not be started", Toast.LENGTH_LONG).show();
                }
            });
        }, "ProteusPinterestDownload").start();
    }
}
