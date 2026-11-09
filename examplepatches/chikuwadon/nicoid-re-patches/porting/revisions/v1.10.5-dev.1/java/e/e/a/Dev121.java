package e.e.a;

import android.app.Activity;
import android.app.Service;
import android.os.SystemClock;
import android.view.View;
import android.view.MotionEvent;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/** Development controls timeout and bounded incremental comment hydration. */
public final class Dev121 {
    private static final long CONTROL_HIDE_MS = 2000L;
    private static final Map<Object, Boolean> TUNED = new WeakHashMap<>();
    private static final Map<Object, Snapshot> SNAPSHOTS = new WeakHashMap<>();
    private static final ThreadLocal<Ticket> UPDATE = new ThreadLocal<>();
    private Dev121() {}

    private static Field field(Class<?> type, String name) throws Exception {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    /** Let ExoMedia manage the timer, pause/seek interaction and animation itself. */
    public static void controls(Object owner) {
        if (owner == null) return;
        try {
            Object video;
            if (owner instanceof Activity) {
                Object fragment = field(owner.getClass(), "v").get(owner);
                if (fragment == null) return;
                video = field(fragment.getClass(), "a0").get(fragment);
            } else if (owner instanceof Service) {
                video = field(owner.getClass(), "e").get(owner);
            } else if (owner instanceof View) {
                video = owner;
            } else {
                // Fragment creation runs before its Activity is necessarily attached.
                video = field(owner.getClass(), "a0").get(owner);
            }
            if (video == null) return;
            Object controls = video.getClass().getMethod("getVideoControls").invoke(video);
            if (controls == null) return;
            synchronized (TUNED) {
                if (TUNED.containsKey(controls)) return;
                controls.getClass().getMethod("setHideDelay", long.class).invoke(controls, CONTROL_HIDE_MS);
                TUNED.put(controls, Boolean.TRUE);
            }
        } catch (Exception ignored) {
            // Unknown legacy player variant: preserve its original controls.
        }
    }

    /** Avoid reflection on every MOVE event while preserving the gesture path. */
    public static void controls(Object owner, MotionEvent event) {
        if (event != null && event.getActionMasked() == MotionEvent.ACTION_DOWN) controls(owner);
    }

    private static final class Snapshot {
        final Map<String, Integer> offsets = new HashMap<>();
        final HashSet<String> seen = new HashSet<>();
        final ArrayList<Object> items = new ArrayList<>();
        int rendered;
        long renderedAt;
    }

    private static boolean current(Object job) {
        try {
            Method m = job.getClass().getDeclaredMethod("current");
            m.setAccessible(true);
            return Boolean.TRUE.equals(m.invoke(job));
        } catch (Exception ignored) { return false; }
    }

    private static Object owner(Object job) throws Exception {
        return ((WeakReference<?>) field(job.getClass(), "owner").get(job)).get();
    }

    /** Capture at apply entry, before continuity/Cast/graph work can race navigation. */
    public static Object ticket(Object owner) {
        Ticket context = UPDATE.get();
        return context != null && context.owner.get() == owner ? context : new Ticket(owner);
    }

    public static boolean valid(Object value) {
        if (!(value instanceof Ticket)) return false;
        Ticket ticket = (Ticket) value;
        Object target = ticket.owner.get();
        if (target == null) return false;
        try { return ticket.current(target); }
        catch (Exception ignored) { return false; }
    }

    public static Runnable update(Object ticket, ArrayList<?> items) {
        return new Update(ticket instanceof Ticket ? (Ticket) ticket : new Ticket(ticket), items);
    }

    private static final class Ticket {
        final WeakReference<Object> owner, watch;
        final String video;
        final boolean guarded, hadWatch;
        Ticket(Object target) {
            this.owner = new WeakReference<>(target);
            Object token = null;
            String id = "";
            boolean check = false;
            try {
                token = field(target.getClass(), "modernWatch").get(target);
                id = String.valueOf(field(target.getClass(), "d").get(target));
                check = true;
            } catch (Exception ignored) { }
            this.watch = new WeakReference<>(token);
            this.hadWatch = token != null;
            this.video = id;
            this.guarded = check;
        }
        Ticket(Object target, Object job) throws Exception {
            owner = new WeakReference<>(target);
            Object token = field(job.getClass(), "watch").get(job);
            watch = new WeakReference<>(token);
            hadWatch = token != null;
            video = String.valueOf(field(job.getClass(), "video").get(job));
            guarded = true;
        }
        private boolean cancelled(Object target) throws Exception {
            try { return Boolean.TRUE.equals(field(target.getClass(), "a").get(target)); }
            catch (NoSuchFieldException ignored) { return false; }
        }
        boolean current(Object target) throws Exception {
            if (!guarded) return true;
            Object token = watch.get();
            return !(hadWatch && token == null)
                    && token == field(target.getClass(), "modernWatch").get(target)
                    && video.equals(String.valueOf(field(target.getClass(), "d").get(target)))
                    && !cancelled(target);
        }
    }

    private static final class Update implements Runnable {
        private final Ticket ticket;
        private final ArrayList<?> items;
        Update(Ticket ticket, ArrayList<?> items) { this.ticket = ticket; this.items = items; }
        @Override public void run() {
            Object target = ticket.owner.get();
            if (target == null) return;
            try {
                if (!ticket.current(target)) return;
                Method apply = Class.forName("e.e.a.CommentUi")
                        .getDeclaredMethod("lambda$1", Object.class, ArrayList.class);
                apply.setAccessible(true);
                apply.invoke(null, target, items);
            } catch (Exception ignored) {
                // The original final load and player lifecycle remain authoritative.
            }
        }
    }

    private static Method commentCommand(Object owner) throws Exception {
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod("a", String.class, Integer[].class, String[].class);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException("Comment command decoder");
    }

    /** Parse each JSON comment once; never reconvert comments already displayed. */
    private static void hydrate(Object owner, JSONObject root, Snapshot state) throws Exception {
        Class<?> type = Class.forName("e.e.a.q");
        Constructor<?> ctor = type.getDeclaredConstructor(String.class, String.class, Integer[].class);
        ctor.setAccessible(true);
        Field user = field(type, "c"), secondary = field(type, "h");
        Method decoder = commentCommand(owner);
        Class<?> extra = Class.forName("e.e.a.CommentListExtras");
        Method capture = extra.getDeclaredMethod("capture", Object.class, JSONObject.class);
        capture.setAccessible(true);
        JSONArray threads = root.getJSONObject("data").getJSONArray("threads");
        for (int t = 0; t < threads.length(); t++) {
            JSONObject thread = threads.getJSONObject(t);
            String threadKey = thread.optString("id") + ":" + thread.optString("fork");
            JSONArray comments = thread.optJSONArray("comments");
            if (comments == null) continue;
            int from = state.offsets.containsKey(threadKey) ? state.offsets.get(threadKey) : 0;
            if (from > comments.length()) from = 0;
            for (int i = from; i < comments.length(); i++) {
                JSONObject comment = comments.getJSONObject(i);
                String id = comment.optString("id", comment.optString("no"));
                String key = threadKey + ":" + id;
                if (state.seen.contains(key)) continue;
                String body = comment.optString("body");
                JSONArray commands = comment.optJSONArray("commands");
                StringBuilder flags = new StringBuilder();
                if (commands != null) {
                    for (int n = 0; n < commands.length(); n++) {
                        if (n > 0) flags.append(' ');
                        flags.append(commands.optString(n));
                    }
                }
                String command = flags.toString();
                Integer[] attributes = new Integer[8];
                attributes[0] = comment.optInt("vposMs") / 10;
                attributes[1] = comment.optInt("no");
                Integer[] parsed = new Integer[3];
                String[] labels = new String[3];
                decoder.invoke(owner, command, parsed, labels);
                attributes[2] = parsed[2];
                attributes[3] = parsed[0];
                attributes[4] = parsed[1];
                Object row = ctor.newInstance(body, command, attributes);
                secondary.set(row, labels[2]);
                user.set(row, comment.optString("userId"));
                capture.invoke(null, row, comment);
                state.items.add(row);
                // Commit only after decoding and metadata capture have succeeded.
                state.seen.add(key);
            }
            state.offsets.put(threadKey, comments.length());
        }
    }

    /** The job identity separates repeated loads of the same video. */
    public static void progress(Object job, JSONObject accumulated, int added) {
        // A first publication cannot occur below this total; avoid reflection/state on those pages.
        if (job == null || accumulated == null || added < CommentBatchPolicy121.MIN_COMMENTS) return;
        if (!current(job)) return;
        if (!Dev114.memoryAvailable()) return;
        try {
            Object target = owner(job);
            if (target == null) return;
            Snapshot state;
            synchronized (SNAPSHOTS) {
                state = SNAPSHOTS.get(job);
                if (state == null) {
                    state = new Snapshot();
                    SNAPSHOTS.put(job, state);
                }
            }
            synchronized (state) {
                int pending = added - state.rendered;
                boolean first = state.rendered == 0;
                long elapsed = first ? 0 : Math.max(0, SystemClock.elapsedRealtime() - state.renderedAt);
                if (!CommentBatchPolicy121.ready(pending, elapsed, first)) return;
                hydrate(target, accumulated, state);
                if (!Dev114.memoryAvailable() || !current(job)) return;
                Class<?> ui = Class.forName("e.e.a.CommentUi");
                Method apply = ui.getDeclaredMethod("apply", Object.class, ArrayList.class);
                apply.setAccessible(true);
                UPDATE.set(new Ticket(target, job));
                try {
                    // apply synchronously merges into a fresh list before it queues any UI work.
                    // The state lock keeps this input stable throughout that merge.
                    apply.invoke(null, target, state.items);
                } finally {
                    UPDATE.remove();
                }
                state.rendered = added;
                state.renderedAt = SystemClock.elapsedRealtime();
            }
        } catch (Exception ignored) {
            // Never interrupt playback or block the final, original full load.
        }
    }

    public static void done(Object job) {
        if (job == null) return;
        synchronized (SNAPSHOTS) { SNAPSHOTS.remove(job); }
    }
}
