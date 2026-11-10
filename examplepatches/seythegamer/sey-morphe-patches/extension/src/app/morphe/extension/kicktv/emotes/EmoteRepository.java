package app.morphe.extension.kicktv.emotes;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Downloads third-party emote sets and publishes them to {@link EmoteStore}.
 *
 * <p>7TV has real KICK support: the channel user id (not the channel id) is
 * used at {@code /v3/users/kick/<user id>}. BTTV and FFZ do not expose KICK
 * channel endpoints, so their global sets are used. All providers share the
 * single EMOTES toggle.</p>
 *
 * <p>Everything runs on background threads. The UI only reads the immutable
 * snapshot published by {@link EmoteStore}, so chat rendering never blocks.</p>
 */
public final class EmoteRepository {

    private static final String TAG = "MorpheEmotes";

    private static final String TV7_GLOBAL = "https://7tv.io/v3/emote-sets/global";
    private static final String TV7_USER = "https://7tv.io/v3/users/kick/";
    private static final String BTTV_GLOBAL = "https://api.betterttv.net/3/cached/emotes/global";
    private static final String FFZ_GLOBAL = "https://api.frankerfacez.com/v1/set/global";
    private static final String KICK_CHANNEL = "https://kick.com/api/v2/channels/";

    private static final Object LOCK = new Object();
    private static final Map<String, String> GLOBAL = new LinkedHashMap<>();
    private static final Map<String, String> CHANNEL = new LinkedHashMap<>();
    private static final AtomicBoolean GLOBAL_STARTED = new AtomicBoolean(false);

    private static volatile String channelSlug;
    private static volatile int channelUserId;
    private static volatile String channelLoadingSlug;
    private static volatile String channelLoadedSlug;

    private EmoteRepository() {
    }

    /** Starts the one-time global provider download. */
    public static void ensureStarted() {
        if (!GLOBAL_STARTED.compareAndSet(false, true)) {
            return;
        }
        start("morphe-emotes-global", new Runnable() {
            @Override
            public void run() {
                loadGlobal();
            }
        });
    }

