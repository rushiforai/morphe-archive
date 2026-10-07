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
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.function.Predicate;
import java.util.regex.Pattern;

/**
 * Telegram covers spoiler text with particles when it lays the text out, and blurs spoiler photos and
 * videos until they're tapped. Both ask here first.
 *
 * <p>Some covers stay. The blur on view-once media and on sensitive content shares Telegram's media
 * check, so those messages keep it. Telegram also covers login codes itself, so a shared screen
 * doesn't leak one, and a spoiler over text shaped like a code keeps its cover. Text being typed
 * keeps its spoiler preview, and sending, notifications and retries ask Telegram directly.
 */
public final class Spoilers {
    /** Telegram's own login code pattern. */
    private static final Pattern CODE = Pattern.compile("[\\d\\-]{5,8}");

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
            if (text == null || view instanceof EditText || !Utils.settingsReady() || !Settings.REVEAL_SPOILERS.get()) return false;
            boolean covered = false;
            for (Object span : text.getSpans(0, text.length(), Object.class)) {
                if (!spoiler.test(span)) continue;
                int start = text.getSpanStart(span);
                int end = text.getSpanEnd(span);
                if (start >= 0 && end > start && CODE.matcher(text.subSequence(start, end)).matches()) return false;
                covered = true;
            }
            if (covered) HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "spoiler text shown");
            return covered;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "spoiler text", failure);
            return false;
        }
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
        return covered(stockMediaCovered(message), message, Spoilers::keptCovered);
    }

    /** Telegram's answer, or uncovered when the switch is on and only the sender's spoiler covers it. */
    static boolean covered(boolean stock, Object message, Predicate<Object> kept) {
        HookStatus.invoked(FamilyNames.REVEAL_SPOILERS);
        try {
            if (!stock || !Utils.settingsReady() || !Settings.REVEAL_SPOILERS.get()) return stock;
            if (kept.test(message)) return true;
            HookStatus.counted(FamilyNames.REVEAL_SPOILERS, "spoiler media shown");
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REVEAL_SPOILERS, "spoiler media", failure);
            return stock;
        }
    }

    /** Whether a span is a spoiler. Replaced with Telegram's text style check when patching. */
    public static boolean spoilerSpan(Object span) { return false; }

    /** Telegram's own answer. Replaced with MessageObject.hasMediaSpoilers when patching. */
    public static boolean stockMediaCovered(Object message) { return false; }

    /** View-once or sensitive media. Replaced with the MessageObject checks Telegram makes when patching. */
    public static boolean keptCovered(Object message) { return false; }
}
