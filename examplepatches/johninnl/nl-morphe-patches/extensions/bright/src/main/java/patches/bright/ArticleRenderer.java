package patches.bright;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Renders one complete reader document or defers the whole article. The
 * document runs no publisher application scripts: strict CSP, no native
 * bridge, allowlisted tags/attributes/schemes only, and canonical share and
 * open-original links preserved as ordinary https anchors.
 */
final class ArticleRenderer {

    /** Tags kept from publisher rich text; everything else is escaped away. */
    private static final Set<String> ALLOWED_TAGS;
    /** Tags that must be balanced containers; <br> stands alone. */
    private static final String[] VOID_OK = {"br"};

    static {
        ALLOWED_TAGS = new HashSet<String>();
        ALLOWED_TAGS.add("p");
        ALLOWED_TAGS.add("br");
        ALLOWED_TAGS.add("strong");
        ALLOWED_TAGS.add("b");
        ALLOWED_TAGS.add("em");
        ALLOWED_TAGS.add("i");
        ALLOWED_TAGS.add("a");
        ALLOWED_TAGS.add("h2");
        ALLOWED_TAGS.add("h3");
        ALLOWED_TAGS.add("h4");
        ALLOWED_TAGS.add("ul");
        ALLOWED_TAGS.add("ol");
        ALLOWED_TAGS.add("li");
        ALLOWED_TAGS.add("blockquote");
        ALLOWED_TAGS.add("code");
        ALLOWED_TAGS.add("span");
    }

    /** A complete reader document, or null to defer to the publisher. */
    String render(ArticleDocument document, boolean dark) {
        if (document == null || !document.isRenderable()) {
            return null;
        }
        StringBuilder body = new StringBuilder();
        boolean videoFirst = document.blocks().get(0).type == ArticleDocument.BlockType.VIDEO;
        if (!videoFirst && document.heroImage != null && !appendImage(body, document.heroImage, document.title)) {
            return null;
        }
        boolean first = true;
        for (ArticleDocument.Block block : document.blocks()) {
            switch (block.type) {
                case RICH_TEXT:
                    String safe = sanitize(block.html);
                    if (safe == null) {
                        return null;
                    }
                    body.append(safe);
                    break;
                case IMAGE:
                    if (!appendImage(body, block, document.title)) {
                        return null;
                    }
                    break;
                case VIDEO:
                    if (block.videoUrl == null) {
                        return null;
                    }
                    ArticleDocument.Block hero = first ? document.heroImage : null;
                    String poster = hero != null ? hero.imageUrl : block.imageUrl;
                    body.append("<figure><video controls playsinline preload=\"none\"")
                            .append(" aria-label=\"").append(escapeAttribute(
                                    block.title == null || block.title.isEmpty() ? document.title : block.title)).append("\"");
                    if (poster != null) {
                        body.append(" poster=\"").append(escapeAttribute(poster)).append("\"");
                    }
                    body.append("><source src=\"").append(escapeAttribute(block.videoUrl))
                            .append("\" type=\"video/mp4\">Je browser ondersteunt deze video niet.</video>");
                    if (hero != null && hero.caption != null) {
                        body.append("<figcaption>").append(escapeText(hero.caption)).append("</figcaption>");
                    }
                    body.append("</figure>");
                    break;
                case RELATED:
                    if (block.related.isEmpty()) {
                        return null;
                    }
                    List<String> links = new ArrayList<String>();
                    for (ArticleDocument.Related item : block.related) {
                        if (!isHttp(item.url)) {
                            return null;
                        }
                        links.add("<li><a href=\"" + escapeAttribute(item.url) + "\">"
                                + escapeText(item.title) + "</a></li>");
                    }
                    body.append("<section class=\"related\"><h2>")
                            .append(escapeText(block.title == null ? "Gerelateerd" : block.title))
                            .append("</h2><ul>").append(join(links)).append("</ul></section>");
                    break;
                default:
                    return null;
            }
            first = false;
        }
        return "<!DOCTYPE html><html><head><meta charset=\"utf-8\">"
                + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
                // No application scripts, no native bridge, no form/frame/connect access;
                // Only inline styles, validated images and the reviewed public media origin load.
                + "<meta http-equiv=\"Content-Security-Policy\" content=\"default-src 'none'; "
                + "img-src https:; style-src 'unsafe-inline'; form-action 'none'; base-uri 'none'; "
                + "media-src https://objectstore.true.nl; "
                + "frame-src 'none'; script-src 'none'\">"
                + "<title>" + escapeText(document.title) + "</title>"
                + "<style>" + (dark ? styles(true) : styles(false)) + "</style></head>"
                + "<body><article>"
                + "<h1>" + escapeText(document.title) + "</h1>"
                + body
                + "<p class=\"original\"><a href=\"" + escapeAttribute(document.canonicalUrl)
                + "\">Open het origineel op bright.nl</a></p>"
                + "</article></body></html>";
    }

