/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.ui.CustomDialog;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.ref.WeakReference;
import java.util.function.Predicate;

/**
 * Four questions Telegram doesn't ask: send this sticker, this GIF, this voice or video message,
 * start this call. Each is its own switch and each stands in front of the one method that does the
 * work, so with the switch off the method runs as it always did.
 *
 * <p>A question's hook returns true to let Telegram go on and false when it asked instead. Send
 * runs the same method again with the same arguments, once: the hook is told to let that one call
 * through, and the flag clears as soon as it has. Cancel drops the send, and backing out of the
 * question counts as Cancel.
 *
 * <p>A recording is paused before its question shows, the way Telegram pauses it before its own
 * paid-message question, so nothing said or filmed while the question is open ends up in the clip.
 * Send sends the paused clip, as Telegram's send from its preview does, and Cancel leaves it in
 * that preview, where Telegram's own buttons play it, delete it or send it.
 *
 * <p>Only what a person starts by hand is asked about: a sticker or GIF picked in Telegram's
 * panels or its suggestion strip, a recording sent from the record button or from its preview, and the call buttons in
 * a chat's header and on a profile. A scheduled send, a send that already carries its own paid-message confirmation and a
 * call started from anywhere else go through untouched.
 */
public final class SendConfirm {
    private SendConfirm() {}

    private static final int STICKER = 1;
    private static final int GIF = 2;
    private static final int VOICE = 3;
    private static final int VIDEO = 4;
    private static final int CALL = 5;
    private static final int STRIP = 6;

    /** The state Telegram's chat bar sends a paused round video in, the one its paid-message question sends with. */
    static final int VIDEO_PREVIEW = 4;

    /** How many times, {@link #PREVIEW_STEP_MS} apart, Send looks for the preview of a paused clip: five seconds. */
    static final int PREVIEW_TRIES = 50;
    static final long PREVIEW_STEP_MS = 100L;

    /** The kind of send the next call through its hook is the answered one of, or 0. */
    private static volatile int passing;

    /** The last question shown, so a second send while it's up asks nothing more. */
    private static WeakReference<Dialog> asked = new WeakReference<>(null);

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
     * In front of the send of a sticker picked from the strip Telegram suggests above the keyboard
     * for a typed emoji, in a chat or a story's reply bar.
     *
     * @param send Telegram's callback that sends it, run again on Send
     * @param stars the stars Telegram's own paid-message question settled on, a Long
     */
    public static boolean stripSticker(Object send, Object stars) {
        if (passed(STRIP)) return true;
        if (paid(stars) || !on(Settings.ASK_BEFORE_STICKER)) return true;
        Activity window = current();
        if (window == null) return true;
        return ask(STRIP, window, L10n.t(window, "Send sticker"), L10n.t(window, "Send this sticker to this chat?"), L10n.t(window, "Send"),
                () -> resumeStripSticker(send, stars), null);
    }

