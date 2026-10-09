/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Looper;
import android.util.Pair;
import android.view.View;
import android.widget.LinearLayout;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.ui.CustomDialog;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Four questions Telegram doesn't ask: send this sticker, this GIF, this voice or video message,
 * start this call. Each is its own switch and each stands in front of the one method that does the
 * work, so with the switch off the method runs as it always did.
 *
 * <p>A question's hook returns true to let Telegram go on and false when it asked instead. Send
 * runs the same method again with the same arguments, once: the hook is told to let that one call
 * through, and the flag clears as soon as it has. Cancel drops the send, and for a recording stops
 * and throws it away, the way Telegram's own slide to cancel does. Backing out of the question
 * counts as Cancel, so a recording never keeps running behind a closed dialog.
 *
 * <p>Only what a person starts by hand is asked about: a sticker or GIF picked in Telegram's
 * panels, a recording sent from the record button, and the call buttons in a chat's header and on
 * a profile. A scheduled send, a send that already carries its own paid-message confirmation and a
 * call started from anywhere else go through untouched.
 */
public final class SendConfirm {
    private SendConfirm() {}

    private static final int STICKER = 1;
    private static final int GIF = 2;
    private static final int VOICE = 3;
    private static final int VIDEO = 4;
    private static final int CALL = 5;

    /** The kind of send the next call through its hook is the answered one of, or 0. */
    private static volatile int passing;

    /**
     * In front of the chat bar's sticker send.
     *
     * @param view the chat bar, which gives the question its window
     */
    public static boolean sticker(Object view, Object document, Object query, Object parent, Object animation,
                                  boolean clears, boolean notify, int scheduleDate, int repeat) {
        if (passed(STICKER)) return true;
        if (scheduleDate != 0 || !on(Settings.ASK_BEFORE_STICKER)) return true;
        Activity window = activity(view);
        if (window == null) return true;
        return ask(STICKER, window, L10n.t(window, "Send sticker"), L10n.t(window, "Send this sticker to this chat?"), L10n.t(window, "Send"),
                () -> resumeSticker(view, document, query, parent, animation, clears, notify, scheduleDate, repeat), null);
    }

    /**
     * In front of the GIF panel's send.
     *
     * @param delegate the panel's listener, which Telegram calls when a GIF is picked
     * @param view the GIF that was tapped, or null
     */
    public static boolean gif(Object delegate, Object view, Object gif, Object query, Object parent, boolean notify,
                              int scheduleDate, int repeat, Object entry, boolean invert) {
        if (passed(GIF)) return true;
        if (scheduleDate != 0 || !on(Settings.ASK_BEFORE_GIF)) return true;
        Activity window = view instanceof View ? activity(view) : current();
        if (window == null) return true;
        return ask(GIF, window, L10n.t(window, "Send GIF"), L10n.t(window, "Send this GIF to this chat?"), L10n.t(window, "Send"),
                () -> resumeGif(delegate, view, gif, query, parent, notify, scheduleDate, repeat, entry, invert), null);
    }

    /**
     * In front of Telegram's end of a voice recording. Only sending is asked about, and everything
     * else, cancelling, previewing and the send that waits for a date, goes through.
     */
    public static boolean voice(Object media, int send, boolean notify, int scheduleDate, boolean once, long stars) {
        if (passed(VOICE)) return true;
        if (!voiceSend(send, notify, scheduleDate, stars) || !on(Settings.ASK_BEFORE_VOICE_VIDEO)) return true;
        Activity window = current();
        if (window == null) return true;
        return ask(VOICE, window, L10n.t(window, "Send voice message"), L10n.t(window, "Send this voice message to this chat?"), L10n.t(window, "Send"),
                () -> resumeVoice(media, send, notify, scheduleDate, once, stars),
                () -> resumeVoice(media, 0, false, 0, once, 0L));
    }

    /** In front of the chat's handling of the round video recorder, in the order one build gives its arguments. */
    public static boolean video(Object chat, int state, boolean notify, int scheduleDate, int ttl, long effect, long stars) {
        if (passed(VIDEO)) return true;
        if (!videoSend(state, notify, scheduleDate, stars) || !on(Settings.ASK_BEFORE_VOICE_VIDEO)) return true;
        Activity window = current();
        if (window == null) return true;
        return ask(VIDEO, window, L10n.t(window, "Send video message"), L10n.t(window, "Send this video message to this chat?"), L10n.t(window, "Send"),
                () -> resumeVideo(chat, state, notify, scheduleDate, ttl, effect, stars),
                () -> resumeVideo(chat, 2, true, 0, ttl, effect, 0L));
    }

    /** {@link #video} for the build that gives the date, the timer and the effect before the sound flag. */
    public static boolean videoReordered(Object chat, int state, int scheduleDate, int ttl, long effect, long stars, boolean notify) {
        if (passed(VIDEO)) return true;
        if (!videoSend(state, notify, scheduleDate, stars) || !on(Settings.ASK_BEFORE_VOICE_VIDEO)) return true;
        Activity window = current();
        if (window == null) return true;
        return ask(VIDEO, window, L10n.t(window, "Send video message"), L10n.t(window, "Send this video message to this chat?"), L10n.t(window, "Send"),
                () -> resumeVideoReordered(chat, state, scheduleDate, ttl, effect, stars, notify),
                () -> resumeVideoReordered(chat, 2, 0, ttl, effect, 0L, true));
    }

