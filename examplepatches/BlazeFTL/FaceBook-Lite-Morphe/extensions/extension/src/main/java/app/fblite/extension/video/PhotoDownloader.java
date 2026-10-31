package app.fblite.extension.video;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.widget.Toast;

import java.util.Locale;

import app.fblite.extension.settings.MorpheLog;

/** Saves a photo address into Pictures/Facebook Lite with the system download manager. */
final class PhotoDownloader {
    private static final String FOLDER = "Facebook Lite";

    private PhotoDownloader() {
    }

    static void start(Context context, String url, String base) {
        String path = Uri.parse(url).getPath();
        String lower = path == null ? "" : path.toLowerCase(Locale.ROOT);
        String extension = lower.endsWith(".png") ? ".png" : lower.endsWith(".webp") ? ".webp" : ".jpg";
        String mime = extension.equals(".png") ? "image/png" : extension.equals(".webp") ? "image/webp" : "image/jpeg";
        String name = base + extension;
        try {
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                    .setTitle(name)
                    .setMimeType(mime)
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_PICTURES, FOLDER + "/" + name);
            ((DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE)).enqueue(request);
            MorpheLog.log("video", "Downloading photo " + name + " from " + MorpheLog.url(url));
            toast(context, vi() ? "Đang tải ảnh vào Pictures/" + FOLDER : "Downloading photo to Pictures/" + FOLDER);
        } catch (Throwable t) {
            VideoFeatures.log("Photo download failed", t);
            toast(context, vi() ? "Tải ảnh thất bại" : "Photo download failed");
        }
    }

    private static boolean vi() {
        return "vi".equals(Locale.getDefault().getLanguage());
    }

    private static void toast(Context context, String text) {
        Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
    }
}
