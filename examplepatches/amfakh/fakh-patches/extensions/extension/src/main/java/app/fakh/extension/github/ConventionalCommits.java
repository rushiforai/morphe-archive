/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.net.Uri;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.ReplacementSpan;
import android.util.Log;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;

/**
 * Turns the start of a commit, issue or pull request title such as {@code feat(auth): add login} into a colored pill, a
 * gray scope and the rest of the title. Ticket keys may come first, as in {@code [ABC-12] feat: add login}, and stay
 * where they are. The types, names and colors are those of Refined GitHub.
 */
@SuppressWarnings("unused")
public final class ConventionalCommits {
    static final String FEATURE = "fakh_conventional_commits";

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

    // The background and text color of each label's name.
    private static final Map<String, int[]> BY_LABEL = new HashMap<>();

    // The text size a pill image is drawn at, which sets its resolution.
    private static final float IMAGE_TEXT = 96f;

    // How far, in em of the title, the pill of an image sits below the middle of the line. Compose centers the image on
    // the line, whose middle is above that of the letters.
    private static final float IMAGE_DROP = 0.032f;

    // The pill images this process has drawn.
    private static final Set<String> DRAWN = new HashSet<>();

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
        BY_LABEL.put(name, new int[]{background, text});
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
     * The width of a pill in Compose's text.
     *
     * @param label A {@link #label}.
     * @return The width in em units of the title.
     */
    public static float pillWidthEm(String label) {
        String name = label.replace("\u00A0", "");
        return new PillSpan(0, 0).getSize(imagePaint(), name, 0, name.length(), null) / IMAGE_TEXT;
    }

    /**
     * The height of a pill's image in Compose's text: the pill, as tall as a line of letters, under an empty strip.
     *
     * @return The height in em units of the title.
     */
    public static float pillHeightEm() {
        Paint.FontMetrics metrics = imagePaint().getFontMetrics();
        // The strip is twice the drop, since centering takes half of it back.
        return (float) Math.ceil(metrics.descent - metrics.ascent) / IMAGE_TEXT + 2 * IMAGE_DROP;
    }

    /**
     * A pill as an image, since Compose's text cannot draw a {@link PillSpan}. The span draws it, and Compose scales it
     * into a placeholder of {@link #pillWidthEm} by {@link #pillHeightEm}, so it looks like the pill of a text view at
     * every title size.
     *
     * @param label A {@link #label}.
     * @return The address of the image, a file in the app's cache.
     */
    public static String pillImage(String label) {
        String name = label.replace("\u00A0", "");
        File file = new File(AppRuntime.application().getCacheDir(), "fakh_pill_" + name + ".png");
        // Drawn again in a new process, so an updated app does not show the image of the old one.
        if (DRAWN.add(name) || !file.exists()) {
            int[] colors = BY_LABEL.get(name.replace("!", ""));
            Paint paint = imagePaint();
            int height = Math.round(pillHeightEm() * IMAGE_TEXT);
            PillSpan span = new PillSpan(colors[0], colors[1]);
            Bitmap pill = Bitmap.createBitmap(span.getSize(paint, name, 0, name.length(), null), height,
                    Bitmap.Config.ARGB_8888);
            int top = Math.round(2 * IMAGE_DROP * IMAGE_TEXT);
            span.draw(new Canvas(pill), name, 0, name.length(), 0, top,
                    top + Math.round(-paint.getFontMetrics().ascent), height, paint);
            try (FileOutputStream out = new FileOutputStream(file)) {
                pill.compress(Bitmap.CompressFormat.PNG, 100, out);
            } catch (IOException error) {
                Log.w("FakhPill", "Pill image " + name, error);
                DRAWN.remove(name);
            }
        }
        return Uri.fromFile(file).toString();
    }

    /** @return The scope's gray as a Compose color. */
    public static long gray() {
        return compose(SCOPE);
    }

    /**
     * A commit title for a text view.
     *
     * @param title The commit title.
     * @return The title with its prefix styled as a pill, or the title itself when it has no label.
     */
    private static CharSequence styled(CharSequence title) {
        String text = String.valueOf(title);
        String label = label(text);
        if (label == null) return title;
        SpannableStringBuilder styled = new SpannableStringBuilder(title.subSequence(0, start(text)));
        int from = styled.length();
        // The pill pads itself, so the label goes without its spaces.
        styled.append(label.replace("\u00A0", ""));
        int to = styled.length();
        styled.setSpan(new PillSpan(color(text, 1), color(text, 2)), from, to, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        styled.append(scope(text));
        styled.setSpan(new ForegroundColorSpan(SCOPE), to, styled.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return styled.append(title, length(text), title.length());
    }

    /**
     * The summary of the switch's row: its description over the pills of three types.
     *
     * @param description The translated description.
     * @return The description, then a line with the pills.
     */
    static CharSequence summary(String description) {
        SpannableStringBuilder summary = new SpannableStringBuilder(description).append('\n');
        for (String type : new String[]{"feat", "fix", "chore"}) {
            Object[] label = TYPES.get(type);
            int from = summary.length();
            summary.append((String) label[0]);
            summary.setSpan(new PillSpan((Integer) label[1], (Integer) label[2]), from, summary.length(),
                    Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            // The space between pills, which also gives the line its height.
            summary.append(' ');
        }
        return summary;
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
        return Features.on(FEATURE);
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

    /** The paint a pill image is drawn with, in the font of the app's titles. */
    @SuppressWarnings("DiscouragedApi")
    private static Paint imagePaint() {
        Application app = AppRuntime.application();
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setTextSize(IMAGE_TEXT);
        paint.setTypeface(app.getResources().getFont(
                app.getResources().getIdentifier("inter_medium", "font", app.getPackageName())));
        return paint;
    }

    /** An ARGB color as a Compose color value. */
    private static long compose(int argb) {
        return (long) argb << 32;
    }

    /** Draws a commit type inside a rounded pill, in a text view, a settings row and the image Compose's text shows. */
    private static final class PillSpan extends ReplacementSpan {
        private final int background;
        private final int foreground;
        private final RectF bounds = new RectF();

        PillSpan(int background, int foreground) {
            this.background = background;
            this.foreground = foreground;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            float padX = paint.getTextSize() * 0.45f;
            return Math.round(paint.measureText(text, start, end) + padX * 2f);
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom,
                         Paint paint) {
            float padX = paint.getTextSize() * 0.45f;
            float width = paint.measureText(text, start, end) + padX * 2f;
            Paint.FontMetrics fm = paint.getFontMetrics();
            float rectTop = Math.max(top, y + fm.ascent - 1f);
            float rectBottom = Math.min(bottom, y + fm.descent + 1f);
            bounds.set(x, rectTop, x + width, rectBottom);
            float radius = bounds.height() / 2f;

            int savedColor = paint.getColor();
            paint.setColor(background);
            canvas.drawRoundRect(bounds, radius, radius, paint);
            paint.setColor(foreground);
            canvas.drawText(text, start, end, x + padX, y, paint);
            paint.setColor(savedColor);
        }
    }
}
