// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.editor;

import android.text.Editable;
import android.widget.EditText;

/**
 * The buttons of the format bar, on the selection (or at the cursor) of the text box. Inline formats wrap the
 * selection in markers, or remove them when it already has them; line formats prefix the selected lines.
 */
final class MarkdownActions {
    private MarkdownActions() {
    }

    /** **bold**, *italic*, ~~strikethrough~~, ^(superscript), >!spoiler!<, `code`. */
    static void wrap(EditText editText, String open, String close) {
        Editable text = editText.getText();
        int start = Math.min(editText.getSelectionStart(), editText.getSelectionEnd());
        int end = Math.max(editText.getSelectionStart(), editText.getSelectionEnd());
        if (start < 0) start = end = text.length();

        // Already formatted: remove the markers.
        if (start >= open.length() && end + close.length() <= text.length()
                && text.subSequence(start - open.length(), start).toString().equals(open)
                && text.subSequence(end, end + close.length()).toString().equals(close)) {
            text.delete(end, end + close.length());
            text.delete(start - open.length(), start);
            editText.setSelection(start - open.length(), end - open.length());
            return;
        }
        text.insert(end, close);
        text.insert(start, open);
        editText.setSelection(start + open.length(), end + open.length());
    }

    /** [selected text](url): the cursor goes to the url, or to the text when nothing is selected. */
    static void link(EditText editText) {
        Editable text = editText.getText();
        int start = Math.min(editText.getSelectionStart(), editText.getSelectionEnd());
        int end = Math.max(editText.getSelectionStart(), editText.getSelectionEnd());
        if (start < 0) start = end = text.length();
        if (start == end) {
            text.insert(start, "[](https://)");
            editText.setSelection(start + 1);
        } else {
            text.insert(end, "](https://)");
            text.insert(start, "[");
            int url = end + 1 + "](".length();
            editText.setSelection(url, url + "https://".length());
        }
    }

    /** # Heading: each tap adds a level (up to ######), then removes it. */
    static void heading(EditText editText) {
        Editable text = editText.getText();
        int cursor = Math.max(0, editText.getSelectionStart());
        int lineStart = lineStart(text, cursor);
        int level = 0;
        while (lineStart + level < text.length() && text.charAt(lineStart + level) == '#') level++;
        boolean space = lineStart + level < text.length() && text.charAt(lineStart + level) == ' ';
        if (level >= 6) {
            text.delete(lineStart, lineStart + level + (space ? 1 : 0));
        } else if (level > 0) {
            text.insert(lineStart, "#");
        } else {
            text.insert(lineStart, "# ");
            ensureBlankLineBefore(text, lineStart);
        }
    }

    /**
     * Bullets ("* "), numbers ("1. ", "2. "...), quotes ("> ") or code ("    ") on the selected lines; removed
     * when all of them have it. Reddit needs an empty line before a list, quote or code block.
     */
    static void prefixLines(EditText editText, String prefix, boolean numbered) {
        Editable text = editText.getText();
        int start = Math.max(0, Math.min(editText.getSelectionStart(), editText.getSelectionEnd()));
        int end = Math.max(0, Math.max(editText.getSelectionStart(), editText.getSelectionEnd()));
        int first = lineStart(text, start);

        // The lines, from the last one so the positions do not move.
        java.util.List<Integer> lines = new java.util.ArrayList<>();
        for (int line = first; ; ) {
            lines.add(line);
            int next = text.toString().indexOf('\n', line);
            if (next < 0 || next >= end) break;
            line = next + 1;
        }
        boolean all = true;
        for (int i = 0; i < lines.size(); i++) {
            if (!startsWith(text, lines.get(i), numbered ? (i + 1) + ". " : prefix)) all = false;
        }
        for (int i = lines.size() - 1; i >= 0; i--) {
            String linePrefix = numbered ? (i + 1) + ". " : prefix;
            if (all) text.delete(lines.get(i), lines.get(i) + linePrefix.length());
            else if (!startsWith(text, lines.get(i), linePrefix)) text.insert(lines.get(i), linePrefix);
        }
        if (!all) ensureBlankLineBefore(text, first);
    }

    /** A table or a horizontal rule, on its own lines with empty lines around it. */
    static void block(EditText editText, String block) {
        Editable text = editText.getText();
        int cursor = Math.max(0, Math.max(editText.getSelectionStart(), editText.getSelectionEnd()));
        StringBuilder insert = new StringBuilder();
        if (cursor > 0 && text.charAt(cursor - 1) != '\n') insert.append("\n\n");
        else if (cursor > 1 && text.charAt(cursor - 2) != '\n') insert.append('\n');
        insert.append(block).append("\n\n");
        text.insert(cursor, insert);
        editText.setSelection(cursor + insert.length());
    }

    private static int lineStart(CharSequence text, int index) {
        int start = Math.min(index, text.length());
        while (start > 0 && text.charAt(start - 1) != '\n') start--;
        return start;
    }

    private static boolean startsWith(CharSequence text, int index, String prefix) {
        return index + prefix.length() <= text.length()
                && text.subSequence(index, index + prefix.length()).toString().equals(prefix);
    }

    /**
     * Lists, quotes, headings and code need an empty line before them, unless they start the text or continue a
     * list, quote or code block.
     */
    private static void ensureBlankLineBefore(Editable text, int lineStart) {
        if (lineStart == 0) return;
        int previousEnd = lineStart - 1; // The '\n' ending the previous line.
        int previousStart = lineStart(text, previousEnd);
        String previous = text.subSequence(previousStart, previousEnd).toString();
        if (previous.trim().isEmpty() || BLOCK_LINE.matcher(previous).find()) return;
        text.insert(lineStart, "\n");
    }

    private static final java.util.regex.Pattern BLOCK_LINE =
            java.util.regex.Pattern.compile("^(\\s*([*-]|\\d+[.)])\\s|\\s*>| {4}|\\t)");
}
