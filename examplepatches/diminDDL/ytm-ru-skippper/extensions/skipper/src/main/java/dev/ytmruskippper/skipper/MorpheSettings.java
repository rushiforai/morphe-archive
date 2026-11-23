package dev.ytmruskippper.skipper;

import static app.morphe.extension.shared.settings.Setting.parent;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * The skipper's settings, registered with Morphe so its settings screen shows, resets, imports
 * and exports them. The keys match the preferences in morphe_addon_prefs.xml.
 * <p>
 * Only {@link SkipperSettings} touches this class, and only after checking that the Morphe
 * extension is part of the app.
 */
final class MorpheSettings {
    static final BooleanSetting ENABLED = new BooleanSetting("ytm_ru_skip_enabled", true);
    static final BooleanSetting TOAST = new BooleanSetting("ytm_ru_skip_toast", true, parent(ENABLED));
    static final BooleanSetting FLAGS = new BooleanSetting("ytm_ru_skip_flags", false);

    static final BooleanSetting TITLE_MARKERS = new BooleanSetting("ytm_ru_skip_title_markers", true, parent(ENABLED));
    static final BooleanSetting KEEP_UKRAINIAN = new BooleanSetting("ytm_ru_skip_keep_ukrainian", true, parent(ENABLED));
    static final BooleanSetting COUNTRY_LOOKUP = new BooleanSetting("ytm_ru_skip_country_lookup", true, parent(ENABLED));
    static final StringSetting BLOCKED_COUNTRIES = new StringSetting("ytm_ru_skip_blocked_countries", "RU", parent(COUNTRY_LOOKUP));

    static final StringSetting ALWAYS_KEEP = new StringSetting("ytm_ru_skip_always_keep", "", parent(ENABLED));
    static final StringSetting ALWAYS_SKIP = new StringSetting("ytm_ru_skip_always_skip", "", parent(ENABLED));

    static final IntegerSetting SKIP_DELAY_SECONDS = new IntegerSetting("ytm_ru_skip_delay_seconds", 0, parent(ENABLED));
    static final IntegerSetting LOOKUP_WINDOW_SECONDS = new IntegerSetting("ytm_ru_skip_lookup_window_seconds", 15);

    private MorpheSettings() {}

    /** Loading the class registers the settings. */
    static void load() {}
}
