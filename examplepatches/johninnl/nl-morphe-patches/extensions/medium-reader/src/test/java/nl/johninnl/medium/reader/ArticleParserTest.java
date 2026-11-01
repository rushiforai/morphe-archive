package nl.johninnl.medium.reader;

import org.junit.Test;
import java.net.URI;
import static org.junit.Assert.*;

public class ArticleParserTest {
    private static final String ID = "dc7f60d860e4";
    private static final URI ORIGIN = URI.create("https://freedium-mirror.cfd/");

    private String page(String body) {
        return "<html><head><link rel='canonical' href='https://medium.com/p/" + ID +
                "'></head><body><nav>Site navigation</nav><article><header><h1>Example title</h1>" +
                "<p>Author controls</p></header><div class='prose max-w-none'>" + body +
                "</div><footer>Site donation</footer></article></body></html>";
    }

    private ArticleBody parse(String html) {
        try { return ArticleParser.parse(html, ID, ORIGIN); }
        catch (ArticleException e) { throw new AssertionError("Expected readable article: " + e.code, e); }
    }

    @Test public void extractsOnlyEditorialBlocks() {
        ArticleBody body = parse(page("<p>First paragraph.</p><h3>A heading</h3><p>Last paragraph.</p>"));
        assertEquals(ID, body.postId);
        assertEquals("Example title", body.title);
        assertEquals(3, body.blocks.size());
        assertEquals("First paragraph.", body.blocks.get(0).text);
        assertEquals("H3", body.blocks.get(1).type);
        assertEquals("Last paragraph.", body.blocks.get(2).text);
    }

    @Test public void rejectsWrongArticleEvenWithReadableBody() throws Exception {
        try {
            ArticleParser.parse(page("<p>Readable.</p>").replace(ID, "bf716433d4a6"), ID, ORIGIN);
            fail("Wrong article accepted");
        } catch (ArticleException e) { assertEquals("IDENTITY", e.code); }
    }

    @Test public void rejectsApplicationErrorInsideSuccessfulHttpDocument() throws Exception {
        try {
            ArticleParser.parse("<html><body>Article not found<script>error:{status:404,code:\"ARTICLE_NOT_FOUND\"}</script></body></html>", ID, ORIGIN);
            fail("An error page was accepted as an article");
        } catch (ArticleException e) { assertEquals("MISSING_BODY", e.code); }
    }

    @Test public void doesNotGuessWhenTwoBodyRootsExist() throws Exception {
        try {
            ArticleParser.parse(page("<p>First</p>") + "<div class='prose'><p>Other</p></div>", ID, ORIGIN);
            fail("Ambiguous article accepted");
        } catch (ArticleException e) { assertEquals("AMBIGUOUS_BODY", e.code); }
    }

    @Test public void preservesUtf16MarkupRangesAfterWhitespaceNormalization() {
        ArticleBody.Block block = parse(page("<p>😀 <strong>bold <em>text</em></strong> <a href='https://example.org/x'>link</a></p>")).blocks.get(0);
        assertEquals("😀 bold text link", block.text);
        assertTrue(block.markups.stream().anyMatch(m -> m.type.equals("STRONG") && m.start == 3 && m.end == 12));
        assertTrue(block.markups.stream().anyMatch(m -> m.type.equals("EM") && m.start == 8 && m.end == 12));
        assertTrue(block.markups.stream().anyMatch(m -> m.type.equals("A") && m.start == 13 && m.end == 17 && m.href.equals("https://example.org/x")));
    }

    @Test public void removesThemeDuplicateAndControlsButKeepsRepeatedAuthorCode() {
        String pair = "<div class='relative'><button data-code='x'>Copy</button><div class='dark:hidden'><pre class='shiki github-light'><code>x\n y</code></pre></div>" +
                "<div class='hidden dark:block'><pre class='shiki github-dark'><code>x\n y</code></pre></div></div>";
        ArticleBody body = parse(page(pair + "<pre><code>x\n y</code></pre>"));
        assertEquals(2, body.blocks.size());
        assertEquals("PRE", body.blocks.get(0).type);
        assertEquals("x\n y", body.blocks.get(0).text);
        assertEquals("x\n y", body.blocks.get(1).text);
    }

    @Test public void carriesImageIdDimensionsAndFormattedCaption() {
        ArticleBody.Block block = parse(page("<picture><source srcset='/img/medium/2000/1*test@2x.png'><img src='/img/medium/700/1*test@2x.png' width='1200' height='800' alt='Diagram' data-caption='A &lt;strong&gt;caption&lt;/strong&gt;'></picture>")).blocks.get(0);
        assertEquals("IMG", block.type);
        assertEquals("1*test@2x.png", block.image.id);
        assertEquals(1200, block.image.width);
        assertEquals(800, block.image.height);
        assertEquals("Diagram", block.image.alt);
        assertEquals("A caption", block.text);
        assertTrue(block.markups.stream().anyMatch(m -> m.type.equals("STRONG") && m.start == 2 && m.end == 9));
    }

