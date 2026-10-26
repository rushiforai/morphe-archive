package app.morphe.extension.chmate;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.AtomicFile;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ListView;
import org.json.JSONObject;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.WeakHashMap;

/** Automatic logical anchors, independent of Android's version-specific Parcelable state.
 * Native restoration and explicit response links take precedence. No backup action is needed. */
public final class ReadingPosition {
    static final String ENABLED = "readingPositionRecovery";
    private static final WeakHashMap<Object, Session> SESSIONS = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final java.util.Map<String, int[]> LAYOUT_ANCHORS = new java.util.HashMap<>();
    private static long layoutDeadline;
    private static Anchor pausedAnchor;
    private static int pausedTask;
    private static long pausedAt;
    private static boolean pausedForConfiguration;
    private ReadingPosition() { }

    public static void register(Object fragment) {
        try {
            Session old = SESSIONS.remove(fragment);
            if (old != null) old.close();
            View root = (View) fragment.getClass().getMethod("getView").invoke(fragment);
            View list = FilterPosition.findList(root);
            XPostPreviewPosition.opening(list);
            if (!FeatureSwitches.enabled(ENABLED, true)) return;
            Activity activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (list == null || activity == null) return;
            Session session = new Session(fragment, activity, list);
            SESSIONS.put(fragment, session);
            list.getViewTreeObserver().addOnPreDrawListener(session);
            list.getViewTreeObserver().addOnScrollChangedListener(session);
            list.addOnAttachStateChangeListener(session);
        } catch (Exception error) { Log.w("HaiagaruPosition", "Cannot attach reading-position observer", error); }
    }

    public static void save(Object fragment) {
        Session session = SESSIONS.get(fragment);
        if (session != null) session.save();
    }

    static void saveActivity(Activity activity) {
        for (Session session : new java.util.ArrayList<>(SESSIONS.values())) {
            if (session.activity != activity) continue;
            session.save();
            try {
                Anchor anchor = session.anchor();
                if (anchor != null) {
                    pausedAnchor = new Anchor(anchor.key, anchor.url, anchor.explicit, anchor.number, anchor.offset, null);
                    pausedTask = activity.getTaskId();
                    pausedAt = android.os.SystemClock.uptimeMillis();
                    pausedForConfiguration = activity.isChangingConfigurations();
                }
            } catch (Exception ignored) { }
        }
    }

    static android.net.Uri captureForLayout(Activity activity) {
        android.net.Uri selected = null;
        for (Session session : new java.util.ArrayList<>(SESSIONS.values())) {
            if (session.activity != activity) continue;
            try {
                Anchor anchor = session.anchor();
                if (anchor == null) continue;
                session.save();
                LAYOUT_ANCHORS.put(anchor.key, new int[]{anchor.number, anchor.offset});
                layoutDeadline = android.os.SystemClock.uptimeMillis() + 30000;
                selected = android.net.Uri.parse(anchor.url);
            } catch (Exception error) { Log.w("HaiagaruPosition", "Cannot capture layout position", error); }
        }
        if (selected == null && pausedForConfiguration && pausedAnchor != null && pausedTask == activity.getTaskId()
                && android.os.SystemClock.uptimeMillis() - pausedAt < 5000) {
            LAYOUT_ANCHORS.put(pausedAnchor.key, new int[]{pausedAnchor.number, pausedAnchor.offset});
            layoutDeadline = android.os.SystemClock.uptimeMillis() + 30000;
            selected = android.net.Uri.parse(pausedAnchor.url);
        }
        return selected;
    }

    private static Object call(Object value, String method, Class<?>[] types, Object... args) throws Exception {
        Method target = value.getClass().getMethod(method, types);
        target.setAccessible(true);
        return target.invoke(value, args);
    }

    private static Object flow(Object model, String name, String accessor) throws Exception {
        return call(ResponseArchiveEntry.field(model, name), accessor, new Class<?>[0]);
    }

