/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.View;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * A channel you've joined puts Mute, or Unmute, in the middle of the bar at the bottom of the chat.
 * That button shares its view with Join, Subscribe, Unblock, Delete chat and Start bot, so it can't
 * just be hidden. Instead the chat screen says each time it updates the bar whether it just labelled
 * the button Mute or Unmute, and with the switch on the whole bar is taken off the screen for that
 * state (#26). Search and Info sit in the same bar and go with it. Every other state of the bar
 * keeps the stock look, and the channel's own page still mutes it. The rounded bubble Telegram 13
 * draws behind the bar goes with it, or it would stay as an empty pill.
 *
 * <p>Telegram shows the bar again from other places too, so a bar taken off stays off until the
 * chat screen's next update decides otherwise, and then gets back whatever Telegram last asked for.
 */
public final class ChannelMute {
    private ChannelMute() {}

    /** Whether this update of the bar has labelled the middle button Mute or Unmute. UI thread only. */
    private static boolean labelled;
    /** The bars the last update took off the screen, with the visibility Telegram last asked each for. */
    private static final Map<Object, Integer> TAKEN_OFF = Collections.synchronizedMap(new WeakHashMap<>());

    /** Called first in the chat screen's bar update. */
    public static void begin() {
        labelled = false;
    }

    /** Called right after the update labels the middle button Mute or Unmute for a channel. */
    public static void muteLabelled() {
        labelled = true;
    }

    /**
     * Called when the chat screen has placed the bar's buttons, last in its update.
     *
     * @param bar Telegram's bottom bar
     */
    public static void finish(Object bar) {
        boolean mute = labelled;
        labelled = false;
        if (!(bar instanceof View)) return;
        View view = (View) bar;
        try {
            if (mute && on()) {
                if (!TAKEN_OFF.containsKey(bar)) TAKEN_OFF.put(bar, view.getVisibility());
                HookStatus.counted(FamilyNames.HIDE_CHANNEL_BUTTONS, "channel Mute button hidden");
                view.setVisibility(View.GONE);
            } else {
                Integer asked = TAKEN_OFF.remove(bar);
                if (asked != null) view.setVisibility(asked);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CHANNEL_BUTTONS, "mute bar", failure);
        }
    }

    /**
     * Takes the place of the visibility a bar is about to be given.
     *
     * @param bar Telegram's bottom bar
     * @param visibility what Telegram asked for
     * @return what the bar gets
     */
    public static int visibility(Object bar, int visibility) {
        if (visibility == View.GONE || bar == null || !TAKEN_OFF.containsKey(bar)) return visibility;
        try {
            if (!on()) return visibility;
            TAKEN_OFF.put(bar, visibility);
            return View.GONE;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CHANNEL_BUTTONS, "mute visibility", failure);
            return visibility;
        }
    }

    /**
     * Takes the place of whether the chat screen draws the rounded bubble it keeps behind the bar.
     * With the bar taken off the bubble would stay as an empty pill, so it goes too.
     *
     * @param host the view that draws the bubble and holds the bar
     * @param drawn whether Telegram would draw it, non-zero for yes
     * @return whether it's drawn
     */
    public static boolean bubble(Object host, int drawn) {
        boolean shown = drawn != 0;
        if (!shown || host == null || TAKEN_OFF.isEmpty()) return shown;
        try {
            synchronized (TAKEN_OFF) {
                for (Object bar : TAKEN_OFF.keySet()) {
                    if (bar instanceof View && ((View) bar).getVisibility() == View.GONE && inside((View) bar, host)) return !on();
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CHANNEL_BUTTONS, "mute bubble", failure);
        }
        return shown;
    }

    private static boolean inside(View view, Object host) {
        for (Object parent = view.getParent(); parent != null; parent = ((android.view.ViewParent) parent).getParent()) {
            if (parent == host) return true;
        }
        return false;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_CHANNEL_BUTTONS);
        try {
            return Utils.settingsReady() && Settings.HIDE_CHANNEL_MUTE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_CHANNEL_BUTTONS, "mute switch", failure);
            return false;
        }
    }
}
