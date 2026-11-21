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
            Object view = field(viewer, "imageViewerImage");
            if (!(view instanceof View)) return;
            View.OnLongClickListener listener = (v) -> {
                save(((View) view).getContext(), currentUrl);
                return true;
            };
            // The viewer's PhotoViewAttacher handles every touch on the image, so long presses
            // only reach a listener set on the attacher.
            Object attacher = field(viewer, "photoViewAttacher");
            if (attacher != null) {
                attacher.getClass().getMethod("setOnLongClickListener", View.OnLongClickListener.class)
                        .invoke(attacher, listener);
            } else {
                ((View) view).setOnLongClickListener(listener);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to attach image saving", ex);
        }
    }

    private static Object field(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
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
            Toast.makeText(context, Texts.t("Saving image to Pictures/Quora"), Toast.LENGTH_SHORT).show();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to save image", ex);
            Toast.makeText(context, Texts.t("Couldn't save the image"), Toast.LENGTH_SHORT).show();
        }
    }
}
