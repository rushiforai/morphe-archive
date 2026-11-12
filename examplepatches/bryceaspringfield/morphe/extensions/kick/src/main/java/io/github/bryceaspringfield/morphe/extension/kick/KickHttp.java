package io.github.bryceaspringfield.morphe.extension.kick;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okhttp3.WebSocketListener;

/**
 * KICK's screens are React Native, so its lists are filtered where their data arrives: every OkHttp client the app
 * builds gets this interceptor, which rewrites the JSON answers of kick.com (streams, clips, categories, chat history)
 * before the screens read them, and every chat socket gets {@link KickChat}'s listener.
 */
public final class KickHttp implements Interceptor {

    private static final KickHttp INSTANCE = new KickHttp();
    /** Answers larger than this are passed through unread (8 MB). */
    private static final long MAX_BODY = 8L << 20;

    private KickHttp() {
    }

    /** Called at the start of OkHttpClient.Builder.build(). */
    public static void onBuild(OkHttpClient.Builder builder) {
        try {
            if (!builder.interceptors().contains(INSTANCE)) builder.addInterceptor(INSTANCE);
        } catch (Throwable t) {
            Kick.error("interceptor not added", t);
        }
    }

    /** Called at the start of OkHttpClient.newWebSocket(Request, WebSocketListener): the listener the socket gets. */
    public static WebSocketListener onWebSocket(Request request, WebSocketListener listener) {
        try {
            Kick.log("socket " + request.url());
            return listener instanceof KickChat ? listener : new KickChat(listener);
        } catch (Throwable t) {
            Kick.error("socket listener not wrapped", t);
            return listener;
        }
    }

