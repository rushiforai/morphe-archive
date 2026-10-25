/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.profile;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.EarlySwitch;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * The switch in front of Turn on Thoughts (#186).
 *
 * <p>TikTok decides per account whether Thoughts show up and whether you can write one, from two
 * AB values it reads lazily: {@code story_note_enable_consumption} for the bubble above a profile
 * picture and the Thoughts row in the inbox, and {@code story_note_enable_publish} for the prompt
 * to share one. The patch hooks both getters. With the switch on they answer yes; with it off, and
 * while Hushfeed is paused, TikTok reads its own values. Whether a Thought posts is still up to
 * TikTok's servers.
 */
@SuppressWarnings("unused")
public final class ThoughtsGate {
    /** {@link Settings#ENABLE_THOUGHTS}'s key, for a read before the settings context. */
    static final String SWITCH_KEY = "enable_thoughts";

    private ThoughtsGate() {
    }

    public static boolean isOn() {
        return Utils.getContext() != null ? Settings.ENABLE_THOUGHTS.get() : EarlySwitch.isOn(SWITCH_KEY);
    }
}
