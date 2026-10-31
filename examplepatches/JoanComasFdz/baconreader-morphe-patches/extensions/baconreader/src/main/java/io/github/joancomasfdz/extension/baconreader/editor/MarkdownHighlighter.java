// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.editor;

import android.graphics.Color;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.SuperscriptSpan;
import android.text.style.TypefaceSpan;
import android.text.style.UnderlineSpan;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Shows Reddit's markdown formatted while typing, as WhatsApp does: the markers (**, ~~, # ...) stay in the text,
 * dimmed, and the text and its markers get the format. Only the look changes: the text sent is the same.
 */
final class MarkdownHighlighter {
    /** The spans of the highlighter, removed before each update. The user's own text has none. */
    interface Markdown {
    }

    static final class Bold extends StyleSpan implements Markdown {
        Bold() {
            super(Typeface.BOLD);
        }
    }

    static final class Italic extends StyleSpan implements Markdown {
        Italic() {
            super(Typeface.ITALIC);
        }
    }

    static final class Strike extends StrikethroughSpan implements Markdown {
    }

    static final class Mono extends TypefaceSpan implements Markdown {
        Mono() {
            super("monospace");
        }
    }

    static final class Background extends BackgroundColorSpan implements Markdown {
        Background(int color) {
            super(color);
        }
    }

    static final class Foreground extends ForegroundColorSpan implements Markdown {
        Foreground(int color) {
            super(color);
        }
    }

    static final class Size extends RelativeSizeSpan implements Markdown {
        Size(float proportion) {
            super(proportion);
        }
    }

    static final class Superscript extends SuperscriptSpan implements Markdown {
    }

    static final class Underline extends UnderlineSpan implements Markdown {
    }

    // Lines.
    private static final Pattern FENCE = Pattern.compile("^\\s*```.*$");
    private static final Pattern INDENTED_CODE = Pattern.compile("^( {4}|\\t).*$");
    private static final Pattern HEADING = Pattern.compile("^(#{1,6})\\s+.*$");
    private static final Pattern QUOTE = Pattern.compile("^\\s*(>+)(?!!).*$");
    private static final Pattern LIST = Pattern.compile("^\\s*([*-]|\\d+[.)])\\s");
    private static final Pattern RULE = Pattern.compile("^\\s*([-*_])\\s*(\\1\\s*){2,}$");
    private static final Pattern TABLE = Pattern.compile("^\\s*\\|.*$");

    // Inline, in this order.
    private static final Pattern CODE = Pattern.compile("`[^`\\n]+`");
    private static final Pattern LINK = Pattern.compile("\\[([^\\]\\n]+)\\]\\(([^)\\s]*)\\)");
    private static final Pattern BOLD_ITALIC = Pattern.compile("(\\*\\*\\*|___)(?=\\S)([^\\n]+?)(?<=\\S)\\1");
    private static final Pattern BOLD = Pattern.compile("(\\*\\*|__)(?=\\S)([^\\n]+?)(?<=\\S)\\1");
    private static final Pattern ITALIC_STAR =
            Pattern.compile("(?<![*\\\\])\\*(?=[^\\s*])([^\\n*]+?)(?<=[^\\s*])\\*(?!\\*)");
    private static final Pattern ITALIC_UNDERSCORE =
            Pattern.compile("(?<![\\w_\\\\])_(?=[^\\s_])([^\\n_]+?)(?<=[^\\s_])_(?![\\w_])");
    private static final Pattern STRIKE = Pattern.compile("~~(?=\\S)([^\\n]+?)(?<=\\S)~~");
    private static final Pattern SPOILER = Pattern.compile(">!([^\\n]+?)!<");
    private static final Pattern SUPERSCRIPT_GROUP = Pattern.compile("\\^\\(([^)\\n]+)\\)");
    private static final Pattern SUPERSCRIPT_WORD = Pattern.compile("\\^([^\\s^(][^\\s^]*)");

    private final int dim;
    private final int accent;
    private final int codeBackground;
    private final int spoilerBackground;

    MarkdownHighlighter(int textColor, int accentColor) {
        dim = withAlpha(textColor, 0x80);
        accent = accentColor;
        codeBackground = withAlpha(textColor, 0x1F);
        spoilerBackground = withAlpha(textColor, 0x45);
    }

    private static int withAlpha(int color, int alpha) {
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }

    void highlight(Editable text) {
        for (Markdown span : text.getSpans(0, text.length(), Markdown.class)) {
            text.removeSpan(span);
        }
        String string = text.toString();
        boolean inFence = false;
        int lineStart = 0;
        while (lineStart <= string.length()) {
            int lineEnd = string.indexOf('\n', lineStart);
            if (lineEnd < 0) lineEnd = string.length();
            String line = string.substring(lineStart, lineEnd);

            if (FENCE.matcher(line).matches()) {
                code(text, lineStart, lineEnd);
                inFence = !inFence;
            } else if (inFence || INDENTED_CODE.matcher(line).matches()) {
                code(text, lineStart, lineEnd);
            } else {
                line(text, line, lineStart, lineEnd);
                inline(text, line, lineStart);
            }
            lineStart = lineEnd + 1;
        }
    }

