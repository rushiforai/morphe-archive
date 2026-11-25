/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.text.Spanned;
import android.view.View;
import android.widget.EditText;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Predicate;
import java.util.regex.Pattern;

/**
 * Telegram covers spoiler text with particles when it lays the text out, and blurs spoiler photos and
 * videos until they're tapped. Both ask here first.
 *
 * <p>Some covers stay. The blur on view-once media and on sensitive content shares Telegram's media
 * check, so those messages keep it. View-once and timed media lose it only through a switch of their
 * own, which also answers the bubble's blur checks and lets it load the full photo (#82). Everything
 * else that asks Telegram about it, the tap that opens the timed viewer included, still gets
 * Telegram's answer. Telegram also covers login codes itself, so a shared screen
 * doesn't leak one, and a spoiler over text shaped like a code keeps its cover. Text being typed
 * keeps its spoiler preview, and sending, notifications and retries ask Telegram directly.
 */
public final class Spoilers {
    /** Telegram's own login code pattern. */
    private static final Pattern CODE = Pattern.compile("[\\d\\-]{5,8}");

    /** The messages Show all spoilers uncovered, held weakly so Telegram can still drop them. */
    private static final Set<Object> SHOWN = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private Spoilers() {}

    /**
     * Asked before Telegram covers the spoilers in a piece of text.
     *
     * @param view where the text shows, or null for a message being laid out
     * @param text the text
     * @return true to leave every spoiler in the text uncovered
     */
    public static boolean skipTextCovers(View view, Spanned text) {
        return skipText(view, text, Spoilers::spoilerSpan);
    }

    /** True when the switch is on and the text has spoilers, none of them over a code. */
    static boolean skipText(View view, Spanned text, Predicate<Object> spoiler) {
        HookStatus.invoked(FamilyNames.REVEAL_SPOILERS);
        try {
            if (view instanceof EditText || !Utils.settingsReady() || !Settings.REVEAL_SPOILERS.get()) return false;
            boolean covered = uncoverable(text, spoiler);
            if (covered) HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "spoiler text shown");
            return covered;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "spoiler text", failure);
            return false;
        }
    }

    /** True when the text has spoilers and none of them is over a code, whatever the switch says. */
    static boolean uncoverable(Spanned text, Predicate<Object> spoiler) {
        if (text == null) return false;
        boolean covered = false;
        for (Object span : text.getSpans(0, text.length(), Object.class)) {
            if (!spoiler.test(span)) continue;
            int start = text.getSpanStart(span);
            int end = text.getSpanEnd(span);
            if (start >= 0 && end > start && CODE.matcher(text.subSequence(start, end)).matches()) return false;
            covered = true;
        }
        return covered;
    }

    /**
     * Answers whether a message's media is drawn covered, in place of MessageObject.hasMediaSpoilers,
     * wherever a chat, the chat list or shared media draws it.
     *
     * @param message the message
     * @return whether the media keeps its cover
     */
    public static boolean mediaCovered(Object message) {
        // Telegram's answer comes first and throws the way it always did. The checks are method
        // references that capture nothing, so a frame that draws media allocates nothing here.
        return covered(stockMediaCovered(message), message, Spoilers::keptCovered, Spoilers::timedPreview);
    }

    /** {@link #covered(boolean, Object, Predicate, Predicate)} for a message that isn't timed media. */
    static boolean covered(boolean stock, Object message, Predicate<Object> kept) {
        return covered(stock, message, kept, timed -> false);
    }

    /**
     * Telegram's answer, or uncovered in two cases: it's view-once or timed media and that switch is
     * on, or only the sender's spoiler covers it and either Reveal spoilers is on or Show all spoilers
     * in the chat's menu picked the message.
     */
    static boolean covered(boolean stock, Object message, Predicate<Object> kept, Predicate<Object> timed) {
        HookStatus.invoked(FamilyNames.REVEAL_SPOILERS);
        try {
            if (!stock) return false;
            if (!Utils.settingsReady() || HushTelegramPause.isPaused()) return stock;
            if (Settings.REVEAL_TIMED_MEDIA.get() && timed.test(message)) {
                HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "timed media shown");
                return false;
            }
            if (!shown(message) && !Settings.REVEAL_SPOILERS.get()) return stock;
            if (kept.test(message)) return true;
            HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "spoiler media shown");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "spoiler media", failure);
            return stock;
        }
    }

    /**
     * Answers MessageObject.needDrawBluredPreview for the chat bubble's checks that pick the dark blur
     * for a message's photo or video and keep its image on the thumbnail (#82).
     *
     * @param message the message
     * @return whether the bubble blurs it
     */
    public static boolean blurred(Object message) {
        return stillBlurred(stockBlurred(message), message, Spoilers::timedPreview);
    }

    /** Telegram's answer, or false for view-once and timed media with the switch on. */
    static boolean stillBlurred(boolean stock, Object message, Predicate<Object> timed) {
        HookStatus.invoked(FamilyNames.REVEAL_SPOILERS);
        try {
            if (!stock) return false;
            if (!Utils.settingsReady() || HushTelegramPause.isPaused() || !Settings.REVEAL_TIMED_MEDIA.get() || !timed.test(message)) return stock;
            HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "timed media shown");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "timed media", failure);
            return stock;
        }
    }

    /**
     * Answers DownloadController.canDownloadMedia for the chat bubble's photo. Telegram never fetches
     * a timed photo on its own, so without this the bubble would have nothing but the thumbnail (#82).
     *
     * @param downloads Telegram's download controller
     * @param message the message
     * @return whether the bubble loads the full photo
     */
    public static boolean loadsPhoto(Object downloads, Object message) {
        return loadsFullPhoto(stockLoadsPhoto(downloads, message), message, Spoilers::timedPreview);
    }

    /** Telegram's answer, or true for view-once and timed photos with the switch on. */
    static boolean loadsFullPhoto(boolean stock, Object message, Predicate<Object> timed) {
        HookStatus.invoked(FamilyNames.REVEAL_SPOILERS);
        try {
            if (stock) return true;
            if (!Utils.settingsReady() || HushTelegramPause.isPaused() || !Settings.REVEAL_TIMED_MEDIA.get() || !timed.test(message)) return false;
            HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "timed photo loaded");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "timed photo", failure);
            return stock;
        }
    }

    /** Uncovers a message's media until Telegram lets go of the message, as a tap on it would. */
    static void show(Object message) {
        if (message != null) SHOWN.add(message);
    }

    static boolean shown(Object message) {
        return message != null && SHOWN.contains(message);
    }

    static void resetForTests() {
        SHOWN.clear();
    }

    /** Whether a span is a spoiler. Replaced with Telegram's text style check when patching. */
    public static boolean spoilerSpan(Object span) { return false; }

    /** Telegram's own answer. Replaced with MessageObject.hasMediaSpoilers when patching. */
    public static boolean stockMediaCovered(Object message) { return false; }

    /** View-once or sensitive media. Replaced with the MessageObject checks Telegram makes when patching. */
    public static boolean keptCovered(Object message) { return false; }

    /** Telegram's own answer. Replaced with MessageObject.needDrawBluredPreview when patching. */
    public static boolean stockBlurred(Object message) { return false; }

    /** Telegram's own answer. Replaced with DownloadController.canDownloadMedia when patching. */
    public static boolean stockLoadsPhoto(Object downloads, Object message) { return false; }

    /** Blurred for being view-once or timed, not paid or sensitive. Replaced when patching, and false without the hook. */
    public static boolean timedPreview(Object message) { return false; }
}
