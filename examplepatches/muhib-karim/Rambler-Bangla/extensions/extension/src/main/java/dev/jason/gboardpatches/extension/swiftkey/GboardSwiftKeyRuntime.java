package dev.jason.gboardpatches.extension.swiftkey;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.SystemClock;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.inputmethod.InputConnection;

import java.util.Locale;

import dev.jason.gboardpatches.extension.shiftdelete.ShiftDeleteSession;

/**
 * Runtime engine for SwiftKey Mode inside Gboard's live soft-key event pipeline:
 * <ol>
 *   <li><b>Shift-to-Capitalize Word at Cursor:</b> When the cursor is touching a cased word
 *       ({@code hello|} or {@code he|llo}) with no selection, tapping (or double-tapping) Shift
 *       cycles {@code hello} &rarr; {@code Hello} &rarr; {@code HELLO} &rarr; {@code hello}
 *       directly in place without activating Caps Lock and without breaking Shift+Backspace
 *       forward delete or mid-word Shift chords.</li>
 *   <li><b>Smart Space Trim Before Punctuation:</b> Tapping {@code , . ? ! ; :} right after a
 *       trailing space ({@code hello |}) trims that extra space so punctuation attaches cleanly
 *       ({@code hello,}) and works harmoniously with Gboard's native Auto-space after punctuation.</li>
 * </ol>
 */
public final class GboardSwiftKeyRuntime {
    static final long DOUBLE_TAP_WINDOW_MS = 500L;
    static final long CYCLE_CONTINUATION_WINDOW_MS = 2200L;
    private static final long SETTINGS_CACHE_TTL_MS = 1000L;
    private static final int LOOKAROUND_CHARS = 64;

    public static final class WordSpan {
        public final int leftLen;
        public final int rightLen;
        public final String word;

        public WordSpan(int leftLen, int rightLen, String word) {
            this.leftLen = leftLen;
            this.rightLen = rightLen;
            this.word = word;
        }
    }

    private static final class CachedConfig {
        final long readAtMs;
        final boolean enabled;
        final boolean shiftCaseEnabled;
        final boolean singleTapMode;
        final boolean punctTrimEnabled;

        CachedConfig(long readAtMs, boolean enabled, boolean shiftCaseEnabled,
                boolean singleTapMode, boolean punctTrimEnabled) {
            this.readAtMs = readAtMs;
            this.enabled = enabled;
            this.shiftCaseEnabled = shiftCaseEnabled;
            this.singleTapMode = singleTapMode;
            this.punctTrimEnabled = punctTrimEnabled;
        }
    }

    private static volatile CachedConfig cachedConfig;

    // Shift tap gesture tracking (UI thread only)
    private static boolean shiftDown;
    private static boolean chordUsedDuringShift;
    private static boolean handledCurrentShiftOnPress;
    private static long lastShiftTapMs;
    private static long lastCycleMs;
    private static String lastCycledLowerWord;

    private GboardSwiftKeyRuntime() {
    }

