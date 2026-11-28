/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.graphics.Color;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.widget.TextView;

import app.fakh.extension.shared.Features;

/**
 * Hides the leading {@code +} and {@code -} signs on diff lines while keeping their alignment and leaving copied code
 * untouched.
 */
@SuppressWarnings("unused")
public final class DiffSigns {
    private static final ThreadLocal<TextView> LAST_VIEW = new ThreadLocal<>();

    private DiffSigns() {
    }

    /** Remembers the diff line text view just populated by the app's HTML binder. */
    public static void track(TextView view) {
        if (Features.on("fakh_hide_diff_signs")) LAST_VIEW.set(view);
    }

    /**
     * Hides the leading diff sign on the tracked text view when the line is an addition or deletion.
     *
     * @param diffLineType The app's {@code DiffLineType} enum value.
     */
    public static void apply(Object diffLineType) {
        TextView view = LAST_VIEW.get();
        LAST_VIEW.remove();
        if (view == null || !isChangedLine(diffLineType) || !Features.on("fakh_hide_diff_signs")) return;
        CharSequence text = view.getText();
        if (text == null || text.length() == 0) return;
        int at = signIndex(text);
        if (at < 0) return;
        Spannable spannable = text instanceof Spannable ? (Spannable) text : new SpannableStringBuilder(text);
        spannable.setSpan(new ForegroundColorSpan(Color.TRANSPARENT), at, at + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        if (spannable != text) view.setText(spannable);
    }

    /**
     * Replaces the leading {@code +} or {@code -} of a Compose diff line with a space so indentation stays aligned.
     *
     * @param line         The raw diff line.
     * @param diffLineType The app's {@code DiffLineType} enum value.
     * @return The line with its diff sign replaced by a space, or the original line.
     */
    public static String hideText(String line, Object diffLineType) {
        if (line == null || line.isEmpty() || !isChangedLine(diffLineType) || !Features.on("fakh_hide_diff_signs")) {
            return line;
        }
        char first = line.charAt(0);
        return first == '+' || first == '-' ? " " + line.substring(1) : line;
    }

    /** Whether {@code diffLineType} is an addition or deletion. */
    private static boolean isChangedLine(Object diffLineType) {
        if (diffLineType == null) return false;
        String name = diffLineType.toString();
        return "ADDITION".equals(name) || "DELETION".equals(name);
    }

    /** Index of the leading {@code +} or {@code -} sign, skipping any leading zero-width spaces. */
    private static int signIndex(CharSequence text) {
        int i = 0;
        while (i < text.length() && text.charAt(i) == '\u200B') i++;
        if (i < text.length()) {
            char c = text.charAt(i);
            if (c == '+' || c == '-') return i;
        }
        return -1;
    }
}
