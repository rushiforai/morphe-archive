/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * A listing's own page says when the listing went up (#303): 585's MarketplacePDPSurfaceQuery answer
 * carries creation_time beside location_text, and the place line gets "Listed 3 weeks ago (date)"
 * after it, whether the answer comes whole or in pieces. Off, paused, or with no time to read, the
 * answer is Facebook's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MarketplaceListingAgeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String PAGE = "MarketplacePDPSurfaceQuery";
    private static final long DAY = 24 * 60 * 60;

    @Before
    public void inBuild() {
        MarketplaceAdFilterForTests.inBuild(Boolean.TRUE);
        MarketplaceAdFilterForTests.forget();
        HookStatus.clear();
    }

    @After
    public void restore() {
        MarketplaceAdFilterForTests.inBuild(null);
        MarketplaceAdFilter.failNextForTests = null;
        MarketplaceAdFilterForTests.forget();
        PauseForTests.resume();
        Settings.MARKETPLACE_LISTING_DATE.resetToDefault();
        HookStatus.clear();
    }

    /** The page's answer as 585 shapes it, the listing put up [seconds] since 1970, at [place]. */
    private static String answer(long seconds, String place) {
        return "{\"data\":{\"viewer\":{\"marketplace_pdp\":{\"listing\":{\"__typename\":\"GroupCommerceProductItem\","
                + "\"id\":\"1234\",\"primary_mp_ent\":{\"__typename\":\"GroupCommerceProductItem\",\"id\":\"1234\","
                + "\"creation_time\":" + seconds + ",\"location_text\":{\"text\":\"" + place + "\"},"
                + "\"if_gk_pdp_date_listed_metadata\":{\"__typename\":\"GroupCommerceProductItem\",\"id\":\"1234\","
                + "\"creation_time\":" + seconds + "},\"marketplace_listing_title\":\"Polaroid Camera\"}}},"
                + "\"uri_redirect\":null},\"listing\":{\"__typename\":\"GroupCommerceProductItem\",\"id\":\"1234\","
                + "\"location_text\":{\"text\":\"" + place + "\"},\"marketplace_listing_title\":\"Polaroid Camera\"}},"
                + "\"extensions\":{\"is_final\":true}}";
    }

    private static String date(long seconds) {
        return DateFormat.getDateInstance(DateFormat.MEDIUM, Locale.US).format(new Date(seconds * 1000));
    }

    @Test
    public void bothPlaceLinesOfTheListingGetWhenItWasListed() {
        long now = 1_793_500_000L;
        long listed = now - 21 * DAY;
        String dated = new MarketplaceListingAge.Answer(now * 1000).read(answer(listed, "Moncton, NB"));
        String line = "Moncton, NB" + MarketplaceListingAge.DOT + "Listed 3 weeks ago (" + date(listed) + ")";
        assertEquals(answer(listed, "Moncton, NB").replace("\"text\":\"Moncton, NB\"", "\"text\":\"" + line + "\""), dated);
    }

    @Test
    public void theAgeIsInItsLargestWholeUnit() {
        assertEquals("30 minutes ago", MarketplaceListingAge.ago(30 * 60, Locale.US));
        assertEquals("1 minute ago", MarketplaceListingAge.ago(10, Locale.US));
        assertEquals("19 hours ago", MarketplaceListingAge.ago(19 * 3600 + 59 * 60, Locale.US));
        assertEquals("3 days ago", MarketplaceListingAge.ago(3 * DAY + 100, Locale.US));
        assertEquals("2 weeks ago", MarketplaceListingAge.ago(20 * DAY, Locale.US));
        assertEquals("4 months ago", MarketplaceListingAge.ago(125 * DAY, Locale.US));
        assertEquals("2 years ago", MarketplaceListingAge.ago(800 * DAY, Locale.US));
    }

    @Test
    public void aPlaceWithEscapesKeepsThemAndAnEmptyOneGetsOnlyTheDate() {
        long now = 1_793_500_000L;
        String place = "Caf\\u00e9 \\\"Nord\\\"";
        String dated = new MarketplaceListingAge.Answer(now * 1000).read(answer(now - 3 * DAY, place));
        assertTrue(dated, dated.contains("\"text\":\"" + place + MarketplaceListingAge.DOT + "Listed 3 days ago ("));

        String empty = new MarketplaceListingAge.Answer(now * 1000).read(answer(now - 3 * DAY, ""));
        assertTrue(empty, empty.contains("\"text\":\"Listed 3 days ago ("));
    }

    @Test
    public void aTimeThatCantBeAListingsLeavesTheAnswerAlone() {
        long now = 1_793_500_000L;
        for (long seconds : new long[] {0, 1_000_000_000L, now + 3 * DAY}) {
            String answer = answer(seconds, "Moncton, NB");
            assertSame(answer, new MarketplaceListingAge.Answer(now * 1000).read(answer));
        }
        String noTime = answer(now - DAY, "Moncton, NB").replace("\"creation_time\":" + (now - DAY), "\"creation_time\":null");
        assertSame(noTime, new MarketplaceListingAge.Answer(now * 1000).read(noTime));
    }

    @Test
    public void anAnswerInPiecesIsDatedOnceEachPayloadFinishes() {
        long listed = System.currentTimeMillis() / 1000 - 10 * DAY;
        String answer = answer(listed, "Moncton, NB");
        Object request = new Object();
        int cut = answer.indexOf("creation_time") + 5;
        String first = MarketplaceAdFilterForTests.responsePiece(PAGE, answer.substring(0, cut), request);
        String second = MarketplaceAdFilterForTests.responsePiece(PAGE, answer.substring(cut) + "\r\n", request);
        assertEquals("the unfinished payload waits", "", first);
        assertTrue(second, second.contains("Moncton, NB" + MarketplaceListingAge.DOT + "Listed 1 week ago (" + date(listed) + ")"));
        assertTrue(second, second.endsWith("}\r\n"));
        assertNull("nothing waits at the end", MarketplaceAdFilter.responseEnd(request));
    }

    @Test
    public void aWholeAnswerIsDatedAndOtherQueriesArentRead() {
        long listed = System.currentTimeMillis() / 1000 - 2 * DAY;
        String answer = answer(listed, "Moncton, NB");
        String dated = MarketplaceAdFilterForTests.responseWhole(PAGE, answer);
        assertTrue(dated, dated.contains("Moncton, NB" + MarketplaceListingAge.DOT + "Listed 2 days ago ("));
        assertSame(answer, MarketplaceAdFilterForTests.responseWhole("MarketplaceListingAvailabilityQuery", answer));
        assertFalse(MarketplaceListingAge.listingPage("RelayFBNetwork_MarketplaceSearchFeedPaginationQuery"));
        assertTrue(MarketplaceListingAge.listingPage("RelayFBNetwork_MarketplaceProductDetailsPageAppQuery"));
    }

    @Test
    public void offOrPausedTheAnswerIsFacebooks() {
        String answer = answer(System.currentTimeMillis() / 1000 - 2 * DAY, "Moncton, NB");
        Settings.MARKETPLACE_LISTING_DATE.save(false);
        assertSame(answer, MarketplaceAdFilterForTests.responseWhole(PAGE, answer));
        Object request = new Object();
        assertSame(answer, MarketplaceAdFilterForTests.responsePiece(PAGE, answer, request));
        assertNull(MarketplaceAdFilter.responseEnd(request));

        Settings.MARKETPLACE_LISTING_DATE.resetToDefault();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(answer, MarketplaceAdFilterForTests.responseWhole(PAGE, answer));
    }

    @Test
    public void aFailurePassesWhatWaitedOnAndTheRestUnread() {
        long listed = System.currentTimeMillis() / 1000 - 2 * DAY;
        String answer = answer(listed, "Moncton, NB");
        Object request = new Object();
        MarketplaceAdFilter.failNextForTests = new IllegalStateException("test");
        assertSame(answer, MarketplaceAdFilterForTests.responsePiece(PAGE, answer, request));
        assertSame("the rest of that answer goes on unread", answer,
                MarketplaceAdFilterForTests.responsePiece(PAGE, answer, request));
        assertNull(MarketplaceAdFilter.responseEnd(request));
    }
}
