package patches.bright;

import java.nio.charset.StandardCharsets;
import java.util.Collections;

/** Synthetic contracts: no publisher article text or signing material. */
public final class BrightReaderRegression {
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    public static void main(String[] args) throws Exception {
        if (args.length == 1 && args[0].equals("--consent-script")) {
            System.out.print(BrightConsentScript.SOURCE);
            return;
        }
        if (args.length == 1 && args[0].equals("--images")) {
            imagePayloads();
            return;
        }
        if (args.length == 1 && args[0].equals("--videos")) {
            videoPayloads();
            return;
        }
        String article = "https://www.bright.nl/plusplus/2151954/example-article.html";
        ArticleRef ref = WebPolicies.eligibleArticle(article);
        require(ref != null && ref.id == 2151954L, "canonical Bright article must match");
        for (String url : new String[]{
                "http://www.bright.nl/plusplus/2151954/example.html",
                "https://other.example/plusplus/2151954/example.html",
                "https://user@www.bright.nl/plusplus/2151954/example.html",
                "https://www.bright.nl:444/plusplus/2151954/example.html",
                article + "?preview=true", "https://www.bright.nl/account/login",
                "https://www.bright.nl/plusplus/not-an-id/example.html"}) {
            require(WebPolicies.eligibleArticle(url) == null, "ineligible route: " + url);
        }
        WebPolicies.RequestFacts request = new WebPolicies.RequestFacts(article, "GET", true);
        require(WebPolicies.classify(request) == WebPolicies.Decision.PASS_THROUGH, "unselected reader");
        BrightPolicy.articles = true;
        require(WebPolicies.classify(request) == WebPolicies.Decision.READER_ARTICLE, "selected reader");
        require(WebPolicies.classify(new WebPolicies.RequestFacts(article, "POST", true))
                == WebPolicies.Decision.PASS_THROUGH, "POST must pass through");
        require(WebPolicies.classify(new WebPolicies.RequestFacts(article, "GET", false))
                == WebPolicies.Decision.PASS_THROUGH, "subresources must pass through");

        String cmp = "https://a.delivery.consentmanager.net/delivery/cmp.php?cdid=98aecc97427db";
        WebPolicies.RequestFacts bootstrap = new WebPolicies.RequestFacts(cmp, "GET", false);
        require(!WebPolicies.suppressConsentBootstrap(article, bootstrap), "unselected web consent");
        BrightPolicy.consent = true;
        require(WebPolicies.suppressConsentBootstrap(article, bootstrap), "selected web consent bootstrap");
        require(WebPolicies.suppressConsentBootstrap(article, new WebPolicies.RequestFacts(
                "https://d.delivery.consentmanager.net/delivery/cmp.php?cdid=5bd4faf7d2edc", "GET", false)),
                "paid/ad-free Bright configuration and delivery fallback");
        require(WebPolicies.suppressConsentBootstrap(article + "?app=true", bootstrap), "hosted article with app query");
        require(!WebPolicies.suppressConsentBootstrap("https://www.bright.nl/account/login", bootstrap),
                "account pages retain consent flow");
        require(!WebPolicies.suppressConsentBootstrap("https://other.example/plusplus/2151954/example.html", bootstrap),
                "other publishers retain consent flow");
        require(!WebPolicies.suppressConsentBootstrap(null, bootstrap), "unknown document passes through");
        for (String url : new String[]{
                "https://a.delivery.consentmanager.net.evil.example/delivery/cmp.php",
                "https://a.delivery.consentmanager.net/delivery/info/",
                "https://a.delivery.consentmanager.net/delivery/cmp.php?cdid=another-publisher",
                cmp + "&cdid=98aecc97427db",
                "https://a.delivery.consentmanager.net:444/delivery/cmp.php",
                "https://user@a.delivery.consentmanager.net/delivery/cmp.php",
                "https://www.bright.nl/account/login"}) {
            require(!WebPolicies.suppressConsentBootstrap(article,
                    new WebPolicies.RequestFacts(url, "GET", false)), "unrelated web request: " + url);
        }
        require(!WebPolicies.suppressConsentBootstrap(article,
                new WebPolicies.RequestFacts(cmp, "GET", true)), "top-level navigation passes through");
        require(!WebPolicies.suppressConsentBootstrap(article,
                new WebPolicies.RequestFacts(cmp, "POST", false)), "POST passes through");

        android.webkit.WebView view = new android.webkit.WebView();
        long generation = NavigationState.advance(view, article);
        NavigationState.NavigationCancel cancel = new NavigationState.NavigationCancel(view, generation);
        require(!cancel.isCancelled(), "current article generation remains active");
        NavigationState.advance(view);
        require(cancel.isCancelled(), "navigation invalidates in-flight article work");
        require(article.equals(NavigationState.currentUrl(view)), "consumed navigation preserves document policy");
        require(WebPolicies.suppressConsentBootstrap(NavigationState.currentUrl(view), bootstrap),
                "delayed CMP remains suppressed after consumed navigation");
        NavigationState.advance(view, "https://www.bright.nl/account/login");
        require(!WebPolicies.suppressConsentBootstrap(NavigationState.currentUrl(view), bootstrap),
                "actual account document loses article-only suppression");
        require(NavigationState.currentUrl(new android.webkit.WebView()) == null, "WebView policies remain isolated");

        HmacArticleHeaderSigner signer = new HmacArticleHeaderSigner(
                () -> "synthetic-test-key".getBytes(StandardCharsets.UTF_8), () -> 1700000120L);
        require(signer.sign().equals("1700000000:7926d5e9ab167c37893fef5ea4b3a67245d135c355d744cd9b5af303494aed7e"),
                "HMAC format and backdated timestamp");
        require(new HmacArticleHeaderSigner(() -> null, () -> 1700000120L).sign() == null,
                "missing key must fail closed");

        ArticleDocument.Block block = new ArticleDocument.Block(ArticleDocument.BlockType.RICH_TEXT,
                "<p>Example <strong>text</strong><a href=\"javascript:alert(1)\">link</a></p>",
                null, null, null, null);
        String html = new ArticleRenderer().render(new ArticleDocument(ref.id, "A <title>", article,
                Collections.singletonList(block)), false);
        require(html.contains("script-src 'none'") && html.contains("A &lt;title&gt;"), "safe document");
        require(!html.contains("javascript:"), "unsafe link removed");
        require(new ArticleRenderer().render(new ArticleDocument(ref.id, "", article,
                Collections.emptyList()), false) == null, "empty article must defer");
        System.out.println("PASS: Bright route, selection, signing and reader document contracts");
    }

