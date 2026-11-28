package com.waze.gw;

import android.graphics.Typeface;
import android.net.Uri;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.BulletSpan;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.view.View;

/**
 * Tiny Markdown renderer for changelogs: # headings, **bold**, *italic* / _italic_, `code`, [text](url),
 * "- " / "* " / "+ " bullets (indented = nested), "1. " numbered lines, ---- rules, "> " quotes.
 * Anything it does not understand is shown as plain text, so a malformed changelog never breaks the dialog.
 */
final class MiniMarkdown {
    private MiniMarkdown() { }

    static CharSequence render(String markdown, float density, int accentColor) {
        SpannableStringBuilder out = new SpannableStringBuilder();
        if (markdown == null) return out;
        String[] lines = markdown.replace("\r\n", "\n").replace('\r', '\n').split("\n", -1);
        boolean blank = true;   // collapse runs of blank lines
        for (String raw : lines) {
            String line = raw;
            String trimmed = line.trim();
            if (trimmed.length() == 0) {
                if (!blank) out.append('\n');
                blank = true;
                continue;
            }
            blank = false;
            int start = out.length();

            if (trimmed.matches("^(-{3,}|\\*{3,}|_{3,})$")) {
                out.append("────────────");
                out.setSpan(new ForegroundColorSpan(0x66FFFFFF), start, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                out.append('\n');
                continue;
            }

            int hashes = 0;
            while (hashes < trimmed.length() && trimmed.charAt(hashes) == '#') hashes++;
            if (hashes >= 1 && hashes <= 6 && trimmed.length() > hashes && trimmed.charAt(hashes) == ' ') {
                inline(out, trimmed.substring(hashes + 1).trim(), accentColor);
                out.setSpan(new StyleSpan(Typeface.BOLD), start, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                out.setSpan(new RelativeSizeSpan(hashes == 1 ? 1.3f : hashes == 2 ? 1.18f : 1.08f), start, out.length(),
                        Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                out.append('\n');
                continue;
            }

            int indent = 0;
            while (indent < line.length() && (line.charAt(indent) == ' ' || line.charAt(indent) == '\t')) {
                indent += line.charAt(indent) == '\t' ? 4 : 1;
            }
            int level = Math.min(3, indent / 2);
            String bullet = null;
            if (trimmed.length() > 1 && (trimmed.startsWith("- ") || trimmed.startsWith("* ") || trimmed.startsWith("+ "))) {
                bullet = trimmed.substring(2).trim();
                inlineBlock(out, bullet, level, density, accentColor, null);
                continue;
            }
            int dot = trimmed.indexOf(". ");
            if (dot > 0 && dot <= 3 && trimmed.substring(0, dot).matches("\\d+")) {
                inlineBlock(out, trimmed.substring(dot + 2).trim(), level, density, accentColor,
                        trimmed.substring(0, dot + 1));
                continue;
            }
            if (trimmed.startsWith("> ")) {
                inline(out, trimmed.substring(2).trim(), accentColor);
                out.setSpan(new StyleSpan(Typeface.ITALIC), start, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                out.append('\n');
                continue;
            }
            inline(out, trimmed, accentColor);
            out.append('\n');
        }
        int end = out.length();
        while (end > 0 && out.charAt(end - 1) == '\n') end--;
        if (end < out.length()) out.delete(end, out.length());
        return out;
    }

    /** One list item as its own paragraph with a hanging bullet (or number) and a nesting indent. */
    private static void inlineBlock(SpannableStringBuilder out, String text, int level, float density,
                                    int accentColor, String number) {
        int start = out.length();
        StringBuilder lead = new StringBuilder();
        for (int i = 0; i < level; i++) lead.append("    ");
        if (number != null) lead.append(number).append(' ');
        out.append(lead);
        inline(out, text, accentColor);
        out.append('\n');
        if (number == null) {
            out.setSpan(new BulletSpan((int) (10 * density)), start, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
    }

    /** **bold**, *italic*, _italic_, `code`, [text](url). Unclosed markers stay literal. */
    private static void inline(SpannableStringBuilder out, String s, int accentColor) {
        int i = 0, n = s.length();
        while (i < n) {
            char c = s.charAt(i);
            if (c == '\\' && i + 1 < n) {            // escaped marker
                out.append(s.charAt(i + 1));
                i += 2;
                continue;
            }
            if (c == '*' && s.startsWith("**", i)) {
                int close = s.indexOf("**", i + 2);
                if (close > i + 2) {
                    int from = out.length();
                    inline(out, s.substring(i + 2, close), accentColor);
                    out.setSpan(new StyleSpan(Typeface.BOLD), from, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    i = close + 2;
                    continue;
                }
            }
            if ((c == '*' || c == '_') && i + 1 < n && s.charAt(i + 1) != ' ' && s.charAt(i + 1) != c) {
                int close = s.indexOf(c, i + 1);
                if (close > i + 1 && s.charAt(close - 1) != ' ') {
                    int from = out.length();
                    inline(out, s.substring(i + 1, close), accentColor);
                    out.setSpan(new StyleSpan(Typeface.ITALIC), from, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    i = close + 1;
                    continue;
                }
            }
            if (c == '`') {
                int close = s.indexOf('`', i + 1);
                if (close > i + 1) {
                    int from = out.length();
                    out.append(s, i + 1, close);
                    out.setSpan(new TypefaceSpan("monospace"), from, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    out.setSpan(new ForegroundColorSpan(accentColor), from, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    i = close + 1;
                    continue;
                }
            }
            if (c == '[') {
                int mid = s.indexOf("](", i + 1);
                int close = mid < 0 ? -1 : s.indexOf(')', mid + 2);
                if (mid > i + 1 && close > mid + 2) {
                    final String url = s.substring(mid + 2, close).trim();
                    int from = out.length();
                    inline(out, s.substring(i + 1, mid), accentColor);
                    if (url.startsWith("http://") || url.startsWith("https://")) {
                        out.setSpan(new ClickableSpan() {
                            @Override public void onClick(View widget) {
                                try {
                                    android.content.Intent intent = new android.content.Intent(
                                            android.content.Intent.ACTION_VIEW, Uri.parse(url));
                                    intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                                    widget.getContext().startActivity(intent);
                                } catch (Throwable ignored) { }
                            }
                        }, from, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    }
                    out.setSpan(new ForegroundColorSpan(accentColor), from, out.length(), Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                    i = close + 1;
                    continue;
                }
            }
            out.append(c);
            i++;
        }
    }
}
