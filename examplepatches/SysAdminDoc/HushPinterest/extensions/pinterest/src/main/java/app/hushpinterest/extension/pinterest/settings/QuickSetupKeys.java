/*
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 *
 * Built on https://github.com/SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushpinterest.extension.pinterest.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.preference.QuickSetups;

/**
 * Which switches each Quick setups choice changes, all in one place.
 *
 * <p>Quiet and Privacy only turn switches on, and only switches whose effect is plain from their
 * name and takes nothing away that someone would miss. Left out on purpose: Hide shopping and
 * both AI pin switches, which hide pins people may want; Boost pin and Hide Assistant, which some
 * use; Hide search history, which people use to go back to a search; and Open links in your
 * browser, which changes how every link opens. Back to defaults puts every switch a settings file
 * carries back the way it started.
 */
final class QuickSetupKeys {
    /** Fewer ads, suggestions, nags and pop-ups. */
    static final List<BooleanSetting> QUIET = Collections.unmodifiableList(Arrays.asList(
            Settings.HIDE_ADS,
            Settings.HIDE_TOPIC_SUGGESTIONS,
            Settings.HIDE_SURVEY_PROMPTS,
            Settings.QUIET_EMAIL_REMINDER,
            Settings.HIDE_SAVE_TOASTS,
            Settings.DISABLE_UPDATE_NAG,
            Settings.HIDE_SCREENSHOT_SHARE));

    /** Less sent about you: usage reports, tracking in links and the ad ID. */
    static final List<BooleanSetting> PRIVACY = Collections.unmodifiableList(Arrays.asList(
            Settings.DISABLE_ANALYTICS,
            Settings.STRIP_LINK_TRACKING,
            Settings.PLAIN_PIN_LINKS,
            Settings.HIDE_ADVERTISING_ID));

    /** Every feature switch, the same list a settings file carries: Pause, debug and the release check stay as they are. */
    static final List<BooleanSetting> DEFAULTS = SettingsBackup.ALLOWLIST;

    private QuickSetupKeys() {
    }

    static Map<BooleanSetting, Boolean> quiet() {
        return QuickSetups.allOn(QUIET);
    }

    static Map<BooleanSetting, Boolean> privacy() {
        return QuickSetups.allOn(PRIVACY);
    }

    static Map<BooleanSetting, Boolean> defaults() {
        return QuickSetups.defaults(DEFAULTS);
    }
}