    /** Whether Telegram already asked about this send, because it costs stars. */
    static boolean paid(Object stars) {
        return stars instanceof Long && (Long) stars > 0L;
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
     * else, cancelling, previewing and the send that waits for a date, goes through. Send sends the
     * paused clip from the chat bar's preview, which leaving the chat while the question is up keeps.
     */
    public static boolean voice(Object media, int send, boolean notify, int scheduleDate, boolean once, long stars) {
        if (passed(VOICE)) return true;
        if (!voiceSend(send, notify, scheduleDate, stars) || !on(Settings.ASK_BEFORE_VOICE_VIDEO)) return true;
        if (asking()) return false;
        Activity window = current();
        if (window == null || !mainThread() || !holdVoice(media, once)) return true;
        return askHeld(VOICE, window, L10n.t(window, "Send voice message"), L10n.t(window, "Send this voice message to this chat?"),
                () -> fromPreview(VOICE, window, () -> resumeVoice(media, send, notify, scheduleDate, once, stars), PREVIEW_TRIES));
    }

    /** In front of the chat's handling of the round video recorder, in the order one build gives its arguments. */
    public static boolean video(Object chat, int state, boolean notify, int scheduleDate, int ttl, long effect, long stars) {
        if (passed(VIDEO)) return true;
        if (!videoSend(state, notify, scheduleDate, stars) || !on(Settings.ASK_BEFORE_VOICE_VIDEO)) return true;
        if (asking()) return false;
        Activity window = current();
        if (window == null || !mainThread() || !holdVideo(chat)) return true;
        return askHeld(VIDEO, window, L10n.t(window, "Send video message"), L10n.t(window, "Send this video message to this chat?"),
                () -> fromPreview(VIDEO, window, () -> resumeVideo(chat, VIDEO_PREVIEW, notify, scheduleDate, ttl, effect, stars), PREVIEW_TRIES));
    }

    /** {@link #video} for the build that gives the date, the timer and the effect before the sound flag. */
    public static boolean videoReordered(Object chat, int state, int scheduleDate, int ttl, long effect, long stars, boolean notify) {
        if (passed(VIDEO)) return true;
        if (!videoSend(state, notify, scheduleDate, stars) || !on(Settings.ASK_BEFORE_VOICE_VIDEO)) return true;
        if (asking()) return false;
        Activity window = current();
        if (window == null || !mainThread() || !holdVideo(chat)) return true;
        return askHeld(VIDEO, window, L10n.t(window, "Send video message"), L10n.t(window, "Send this video message to this chat?"),
                () -> fromPreview(VIDEO, window, () -> resumeVideoReordered(chat, VIDEO_PREVIEW, scheduleDate, ttl, effect, stars, notify), PREVIEW_TRIES));
    }

    /**
     * In front of the chat bar's send of the round video waiting in its preview, the one its send
     * button runs, before that send clears the preview, so Cancel leaves the clip there. Send runs
     * the bar's send again, and the answered call goes on to {@link #video}, which takes the flag,
     * so the clip isn't asked about twice.
     *
     * @param notify 0 for a send without sound
     * @param repeat how often a scheduled send repeats, 0 for an ordinary send
     * @param confirm whether Telegram's paid-message question may still ask, which a send with stars says anyway
     */
    public static boolean previewVideo(Object bar, int scheduleDate, int notify, int repeat, int confirm, long stars) {
        if (passing == VIDEO) return true;
        return preview(VIDEO, bar, scheduleDate, notify, repeat, stars, () -> sendFromBar(bar));
    }

    /** {@link #previewVideo} for the voice clip, whose send never reaches {@link #voice}, so this one takes the flag. */
    public static boolean previewVoice(Object bar, int scheduleDate, int notify, int repeat, int confirm, long stars) {
        if (passed(VOICE)) return true;
        return preview(VOICE, bar, scheduleDate, notify, repeat, stars, () -> sendFromBar(bar));
    }

    /**
     * Asks about the clip waiting in [bar]'s preview; Send runs [send], the bar's send again. A tap
     * while a question is up keeps the preview and asks nothing more.
     */
    static boolean preview(int kind, Object bar, int scheduleDate, int notify, int repeat, long stars, Runnable send) {
        if (!previewSend(scheduleDate, notify, repeat, stars) || !on(Settings.ASK_BEFORE_VOICE_VIDEO)) return true;
        Activity window = activity(bar);
        if (window == null) return true;
        if (asking()) return false;
        String title = kind == VIDEO ? L10n.t(window, "Send video message") : L10n.t(window, "Send voice message");
        String message = kind == VIDEO ? L10n.t(window, "Send this video message to this chat?") : L10n.t(window, "Send this voice message to this chat?");
        return ask(kind, window, title, message, L10n.t(window, "Send"), send, null);
    }

    /**
     * Whether a question is up. A second send that reaches a hook meanwhile asks nothing more and
     * sends nothing: the older voice recorder pauses a moment after it's asked to, and a second
     * pause before then would start it recording again.
     */
    static boolean asking() {
        Dialog open = asked.get();
        return open != null && open.isShowing();
    }

    /** Whether a send from the preview goes out now, with sound, once and with nothing to pay. */
    static boolean previewSend(int scheduleDate, int notify, int repeat, long stars) {
        return scheduleDate == 0 && notify != 0 && repeat == 0 && stars == 0L;
    }

    /**
     * {@link #ask} for a recording already paused for its question. When the question can't show,
     * the clip goes out the way Send sends it, since Telegram's own send no longer finds it recording.
     */
    static boolean askHeld(int kind, Activity window, String title, String message, Runnable sendAction) {
        if (ask(kind, window, title, message, L10n.t(window, "Send"), sendAction, null)) answered(kind, sendAction);
        return false;
    }

    /**
     * Pauses the voice recording unless it's paused already, so the question stands in front of a
     * finished clip. False when it couldn't pause, and then Telegram sends at once rather than
     * recording on behind the question.
     */
    static boolean holdVoice(Object media, boolean once) {
        try {
            if (!voicePaused(media)) pauseVoice(media, once);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "voice pause", failure);
            return false;
        }
    }

