package app.revanced.extension.rif;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** JVM tests for the pure URL and text helpers in {@link InlineImages}. */
public class InlineImagesTest {

    // attempts(): http:// must be tried as https:// first. imgur answers plain http with a 301 to
    // https and HttpURLConnection never follows http -> https, so trying http first fails.
    @Test
    public void httpIsTriedAsHttpsFirst() {
        assertArrayEquals(
                new String[]{"https://i.imgur.com/a.json", "http://i.imgur.com/a.json"},
                InlineImages.attempts("http://i.imgur.com/a.json"));
    }

    @Test
    public void httpSchemeIsCaseInsensitive() {
        assertArrayEquals(
                new String[]{"https://example.com/x", "HTTP://example.com/x"},
                InlineImages.attempts("HTTP://example.com/x"));
    }

    @Test
    public void httpsIsTriedTwiceUnchanged() {
        assertArrayEquals(
                new String[]{"https://example.com/x", "https://example.com/x"},
                InlineImages.attempts("https://example.com/x"));
    }

    @Test
    public void directImageByExtensionIgnoringQueryAndFragment() {
        assertTrue(InlineImages.isDirectImage("https://example.com/a.JPG"));
        assertTrue(InlineImages.isDirectImage("https://example.com/a.png?width=100"));
        assertTrue(InlineImages.isDirectImage("https://example.com/a.webp#frag"));
        assertFalse(InlineImages.isDirectImage("https://example.com/a.html?x=a.png"));
        assertFalse(InlineImages.isDirectImage("https://example.com/page"));
        assertFalse(InlineImages.isDirectImage(null));
    }

    @Test
    public void redditImageHostsAreDirect() {
        assertTrue(InlineImages.isDirectImage("https://i.redd.it/abc123"));
        assertTrue(InlineImages.isDirectImage("https://preview.redd.it/abc123?x=1"));
        assertFalse(InlineImages.isDirectImage("https://v.redd.it/abc123"));
    }

    @Test
    public void giphyPageLinkGivesMediaUrl() {
        assertEquals("https://media.giphy.com/media/XyZ123/giphy.webp",
                InlineImages.giphyImageUrl("https://giphy.com/gifs/funny-cat-XyZ123?x=1"));
        assertEquals("https://media.giphy.com/media/XyZ123/giphy.webp",
                InlineImages.giphyImageUrl("https://giphy.com/gifs/XyZ123"));
    }

    @Test
    public void giphyMediaLinkGivesMediaUrl() {
        assertEquals("https://media.giphy.com/media/XyZ123/giphy.webp",
                InlineImages.giphyImageUrl("https://media2.giphy.com/media/XyZ123/giphy.gif"));
    }

    @Test
    public void nonGiphyOrBadIdIsNull() {
        assertNull(InlineImages.giphyImageUrl("https://example.com/gifs/abc"));
        assertNull(InlineImages.giphyImageUrl("https://giphy.com/gifs/"));
        assertNull(InlineImages.giphyImageUrl("https://giphy.com/gifs/bad_id!"));
    }

    @Test
    public void imgflipPagesAreResolvedButTemplatesAreNot() {
        assertTrue(InlineImages.isResolvableHost("https://imgflip.com/i/7ope63"));
        assertTrue(InlineImages.isResolvableHost("https://www.imgflip.com/i/7ope63"));
        assertTrue(InlineImages.isResolvableHost("https://imgflip.com/gif/b250fo"));
        assertFalse(InlineImages.isResolvableHost("https://imgflip.com/meme/Drake-Hotline-Bling"));
        assertFalse(InlineImages.isResolvableHost("https://imgflip.com/memegenerator"));
    }

    @Test
    public void htmlEntitiesInUrlsAreDecoded() {
        assertEquals("https://x/a?b=1&c=2/3", InlineImages.decodeHtmlEntities("https://x/a?b=1&amp;c=2&#x2F;3"));
        assertNull(InlineImages.decodeHtmlEntities(null));
    }

    @Test
    public void gifMarkerLinkTextIsHideable() {
        assertTrue(InlineImages.isHideableLinkText(" [GIF] "));
        assertFalse(InlineImages.isHideableLinkText("gif"));
        assertFalse(InlineImages.isHideableLinkText(null));
    }

    @Test
    public void bareLinkTextMatchesSchemeAndHostInAnyCase() {
        String url = "https://i.redd.it/7veumlohiw1i1.png";
        assertTrue(InlineImages.isBareLinkText(url, url));
        // rif's linkifier lowercases the scheme a phone keyboard capitalised.
        assertTrue(InlineImages.isBareLinkText("Https://i.redd.it/7veumlohiw1i1.png", url));
        assertTrue(InlineImages.isBareLinkText("HTTPS://I.REDD.IT/7veumlohiw1i1.png", url));
        assertTrue(InlineImages.isBareLinkText("Https://imgur.com", "https://imgur.com"));
        // The path is case-sensitive; other text is not the URL.
        assertFalse(InlineImages.isBareLinkText("https://i.redd.it/7VEUMLOHIW1I1.png", url));
        assertFalse(InlineImages.isBareLinkText("https://i.redd.it/7veumlohiw1i1.pn", url));
        assertFalse(InlineImages.isBareLinkText("my pic", url));
        assertFalse(InlineImages.isBareLinkText("i.redd.it/7veumlohiw1i1.png", url));
        assertFalse(InlineImages.isBareLinkText(null, url));
    }

    // fitSize(): screen 1000 x 2000, comment width 1000, fixed height cap 2000.
    private static int[] fit(int w, int h, int widthPct, int heightPct, boolean scale) {
        return InlineImages.fitSize(w, h, 1000, 2000, 2000, widthPct, heightPct, scale);
    }

    @Test
    public void noLimitsKeepsOldSizing() {
        assertArrayEquals(new int[]{1000, 500}, fit(400, 200, 0, 0, true));
        assertArrayEquals(new int[]{400, 200}, fit(400, 200, 0, 0, false));
        assertArrayEquals(new int[]{500, 2000}, fit(1000, 4000, 0, 0, true));
    }

    @Test
    public void widthLimitScalesToTheCappedWidth() {
        assertArrayEquals(new int[]{500, 250}, fit(400, 200, 50, 0, true));
        assertArrayEquals(new int[]{400, 200}, fit(400, 200, 50, 0, false));
        assertArrayEquals(new int[]{500, 250}, fit(1600, 800, 50, 0, false));
    }

    @Test
    public void heightLimitIsAPercentOfScreenHeight() {
        // A tall screenshot at full width would be 2000 tall; 25% of 2000 = 500.
        assertArrayEquals(new int[]{250, 500}, fit(900, 1800, 0, 25, true));
    }

    @Test
    public void bothLimitsTheTighterWins() {
        // Wide image: the width limit binds (500 x 250 is under 1000 tall).
        assertArrayEquals(new int[]{500, 250}, fit(1600, 800, 50, 50, true));
        // Tall image: 500 wide would be 1000 tall, so the 30% height cap (600) binds.
        assertArrayEquals(new int[]{300, 600}, fit(900, 1800, 50, 30, true));
    }

    @Test
    public void heightLimitNeverLoosensTheFixedCap() {
        assertArrayEquals(new int[]{500, 2000}, fit(1000, 4000, 0, 100, true));
        // Fixed cap 1000 is tighter than 100% of a 2000 screen: it stays.
        assertArrayEquals(new int[]{250, 1000},
                InlineImages.fitSize(1000, 4000, 1000, 1000, 2000, 0, 100, true));
    }
}
