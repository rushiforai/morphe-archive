package dev.twitchpatches.extension.emotes;

import java.net.URI;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class EmoteProviders {
    static final String BTTV_GLOBAL = "https://api.betterttv.net/3/cached/emotes/global";
    static final String SEVEN_GLOBAL = "https://7tv.io/v3/emote-sets/global";
    static final String FFZ_GLOBAL = "https://api.frankerfacez.com/v1/set/global";

    static String catalogUrl(int index, String id) {
        if (index == 0) return id == null ? BTTV_GLOBAL : "https://api.betterttv.net/3/cached/users/twitch/" + id;
        if (index == 1) return id == null ? SEVEN_GLOBAL : "https://7tv.io/v3/users/twitch/" + id;
        return id == null ? FFZ_GLOBAL : "https://api.frankerfacez.com/v1/room/id/" + id;
    }

    static Map<String, Emote> parse(int index, String source, boolean global) throws JSONException {
        if (index == 0) return bttv(source, global);
        if (index == 1) return sevenTv(source, global);
        return frankerFaceZ(source, global);
    }

    static Map<String, Emote> frankerFaceZ(String source, boolean global) throws JSONException {
        JSONObject root = new JSONObject(source);
        JSONObject sets = root.optJSONObject("sets");
        Map<String, Emote> result = new LinkedHashMap<>();
        if (sets == null) return result;
        JSONArray selected = root.optJSONArray("default_sets");
        if (!global) {
            JSONObject room = root.optJSONObject("room");
            selected = room == null ? null : new JSONArray().put(room.opt("set"));
        }
        if (selected == null) return result;
        for (int s = 0; s < Math.min(selected.length(), 64); s++) {
            JSONObject set = sets.optJSONObject(selected.optString(s));
            JSONArray entries = set == null ? null : set.optJSONArray("emoticons");
            if (entries == null) continue;
            for (int i = 0; i < Math.min(entries.length(), 2000); i++) {
                JSONObject item = entries.optJSONObject(i);
                if (item == null || !validCode(item.optString("name"))) continue;
                JSONObject animated = item.optJSONObject("animated");
                String url = ffzUrl(animated == null ? item.optJSONObject("urls") : animated);
                if (url != null) result.put(item.optString("name"), new Emote(item.optString("name"), url, animated != null, false));
            }
        }
        return result;
    }

    private static String ffzUrl(JSONObject urls) {
        if (urls == null) return null;
        for (String size : new String[]{"2", "1", "4"}) {
            String url = urls.optString(size);
            if (url.startsWith("//")) url = "https:" + url;
            if (imageUrl(url) && URI.create(url).getHost().equals("cdn.frankerfacez.com")) return url;
        }
        return null;
    }

    static String channelId(String id) {
        return id != null && id.matches("[1-9][0-9]{0,19}") ? id : null;
    }

    static Map<String, Emote> bttv(String source, boolean global) throws JSONException {
        Map<String, Emote> result = new LinkedHashMap<>();
        if (global) bttvArray(new JSONArray(source), result);
        else {
            JSONObject root = new JSONObject(source);
            bttvArray(root.optJSONArray("sharedEmotes"), result);
            bttvArray(root.optJSONArray("channelEmotes"), result);
        }
        return result;
    }

    private static void bttvArray(JSONArray array, Map<String, Emote> target) {
        if (array == null) return;
        for (int i = 0; i < Math.min(array.length(), 2000); i++) {
            JSONObject item = array.optJSONObject(i);
            if (item == null) continue;
            String code = item.optString("code");
            String id = item.optString("id");
            if (!validCode(code) || !id.matches("[A-Za-z0-9]{1,64}")) continue;
            boolean animated = item.optBoolean("animated") || "gif".equals(item.optString("imageType"));
            target.put(code, new Emote(code, "https://cdn.betterttv.net/emote/" + id + (animated ? "/2x.gif" : "/2x.webp"), animated, false));
        }
    }

    static Map<String, Emote> sevenTv(String source, boolean global) throws JSONException {
        JSONObject root = new JSONObject(source);
        JSONObject set = global ? root : root.optJSONObject("emote_set");
        Map<String, Emote> result = new LinkedHashMap<>();
        JSONArray array = set == null ? null : set.optJSONArray("emotes");
        if (array == null) return result;
        for (int i = 0; i < Math.min(array.length(), 2000); i++) {
            JSONObject item = array.optJSONObject(i);
            if (item == null) continue;
            String code = item.optString("name");
            JSONObject data = item.optJSONObject("data");
            JSONObject host = data == null ? null : data.optJSONObject("host");
            if (!validCode(code) || host == null) continue;
            String base = host.optString("url");
            if (base.startsWith("//")) base = "https:" + base;
            String file = webp(host.optJSONArray("files"));
            if (file == null) continue;
            String url = base + (base.endsWith("/") ? "" : "/") + file;
            if (imageUrl(url)) result.put(code, new Emote(code, url, data.optBoolean("animated"), (item.optInt("flags") & 1) != 0));
        }
        return result;
    }

    private static String webp(JSONArray files) {
        if (files == null) return null;
        String fallback = null;
        for (int i = 0; i < files.length(); i++) {
            JSONObject file = files.optJSONObject(i);
            if (file == null || !"WEBP".equalsIgnoreCase(file.optString("format"))) continue;
            String name = file.optString("name");
            if (!name.matches("[1-4]x[.]webp") || file.optInt("width", 0) > 512 || file.optInt("height", 0) > 512) continue;
            if ("2x.webp".equals(name)) return name;
            if (fallback == null) fallback = name;
        }
        return fallback;
    }

    static boolean imageUrl(String url) {
        try {
            URI uri = URI.create(url);
            String host = uri.getHost();
            return "https".equals(uri.getScheme()) && uri.getUserInfo() == null && uri.getPort() == -1 &&
                    ("cdn.betterttv.net".equals(host) || "cdn.7tv.app".equals(host) || "cdn.7tv.io".equals(host) || "cdn.frankerfacez.com".equals(host));
        } catch (IllegalArgumentException error) { return false; }
    }

    private static boolean validCode(String code) {
        if (code.isEmpty() || code.length() > 128) return false;
        for (int i = 0; i < code.length(); i++) if (EmoteTokens.separator(code.charAt(i))) return false;
        return true;
    }

    private EmoteProviders() { }
}
