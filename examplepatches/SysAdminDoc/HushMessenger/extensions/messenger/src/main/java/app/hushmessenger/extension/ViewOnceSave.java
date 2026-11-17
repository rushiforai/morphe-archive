package app.hushmessenger.extension;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.view.Gravity;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.io.IOException;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * A Save button on view-once photos and Quicksnap (#181, #5). With `Allow screenshots` on, Hush already lets the
 * phone's own screenshot through, but a view-once photo closes or gets unsent while you're still reaching for the
 * buttons, and the slide gesture closes it instead. So the viewer itself gets a Save pill: one tap writes what's on
 * screen into the phone's pictures under Pictures/Messenger. The pill hides itself for the moment of the capture, so
 * the saved picture is the media and nothing else. A video's frame is what's on screen at the tap, which is what a
 * screenshot gives too. Android 9 lets no app write to shared folders without the storage permission, so the pill
 * stays away there.
 */
final class ViewOnceSave {
    private ViewOnceSave() {}

    /** The switch under `Allow screenshots` in Privacy. Off until you ask for it. */
    static final String KEY = "save_view_once";
    static final String FOLDER = "Messenger";
    static final int HASH_CHARS = 12;
    /** Enough room for a thumb, clear of Messenger's own buttons on the other side. */
    static final int MARGIN_DP = 24;
    static final int PILL_CORNER_DP = 20;
    static final int PILL_SIDE_DP = 18;
    static final int PILL_TOP_DP = 10;
    /** So a second call on the same viewer doesn't stack a second pill. */
    static final String TAG = "hush_view_once_save";

    /** Takes the window's own pixels, media surfaces included. Tests swap it. */
    interface Shot {
        void of(Window window, Taken taken);
    }

    /** Where a saved picture goes. Tests swap it. */
    interface Gallery {
        void add(Context context, String name, Bitmap picture) throws IOException;
    }

    interface Taken {
        void shot(Bitmap picture);
    }

    static volatile Shot shot = ViewOnceSave::capture;
    static volatile Gallery gallery = new SharedPictures();
    static Executor writes = worker();

    /** Whether the viewer gets the pill: the switch is on, Hush is running, and this Android can write pictures. */
    static boolean wanted() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && Build.VERSION.SDK_INT >= 29 && Settings.running()
            && Settings.allowScreenshot() && prefs.getBoolean(KEY, false);
    }

    /**
     * Called with the viewer's window as Hush lets its screenshot through. Adds the Save pill once, after the window
     * has a decor to hang it on. Never throws: a viewer without a pill is still a viewer.
     */
    static void offer(Window window) {
        try {
            if (window == null || !wanted()) return;
            View decor = window.peekDecorView();
            if (!(decor instanceof ViewGroup)) return;
            ViewGroup root = (ViewGroup) decor;
            if (root.findViewWithTag(TAG) != null) return;
            root.post(() -> add(window, root));
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't offer a Save button on view-once media", error);
        }
    }

    private static void add(Window window, ViewGroup root) {
        try {
            if (root.findViewWithTag(TAG) != null || !wanted()) return;
            Context context = root.getContext();
            float density = density(context);
            TextView pill = new TextView(context);
            pill.setTag(TAG);
            pill.setText(new SettingsText(context).get("save_view_once_button"));
            pill.setTextSize(15);
            pill.setTextColor(0xFFFFFFFF);
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(PILL_CORNER_DP * density);
            shape.setColor(MaterialYouTheme.fds(0xFF0A7CFF));
            shape.setStroke(Math.max(1, (int) density), 0x55FFFFFF);
            pill.setBackground(shape);
            int side = (int) (PILL_SIDE_DP * density), top = (int) (PILL_TOP_DP * density);
            pill.setPadding(side, top, side, top);
            FrameLayout.LayoutParams where = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.END);
            int margin = (int) (MARGIN_DP * density);
            where.setMargins(margin, margin, margin, margin);
            pill.setOnClickListener(tapped -> save(window, pill));
            root.addView(pill, where);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't add a Save button on view-once media", error);
        }
    }

    /** The tap: the pill steps out of the picture, the window is copied, then the pill comes back. */
    static void save(Window window, View pill) {
        try {
            pill.setEnabled(false);
            pill.setVisibility(View.INVISIBLE);
            pill.post(() -> {
                try {
                    shot.of(window, picture -> back(pill, picture));
                } catch (Throwable error) {
                    back(pill, null);
                    Settings.hookFailedPrivately(KEY, "Can't copy a view-once picture", error);
                }
            });
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't save a view-once picture", error);
        }
    }

    private static void back(View pill, Bitmap picture) {
        pill.setVisibility(View.VISIBLE);
        pill.setEnabled(true);
        Context context = pill.getContext();
        if (picture == null) {
            said(context, "save_view_once_failed", null);
            return;
        }
        writes.execute(() -> keep(context, picture));
    }

    /** Writes the picture, then says where it went. Runs off the UI thread. */
    static void keep(Context context, Bitmap picture) {
        String folder = SharedPictures.folder();
        boolean saved = false;
        try {
            gallery.add(context, name(hash(picture), new Date()), picture);
            saved = true;
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't write a view-once picture", error);
        }
        said(context, saved ? "save_view_once_saved" : "save_view_once_failed", saved ? folder : null);
    }

    private static void said(Context context, String message, String folder) {
        Handler main = new Handler(Looper.getMainLooper());
        main.post(() -> {
            try {
                SettingsText text = new SettingsText(context);
                Toast.makeText(context, folder == null ? text.get(message) : text.get(message, folder),
                    Toast.LENGTH_LONG).show();
            } catch (Throwable unsaid) {
                // The picture is what matters; a missing toast isn't worth a report.
            }
        });
    }

    /** Like "View once 2026-11-16 14.05.33 3f9a0c1d2b4e.png". */
    static String name(String hash, Date when) {
        return "View once " + new SimpleDateFormat("yyyy-MM-dd HH.mm.ss", Locale.ROOT).format(when) + " " + hash + ".png";
    }

    static String hash(Bitmap picture) throws Exception {
        int[] pixels = new int[picture.getWidth() * picture.getHeight()];
        picture.getPixels(pixels, 0, picture.getWidth(), 0, 0, picture.getWidth(), picture.getHeight());
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] four = new byte[4];
        for (int pixel : pixels) {
            four[0] = (byte) (pixel >> 24);
            four[1] = (byte) (pixel >> 16);
            four[2] = (byte) (pixel >> 8);
            four[3] = (byte) pixel;
            digest.update(four);
        }
        StringBuilder hex = new StringBuilder();
        for (byte b : digest.digest()) hex.append(String.format(Locale.ROOT, "%02x", b & 0xFF));
        return hex.substring(0, HASH_CHARS);
    }

    /**
     * The window's own pixels. A view-once photo or video draws on a surface of its own, which a view's own draw never
     * reaches, so Android 8 and later copy the window itself and anything older falls back to drawing the decor.
     */
    static void capture(Window window, Taken taken) {
        View decor = window.peekDecorView();
        if (decor == null || decor.getWidth() <= 0 || decor.getHeight() <= 0) {
            taken.shot(null);
            return;
        }
        Bitmap picture = Bitmap.createBitmap(decor.getWidth(), decor.getHeight(), Bitmap.Config.ARGB_8888);
        if (Build.VERSION.SDK_INT < 26) {
            picture.eraseColor(Color.BLACK);
            decor.draw(new Canvas(picture));
            taken.shot(picture);
            return;
        }
        PixelCopy.request(window, picture, result -> taken.shot(result == PixelCopy.SUCCESS ? picture : null),
            new Handler(Looper.getMainLooper()));
    }

    static float density(Context context) {
        if (context == null) return 1f;
        float density = context.getResources().getDisplayMetrics().density;
        return density <= 0 ? 1f : density;
    }

    /** The phone's shared pictures through MediaStore, which needs no storage permission from Android 10 on. */
    @android.annotation.TargetApi(29)
    static final class SharedPictures implements Gallery {
        static String folder() {
            return "Pictures/" + FOLDER;
        }

        @Override public void add(Context context, String name, Bitmap picture) throws IOException {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "image/png");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, folder());
            // Other apps don't see it until the whole picture is in.
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            android.net.Uri item = resolver.insert(
                MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY), values);
            if (item == null) throw new IOException("MediaStore made no item");
            boolean done = false;
            try {
                try (OutputStream out = resolver.openOutputStream(item)) {
                    if (out == null) throw new IOException("MediaStore gave no stream");
                    if (!picture.compress(Bitmap.CompressFormat.PNG, 100, out)) throw new IOException("The picture wouldn't compress");
                }
                ContentValues finished = new ContentValues();
                finished.put(MediaStore.MediaColumns.IS_PENDING, 0);
                resolver.update(item, finished, null, null);
                done = true;
            } finally {
                if (!done) resolver.delete(item, null, null);
            }
        }
    }

    private static Executor worker() {
        ThreadPoolExecutor pool = new ThreadPoolExecutor(1, 1, 10, TimeUnit.SECONDS, new ArrayBlockingQueue<>(4), work -> {
            Thread thread = new Thread(work, "HushViewOnceSave");
            thread.setDaemon(true);
            return thread;
        });
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }
}
