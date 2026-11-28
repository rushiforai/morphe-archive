/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import app.fakh.extension.shared.Features;

/**
 * Draws the spaces and tabs of file and diff lines. The app turns each line's HTML into the HTML it shows: tabs get the
 * picked width and spaces and tabs are marked while it reads the text, and the marks become dim symbols once the HTML is
 * written.
 */
@SuppressWarnings("unused")
public final class WhitespaceMarks {
    // Private use characters, one per symbol, so the app counts a line's length as before.
    private static final char SPACE = '';
    private static final char TAB = '';

    // A word joiner before a symbol tells it apart from the same character written in the code. Both symbols are in
    // the app's code font: one from a fallback font, such as an arrow, narrows the non-breaking spaces after it.
    private static final String SHOWN_SPACE = "⁠·";
    private static final String SHOWN_TAB = "⁠»";

    private WhitespaceMarks() {
    }

    /**
     * Gives the tabs of a piece of code their width, and marks its whitespace with the switch on.
     *
     * @param text The text of one piece of a line.
     * @return The text with each marked space replaced, and each tab as a mark followed by the rest of its columns. With
     *     the switch off, each tab is as many spaces as it is wide, or stays for the app to widen to its own 8.
     */
    public static String mark(String text) {
        int width = MarkdownSettings.pickedTabWidth();
        String columns = "        ".substring(0, width);
        if (Features.on("fakh_whitespace")) {
            return text.replace(' ', SPACE).replace("\t", TAB + columns.substring(1));
        }
        return width == 8 ? text : text.replace("\t", columns);
    }

    /**
     * Keeps the column of a diff line's sign unmarked: the space that fills it on an unchanged line is not code.
     *
     * @param html The HTML of a diff line before the app converts it.
     * @param type The app's {@code DiffLineType} of the line.
     * @return The HTML, with that space as the non-breaking one the app would have turned it into.
     */
    public static String signColumn(String html, Object type) {
        String name = String.valueOf(type);
        if (html == null || !name.equals("CONTEXT") && !name.equals("INJECTED_CONTEXT")) return html;
        int at = 0;
        // The first character of the text, after the tags before it.
        while (at < html.length() && html.charAt(at) == '<') {
            int end = html.indexOf('>', at);
            if (end < 0) return html;
            at = end + 1;
        }
        if (at >= html.length() || html.charAt(at) != ' ') return html;
        return html.substring(0, at) + '\u00A0' + html.substring(at + 1);
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
