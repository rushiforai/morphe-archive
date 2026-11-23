package app.ffn.extension;

import android.app.Application;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Disk cache for the app's API images (/api/image/id/v2: covers and avatars). The app fetches
 * every image again each time it is shown, through the same one-at-a-time API queue as everything else.
 * <p>
 * Files live in the app's cache directory, which Android trims when storage runs low.
 */
final class ImageCache {
    private static final String IMAGE_PATH = "/api/image/id/";
    /** Covers and avatars can change under the same id, so cached images expire. */
    private static final long MAX_AGE_MS = 7L * 24 * 60 * 60 * 1000;

    private static File directory;

    private ImageCache() {
    }

    /** Answers an image request from disk. Returns true if it was answered. */
    static boolean serve(Object request) {
        File file = fileFor(request);
        if (file == null || !file.isFile()) return false;
        if (System.currentTimeMillis() - file.lastModified() > MAX_AGE_MS) {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
            return false;
        }

        Bitmap bitmap = BitmapFactory.decodeFile(file.getPath());
        if (bitmap == null) {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
            return false;
        }
        RequestHooks.setResult(request, bitmap);
        RequestHooks.runCallbacks(request);
        Log.d(RequestHooks.TAG, "image from cache " + file.getName());
        return true;
    }

    /** Saves a successfully decoded image. */
    static void store(Object request) {
        File file = fileFor(request);
        if (file == null) return;
        Object result = RequestHooks.getResult(request);
        if (!(result instanceof Bitmap)) return;
        Bitmap bitmap = (Bitmap) result;
        if (bitmap.isRecycled()) return;

        File temp = new File(file.getPath() + ".tmp");
        try (OutputStream out = new FileOutputStream(temp)) {
            //noinspection deprecation (WEBP_LOSSY needs API 30; the app supports older versions)
            if (!bitmap.compress(Bitmap.CompressFormat.WEBP, 90, out)) throw new IOException("compress failed");
        } catch (IOException | RuntimeException e) {
            //noinspection ResultOfMethodCallIgnored
            temp.delete();
            return;
        }
        if (!temp.renameTo(file)) {
            //noinspection ResultOfMethodCallIgnored
            temp.delete();
        }
    }

    /** Cache file of an image request that decodes to a Bitmap, or null for any other request. */
    private static File fileFor(Object request) {
        String url = RequestHooks.url(request);
        if (url == null || !url.contains(IMAGE_PATH)) return null;
        if (!RequestHooks.decodesTo(request, Bitmap.class)) return null;
        File dir = directory();
        if (dir == null) return null;
        // The query (id, width, height) identifies the image; keep it readable in the file name.
        String name = url.substring(url.indexOf('?') + 1).replaceAll("[^A-Za-z0-9=&]", "_");
        return new File(dir, name + ".webp");
    }

    private static synchronized File directory() {
        if (directory == null) {
            Application app = currentApplication();
            if (app == null) return null;
            File dir = new File(app.getCacheDir(), "ffn-tao-images");
            if (!dir.isDirectory() && !dir.mkdirs()) return null;
            directory = dir;
        }
        return directory;
    }

    private static Application currentApplication() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (ReflectiveOperationException e) {
            return null;
        }
    }
}
