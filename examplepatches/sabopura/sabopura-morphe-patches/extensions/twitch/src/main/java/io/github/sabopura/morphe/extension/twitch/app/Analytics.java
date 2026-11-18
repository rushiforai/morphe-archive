package io.github.sabopura.morphe.extension.twitch.app;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/** Stops Twitch's analytics while keeping the events that count a view toward Drops and streamers' stats. */
@SuppressWarnings("unused")
public final class Analytics {
    public static final String KEY = "disable_analytics";
    private static final Set<String> KEPT_EVENTS = new HashSet<>(Arrays.asList(
            "minute-watched", "clips_minute_watched", "video-play", "n_second_play"));

    private Analytics() {
    }

    static boolean keptEvent(String event) {
        return KEPT_EVENTS.contains(event);
    }

    /** Injection point: an analytics SDK about to start or send. */
    public static boolean off() {
        try {
            if (CrashGuard.paused() || !Features.has(Feature.DISABLE_ANALYTICS)) return false;
            SharedPreferences prefs = preferences();
            return prefs != null && prefs.getBoolean(KEY, false);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.analytics", e);
            return false;
        }
    }

    /** Injection point: Twitch's Spade event dispatcher, for each event name. */
    public static boolean dropEvent(String event) {
        return event != null && !keptEvent(event) && off();
    }

    private static SharedPreferences preferences() {
        SharedPreferences prefs = ChatSettings.preferences();
        if (prefs != null) return prefs;
        // Crashlytics and Sentry start from content providers, before Application.onCreate reads the settings.
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            return app instanceof Context ? ChatSettings.preferences((Context) app) : null;
        } catch (ReflectiveOperationException e) {
            Diagnostics.note("app.analytics-early-settings", e);
            return null;
        }
    }
}
