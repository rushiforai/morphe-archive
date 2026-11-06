/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at 44fb9338 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.preference.QuickSetups;

/**
 * Which switches each Quick setups choice changes, all in one place.
 *
 * <p>Quiet and Privacy only turn switches on, and only switches whose effect is plain from their
 * name and takes nothing away that someone would miss. Left out on purpose: Hide the Instagram
 * button and Hide ghost post bubbles, which some people tap; Tap to play videos and Keep feed
 * position on return, which change how the feed behaves rather than what's in it; Show the date
 * and time, which changes how every post's time reads; and Open links in your browser, which
 * changes how every link opens. Back to defaults puts every switch a
 * settings file carries back the way it started.
 */
final class QuickSetupKeys {
    /** Fewer ads and suggestions. */
    static final List<BooleanSetting> QUIET = Collections.unmodifiableList(Arrays.asList(
            Settings.HIDE_ADS,
            Settings.HIDE_SUGGESTED_USERS,
            Settings.HIDE_SEARCH_SUGGESTIONS));

    /** Less sent about you: usage reports, tracking in shared links and screenshots. */
    static final List<BooleanSetting> PRIVACY = Collections.unmodifiableList(Arrays.asList(
            Settings.DISABLE_ANALYTICS,
            Settings.SANITIZE_SHARING_LINKS,
            Settings.DISABLE_SCREENSHOT_DETECTION));

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
