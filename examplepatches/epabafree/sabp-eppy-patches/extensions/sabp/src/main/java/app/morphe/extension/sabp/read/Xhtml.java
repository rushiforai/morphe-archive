package app.morphe.extension.sabp.read;

import java.util.Locale;
import java.util.Map;

/** A forgiving XHTML → paragraphs converter (EPUB chapters are often not strictly valid XML). */
final class Xhtml {
    private Xhtml() {
    }

    private static final String[] BLOCK = {"p", "div", "h1", "h2", "h3", "h4", "h5", "h6", "li", "blockquote",
            "section", "article", "tr", "dd", "dt", "figcaption", "pre", "hr", "header", "footer", "aside", "body"};

    static void toParagraphs(String html, BookText out, String docPath, Map<String, int[]> anchors) {
        StringBuilder para = new StringBuilder();
        boolean heading = false;
        int skipDepth = 0; // inside <script>/<style>/<head>
        int i = 0, n = html.length();
        while (i < n) {
            char ch = html.charAt(i);
            if (ch == '<') {
                int end = html.indexOf('>', i);
                if (end < 0) break;
                String tag = html.substring(i + 1, end);
                i = end + 1;
                if (tag.startsWith("!--")) {
                    int close = html.indexOf("-->", i - 1);
                    i = close < 0 ? n : close + 3;
                    continue;
                }
                if (tag.startsWith("!") || tag.startsWith("?")) continue;
                boolean closing = tag.startsWith("/");
                String name = tagName(closing ? tag.substring(1) : tag);
                if (name.equals("script") || name.equals("style") || name.equals("head") || name.equals("title")) {
                    if (closing) skipDepth = Math.max(0, skipDepth - 1);
                    else if (!tag.endsWith("/")) skipDepth++;
                    continue;
                }
                if (skipDepth > 0) continue;
                if (name.equals("br")) {
                    if (para.length() > 0 && para.charAt(para.length() - 1) != ' ') para.append(' ');
                    continue;
                }
                if (isBlock(name)) {
                    flush(out, para, heading);
                    heading = !closing && name.length() == 2 && name.charAt(0) == 'h' && Character.isDigit(name.charAt(1));
                }
                if (!closing) {
                    String id = DocExtractor.attr("<" + tag + ">", "id");
                    if (id != null) anchors.put(docPath + "#" + id, new int[]{out.paras.size(), para.length()});
                    if (name.equals("img")) {
                        String alt = DocExtractor.attr("<" + tag + ">", "alt");
                        if (alt != null && alt.length() > 2) para.append(' ');
                    }
                }
            } else {
                int next = html.indexOf('<', i);
                if (next < 0) next = n;
                if (skipDepth == 0) {
                    String text = entities(html.substring(i, next));
                    // Collapse whitespace but keep word separation.
                    for (int k = 0; k < text.length(); k++) {
                        char c = text.charAt(k);
                        if (Character.isWhitespace(c) || c == ' ') {
                            if (para.length() > 0 && para.charAt(para.length() - 1) != ' ') para.append(' ');
                        } else para.append(c);
                    }
                }
                i = next;
            }
        }
        flush(out, para, heading);
    }

    private static void flush(BookText out, StringBuilder para, boolean heading) {
        String s = para.toString().trim();
        if (!s.isEmpty()) out.addPara(s, heading, -1);
        para.setLength(0);
    }

    private static String tagName(String t) {
        int k = 0;
        while (k < t.length() && !Character.isWhitespace(t.charAt(k)) && t.charAt(k) != '/' && t.charAt(k) != '>') k++;
        String name = t.substring(0, k).toLowerCase(Locale.ROOT);
        int colon = name.indexOf(':');
        return colon >= 0 ? name.substring(colon + 1) : name;
    }

    private static boolean isBlock(String name) {
        for (String b : BLOCK) if (b.equals(name)) return true;
        return false;
    }

    static String entities(String s) {
        if (s == null || s.indexOf('&') < 0) return s;
        StringBuilder b = new StringBuilder(s.length());
        int i = 0;
        while (i < s.length()) {
            char c = s.charAt(i);
            if (c == '&') {
                int semi = s.indexOf(';', i);
                if (semi > i && semi - i < 10) {
                    String e = s.substring(i + 1, semi);
                    String r = entity(e);
                    if (r != null) {
                        b.append(r);
                        i = semi + 1;
                        continue;
                    }
                }
            }
            b.append(c);
            i++;
        }
        return b.toString();
    }

    private static String entity(String e) {
        try {
            if (e.startsWith("#x") || e.startsWith("#X")) return new String(Character.toChars(Integer.parseInt(e.substring(2), 16)));
            if (e.startsWith("#")) return new String(Character.toChars(Integer.parseInt(e.substring(1))));
        } catch (Exception ex) {
            return null;
        }
        switch (e) {
            case "amp":
                return "&";
            case "lt":
                return "<";
            case "gt":
                return ">";
            case "quot":
                return "\"";
            case "apos":
                return "'";
            case "nbsp":
                return " ";
            case "mdash":
                return "—";
            case "ndash":
                return "–";
            case "hellip":
                return "…";
            case "lsquo":
                return "‘";
            case "rsquo":
                return "’";
            case "ldquo":
                return "“";
            case "rdquo":
                return "”";
            default:
                return null;
        }
    }
}
