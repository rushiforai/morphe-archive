package nl.johninnl.medium.reader;

import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import nl.johninnl.medium.vendor.jsoup.Jsoup;
import nl.johninnl.medium.vendor.jsoup.nodes.Document;
import nl.johninnl.medium.vendor.jsoup.nodes.Element;
import nl.johninnl.medium.vendor.jsoup.nodes.Node;
import nl.johninnl.medium.vendor.jsoup.nodes.TextNode;
import nl.johninnl.medium.privacy.WebPrivacyRules;

public final class ArticleParser {
    private static final Pattern POST_ID = Pattern.compile("(?:^|[-/])([a-f0-9]{12})$");
    private static final Pattern IMAGE_ID = Pattern.compile("(?:^|/)([01]\\*[^/]+)$");
    private ArticleParser() {}

    public static ArticleBody parse(String html, String expectedId, URI origin) throws ArticleException {
        if (html == null || html.length() > 8 * 1024 * 1024) {
            throw new ArticleException("RESPONSE_LIMIT", "Article response is absent or too large");
        }
        if (expectedId == null || !expectedId.matches("[a-f0-9]{12}")) {
            throw new ArticleException("IDENTITY", "Invalid requested article identity");
        }
        Document doc = Jsoup.parse(html, origin.toString());
        List<Element> roots = doc.select(".prose");
        if (roots.isEmpty()) throw new ArticleException("MISSING_BODY", "No article body was received");
        if (roots.size() != 1) throw new ArticleException("AMBIGUOUS_BODY", "Multiple article bodies were received");

        String metadata = articleMetadata(doc);
        String canonical = null;
        Element canonicalElement = doc.selectFirst("link[rel=canonical]");
        if (canonicalElement != null) canonical = canonicalElement.attr("href");
        String metadataUrl = stringProperty(metadata, "url");
        if (metadataUrl != null) canonical = metadataUrl;
        URI canonicalUri = safeUri(canonical, origin);
        if (canonicalUri == null || !expectedId.equals(postId(canonicalUri))) {
            throw new ArticleException("IDENTITY", "Received article identity does not match the request");
        }
        List<String> notices = new ArrayList<>();
        normalizeEmbeddedContent(roots.get(0), origin, notices);

        Element titleElement = doc.selectFirst("article h1");
        String title = titleElement == null ? stringProperty(metadata, "title") : titleElement.text();
        List<ArticleBody.Block> blocks = new ArrayList<>();
        for (Node node : roots.get(0).childNodes()) collect(node, origin, blocks);
        if (blocks.isEmpty()) throw new ArticleException("MISSING_BODY", "Article body has no readable content");
        return new ArticleBody(expectedId, title == null ? "" : title, canonicalUri,
                stringProperty(metadata, "updatedAt"), blocks, notices);
    }

    /** Preserve article text without executing embedded documents or loading their tracking scripts. */
    private static void normalizeEmbeddedContent(Element root, URI origin, List<String> notices) throws ArticleException {
        for (int count = 0; ; count++) {
            Element embedded = root.selectFirst("iframe,video,audio,embed,object,table");
            if (embedded == null) return;
            if (count >= 256) throw new ArticleException("RESPONSE_LIMIT", "Too many embedded blocks");
            Element replacement = new Element("div");
            if (embedded.normalName().equals("table")) {
                StringBuilder table = new StringBuilder();
                for (Element row : embedded.select("tr")) {
                    if (row.closest("table") != embedded) continue;
                    List<String> cells = new ArrayList<>();
                    for (Element cell : row.children()) if (cell.normalName().matches("td|th")) {
                        StringBuilder value = new StringBuilder(cell.text());
                        for (Element link : cell.select("a[href]")) {
                            URI href = safeUri(link.attr("href"), origin);
                            if (href != null && !value.toString().contains(href.toString())) value.append(" (").append(href).append(')');
                        }
                        cells.add(value.toString());
                    }
                    if (!cells.isEmpty()) { if (table.length() > 0) table.append('\n'); table.append(String.join(" | ", cells)); }
                }
                if (table.length() > 0) replacement.appendChild(new Element("pre").text(table.toString()));
                for (Element image : embedded.select("img")) replacement.appendChild(image.clone());
            } else {
                String inline = embedded.attr("srcdoc");
                if (!inline.isEmpty()) {
                    Element body = Jsoup.parse(inline, origin.toString()).body();
                    body.select("script,style,nav,form,button").remove();
                    if (!body.text().isEmpty() || body.selectFirst("img,pre,iframe,video,audio,embed,object,table,a[href]") != null)
                        for (Node child : body.childNodes()) replacement.appendChild(child.clone());
                }
                if (replacement.childNodeSize() == 0) {
                    String source = embedded.hasAttr("data") ? embedded.attr("data") : embedded.attr("src");
                    if (source.isEmpty()) { Element child = embedded.selectFirst("source[src]"); if (child != null) source = child.attr("src"); }
                    URI href = safeUri(source, origin);
                    if (source.isEmpty()) href = null;
                    URI poster = embedded.hasAttr("poster") ? safeUri(embedded.attr("poster"), origin) : null;
                    if (href != null && "cdn.embedly.com".equalsIgnoreCase(href.getHost())) {
                        URI media = queryUrl(href, "url", origin);
                        if (media == null) media = queryUrl(href, "src", origin);
                        if (poster == null) poster = queryUrl(href, "image", origin);
                        if (media != null) href = media;
                    }
                    Element paragraph = new Element("p");
                    if (href == null) paragraph.text("Embedded content is unavailable.");
                    else paragraph.appendChild(new Element("a").attr("href", href.toString()).text("Open embedded content"));
                    replacement.appendChild(paragraph);
                    if (poster != null && "https".equalsIgnoreCase(poster.getScheme())) replacement.appendChild(new Element("img").attr("src", poster.toString()));
                    String notice = href == null ? "UNAVAILABLE_EMBED" : "EXTERNAL_EMBED";
                    if (!notices.contains(notice)) notices.add(notice);
                }
            }
            embedded.replaceWith(replacement);
        }
    }
    private static URI queryUrl(URI uri, String name, URI origin) {
        if (uri.getRawQuery() == null) return null;
        for (String pair : uri.getRawQuery().split("&")) {
            String[] part = pair.split("=", 2);
            if (part.length == 2 && part[0].equals(name)) try {
                return safeUri(java.net.URLDecoder.decode(part[1], "UTF-8"), origin);
            } catch (IllegalArgumentException | java.io.UnsupportedEncodingException invalid) { return null; }
        }
        return null;
    }

