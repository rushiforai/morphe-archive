/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * The switches behind the hooks that ask before they act.
 *
 * <p>A switch's default is the second argument of its {@link BooleanSetting}. Picking a patch in
 * Morphe Manager is the choice to use it, and the switch is the way to turn it off again without
 * patching a second time. While HushThreads is paused, safe mode included
 * ({@link app.morphe.extension.shared.settings.HushThreadsPause}), a switch answers off unless
 * {@link app.morphe.extension.shared.settings.Setting#keepWhenPaused} marks it, and the hook behind
 * it takes Threads' own path.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    /**
     * Posts Threads marks as ads, taken out of each page of the feed before it's cached or drawn:
     * a post whose media carries Threads' own ad data ("injected"), alone or as a post of a thread.
     */
    public static final BooleanSetting HIDE_ADS =
            new BooleanSetting("hushthreads_hide_ads", TRUE);

    /**
     * The tracking keys come off the post links Threads hands out when you copy or share one
     * (xmt, slof, igsh and the rest), with the rest of the link left as the server wrote it.
     */
    public static final BooleanSetting SANITIZE_SHARING_LINKS =
            new BooleanSetting("hushthreads_sanitize_sharing_links", TRUE);

    /**
     * Threads' analytics uploads go to an address that answers nothing: the Pigeon event logger,
     * the graph.facebook.com event endpoint and the MQTT client's analytics endpoint.
     */
    public static final BooleanSetting DISABLE_ANALYTICS =
            new BooleanSetting("hushthreads_disable_analytics", TRUE);

    /**
     * Once a day, when Threads starts, ask api.github.com whether a newer HushThreads release is
     * out, and say so on the settings screen ({@link ReleaseCheck}). It's the settings entry's own
     * switch rather than a patch's, so every build has it ({@link PatchFamily#ENTRY_SWITCHES}). Off
     * by default, and a settings file never carries it: a file shouldn't be able to put a phone
     * online.
     */
    public static final BooleanSetting CHECK_FOR_RELEASES =
            new BooleanSetting("hushthreads_check_releases", FALSE);
}