    /**
     * Observes one soft-key event before Gboard handles it.
     *
     * @return {@code true} if the caller should suppress Gboard's native handling of this event
     *         (used to prevent Caps Lock from engaging on a Shift double-tap word-case cycle).
     */
    public static boolean onSoftKeyEvent(
            Object service, String action, int code, Object payload) {
        if (!(service instanceof InputMethodService ims) || action == null) {
            return false;
        }
        try {
            long nowMs = SystemClock.elapsedRealtime();
            CachedConfig cfg = configFor(ims, nowMs);
            if (!cfg.enabled) {
                return false;
            }

            // 1. Smart space trim before punctuation (, . ? ! ; :)
            if (cfg.punctTrimEnabled && "PRESS".equals(action)) {
                char punct = extractTrimPunctuation(code, payload);
                if (punct != 0) {
                    InputConnection ic = ims.getCurrentInputConnection();
                    if (ic != null && isNoSelection(ic)) {
                        CharSequence before = ic.getTextBeforeCursor(4, 0);
                        if (shouldTrimSpaceBeforePunctuation(before, punct)) {
                            ic.deleteSurroundingText(1, 0);
                        }
                    }
                    resetShiftTapHistory();
                    return false;
                }
            }

            // 2. Shift-to-Capitalize Word at Cursor
            if (!cfg.shiftCaseEnabled) {
                return false;
            }
            if (code == ShiftDeleteSession.SHIFT_DOWN && "DOWN".equals(action)) {
                shiftDown = true;
                chordUsedDuringShift = false;
                handledCurrentShiftOnPress = false;
                return false;
            }
            if (isShiftPressCode(code) && "PRESS".equals(action)) {
                if (!chordUsedDuringShift) {
                    boolean triggered = handleShiftTap(ims, cfg.singleTapMode, nowMs);
                    handledCurrentShiftOnPress = true;
                    // Suppress Gboard's Shift toggle/Caps Lock when our case-cycle handled the tap.
                    return triggered;
                }
                return false;
            }
            if (code == ShiftDeleteSession.SHIFT_UP && "UP".equals(action)) {
                boolean wasCleanTap = shiftDown && !chordUsedDuringShift && !handledCurrentShiftOnPress;
                shiftDown = false;
                chordUsedDuringShift = false;
                handledCurrentShiftOnPress = false;
                if (wasCleanTap) {
                    handleShiftTap(ims, cfg.singleTapMode, nowMs);
                }
                return false;
            }

            // Any non-Shift key press marks a chord (e.g. Shift+Backspace or Shift+P) and resets tap history.
            if (!isShiftKeyCode(code)) {
                if (shiftDown) {
                    chordUsedDuringShift = true;
                }
                if ("PRESS".equals(action)) {
                    resetShiftTapHistory();
                }
            }
            return false;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void onTouch(int actionMasked) {
        if (actionMasked == MotionEvent.ACTION_CANCEL) {
            shiftDown = false;
            chordUsedDuringShift = false;
            handledCurrentShiftOnPress = false;
        }
    }

    public static void invalidateCache() {
        cachedConfig = null;
    }

    public static void resetForTesting() {
        cachedConfig = null;
        shiftDown = false;
        chordUsedDuringShift = false;
        handledCurrentShiftOnPress = false;
        resetShiftTapHistory();
    }

    private static boolean handleShiftTap(
            InputMethodService ims, boolean singleTapMode, long nowMs) {
        InputConnection ic = ims.getCurrentInputConnection();
        if (ic == null || !isNoSelection(ic)) {
            resetShiftTapHistory();
            return false;
        }
        CharSequence before = ic.getTextBeforeCursor(LOOKAROUND_CHARS, 0);
        CharSequence after = ic.getTextAfterCursor(LOOKAROUND_CHARS, 0);
        WordSpan span = extractTouchingWord(before, after);
        if (span == null) {
            resetShiftTapHistory();
            return false;
        }
        String lowerWord = span.word.toLowerCase(Locale.ROOT);
        boolean shouldCycle;
        if (singleTapMode) {
            shouldCycle = true;
        } else {
            boolean isDoubleTap = lastShiftTapMs > 0L && (nowMs - lastShiftTapMs) <= DOUBLE_TAP_WINDOW_MS;
            boolean isContinuation = lastCycleMs > 0L
                    && (nowMs - lastCycleMs) <= CYCLE_CONTINUATION_WINDOW_MS
                    && lowerWord.equals(lastCycledLowerWord);
            shouldCycle = isDoubleTap || isContinuation;
        }
        lastShiftTapMs = nowMs;
        if (!shouldCycle) {
            return false;
        }

        String cycled = cycleCase(span.word);
        if (cycled.equals(span.word)) {
            return false;
        }
        ic.beginBatchEdit();
        try {
            if (ic.deleteSurroundingText(span.leftLen, span.rightLen)) {
                ic.commitText(cycled, 1);
                if (span.rightLen > 0) {
                    // Restore cursor position inside the word when invoked at he|llo.
                    CharSequence updatedBefore = ic.getTextBeforeCursor(LOOKAROUND_CHARS + 16, 0);
                    if (updatedBefore != null && updatedBefore.length() >= span.rightLen) {
                        int cursorPos = updatedBefore.length() - span.rightLen;
                        ic.setSelection(cursorPos, cursorPos);
                    }
                }
            }
        } finally {
            ic.endBatchEdit();
        }
        lastCycleMs = nowMs;
        lastCycledLowerWord = lowerWord;
        lastShiftTapMs = 0L;
        return true;
    }

    /**
     * Extracts the cased word immediately touching the cursor ({@code hello|} or {@code he|llo}).
     * Returns {@code null} when preceded by whitespace ({@code hello |}), at start of line, or
     * when the word has no cased letters (e.g. pure digits or Bengali script).
     */
    public static WordSpan extractTouchingWord(CharSequence before, CharSequence after) {
        if (before == null || before.length() == 0) {
            return null;
        }
        int bLen = before.length();
        if (!isWordChar(before.charAt(bLen - 1))) {
            return null;
        }
        int leftStart = bLen - 1;
        while (leftStart > 0 && isWordChar(before.charAt(leftStart - 1))) {
            leftStart--;
        }
        int rightEnd = 0;
        if (after != null) {
            int aLen = after.length();
            while (rightEnd < aLen && isWordChar(after.charAt(rightEnd))) {
                rightEnd++;
            }
        }
        int leftLen = bLen - leftStart;
        String word = before.subSequence(leftStart, bLen).toString()
                + (rightEnd > 0 ? after.subSequence(0, rightEnd).toString() : "");
        if (!hasCasedLetter(word)) {
            return null;
        }
        return new WordSpan(leftLen, rightEnd, word);
    }

    /**
     * SwiftKey-style in-place case cycle:
     * <ul>
     *   <li>{@code hello} (lowercase / mixed) &rarr; {@code Hello} (Title Case)</li>
     *   <li>{@code Hello} (Title Case, len &ge; 2) &rarr; {@code HELLO} (ALL CAPS)</li>
     *   <li>{@code HELLO} (ALL CAPS) &rarr; {@code hello} (lowercase)</li>
     *   <li>Single letter: {@code a} &rarr; {@code A} &rarr; {@code a}</li>
     * </ul>
     */
    public static String cycleCase(String word) {
        if (word == null || word.isEmpty() || !hasCasedLetter(word)) {
            return word;
        }
        if (isAllUpperCased(word)) {
            return word.toLowerCase(Locale.ROOT);
        }
        if (word.length() >= 2 && isTitleCase(word)) {
            return word.toUpperCase(Locale.ROOT);
        }
        return toTitleCase(word);
    }

    /**
     * Returns true when {@code before} ends with a single trailing ASCII space directly after a
     * word/closing char (e.g. {@code "hello "}) and {@code punct} is a sentence/clause punctuation
     * mark that should attach cleanly without a leading gap.
     */
    public static boolean shouldTrimSpaceBeforePunctuation(CharSequence before, char punct) {
        if (!isTrimPunctuation(punct) || before == null || before.length() < 2) {
            return false;
        }
        int len = before.length();
        if (before.charAt(len - 1) != ' ') {
            return false;
        }
        char prev = before.charAt(len - 2);
        if (Character.isWhitespace(prev) || prev == '.' || prev == ',' || prev == '?'
                || prev == '!' || prev == ';' || prev == ':' || prev == '-' || prev == '('
                || prev == '[' || prev == '{' || prev == '"' || prev == '\'') {
            return false;
        }
        return Character.isLetterOrDigit(prev)
                || prev == ')' || prev == ']' || prev == '}' || prev == '\u201d'
                || (prev >= '\u0980' && prev <= '\u09ff');
    }

    static char extractTrimPunctuation(int code, Object payload) {
        if (payload instanceof CharSequence cs && cs.length() == 1) {
            char ch = cs.charAt(0);
            return isTrimPunctuation(ch) ? ch : 0;
        }
        if (code == KeyEvent.KEYCODE_COMMA) {
            return ',';
        }
        if (code == KeyEvent.KEYCODE_PERIOD) {
            return '.';
        }
        if (code == KeyEvent.KEYCODE_SEMICOLON) {
            return ';';
        }
        return 0;
    }

    private static boolean isTrimPunctuation(char c) {
        return c == ',' || c == '.' || c == '?' || c == '!' || c == ';' || c == ':';
    }

    private static boolean isNoSelection(InputConnection ic) {
        CharSequence sel = ic.getSelectedText(0);
        return sel == null || sel.length() == 0;
    }

    private static boolean isShiftPressCode(int code) {
        return code == KeyEvent.KEYCODE_SHIFT_LEFT || code == KeyEvent.KEYCODE_SHIFT_RIGHT;
    }

    private static boolean isShiftKeyCode(int code) {
        return code == ShiftDeleteSession.SHIFT_DOWN
                || code == ShiftDeleteSession.SHIFT_UP
                || isShiftPressCode(code)
                || code == KeyEvent.KEYCODE_CAPS_LOCK;
    }

    private static boolean isWordChar(char c) {
        return Character.isLetterOrDigit(c) || c == '\'' || c == '\u2019';
    }

    private static boolean hasCasedLetter(String s) {
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.toLowerCase(c) != Character.toUpperCase(c)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isAllUpperCased(String s) {
        boolean sawCased = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.toLowerCase(c) != Character.toUpperCase(c)) {
                sawCased = true;
                if (!Character.isUpperCase(c)) {
                    return false;
                }
            }
        }
        return sawCased;
    }

    private static boolean isTitleCase(String s) {
        boolean sawFirstCased = false;
        boolean sawLaterCased = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.toLowerCase(c) != Character.toUpperCase(c)) {
                if (!sawFirstCased) {
                    if (!Character.isUpperCase(c)) {
                        return false;
                    }
                    sawFirstCased = true;
                } else {
                    if (!Character.isLowerCase(c)) {
                        return false;
                    }
                    sawLaterCased = true;
                }
            }
        }
        return sawFirstCased && sawLaterCased;
    }

    private static String toTitleCase(String s) {
        String lower = s.toLowerCase(Locale.ROOT);
        StringBuilder sb = new StringBuilder(lower.length());
        boolean uppered = false;
        for (int i = 0; i < lower.length(); i++) {
            char c = lower.charAt(i);
            if (!uppered && Character.toLowerCase(c) != Character.toUpperCase(c)) {
                sb.append(Character.toUpperCase(c));
                uppered = true;
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    private static void resetShiftTapHistory() {
        lastShiftTapMs = 0L;
        lastCycleMs = 0L;
        lastCycledLowerWord = null;
    }

    private static CachedConfig configFor(Context context, long nowMs) {
        CachedConfig existing = cachedConfig;
        if (existing != null && (nowMs - existing.readAtMs) < SETTINGS_CACHE_TTL_MS) {
            return existing;
        }
        boolean enabled = GboardSwiftKeySettings.readEnabled(context);
        boolean shiftCase = enabled && GboardSwiftKeySettings.readShiftCaseEnabled(context);
        boolean singleTap = GboardSwiftKeySettings.TRIGGER_SINGLE_TAP.equals(
                GboardSwiftKeySettings.readShiftTrigger(context));
        boolean punctTrim = enabled && GboardSwiftKeySettings.readPunctTrimEnabled(context);
        CachedConfig fresh = new CachedConfig(nowMs, enabled, shiftCase, singleTap, punctTrim);
        cachedConfig = fresh;
        return fresh;
    }
}
