package e.e.a;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/** Server-confirmed posting and same-session playback comment echo. */
public final class PostEcho123 {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Object LOCK = new Object();
    private static final WeakHashMap<Object, ViewState> VIEWS = new WeakHashMap<>();
    private static final int MAX_ECHOES = 4;

    private static final class Echo {
        final String id;
        final int no;
        final Object row;
        Echo(String id, int no, Object row) {
            this.id = id;
            this.no = no;
            this.row = row;
        }
    }
    private static final class ViewState {
        final String videoId;
        WeakReference<Object> model;
        ArrayList<?> rows;
        final LinkedHashMap<String, Echo> echoes = new LinkedHashMap<>();
        ViewState(String videoId) { this.videoId = videoId; }
    }
    private PostEcho123() { }

    private static Object field(Object owner, String key) throws Exception {
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(key);
                f.setAccessible(true);
                return f.get(owner);
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(key);
    }

    /**
     * Called after CommentContinuity118.merge. Keep verified server-posted
     * echoes in adapter updates until the canonical fetched comment appears.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static ArrayList keep(Object model, ArrayList comments) {
        if (model == null || comments == null) return comments;
        try {
            Object fragment = field(model, "k");
            String videoId = String.valueOf(field(model, "d"));
            if (fragment == null || videoId.length() == 0 || "null".equals(videoId)) return comments;
            synchronized (LOCK) {
                ViewState state = VIEWS.get(fragment);
                if (state == null || !state.videoId.equals(videoId)) {
                    state = new ViewState(videoId);
                    VIEWS.put(fragment, state);
                }
                state.model = new WeakReference<>(model);
                if (state.echoes.isEmpty()) {
                    state.rows = comments;
                    return comments;
                }
                ArrayList merged = new ArrayList(comments);
                Iterator<Map.Entry<String, Echo>> pending = state.echoes.entrySet().iterator();
                while (pending.hasNext()) {
                    Echo echo = pending.next().getValue();
                    if (containsServerCopy(comments, echo)) {
                        merged.remove(echo.row);
                        pending.remove();
                    } else if (!merged.contains(echo.row)) {
                        merged.add(echo.row);
                    }
                }
                state.rows = merged;
                return merged;
            }
        } catch (Exception problem) {
            Log.w("nicoid-comment", "Local comment retention unavailable");
            return comments;
        }
    }

    private static volatile Field commentAttributes;

    private static Field attributes(Class<?> type) throws Exception {
        Field cached = commentAttributes;
        if (cached != null && cached.getDeclaringClass().isAssignableFrom(type)) return cached;
        synchronized (LOCK) {
            cached = commentAttributes;
            if (cached != null && cached.getDeclaringClass().isAssignableFrom(type)) return cached;
            for (Class<?> c = type; c != null; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (f.getType() != Integer[].class) continue;
                    f.setAccessible(true);
                    commentAttributes = f;
                    return f;
                }
            }
        }
        return null;
    }

    private static boolean containsServerCopy(ArrayList<?> rows, Echo echo) {
        if (rows.isEmpty()) return false;
        try {
            Field f = attributes(rows.get(0).getClass());
            if (f == null) return false;
            for (Object row : rows) {
                if (row == echo.row) continue;
                Integer[] a = (Integer[]) f.get(row);
                if (a != null && a.length > 1 && a[1] != null && a[1] == echo.no)
                    return true;
            }
        } catch (Exception ignored) { }
        return false;
    }

    /**
     * Never report success solely from an HTTP 2xx. nvcomment returns a
     * persistent server ID and a positive comment number after creation.
     * No automatic retry: a POST outcome can be ambiguous on a timeout.
     */
    public static void accepted(JSONObject reply, Object fragment, JSONObject request) throws IOException {
        JSONObject meta = reply == null ? null : reply.optJSONObject("meta");
        JSONObject data = reply == null ? null : reply.optJSONObject("data");
        int code = meta == null ? 0 : meta.optInt("status");
        String id = data == null ? "" : data.optString("id", "");
        int no = data == null ? 0 : data.optInt("no");
        if ((code != 201 && code != 200) || id.isEmpty() || no <= 0) {
            Log.w("nicoid-comment", "Posting acknowledgement invalid: status=" + code
                    + " hasId=" + !id.isEmpty() + " hasNo=" + (no > 0));
            throw new IOException("Comment acknowledgement missing");
        }
        Log.i("nicoid-comment", "Posting acknowledged by server: status=" + code + " no=" + no);
        if (fragment != null && request != null) {
            String videoId = request.optString("videoId");
            String body = request.optString("body");
            long position = request.optLong("vposMs");
            JSONArray commands = request.optJSONArray("commands");
            MAIN.post(() -> echo(fragment, videoId, body, commands, position, id, no));
        }
    }

