package app.morphe.extension.instants;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * "Go back" for the friends' Instants viewer: remembers the last Instant that was passed (its media
 * is downloaded to the app's private storage) and offers a pill button that replays it.
 *
 * The viewer shows the first unseen Instant of a friend; passing it marks it as seen and the next
 * one takes its place. The patch reports the viewer state on every composition, so a change of the
 * current Instant means the previous one was passed. Only the last passed Instant is kept: each
 * new pass deletes the media of the previous one, which also cleans up the previous friend's media
 * once a post of the next friend is passed.
 */
public final class InstantsGoBack {
    static final String TAG = "InstantsGoBack";
    private static final int PILL_ID = 0x57414749;
    private static final float PILL_Y_FRACTION = 0.552f; // vertical center, as a fraction of the screen height
    private static final String DIR = "instants_goback";
    private static final String USER_TYPE = "com.instagram.user.model.User";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();

    /** What is needed to show the last passed Instant again. */
    static final class Snapshot {
        String id;
        String username;
        long timeMillis;
        boolean video;
        String mediaUrl;
        String avatarUrl;
        File mediaFile;
        File avatarFile;
        volatile boolean ready;
        volatile boolean failed;
    }

    private static Object currentModel;
    private static String currentId;
    // True while the friends' viewer, and not the camera, is what the Home route shows.
    private static volatile boolean viewerOnScreen;
    private static Snapshot last;
    private static boolean consumed;
    private static boolean restored;
    private static View pill;

    private InstantsGoBack() {}

    // ---- tracking ------------------------------------------------------------------------

    /** Called on every composition of the viewer screen with its state. Must stay light. */
    public static void onState(Object state) {
        if (!viewerOnScreen) {
            viewerOnScreen = true;
            Log.i(TAG, "screen: viewer");
            MAIN.post(InstantsGalleryHelper::refreshVisibility);
        }
        Object model = InstantsSaveImage.currentModelOf(state);
        String id = model != null ? idOf(model) : null;
        synchronized (InstantsGoBack.class) {
            if (!restored) restore();
            if (!Objects.equals(id, currentId)) {
                Object previous = currentModel;
                String previousId = currentId;
                currentModel = model;
                currentId = id;
                if (previous != null && previousId != null) onPassed(previous, previousId);
                Log.i(TAG, "current item " + previousId + " -> " + id);
            } else {
                currentModel = model;
            }
        }
        MAIN.post(InstantsGoBack::applyPill);
    }

    /**
     * Called by the patched empty state of the viewer (no posts left to show). The Instant that was
     * on screen has been passed; the button stays hidden until new posts load.
     */
    public static void onEmpty() {
        synchronized (InstantsGoBack.class) {
            if (!restored) restore();
            if (currentId != null) {
                Object previous = currentModel;
                String previousId = currentId;
                currentModel = null;
                currentId = null;
                Log.i(TAG, "no posts left after " + previousId);
                if (previous != null) onPassed(previous, previousId);
            }
        }
        MAIN.post(InstantsGoBack::applyPill);
    }

    /** Called when the camera controls are composed: the camera is what Home shows now. */
    static void onCameraComposed() {
        if (viewerOnScreen) {
            viewerOnScreen = false;
            Log.i(TAG, "screen: camera");
            MAIN.post(InstantsGalleryHelper::refreshVisibility);
        }
        MAIN.post(InstantsGoBack::applyPill);
    }

    /** True while the friends' viewer, and not the camera, is what the Home route shows. */
    static boolean isViewerOnScreen() {
        return viewerOnScreen;
    }

    /** Called when the top route changes. */
    static void onRoute() {
        MAIN.post(InstantsGoBack::applyPill);
    }

    private static String idOf(Object model) {
        try {
            java.lang.reflect.Field field = model.getClass().getDeclaredField("A0B");
            field.setAccessible(true);
            Object value = field.get(model);
            if (value instanceof String) return (String) value;
        } catch (Throwable ignored) {
            // Fall through to the identity of the object.
        }
        return String.valueOf(System.identityHashCode(model));
    }

    private static void onPassed(Object model, String id) {
        final Snapshot snapshot = snapshotOf(model, id);
        if (snapshot == null) {
            Log.w(TAG, "passed item " + id + " has no readable media; keeping the previous one");
            return;
        }
        last = snapshot;
        consumed = false;
        Log.i(TAG, "passed " + id + " by " + snapshot.username + (snapshot.video ? " (video)" : " (photo)"));
        IO.execute(() -> {
            if (last != snapshot) return; // a newer item was passed meanwhile
            clearStorage();
            download(snapshot);
            persist();
            MAIN.post(InstantsGoBack::applyPill);
        });
    }

