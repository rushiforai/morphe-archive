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

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Marketplace search's answers as Facebook's Networking module hands them to JavaScript, whole or
 * in the pieces Tigon reads them in: the ad results leave the list, every organic listing and every
 * byte around them stays, a streamed list stays contiguous, and other queries, the switch off, a
 * pause or anything it can't read leave the text as Facebook's servers wrote it.
 *
 * <p>No answer of the app's own search has been captured yet. The shape here is the web search's
 * (the same GraphQL schema: {@code data.marketplace_search.feed_units.edges}, ad nodes typed
 * MarketplaceFeedAdStory, a sponsored listing's {@code story.sponsored_data}, edges typed
 * MarketplaceSearchFeedStoriesEdge), and Relay's own form for streamed and deferred payloads.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MarketplaceSearchAdsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String HEAD = "MarketplaceSearchApp_MarketplaceSearchFeedHeadQuery";
    private static final String EDGES = "\"marketplace_search\",\"feed_units\",\"edges\"";

    /** What takes a streamed ad's place: no data, and the ad's own extensions. */
    private static final String NO_DATA = "{\"data\":null,\"extensions\":{\"is_final\":false}}";

    @Before
    public void inBuild() {
        MarketplaceAdFilterForTests.inBuild(Boolean.TRUE);
        MarketplaceAdFilterForTests.forget();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        MarketplaceAdFilterForTests.inBuild(null);
        MarketplaceAdFilter.failNextForTests = null;
        MarketplaceAdFilterForTests.forget();
        PauseForTests.resume();
        Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(MarketplaceSearchAds.ROUTE + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SPONSORED_MARKETPLACE + ":")) return line;
        }
        return null;
    }

    /** An organic listing's edge. Its title holds JSON's own characters, escaped the way a server writes them. */
    static String listing(int id) {
        return "{\"node\":{\"__typename\":\"MarketplaceFeedListingStoryObject\",\"story_type\":\"POST\",\"story_key\":\"" + id
                + "\",\"listing\":{\"__typename\":\"GroupCommerceProductItem\",\"id\":\"" + id
                + "\",\"marketplace_listing_title\":\"Kid's bike {red} [20\\\" wheels] \\\\ AdStory \\u00e9 " + id
                + "\",\"listing_price\":{\"formatted_amount\":\"$20\"},\"location\":{\"reverse_geocode\":{\"city\":\"Venice\"}},"
                + "\"primary_listing_photo\":{\"image\":{\"uri\":\"https://scontent.xx.fbcdn.net/" + id + ".jpg\"}}},"
                + "\"story\":{\"sponsored_data\":null,\"note\":\"\\\"sponsored_data\\\":{}\"}},"
                + "\"cursor\":\"{\\\"pos\\\":" + id + "}\",\"__typename\":\"MarketplaceSearchFeedStoriesEdge\"}";
    }

    /** An advertiser's result, the kind with an "Ad" line under its title. */
    static String adStory(int id) {
        return "{\"node\":{\"__typename\":\"MarketplaceFeedAdStory\",\"story_type\":\"AD\",\"story_key\":\"" + id
                + "\",\"ad_id\":\"" + id + "\",\"title\":\"Vogue x eBay: Molly Finds\",\"sponsored_data\":{\"ad_id\":\"" + id
                + "\",\"client_token\":\"t\"}},\"cursor\":null,\"__typename\":\"MarketplaceSearchFeedStoriesEdge\"}";
    }

    /** A seller's listing shown as sponsored: a listing story carrying sponsored data. */
    static String sponsoredListing(int id) {
        return "{\"node\":{\"__typename\":\"MarketplaceFeedListingStoryObject\",\"story_type\":\"POST\",\"story_key\":\"" + id
                + "\",\"listing\":{\"id\":\"" + id + "\",\"marketplace_listing_title\":\"Temu bike\"},"
                + "\"story\":{\"sponsored_data\":{\"ad_id\":\"" + id + "\"}}},\"cursor\":\"c" + id
                + "\",\"__typename\":\"MarketplaceSearchFeedStoriesEdge\"}";
    }

    /** The first payload of an answer, holding [edges]. */
    static String answer(String... edges) {
        return "{\"data\":{\"marketplace_search\":{\"feed_units\":{\"edges\":[" + String.join(",", edges)
                + "],\"page_info\":{\"end_cursor\":\"e\",\"has_next_page\":true}},\"__typename\":\"MarketplaceSearch\"}},"
                + "\"extensions\":{\"is_final\":false}}";
    }

    /** A result Relay streams on its own, at [index] of the list. */
    static String streamed(int index, String edge) {
        return "{\"label\":\"MarketplaceSearchFeed$stream$edges\",\"path\":[" + EDGES + "," + index + "],\"data\":" + edge
                + ",\"extensions\":{\"is_final\":false}}";
    }

    /** Fields Relay deferred for the result at [index]. */
    static String deferred(int index) {
        return "{\"label\":\"MarketplaceSearchFeedItem$defer$badges\",\"path\":[" + EDGES + "," + index
                + ",\"node\"],\"data\":{\"badges\":[]},\"extensions\":{\"is_final\":false}}";
    }

    private static int occurrences(String text, String part) {
        int count = 0;
        for (int at = text.indexOf(part); at >= 0; at = text.indexOf(part, at + 1)) count++;
        return count;
    }

    @Test
    public void theSwitchStartsOnAndSearchAdsLeaveTheAnswer() {
        assertTrue(Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.get());
        String whole = answer(listing(1), adStory(2), listing(3), sponsoredListing(4), listing(5));
        assertEquals(answer(listing(1), listing(3), listing(5)), MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
        assertEquals(MarketplaceSearchAds.ROUTE + ": 1 lists, 5 items, 2 removed. Last reason: "
                + MarketplaceSearchAds.REMOVED + ". Removed: " + MarketplaceSearchAds.REMOVED + " 2. Kinds: "
                + "MarketplaceFeedListingStoryObject 4, MarketplaceFeedAdStory 1", counterLine());
        assertEquals(FamilyNames.SPONSORED_MARKETPLACE + ": invoked 1, 1 found, 0 missing", statusLine());
    }

    /** Whatever the pieces are, the text passed on adds up to the same answer, and nothing is lost. */
    @Test
    public void piecesAnywhereAddUpToTheSameAnswer() {
        String first = answer(adStory(0), listing(1), sponsoredListing(2), listing(3));
        String whole = "for (;;);" + first + "\r\n" + first + "\r\n";
        String expected = "for (;;);" + answer(listing(1), listing(3)) + "\r\n" + answer(listing(1), listing(3)) + "\r\n";
        for (int cut = 0; cut <= whole.length(); cut++) {
            Object request = new Object();
            String out = MarketplaceAdFilterForTests.responsePiece(HEAD, whole.substring(0, cut), request)
                    + MarketplaceAdFilterForTests.responsePiece(HEAD, whole.substring(cut), request);
            assertEquals("cut at " + cut, expected, out);
        }
        for (int size = 1; size < 40; size += 3) {
            Object request = new Object();
            StringBuilder out = new StringBuilder();
            for (int at = 0; at < whole.length(); at += size) {
                out.append(MarketplaceAdFilterForTests.responsePiece(HEAD,
                        whole.substring(at, Math.min(whole.length(), at + size)), request));
            }
            assertEquals("pieces of " + size, expected, out.toString());
        }
    }

    /** Text before and between payloads goes straight on; only an unfinished payload waits. */
    @Test
    public void onlyAnUnfinishedPayloadWaits() {
        Object request = new Object();
        String first = answer(listing(1));
        assertEquals("", MarketplaceAdFilterForTests.responsePiece(HEAD, first.substring(0, 10), request));
        assertEquals(first + "\r\n", MarketplaceAdFilterForTests.responsePiece(HEAD, first.substring(10) + "\r\n", request));
        String organic = "\r\n";
        assertSame(organic, MarketplaceAdFilterForTests.responsePiece(HEAD, organic, request));
    }

    /**
     * A streamed ad's place is taken by a payload with no data and the ad's extensions, which Relay
     * passes over, and every later index of its list, streamed results and deferred fields alike,
     * moves down past the ads taken out. A deferred part of an ad goes where no result is. Everything
     * else in each payload stays.
     */
    @Test
    public void aStreamedListStaysContiguous() {
        String[] payloads = {
                answer(listing(0), adStory(1)),
                streamed(2, adStory(2)),
                streamed(3, listing(3)),
                deferred(1),
                streamed(4, sponsoredListing(4)),
                streamed(5, listing(5)),
                deferred(3),
                deferred(5),
                "{\"data\":null,\"extensions\":{\"is_final\":true}}",
        };
        String[] expected = {
                answer(listing(0)),
                NO_DATA,
                streamed(1, listing(3)),
                deferred(MarketplaceSearchAds.NOWHERE + 1),
                NO_DATA,
                streamed(2, listing(5)),
                deferred(1),
                deferred(2),
                payloads[8],
        };
        Object request = new Object();
        StringBuilder out = new StringBuilder();
        for (String payload : payloads) out.append(MarketplaceAdFilterForTests.responsePiece(HEAD, payload + "\r\n", request));
        assertEquals(String.join("\r\n", expected) + "\r\n", out.toString());
        assertTrue(counterLine(), counterLine().startsWith(MarketplaceSearchAds.ROUTE + ": 5 lists, 6 items, 3 removed."));

        // The same answer read whole is taken apart the same way.
        String whole = String.join("\r\n", payloads);
        assertEquals(String.join("\r\n", expected), MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
    }

    /** Relay's payloads sent together as one list come out as one list, each streamed ad emptied. */
    @Test
    public void aListOfPayloadsIsReadPayloadByPayload() {
        String batch = "[" + answer(listing(0), adStory(1)) + "," + streamed(2, adStory(2)) + "," + streamed(3, listing(3)) + "]";
        assertEquals("[" + answer(listing(0)) + "," + NO_DATA + "," + streamed(1, listing(3)) + "]",
                MarketplaceAdFilterForTests.responseWhole(HEAD, batch));
    }

    /**
     * A streamed ad keeps what Relay reads besides its data, is_final and hasNext above all, in a
     * payload with null data, never an empty part between two line breaks. Its label and path go, so
     * Relay doesn't read it as a result, and so do its errors, which beside null data would fail the
     * whole search.
     */
    @Test
    public void aStreamedAdLeavesItsEndMarkerBehind() {
        String label = "{\"label\":\"MarketplaceSearchFeed$stream$edges\",\"path\":[" + EDGES + ",";
        String[] payloads = {
                answer(listing(0)),
                label + "1],\"data\":" + adStory(1) + ",\"errors\":[{\"message\":\"m\"}],\"hasNext\":true}",
                label + "2],\"data\":" + adStory(2) + ",\"extensions\":null}",
                label + "3],\"data\":" + adStory(3) + ",\"extensions\":{\"is_final\":true}}",
        };
        Object request = new Object();
        StringBuilder out = new StringBuilder();
        for (String payload : payloads) out.append(MarketplaceAdFilterForTests.responsePiece(HEAD, payload + "\r\n", request));
        assertEquals(answer(listing(0)) + "\r\n"
                + "{\"data\":null,\"hasNext\":true,\"extensions\":{}}\r\n"
                + "{\"data\":null,\"extensions\":{}}\r\n"
                + "{\"data\":null,\"extensions\":{\"is_final\":true}}\r\n", out.toString());
        assertEquals("no part is left empty", 0, occurrences(out.toString(), "\r\n\r\n"));
    }

    /**
     * Negative control: sponsored_data that names no ad, empty or with a null ad id, leaves its
     * listing where it is. The ad story type and an ad id still take one out.
     */
    @Test
    public void sponsoredDataWithoutAnAdIdStays() {
        String empty = "{\"node\":{\"__typename\":\"MarketplaceFeedListingStoryObject\",\"story\":{\"sponsored_data\":{}}},\"cursor\":\"a\"}";
        String nullId = "{\"node\":{\"__typename\":\"MarketplaceFeedListingStoryObject\","
                + "\"sponsored_data\":{\"ad_id\":null,\"client_token\":null}},\"cursor\":\"b\"}";
        String blankId = "{\"node\":{\"__typename\":\"MarketplaceFeedListingStoryObject\",\"story\":{\"sponsored_data\":{\"ad_id\":\"\"}}}}";
        String whole = answer(listing(1), empty, nullId, blankId);
        assertSame(whole, MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
        String numbered = "{\"node\":{\"__typename\":\"MarketplaceFeedListingStoryObject\",\"sponsored_data\":{\"ad_id\":7}}}";
        assertEquals(answer(listing(1), empty), MarketplaceAdFilterForTests.responseWhole(HEAD,
                answer(listing(1), numbered, empty, adStory(2), sponsoredListing(3))));
    }

    /** A payload nested [depth] deep, deeper than a thread's stack can read. */
    private static String nested(int depth) {
        StringBuilder text = new StringBuilder("{\"data\":{\"deep\":");
        for (int i = 0; i < depth; i++) text.append('[');
        for (int i = 0; i < depth; i++) text.append(']');
        return text.append("}}").toString();
    }

    /**
     * A payload whose reading fails goes on whole, with what an earlier piece held of it, and what
     * came before it in the same piece goes on as it was read. The failure is reported.
     */
    @Test
    public void aPayloadThatFailsGoesOnWhole() {
        String deep = nested(300_000);
        String text = answer(listing(0), adStory(1)) + "\r\n" + deep + "\r\n";
        int cut = text.length() - 200_013;
        Object request = new Object();
        String first = MarketplaceAdFilterForTests.responsePiece(HEAD, text.substring(0, cut), request);
        assertEquals(answer(listing(0)) + "\r\n", first);
        String second = MarketplaceAdFilterForTests.responsePiece(HEAD, text.substring(cut), request);
        assertEquals("nothing went missing", deep.length() + 2, second.length());
        assertTrue(second.equals(deep + "\r\n"));
        assertTrue(statusLine(), statusLine().contains("threw java.lang.StackOverflowError"));
    }

    /**
     * After a failure nothing more is taken out of that answer, but every later index still moves
     * past the ads already taken out, so the list Relay builds has no hole. With none taken out
     * before, the rest of the answer goes on untouched.
     */
    @Test
    public void afterAFailureTheListStaysContiguous() {
        String deep = nested(300_000);
        String[] payloads = {
                answer(listing(0), adStory(1)),
                streamed(2, listing(2)),
                deep,
                streamed(3, adStory(3)),
                deferred(1),
                deferred(3),
                streamed(4, listing(4)),
        };
        String[] expected = {
                answer(listing(0)),
                streamed(1, listing(2)),
                deep,
                streamed(2, adStory(3)),
                deferred(MarketplaceSearchAds.NOWHERE + 1),
                deferred(2),
                streamed(3, listing(4)),
        };
        Object request = new Object();
        for (int i = 0; i < payloads.length; i++) {
            String out = MarketplaceAdFilterForTests.responsePiece(HEAD, payloads[i] + "\r\n", request);
            if (i == 2) assertTrue("the failed payload went on as it came", out.equals(deep + "\r\n"));
            else assertEquals("payload " + i, expected[i] + "\r\n", out);
        }

        Object untouched = new Object();
        assertEquals(answer(listing(0)), MarketplaceAdFilterForTests.responsePiece(HEAD, answer(listing(0)), untouched));
        assertTrue(MarketplaceAdFilterForTests.responsePiece(HEAD, deep, untouched).equals(deep));
        String after = streamed(1, adStory(1));
        assertSame(after, MarketplaceAdFilterForTests.responsePiece(HEAD, after, untouched));
    }

    /**
     * A payload too long to wait for goes on as it comes, what was held of it first. Nothing more is
     * taken out after it, and the next payload's index still moves past the ad taken out before.
     */
    @Test
    public void aPayloadTooLongToWaitForGoesOnAsItComes() {
        Object request = new Object();
        assertEquals(answer(listing(0)) + "\r\n",
                MarketplaceAdFilterForTests.responsePiece(HEAD, answer(listing(0), adStory(1)) + "\r\n", request));
        StringBuilder filler = new StringBuilder(MarketplaceSearchAds.MAX_WAITING_CHARS);
        while (filler.length() < MarketplaceSearchAds.MAX_WAITING_CHARS) filler.append("0123456789");
        String start = "{\"data\":{\"filler\":\"" + filler.substring(0, filler.length() / 2);
        assertEquals("", MarketplaceAdFilterForTests.responsePiece(HEAD, start, request));
        String more = filler.substring(filler.length() / 2);
        assertTrue("the start and this piece go on", MarketplaceAdFilterForTests.responsePiece(HEAD, more, request).equals(start + more));
        String tail = "\"}}\r\n" + streamed(3, adStory(3)) + "\r\n";
        assertEquals("\"}}\r\n" + streamed(2, adStory(3)) + "\r\n", MarketplaceAdFilterForTests.responsePiece(HEAD, tail, request));
        assertNull("nothing left waiting", MarketplaceAdFilter.responseEnd(request));
    }

    /**
     * Text still waiting for its payload to finish when an answer in pieces ends goes on as it came,
     * handed back once for the patch to pass to JavaScript before the answer is reported complete.
     */
    @Test
    public void whatWaitsWhenAnAnswerEndsGoesOnAsItCame() {
        Object request = new Object();
        String cut = answer(listing(1), adStory(2)).substring(0, 60);
        assertEquals("", MarketplaceAdFilterForTests.responsePiece(HEAD, cut, request));
        assertEquals(cut, MarketplaceAdFilter.responseEnd(request));
        assertNull("handed back once", MarketplaceAdFilter.responseEnd(request));

        Object error = new Object();
        assertEquals("Error ", MarketplaceAdFilterForTests.responsePiece(HEAD, "Error [503", error));
        assertEquals("[503", MarketplaceAdFilter.responseEnd(error));

        Object whole = new Object();
        assertEquals(answer(listing(1)), MarketplaceAdFilterForTests.responsePiece(HEAD, answer(listing(1), adStory(2)), whole));
        assertNull("nothing waits", MarketplaceAdFilter.responseEnd(whole));
        assertNull("never read", MarketplaceAdFilter.responseEnd(new Object()));
        assertNull(MarketplaceAdFilter.responseEnd(null));
    }

    /** Negative control: listings whose text or empty fields look like an ad's stay, and so does a list of other things. */
    @Test
    public void lookalikesStay() {
        String lookalike = "{\"node\":{\"__typename\":\"MarketplaceFeedListingStoryObject\",\"title\":\"MarketplaceFeedAdStory\","
                + "\"seller\":{\"name\":\"Sponsored\",\"sponsored_data\":null},\"ad_id\":null},\"cursor\":\"a\"}";
        String others = "{\"data\":{\"marketplace_search\":{\"filters\":[{\"__typename\":\"MarketplaceFeedAdStory\"},"
                + "{\"sponsored_data\":{\"ad_id\":\"1\"}}]}}}";
        String whole = answer(listing(1), lookalike) + others;
        assertSame(whole, MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
        assertTrue(counterLine(), counterLine().startsWith(MarketplaceSearchAds.ROUTE + ": 1 lists, 2 items, 0 removed"));
    }

    /** The typeahead, the search history and every other query's answers pass untouched and uncounted. */
    @Test
    public void otherAnswersAreLeftAlone() {
        String whole = answer(listing(1), adStory(2));
        String[] queries = {
                "MarketplaceSearchServerTypeaheadSuggestionsQuery",
                "MarketplaceHistoryAddInterestedSearchQueryMutation",
                "MarketplaceContinueShoppingAddSearchQueryMutation",
                "MarketplaceHomeFeedQueryRendererQuery",
                "MarketplacePDPContainerQuery",
        };
        for (String query : queries) {
            assertSame(query, whole, MarketplaceAdFilterForTests.responseWhole(query, whole));
            assertSame(query, whole, MarketplaceAdFilterForTests.responsePiece(query, whole, new Object()));
        }
        assertSame(whole, MarketplaceAdFilter.responseWhole(whole, "RelayFBNetwork_EventsBookmarkSurfaceQuery"));
        assertSame(whole, MarketplaceAdFilter.responseWhole(whole, "react_native"));
        assertSame(whole, MarketplaceAdFilter.responseWhole(whole, null));
        assertSame(whole, MarketplaceAdFilter.responsePiece(whole, "SearchFeed", new Object()));
        assertSame("no request to key the answer by", whole,
                MarketplaceAdFilter.responsePiece(whole, "RelayFBNetwork_" + HEAD, null));
        assertNull(MarketplaceAdFilter.responsePiece(null, "RelayFBNetwork_" + HEAD, new Object()));
        assertNull(counterLine());
        assertNull(statusLine());
    }

    /** A payload it can't read goes on as it was; a whole answer that never closes a payload goes on at its end. */
    @Test
    public void whatItCantReadGoesOnAsItWas() {
        String[] bodies = {
                "{\"data\":{\"marketplace_search\":{\"feed_units\":{\"edges\":[" + adStory(1) + "]}}}",
                "{\"data\" " + adStory(1) + "}",
                "{\"data\":[" + adStory(1) + ",]}",
                "{\"data\":{\"edges\":[" + adStory(1) + "}}]",
                "<html>error</html>",
                "",
        };
        for (String body : bodies) {
            assertEquals(body, body, MarketplaceAdFilterForTests.responseWhole(HEAD, body));
        }
        assertEquals(0, occurrences(String.valueOf(counterLine()), " removed. Last reason"));
    }

    @Test
    public void offTheAnswerIsFacebooks() {
        Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.save(false);
        String whole = answer(listing(1), adStory(2));
        assertSame(whole, MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
        Object request = new Object();
        String head = whole.substring(0, 30);
        assertSame(head, MarketplaceAdFilterForTests.responsePiece(HEAD, head, request));
        // An answer that started with the switch off stays unread when it's turned on halfway.
        Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.save(true);
        String tail = whole.substring(30);
        assertSame(tail, MarketplaceAdFilterForTests.responsePiece(HEAD, tail, request));
        assertNull(counterLine());
        assertTrue(statusLine(), statusLine().startsWith(FamilyNames.SPONSORED_MARKETPLACE + ": invoked 2, 1 found"));
    }

    @Test
    public void pausedTheAnswerIsFacebooks() {
        String whole = answer(listing(1), adStory(2));
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[] {HushfacebookPause.Reason.SWITCH,
                HushfacebookPause.Reason.CRASH_LOOP, HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertSame(why.name(), whole, MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
            assertFalse(why.name(), MarketplaceAdFilterForTests.dropsASearchAd());
        }
        PauseForTests.resume();
        assertTrue(MarketplaceAdFilterForTests.dropsASearchAd());
    }

    @Test
    public void withoutThePatchNothingIsRead() {
        MarketplaceAdFilterForTests.inBuild(Boolean.FALSE);
        String whole = answer(listing(1), adStory(2));
        assertSame(whole, MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
        assertSame(whole, MarketplaceAdFilterForTests.responsePiece(HEAD, whole, new Object()));
        assertNull(statusLine());
        assertNull(counterLine());
    }

    /** A failure passes the text on, and a piece of an answer that was waiting goes with it. */
    @Test
    public void aFailurePassesTheTextOn() {
        String whole = answer(listing(1), adStory(2));
        MarketplaceAdFilter.failNextForTests = new IllegalStateException("probe");
        assertSame(whole, MarketplaceAdFilterForTests.responseWhole(HEAD, whole));
        assertTrue(statusLine(), statusLine().contains("threw java.lang.IllegalStateException"));
        assertEquals(answer(listing(1)), MarketplaceAdFilterForTests.responseWhole(HEAD, whole));

        Object request = new Object();
        assertEquals("", MarketplaceAdFilterForTests.responsePiece(HEAD, whole.substring(0, 40), request));
        MarketplaceSearchAds.failNextPieceForTests = new IllegalStateException("probe");
        assertEquals(whole, MarketplaceAdFilterForTests.responsePiece(HEAD, whole.substring(40), request));
        String after = answer(listing(3), adStory(4));
        assertSame("the rest of that answer goes on unread", after,
                MarketplaceAdFilterForTests.responsePiece(HEAD, after, request));
    }

    /**
     * With Debug logging on, each part of a search answer has a line saying how many listings it
     * held and how many ads came out. No line quotes a title, an id or a link.
     */
    @Test
    public void debugLoggingCountsWithoutQuotingAnything() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        Object request = new Object();
        MarketplaceAdFilterForTests.responsePiece(HEAD, answer(listing(1), adStory(2), listing(3)) + "\r\n", request);
        MarketplaceAdFilterForTests.responsePiece(HEAD, streamed(3, sponsoredListing(3)) + "\r\n", request);
        MarketplaceAdFilterForTests.responsePiece(HEAD, "{\"extensions\":{\"is_final\":true}}", request);
        Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.save(false);
        MarketplaceAdFilterForTests.responseWhole(HEAD, answer(listing(1)));
        String report = LogBufferManager.buildExportText();
        assertEquals(report, 1, occurrences(report, "Marketplace ads: " + HEAD
                + " answer, part 1: 3 listings, took out 1 ad (MarketplaceFeedAdStory)."));
        assertEquals(report, 1, occurrences(report, "Marketplace ads: " + HEAD
                + " answer, part 2: streamed listing 3, took it out (MarketplaceFeedListingStoryObject, sponsored data)."));
        assertEquals(report, 1, occurrences(report, "Marketplace ads: " + HEAD + " answer, part 3: no listings in it."));
        assertEquals(report, 1, occurrences(report, "Marketplace ads: " + HEAD + " answer went on unread, the switch is off."));
        assertEquals(report, 0, occurrences(report, "bike"));
        assertEquals(report, 0, occurrences(report, "fbcdn"));
        assertEquals(report, 0, occurrences(report, "Vogue"));
    }
}
