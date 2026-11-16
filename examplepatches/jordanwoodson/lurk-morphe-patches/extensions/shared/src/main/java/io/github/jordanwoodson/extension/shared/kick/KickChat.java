package io.github.jordanwoodson.extension.shared.kick;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.webkit.WebView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.lang.ref.WeakReference;
import java.util.UUID;

import io.github.jordanwoodson.extension.shared.ChatFilter;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Kick's chat page. Kick draws chat in a WebView showing https://chat.mobile.kick.com, which has its own realtime
 * connection and draws every chat line itself, so the switches that change chat lines work in that page: a script
 * (assets/lurk-chat.js, copied in by the patches) runs there with the switches that are on.
 */
@SuppressWarnings("unused")
public final class KickChat {
    private static final String HOST = "chat.mobile.kick.com";
    private static final String ORIGIN = "https://" + HOST;
    private static final String SCRIPT = "lurk-chat.js";
    private static final String MODERATOR_SCRIPT = "lurk-chat-moderator.js";
    private static final String SHOW_DELETED = "chat_show_deleted";
    private static final String IGNORE_CLEARS = "chat_ignore_clears";
    private static final String TIMESTAMPS = "chat_timestamps";
    /** Chat timestamps clock, Twitch's key and values: 0 for 13:05, 1 for 1:05. */
    private static final String CLOCK = "chat_timestamp_format";
    private static final String TEXT_SIZE = "chat_text_size";
    private static final String COMPACT = "chat_compact";
    static final String SEVEN_TV = "emotes_7tv";
    /** Third-party badges: 7TV badges, Twitch's key. */
    static final String SEVEN_TV_BADGES = "badges_7tv";
    /** A switch, then the page's elements for the chat lines it hides. */
    private static final String[][] HIDE = {
            {"hide_sub_messages", ".subscription-container", ".subgift-container"},
            {"hide_host_messages", ".host-container"},
            {"hide_reward_redemptions", ".reward-redeem-container"},
    };
    /** Kick channel ID -> its slug, and its owner's Kick user ID when the response had it, from KickHttp. */
    private static final Map<String, String> SLUGS = boundedMap();
    private static final Map<String, String> OWNERS = boundedMap();
    private static final Map<WebView, Page> PAGES = new WeakHashMap<>();
    private static WeakReference<WebView> active = new WeakReference<>(null);

    private static Map<String, String> boundedMap() {
        return java.util.Collections.synchronizedMap(new LinkedHashMap<String, String>(256, .75f, true) {
            protected boolean removeEldestEntry(Map.Entry<String, String> entry) { return size() > 256; }
        });
    }

    private static final class Page {
        final String url, generation = UUID.randomUUID().toString();
        final Object channel, slug;
        /** The signed-in account from the page's config (selfUser), lowercase, "" when signed out: for mentions. */
        final String self, selfName;
        Page(String url, JSONObject options, JSONObject selfUser) {
            this.url = url; channel = options.opt("channelId"); slug = options.opt("sevenTvChannel");
            // Lines are matched by the name shown in chat, so that is "self" (never a mention of yourself); the
            // kick.com handle also counts as a mention.
            String username = selfUser == null ? "" : selfUser.optString("username").toLowerCase(Locale.ROOT);
            String handle = selfUser == null ? "" : selfUser.optString("slug").toLowerCase(Locale.ROOT);
            self = username.isEmpty() ? handle : username;
            selfName = handle.equals(self) ? "" : handle;
        }
    }
    /** The type of the page script's Chat keywords batches, and the most lines one batch may hold. */
    private static final String KEYWORDS = "lurkKeywords";
    private static final int KEYWORD_BATCH = 200;
    private static String script;
    private static String moderatorScript;

    private KickChat() {
    }