    private static Snapshot snapshotOf(Object model, String id) {
        InstantsSaveImage.Target target = InstantsSaveImage.targetOf(model);
        if (target == null || target.url == null) return null;
        Snapshot s = new Snapshot();
        s.id = id;
        s.video = target.video;
        s.mediaUrl = target.url;
        try {
            Object user = InstantsSaveImage.fieldOfType(model, USER_TYPE);
            if (user != null) {
                s.username = usernameOf(user);
                s.avatarUrl = avatarUrlOf(user);
            }
            s.timeMillis = timeOf(model);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to read the author", t);
        }
        return s;
    }

    // The username is the text the app shows next to the Instant ("Skip <username>").
    private static String usernameOf(Object user) throws Exception {
        try {
            Object value = user.getClass().getMethod("A88").invoke(user);
            if (value instanceof String && !((String) value).trim().isEmpty()) return (String) value;
        } catch (NoSuchMethodException ignored) {
            // Another build: nothing to show.
        }
        return null;
    }

    private static String avatarUrlOf(Object user) throws Exception {
        try {
            return InstantsSaveImage.urlOf(user.getClass().getMethod("A1f").invoke(user));
        } catch (NoSuchMethodException ignored) {
            return null;
        }
    }

    // The model keeps when the Instant was taken as a long; accept seconds or milliseconds.
    private static long timeOf(Object model) {
        try {
            java.lang.reflect.Field field = model.getClass().getDeclaredField("A01");
            field.setAccessible(true);
            long value = field.getLong(model);
            if (value > 1_000_000_000L && value < 4_000_000_000L) return value * 1000L;
            if (value > 1_000_000_000_000L && value < 4_000_000_000_000L) return value;
        } catch (Throwable ignored) {
            // Unknown: no time is shown.
        }
        return 0L;
    }

    // ---- storage ---------------------------------------------------------------------------

    private static File dir() {
        Activity activity = InstantsGalleryHelper.getActivity();
        if (activity == null) return null;
        File dir = new File(activity.getFilesDir(), DIR);
        return dir.isDirectory() || dir.mkdirs() ? dir : null;
    }

    private static void clearStorage() {
        File dir = dir();
        File[] files = dir != null ? dir.listFiles() : null;
        if (files != null) for (File f : files) f.delete();
    }

    private static void download(Snapshot s) {
        File dir = dir();
        if (dir == null) {
            s.failed = true;
            return;
        }
        try {
            File media = new File(dir, s.video ? "media.mp4" : "media.jpg");
            if (!fetch(s.mediaUrl, media, s.video ? "video/" : "image/")) {
                s.failed = true;
                return;
            }
            s.mediaFile = media;
            if (s.avatarUrl != null) {
                File avatar = new File(dir, "avatar.jpg");
                if (fetch(s.avatarUrl, avatar, "image/")) s.avatarFile = avatar;
            }
            s.ready = true;
            Log.i(TAG, "stored " + media.getName() + " (" + media.length() + " bytes)");
        } catch (Throwable t) {
            Log.e(TAG, "Unable to store the passed item", t);
            s.failed = true;
        }
    }

