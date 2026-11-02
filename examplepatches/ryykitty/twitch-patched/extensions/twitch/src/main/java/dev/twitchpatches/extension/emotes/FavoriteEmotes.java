package dev.twitchpatches.extension.emotes;

import android.app.Application;
import android.content.SharedPreferences;
import android.net.Uri;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.settings.ToggleSetting;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class FavoriteEmotes {
    private static final String ENABLED = "favorite_emotes";
    private static final String KEYS = "favorite_emote_keys";
    private static final String DETAILS = "favorite_emote_details";
    private static final String TOGGLE_LINK = "twitch-patches://favorites/toggle?";
    private static volatile boolean enabled;
    private static volatile List<String> keys = Collections.emptyList();
    private static final Map<String, FavoriteEmoteDetails> details = new HashMap<>();
    private static SharedPreferences preferences;

    private FavoriteEmotes() { }

    public static synchronized void initialize(Application application) {
        if (preferences != null) return;
        preferences = application.getSharedPreferences("twitch_patches_favorite_emotes", 0);
        enabled = preferences.getBoolean(ENABLED, true);
        keys = loadKeys(preferences.getString(KEYS, "[]"));
        loadDetails(preferences.getString(DETAILS, "{}"));
        ReactNativeRuntime.select(9);
        PatchSettings.register(new ToggleSetting() {
            @Override public String key() { return ENABLED; }
            @Override public String title() { return "Favorite emotes"; }
            @Override public String summary() { return "Long-press an emote in the picker or open its card to add it to Favorites."; }
            @Override public SettingSection section() { return SettingSection.CHAT; }
            @Override public boolean isEnabled() { return enabled(); }
            @Override public void setEnabled(boolean checked) {
                enabled = checked;
                preferences.edit().putBoolean(ENABLED, checked).apply();
                changed();
            }
        });
    }

    public static boolean enabled() { return enabled; }

    static List<String> keys() { return keys; }

    static synchronized FavoriteEmoteDetails details(String key) { return details.get(key); }

    public static synchronized String serialized() {
        try {
            return new JSONObject().put("keys", new JSONArray(keys)).put("details", serializedDetails()).toString();
        } catch (JSONException error) {
            return "{\"keys\":[],\"details\":{}}";
        }
    }

    public static boolean openLink(String url) {
        if (url == null || !url.startsWith(TOGGLE_LINK)) return false;
        Uri link = Uri.parse(url);
        if (enabled) toggle(link.getQueryParameter("key"), FavoriteEmoteDetails.of(link.getQueryParameter("token"),
                link.getQueryParameter("channel"), link.getQueryParameter("kind")));
        return true;
    }

    static void toggle(String key, FavoriteEmoteDetails emote) {
        if (!FavoriteEmoteKeys.valid(key)) return;
        synchronized (FavoriteEmotes.class) {
            if (preferences == null) return;
            keys = Collections.unmodifiableList(FavoriteEmoteKeys.toggled(keys, key));
            details.keySet().retainAll(keys);
            if (emote != null && keys.contains(key)) details.put(key, emote);
            try {
                preferences.edit().putString(KEYS, new JSONArray(keys).toString())
                        .putString(DETAILS, serializedDetails().toString()).apply();
            } catch (JSONException ignored) {
                preferences.edit().putString(KEYS, new JSONArray(keys).toString()).apply();
            }
        }
        changed();
    }

    private static void changed() {
        EmotePickerRuntime.refresh(null);
        ReactNativeRuntime.refresh();
    }

    private static JSONObject serializedDetails() throws JSONException {
        JSONObject values = new JSONObject();
        for (Map.Entry<String, FavoriteEmoteDetails> entry : details.entrySet()) values.put(entry.getKey(), entry.getValue().toJson());
        return values;
    }

    private static List<String> loadKeys(String stored) {
        List<String> loaded = new ArrayList<>();
        try {
            JSONArray values = new JSONArray(stored);
            for (int index = 0; index < values.length() && loaded.size() < FavoriteEmoteKeys.LIMIT; index++) {
                String key = values.optString(index);
                if (FavoriteEmoteKeys.valid(key) && !loaded.contains(key)) loaded.add(key);
            }
        } catch (JSONException ignored) {
            return Collections.emptyList();
        }
        return Collections.unmodifiableList(loaded);
    }

    private static void loadDetails(String stored) {
        try {
            JSONObject values = new JSONObject(stored);
            for (String key : keys) {
                FavoriteEmoteDetails emote = FavoriteEmoteDetails.from(values.optJSONObject(key));
                if (emote != null) details.put(key, emote);
            }
        } catch (JSONException ignored) {
            details.clear();
        }
    }
}
