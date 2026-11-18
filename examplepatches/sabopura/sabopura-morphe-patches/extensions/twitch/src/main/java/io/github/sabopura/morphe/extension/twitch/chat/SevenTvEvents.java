// Protocol handling adapted from Lurk's TwitchSevenTvBadges, Copyright (C) 2026 Jordan Woodson, GPL-3.0; see NOTICE.
package io.github.sabopura.morphe.extension.twitch.chat;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * What 7TV's event service has said about badges and name paints in the open channel. No I/O, so it can be
 * tested alone.
 */
final class SevenTvEvents {
    private static final int MAX_BADGES = 2048, MAX_PAINTS = 2048, MAX_USERS = 5000;

    /** What a frame did: nothing to show, other badges, the session ended, or other name paints. */
    static final int KEEP = 0, CHANGED = 1, RECONNECT = 2, PAINTS_CHANGED = 3;

    private final Map<String, ChatMetadata.Badge> badges = new ConcurrentHashMap<>();
    private final Map<String, NamePaint> paints = new ConcurrentHashMap<>();
    private final Map<String, String> users = holders(), painted = holders();

    /** Twitch user ID to cosmetic ID, forgetting the chatters seen longest ago. */
    private static Map<String, String> holders() {
        return Collections.synchronizedMap(new LinkedHashMap<String, String>(256, .75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                return size() > MAX_USERS;
            }
        });
    }

    ChatMetadata.Badge badgeOf(String userId) {
        String id = users.get(userId);
        return id == null ? null : badges.get(id);
    }

    NamePaint paintOf(String userId) {
        String id = painted.get(userId);
        return id == null ? null : paints.get(id);
    }

    static String subscribe(String type, String channelId) throws JSONException {
        JSONObject condition = new JSONObject().put("platform", "TWITCH").put("ctx", "channel").put("id", channelId);
        return new JSONObject().put("op", 35)
                .put("d", new JSONObject().put("type", type).put("condition", condition)).toString();
    }

    /** One text frame from the service. */
    int handle(String frame) {
        JSONObject message;
        try {
            message = new JSONObject(frame);
        } catch (JSONException failure) {
            return KEEP;
        }
        switch (message.optInt("op", -1)) {
            case 0:
                return dispatch(message.optJSONObject("d"));
            case 4:
            case 7:
                return RECONNECT;
            default:
                return KEEP;
        }
    }

    private int dispatch(JSONObject event) {
        if (event == null) return KEEP;
        String type = event.optString("type");
        JSONObject body = event.optJSONObject("body"), object = body == null ? null : body.optJSONObject("object");
        String kind = object == null ? "" : object.optString("kind");
        boolean paint = kind.equals("PAINT");
        if (!paint && !kind.equals("BADGE")) return KEEP;
        int result = type.startsWith("cosmetic.") ? cosmetic(type, object.optJSONObject("data"), paint)
                : type.startsWith("entitlement.") ? entitlement(type, object, paint ? painted : users) : KEEP;
        return paint && result == CHANGED ? PAINTS_CHANGED : result;
    }

    private int cosmetic(String type, JSONObject data, boolean paint) {
        String id = data == null ? "" : data.optString("id", "");
        if (id.isEmpty()) return KEEP;
        if (type.equals("cosmetic.delete")) return (paint ? paints : badges).remove(id) != null ? CHANGED : KEEP;
        if (paint) {
            NamePaint parsed = NamePaint.parse(data);
            // A paint that can no longer be drawn takes the place of nothing: its holders get their own colour back.
            if (parsed == null) return paints.remove(id) != null ? CHANGED : KEEP;
            if (paints.size() >= MAX_PAINTS && !paints.containsKey(id)) return KEEP;
            NamePaint previous = paints.put(id, parsed);
            return previous == null || !previous.same(parsed) ? CHANGED : KEEP;
        }
        ChatMetadata.Badge badge = parseBadge(data);
        if (badge == null || badges.size() >= MAX_BADGES && !badges.containsKey(id)) return KEEP;
        ChatMetadata.Badge previous = badges.put(id, badge);
        return previous == null || !previous.url.equals(badge.url) ? CHANGED : KEEP;
    }

    private static int entitlement(String type, JSONObject object, Map<String, String> holders) {
        String cosmetic = object.optString("ref_id", ""), user = twitchUser(object.optJSONObject("user"));
        if (cosmetic.isEmpty() || user == null) return KEEP;
        if (type.equals("entitlement.delete")) return holders.remove(user, cosmetic) ? CHANGED : KEEP;
        return cosmetic.equals(holders.put(user, cosmetic)) ? KEEP : CHANGED;
    }

    private static ChatMetadata.Badge parseBadge(JSONObject data) {
        JSONObject host = data.optJSONObject("host");
        JSONArray files = host == null ? null : host.optJSONArray("files");
        String base = host == null ? "" : host.optString("url", "");
        if (files == null || !base.startsWith("//cdn.7tv.app/")) return null;
        String chosen = null;
        int chosenWidth = 0;
        for (int i = 0; i < files.length(); i++) {
            JSONObject file = files.optJSONObject(i);
            if (file == null) continue;
            String name = file.optString("name", "");
            int width = file.optInt("width", 0);
            if (!name.endsWith(".webp") && !name.endsWith(".png")) continue;
            if (name.toLowerCase(Locale.ROOT).startsWith("4x") || width > 72 || width <= chosenWidth) continue;
            if (file.optInt("frame_count", 1) > 1) name = file.optString("static_name", name);
            chosen = name;
            chosenWidth = width;
        }
        if (chosen == null || chosen.contains("/") || chosen.contains("?")) return null;
        String title = data.optString("tooltip", "");
        if (title.isEmpty()) title = data.optString("name", "7TV");
        return new ChatMetadata.Badge(title, "https:" + base + "/" + chosen);
    }

    private static String twitchUser(JSONObject user) {
        JSONArray connections = user == null ? null : user.optJSONArray("connections");
        if (connections == null) return null;
        for (int i = 0; i < connections.length(); i++) {
            JSONObject connection = connections.optJSONObject(i);
            if (connection == null || !"TWITCH".equals(connection.optString("platform"))) continue;
            String id = connection.optString("id", "");
            return id.matches("[0-9]{1,20}") ? id : null;
        }
        return null;
    }
}