    private static Object newRow(Object model, Object fragment, String body,
                                  JSONArray commands, long position, int no) throws Exception {
        Object player = field(fragment, "a0");
        if (player != null) {
            try {
                Object current = player.getClass().getMethod("getCurrentPosition").invoke(player);
                if (current instanceof Number) {
                    long now = ((Number) current).longValue();
                    // This is a visual-only local echo; the server keeps original vposMs.
                    position = Math.max(position, now + 600L);
                }
            } catch (Exception ignored) { }
        }
        StringBuilder flags = new StringBuilder();
        if (commands != null) for (int i = 0; i < commands.length(); i++) {
            if (i > 0) flags.append(' ');
            flags.append(commands.optString(i));
        }
        Integer[] values = new Integer[8];
        values[0] = (int) Math.min(Integer.MAX_VALUE, Math.max(0L, position / 10));
        values[1] = no;
        Integer[] parsed = new Integer[3];
        String[] labels = new String[3];
        Method decoder = null;
        for (Class<?> c = model.getClass(); c != null; c = c.getSuperclass()) {
            try {
                decoder = c.getDeclaredMethod("a", String.class, Integer[].class, String[].class);
                decoder.setAccessible(true);
                break;
            } catch (NoSuchMethodException ignored) { }
        }
        if (decoder == null) throw new NoSuchMethodException("Comment command decoder");
        decoder.invoke(model, flags.toString(), parsed, labels);
        values[2] = parsed[2];
        values[3] = parsed[0];
        values[4] = parsed[1];
        Class<?> type = Class.forName("e.e.a.q");
        Constructor<?> constructor = type.getDeclaredConstructor(String.class, String.class, Integer[].class);
        constructor.setAccessible(true);
        Object row = constructor.newInstance(body, flags.toString(), values);
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField("h");
                f.setAccessible(true);
                f.set(row, labels[2]);
                break;
            } catch (NoSuchFieldException ignored) { }
        }
        return row;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void echo(Object fragment, String videoId, String body, JSONArray commands,
                             long position, String serverId, int no) {
        try {
            Object model;
            ArrayList<?> original;
            synchronized (LOCK) {
                ViewState state = VIEWS.get(fragment);
                if (state == null || !state.videoId.equals(videoId) || state.model == null) {
                    Log.i("nicoid-comment", "Posting accepted; active adapter not available");
                    return;
                }
                model = state.model.get();
                original = state.rows;
            }
            if (model == null || original == null ||
                    !videoId.equals(String.valueOf(field(model, "d"))) ||
                    field(model, "k") != fragment) return;
            Object row = newRow(model, fragment, body, commands, position, no);
            ArrayList list;
            synchronized (LOCK) {
                ViewState state = VIEWS.get(fragment);
                if (state == null || !state.videoId.equals(videoId) || state.model == null
                        || state.model.get() != model) return;
                if (state.echoes.containsKey(serverId) ||
                        containsServerCopy(state.rows, new Echo(serverId, no, row))) return;
                while (state.echoes.size() >= MAX_ECHOES) {
                    Iterator<String> it = state.echoes.keySet().iterator();
                    if (it.hasNext()) { it.next(); it.remove(); }
                }
                state.echoes.put(serverId, new Echo(serverId, no, row));
                list = new ArrayList(state.rows);
                list.add(row);
                state.rows = list;
            }
            Class<?> ui = Class.forName("e.e.a.CommentUi");
            Method update = ui.getMethod("apply", Object.class, ArrayList.class);
            update.invoke(null, model, list);
        } catch (Exception problem) {
            // A posting acknowledged by the server must never be reclassified as failed.
            Log.w("nicoid-comment", "Local posting preview unavailable: "
                    + problem.getClass().getSimpleName());
        }
    }
}
