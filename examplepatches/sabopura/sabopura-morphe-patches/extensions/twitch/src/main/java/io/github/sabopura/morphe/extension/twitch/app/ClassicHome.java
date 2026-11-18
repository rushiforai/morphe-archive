package io.github.sabopura.morphe.extension.twitch.app;

import android.content.SharedPreferences;

import java.util.function.Supplier;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/**
 * Twitch's native home instead of the React Native one that Twitch 31.9.0 and later show signed-in
 * phones. Twitch keeps the native home for tablets, signed-out use and devices on its block list,
 * and only that home has the views some settings change: the card size, the recommended streams and
 * the recap cards. What the React Native home can hide is {@link NewHomeFeed}'s.
 */
public final class ClassicHome {
    public static final String KEY = "classic_home";
    private static final Latch LATCH = new Latch();

    private ClassicHome() {
    }

    /**
     * Injection point: the start of Twitch's decision to use its React Native screens. True makes
     * the decision answer no.
     */
    public static boolean forced() {
        try {
            return LATCH.get(ClassicHome::setting);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.classic-home", e);
            return false;
        }
    }

    /** True when the switch no longer says what this run of the app started with: it applies after a restart. */
    public static boolean waitsForRestart() {
        try {
            Boolean running = LATCH.peek(), wanted = setting();
            return running != null && wanted != null && !running.equals(wanted);
        } catch (RuntimeException | LinkageError e) {
            return false;
        }
    }

    /** Null while the settings cannot be read yet. */
    private static Boolean setting() {
        if (!Features.has(Feature.CLASSIC_HOME)) return false;
        SharedPreferences prefs = ChatSettings.preferences();
        return prefs == null ? null : prefs.getBoolean(KEY, false);
    }

    /**
     * The first answer, kept until the process ends. Twitch asks at launch, on navigation, in the
     * theatre and when prewarming; an answer that changed mid-run would mix two screen stacks.
     */
    static final class Latch {
        private volatile Boolean answer;

        boolean get(Supplier<Boolean> read) {
            Boolean kept = answer;
            if (kept != null) return kept;
            kept = read.get();
            // Nothing to keep before the settings exist: answer as Twitch would and ask again later.
            if (kept == null) return false;
            answer = kept;
            return kept;
        }

        /** The kept answer, or null when nothing has asked yet. */
        Boolean peek() {
            return answer;
        }
    }
}
