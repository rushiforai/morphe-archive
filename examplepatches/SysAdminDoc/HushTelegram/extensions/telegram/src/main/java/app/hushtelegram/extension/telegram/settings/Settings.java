/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtelegram.extension.telegram.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>A switch's default is the second argument of its {@link BooleanSetting}. Picking a patch in
 * Morphe Manager is the choice to use it, and the switch is the way to turn it off again without
 * patching a second time. While HushTelegram is paused, safe mode included
 * ({@link app.hushtelegram.extension.shared.settings.HushTelegramPause}), a switch answers off unless
 * {@link app.hushtelegram.extension.shared.settings.Setting#keepWhenPaused} marks it, and the hook behind
 * it takes Telegram's own path.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    /**
     * Telegram never asks for a channel's sponsored messages, search's sponsored accounts or the
     * video player's ads, so none are shown, counted as seen or reported as clicked
     * ({@link app.hushtelegram.extension.telegram.ads.Ads}).
     */
    public static final BooleanSetting HIDE_ADS =
            new BooleanSetting("hushtelegram_hide_ads", TRUE);

    /** Chat-list stories only; explicit profile stories and archives keep Telegram's paths. */
    public static final BooleanSetting HIDE_STORIES =
            new BooleanSetting("hushtelegram_hide_stories", TRUE);

    /** Similar channels/bots and their cached search sections. */
    public static final BooleanSetting HIDE_RECOMMENDATIONS =
            new BooleanSetting("hushtelegram_hide_recommendations", TRUE);

    /**
     * The device statistics report the server can ask for (storage directories, sent as a
     * help.saveAppLog event) and a channel's read metrics (how long each post stayed on screen) are
     * never sent ({@link app.hushtelegram.extension.telegram.misc.Analytics}).
     */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushtelegram_disable_analytics", TRUE);

    /** Automatic call diagnostics only; the call itself and its cleanup stay stock. */
    public static final BooleanSetting DISABLE_CALL_DEBUG =
            new BooleanSetting("hushtelegram_disable_call_debug", TRUE);

    /**
     * telegram.org's build stops checking for its own updates, which can't install over a re-signed
     * build anyway ({@link app.hushtelegram.extension.telegram.misc.UpdateChecks}).
     */
    public static final BooleanSetting DISABLE_UPDATE_CHECKS =
            new BooleanSetting("hushtelegram_disable_update_checks", TRUE);

    /**
     * Once a day, when Telegram starts, ask api.github.com whether a newer HushTelegram release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushtelegram_check_releases", FALSE);
}