    @Override
    public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);
        try {
            String host = request.url().host();
            if (!host.endsWith("kick.com")) return response;
            ResponseBody body = response.body();
            MediaType type = body == null ? null : body.contentType();
            String path = request.url().encodedPath();
            if (body == null || type == null || !type.toString().contains("json") || body.contentLength() > MAX_BODY) {
                if (Kick.debug()) Kick.log("http " + response.code() + " " + host + path + " " + type);
                return response;
            }
            String text = body.string();
            String out = rewrite(host + path, text);
            if (Kick.debug()) {
                Kick.log("http " + response.code() + " " + host + path + " " + text.length() + " chars"
                        + (out != text ? ", rewritten to " + out.length() : "") + " keys " + keys(text));
                String lower = path.toLowerCase(Locale.ROOT);
                if (lower.contains("leaderboard") || lower.contains("gift")) {
                    Kick.log("body " + path + ": " + text.substring(0, Math.min(1500, text.length())));
                }
            }
            return response.newBuilder().removeHeader("Content-Length").body(ResponseBody.create(out, type)).build();
        } catch (Throwable t) {
            Kick.error("answer not filtered: " + request.url(), t);
            return response;
        }
    }

    private static String keys(String text) {
        try {
            Object o = new JSONTokener(text).nextValue();
            if (o instanceof JSONObject j) {
                StringBuilder b = new StringBuilder();
                for (Iterator<String> it = j.keys(); it.hasNext(); ) b.append(it.next()).append(it.hasNext() ? "," : "");
                return "{" + (b.length() > 200 ? b.substring(0, 200) : b) + "}";
            }
            if (o instanceof JSONArray a) return "[" + a.length() + "]";
        } catch (Throwable ignored) {
        }
        return "?";
    }

    /** The answer with hidden streams, channels, categories, and chat messages removed; the same string if none. */
    static String rewrite(String where, String text) {
        Filters f = Filters.now();
        if (f.isEmpty()) return text;
        Object root;
        try {
            root = new JSONTokener(text).nextValue();
        } catch (Throwable t) {
            return text;
        }
        int[] removed = {0};
        walk(root, f, removed, where);
        return removed[0] == 0 ? text : root.toString();
    }

    private static void walk(Object o, Filters f, int[] removed, String where) {
        if (o instanceof JSONObject j) {
            if (f.hideTopGifted && where.toLowerCase(Locale.ROOT).contains("leaderboard")) {
                for (Iterator<String> it = j.keys(); it.hasNext(); ) {
                    Object v = j.opt(it.next());
                    if (v instanceof JSONArray a && a.length() > 0 && a.opt(0) instanceof JSONObject) {
                        removed[0] += a.length();
                        while (a.length() > 0) a.remove(a.length() - 1);
                    }
                }
            }
            for (Iterator<String> it = j.keys(); it.hasNext(); ) walk(j.opt(it.next()), f, removed, where);
        } else if (o instanceof JSONArray a) {
            for (int i = a.length() - 1; i >= 0; i--) {
                Object v = a.opt(i);
                if (v instanceof JSONObject item) {
                    String why = f.hides(item);
                    if (why != null) {
                        a.remove(i);
                        removed[0]++;
                        Kick.log("hidden in " + where + ": " + why);
                        continue;
                    }
                }
                walk(v, f, removed, where);
            }
        }
    }

    /** The filters set now. */
    static final class Filters {
        final List<String> words = Kick.list(Kick.HIDDEN_WORDS);
        final List<String> channels = Kick.list(Kick.HIDDEN_CHANNELS);
        final List<String> categories = Kick.list(Kick.HIDDEN_CATEGORIES);
        final List<String> chatWords = Kick.list(Kick.CHAT_HIDDEN_WORDS);
        final List<String> chatUsers = Kick.list(Kick.CHAT_HIDDEN_USERS);
        final boolean hideTopGifted = Kick.bool(Kick.HIDE_TOP_GIFTED, false);
        final boolean hideRecordings = Kick.bool(Kick.HIDE_RECORDINGS, false);

        private static Filters cached;
        private static long cachedAt;

        static synchronized Filters now() {
            long t = android.os.SystemClock.uptimeMillis();
            if (cached == null || t - cachedAt > 2000) {
                cached = new Filters();
                cachedAt = t;
            }
            return cached;
        }

        boolean isEmpty() {
            return words.isEmpty() && channels.isEmpty() && categories.isEmpty() && chatWords.isEmpty()
                    && chatUsers.isEmpty() && !hideTopGifted && !hideRecordings;
        }

        /** Why an item of a list is hidden, or null: a chat message by its sender and text, a stream or clip by its
         * title, channel, and category. */
        String hides(JSONObject item) {
            if (item.has("content") && item.has("sender")) {
                JSONObject sender = item.optJSONObject("sender");
                String user = sender == null ? null : sender.optString("username", sender.optString("slug", null));
                if (user != null && chatUsers.contains(user.toLowerCase(Locale.ROOT))) return "chat user " + user;
                String w = Kick.matchWord(item.optString("content"), chatWords);
                return w == null ? null : "chat word " + w;
            }
            String title = item.has("session_title") ? item.optString("session_title")
                    : item.has("title") && looksLikeStream(item) ? item.optString("title") : null;
            boolean stream = title != null || looksLikeStream(item);
            if (!stream && !isRecording(item)) return null;
            if (hideRecordings && isRecording(item)) return "recording of a past stream" + (title == null ? "" : ": " + title);
            String w = Kick.matchWord(title, words);
            if (w != null) return "word " + w + " in " + title;
            String ch = channelOf(item);
            if (ch != null && channels.contains(ch)) return "channel " + ch;
            String cat = categoryOf(item);
            if (cat != null && categories.contains(cat)) return "category " + cat;
            return null;
        }

        /** A recording of a past stream (a VOD): a stream object marked not live with a video or a duration, or a
         * video object of its own. Clips are no recordings. */
        static boolean isRecording(JSONObject o) {
            if (o.has("clip_id") || o.optString("type").equalsIgnoreCase("clip")) return false;
            String type = o.optString("type").toLowerCase(Locale.ROOT);
            if (type.equals("vod") || type.equals("video") || type.equals("past_broadcast")) return true;
            JSONObject video = o.optJSONObject("video");
            if (video != null && (video.has("uuid") || video.has("id")) && !o.optBoolean("is_live", false)) return true;
            return o.has("is_live") && !o.optBoolean("is_live") && (o.has("duration") || o.has("source") || o.has("vod_id"));
        }

        private static boolean looksLikeStream(JSONObject o) {
            return o.has("viewer_count") || o.has("viewers") || o.has("is_live") || o.has("livestream_id")
                    || o.has("channel") && (o.has("thumbnail") || o.has("category") || o.has("categories"));
        }

        private static String channelOf(JSONObject o) {
            JSONObject c = o.optJSONObject("channel");
            String s = null;
            if (c != null) {
                s = c.optString("slug", null);
                JSONObject u = c.optJSONObject("user");
                if (s == null && u != null) s = u.optString("username", null);
                if (s == null) s = c.optString("username", null);
            }
            if (s == null) s = o.optString("channel_slug", o.optString("slug", o.optString("username", null)));
            return s == null ? null : s.toLowerCase(Locale.ROOT);
        }

        private static String categoryOf(JSONObject o) {
            JSONObject c = o.optJSONObject("category");
            String s = c == null ? null : c.optString("name", null);
            if (s == null) {
                JSONArray cs = o.optJSONArray("categories");
                JSONObject first = cs == null ? null : cs.optJSONObject(0);
                if (first != null) s = first.optString("name", null);
            }
            if (s == null) s = o.optString("category_name", null);
            return s == null ? null : s.toLowerCase(Locale.ROOT);
        }
    }
}
