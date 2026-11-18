package io.github.sabopura.morphe.extension.twitch.original;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

/** What was remembered per channel login, stored as one JSON object. Unreadable entries are dropped. */
final class ProfileStore {
    /** Volume is the player's own, 0 to 1; speed is 0 unless a VOD set one. */
    static final class Profile {
        final float volume, vodSpeed;
        final boolean danmaku;
        final int chatPercent;

        Profile(float volume, boolean danmaku, float vodSpeed, int chatPercent) {
            this.volume = volume;
            this.danmaku = danmaku;
            this.vodSpeed = vodSpeed;
            this.chatPercent = chatPercent;
        }
    }

    private ProfileStore() {
    }

    static Map<String, Profile> parse(String stored) {
        Map<String, Profile> profiles = new LinkedHashMap<>();
        if (stored == null || stored.isEmpty()) return profiles;
        try {
            JSONObject all = new JSONObject(stored);
            for (Iterator<String> keys = all.keys(); keys.hasNext(); ) {
                String login = keys.next();
                JSONObject entry = all.optJSONObject(login);
                if (entry != null) profiles.put(login, new Profile((float) entry.optDouble("v", 1),
                        entry.optBoolean("d", true), (float) entry.optDouble("s", 0), entry.optInt("f", 100)));
            }
        } catch (JSONException ignored) {
        }
        return profiles;
    }

    static String serialize(Map<String, Profile> profiles) {
        JSONObject all = new JSONObject();
        try {
            for (Map.Entry<String, Profile> entry : new TreeMap<>(profiles).entrySet()) {
                Profile p = entry.getValue();
                all.put(entry.getKey(), new JSONObject().put("v", p.volume).put("d", p.danmaku)
                        .put("s", p.vodSpeed).put("f", p.chatPercent));
            }
        } catch (JSONException ignored) {
        }
        return all.toString();
    }
}