    private static void collect(Node node, URI origin, List<ArticleBody.Block> blocks) throws ArticleException {
        if (blocks.size() >= 12000) throw new ArticleException("RESPONSE_LIMIT", "Article has too many blocks");
        if (node instanceof TextNode) {
            if (!((TextNode) node).isBlank()) textBlock(node, "P", origin, blocks);
            return;
        }
        if (!(node instanceof Element)) return;
        Element element = (Element) node;
        String tag = element.normalName();
        if (discard(tag)) return;
        if (themeDuplicate(element)) return;
        switch (tag) {
            case "pre":
                Element code = element.selectFirst("code");
                String language = null;
                if (code != null) for (String cls : code.classNames()) {
                    if (cls.startsWith("language-")) language = cls.substring(9);
                }
                blocks.add(new ArticleBody.Block("PRE", element.wholeText(), Collections.emptyList(), null, language));
                return;
            case "picture":
                Element image = element.selectFirst("img");
                if (image == null) throw new ArticleException("BAD_IMAGE", "Image container has no image");
                imageBlock(image, origin, blocks);
                return;
            case "img": imageBlock(element, origin, blocks); return;
            case "hr": blocks.add(new ArticleBody.Block("HR", "", Collections.emptyList(), null, null)); return;
            case "h1": case "h2": case "h3": case "h4":
                textBlock(element, tag.toUpperCase(Locale.ROOT), origin, blocks); return;
            case "h5": case "h6": textBlock(element, "H4", origin, blocks); return;
            case "p":
                if (element.selectFirst("img") != null) new ImageSplit(origin, blocks).read(element);
                else textBlock(element, "P", origin, blocks);
                return;
            case "li":
                Element copy = element.clone();
                copy.select("ul,ol").remove();
                textBlock(copy, element.parent() != null && element.parent().normalName().equals("ol") ? "OLI" : "ULI", origin, blocks);
                for (Element child : element.children()) if (child.normalName().matches("ul|ol")) collect(child, origin, blocks);
                return;
            case "blockquote":
                if (element.select("p").isEmpty()) textBlock(element, "BQ", origin, blocks);
                else for (Element paragraph : element.children()) textBlock(paragraph, "BQ", origin, blocks);
                return;
            case "iframe": case "video": case "audio": case "embed": case "object": case "table":
                throw new ArticleException("UNSUPPORTED_CONTENT", "Article contains an essential unsupported block: " + tag);
            default:
                for (Node child : element.childNodes()) collect(child, origin, blocks);
        }
    }

    private static boolean discard(String tag) {
        return tag.matches("script|style|button|svg|noscript|form|input|select|textarea|source|nav");
    }

