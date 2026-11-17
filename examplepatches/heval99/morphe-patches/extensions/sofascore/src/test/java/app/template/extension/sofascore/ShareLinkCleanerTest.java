package app.template.extension.sofascore;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** The text rules of "Clean shared links". */
public class ShareLinkCleanerTest {
    private static final String FANTASY =
            "https://www.sofascore.com/fantasy/competition/12345#tab:fantasy_leagues,joinCode:AB12CD";

    @Test
    public void trackingLinkBecomesThePlainAddress() {
        assertEquals("https://www.sofascore.com", ShareLinkCleaner.clean("https://app.sofascore.com/nixz/AbC123"));
    }

    @Test
    public void leadingSpaceAndSurroundingTextAreKept() {
        assertEquals(" https://www.sofascore.com", ShareLinkCleaner.clean(" https://app.sofascore.com/nixz/AbC123"));
        assertEquals("Arsenal 2-1 Spurs https://www.sofascore.com",
                ShareLinkCleaner.clean("Arsenal 2-1 Spurs https://app.sofascore.com/nixz/xyz_9"));
        assertEquals("a https://www.sofascore.com b", ShareLinkCleaner.clean("a https://app.sofascore.com/nixz/q b"));
    }

    @Test
    public void punctuationAroundTheLinkSurvives() {
        assertEquals("(https://www.sofascore.com)", ShareLinkCleaner.clean("(https://app.sofascore.com/nixz/abc)"));
        assertEquals("see https://www.sofascore.com.", ShareLinkCleaner.clean("see https://app.sofascore.com/nixz/abc."));
    }

    @Test
    public void linksInsideOtherUrlsOrGluedToTextAreUntouched() {
        String query = "https://other.example/?r=https://app.sofascore.com/nixz/1";
        assertSame(query, ShareLinkCleaner.clean(query));
        String glued = "xhttps://app.sofascore.com/nixz/1";
        assertSame(glued, ShareLinkCleaner.clean(glued));
    }

    @Test
    public void textWithoutALinkIsTheSameInstance() {
        String text = "Great match tonight";
        assertSame(text, ShareLinkCleaner.clean(text));
    }

    @Test
    public void otherSofascoreLinksAreUntouched() {
        assertSame(FANTASY, ShareLinkCleaner.clean(FANTASY));
        String other = "https://www.sofascore.com/football/match/a-b/xyz";
        assertSame(other, ShareLinkCleaner.clean(other));
        String elsewhere = "https://example.com/nixz/abc";
        assertSame(elsewhere, ShareLinkCleaner.clean(elsewhere));
        String lookalike = "https://app.sofascore.com.evil.example/nixz/abc";
        assertSame(lookalike, ShareLinkCleaner.clean(lookalike));
        String share = "Join my league " + FANTASY;
        assertSame(share, ShareLinkCleaner.clean(share));
    }

    @Test
    public void fantasyLinkStaysWhenATrackingLinkIsAlsoPresent() {
        assertEquals(FANTASY + " https://www.sofascore.com",
                ShareLinkCleaner.clean(FANTASY + " https://app.sofascore.com/nixz/k1"));
    }

    @Test
    public void nullAndEmptyPassThrough() {
        assertNull(ShareLinkCleaner.clean(null));
        assertEquals("", ShareLinkCleaner.clean(""));
    }

    @Test
    public void onlyUtmParametersAreTracking() {
        for (String key : new String[] {"utm_source", "utm_medium", "utm_content", "utm_campaign"}) {
            assertTrue(key, ShareLinkCleaner.isTrackingParameter(key));
        }
        assertFalse(ShareLinkCleaner.isTrackingParameter("v"));
        assertFalse(ShareLinkCleaner.isTrackingParameter("t"));
        assertFalse(ShareLinkCleaner.isTrackingParameter(null));
    }
}