    private static ArticleResult parseImages(String metadata, String content) throws Exception {
        String json = "{\"newsID\":2151954,\"domainID\":300,\"newsTitle\":\"Synthetic title\","
                + "\"host\":\"https://www.bright.nl\",\"path\":\"/plusplus/2151954/example.html\","
                + metadata + "\"content\":[" + content + "]}";
        Class<?> parser = Class.forName("patches.bright.ArticleParser");
        return (ArticleResult) parser.getDeclaredMethod("parse", ArticleRef.class, byte[].class)
                .invoke(parser.getDeclaredConstructor().newInstance(),
                        WebPolicies.eligibleArticle("https://www.bright.nl/plusplus/2151954/example.html"),
                        json.getBytes(StandardCharsets.UTF_8));
    }

    private static void videoPayloads() throws Exception {
        String url = "https://objectstore.true.nl/digitalenterprises:bright/synthetic-public-video.mp4";
        String video = "{\"type\":\"mediaBlock\",\"vendor\":\"custom\",\"url\":\"" + url
                + "\",\"autoPlay\":true,\"showAsCarousel\":true,\"duration\":690,\"videofeedItemID\":123,"
                + "\"title\":\"Synthetic <video>\",\"thumbnail\":\"https://webp.vp.cdn.pxr.nl/previews/example.jpg?width={WebpWidth}\"}";
        String text = "{\"type\":\"richTextBlock\",\"text\":\"<p>After video</p>\"}";
        ArticleResult result = parseImages("\"image\":\"https://webp.br.cdn.pxr.nl/news/hero.jpg?width={WebpWidth}\","
                + "\"imageTitle\":\"Hero credit\",", video + "," + text);
        require(result.isFull(), "known public custom MP4 payload remains full");
        String html = new ArticleRenderer().render(result.document, false);
        require(html.contains("<video controls playsinline preload=\"none\""), "native video waits for user playback");
        require(html.contains("src=\"" + url + "\" type=\"video/mp4\""), "public media source preserved");
        require(html.contains("poster=\"https://webp.br.cdn.pxr.nl/news/hero.jpg?width=1200\""), "leading video uses hero poster");
        require(!html.contains("<img ") && html.contains("Hero credit"), "video-first hero is not duplicated and retains credit");
        require(html.indexOf("<video ") < html.indexOf("After video"), "video preserves editorial order");
        require(html.contains("media-src https://objectstore.true.nl;") && html.contains("script-src 'none'"), "media CSP remains scoped and script-free");
        require(!html.contains("autoplay") && !html.contains("jwplayer") && !html.contains("consented"), "no autoplay, vendor SDK or consent mutation");
        ArticleResult thumbnail = parseImages("", video);
        require(new ArticleRenderer().render(thumbnail.document, true).contains("poster=\"https://webp.vp.cdn.pxr.nl/previews/example.jpg?width=1200\""), "video thumbnail resolves publisher width");
        require(parseImages("", video.replace("\"thumbnail\":\"https://webp.vp.cdn.pxr.nl/previews/example.jpg?width={WebpWidth}\"", "\"thumbnail\":null")).isFull(), "missing optional thumbnail remains playable");
        for (String invalid : new String[]{
                url.replace("https:", "http:"), url.replace("objectstore.true.nl", "other.example"),
                url.replace("objectstore.true.nl", "objectstore.true.nl.evil.example"),
                url.replace("objectstore.true.nl", "user@objectstore.true.nl"),
                url.replace("objectstore.true.nl", "objectstore.true.nl:444"),
                url.replace("digitalenterprises:bright", "another-publisher"),
                url.replace(".mp4", ".m3u8"), url + "?token=unknown", url + "#fragment",
                url.replace("synthetic-public-video", "../video"), url.replace("synthetic-public-video", "%2e%2e/video")}) {
            require(!parseImages("", video.replace(url, invalid)).isFull(), "unsupported media URL defers: " + invalid);
        }
        require(!parseImages("", video.replace("\"custom\"", "\"jwplayer\"")).isFull(), "unknown media vendor defers");
        require(!parseImages("", video.replace("\"type\":\"mediaBlock\"", "\"drm\":{},\"type\":\"mediaBlock\"")).isFull(), "DRM metadata defers");
        require(!parseImages("", video.replace("\"type\":\"mediaBlock\"", "\"tracks\":[{}],\"type\":\"mediaBlock\"")).isFull(), "unimplemented media tracks defer");
        require(!parseImages("", video.replace("\"title\":\"Synthetic <video>\"", "\"title\":{}")).isFull(), "malformed video metadata defers");
        System.out.println("PASS: Bright public MP4 parser, native controls, poster, order and fallback contracts");
    }