    private static boolean fetch(String url, File target, String expectedType) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(30000);
        String type = connection.getContentType();
        if (type == null || !type.startsWith(expectedType)) {
            Log.w(TAG, "unexpected content type " + type + " for " + target.getName());
            connection.disconnect();
            return false;
        }
        try (InputStream in = connection.getInputStream(); FileOutputStream out = new FileOutputStream(target)) {
            byte[] buffer = new byte[16 * 1024];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
        } catch (Throwable t) {
            target.delete();
            throw t;
        }
        return true;
    }

    private static void persist() {
        Snapshot s = last;
        File dir = dir();
        if (s == null || dir == null || !s.ready) return;
        try {
            JSONObject json = new JSONObject();
            json.put("id", s.id);
            json.put("username", s.username);
            json.put("time", s.timeMillis);
            json.put("video", s.video);
            json.put("media", s.mediaFile != null ? s.mediaFile.getName() : null);
            json.put("avatar", s.avatarFile != null ? s.avatarFile.getName() : null);
            json.put("consumed", consumed);
            try (FileOutputStream out = new FileOutputStream(new File(dir, "meta.json"))) {
                out.write(json.toString().getBytes("UTF-8"));
            }
        } catch (Throwable t) {
            Log.e(TAG, "Unable to save the state", t);
        }
    }

    // The last passed Instant survives a restart of the app.
    private static void restore() {
        restored = true;
        File dir = dir();
        if (dir == null) return;
        File meta = new File(dir, "meta.json");
        if (!meta.isFile()) return;
        try (FileInputStream in = new FileInputStream(meta)) {
            byte[] bytes = new byte[(int) meta.length()];
            int offset = 0;
            while (offset < bytes.length) {
                int read = in.read(bytes, offset, bytes.length - offset);
                if (read < 0) break;
                offset += read;
            }
            JSONObject json = new JSONObject(new String(bytes, "UTF-8"));
            File media = new File(dir, json.optString("media", ""));
            if (!media.isFile()) return;
            Snapshot s = new Snapshot();
            s.id = json.optString("id");
            s.username = json.isNull("username") ? null : json.optString("username");
            s.timeMillis = json.optLong("time");
            s.video = json.optBoolean("video");
            s.mediaFile = media;
            File avatar = new File(dir, json.optString("avatar", ""));
            s.avatarFile = avatar.isFile() ? avatar : null;
            s.ready = true;
            last = s;
            consumed = json.optBoolean("consumed");
            Log.i(TAG, "restored " + s.id);
        } catch (Throwable t) {
            Log.e(TAG, "Unable to restore the state", t);
        }
    }

    // ---- the pill ------------------------------------------------------------------------

    // Shown only on the friends' viewer, while it has a post on screen, once an Instant was passed
    // and the replay has not been used since. It disappears when the posts end and comes back when
    // new ones load.
    private static void applyPill() {
        Activity activity = InstantsGalleryHelper.getActivity();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        boolean show;
        synchronized (InstantsGoBack.class) {
            show = InstantsGalleryHelper.isHomeRoute() && viewerOnScreen && currentId != null
                    && last != null && !consumed;
        }
        View view = pill;
        if (view == null || view.getParent() == null) {
            if (!show) return;
            view = createPill(activity);
            if (view == null) return;
            pill = view;
        }
        view.setVisibility(show ? View.VISIBLE : View.GONE);
    }

    private static View createPill(Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return null;
        FrameLayout root = (FrameLayout) content;
        View existing = root.findViewById(PILL_ID);
        if (existing != null) return existing;

        Context ctx = activity;
        LinearLayout row = new LinearLayout(ctx);
        row.setId(PILL_ID);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(ctx, 16), dp(ctx, 9), dp(ctx, 20), dp(ctx, 9));
        GradientDrawable background = new GradientDrawable();
        background.setColor(0xF2262626);
        background.setCornerRadius(dp(ctx, 40));
        row.setBackground(background);
        row.setElevation(dp(ctx, 6));

        ImageView arrow = new ImageView(ctx);
        arrow.setImageDrawable(new UndoArrowDrawable());
        row.addView(arrow, new LinearLayout.LayoutParams(dp(ctx, 20), dp(ctx, 20)));

        TextView label = new TextView(ctx);
        label.setText(InstantsStrings.goBack(ctx));
        label.setTextColor(Color.WHITE);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        label.setSingleLine(true);
        LinearLayout.LayoutParams labelParams =
                new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        labelParams.leftMargin = dp(ctx, 10);
        row.addView(label, labelParams);

        row.setOnClickListener(v -> onPillClicked(activity));

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT);
        lp.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        lp.topMargin = Math.round(ctx.getResources().getDisplayMetrics().heightPixels * PILL_Y_FRACTION) - dp(ctx, 19);
        root.addView(row, lp);
        return row;
    }

    private static void onPillClicked(Activity activity) {
        final Snapshot s;
        synchronized (InstantsGoBack.class) {
            s = last;
            if (s == null) return;
            consumed = true;
        }
        IO.execute(InstantsGoBack::persist);
        applyPill();
        InstantsReplay.show(activity, s);
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    /** A left arrow with a hook, drawn with strokes (a 24 x 24 icon). */
    private static final class UndoArrowDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        UndoArrowDrawable() {
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            float s = getBounds().width() / 24f;
            paint.setStrokeWidth(2f * s);
            path.reset();
            path.moveTo(9 * s, 6 * s);
            path.lineTo(4 * s, 11 * s);
            path.lineTo(9 * s, 16 * s);
            path.moveTo(4 * s, 11 * s);
            path.lineTo(14 * s, 11 * s);
            path.quadTo(20 * s, 11 * s, 20 * s, 17 * s);
            canvas.drawPath(path, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
