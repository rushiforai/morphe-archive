package app.enigma.extension.music.maloja;

import static app.morphe.extension.shared.settings.Setting.parent;
import static app.morphe.extension.shared.settings.Setting.parentsAll;
import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * Settings of the Maloja patch. Persisted in the same preferences as the official Morphe
 * settings, so the Morphe settings screen syncs them with the preferences declared in
 * {@code morphe_addon_prefs.xml}.
 */
public class MalojaSettings {
    public static final BooleanSetting ENABLED = new BooleanSetting("morphe_maloja_enabled", FALSE, true);
    public static final StringSetting SERVER_URL = new StringSetting("morphe_maloja_server_url", "", false, parent(ENABLED));
    public static final StringSetting API_KEY = new StringSetting("morphe_maloja_api_key", "", false, parent(ENABLED));
    public static final IntegerSetting MIN_SONG_DURATION = new IntegerSetting("morphe_maloja_min_song_duration", 30, false, parent(ENABLED));
    public static final IntegerSetting DELAY_PERCENT = new IntegerSetting("morphe_maloja_delay_percent", 50, false, parent(ENABLED));
    public static final IntegerSetting DELAY_SECONDS = new IntegerSetting("morphe_maloja_delay_seconds", 180, false, parent(ENABLED));
    public static final BooleanSetting METADATA_CLEANUP = new BooleanSetting("morphe_maloja_metadata_cleanup", TRUE, false, parent(ENABLED));
    public static final StringSetting CUSTOM_REGEX = new StringSetting("morphe_maloja_custom_regex", "", false, parentsAll(parent(ENABLED), parent(METADATA_CLEANUP)));
    public static final BooleanSetting PARSE_TITLE = new BooleanSetting("morphe_maloja_parse_title", FALSE, false, parent(ENABLED));

    /**
     * Limits of the timer settings, the same the official scrobbling providers enforce with
     * their seek bars. The add-on uses plain text fields, so the values are clamped when read.
     */
    static int minSongDurationSeconds() {
        return clamp(MIN_SONG_DURATION.get(), 10, 60);
    }

    static int delayPercent() {
        return clamp(DELAY_PERCENT.get(), 30, 95);
    }

    static int delaySeconds() {
        return clamp(DELAY_SECONDS.get(), 30, 360);
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    static boolean isConfigured() {
        return !SERVER_URL.get().isBlank() && !API_KEY.get().isBlank();
    }

    private MalojaSettings() {
    }
}
