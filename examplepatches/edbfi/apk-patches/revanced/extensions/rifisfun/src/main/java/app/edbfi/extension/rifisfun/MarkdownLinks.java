// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.util.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * "Fix markdown links". Reddit's markdown renderer no longer takes a link whose target has neither a scheme nor a
 * leading slash, such as {@code [name](u/name)}, {@code [sub](r/sub)} or {@code [site](www.example.com)}: it leaves the
 * source as text and autolinks the target alone, so {@code body_html} holds
 * {@code [name](<a href="/u/name">u/name</a>)}, which the app shows as is. This turns each such leftover into the
 * link it was written as, {@code <a href="/u/name">name</a>}, in the HTML the app is about to parse.
 *
 * <p>Only the exact leftover is changed: a balanced label, then {@code ](}, one anchor of Reddit's that holds plain
 * text, and {@code )} right after it. Text inside code, preformatted blocks and existing links is never touched.
 */
public final class MarkdownLinks {
    /** Tags a label may not hold: a link label never crosses a block. */
    private static final Set<String> BLOCKS =
            new HashSet<>(Arrays.asList("p", "div", "li", "ul", "ol", "pre", "blockquote", "table", "thead", "tbody",
                    "tr", "td", "th", "hr", "br", "h1", "h2", "h3", "h4", "h5", "h6"));
    /** Tags with no end tag. */
    private static final Set<String> VOID = new HashSet<>(Arrays.asList("img", "wbr"));
    /** How far a label may reach, so a stray "[" doesn't scan the rest of a long body. */
    private static final int MAX_LABEL = 1000;

    private MarkdownLinks() {}

    /** Turned on by the "Fix markdown links" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /** Called with the HTML of every body the app renders, before it parses it. Never throws. */
    public static String fix(String html) {
        if (!isEnabled() || html == null || !html.contains("](")) return html;
        try {
            return fixLinks(html);
        } catch (RuntimeException error) {
            Log.w(App.TAG, "Fix markdown links failed", error);
            return html;
        }
    }

    static String fixLinks(String html) {
        StringBuilder out = null;
        int copied = 0;
        // How deep the scan is in elements whose text stays as it is.
        int code = 0;
        int pre = 0;
        int anchor = 0;
        int i = 0;
        while (i < html.length()) {
            char c = html.charAt(i);
            if (c == '<') {
                Tag tag = Tag.at(html, i);
                if (tag == null) return out == null ? html : out.append(html, copied, html.length()).toString();
                int step = tag.closing ? -1 : tag.selfClosing ? 0 : 1;
                switch (tag.name) {
                    case "code": code = Math.max(0, code + step); break;
                    case "pre": pre = Math.max(0, pre + step); break;
                    case "a": anchor = Math.max(0, anchor + step); break;
                    default: break;
                }
                i = tag.end;
                continue;
            }
            if (c == '[' && code == 0 && pre == 0 && anchor == 0) {
                Link link = linkAt(html, i);
                if (link != null) {
                    if (out == null) out = new StringBuilder(html.length());
                    out.append(html, copied, i).append(link.html);
                    i = copied = link.end;
                    continue;
                }
            }
            i++;
        }
        return out == null ? html : out.append(html, copied, html.length()).toString();
    }

    /** A link to put in place of the text up to {@code end}. */
    private static final class Link {
        final String html;
        final int end;

        Link(String html, int end) {
            this.html = html;
            this.end = end;
        }
    }

    /**
     * The link to put in place of the leftover {@code [label](<a …>target</a>)} starting at {@code start}, or null
     * when none starts there.
     */
    private static Link linkAt(String html, int start) {
        // The label: balanced brackets outside code, balanced inline tags, no block.
        List<String> open = new ArrayList<>();
        StringBuilder label = new StringBuilder();
        boolean text = false;
        int depth = 1;
        int code = 0;
        int i = start + 1;
        int limit = Math.min(html.length(), start + 1 + MAX_LABEL);
        while (true) {
            if (i >= limit) return null;
            char c = html.charAt(i);
            if (c == '<') {
                Tag tag = Tag.at(html, i);
                if (tag == null || tag.name.isEmpty() || BLOCKS.contains(tag.name)) return null;
                if (tag.closing) {
                    if (open.isEmpty() || !open.get(open.size() - 1).equals(tag.name)) return null;
                    open.remove(open.size() - 1);
                    if (tag.name.equals("code")) code--;
                } else if (!tag.selfClosing && !VOID.contains(tag.name)) {
                    open.add(tag.name);
                    if (tag.name.equals("code")) code++;
                }
                // A link can't hold a link: keep the text of one the label holds, not its tags.
                if (!tag.name.equals("a")) label.append(html, i, tag.end);
                i = tag.end;
                continue;
            }
            if (code == 0 && c == '[') depth++;
            if (code == 0 && c == ']' && --depth == 0) break;
            if (!Character.isWhitespace(c)) text = true;
            label.append(c);
            i++;
        }
        if (!open.isEmpty() || !text || !html.startsWith("](", i)) return null;

        // The target: one of Reddit's autolinks, with nothing else between the parentheses.
        Tag target = Tag.at(html, i + 2);
        if (target == null || target.closing || !target.name.equals("a") || target.href() == null) return null;
        int close = html.indexOf('<', target.end);
        if (close < 0 || close == target.end) return null;
        for (int j = target.end; j < close; j++) {
            if (Character.isWhitespace(html.charAt(j))) return null;
        }
        Tag end = Tag.at(html, close);
        if (end == null || !end.closing || !end.name.equals("a") || !html.startsWith(")", end.end)) return null;
        return new Link(html.substring(target.start, target.end) + label + "</a>", end.end + 1);
    }

    /** An HTML tag, {@code <name …>} or {@code </name>}, as Reddit writes them. */
    static final class Tag {
        final int start;
        final int end;
        final String name;
        final boolean closing;
        final boolean selfClosing;
        private final String source;

        private Tag(String source, int start, int end, String name, boolean closing, boolean selfClosing) {
            this.source = source;
            this.start = start;
            this.end = end;
            this.name = name;
            this.closing = closing;
            this.selfClosing = selfClosing;
        }

        /** The tag starting at {@code start}, or null when none does or it never ends. */
        static Tag at(String html, int start) {
            if (start >= html.length() || html.charAt(start) != '<') return null;
            int i = start + 1;
            boolean closing = i < html.length() && html.charAt(i) == '/';
            if (closing) i++;
            int nameStart = i;
            while (i < html.length() && Character.isLetterOrDigit(html.charAt(i))) i++;
            String name = html.substring(nameStart, i).toLowerCase(Locale.ROOT);
            char quote = 0;
            for (; i < html.length(); i++) {
                char c = html.charAt(i);
                if (quote != 0) {
                    if (c == quote) quote = 0;
                } else if (c == '"' || c == '\'') {
                    quote = c;
                } else if (c == '>') {
                    return new Tag(html, start, i + 1, name, closing, html.charAt(i - 1) == '/');
                }
            }
            return null;
        }

        /** The value of the tag's double-quoted href attribute, or null. */
        String href() {
            String tag = source.substring(start, end);
            int at = tag.indexOf(" href=\"");
            if (at < 0) return null;
            int from = at + 7;
            int to = tag.indexOf('"', from);
            return to <= from ? null : tag.substring(from, to);
        }
    }
}