    @Test public void dropsActiveElementsWithoutExecutingOrImportingTheirText() {
        ArticleBody body = parse(page("<p>Before<script>steal()</script><button>Click</button><svg><text>Icon</text></svg> after <a href='javascript:steal()'>link</a>.</p>"));
        assertEquals("Before after link.", body.blocks.get(0).text);
        assertFalse(body.blocks.get(0).markups.stream().anyMatch(m -> m.type.equals("A")));
    }

    @Test public void keepsArticleAndExplicitSourceLinkForExternalEmbed() throws Exception {
        ArticleBody body = ArticleParser.parse(page("<p>Introduction.</p><iframe src='https://third.example/embed'></iframe>"), ID, ORIGIN);
        assertEquals("Introduction.", body.blocks.get(0).text);
        assertEquals("Open embedded content", body.blocks.get(1).text);
        assertEquals("https://third.example/embed", body.blocks.get(1).markups.get(0).href);
        assertTrue(body.notices.contains("EXTERNAL_EMBED"));
    }

    @Test public void readsHydrationMetadataWithoutEvaluatingScript() throws Exception {
        String html = page("<p>Body.</p>").replace("<link rel='canonical' href='https://medium.com/p/" + ID + "'>", "") +
                "<script>throw new Error('must not execute'); const data={article:{title:\"Hydrated\",url:\"https:\\u002f\\u002fmedium.com/p/" + ID + "\",updatedAt:\"2026-10-01\"}};</script>";
        ArticleBody body = parse(html);
        assertEquals("2026-10-01", body.sourceUpdatedAt);
        assertEquals("https://medium.com/p/" + ID, body.canonicalUrl.toString());
    }

    @Test public void preservesAnImageInsideParagraphTextInsteadOfSilentlyDroppingIt() {
        ArticleBody body = parse(page("<p>Before <img src='/img/medium/700/1*image.png'> after.</p>"));
        assertEquals(3, body.blocks.size());
        assertEquals("Before", body.blocks.get(0).text);
        assertEquals("IMG", body.blocks.get(1).type);
        assertEquals("after.", body.blocks.get(2).text);
    }

    @Test public void ignoresMetadataExamplesInsideScriptComments() throws Exception {
        String html = "<article><div class='prose'><p>Body.</p></div></article><script>/* article:{title:\"Example\",url:\"https://medium.com/p/" + ID + "\"} */</script>";
        try { ArticleParser.parse(html, ID, ORIGIN); fail("A commented example was used as identity"); }
        catch (ArticleException e) { assertEquals("IDENTITY", e.code); }
    }

    @Test public void acceptsMetadataWithUrlAsFirstProperty() {
        String html = "<article><h1>Title</h1><div class='prose'><p>Body.</p></div></article><script>const data={article:{url:\"https://medium.com/p/" + ID + "\"}};</script>";
        assertEquals(ID, parse(html).postId);
    }

    @Test public void preservesFormattingOnBothSidesOfNestedInlineImages() {
        ArticleBody body = parse(page("<p><strong>Before <span><img src='/img/medium/700/1*image.png'></span> after</strong>.</p>"));
        assertEquals(3, body.blocks.size());
        assertEquals("Before", body.blocks.get(0).text);
        assertTrue(body.blocks.get(0).markups.stream().anyMatch(m -> m.type.equals("STRONG") && m.start == 0 && m.end == 6));
        assertEquals("after.", body.blocks.get(2).text);
        assertTrue(body.blocks.get(2).markups.stream().anyMatch(m -> m.type.equals("STRONG") && m.start == 0 && m.end == 5));
    }

    @Test public void retainsExternalEmbedLinkNestedInsideParagraph() throws Exception {
        ArticleBody body = ArticleParser.parse(page("<p>Intro <iframe src='https://third.example/embedded'></iframe></p>"), ID, ORIGIN);
        assertTrue(body.blocks.get(0).text.contains("Intro"));
        assertTrue(body.blocks.stream().flatMap(block -> block.markups.stream()).anyMatch(markup -> "https://third.example/embedded".equals(markup.href)));
    }

    @Test public void rendersTableRowsAndInlineEmbedCodeWithoutExecutingScripts() throws Exception {
        ArticleBody body = ArticleParser.parse(page("<table><tr><th>Name</th><th>Value</th></tr><tr><td>A</td><td>42</td></tr></table>" +
                "<iframe srcdoc='&lt;pre&gt;let x = 42;&lt;/pre&gt;&lt;script&gt;bad()&lt;/script&gt;'></iframe>"), ID, ORIGIN);
        assertEquals("Name | Value\nA | 42", body.blocks.get(0).text); assertEquals("PRE", body.blocks.get(0).type);
        assertEquals("let x = 42;", body.blocks.get(1).text); assertTrue(body.notices.isEmpty());
    }
}