    /**
     * In place of Telegram's start of a call from the chat header's and the profile's call
     * buttons, with the same arguments.
     */
    public static void call(Object user, boolean video, boolean canVideo, Object activity, Object userFull, Object account) {
        try {
            if (activity instanceof Activity && on(Settings.ASK_BEFORE_CALL)) {
                Activity window = usable((Activity) activity, false) ? (Activity) activity : null;
                if (window != null) {
                    String question = video ? L10n.t(window, "Start a video call?") : L10n.t(window, "Start a voice call?");
                    boolean proceed = ask(CALL, window, L10n.t(window, "Start a call"), question, L10n.t(window, "Call"),
                            () -> startCall(user, video, canVideo, activity, userFull, account), null);
                    if (!proceed) return;
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "call", failure);
        }
        startCall(user, video, canVideo, activity, userFull, account);
    }

    /** Whether an end of a recording is the one that sends: Telegram's 1, with sound, now and with nothing to pay. */
    static boolean voiceSend(int send, boolean notify, int scheduleDate, long stars) {
        return send == 1 && notify && scheduleDate == 0 && stars == 0L;
    }

    /** Whether a round video call is the one that sends: Telegram's states 1 and 4, now, with sound and nothing to pay. */
    static boolean videoSend(int state, boolean notify, int scheduleDate, long stars) {
        return (state == 1 || state == 4) && notify && scheduleDate == 0 && stars == 0L;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on(BooleanSetting setting) {
        HookStatus.invoked(FamilyNames.ASK_BEFORE_STICKER);
        try {
            return Utils.settingsReady() && setting.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "switch", failure);
            return false;
        }
    }

    /** Whether this call is the answered one for [kind]; takes the flag if so. */
    static boolean passed(int kind) {
        if (passing != kind) return false;
        passing = 0;
        return true;
    }

    /**
     * Shows the question, already in the user's language. Returns true when Telegram should go on at once, because there is
     * nowhere to ask or asking failed, and false once the dialog is up and the answer will decide.
     */
    static boolean ask(int kind, Activity window, String title, String message, String send, Runnable sendAction, Runnable cancelAction) {
        if (window == null || Looper.myLooper() != Looper.getMainLooper()) return true;
        try {
            boolean[] decided = {false};
            Runnable yes = () -> {
                if (decided[0]) return;
                decided[0] = true;
                answered(kind, sendAction);
            };
            Runnable no = () -> {
                if (decided[0]) return;
                decided[0] = true;
                if (cancelAction != null) answered(kind, cancelAction);
            };
            Pair<Dialog, LinearLayout> dialog = CustomDialog.create(window, title, message, null, send, yes, no, null, null, false);
            dialog.first.setOnDismissListener(shown -> no.run());
            dialog.first.show();
            HookStatus.counted(FamilyNames.ASK_BEFORE_STICKER, "asked");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "question", failure);
            return true;
        }
    }

    /** Runs [action], the one call Telegram's own method is let through for. */
    static void answered(int kind, Runnable action) {
        passing = kind == CALL ? 0 : kind;
        try {
            action.run();
        } finally {
            passing = 0;
        }
    }

    /** The window a view belongs to, or null when it has none left. */
    static Activity activity(Object source) {
        try {
            Context context = source instanceof View ? ((View) source).getContext() : source instanceof Context ? (Context) source : null;
            while (context instanceof ContextWrapper && !(context instanceof Activity)) context = ((ContextWrapper) context).getBaseContext();
            Activity found = context instanceof Activity ? (Activity) context : null;
            return usable(found, false) ? found : null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "window", failure);
            return null;
        }
    }

    /** Telegram's main window, when it's the one in front. */
    static Activity current() {
        try {
            Activity main = launchActivity();
            return usable(main, true) ? main : null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "window", failure);
            return null;
        }
    }

    static boolean usable(Activity window, boolean focused) {
        return window != null && !window.isFinishing() && !window.isDestroyed() && (!focused || window.hasWindowFocus());
    }

    /** Telegram's main window, or null. Replaced when patching. */
    public static Activity launchActivity() { return null; }

    /** Telegram's own sticker send, again, with the same arguments. Replaced when patching. */
    public static void resumeSticker(Object view, Object document, Object query, Object parent, Object animation,
                                     boolean clears, boolean notify, int scheduleDate, int repeat) {}

    /** Telegram's own GIF send, again. Replaced when patching. */
    public static void resumeGif(Object delegate, Object view, Object gif, Object query, Object parent, boolean notify,
                                 int scheduleDate, int repeat, Object entry, boolean invert) {}

    /** Telegram's own end of a recording, again. Replaced when patching. */
    public static void resumeVoice(Object media, int send, boolean notify, int scheduleDate, boolean once, long stars) {}

    /** Telegram's own handling of the round video recorder, again. Replaced when patching. */
    public static void resumeVideo(Object chat, int state, boolean notify, int scheduleDate, int ttl, long effect, long stars) {}

    /** {@link #resumeVideo} for the other order of arguments. Replaced when patching. */
    public static void resumeVideoReordered(Object chat, int state, int scheduleDate, int ttl, long effect, long stars, boolean notify) {}

    /** Telegram's own start of a call. Replaced when patching. */
    public static void startCall(Object user, boolean video, boolean canVideo, Object activity, Object userFull, Object account) {}
}