    /**
     * Injection point: the end of react-native-webview's RNCWebView constructor, before the view loads anything.
     * With Show deleted messages on, registers lurk-chat-moderator.js as a document-start script for the chat
     * page's origin: the page then gets its moderator view from inside the WebView, and the address the app
     * loads, which Kick's server sees, stays as Kick builds it.
     */
    public static void onWebViewCreated(WebView view) {
        try {
            if (view == null || !on(SHOW_DELETED)) return;
            if (!documentStartSupported()) {
                Log.w(Logger.TAG, "Show deleted messages: this Android System WebView can't run a script before "
                        + "the chat page's own, so deleted messages show as in stock Kick");
                return;
            }
            String source = asset(view.getContext(), MODERATOR_SCRIPT);
            if (source == null) return;
            addDocumentStartScript(view, source, Collections.singleton(ORIGIN));
        } catch (RuntimeException e) {
            Log.w(Logger.TAG, "Show deleted messages: " + e);
        }
    }

    /** Bridged at patch time: androidx.webkit's WebViewFeature.isFeatureSupported("DOCUMENT_START_SCRIPT"). */
    private static boolean documentStartSupported() {
        return false;
    }

    /** Bridged at patch time: androidx.webkit's WebViewCompat.addDocumentStartJavaScript(view, script, origins). */
    private static void addDocumentStartScript(WebView view, String script, Set<String> origins) {
    }

    /**
     * Injection point: react-native-webview's RNCWebViewClient.onPageStarted and onPageFinished, after the super
     * call. At page start the WebView can still be showing the previous document, so the script runs at both and
     * applies itself once per page.
     */
    public static synchronized void onPageStarted(WebView view, String url) {
        onPageDisposed(view);
        onPage(view, url);
    }

    /** End only this WebView's authority, even when no replacement page starts. */
    public static synchronized void onPageDisposed(WebView view) {
        PAGES.remove(view);
        if (active.get() == view) {
            active.clear();
            KickComposer.send("channel", "{\"enabled\":false}");
        }
    }

    public static synchronized void onPage(WebView view, String url) {
        try {
            if (view == null || url == null) return;
            Uri uri = Uri.parse(url);
            // Kick's KICKs gift preview is the same page with preview=true, showing that one gift.
            if (!HOST.equals(uri.getHost()) || uri.getQueryParameter("preview") != null) return;
            JSONObject options = options(uri);
            if (options.length() == 0) return;
            boolean sevenTv = options.optBoolean("sevenTv");
            if (sevenTv || options.optBoolean("keywords")) {
                // The page's messages to the app are taken only from this document of this WebView.
                Page page = PAGES.get(view);
                if (page == null || !page.url.equals(url)) {
                    page = new Page(url, options, selfUser(uri)); PAGES.put(view, page);
                    if (sevenTv) {
                        active = new WeakReference<>(view);
                        JSONObject context = new JSONObject().put("enabled", true).put("generation", page.generation)
                                .put("channelId", page.channel == null ? JSONObject.NULL : page.channel);
                        KickComposer.send("channel", context.toString());
                    }
                }
                options.put("generation", page.generation);
            }
            String source = asset(view.getContext(), SCRIPT);
            if (source == null) return;
            view.evaluateJavascript(source + "(" + options + ");", result -> Logger.d("chat page: " + result));
        } catch (RuntimeException | JSONException e) {
            Logger.d("chat page: " + e);
        }
    }

    /**
     * Consume only our messages (7TV catalogs, Chat keywords batches); every ordinary stock bridge message keeps its
     * original path. Only Lurk's page script sends ours, so with both switches off nothing is parsed here.
     */
    public static synchronized boolean onMessage(WebView view, String message, String sourceUrl) {
        boolean sevenTv = on(SEVEN_TV), keywords = on(ChatFilter.KEY);
        if (!sevenTv && !keywords) return false;
        if (message == null || message.length() > 1024 * 1024 || !message.startsWith("{")) return false;
        JSONObject data;
        try { data = new JSONObject(message); }
        catch (JSONException e) { return false; }
        String type = data.optString("type");
        if (KEYWORDS.equals(type)) {
            if (keywords) keywordBatch(view, data, sourceUrl);
            return true;
        }
        if (!"lurk7tvCatalog".equals(type) && !"lurk7tvDispose".equals(type)) return false;
        if (!sevenTv) return true;
        try {
            Page page = PAGES.get(view);
            if (page == null || active.get() != view || !chatOrigin(sourceUrl) ||
                    !chatOrigin(view.getUrl()) || !page.generation.equals(data.optString("generation")) ||
                    !java.util.Objects.equals(page.channel, data.opt("channelId")) ||
                    !java.util.Objects.equals(page.slug, data.opt("slug"))) return true;
            if ("lurk7tvDispose".equals(type)) {
                onPageDisposed(view);
                return true;
            }
            JSONObject clean = KickCatalog.sanitize(data, page.generation, page.channel, page.slug);
            if (clean == null) return true;
            KickComposer.send("catalog", clean.toString());
        } catch (RuntimeException e) {
            Logger.d("Kick composer: rejected catalog");
        }
        return true;
    }