    private void code(Editable text, int start, int end) {
        if (start >= end) return;
        set(text, new Mono(), start, end);
        set(text, new Background(codeBackground), start, end);
    }

    private void line(Editable text, String line, int start, int end) {
        if (start >= end) return;
        Matcher heading = HEADING.matcher(line);
        if (heading.matches()) {
            int level = heading.group(1).length();
            set(text, new Size(new float[]{1.6f, 1.45f, 1.3f, 1.2f, 1.1f, 1f}[level - 1]), start, end);
            set(text, new Bold(), start, end);
            set(text, new Foreground(dim), start, start + level);
            return;
        }
        Matcher quote = QUOTE.matcher(line);
        if (quote.matches()) {
            set(text, new Italic(), start, end);
            set(text, new Foreground(dim), start + quote.start(1), start + quote.end(1));
            return;
        }
        if (RULE.matcher(line).matches()) {
            set(text, new Foreground(dim), start, end);
            return;
        }
        Matcher list = LIST.matcher(line);
        if (list.find()) {
            set(text, new Foreground(accent), start + list.start(1), start + list.end(1));
            set(text, new Bold(), start + list.start(1), start + list.end(1));
            return;
        }
        if (TABLE.matcher(line).matches()) {
            set(text, new Mono(), start, end);
            for (int i = 0; i < line.length(); i++) {
                char c = line.charAt(i);
                if (c == '|' || c == '-' || c == ':') set(text, new Foreground(dim), start + i, start + i + 1);
            }
        }
    }

    private void inline(Editable text, String line, int offset) {
        // Inline code first: nothing inside it is formatted.
        List<int[]> code = new ArrayList<>();
        Matcher matcher = CODE.matcher(line);
        while (matcher.find()) {
            code.add(new int[]{matcher.start(), matcher.end()});
            code(text, offset + matcher.start(), offset + matcher.end());
            dim(text, offset + matcher.start(), 1);
            dim(text, offset + matcher.end() - 1, 1);
        }

        matcher = LINK.matcher(line);
        while (matcher.find()) {
            if (inCode(code, matcher.start())) continue;
            int start = offset + matcher.start();
            set(text, new Foreground(accent), start + 1, offset + matcher.end(1));
            set(text, new Underline(), start + 1, offset + matcher.end(1));
            dim(text, start, 1);
            dim(text, offset + matcher.end(1), matcher.end() - matcher.end(1));
        }

        delimited(text, line, offset, code, BOLD_ITALIC, 3, () -> new Object[]{new Bold(), new Italic()});
        delimited(text, line, offset, code, BOLD, 2, () -> new Object[]{new Bold()});
        delimited(text, line, offset, code, ITALIC_STAR, 1, () -> new Object[]{new Italic()});
        delimited(text, line, offset, code, ITALIC_UNDERSCORE, 1, () -> new Object[]{new Italic()});
        delimited(text, line, offset, code, STRIKE, 2, () -> new Object[]{new Strike()});
        delimited(text, line, offset, code, SPOILER, 2, () -> new Object[]{new Background(spoilerBackground)});

        matcher = SUPERSCRIPT_GROUP.matcher(line);
        while (matcher.find()) {
            if (inCode(code, matcher.start())) continue;
            int start = offset + matcher.start();
            int end = offset + matcher.end();
            set(text, new Superscript(), start, end);
            set(text, new Size(0.75f), start, end);
            dim(text, start, 2);
            dim(text, end - 1, 1);
        }
        matcher = SUPERSCRIPT_WORD.matcher(line);
        while (matcher.find()) {
            if (inCode(code, matcher.start())) continue;
            int start = offset + matcher.start();
            set(text, new Superscript(), start, offset + matcher.end());
            set(text, new Size(0.75f), start, offset + matcher.end());
            dim(text, start, 1);
        }
    }

    private interface Factory {
        Object[] create();
    }

    /** Text between equal markers: the markers dimmed, the whole match formatted. */
    private void delimited(Editable text, String line, int offset, List<int[]> code, Pattern pattern,
                           int markerLength, Factory factory) {
        Matcher matcher = pattern.matcher(line);
        while (matcher.find()) {
            if (inCode(code, matcher.start())) continue;
            int start = offset + matcher.start();
            int end = offset + matcher.end();
            for (Object span : factory.create()) set(text, span, start, end);
            dim(text, start, markerLength);
            dim(text, end - markerLength, markerLength);
        }
    }

    private void dim(Editable text, int start, int length) {
        set(text, new Foreground(dim), start, start + length);
    }

    private static boolean inCode(List<int[]> code, int index) {
        for (int[] range : code) {
            if (index >= range[0] && index < range[1]) return true;
        }
        return false;
    }

    private static void set(Editable text, Object span, int start, int end) {
        if (start < 0 || end > text.length() || start >= end) return;
        text.setSpan(span, start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }
}
