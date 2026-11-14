package app.hushmessenger.extension;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Sends a photo from the gallery as an Instant (#161). Messenger hands each press of the Instants shutter to one
 * callback with the camera's result, and the callback reads the photo out of it, squares it and sends it. With the
 * switch on, the patch asks [capture] first. It holds the press and opens the gallery, and once a photo is picked it runs
 * the callback again, where [frame] hands the pick over in place of the camera's photo. A back-out runs it with a
 * failing read, which is Messenger's own drop of a capture it couldn't use, so nothing is sent and the shutter is free.
 */
public final class InstantGallery {
    static final String KEY = "instant_gallery";
    /** The longest side a pick is decoded to, and the most a fitted pick is ever given. */
    static final int MAX_EDGE = 2048;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** One held press of the shutter: the callback, the camera's result, and the callback's name in this build. */
    static final class Press {
        final Object callback, frame;
        final String name;

        Press(Object callback, Object frame, String name) {
            this.callback = callback;
            this.frame = frame;
            this.name = name;
        }
    }

    /** The press waiting on the gallery. */
    private static Press held;
    /** A decoded pick waiting for the callback's first photo read. */
    private static Bitmap pending;
    /** The camera's thread whose press goes out with [pending], set when a press finds a pick still waiting. */
    private static Thread armed;
    /** The thread running a held press again, so its own entry check lets it through. */
    private static Thread replaying;
    /** The thread running a held press again to drop it. Its photo read fails. */
    private static Thread cancelling;

    /** One worker that decodes picks and runs held presses again, off the main thread like the camera's own. */
    static Executor work = background();

    private InstantGallery() {}

    private static Executor background() {
        ThreadPoolExecutor pool = new ThreadPoolExecutor(1, 1, 10, TimeUnit.SECONDS, new LinkedBlockingQueue<>(), task -> {
            Thread thread = new Thread(task, "HushInstantGallery");
            thread.setDaemon(true);
            return thread;
        });
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }

    static synchronized void resetForTests() {
        held = null;
        if (pending != null) pending.recycle();
        pending = null;
        armed = replaying = cancelling = null;
    }

    static synchronized boolean holding() { return held != null; }

    static synchronized boolean picked() { return pending != null; }

    /**
     * Asked at the top of the shutter's callback. 1 holds the press for the gallery, 0 lets the callback run as it is.
     * A press that finds a pick still waiting goes out with that pick.
     */
    public static int capture(Object callback, Object frame, String name) {
        try {
            Thread current = Thread.currentThread();
            Press abandoned;
            synchronized (InstantGallery.class) {
                if (current == replaying || current == cancelling) return 0;
                if (!Settings.enabled(KEY)) {
                    drop();
                    return 0;
                }
                if (pending != null) {
                    armed = current;
                    return 0;
                }
                abandoned = held;
                held = null;
            }
            // A press the gallery never answered (the pick screen was killed) gets dropped on the worker, so its slot frees up.
            if (abandoned != null) work.execute(() -> cancel(abandoned));
            Context context = Settings.appContext;
            Intent screen = context == null ? null : screenIntent(context);
            if (screen == null) {
                say(context, "gallery_missing");
                return 0;
            }
            synchronized (InstantGallery.class) { held = new Press(callback, frame, name); }
            try {
                context.startActivity(screen.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            } catch (ActivityNotFoundException | SecurityException refused) {
                synchronized (InstantGallery.class) { held = null; }
                say(context, "gallery_missing");
                return 0;
            }
            return 1;
        } catch (RuntimeException error) {
            synchronized (InstantGallery.class) { held = null; }
            Settings.hookFailedPrivately(KEY, "Couldn't open the gallery for an Instant", error);
            return 0;
        }
    }

    /**
     * Each photo read in the shutter's callback. The first read of a run that goes out with a pick gets the pick, fitted to
     * the camera's photo. Later reads get the camera's own photo, which the callback recycles. A run that drops its press
     * fails here, inside the callback's own catch.
     */
    public static Bitmap frame(Bitmap camera) {
        Thread current = Thread.currentThread();
        Bitmap pick;
        synchronized (InstantGallery.class) {
            if (current == cancelling) throw new IllegalStateException("the gallery closed without a pick");
            if (pending == null || (current != replaying && current != armed)) return camera;
            pick = pending;
            pending = null;
            armed = null;
        }
        try {
            return fitted(pick, camera);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't fit the picked photo", error);
            throw error;
        }
    }

    /** The pick screen when Android knows it under this package's own name and a gallery app answers a photo pick, otherwise null. */
    static Intent screenIntent(Context context) {
        if (pickIntent(context) == null) return null;
        String own = context.getPackageName();
        Intent intent = new Intent().setClassName(own, InstantPickActivity.class.getName());
        ResolveInfo screen = context.getPackageManager().resolveActivity(intent, 0);
        // A Root Mount install keeps the stock manifest, so the screen isn't there and the camera's photo goes out.
        if (screen == null || screen.activityInfo == null || !own.equals(screen.activityInfo.packageName)) return null;
        return intent;
    }

    /** A photo pick when a gallery app answers one, else a get-content for a photo, else null. One photo, never a video. */
    @android.annotation.SuppressLint("QueryPermissionsNeeded")
    static Intent pickIntent(Context context) {
        if (context == null) return null;
        PackageManager packages = context.getPackageManager();
        Intent photo = new Intent(Intent.ACTION_PICK).setType("image/*");
        if (packages.resolveActivity(photo, PackageManager.MATCH_DEFAULT_ONLY) != null) return photo;
        Intent content = new Intent(Intent.ACTION_GET_CONTENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE);
        return packages.resolveActivity(content, PackageManager.MATCH_DEFAULT_ONLY) != null ? content : null;
    }

    /**
     * The pick screen's answer, on the worker: decodes the photo, then runs the held press again with it. [done] runs
     * after, so the pick screen (whose read grant the decode needs) stays until then.
     */
    static void picked(Context context, Uri uri, Runnable done) {
        work.execute(() -> {
            try {
                Bitmap photo;
                try {
                    photo = decode(context, uri);
                } catch (IOException | RuntimeException | OutOfMemoryError unreadable) {
                    if (!(unreadable instanceof IOException)) Settings.hookFailedPrivately(KEY, "Couldn't read the picked photo", unreadable);
                    say(context, "gallery_failed");
                    Press press = take();
                    if (press != null) cancel(press);
                    return;
                }
                // The switch can go off, or Pause come on, while the gallery is open.
                boolean on = Settings.wouldUse(KEY);
                Press press;
                synchronized (InstantGallery.class) {
                    press = held;
                    held = null;
                    if (press != null && on) {
                        if (pending != null) pending.recycle();
                        pending = photo;
                    }
                }
                if (press == null || !on) {
                    photo.recycle();
                    if (press != null) cancel(press);
                    return;
                }
                replay(press, false);
                // Messenger had already let go of that press, so the pick waits for the next one.
                if (picked()) say(context, "instant_gallery_shutter");
            } finally {
                MAIN.post(done);
            }
        });
    }

    /** The pick screen closed with nothing picked: the held press is dropped and the shutter frees up. */
    static void canceled() {
        Press press = take();
        if (press != null) work.execute(() -> cancel(press));
    }

    private static synchronized Press take() {
        Press press = held;
        held = null;
        return press;
    }

    /** Off or paused: nothing waits and nothing is held. A held press is dropped through Messenger's own catch. */
    private static void drop() {
        Press press = held;
        held = null;
        if (pending != null) pending.recycle();
        pending = null;
        armed = null;
        if (press != null) work.execute(() -> cancel(press));
    }

    private static void cancel(Press press) { replay(press, true); }

    /** Runs the callback again on this thread with [press]'s own result. */
    private static void replay(Press press, boolean cancel) {
        Thread current = Thread.currentThread();
        synchronized (InstantGallery.class) {
            if (cancel) cancelling = current;
            else replaying = current;
        }
        try {
            Method callback = callbackMethod(press.callback.getClass(), press.name, press.frame);
            if (callback == null) throw new IllegalStateException("the shutter's callback is gone");
            callback.setAccessible(true);
            callback.invoke(press.callback, press.frame);
        } catch (InvocationTargetException failed) {
            Settings.hookFailedPrivately(KEY, "The Instant didn't go out", failed.getCause() != null ? failed.getCause() : failed);
        } catch (ReflectiveOperationException | RuntimeException failed) {
            Settings.hookFailedPrivately(KEY, "Couldn't run the shutter again", failed);
        } finally {
            synchronized (InstantGallery.class) {
                if (cancel) cancelling = null;
                else replaying = null;
            }
        }
    }

    /** The instance method [name] on [type] or a superclass that takes one argument [frame] fits and returns nothing. */
    static Method callbackMethod(Class<?> type, String name, Object frame) {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) {
            for (Method method : at.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (method.getName().equals(name) && parameters.length == 1 && method.getReturnType() == void.class &&
                    !Modifier.isStatic(method.getModifiers()) && (frame == null || parameters[0].isInstance(frame))) return method;
            }
        }
        return null;
    }

    /** The picked photo, upright and no bigger than MAX_EDGE on its long side. */
    static Bitmap decode(Context context, Uri uri) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        try (InputStream input = open(context, uri)) { BitmapFactory.decodeStream(input, null, bounds); }
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) throw new IOException("not a picture");
        if ((long) bounds.outWidth * bounds.outHeight > AutoReplyPicture.MAX_SOURCE_PIXELS) throw new IOException("too many pixels");
        int orientation = ExifInterface.ORIENTATION_NORMAL;
        try (InputStream input = open(context, uri)) {
            orientation = new ExifInterface(input).getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL);
        } catch (IOException | RuntimeException noExif) {
            // A photo without readable EXIF goes out as it decodes.
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = AutoReplyPicture.sample(bounds.outWidth, bounds.outHeight, MAX_EDGE);
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        Bitmap decoded;
        try (InputStream input = open(context, uri)) { decoded = BitmapFactory.decodeStream(input, null, options); }
        if (decoded == null) throw new IOException("not a picture");
        Bitmap upright = AutoReplyPicture.upright(decoded, orientation);
        if (upright != decoded) decoded.recycle();
        return upright;
    }

    private static InputStream open(Context context, Uri uri) throws IOException {
        InputStream input = context.getContentResolver().openInputStream(uri);
        if (input == null) throw new IOException("the photo can't be opened");
        return input;
    }

    /**
     * [pick] cut to the camera photo's shape from its middle and sized like it (never over MAX_EDGE), as a new ARGB_8888
     * bitmap the callback can square, copy or recycle like its own. Recycles [pick].
     */
    static Bitmap fitted(Bitmap pick, Bitmap camera) {
        int width = pick.getWidth(), height = pick.getHeight();
        if (camera != null && !camera.isRecycled() && camera.getWidth() > 0 && camera.getHeight() > 0) {
            width = camera.getWidth();
            height = camera.getHeight();
        }
        int longest = Math.max(width, height);
        if (longest > MAX_EDGE) {
            width = Math.max(1, Math.round(width * (float) MAX_EDGE / longest));
            height = Math.max(1, Math.round(height * (float) MAX_EDGE / longest));
        }
        // The largest middle part of the pick with the target's shape.
        Rect from;
        if ((long) pick.getWidth() * height > (long) pick.getHeight() * width) {
            int cut = (int) ((long) pick.getHeight() * width / height);
            from = new Rect((pick.getWidth() - cut) / 2, 0, (pick.getWidth() - cut) / 2 + cut, pick.getHeight());
        } else {
            int cut = (int) ((long) pick.getWidth() * height / width);
            from = new Rect(0, (pick.getHeight() - cut) / 2, pick.getWidth(), (pick.getHeight() - cut) / 2 + cut);
        }
        Bitmap shaped = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        new Canvas(shaped).drawBitmap(pick, from, new Rect(0, 0, width, height), new Paint(Paint.FILTER_BITMAP_FLAG));
        pick.recycle();
        return shaped;
    }

    private static void say(Context context, String message) {
        if (context == null) return;
        MAIN.post(() -> Toast.makeText(context, new SettingsText(context).get(message), Toast.LENGTH_LONG).show());
    }
}
