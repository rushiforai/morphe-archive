package dev.custom.gboardpatches.keyboard;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.Locale;

/**
 * Swiping up or down on a suggested word in the candidate strip changes the capitalization of the
 * word that gets inserted: up capitalizes it, down lowercases it.
 *
 * The gesture is only observed. Every event still reaches the candidate chip untouched, so the stock
 * tap handler runs its normal commit: trailing space, composing state and suggestion bookkeeping are
 * all exactly as they are without this feature. What the swipe does is arm a single pending
 * capitalisation, which the commit hook ({@link #applyCommittedCase(CharSequence)}) consumes when
 * the very same word reaches the commit path.
 *
 * Nothing here rewrites candidate data, synthesises touch events or commits text itself: if the
 * stock tap never commits (for example because the drag turns the tap into a cancel), the pending
 * capitalisation simply expires and no text is inserted.
 *
 * Everything is reflection-free and wrapped in catch blocks: any surprise shape leaves the stock
 * keyboard untouched.
 */
public final class SmartBarCaseSwipeRuntime {

    private static final int MAX_DEPTH = 8;

    /** A stale swipe must never re-case an unrelated commit. */
    private static final long PENDING_WINDOW_MS = 800L;

    private static View trackedChip;
    private static String trackedText;
    private static float downX;
    private static float downY;
    private static boolean swiping;
    private static boolean swipeUp;

    private static String pendingText;
    private static boolean pendingUpper;
    private static long pendingAt;

    private SmartBarCaseSwipeRuntime() {
    }

