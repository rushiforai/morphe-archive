package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.ListView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xmlpull.v1.XmlPullParser;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;

/** Stable video metadata for URL-added playlist entries and bounded visible-row repair. */
public final class Dev120 {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORK = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "nicoid-playlist-metadata");
        t.setPriority(Thread.MIN_PRIORITY);
        return t;
    });
    private static final Map<Object, Boolean> PENDING = new WeakHashMap<>();
    private static final Map<String, Long> ATTEMPTED = new LinkedHashMap<String, Long>(64, .75f, true) {
        protected boolean removeEldestEntry(Map.Entry<String, Long> e) { return size() > 512; }
    };
    private Dev120() {}

    public static final class Metadata {
        public final String id;
        public String title, owner = "", image = "", length = "";
        public long postedAt;
        public final long[] counts = {-1, -1, -1, -1};
        Metadata(String video) { id = video; title = video; }
        public boolean useful() {
            return postedAt > 0 || counts[0] >= 0 || counts[1] >= 0 || counts[3] >= 0;
        }
        public String stats() {
            if (counts[0] < 0 || counts[1] < 0 || counts[3] < 0) return "";
            StringBuilder s = new StringBuilder();
            s.append("再生:").append(counts[0]).append(" コメント:").append(counts[1]);
            if (counts[2] >= 0) s.append(" いいね:").append(counts[2]);
            return s.append(" マイリス:").append(counts[3]).toString();
        }
        public void merge(JSONObject row) throws JSONException {
            if (row == null) return;
            String existing = row.optString("videoinfo", "");
            if (existing.trim().isEmpty() && !stats().isEmpty()) row.put("videoinfo", stats());
            if (postedAt > 0 && !hasPost(row.optString("postedAt", ""))) row.put("postedAt", postedAt);
            if (id.equals(row.optString("title", id)) && !id.equals(title)) row.put("title", title);
            if (row.optString("owner", "").isEmpty() && !owner.isEmpty()) row.put("owner", owner);
            if (row.optString("thumbnail", "").isEmpty() && !image.isEmpty()) row.put("thumbnail", image);
            if (row.optString("length", "").isEmpty() && !length.isEmpty()) row.put("length", length);
        }
    }

    private static boolean hasPost(String value) {
        if (value == null || value.trim().isEmpty() || "0".equals(value)) return false;
        try { return Long.parseLong(value) > 0; } catch (NumberFormatException ignored) { return true; }
    }
    private static long millis(String text) {
        if (text == null || text.isEmpty()) return 0;
        try {
            return ((Number)Class.forName("e.e.a.RowDates194")
                .getMethod("millis", String.class).invoke(null, text)).longValue();
        } catch (Exception ignored) { return 0; }
    }
    private static String first(String... values) {
        for (String v : values) if (v != null && !v.isEmpty() && !"null".equals(v)) return v;
        return "";
    }
    public static Metadata fetch(String id) {
        Metadata m = new Metadata(id);
        if (id == null || !id.matches("(?:sm|nm|so|ss)?[0-9]+")) return m;
        // Reuse the app's authenticated watch request, including its existing session and timeouts.
        try {
            Class<?> details = Class.forName("e.e.a.VideoDetails");
            Class<?> taskType = Class.forName("e.e.a.NetworkTask");
            java.lang.reflect.Constructor<?> ctor = taskType.getDeclaredConstructor();
            ctor.setAccessible(true);
            Object task = ctor.newInstance();
            Method get = details.getDeclaredMethod("request", String.class, String.class, boolean.class, taskType);
            get.setAccessible(true);
            JSONObject response = (JSONObject)get.invoke(null,
                "https://www.nicovideo.jp/watch/" + id + "?responseType=json", "GET", true, task);
            Method normalize = details.getDeclaredMethod("watchData", JSONObject.class);
            normalize.setAccessible(true);
            JSONObject watch = (JSONObject)normalize.invoke(null, response);
            JSONObject video = watch.optJSONObject("video");
            if (video != null && id.equals(video.optString("id", id))) {
                m.title = first(video.optString("title"), id);
                m.postedAt = millis(first(video.optString("registeredAt"), video.optString("postedAt")));
                JSONObject count = video.optJSONObject("count");
                if (count != null) {
                    String[] keys = {"view", "comment", "like", "mylist"};
                    for (int i = 0; i < keys.length; i++)
                        if (count.has(keys[i])) m.counts[i] = count.optLong(keys[i], -1);
                }
                JSONObject thumbnail = video.optJSONObject("thumbnail");
                if (thumbnail != null) m.image = first(thumbnail.optString("url"),
                    thumbnail.optString("listingUrl"), thumbnail.optString("middleUrl"));
                JSONObject owner = watch.optJSONObject("owner"), channel = watch.optJSONObject("channel");
                if (owner != null) m.owner = first(owner.optString("nickname"), owner.optString("name"));
                if (m.owner.isEmpty() && channel != null) m.owner = first(channel.optString("name"));
                long duration = video.optLong("duration", 0);
                if (duration > 0) m.length = String.format(java.util.Locale.ROOT,
                    "%d:%02d", duration / 60, duration % 60);
            }
        } catch (Exception error) {
            android.util.Log.d("nicoid-playlist", "Watch metadata fallback: " + error.getClass().getSimpleName());
        }
        // The fixed public thumbnail endpoint supplies counts and upload time for legacy videos.
        if (m.counts[0] < 0 || m.counts[1] < 0 || m.counts[3] < 0 || m.postedAt <= 0) {
            HttpURLConnection c = null;
            try {
                c = (HttpURLConnection)new URL("https://ext.nicovideo.jp/api/getthumbinfo/" + id).openConnection();
                c.setConnectTimeout(3500);
                c.setReadTimeout(3500);
                c.setInstanceFollowRedirects(false);
                if (c.getResponseCode() == 200) {
                    XmlPullParser xml = android.util.Xml.newPullParser();
                    try (InputStream stream = c.getInputStream()) {
                        xml.setInput(stream, "UTF-8");
                        int event;
                        while ((event = xml.next()) != XmlPullParser.END_DOCUMENT) {
                            if (event != XmlPullParser.START_TAG) continue;
                            String key = xml.getName();
                            if (Arrays.asList("title", "thumbnail_url", "user_nickname", "view_counter",
                                    "comment_num", "mylist_counter", "first_retrieve", "length").contains(key)) {
                                String v = xml.nextText();
                                if ("title".equals(key) && m.title.equals(id)) m.title = v;
                                else if ("thumbnail_url".equals(key) && m.image.isEmpty()) m.image = v;
                                else if ("user_nickname".equals(key) && m.owner.isEmpty()) m.owner = v;
                                else if ("first_retrieve".equals(key) && m.postedAt <= 0) m.postedAt = millis(v);
                                else if ("length".equals(key) && m.length.isEmpty()) m.length = v;
                                else {
                                    int at = "view_counter".equals(key) ? 0 :
                                        "comment_num".equals(key) ? 1 : "mylist_counter".equals(key) ? 3 : -1;
                                    if (at >= 0 && m.counts[at] < 0)
                                        try { m.counts[at] = Long.parseLong(v); }
                                        catch (NumberFormatException ignored) { }
                                }
                            }
                        }
                    }
                }
            } catch (Exception error) {
                android.util.Log.d("nicoid-playlist", "Public metadata unavailable: " + error.getClass().getSimpleName());
            } finally { if (c != null) c.disconnect(); }
        }
        return m;
    }

    private static Object field(Object host, String name) throws Exception {
        Field f = host.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(host);
    }
    private static boolean missing(JSONObject v) {
        return v != null && (v.optString("videoinfo", "").trim().isEmpty() ||
            !hasPost(v.optString("postedAt", "")));
    }
    /** Called from page.render; defer inspection until the freshly populated list is on screen. */
    public static void backfill(Object page) {
        if (page == null) return;
        synchronized (PENDING) {
            if (PENDING.containsKey(page)) return;
            PENDING.put(page, Boolean.TRUE);
        }
        WeakReference<Object> weak = new WeakReference<>(page);
        MAIN.postDelayed(() -> {
            Object target = weak.get();
            if (target == null) return;
            synchronized (PENDING) { PENDING.remove(target); }
            try {
                Activity a = (Activity)field(target, "a");
                if (a == null || a.isFinishing() || a.isDestroyed()) return;
                String folder = (String)field(target, "folder");
                if (folder == null) return;
                @SuppressWarnings("unchecked")
                List<JSONObject> rows = (List<JSONObject>)field(target, "visible");
                ListView list = (ListView)field(target, "videoList");
                if (rows == null || rows.isEmpty()) return;
                int first = list != null ? Math.max(0, list.getFirstVisiblePosition()) : 0;
                int last = list != null ? Math.max(first, list.getLastVisiblePosition()) : 3;
                int queued = 0;
                for (int n = first; n <= Math.min(last + 1, rows.size() - 1) && queued < 5; n++) {
                    JSONObject row = rows.get(n);
                    if (!missing(row)) continue;
                    String id = row.optString("videoId");
                    if (!id.matches("(?:sm|nm|so|ss)?[0-9]+")) continue;
                    String key = folder + ":" + id;
                    long now = android.os.SystemClock.elapsedRealtime();
                    synchronized (ATTEMPTED) {
                        Long time = ATTEMPTED.get(key);
                        if (time != null && now >= time && now - time < 20L * 60 * 1000) continue;
                        ATTEMPTED.put(key, now);
                    }
                    queued++;
                    WeakReference<Activity> activity = new WeakReference<>(a);
                    WORK.execute(() -> repair(activity, weak, folder, id));
                }
            } catch (Exception error) {
                android.util.Log.w("nicoid-playlist", "Playlist metadata scan skipped", error);
            }
        }, 240);
    }
    private static void repair(WeakReference<Activity> activity, WeakReference<Object> page,
            String folder, String id) {
        Metadata meta = fetch(id);
        if (!meta.useful()) return;
        Activity a = activity.get();
        if (a == null || a.isFinishing() || a.isDestroyed()) return;
        try {
            Class<?> dataClass = Class.forName("e.e.a.LocalPlaylists");
            Class<?> editType = Class.forName("e.e.a.LocalPlaylists$Edit");
            java.util.concurrent.atomic.AtomicBoolean updated = new java.util.concurrent.atomic.AtomicBoolean(false);
            Object edit = Proxy.newProxyInstance(editType.getClassLoader(),
                new Class<?>[] {editType}, (proxy, method, args) -> {
                    if (!"apply".equals(method.getName())) return null;
                    JSONArray videos = (JSONArray)args[0].getClass().getField("videos").get(args[0]);
                    for (int n = 0; n < videos.length(); n++) {
                        JSONObject video = videos.optJSONObject(n);
                        if (video != null && folder.equals(video.optString("folder")) &&
                                id.equals(video.optString("videoId")) && missing(video)) {
                            meta.merge(video);
                            updated.set(true);
                            break;
                        }
                    }
                    return null;
                });
            Consumer<Boolean> callback = ok -> {
                Object current = page.get();
                Activity host = activity.get();
                if (!Boolean.TRUE.equals(ok) || !updated.get() || current == null ||
                    host == null || host.isFinishing() || host.isDestroyed()) return;
                host.runOnUiThread(() -> {
                    try {
                        if (!folder.equals(field(current, "folder"))) return;
                        ListView old = (ListView)field(current, "videoList");
                        int index = old == null ? 0 : old.getFirstVisiblePosition();
                        int top = old == null || old.getChildCount() == 0 ? 0 : old.getChildAt(0).getTop();
                        Method render = current.getClass().getDeclaredMethod("render");
                        render.setAccessible(true);
                        render.invoke(current);
                        ListView next = (ListView)field(current, "videoList");
                        if (next != null) Dev112.restoreList(next, index, top);
                    } catch (Exception error) {
                        android.util.Log.w("nicoid-playlist", "Playlist metadata refresh skipped", error);
                    }
                });
            };
            Method change = dataClass.getDeclaredMethod("change", Context.class, editType, Consumer.class);
            change.setAccessible(true);
            change.invoke(null, a.getApplicationContext(), edit, callback);
        } catch (Exception error) {
            android.util.Log.w("nicoid-playlist", "Could not persist playlist metadata", error);
        }
    }
}
