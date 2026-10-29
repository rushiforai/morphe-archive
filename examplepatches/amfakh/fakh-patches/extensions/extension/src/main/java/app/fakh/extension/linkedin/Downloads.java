package app.fakh.extension.linkedin;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.widget.Toast;

/** Saves media through the system DownloadManager, into the folder chosen in Fakh Patches. */
final class Downloads {

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
        try {
            String fileName = "linkedin_" + baseName + (video ? ".mp4" : ".jpg");
            String folder = Settings.downloadFolder();
            String subPath = folder.isEmpty() ? fileName : folder + "/" + fileName;
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                    .setTitle(fileName)
                    .setMimeType(video ? "video/mp4" : "image/jpeg")
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
