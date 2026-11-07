package app.fakh.extension.linkedin;

import android.app.DownloadManager;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.TypedValue;
import android.widget.ImageButton;
import android.widget.Toast;

/** Saves media through the system DownloadManager, into the folder chosen in Fakh Patches. */
final class Downloads {

    private Downloads() {
    }

    /**
     * The download button of the media viewers, drawn like the app's own download button of a document: the app's
     * download icon in light gray on the viewer, with a ripple and no backdrop.
     */
    static ImageButton createButton(Context context) {
        ImageButton button = new ImageButton(context);
        button.setContentDescription("Download");
        Drawable icon = themeDrawable(context, context.getResources().getIdentifier(
                "voyagerIcUiDownloadMedium24dp", "attr", context.getPackageName()));
        if (icon == null) icon = context.getDrawable(android.R.drawable.stat_sys_download);
        button.setImageDrawable(icon);
        button.setColorFilter(0xFFE0E0E0);
        button.setBackground(themeDrawable(context, android.R.attr.selectableItemBackgroundBorderless));
        int padding = dp(context, 12);
        button.setPadding(padding, padding, padding, padding);
        return button;
    }

    /** The drawable a theme attribute points to, or null. */
    private static Drawable themeDrawable(Context context, int attr) {
        TypedValue value = new TypedValue();
        if (attr == 0 || !context.getTheme().resolveAttribute(attr, value, true) || value.resourceId == 0) return null;
        return context.getDrawable(value.resourceId);
    }

    static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
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