    private static boolean themeDuplicate(Element element) throws ArticleException {
        Element dark = element.selectFirst("pre.github-dark");
        if (dark == null || element.parent() == null || !element.hasClass("dark:block")) return false;
        for (Element sibling : element.siblingElements()) {
            Element light = sibling.selectFirst("pre.github-light");
            if (light == null || !sibling.hasClass("dark:hidden")) continue;
            if (!light.wholeText().equals(dark.wholeText())) {
                throw new ArticleException("INCOMPLETE_RESPONSE", "Article code variants disagree");
            }
            return true;
        }
        return false;
    }

    private static void imageBlock(Element image, URI origin, List<ArticleBody.Block> blocks) throws ArticleException {
        URI url = safeUri(image.attr("src"), origin);
        if (url != null && WebPrivacyRules.blocked(url.toString())) return;
        if (url == null || !url.getScheme().equalsIgnoreCase("https")) {
            throw new ArticleException("BAD_IMAGE", "Article image has an invalid source");
        }
        Matcher match = IMAGE_ID.matcher(url.getPath());
        String id = match.find() ? match.group(1) : null;
        Text content = new Text(origin);
        content.append(Jsoup.parseBodyFragment(image.attr("data-caption")).body());
        String caption = content.value();
        ArticleBody.Image data = new ArticleBody.Image(id, url, image.attr("alt"),
                dimension(image.attr("width")), dimension(image.attr("height")));
        blocks.add(new ArticleBody.Block("IMG", caption, content.markups, data, null));
    }

    private static int dimension(String value) {
        try { int dimension = Integer.parseInt(value); return dimension > 0 && dimension < 100000 ? dimension : 0; }
        catch (NumberFormatException ignored) { return 0; }
    }

    private static void textBlock(Node node, String type, URI origin, List<ArticleBody.Block> blocks) {
        Text text = new Text(origin);
        text.append(node);
        String value = text.value();
        if (!value.isEmpty()) blocks.add(new ArticleBody.Block(type, value, text.markups, null, null));
    }

    /** Split inline images while carrying the surrounding formatting into each text run. */
    private static final class ImageSplit {
        final URI origin;
        final List<ArticleBody.Block> blocks;
        final List<Element> ancestors = new ArrayList<>();
        final List<Element> targets = new ArrayList<>();
        Element run;
        ImageSplit(URI origin, List<ArticleBody.Block> blocks) { this.origin = origin; this.blocks = blocks; reset(); }
        void reset() {
            run = new Element("p");
            targets.clear();
            targets.add(run);
            for (Element ancestor : ancestors) {
                Element copy = ancestor.clone().empty();
                targets.get(targets.size() - 1).appendChild(copy);
                targets.add(copy);
            }
        }
        void flush() { textBlock(run, "P", origin, blocks); reset(); }
        void read(Element paragraph) throws ArticleException {
            for (Node node : paragraph.childNodes()) node(node);
            flush();
        }
        void node(Node node) throws ArticleException {
            if (!(node instanceof Element)) {
                targets.get(targets.size() - 1).appendChild(node.clone());
                return;
            }
            Element element = (Element) node;
            if (discard(element.normalName())) return;
            if (element.normalName().matches("img|picture")) {
                flush();
                Element image = element.normalName().equals("img") ? element : element.selectFirst("img");
                if (image == null) throw new ArticleException("BAD_IMAGE", "Image container has no image");
                imageBlock(image, origin, blocks);
                return;
            }
            Element copy = element.clone().empty();
            targets.get(targets.size() - 1).appendChild(copy);
            ancestors.add(element);
            targets.add(copy);
            for (Node child : element.childNodes()) node(child);
            ancestors.remove(ancestors.size() - 1);
            targets.remove(targets.size() - 1);
        }
    }

    private static final class Text {
        final StringBuilder builder = new StringBuilder();
        final List<ArticleBody.Markup> markups = new ArrayList<>();
        final URI origin;
        boolean pendingSpace;
        Text(URI origin) { this.origin = origin; }

        void flushSpace() {
            if (pendingSpace && builder.length() > 0 && builder.charAt(builder.length() - 1) != '\n') builder.append(' ');
            pendingSpace = false;
        }
        void append(Node node) {
            if (node instanceof TextNode) {
                String text = ((TextNode) node).getWholeText();
                for (int i = 0; i < text.length(); i++) {
                    char c = text.charAt(i);
                    if (Character.isWhitespace(c) || c == '\u00a0') pendingSpace = true;
                    else { flushSpace(); builder.append(c); }
                }
                return;
            }
            if (!(node instanceof Element)) return;
            Element element = (Element) node;
            String tag = element.normalName();
            if (discard(tag) || tag.equals("img")) return;
            if (tag.equals("br")) { pendingSpace = false; builder.append('\n'); return; }
            flushSpace();
            int start = builder.length();
            if (tag.equals("code")) builder.append(element.wholeText());
            else for (Node child : element.childNodes()) append(child);
            int end = builder.length();
            String type = null;
            String href = null;
            if (tag.matches("b|strong")) type = "STRONG";
            else if (tag.matches("i|em")) type = "EM";
            else if (tag.equals("code")) type = "CODE";
            else if (tag.equals("a")) {
                URI link = safeUri(element.attr("href"), origin);
                if (link != null) { type = "A"; href = link.toString(); }
            }
            if (type != null && end > start) markups.add(new ArticleBody.Markup(type, start, end, href));
        }
        String value() {
            int length = builder.length();
            while (length > 0 && Character.isWhitespace(builder.charAt(length - 1))) length--;
            builder.setLength(length);
            for (int i = markups.size() - 1; i >= 0; i--) {
                ArticleBody.Markup markup = markups.get(i);
                int end = Math.min(markup.end, length);
                if (markup.start >= end) markups.remove(i);
                else if (end != markup.end) markups.set(i, new ArticleBody.Markup(markup.type, markup.start, end, markup.href));
            }
            return builder.toString();
        }
    }

