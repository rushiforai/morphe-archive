/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fakh.extension.shared.Features;

/**
 * Turns the start of a commit, issue or pull request title such as {@code feat(auth): add login} into a colored label, a
 * gray scope and the rest of the title. Ticket keys may come first, as in {@code [ABC-12] feat: add login}, and stay
 * where they are. The types, names and colors are those of Refined GitHub.
 */
@SuppressWarnings("unused")
public final class ConventionalCommits {
    // Starts an issue or pull request title on its way to being drawn. The app draws other texts with the same code, and
    // they stay as they are.
    private static final String MARK = "\u2060";

    // A ticket key such as ABC-12 or abc-12.
    private static final String KEY = "[A-Za-z][A-Za-z0-9_]+-\\d+";

    // The groups: what comes before the type, which is up to five keys, bare or in brackets, each with an optional
    // separator; the type; the scope; the mark of a breaking change. Java's regex recurses on each key, so a title full
    // of them must not go deeper.
    private static final Pattern PREFIX = Pattern.compile("^(" + MARK + "?(?:(?:\\[" + KEY + "\\]|\\(" + KEY + "\\)|"
            + KEY + ")\\s*+(?:[:|-]\\s*+)?){0,5})(\\w+)(?:\\((.+?)\\))?(!)?: *");

    // For each type: the label's name, its background and its text color.
    private static final Map<String, Object[]> TYPES = new HashMap<>();

    static {
        type("feat", "Feature", 0xFFA2EEEF, 0xFF1F2328);
        type("fix", "Fix", 0xFFD73A4A, 0xFFFFFFFF);
        type("chore", "Chore", 0xFFD8DEE4, 0xFF1F2328);
        type("revert", "Revert", 0xFFD8DEE4, 0xFF1F2328);
        type("style", "Style", 0xFFD8DEE4, 0xFF1F2328);
        type("docs", "Docs", 0xFF0075CA, 0xFFFFFFFF);
        type("build", "Build", 0xFFD93F0B, 0xFFFFFFFF);
        type("refactor", "Refactor", 0xFF006B75, 0xFFFFFFFF);
        type("test", "Test", 0xFFFBCA04, 0xFF1F2328);
        type("ci", "CI", 0xFFC5DEF5, 0xFF1F2328);
        type("perf", "Performance", 0xFF5319E7, 0xFFFFFFFF);
    }

    // The gray of the scope, readable on light and dark.
    private static final int SCOPE = 0xFF848D97;

    private ConventionalCommits() {
    }

    /** Adds one commit type. */
    private static void type(String key, String name, int background, int text) {
        TYPES.put(key, new Object[]{name, background, text});
    }

    /**
     * The label of a commit title.
     *
     * @param title The commit title.
     * @return The label with a space on each side, or null with the switch off and for a title without a known type or
     *     with nothing after it.
     */
    public static String label(String title) {
        Matcher prefix = on() ? prefix(title) : null;
        if (prefix == null) return null;
        Object name = TYPES.get(prefix.group(2).toLowerCase())[0];
        return " " + name + (prefix.group(4) == null ? "" : "!") + " ";
    }

    /**
     * The part between the label and the rest of the title.
     *
     * @param title A title with a {@link #label}.
     * @return The scope as {@code " auth: "}, or a space when there is none.
     */
    public static String scope(String title) {
        Matcher prefix = prefix(title);
        return prefix == null || prefix.group(3) == null ? " " : " " + prefix.group(3) + ": ";
    }

    /**
     * Where the label goes: after the ticket keys.
     *
     * @param title A title with a {@link #label}.
     * @return The length of what precedes its type.
     */
    public static int start(String title) {
        Matcher prefix = prefix(title);
        return prefix == null ? 0 : prefix.end(1);
    }

    /**
     * Where the rest of the title starts.
     *
     * @param title A title with a {@link #label}.
     * @return The length of its prefix.
     */
    public static int length(String title) {
        Matcher prefix = prefix(title);
        return prefix == null ? 0 : prefix.end();
    }

    /**
     * The label's background as a Compose color, which keeps sRGB colors in its upper half.
     *
     * @param title A title with a {@link #label}.
     * @return The color.
     */
    public static long background(String title) {
        return compose(color(title, 1));
    }

    /**
     * The label's text color as a Compose color.
     *
     * @param title A title with a {@link #label}.
     * @return The color.
     */
    public static long foreground(String title) {
        return compose(color(title, 2));
    }

    /** @return The scope's gray as a Compose color. */
    public static long gray() {
        return compose(SCOPE);
    }

    /**
     * A commit title for a text view.
     *
     * @param title The commit title.
     * @return The title with its prefix styled, or the title itself when it has no label.
     */
    private static CharSequence styled(CharSequence title) {
        String text = String.valueOf(title);
        String label = label(text);
        if (label == null) return title;
        SpannableStringBuilder styled = new SpannableStringBuilder(title.subSequence(0, start(text)));
        int from = styled.length();
        styled.append(label);
        int to = styled.length();
        styled.setSpan(new BackgroundColorSpan(color(text, 1)), from, to, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        styled.setSpan(new ForegroundColorSpan(color(text, 2)), from, to, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        styled.append(scope(text));
        styled.setSpan(new ForegroundColorSpan(SCOPE), to, styled.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return styled.append(title, length(text), title.length());
    }

    /**
     * Styles the commit title a text view shows.
     *
     * @param view The view, already holding the title.
     */
    public static void restyle(TextView view) {
        CharSequence title = view.getText();
        CharSequence styled = styled(title);
        if (styled != title) view.setText(styled);
    }

    /**
     * Marks the title of an issue or pull request.
     *
     * @param title The title, as HTML or as plain text.
     * @return The marked title; the title itself with the switch off.
     */
    public static String mark(String title) {
        return title == null || !on() ? title : MARK + title;
    }

    /**
     * Whether a title is a marked one.
     *
     * @param title The title.
     * @return True for the title of an issue or pull request.
     */
    public static boolean isMarked(String title) {
        return title != null && title.startsWith(MARK);
    }

    /** Whether titles get labels. */
    private static boolean on() {
        return Features.on("fakh_conventional_commits");
    }

    /** The prefix of a title with a known type and something after it, or null. */
    private static Matcher prefix(String title) {
        if (title == null) return null;
        Matcher prefix = PREFIX.matcher(title);
        return prefix.find() && TYPES.containsKey(prefix.group(2).toLowerCase()) && prefix.end() < title.length()
                ? prefix : null;
    }

    /** One of the two colors of a title's type. */
    private static int color(String title, int index) {
        Matcher prefix = prefix(title);
        return prefix == null ? 0 : (Integer) TYPES.get(prefix.group(2).toLowerCase())[index];
    }

    /** An ARGB color as a Compose color value. */
    private static long compose(int argb) {
        return (long) argb << 32;
    }
}
