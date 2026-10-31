package app.morphe.extension.syncforreddit.ui.comments;

import android.content.SharedPreferences;

import androidx.preference.Preference;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

/**
 * Turns off the media size settings that do not apply to the size being used.
 *
 * <p>Three of the four settings belong to one way of sizing media each, and the two that are not
 * in use say nothing about what is drawn. They are left where they are so that what they offer
 * can still be seen, and turned off, which fades them.
 *
 * <p>Sync's own settings screens are its own fragments, so unlike the translation screen there
 * is nowhere of ours to do this from. It is done as a screen finishes loading its rows instead,
 * which happens for every screen; a screen without these rows has nothing to turn off and is
 * left alone.
 *
 * @noinspection unused
 */
public final class InlineMediaRows {
    /** The row that says how media is sized, which decides which of the others apply. */
    private static final String MEDIA_SIZE = "sync_up_inline_media_size";

    /** Belongs to media drawn at its own size. */
    private static final String MAX_WIDTH = "sync_up_inline_media_max_width";

    /** Belongs to media drawn the same width. */
    private static final String FIXED_WIDTH = "sync_up_inline_media_width";

    /** Belongs to media drawn the same height. */
    private static final String FIXED_HEIGHT = "sync_up_inline_media_height";

    private static final int ITS_OWN_SIZE = 0;
    private static final int SAME_WIDTH = 1;
    private static final int SAME_HEIGHT = 2;

    /**
     * Held for as long as the screen is up: the settings keep only a weak hold on a listener,
     * and one that is not kept anywhere is collected and stops being told anything.
     */
    private static SharedPreferences.OnSharedPreferenceChangeListener watching;

    private InlineMediaRows() {}

    /** Called as a screen of the settings finishes loading its rows. */
    public static void settle(pa.d screen) {
        if (screen == null || !isPatchIncluded()) {
            return;
        }
        try {
            if (screen.y(MEDIA_SIZE) == null) {
                // Some other screen of the settings; nothing here belongs to it.
                return;
            }
            showWhatApplies(screen);
            watchForAChange(screen);
        } catch (Exception ex) {
            Logger.printInfo(() -> "inline comments: could not settle which rows apply: " + ex);
        }
    }

    private static void showWhatApplies(pa.d screen) {
        int size = SyncUpSettings.number(MEDIA_SIZE, ITS_OWN_SIZE);
        enable(screen, MAX_WIDTH, size == ITS_OWN_SIZE);
        enable(screen, FIXED_WIDTH, size == SAME_WIDTH);
        enable(screen, FIXED_HEIGHT, size == SAME_HEIGHT);
    }

    private static void enable(pa.d screen, String key, boolean applies) {
        Preference row = screen.y(key);
        if (row != null) {
            row.q0(applies);
        }
    }

    /** So that choosing a size shows what it applies to without leaving the screen. */
    private static void watchForAChange(pa.d screen) {
        SharedPreferences settings = SyncUpSettings.store();
        if (settings == null) {
            return;
        }
        if (watching != null) {
            settings.unregisterOnSharedPreferenceChangeListener(watching);
        }
        watching = (changed, key) -> {
            if (MEDIA_SIZE.equals(key)) {
                showWhatApplies(screen);
            }
        };
        settings.registerOnSharedPreferenceChangeListener(watching);
    }

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }
}