    /**
     * Pauses the round video recorder unless it's paused already, and Send then sends from its
     * preview, since the older of Telegram's two round video recorders sends a paused clip only
     * from there. False when it couldn't pause, and then Telegram sends at once.
     */
    static boolean holdVideo(Object chat) {
        try {
            if (!videoPaused(chat)) pauseVideo(chat);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "video pause", failure);
            return false;
        }
    }

    /**
     * Sends a paused recording with the chat bar's own send, the one its send button runs, which
     * sends the clip in its preview and closes the preview behind it. Ending the recording instead
     * sends the clip too, but a chat bar that saw it paused never hears about that, and its preview
     * stays up. The preview shows once the paused clip is written, a moment after the pause, so Send
     * waits for it; with none by then, [stop] ends the recording, which sends the clip everywhere but
     * on the older voice recorder. A window closed meanwhile gives way to the main window in front.
     */
    static void fromPreview(int kind, Activity window, Runnable stop, int tries) {
        if (!mainThread()) {
            new Handler(Looper.getMainLooper()).post(() -> fromPreview(kind, window, stop, tries));
            return;
        }
        Object bar = previewBar(usable(window, false) ? window : current(), kind);
        if (bar != null) answered(kind, () -> sendFromBar(bar));
        else if (tries > 0) new Handler(Looper.getMainLooper()).postDelayed(() -> fromPreview(kind, window, stop, tries - 1), PREVIEW_STEP_MS);
        else answered(kind, stop);
    }

    /** The chat bar on screen in [window] that holds a paused clip of this kind, or null. */
    static Object previewBar(Activity window, int kind) {
        try {
            if (window == null || window.isDestroyed() || window.getWindow() == null) return null;
            return find(window.getWindow().getDecorView(),
                    view -> view.isShown() && chatBar(view) && (kind == VIDEO ? videoClip(view) : voiceClip(view)) != null);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "preview", failure);
            return null;
        }
    }

    /** The first view in [root]'s tree, [root] included, that [wanted] takes. */
    static View find(View root, Predicate<View> wanted) {
        if (wanted.test(root)) return root;
        if (!(root instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            View found = find(group.getChildAt(i), wanted);
            if (found != null) return found;
        }
        return null;
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
        if (window == null || !mainThread()) return true;
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
            asked = new WeakReference<>(dialog.first);
            HookStatus.counted(FamilyNames.ASK_BEFORE_STICKER, "asked");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ASK_BEFORE_STICKER, "question", failure);
            return true;
        }
    }

    /** Whether this runs on the app's main thread, the only one a question shows from. */
    static boolean mainThread() {
        return Looper.myLooper() == Looper.getMainLooper();
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

    /** Telegram's callback for the strip's sticker, run again with the same argument. Replaced when patching. */
    public static void resumeStripSticker(Object send, Object stars) {}

    /** Telegram's own GIF send, again. Replaced when patching. */
    public static void resumeGif(Object delegate, Object view, Object gif, Object query, Object parent, boolean notify,
                                 int scheduleDate, int repeat, Object entry, boolean invert) {}

    /** Telegram's own end of a recording, again. Replaced when patching. */
    public static void resumeVoice(Object media, int send, boolean notify, int scheduleDate, boolean once, long stars) {}

    /** Whether Telegram's voice recording is paused. Replaced when patching. */
    public static boolean voicePaused(Object media) { return false; }

    /** Telegram's pause of a voice recording, with its view-once flag. Replaced when patching. */
    public static void pauseVoice(Object media, boolean once) {}

    /** Whether the chat's round video recorder is paused. Replaced when patching. */
    public static boolean videoPaused(Object chat) { return false; }

    /** The chat's pause of the round video recorder. Replaced when patching. */
    public static void pauseVideo(Object chat) {}

    /** Telegram's own handling of the round video recorder, again. Replaced when patching. */
    public static void resumeVideo(Object chat, int state, boolean notify, int scheduleDate, int ttl, long effect, long stars) {}

    /** {@link #resumeVideo} for the other order of arguments. Replaced when patching. */
    public static void resumeVideoReordered(Object chat, int state, int scheduleDate, int ttl, long effect, long stars, boolean notify) {}

    /** Whether a view is Telegram's chat bar. Replaced when patching. */
    public static boolean chatBar(Object view) { return false; }

    /** The paused voice clip in the chat bar's preview, or null. Replaced when patching. */
    public static Object voiceClip(Object bar) { return null; }

    /** The paused round video in the chat bar's preview, or null. Replaced when patching. */
    public static Object videoClip(Object bar) { return null; }

    /** The chat bar's send, as its send button runs it: now, with sound. Replaced when patching. */
    public static void sendFromBar(Object bar) {}

    /** Telegram's own start of a call. Replaced when patching. */
    public static void startCall(Object user, boolean video, boolean canVideo, Object activity, Object userFull, Object account) {}
}