    private static boolean appendImage(StringBuilder body, ArticleDocument.Block image, String title) {
        if (image.type != ArticleDocument.BlockType.IMAGE || image.imageUrl == null) {
            return false;
        }
        String alt = image.imageAlt != null ? image.imageAlt : image.caption != null ? image.caption : title;
        body.append("<figure><img src=\"").append(escapeAttribute(image.imageUrl))
                .append("\" alt=\"").append(escapeAttribute(alt)).append("\">");
        if (image.caption != null) {
            body.append("<figcaption>").append(escapeText(image.caption)).append("</figcaption>");
        }
        body.append("</figure>");
        return true;
    }

    private static String styles(boolean dark) {
        String background = dark ? "#111318" : "#ffffff";
        String color = dark ? "#e6e8ec" : "#14161a";
        String muted = dark ? "#9aa3ad" : "#5d666f";
        String rule = dark ? "#2b2f36" : "#e4e7ea";
        return "body{margin:0;background:" + background + ";color:" + color
                + ";font-family:Georgia,'Times New Roman',serif;line-height:1.65}"
                + "article{max-width:34rem;margin:0 auto;padding:1.25rem .9rem 3rem}"
                + "h1{font-size:1.65rem;line-height:1.25;margin:.4rem 0 1.2rem}"
                + "h2,h3,h4{font-size:1.15rem;margin:1.6rem 0 .5rem}"
                + "p{margin:0 0 1rem}"
                + "figure{margin:1.4rem 0}"
                + "img{max-width:100%;height:auto;display:block}"
                + "video{width:100%;height:auto;display:block;background:#000}"
                + "figcaption{font-size:.82rem;color:" + muted + ";margin-top:.35rem}"
                + "blockquote{margin:1.2rem 0;padding:.1rem 0 .1rem 1rem;border-left:3px solid " + rule + "}"
                + ".related{margin-top:2.2rem;border-top:1px solid " + rule + ";padding-top:1rem}"
                + ".related h2{font-size:1rem}"
                + ".related ul{padding-left:1.1rem}"
                + ".related li{margin:.35rem 0;font-size:.95rem}"
                + "a{color:inherit;text-decoration:underline}"
                + ".original{margin-top:2.4rem;font-size:.85rem}";
    }

    /**
     * Allowlist sanitizer: keeps whitelisted tags, strips every attribute
     * except http(s) href on anchors, drops script/style/iframe/event
     * handlers entirely, and escapes everything else as text.
     */
    static String sanitize(String html) {
        if (html == null) {
            return null;
        }
        StringBuilder out = new StringBuilder(html.length());
        int i = 0;
        while (i < html.length()) {
            char c = html.charAt(i);
            if (c != '<') {
                out.append(escapeText(String.valueOf(c)));
                i++;
                continue;
            }
            int close = html.indexOf('>', i);
            if (close < 0) {
                out.append(escapeText(html.substring(i)));
                break;
            }
            String tag = html.substring(i, close + 1);
            String handled = handleTag(tag);
            if (handled == null) {
                return null;
            }
            out.append(handled);
            i = close + 1;
        }
        return out.toString();
    }

    /** Returns safe html for one tag, "" to drop it, or null to reject the article. */
    private static String handleTag(String tag) {
        boolean closing = tag.startsWith("</");
        String name = tag.substring(closing ? 2 : 1).trim().toLowerCase();
        int cut = name.indexOf(' ');
        if (cut >= 0) {
            name = name.substring(0, cut);
        }
        // Strip stray punctuation like "</p >" or "<br/>".
        while (name.length() > 0 && !Character.isLetterOrDigit(name.charAt(name.length() - 1))) {
            name = name.substring(0, name.length() - 1);
        }
        if (name.equals("script") || name.equals("style") || name.equals("iframe")
                || name.equals("form") || name.equals("object") || name.equals("embed")
                || name.equals("link") || name.equals("meta") || name.equals("base")) {
            // Never execute; the whole tag is dropped, not escaped.
            return "";
        }
        if (!ALLOWED_TAGS.contains(name)) {
            // Unknown but harmless formatting: keep the text, drop the tag.
            return "";
        }
        if (closing) {
            return "</" + name + ">";
        }
        if (name.equals("br")) {
            return "<br>";
        }
        if (name.equals("a")) {
            String href = attribute(tag, "href");
            if (href != null && isHttp(href)) {
                return "<a href=\"" + escapeAttribute(href) + "\">";
            }
            return "<a>";
        }
        return "<" + name + ">";
    }

    private static String attribute(String tag, String name) {
        int at = tag.toLowerCase().indexOf(name + "=");
        if (at < 0) {
            return null;
        }
        int value = at + name.length() + 1;
        char quote = tag.charAt(value);
        if (quote != '"' && quote != '\'') {
            return null;
        }
        int end = tag.indexOf(quote, value + 1);
        if (end < 0) {
            return null;
        }
        return tag.substring(value + 1, end);
    }

    private static boolean isHttp(String url) {
        return url != null && (url.startsWith("https://"));
    }

    private static String join(List<String> parts) {
        StringBuilder out = new StringBuilder();
        for (String part : parts) {
            out.append(part);
        }
        return out.toString();
    }

    static String escapeText(String text) {
        return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }

    static String escapeAttribute(String value) {
        return escapeText(value).replace("\"", "&quot;");
    }
}