    /**
     * Called by the patched GetChannelResponse.getSlug().
     *
     * <p>The response object also exposes getUserId(), which is the KICK user
     * id 7TV needs. Reflection keeps this extension independent of the
     * obfuscated/shifting app classes.</p>
     */
    public static void onChannelResponse(Object response) {
        if (response == null || !EmotePrefs.isEnabled()) {
            return;
        }

        // getSlug() itself is the patched method, so calling it here would
        // recurse forever (StackOverflowError). The nested User object exposes
        // the same information and is never patched.
        String slug = null;
        int userId = 0;
        try {
            Object user = response.getClass().getMethod("getUser").invoke(response);
            if (user != null) {
                Object username = user.getClass().getMethod("getUsername").invoke(user);
                if (username instanceof String) {
                    slug = (String) username;
                }
                Object id = user.getClass().getMethod("getId").invoke(user);
                if (id instanceof Number) {
                    userId = ((Number) id).intValue();
                }
            }
            if (userId <= 0) {
                // getUserId() is not patched, so this call is safe.
                Object id = response.getClass().getMethod("getUserId").invoke(response);
                if (id instanceof Number) {
                    userId = ((Number) id).intValue();
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to read channel response: " + t);
        }

        if (slug == null || slug.isEmpty()) {
            return;
        }

        final String requestedSlug = slug;
        final int requestedUserId = userId;
        synchronized (LOCK) {
            channelSlug = requestedSlug;
            channelUserId = requestedUserId;
            if (requestedSlug.equals(channelLoadedSlug)
                    || requestedSlug.equals(channelLoadingSlug)) {
                return;
            }
            channelLoadingSlug = requestedSlug;
        }

        ensureStarted();
        start("morphe-emotes-channel", new Runnable() {
            @Override
            public void run() {
                loadChannel(requestedSlug, requestedUserId);
            }
        });
    }

    /** Re-downloads the global sets and the current channel set. */
    public static void reload() {
        synchronized (LOCK) {
            GLOBAL.clear();
            CHANNEL.clear();
            channelLoadedSlug = null;
            channelLoadingSlug = null;
        }
        EmoteStore.publish(new ArrayList<EmoteStore.Emote>());
        GLOBAL_STARTED.set(false);
        ensureStarted();

        final String slug = channelSlug;
        if (slug != null && !slug.isEmpty()) {
            final int userId = channelUserId;
            start("morphe-emotes-channel", new Runnable() {
                @Override
                public void run() {
                    loadChannel(slug, userId);
                }
            });
        }
    }

    /** Short status line for the settings dialog. */
    public static String getSummary() {
        int channel;
        int global;
        synchronized (LOCK) {
            channel = CHANNEL.size();
            global = GLOBAL.size();
        }
        int total = EmoteStore.size();
        if (total == 0) {
            return "No emotes loaded yet.";
        }
        StringBuilder out = new StringBuilder();
        out.append(total).append(" emotes loaded");
        if (channel > 0) {
            out.append(" (channel ").append(channel).append(')');
        }
        if (global > 0) {
            out.append(" (global ").append(global).append(')');
        }
        return out.toString();
    }

    private static void loadGlobal() {
        Map<String, String> loaded = new LinkedHashMap<>();

        // 7TV global first, then BTTV and FFZ. Names already present win, so
        // 7TV keeps its emotes when providers share a name.
        add7tvSet(loaded, TV7_GLOBAL);
        addBttvGlobal(loaded);
        addFfzGlobal(loaded);

        synchronized (LOCK) {
            GLOBAL.clear();
            GLOBAL.putAll(loaded);
            rebuildLocked();
        }
        Log.i(TAG, "Global emote sets loaded: " + loaded.size());
    }

    private static void loadChannel(String slug, int userId) {
        Map<String, String> loaded = new LinkedHashMap<>();

        int resolvedUserId = userId;
        if (resolvedUserId <= 0) {
            resolvedUserId = resolveKickUserId(slug);
        }
        if (resolvedUserId > 0) {
            add7tvUser(loaded, TV7_USER + resolvedUserId);
        }

        synchronized (LOCK) {
            if (slug.equals(channelLoadingSlug)) {
                channelLoadingSlug = null;
            }
            // A newer channel was requested while this one was downloading.
            if (!slug.equals(channelSlug)) {
                return;
            }
            CHANNEL.clear();
            CHANNEL.putAll(loaded);
            channelLoadedSlug = slug;
            rebuildLocked();
        }
        Log.i(TAG, "Channel emotes loaded for " + slug + ": " + loaded.size());
    }

    private static void rebuildLocked() {
        List<EmoteStore.Emote> emotes =
                new ArrayList<>(CHANNEL.size() + GLOBAL.size());
        for (Map.Entry<String, String> entry : CHANNEL.entrySet()) {
            emotes.add(new EmoteStore.Emote(entry.getKey(), entry.getValue()));
        }
        for (Map.Entry<String, String> entry : GLOBAL.entrySet()) {
            emotes.add(new EmoteStore.Emote(entry.getKey(), entry.getValue()));
        }
        EmoteStore.publish(emotes);
    }

    private static int resolveKickUserId(String slug) {
        HttpURLConnection connection = null;
        try {
            connection = open(KICK_CHANNEL + URLEncoder.encode(slug, "UTF-8"));
            if (connection == null) {
                return 0;
            }
            String json = read(connection);
            if (json == null) {
                return 0;
            }
            return new JSONObject(json).optInt("user_id", 0);
        } catch (Throwable t) {
            Log.w(TAG, "KICK user lookup failed for " + slug + ": " + t);
            return 0;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static void add7tvSet(Map<String, String> out, String url) {
        HttpURLConnection connection = null;
        try {
            connection = open(url);
            if (connection == null) {
                return;
            }
            String json = read(connection);
            if (json == null) {
                return;
            }
            JSONObject root = new JSONObject(json);
            add7tvEmotes(out, root.optJSONArray("emotes"));
        } catch (Throwable t) {
            Log.w(TAG, "7TV set failed " + url + ": " + t);
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static void add7tvUser(Map<String, String> out, String url) {
        HttpURLConnection connection = null;
        try {
            connection = open(url);
            if (connection == null) {
                return;
            }
            String json = read(connection);
            if (json == null) {
                return;
            }
            JSONObject root = new JSONObject(json);
            JSONObject set = root.optJSONObject("emote_set");
            if (set != null) {
                add7tvEmotes(out, set.optJSONArray("emotes"));
            }
        } catch (Throwable t) {
            Log.w(TAG, "7TV channel failed " + url + ": " + t);
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static void add7tvEmotes(Map<String, String> out, JSONArray emotes) {
        if (emotes == null) {
            return;
        }
        for (int i = 0; i < emotes.length(); i++) {
            JSONObject emote = emotes.optJSONObject(i);
            if (emote == null) {
                continue;
            }
            String name = emote.optString("name", null);
            String url = sevenTvUrl(emote);
            if (name != null && !name.isEmpty() && url != null) {
                putIfAbsent(out, name, url);
            }
        }
    }

    private static String sevenTvUrl(JSONObject emote) {
        String id = emote.optString("id", "");
        String base = null;
        String file = null;

        JSONObject data = emote.optJSONObject("data");
        if (data != null) {
            JSONObject host = data.optJSONObject("host");
            if (host != null) {
                base = host.optString("url", null);
                JSONArray files = host.optJSONArray("files");
                if (files != null) {
                    String twoXWebp = null;
                    String twoXAny = null;
                    String oneXWebp = null;
                    String oneXAny = null;
                    for (int i = 0; i < files.length(); i++) {
                        JSONObject fileObject = files.optJSONObject(i);
                        if (fileObject == null) {
                            continue;
                        }
                        String name = fileObject.optString("name", "");
                        if (name.startsWith("2x.webp")) {
                            twoXWebp = name;
                        } else if (name.startsWith("2x.") && twoXAny == null) {
                            twoXAny = name;
                        } else if (name.startsWith("1x.webp")) {
                            oneXWebp = name;
                        } else if (name.startsWith("1x.") && oneXAny == null) {
                            oneXAny = name;
                        }
                    }
                    file = firstNonNull(twoXWebp, twoXAny, oneXWebp, oneXAny);
                }
            }
        }

        if (base == null || base.isEmpty()) {
            if (id.isEmpty()) {
                return null;
            }
            base = "//cdn.7tv.app/emote/" + id;
        }
        if (base.startsWith("//")) {
            base = "https:" + base;
        } else if (!base.startsWith("http")) {
            base = "https://" + base;
        }
        if (file == null || file.isEmpty()) {
            file = "2x.webp";
        }
        return base + "/" + file;
    }

    private static void addBttvGlobal(Map<String, String> out) {
        HttpURLConnection connection = null;
        try {
            connection = open(BTTV_GLOBAL);
            if (connection == null) {
                return;
            }
            String json = read(connection);
            if (json == null) {
                return;
            }
            JSONArray emotes = new JSONArray(json);
            for (int i = 0; i < emotes.length(); i++) {
                JSONObject emote = emotes.optJSONObject(i);
                if (emote == null) {
                    continue;
                }
                String name = emote.optString("code", null);
                String id = emote.optString("id", "");
                if (name == null || name.isEmpty() || id.isEmpty()) {
                    continue;
                }
                putIfAbsent(out, name, "https://cdn.betterttv.net/emote/" + id + "/3x");
            }
        } catch (Throwable t) {
            Log.w(TAG, "BTTV global failed: " + t);
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static void addFfzGlobal(Map<String, String> out) {
        HttpURLConnection connection = null;
        try {
            connection = open(FFZ_GLOBAL);
            if (connection == null) {
                return;
            }
            String json = read(connection);
            if (json == null) {
                return;
            }
            JSONObject sets = new JSONObject(json).optJSONObject("sets");
            if (sets == null) {
                return;
            }
            Iterator<String> keys = sets.keys();
            while (keys.hasNext()) {
                JSONObject set = sets.optJSONObject(keys.next());
                if (set == null) {
                    continue;
                }
                JSONArray emotes = set.optJSONArray("emoticons");
                if (emotes == null) {
                    continue;
                }
                for (int i = 0; i < emotes.length(); i++) {
                    JSONObject emote = emotes.optJSONObject(i);
                    if (emote == null) {
                        continue;
                    }
                    String name = emote.optString("name", null);
                    JSONObject urls = emote.optJSONObject("urls");
                    String url = urls == null ? null
                            : firstNonNull(
                                    urls.optString("4", null),
                                    urls.optString("2", null),
                                    urls.optString("1", null));
                    if (name != null && !name.isEmpty() && url != null && !url.isEmpty()) {
                        putIfAbsent(out, name, url);
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "FFZ global failed: " + t);
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static void putIfAbsent(Map<String, String> map, String key, String value) {
        if (!map.containsKey(key)) {
            map.put(key, value);
        }
    }

    private static String firstNonNull(String... values) {
        for (String value : values) {
            if (value != null && !value.isEmpty()) {
                return value;
            }
        }
        return null;
    }

    private static HttpURLConnection open(String url) {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(8000);
            connection.setReadTimeout(10000);
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty(
                    "User-Agent",
                    "Mozilla/5.0 (Linux; Android 12) AppleWebKit/537.36 "
                            + "(KHTML, like Gecko) Chrome/120.0 Mobile Safari/537.36");
            int code = connection.getResponseCode();
            if (code < 200 || code >= 300) {
                connection.disconnect();
                return null;
            }
            return connection;
        } catch (Throwable t) {
            Log.w(TAG, "Request failed " + url + ": " + t);
            return null;
        }
    }

    private static String read(HttpURLConnection connection) {
        InputStream stream = null;
        BufferedReader reader = null;
        try {
            stream = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(stream, "UTF-8"));
            StringBuilder out = new StringBuilder();
            char[] buffer = new char[8192];
            int count;
            while ((count = reader.read(buffer)) != -1) {
                out.append(buffer, 0, count);
            }
            return out.toString();
        } catch (Throwable t) {
            Log.w(TAG, "Read failed: " + t);
            return null;
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                } else if (stream != null) {
                    stream.close();
                }
            } catch (Throwable ignored) {
                // Nothing useful to do here.
            }
        }
    }

    private static void start(String name, Runnable runnable) {
        Thread thread = new Thread(runnable, name);
        thread.setDaemon(true);
        thread.start();
    }
}
