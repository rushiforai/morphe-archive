/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * Comments by bots and agents start collapsed, and those that add nothing, such as "+1", are left out of timelines. The
 * app draws a comment from its HTML: a bot's is wrapped in a {@code details} element, which opens in place when tapped,
 * and a low-quality one is marked so that the timeline can drop it.
 */
@SuppressWarnings("unused")
public final class Comments {
    // Starts the HTML of a comment to leave out. Screens that do not drop comments draw it as usual.
    private static final String LOW_QUALITY = "<!--fakh-low-quality-->";
    private static final String TAG = "FakhComments";

    // One paragraph with no link or image in it.
    private static final Pattern PARAGRAPH =
            Pattern.compile("<p(?: [^>]*)?>((?:(?!</?p[ >]|<a[ >]|<img[ >]).)*)</p>", Pattern.DOTALL);

    // The words of "+1", "me too" and "any updates?" comments, as listed by Refined GitHub.
    private static final Pattern FILLER_WORDS = Pattern.compile(
            "\\b(?:a|an|and|any|bump|dito|ditto|following|for|here|is|issue|issues|me|on|please|pls|plz|question|same"
                    + "|solution|still|there|this|too|update|updates)\\b",
            Pattern.CASE_INSENSITIVE);

    // How many comments the timeline being built on this thread left out.
    private static final ThreadLocal<Integer> LEFT_OUT = new ThreadLocal<>();

    // The HTML of the hidden comment whose header is being drawn, between hiding and preview on the main thread.
    private static String hidden;

    private Comments() {
    }

    /**
     * Keeps a comment's HTML on its minimized state, for the header that says the comment is hidden.
     *
     * @param state The app's minimized state, to which the patch adds the field {@code fakhBody}.
     * @param html  The comment's HTML.
     */
    public static void remember(Object state, String html) {
        try {
            if (state != null) state.getClass().getField("fakhBody").set(state, html);
        } catch (ReflectiveOperationException error) {
            Log.w(TAG, "Hidden comment", error);
        }
    }

    /**
     * Called before a header words the reason a comment is hidden.
     *
     * @param state The comment's minimized state.
     */
    public static void hiding(Object state) {
        try {
            hidden = state == null ? null : (String) state.getClass().getField("fakhBody").get(state);
        } catch (ReflectiveOperationException error) {
            Log.w(TAG, "Hidden comment", error);
        }
    }

    /**
     * Adds the start of the comment under the reason a header just wrote.
     *
     * @param header The text view with the reason.
     */
    public static void preview(TextView header) {
        String html = hidden;
        hidden = null;
        if (html == null || !Features.on("fakh_preview_hidden")) return;
        // One line shows far less than this, and parsing a whole long comment would slow the scroll.
        String start = html.replaceAll("<summary>[^<]*</summary>", "");
        String text = Html.fromHtml(start.substring(0, Math.min(start.length(), 2000)), Html.FROM_HTML_MODE_COMPACT)
                .toString().replaceAll("[\\s\\uFFFC]+", " ").trim();
        if (text.isEmpty()) return;
        SpannableStringBuilder shown = new SpannableStringBuilder(header.getText()).append('\n');
        int from = shown.length();
        shown.append(text);
        shown.setSpan(new ForegroundColorSpan(0xFF848D97), from, shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        header.setSingleLine(false);
        header.setMaxLines(2);
        header.setEllipsize(TextUtils.TruncateAt.END);
        header.setText(shown);
    }

    /**
     * The HTML to draw for a comment.
     *
     * @param author      The app's model of the author, whose toString names its fields.
     * @param html        The comment's HTML.
     * @param type        The app's kind of the comment.
     * @param association How the author is related to the repository.
     * @return The HTML, collapsed or marked while a switch asks for it. Descriptions of issues and pull requests stay as they are.
     */
    public static String body(Object author, String html, Object type, Object association) {
        if (html == null || html.trim().isEmpty()) return html;
        String kind = String.valueOf(type);
        if (kind.startsWith("EditIssueBody(") || kind.startsWith("EditPullRequestBody(")) return html;
        if (Features.on("fakh_collapse_bots") && isBot(String.valueOf(author))) return collapsed("Show bot comment", html);
        // Anyone GitHub marks as related to the repository keeps their comments open.
        if (Features.on("fakh_hide_low_quality") && "NONE".equals(String.valueOf(association)) && isLowQuality(html)) {
            return LOW_QUALITY + html;
        }
        return html;
    }

    /**
     * The items a timeline draws.
     *
     * @param items The app's timeline items.
     * @return Those items without the low-quality comments.
     */
    public static List<Object> visible(List<?> items) {
        List<Object> kept = new ArrayList<>(items.size());
        for (Object item : items) {
            String html = html(item);
            if (html == null || !html.startsWith(LOW_QUALITY)) kept.add(item);
        }
        LEFT_OUT.set(items.size() - kept.size());
        return kept;
    }

    /**
     * The line about the comments the last {@link #visible} call on this thread left out.
     *
     * @return The text, or null when it left none out.
     */
    public static String notice() {
        Integer count = LEFT_OUT.get();
        if (count == null || count == 0) return null;
        return count + " low-quality comment" + (count == 1 ? "" : "s") + " hidden";
    }

    /**
     * The app's closed eye icon.
     *
     * @return Its drawable id.
     */
    @SuppressWarnings("DiscouragedApi")
    public static int icon() {
        Application app = AppRuntime.application();
        return app.getResources().getIdentifier("ic_eye_closed_16", "drawable", app.getPackageName());
    }

    /**
     * The HTML of a timeline item. The Hide low-quality comments patch replaces this method, since only the app's classes
     * can read it.
     *
     * @param item The app's timeline item.
     * @return Null unless patched, or when the item is not a comment on its own.
     */
    public static String html(Object item) {
        return null;
    }

    /**
     * Whether a comment only says it agrees or asks for news.
     *
     * @param html The comment's HTML.
     * @return True for a single paragraph made of filler words, "+1", punctuation and hand emojis.
     */
    static boolean isLowQuality(String html) {
        Matcher paragraph = PARAGRAPH.matcher(html.trim());
        if (!paragraph.matches()) return false;
        String text = paragraph.group(1).replaceAll("<[^>]*>", "").trim();
        return !text.isEmpty() && FILLER_WORDS.matcher(text).replaceAll("").replaceAll(
                "[\\s!,.?\\x{1F44C}\\x{1F44D}\\x{1F44E}\\x{1F64F}]+|[\\x{1F3FB}-\\x{1F3FF}]|[+-]\\d+|\\x{2B06}\\x{FE0F}",
                "").isEmpty();
    }

    /** HTML behind a line that opens it. */
    private static String collapsed(String summary, String html) {
        return "<details><summary>" + summary + "</summary>" + html + "</details>";
    }

    /** Whether an author is a bot: it has a bot's name or flags, or its page is that of a GitHub App. */
    private static boolean isBot(String author) {
        return author.startsWith("Author(")
                && (!author.contains(", botDisplayName=null, isCopilot=false, isAgent=false,")
                || author.contains(", url=https://github.com/apps/"));
    }
}