    /**
     * Chat keywords: classifies a batch of new chat lines from this page with ChatFilter (blocked users, by the
     * name shown and the kick.com handle; blocked words; mentions of the signed-in account; highlight words),
     * vibrates once per highlighted line when that switch is on, and hands the page its verdicts for those lines:
     * 1 tints one, 2 hides it.
     */
    private static void keywordBatch(WebView view, JSONObject data, String sourceUrl) {
        try {
            Page page = PAGES.get(view);
            if (page == null || !chatOrigin(sourceUrl) || !chatOrigin(view.getUrl()) ||
                    !page.generation.equals(data.optString("generation"))) return;
            JSONArray items = data.optJSONArray("items");
            if (items == null) return;
            ChatFilter.Lists lists = ChatFilter.lists(page.self, page.selfName);
            boolean vibrate = Settings.isEnabled(ChatFilter.VIBRATE);
            JSONObject verdicts = new JSONObject();
            for (int i = 0; i < Math.min(items.length(), KEYWORD_BATCH); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item == null) continue;
                String id = item.optString("id");
                if (!id.matches("[0-9A-Za-z-]{1,64}")) continue;
                String name = item.optString("name").toLowerCase(Locale.ROOT);
                String handle = item.optString("slug").toLowerCase(Locale.ROOT);
                String text = item.optString("text");
                if (text.length() > 2000) text = text.substring(0, 2000);
                int verdict = ChatFilter.classify(name, text, lists);
                if (verdict != ChatFilter.HIDE && !handle.isEmpty() && !handle.equals(name) &&
                        ChatFilter.classify(handle, "", lists) == ChatFilter.HIDE) verdict = ChatFilter.HIDE;
                if (verdict == ChatFilter.NONE) continue;
                verdicts.put(id, verdict);
                if (verdict == ChatFilter.HIGHLIGHT && vibrate) ChatFilter.vibrate(view.getContext(), "kick:" + id);
            }
            if (verdicts.length() == 0) return;
            view.evaluateJavascript("window.lurkChat && window.lurkChat.verdicts && window.lurkChat.verdicts("
                    + verdicts + ");", null);
        } catch (RuntimeException | JSONException e) {
            Logger.d("chat keywords: " + e);
        }
    }

    /** The page config's selfUser (id, slug, username) when signed in, else null. */
    private static JSONObject selfUser(Uri uri) {
        try {
            String config = uri.getQueryParameter("config");
            return config == null ? null : new JSONObject(config).optJSONObject("selfUser");
        } catch (JSONException e) {
            return null;
        }
    }

    private static boolean chatOrigin(String url) {
        if (url == null) return false;
        Uri uri = Uri.parse(url);
        return "https".equals(uri.getScheme()) && HOST.equals(uri.getHost()) && uri.getPort() == -1 && uri.getUserInfo() == null;
    }

    static boolean on(String key) {
        return Settings.isRegistered(key) && Settings.isEnabled(key);
    }

    /** A Kick channel response (KickHttp): remembers which channel it is, for 7TV. */
    static void onChannel(String json) {
        try {
            JSONObject channel = new JSONObject(json);
            String channelId = id(channel.opt("id"));
            String slug = channel.optString("slug");
            if (channelId == null || slug.isEmpty()) return;
            String owner = id(channel.opt("user_id"));
            if (owner == null) owner = pictureOwner(channel.optJSONObject("user"));
            if (owner != null) OWNERS.put(channelId, owner);
            if (!slug.equals(SLUGS.put(channelId, slug))) Logger.d("7tv: channel " + channelId + " is " + slug);
        } catch (JSONException e) {
            Logger.d("7tv: unreadable channel response");
        }
    }

    /** Kick's profile pictures live under the owner's user ID: files.kick.com/images/user/{id}/profile_image/... */
    private static final java.util.regex.Pattern PICTURE =
            java.util.regex.Pattern.compile("https://files\\.kick\\.com/images/user/([0-9]{1,20})/profile_image/[^?#]*");

    /**
     * The owner's Kick user ID from the channel info response, which the stream screen asks for and which, unlike
     * the full channel response, has no user_id: only the owner's profile picture, whose address holds it.
     */
    private static String pictureOwner(JSONObject user) {
        String picture = user == null ? "" : user.optString("profile_pic");
        java.util.regex.Matcher matcher = PICTURE.matcher(picture);
        return matcher.matches() ? matcher.group(1) : null;
    }

    private static JSONObject options(Uri uri) throws JSONException {
        JSONObject options = new JSONObject();
        // Only reported: the moderator view itself comes from the document-start script.
        if (on(SHOW_DELETED)) options.put("moderatorView", true);
        if (on(IGNORE_CLEARS)) options.put("ignoreClears", true);
        if (on(ChatFilter.KEY)) options.put("keywords", true);
        if (on(TIMESTAMPS)) {
            options.put("timestamps", true);
            if (Settings.isRegistered(CLOCK)) options.put("clock", Settings.getInt(CLOCK) == 1 ? 1 : 0);
        }
        int textSize = Settings.isRegistered(TEXT_SIZE) ? Settings.getInt(TEXT_SIZE) : 0;
        if (textSize >= 10 && textSize <= 32) options.put("textSize", textSize);
        if (on(COMPACT)) options.put("compact", true);
        JSONArray hide = new JSONArray();
        for (String[] lines : HIDE) {
            if (!on(lines[0])) continue;
            for (int i = 1; i < lines.length; i++) hide.put(lines[i]);
        }
        if (hide.length() > 0) options.put("hide", hide);
        boolean emotes = on(SEVEN_TV), badges = on(SEVEN_TV_BADGES);
        if (emotes || badges) {
            // The app passes the page a JSON config with the channel ID; 7TV knows channels by their owner.
            String config = uri.getQueryParameter("config");
            String channelId = null;
            try {
                channelId = config == null ? null : id(new JSONObject(config).opt("channelId"));
            } catch (JSONException e) {
                // A malformed channel config must not disable independent chat controls.
                Logger.d("7tv: unreadable chat config, global emotes only");
            }
            String slug = channelId == null ? null : SLUGS.get(channelId);
            String owner = channelId == null ? null : OWNERS.get(channelId);
            if (slug == null) Logger.d("7tv: channel " + channelId + " unknown" + (emotes ? ", global emotes only" : ""));
            if (emotes) {
                options.put("sevenTv", true);
                options.put("channelId", channelId == null ? JSONObject.NULL : channelId);
                options.put("sevenTvChannel", slug == null ? JSONObject.NULL : slug);
            }
            if (badges) options.put("sevenTvBadges", true);
            options.put("sevenTvUser", owner == null ? JSONObject.NULL : owner);
        }
        return options;
    }

    private static String id(Object value) {
        if (value instanceof Number) return String.valueOf(((Number) value).longValue());
        if (value instanceof String && !((String) value).isEmpty()) return (String) value;
        return null;
    }

    /** The chat page script or the moderator view script from the APK's assets, read once. */
    private static synchronized String asset(Context context, String name) {
        String cached = SCRIPT.equals(name) ? script : moderatorScript;
        if (cached != null) return cached;
        try (InputStream in = context.getAssets().open(name)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int n; (n = in.read(buffer)) > 0; ) out.write(buffer, 0, n);
            cached = new String(out.toByteArray(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            Log.w(Logger.TAG, "chat page: no " + name + ": " + e);
            return null;
        }
        if (SCRIPT.equals(name)) script = cached;
        else moderatorScript = cached;
        return cached;
    }
}
