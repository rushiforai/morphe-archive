package io.github.sabopura.morphe.extension.twitch.app;

import android.content.SharedPreferences;

import org.json.JSONException;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.app.NewHomeSections.Part;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/**
 * The settings that hide parts of Following, on the React Native home that Twitch 31.9.0 and later
 * show signed-in phones. That home is drawn by JavaScript from the data it fetches, out of reach of
 * a patch, but every response passes through here on its way there.
 */
public final class NewHomeFeed {
    private NewHomeFeed() {
    }

    /** True when the setting {@code key} hides its part on the React Native home too, not only on the classic one. */
    public static boolean reaches(String key) {
        if (!Features.has(Feature.NEW_HOME_FEED)) return false;
        for (Part part : Part.values()) if (part.key.equals(key)) return Features.has(part.feature);
        return false;
    }

    /**
     * Injection point: a response body about to be handed to the React Native screens, on a
     * network thread. Gives back the same array unless a hidden part was in it.
     */
    public static byte[] rewrite(byte[] body) {
        try {
            if (!Features.has(Feature.NEW_HOME_FEED)) return body;
            SharedPreferences settings = PlayerTools.preferences();
            if (settings == null) return body;
            return NewHomeSections.without(body, part -> settings.getBoolean(part.key, false) && Features.has(part.feature));
        } catch (JSONException | RuntimeException | LinkageError e) {
            Diagnostics.note("app.new-home-feed", e);
            return body;
        }
    }
}
