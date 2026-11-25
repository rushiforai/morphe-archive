/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.feed;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;

/**
 * The buttons under a post: like, reply, repost, share and save.
 *
 * <p>Threads draws each of them in a Compose function of its own, called from the row under every
 * post and reply. The patch asks this class first thing in each of those functions, and while the
 * button's switch is on the answer is no and the function returns before drawing anything, so the
 * button and its count are gone and the row's other buttons close up. A double tap on a post still
 * likes it, and the post's menu keeps everything it has.
 *
 * <p>Off, paused, before the settings are ready, or a failure in here, and the button is drawn.
 * Threads keeps a row it has drawn until something in it changes, so a change of a switch shows
 * after a restart.
 */
public final class PostButtons {
    static final String LIKE = "like";
    static final String REPLY = "reply";
    static final String REPOST = "repost";
    static final String SHARE = "share";
    static final String SAVE = "save";
    /** Count label for a hidden button, followed by the button's name. */
    static final String HIDDEN = "hid the post button: ";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left the post buttons to Threads: ";
    /** The outcome last logged for each button, in the order of {@link #NAMES}. A log line marks a change. */
    private static final String[] lastLogged = new String[5];
    private static final String[] NAMES = {LIKE, REPLY, REPOST, SHARE, SAVE};

    private PostButtons() { }

    /** First thing in the like button's function. False while Hide the like button is on. Never throws. */
    public static boolean showLike() {
        return show(0, Settings.HIDE_LIKE_BUTTON);
    }

    /** First thing in the reply button's function. False while Hide the reply button is on. Never throws. */
    public static boolean showReply() {
        return show(1, Settings.HIDE_REPLY_BUTTON);
    }

    /** First thing in the repost button's function. False while Hide the repost button is on. Never throws. */
    public static boolean showRepost() {
        return show(2, Settings.HIDE_REPOST_BUTTON);
    }

    /** First thing in the share button's function. False while Hide the share button is on. Never throws. */
    public static boolean showShare() {
        return show(3, Settings.HIDE_SHARE_BUTTON);
    }

    /** First thing in the save button's function. False while Hide the save button is on. Never throws. */
    public static boolean showSave() {
        return show(4, Settings.HIDE_SAVE_BUTTON);
    }

    private static boolean show(int button, BooleanSetting hide) {
        String name = NAMES[button];
        try {
            HookStatus.invoked(FamilyNames.HIDE_POST_BUTTONS);
            String off = offBecause(hide);
            HookStatus.counted(FamilyNames.HIDE_POST_BUTTONS, off == null ? HIDDEN + name : LEFT_TO_THREADS + off);
            String outcome = off == null ? "hidden" : "shown, " + off;
            if (!outcome.equals(lastLogged[button])) {
                lastLogged[button] = outcome;
                Logger.printDebug(() -> "Post " + name + " button: " + outcome);
            }
            return off != null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_POST_BUTTONS, name + " button", failure);
            return true;
        }
    }

    /** Why {@code hide} doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause(BooleanSetting hide) {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!hide.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
