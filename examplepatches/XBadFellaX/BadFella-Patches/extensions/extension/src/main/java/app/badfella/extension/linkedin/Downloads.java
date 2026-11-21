package app.badfella.extension.linkedin;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.webkit.MimeTypeMap;
import android.widget.Toast;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Saves media through the system DownloadManager, into the folder chosen in BadFella Patches. */
final class Downloads {
    private static final ExecutorService IMAGE_TYPE_WORKER = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private Downloads() {
    }

    /** Public directory for a file type, honoring the "split photos and videos" option. */
    static String baseDir(boolean video) {
        if (Settings.downloadSplitByType()) return video ? "Movies" : "Pictures";
        return Settings.downloadBaseDir();
    }

    /** Relative location shown to the user, such as "Pictures/LinkedIn". */
    static String location(boolean video) {
        String folder = Settings.downloadFolder();
        return folder.isEmpty() ? baseDir(video) : baseDir(video) + "/" + folder;
    }

    static boolean enqueue(Context context, String url, String baseName, boolean video) {
        if (video) return enqueue(context, url, baseName, true, "video/mp4", "mp4");
        Uri uri = Uri.parse(url);
        if (!"https".equals(uri.getScheme()) || !"media.licdn.com".equalsIgnoreCase(uri.getHost())) {
            return enqueue(context, url, baseName, false, "image/jpeg", "jpg");
        }
        Context app = context.getApplicationContext();
        IMAGE_TYPE_WORKER.execute(() -> {
            String mime = imageType(url);
            String extension = MimeTypeMap.getSingleton().getExtensionFromMimeType(mime);
            MAIN.post(() -> enqueue(app, url, baseName, false,
                    extension == null ? "image/jpeg" : mime, extension == null ? "jpg" : extension));
        });
        return true;
    }

    private static String imageType(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setRequestMethod("HEAD");
            connection.setConnectTimeout(2500);
            connection.setReadTimeout(2500);
            int status = connection.getResponseCode();
            String type = connection.getContentType();
            if (status >= 200 && status < 300 && type != null) {
                String mime = type.split(";", 2)[0].trim().toLowerCase(Locale.ROOT);
                if (mime.startsWith("image/")) return mime;
            }
        } catch (java.io.IOException ignored) {
            // The regular download can still succeed when the server doesn't answer HEAD.
        } finally {
            if (connection != null) connection.disconnect();
        }
        return "image/jpeg";
    }

    private static boolean enqueue(Context context, String url, String baseName, boolean video,
                                   String mime, String extension) {
        try {
            String fileName = "linkedin_" + baseName + "." + extension;
            String folder = Settings.downloadFolder();
            String subPath = folder.isEmpty() ? fileName : folder + "/" + fileName;
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                    .setTitle(fileName)
                    .setMimeType(mime)
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(baseDir(video), subPath);
            DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            manager.enqueue(request);
            return true;
        } catch (Throwable t) {
            Diagnostics.error("enqueue failed", t);
            toast(context, I18n.f("Download failed: %1$s", t.getMessage()));
            return false;
        }
    }

    static void toast(Context context, String text) {
        Toast.makeText(context, I18n.tr(text), Toast.LENGTH_SHORT).show();
    }

    static void toastStarted(Context context, int count, boolean video) {
        toast(context, count == 1
                ? I18n.f("Downloading to %1$s", location(video))
                : I18n.f("Downloading %1$s files to %2$s", count, location(video)));
    }
}