    private static URI safeUri(String value, URI origin) {
        if (value == null || value.trim().isEmpty()) return null;
        try {
            URI uri = origin.resolve(value.trim()).normalize();
            String scheme = uri.getScheme();
            if (scheme == null || !(scheme.equalsIgnoreCase("https") || scheme.equalsIgnoreCase("http"))) return null;
            if (uri.getHost() == null || uri.getUserInfo() != null) return null;
            return uri;
        } catch (IllegalArgumentException ignored) { return null; }
    }

    private static String postId(URI uri) {
        Matcher match = POST_ID.matcher(uri.getPath());
        return match.find() ? match.group(1) : null;
    }

    /** Read a data object from script text, without evaluating any JavaScript. */
    private static String articleMetadata(Document doc) {
        for (Element script : doc.select("script")) {
            String source = script.data();
            for (int i = 0; i < source.length(); i++) {
                char c = source.charAt(i);
                if (c == '/' && i + 1 < source.length()) {
                    if (source.charAt(i + 1) == '/') {
                        int end = source.indexOf('\n', i + 2);
                        i = end < 0 ? source.length() : end;
                        continue;
                    }
                    if (source.charAt(i + 1) == '*') {
                        int end = source.indexOf("*/", i + 2);
                        i = end < 0 ? source.length() : end + 1;
                        continue;
                    }
                }
                if (c == '"' || c == '\'' || c == '`') { i = stringEnd(source, i); continue; }
                if (!source.startsWith("article", i) || (i > 0 && Character.isJavaIdentifierPart(source.charAt(i - 1)))) continue;
                int cursor = i + 7;
                while (cursor < source.length() && Character.isWhitespace(source.charAt(cursor))) cursor++;
                if (cursor >= source.length() || source.charAt(cursor++) != ':') continue;
                while (cursor < source.length() && Character.isWhitespace(source.charAt(cursor))) cursor++;
                if (cursor >= source.length() || source.charAt(cursor) != '{') continue;
                int start = cursor;
                int depth = 0;
                for (; cursor < source.length(); cursor++) {
                    char token = source.charAt(cursor);
                    if (token == '"' || token == '\'' || token == '`') { cursor = stringEnd(source, cursor); continue; }
                    if (token == '{') depth++;
                    if (token == '}') {
                        depth--;
                        if (depth == 0) return source.substring(start, cursor + 1);
                    }
                }
            }
        }
        return "";
    }

    private static int stringEnd(String source, int start) {
        char quote = source.charAt(start);
        for (int i = start + 1; i < source.length(); i++) {
            if (source.charAt(i) == '\\') { i++; continue; }
            if (source.charAt(i) == quote) return i;
        }
        return source.length() - 1;
    }

    private static String stringProperty(String object, String name) {
        Pattern property = Pattern.compile("(?:^|[{,\\s])" + Pattern.quote(name) + "\\s*:\\s*\"((?:[^\"\\\\]|\\\\.)*)\"");
        Matcher match = property.matcher(object);
        if (!match.find()) return null;
        String raw = match.group(1);
        StringBuilder decoded = new StringBuilder();
        for (int i = 0; i < raw.length(); i++) {
            char c = raw.charAt(i);
            if (c != '\\' || i + 1 >= raw.length()) { decoded.append(c); continue; }
            char escaped = raw.charAt(++i);
            switch (escaped) {
                case 'n': decoded.append('\n'); break;
                case 'r': decoded.append('\r'); break;
                case 't': decoded.append('\t'); break;
                case 'u':
                    if (i + 4 >= raw.length()) return null;
                    try { decoded.append((char) Integer.parseInt(raw.substring(i + 1, i + 5), 16)); }
                    catch (NumberFormatException invalid) { return null; }
                    i += 4; break;
                default: decoded.append(escaped);
            }
        }
        return decoded.toString();
    }
}
