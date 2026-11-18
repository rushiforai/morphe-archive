package app.jofslash.extension.quora;

import android.app.DownloadManager;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.lang.reflect.Field;

@SuppressWarnings("unused")
public final class SaveImagesPatch {

    private static final String TAG = "JoFSlashPatches";

    private static volatile String currentUrl;

    /**
     * Injection point: start of FullScreenImageViewer.openImage.
     *
     * @param viewer The FullScreenImageViewer.
     * @param url    The image being opened.
     */
    public static void onOpenImage(Object viewer, String url) {
        currentUrl = url;
        if (viewer == null) return;
        // openImage creates the image view on first use, so attach once it has run.
        new Handler(Looper.getMainLooper()).post(() -> attach(viewer));
    }

    private static void attach(Object viewer) {
        try {
            Field field = viewer.getClass().getDeclaredField("imageViewerImage");
            field.setAccessible(true);
            Object view = field.get(viewer);
            if (!(view instanceof View)) return;
            ((View) view).setOnLongClickListener((v) -> {
                save(v.getContext(), currentUrl);
                return true;
            });
        } catch (Exception ex) {
            Log.e(TAG, "Failed to attach image saving", ex);
        }
    }

    private static void save(Context context, String url) {
        if (context == null || url == null || url.isEmpty()) return;
        try {
            Uri uri = Uri.parse(url);
            String name = uri.getLastPathSegment();
            if (name == null || name.isEmpty()) name = "image";
            if (!name.matches(".*\\.(jpe?g|png|gif|webp)$")) name += ".jpg";

            DownloadManager.Request request = new DownloadManager.Request(uri)
                    .setTitle(name)
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_PICTURES, "Quora/" + name);
            DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            manager.enqueue(request);
            Toast.makeText(context, "Saving image to Pictures/Quora", Toast.LENGTH_SHORT).show();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to save image", ex);
            Toast.makeText(context, "Couldn't save the image", Toast.LENGTH_SHORT).show();
        }
    }
}