    private static Object response(Object row) throws Exception {
        if (row == null) return null;
        if (responseType(row.getClass().getName())) return row;
        for (Class<?> type = row.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !responseType(field.getType().getName())) continue;
                field.setAccessible(true);
                return field.get(row);
            }
        }
        return null;
    }

    private static boolean responseType(String name) {
        return name.equals("o.processAdDisplayErrorPostbackForUserError")
                || name.equals("o.BouncyCastleSocketAdapterCompanion") || name.equals("o.KeJ11");
    }

    private static int number(Object value) throws Exception {
        if (value == null) return -1;
        return ((Number) ResponseArchiveEntry.field(value,
                value.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion") ? "l" : "o")).intValue();
    }

    private static final class Anchor {
        final String key;
        final String url;
        final boolean explicit;
        final int number, offset;
        final Object adapter;
        Anchor(String key, String url, boolean explicit, int number, int offset, Object adapter) {
            this.url = url;
            this.key = key; this.explicit = explicit; this.number = number; this.offset = offset; this.adapter = adapter;
        }
    }

    private static final class Session implements ViewTreeObserver.OnPreDrawListener,
            ViewTreeObserver.OnScrollChangedListener, View.OnAttachStateChangeListener {
        final WeakReference<Object> fragment;
        final Activity activity;
        final View list;
        final long installed;
        final String version;
        long nextInspection;
        final Runnable delayedSave = this::save;
        String inspectedKey, written;
        boolean closed, restoring;

        Session(Object fragment, Activity activity, View list) throws Exception {
            this.fragment = new WeakReference<>(fragment); this.activity = activity; this.list = list;
            android.content.pm.PackageInfo info = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0);
            installed = info.lastUpdateTime;
            version = info.versionName;
        }

        Anchor anchor() throws Exception {
            Object owner = fragment.get();
            if (closed || owner == null || !list.isShown()) return null;
            Object adapter = call(list, "getAdapter", new Class<?>[0]);
            if (adapter == null) return null;
            Method item = list instanceof ListView ? adapter.getClass().getMethod("getItem", int.class)
                    : FilterPosition.findItem(adapter);
            item.setAccessible(true);
            ViewGroup children = (ViewGroup) list;
            for (int i = 0; i < children.getChildCount(); i++) {
                View child = children.getChildAt(i);
                if (child.getBottom() <= list.getPaddingTop()) continue;
                int index = list instanceof ListView ? ((ListView) list).getPositionForView(child)
                        : (Integer) call(list, "getChildAdapterPosition", new Class<?>[]{View.class}, child);
                if (index < 0) continue;
                Object post = response(item.invoke(adapter, index));
                int no = number(post);
                if (no < 1) continue;
                Object board;
                if (version.equals("0.8.10.191 dev")) board = ResponseArchiveEntry.field(owner, "W");
                else {
                    Object model = QuickFilterToolbar.findResponseViewModel(owner);
                    board = version.equals("0.8.10.226 dev") ? flow(model, "d", "c") : flow(model, "r", "d");
                }
                if (board == null) return null;
                String method = version.equals("0.8.10.191 dev") ? "d" : version.equals("0.8.10.226 dev") ? "e" : "c";
                URI uri = URI.create((String) call(board, method, new Class<?>[]{int.class}, 1));
                String host = uri.getHost();
                if (host == null) return null;
                if (host.endsWith(".5ch.io") || host.endsWith(".5ch.net") || host.endsWith(".2ch.net")) host = "5ch";
                String key = host + uri.getPath().replaceFirst("/1/?$", "/");
                boolean explicit = false;
                for (Field field : board.getClass().getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || field.getType() != Integer.class) continue;
                    field.setAccessible(true);
                    if (field.get(board) != null) explicit = true;
                }
                return new Anchor(key, uri.toString().replaceFirst("/1/?$", "/"), explicit, no, child.getTop() - list.getPaddingTop(), adapter);
            }
            return null;
        }

        File file(String key) throws Exception {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(key.getBytes(StandardCharsets.UTF_8));
            StringBuilder name = new StringBuilder();
            for (byte b : hash) name.append(String.format(java.util.Locale.ROOT, "%02x", b));
            File directory = new File(activity.getFilesDir(), "haiagaru-reading-position");
            if (!directory.isDirectory() && !directory.mkdirs()) throw new java.io.IOException("Position directory unavailable");
            return new File(directory, name + ".json");
        }

        @Override public boolean onPreDraw() {
            if (closed) return true;
            if (restoring) { restoring = false; onScrollChanged(); return true; }
            // ViewTreeObserver belongs to the whole window. Retained tablet
            // fragments also receive callbacks while adjacent pages animate.
            // Never perform reflective anchor discovery on every 120 Hz frame.
            long now = android.os.SystemClock.uptimeMillis();
            if (now < nextInspection) return true;
            nextInspection = now + 250;
            try {
                Anchor current = anchor();
                if (current == null || current.key.equals(inspectedKey)) return true;
                if (android.os.SystemClock.uptimeMillis() > layoutDeadline) LAYOUT_ANCHORS.clear();
                int[] layout = LAYOUT_ANCHORS.get(current.key);
                if (layout != null) {
                    Object owner = fragment.get();
                    if (owner != null && FilterPosition.jumpToResponse(owner, layout[0], layout[1])) {
                        LAYOUT_ANCHORS.remove(current.key); inspectedKey = current.key;
                        restoring = true; return false;
                    }
                    return true;
                }
                // Inspect once per actual thread, before saving the initial response-1 frame.
                AtomicFile storage = new AtomicFile(file(current.key));
                JSONObject saved = null;
                try { saved = new JSONObject(new String(storage.readFully(), StandardCharsets.UTF_8)); }
                catch (java.io.FileNotFoundException ignored) { }
                if (saved != null && !current.explicit && current.number == 1
                        && saved.optLong("installed") != installed && saved.optInt("number") > 1
                        && current.key.equals(saved.optString("thread"))) {
                    // Wait for the requested response to be present in the native adapter.
                    // Never fall back to a raw adapter index (headers and filters can differ).
                    int target = saved.getInt("number");
                    Object owner = fragment.get();
                    if (owner != null && FilterPosition.jumpToResponse(owner, target, saved.optInt("offset"))) {
                        inspectedKey = current.key;
                        restoring = true;
                        return false;
                    }
                    return true;
                }
                inspectedKey = current.key;
                onScrollChanged();
            } catch (Exception error) { Log.w("HaiagaruPosition", "Reading-position restoration unavailable", error); }
            return true;
        }

        @Override public void onScrollChanged() {
            if (closed || restoring) return;
            MAIN.removeCallbacks(delayedSave);
            MAIN.postDelayed(delayedSave, 400);
        }

        void save() {
            if (closed || restoring) return;
            MAIN.removeCallbacks(delayedSave);
            try {
                Anchor current = anchor();
                if (current == null || !current.key.equals(inspectedKey)) return;
                String signature = current.key + ":" + current.number + ":" + current.offset;
                if (signature.equals(written)) return;
                JSONObject data = new JSONObject().put("thread", current.key).put("number", current.number)
                        .put("offset", current.offset).put("installed", installed);
                AtomicFile storage = new AtomicFile(file(current.key));
                FileOutputStream output = storage.startWrite();
                try { output.write(data.toString().getBytes(StandardCharsets.UTF_8)); storage.finishWrite(output); }
                catch (Exception error) { storage.failWrite(output); throw error; }
                written = signature;
            } catch (Exception error) { Log.w("HaiagaruPosition", "Cannot persist reading position", error); }
        }

        void close() {
            save(); closed = true; MAIN.removeCallbacks(delayedSave);
            if (list.getViewTreeObserver().isAlive()) {
                list.getViewTreeObserver().removeOnPreDrawListener(this);
                list.getViewTreeObserver().removeOnScrollChangedListener(this);
            }
            list.removeOnAttachStateChangeListener(this);
        }
        @Override public void onViewDetachedFromWindow(View view) { close(); }
        @Override public void onViewAttachedToWindow(View view) { }
    }
}