    private static void imagePayloads() throws Exception {
        // Real API field shapes and template grammar; synthetic editorial strings only.
        String text = "{\"type\":\"richTextBlock\",\"text\":\"<p>First paragraph</p>\"}";
        String image = "{\"type\":\"imageBlock\",\"url\":\"https://webp.vp.cdn.pxr.nl/news-content/example.png?width={WebpWidth}\","
                + "\"caption\":\"Inline caption\",\"credit\":\"Photographer\",\"alternativeText\":\"Chart description\","
                + "\"width\":1200,\"height\":850,\"layout\":\"default\"}";
        ArticleResult result = parseImages("\"image\":\"https://webp.br.cdn.pxr.nl/news/example.jpg?width={WebpWidth}\","
                + "\"imageTitle\":\"Hero credit <example>\",", text + "," + image);
        require(result.isFull(), "known image template payload remains full");
        String html = new ArticleRenderer().render(result.document, false);
        require(html.contains("example.png?width=1200") && !html.contains("{WebpWidth}"),
                "inline publisher width template resolves before rendering");
        require(html.contains("example.jpg?width=1200"), "root image metadata renders the hero");
        require(html.indexOf("example.jpg?width=1200") < html.indexOf("First paragraph")
                        && html.indexOf("First paragraph") < html.indexOf("example.png?width=1200"),
                "hero precedes ordered editorial blocks");
        require(html.contains("Hero credit &lt;example&gt;") && html.contains("Inline caption © Photographer"),
                "hero metadata and inline credit are preserved and escaped");
        require(html.contains("alt=\"Chart description\""), "inline alternative text is retained");
        require(result.document.blocks().size() == 2, "hero does not replace or reorder body blocks");
        ArticleResult chart = parseImages("", image.replace("Inline caption", "").replace("Photographer", ""));
        String chartHtml = new ArticleRenderer().render(chart.document, false);
        require(chartHtml.contains("alt=\"Chart description\"") && !chartHtml.contains("<figcaption>"),
                "captionless chart retains alternative text without fabricated credit");
        require(parseImages("", text).isFull(), "absent optional hero preserves text articles");
        require(parseImages("\"image\":null,", text).isFull(), "null optional hero preserves text articles");
        require(parseImages("\"image\":\"\",", text).isFull(), "empty optional hero preserves text articles");
        ArticleResult concrete = parseImages("\"image\":\"https://images.example/hero.jpg?width=900\",", text);
        require(concrete.isFull() && new ArticleRenderer().render(concrete.document, true)
                .contains("https://images.example/hero.jpg?width=900"), "concrete HTTPS source remains unchanged");
        for (String invalid : new String[]{
                "http://webp.br.cdn.pxr.nl/hero.jpg?width={WebpWidth}",
                "https://webp.br.cdn.pxr.nl/hero.jpg?width={UnknownWidth}",
                "https://webp.br.cdn.pxr.nl/{size}_hero.jpg",
                "https://images.example/hero.jpg?width={WebpWidth}",
                "https://webp.br.cdn.pxr.nl/{WebpWidth}/hero.jpg",
                "https://webp.br.cdn.pxr.nl/hero.jpg?source=?width={WebpWidth}",
                "https://webp.br.cdn.pxr.nl/hero.jpg?width={WebpWidth}&width={WebpWidth}",
                "https://webp.br.cdn.pxr.nl/hero.jpg?width=%7BWebpWidth%7D",
                "https://webp.br.cdn.pxr.nl/hero.jpg?width={WebpWidth}&other={unknown}",
                "https:///hero.jpg", "https://user@images.example/hero.jpg", "https://images.example/a b.jpg",
                "https://images.example:444/hero.jpg", "https://images.example/hero.jpg#fragment"}) {
            require(!parseImages("\"image\":\"" + invalid + "\",", text).isFull(),
                    "unknown or malformed hero must defer: " + invalid);
            require(!parseImages("", image.replace(
                    "https://webp.vp.cdn.pxr.nl/news-content/example.png?width={WebpWidth}", invalid)).isFull(),
                    "unknown or malformed inline source must defer: " + invalid);
        }
        require(!parseImages("\"image\":{},", text).isFull(), "unknown hero shape defers");
        require(!parseImages("\"image\":\"https://images.example/hero.jpg\",\"imageTitle\":{},", text).isFull(),
                "malformed hero metadata defers");
        require(!parseImages("", image.replace("\"Photographer\"", "{}")).isFull(),
                "malformed image credit defers");
        System.out.println("PASS: Bright article image template, hero, order and fallback contracts");
    }
}
