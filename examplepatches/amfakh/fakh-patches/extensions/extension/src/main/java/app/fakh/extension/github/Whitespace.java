/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import app.fakh.extension.shared.Features;

/**
 * Draws the spaces and tabs of file and diff lines. The app turns each line's HTML into the HTML it shows: spaces and
 * tabs are marked while it reads the text, and the marks become dim symbols once the HTML is written.
 */
@SuppressWarnings("unused")
public final class Whitespace {
    // Private use characters, one per symbol, so the app counts a line's length as before.
    private static final char SPACE = '';
    private static final char TAB = '';

    // A word joiner before a symbol tells it apart from the same character written in the code. Both symbols are in
    // the app's code font: one from a fallback font, such as an arrow, narrows the non-breaking spaces after it.
    private static final String SHOWN_SPACE = "⁠·";
    private static final String SHOWN_TAB = "⁠»";

    private Whitespace() {
    }

    /**
     * Marks the whitespace of a piece of code.
     *
     * @param text The text of one piece of a line.
     * @return The text with each space marked, and each tab as a mark followed by the rest of its 8 columns; the text
     *     itself with the switch off.
     */
    public static String mark(String text) {
        if (!Features.on("fakh_whitespace")) return text;
        return text.replace(' ', SPACE).replace("\t", TAB + "       ");
    }

    /**
     * Turns the marks of a finished line into dim symbols.
     *
     * @param html The HTML of the line.
     * @return The HTML to show.
     */
    public static String show(String html) {
        return html
                .replace(String.valueOf(SPACE), dim(SHOWN_SPACE))
                .replace(String.valueOf(TAB), dim(SHOWN_TAB));
    }

    /**
     * Turns the symbols back into spaces in text taken from a shown line, such as a copied one.
     *
     * @param text The text of the line.
     * @return The text as the app would have copied it.
     */
    public static String hide(String text) {
        return text.replace(SHOWN_SPACE, " ").replace(SHOWN_TAB, " ");
    }

    /** Wraps a symbol in a gray that reads on light and dark backgrounds. */
    private static String dim(String symbol) {
        return "<font color=\"#8c8c8c\">" + symbol + "</font>";
    }
}