    /**
     * Observes a touch on the candidate strip. The result is never used to consume the event: the
     * strip always dispatches it to its children, so the stock tap commits normally.
     */
    public static void handleTouch(ViewGroup strip, MotionEvent event) {
        try {
            if (strip == null || event == null) {
                return;
            }
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    resetGesture();
                    View chip = findChipAt(strip, event.getX(), event.getY(), 0);
                    if (chip == null) {
                        return;
                    }
                    String text = candidateText(chip);
                    if (text == null) {
                        return;
                    }
                    trackedChip = chip;
                    trackedText = text;
                    downX = event.getX();
                    downY = event.getY();
                    return;
                case MotionEvent.ACTION_MOVE:
                    if (trackedChip == null || swiping) {
                        return;
                    }
                    if (isVerticalSwipe(strip, event)) {
                        swiping = true;
                        trackedChip.setPressed(false);
                    }
                    return;
                case MotionEvent.ACTION_UP:
                    if (trackedChip != null && (swiping || isVerticalSwipe(strip, event))) {
                        boolean upper = swiping ? swipeUp : event.getY() < downY;
                        arm(trackedText, upper);
                    }
                    resetGesture();
                    return;
                case MotionEvent.ACTION_CANCEL:
                    resetGesture();
                    return;
                default:
                    return;
            }
        } catch (Throwable ignored) {
            resetGesture();
        }
    }

    /**
     * Commit hook. Returns the same text with only its capitalization changed when the commit is the
     * word a swipe just armed; otherwise the text is returned untouched.
     */
    public static CharSequence applyCommittedCase(CharSequence text) {
        try {
            String word = pendingText;
            if (text == null || word == null) {
                return text;
            }
            if (android.os.SystemClock.uptimeMillis() - pendingAt > PENDING_WINDOW_MS) {
                clearPending();
                return text;
            }
            String committed = text.toString();
            int start = 0;
            while (start < committed.length() && Character.isWhitespace(committed.charAt(start))) {
                start++;
            }
            int end = committed.length();
            while (end > start && Character.isWhitespace(committed.charAt(end - 1))) {
                end--;
            }
            String visible = committed.substring(start, end);
            if (visible.length() == 0 || !visible.equalsIgnoreCase(word)) {
                // A different word is being committed: leave it alone, the swipe is stale.
                clearPending();
                return text;
            }
            String replacement = pendingUpper ? capitalize(visible) : visible.toLowerCase(Locale.ROOT);
            clearPending();
            if (replacement == null || replacement.equals(visible)) {
                return text;
            }
            return committed.substring(0, start) + replacement + committed.substring(end);
        } catch (Throwable ignored) {
            clearPending();
            return text;
        }
    }

    private static void arm(String text, boolean upper) {
        if (text == null) {
            return;
        }
        String word = text.trim();
        if (word.length() == 0 || !hasLetter(word)) {
            return;
        }
        pendingText = word;
        pendingUpper = upper;
        pendingAt = android.os.SystemClock.uptimeMillis();
    }

    private static void clearPending() {
        pendingText = null;
        pendingUpper = false;
        pendingAt = 0L;
    }

    private static boolean isVerticalSwipe(ViewGroup strip, MotionEvent event) {
        View chip = trackedChip;
        if (chip == null) {
            return false;
        }
        float dx = event.getX() - downX;
        float dy = event.getY() - downY;
        float threshold = Math.max(dp(strip.getContext(), 24), chip.getHeight() * 0.35f);
        if (Math.abs(dy) < threshold || Math.abs(dy) <= Math.abs(dx)) {
            return false;
        }
        swipeUp = dy < 0f;
        return true;
    }

    /** Upper-cases the first letter and leaves the rest of the suggestion alone. */
    private static String capitalize(String text) {
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (Character.isLetter(c)) {
                return text.substring(0, i) + Character.toUpperCase(c) + text.substring(i + 1);
            }
        }
        return null;
    }

    /** The word shown on a candidate chip, read from its text views. */
    private static String candidateText(View chip) {
        String label = textFromTextViews(chip, 0);
        if (label == null) {
            return null;
        }
        String trimmed = label.trim();
        return hasLetter(trimmed) ? trimmed : null;
    }

    private static String textFromTextViews(View view, int depth) {
        if (depth > MAX_DEPTH) {
            return null;
        }
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            if (text != null) {
                String value = text.toString().trim();
                if (hasLetter(value)) {
                    return value;
                }
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                String nested = textFromTextViews(group.getChildAt(i), depth + 1);
                if (nested != null) {
                    return nested;
                }
            }
        }
        return null;
    }

    /** Walks the strip at the touch point and returns the candidate chip under it. */
    private static View findChipAt(ViewGroup group, float x, float y, int depth) {
        if (depth > MAX_DEPTH) {
            return null;
        }
        for (int i = group.getChildCount() - 1; i >= 0; i--) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE) {
                continue;
            }
            float localX = x - child.getLeft() + group.getScrollX();
            float localY = y - child.getTop() + group.getScrollY();
            if (localX < 0 || localY < 0 || localX >= child.getWidth() || localY >= child.getHeight()) {
                continue;
            }
            if (child instanceof ViewGroup) {
                View deeper = findChipAt((ViewGroup) child, localX, localY, depth + 1);
                if (deeper != null) {
                    return deeper;
                }
            }
            if (isSoftKeyView(child)) {
                return child;
            }
        }
        return null;
    }

    private static boolean isSoftKeyView(View view) {
        for (Class<?> type = view.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            if ("com.google.android.libraries.inputmethod.widgets.SoftKeyView".equals(type.getName())) {
                return true;
            }
        }
        return false;
    }

    private static boolean hasLetter(String text) {
        if (text == null) {
            return false;
        }
        for (int i = 0; i < text.length(); i++) {
            if (Character.isLetter(text.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    private static float dp(android.content.Context context, int value) {
        float density = context == null ? 1f : context.getResources().getDisplayMetrics().density;
        if (density <= 0f) {
            density = 1f;
        }
        return value * density;
    }

    private static void resetGesture() {
        trackedChip = null;
        trackedText = null;
        downX = 0f;
        downY = 0f;
        swiping = false;
        swipeUp = false;
    }
}
