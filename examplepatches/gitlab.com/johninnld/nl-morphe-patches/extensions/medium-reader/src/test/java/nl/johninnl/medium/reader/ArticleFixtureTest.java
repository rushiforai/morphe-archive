package nl.johninnl.medium.reader;

import org.jsoup.Jsoup;
import org.junit.Assume;
import org.junit.Test;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import static org.junit.Assert.*;

/** Optional local captures are ignored by Git; authored unit fixtures always run. */
public class ArticleFixtureTest {
    private String fixture(String id) throws Exception {
        return capture("freedium-article-" + id + ".html");
    }
    private String capture(String name) throws Exception {
        Path root = Paths.get("").toAbsolutePath();
        while (root != null && !Files.isDirectory(root.resolve("analysis/evidence"))) root = root.getParent();
        Path path = root == null ? null : root.resolve("analysis/evidence/" + name);
        Assume.assumeTrue("Local live capture is not present", path != null && Files.isRegularFile(path));
        return new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
    }

    @Test public void parsesReportedAiRoadmapWithExplicitYoutubeLinksAndAllProse() throws Exception {
        String html = capture("device-failure-d21e5748a0aa.html");
        ArticleBody body = ArticleParser.parse(html, "d21e5748a0aa", URI.create("https://freedium-mirror.cfd/"));
        assertAllParagraphsPreserved(html, body);
        assertTrue(body.notices.contains("EXTERNAL_EMBED"));
        assertTrue(body.blocks.stream().flatMap(block -> block.markups.stream()).anyMatch(markup -> markup.href != null && markup.href.startsWith("https://www.youtube.com/")));
        assertFalse(body.blocks.stream().flatMap(block -> block.markups.stream()).anyMatch(markup -> markup.href != null && markup.href.contains("cdn.embedly.com")));
        System.out.println("AI roadmap: " + body.blocks.size() + " native blocks");
    }

    @Test public void parsesReportedHousingArticleWithAllProse() throws Exception {
        String html = capture("device-failure-567e3055efdd.html");
        ArticleBody body = ArticleParser.parse(html, "567e3055efdd", URI.create("https://freedium-mirror.cfd/"));
        assertAllParagraphsPreserved(html, body); assertTrue(body.notices.isEmpty());
        System.out.println("Housing article: " + body.blocks.size() + " native blocks");
    }
    private void assertAllParagraphsPreserved(String html, ArticleBody body) {
        String nativeText = body.blocks.stream().map(block -> block.text).collect(Collectors.joining(" ")).replaceAll("\\s+", " ").trim();
        org.jsoup.nodes.Document reference = Jsoup.parse(html);
        // Freedium's external-link SVG inserts a display-only boundary into Jsoup.text().
        reference.select("script,style,svg,button,nav").remove();
        for (org.jsoup.nodes.Element paragraph : reference.select(".prose p")) {
            String expected = paragraph.text().replaceAll("\\s+", " ").trim();
            if (!expected.isEmpty()) assertTrue("Missing original paragraph: " + expected, nativeText.contains(expected));
        }
    }

    @Test public void parsesCapturedProseWithoutCoverOrAuthorDuplication() throws Exception {
        ArticleBody body = ArticleParser.parse(fixture("dc7f60d860e4"), "dc7f60d860e4", URI.create("https://freedium-mirror.cfd/"));
        assertEquals(13, body.blocks.size());
        assertEquals(12, body.blocks.stream().filter(b -> b.type.equals("P")).count());
        assertEquals(1, body.blocks.stream().filter(b -> b.type.equals("IMG")).count());
        assertEquals("0*rsSUapdPszc2gRSJ.jpg", body.blocks.stream().filter(b -> b.image != null).findFirst().get().image.id);
    }

    @Test public void parsesAllCapturedImageAndHeadingBlocks() throws Exception {
        ArticleBody body = ArticleParser.parse(fixture("bf716433d4a6"), "bf716433d4a6", URI.create("https://freedium-mirror.cfd/"));
        assertEquals(49, body.blocks.size());
        assertEquals(17, body.blocks.stream().filter(b -> b.type.equals("IMG")).count());
        assertEquals(5, body.blocks.stream().filter(b -> b.type.equals("H3")).count());
        assertTrue(body.blocks.stream().filter(b -> b.image != null).allMatch(b -> b.image.id != null));
    }

    @Test public void preservesEachCapturedCodeSnippetOnceWithExactWhitespace() throws Exception {
        String html = fixture("8ad269371d15");
        ArticleBody body = ArticleParser.parse(html, "8ad269371d15", URI.create("https://freedium-mirror.cfd/"));
        assertEquals(132, body.blocks.size());
        List<String> snippets = body.blocks.stream().filter(b -> b.type.equals("PRE")).map(b -> b.text).collect(Collectors.toList());
        assertEquals(31, snippets.size());
        // Copy-button data is an independent source of the unhighlighted code bytes.
        assertEquals(Jsoup.parse(html).select(".prose button[data-code]").eachAttr("data-code"), snippets);
        assertEquals(17, body.blocks.stream().filter(b -> b.type.equals("IMG")).count());
    }
}
