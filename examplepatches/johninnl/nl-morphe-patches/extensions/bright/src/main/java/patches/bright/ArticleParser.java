package patches.bright;

import org.json.JSONArray;
import org.json.JSONObject;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Structural validation of one article response: matched id, domain 300,
 * ordered content blocks and no remaining paywall. A 200 with a teaser or an
 * unknown editorial block is never FULL; the publisher experience defers.
 */
final class ArticleParser {

    private static final String TYPE_RICH = "richTextBlock";
    private static final String TYPE_IMAGE = "imageBlock";
    private static final String TYPE_MEDIA = "mediaBlock";
    private static final String TYPE_RELATED = "relatedBlock";
    private static final String TYPE_PAYWALL = "paywallBlock";

    ArticleResult parse(ArticleRef requested, byte[] body) {
        try {
            JSONObject root = new JSONObject(new String(body, StandardCharsets.UTF_8));
            if (!matched(root, requested)) {
                return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "id-mismatch");
            }
            if (!"300".equals(root.optString("domainID"))) {
                return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "domain");
            }
            JSONArray content = root.optJSONArray("content");
            if (content == null || content.length() == 0) {
                return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "empty");
            }
            List<ArticleDocument.Block> blocks = new ArrayList<ArticleDocument.Block>();
            boolean paywall = false;
            for (int i = 0; i < content.length(); i++) {
                JSONObject block = content.optJSONObject(i);
                if (block == null) {
                    return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "block-null");
                }
                String type = block.optString("type");
                if (TYPE_PAYWALL.equals(type)) {
                    paywall = true;
                    continue;
                }
                ArticleDocument.Block parsed = parseBlock(type, block);
                if (parsed == null) {
                    // Unknown editorial content defers the whole article.
                    return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "block-" + type);
                }
                blocks.add(parsed);
            }
            if (paywall || blocks.isEmpty()) {
                return ArticleResult.defer(ArticleResult.Outcome.DEFER_TO_PUBLISHER, "teaser");
            }
            String url = root.optString("host") + root.optString("path");
            ArticleDocument.Block hero = null;
            String heroSource = optionalString(root, "image");
            if (!heroSource.isEmpty()) {
                hero = image(heroSource, optionalString(root, "imageTitle"), "", "");
                if (hero == null) {
                    return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "hero-image");
                }
            }
            return ArticleResult.full(new ArticleDocument(requested.id,
                    root.optString("newsTitle"), url, blocks, hero));
        } catch (Exception malformed) {
            return ArticleResult.defer(ArticleResult.Outcome.UNSUPPORTED_CONTENT, "malformed");
        }
    }

    private static boolean matched(JSONObject root, ArticleRef requested) {
        String returned = root.optString("newsID");
        if (returned.isEmpty()) {
            return false;
        }
        try {
            return Long.parseLong(returned) == requested.id;
        } catch (NumberFormatException notNumeric) {
            return false;
        }
    }

    private static ArticleDocument.Block parseBlock(String type, JSONObject block) {
        if (TYPE_RICH.equals(type)) {
            String html = block.optString("text");
            if (html == null || html.length() == 0) {
                // An empty text block is a structural change, not content.
                return null;
            }
            return new ArticleDocument.Block(ArticleDocument.BlockType.RICH_TEXT, html, null, null, null, null);
        }
        if (TYPE_IMAGE.equals(type)) {
            return image(optionalString(block, "url"), optionalString(block, "caption"),
                    optionalString(block, "credit"), optionalString(block, "alternativeText"));
        }
        if (TYPE_MEDIA.equals(type)) {
            if (!"custom".equals(optionalString(block, "vendor"))) {
                return null;
            }
            // Do not silently discard a license, alternate source or editorial track.
            for (String field : new String[]{"drm", "drmConfig", "licenseUrl", "sources", "tracks"}) {
                if (block.has(field) && !block.isNull(field)) {
                    return null;
                }
            }
            String thumbnail = optionalString(block, "thumbnail");
            String poster = thumbnail.isEmpty() ? null : imageUrl(thumbnail);
            if (!thumbnail.isEmpty() && poster == null) {
                return null;
            }
            return ArticleDocument.Block.video(optionalString(block, "url"), poster,
                    optionalString(block, "title"));
        }
        if (TYPE_RELATED.equals(type)) {
            // The terminal block of every audited complete article; its links
            // keep the publisher route and open through the original client.
            JSONArray items = block.optJSONArray("items");
            if (items == null) {
                return null;
            }
            List<ArticleDocument.Related> related = new ArrayList<ArticleDocument.Related>();
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item == null) {
                    return null;
                }
                String url = httpsOrNull(item.optString("url"));
                if (url == null) {
                    return null;
                }
                related.add(new ArticleDocument.Related(url, item.optString("title")));
            }
            return new ArticleDocument.Block(ArticleDocument.BlockType.RELATED, null, null, null,
                    block.optString("title"), related);
        }
        return null;
    }

    private static ArticleDocument.Block image(String source, String caption, String credit, String alt) {
        String url = imageUrl(source);
        if (url == null) {
            return null;
        }
        if (caption.isEmpty()) {
            caption = credit;
        } else if (!credit.isEmpty()) {
            caption = caption + " \u00a9 " + credit;
        }
        return new ArticleDocument.Block(ArticleDocument.BlockType.IMAGE, null, url,
                caption.isEmpty() ? null : caption, null, null, alt.isEmpty() ? null : alt);
    }

    /** Resolve only the observed publisher width query; unknown templates defer. */
    private static String imageUrl(String source) {
        String token = "{WebpWidth}";
        boolean templated = source.contains(token);
        if (templated) {
            boolean widthQuery = false;
            int queryStart = source.indexOf('?');
            if (queryStart >= 0) {
                for (String parameter : source.substring(queryStart + 1).split("&")) {
                    if (parameter.equals("width=" + token)) {
                        widthQuery = true;
                    }
                }
            }
            if (!widthQuery || source.indexOf(token) != source.lastIndexOf(token)) {
                return null;
            }
        }
        String url = source.replace(token, "1200");
        String lower = url.toLowerCase(Locale.ROOT);
        if (lower.contains("%7b") || lower.contains("%7d")) {
            return null;
        }
        try {
            URI uri = new URI(url);
            if (!"https".equals(uri.getScheme()) || uri.getHost() == null
                    || uri.getRawUserInfo() != null || uri.getRawFragment() != null
                    || (uri.getPort() != -1 && uri.getPort() != 443)) {
                return null;
            }
            if (templated && !"webp.br.cdn.pxr.nl".equals(uri.getHost())
                    && !"webp.vp.cdn.pxr.nl".equals(uri.getHost())) {
                return null;
            }
            return url;
        } catch (Exception malformed) {
            return null;
        }
    }

    private static String optionalString(JSONObject object, String key) {
        Object value = object.opt(key);
        if (value == null || value == JSONObject.NULL) {
            return "";
        }
        if (!(value instanceof String)) {
            throw new IllegalArgumentException("Unexpected image metadata type");
        }
        return (String) value;
    }

    private static String httpsOrNull(String url) {
        if (url == null || !url.startsWith("https://")) {
            return null;
        }
        return url;
    }
}
