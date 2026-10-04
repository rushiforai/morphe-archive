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

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/** Response evidence names known schema fields and their types, without changing response delivery. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MarketplaceResponseDiagnosticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String THEMED = "MarketplaceHomeFeedAdsThemedQuery";
    private static final String RELATED = "MarketplaceProductDetailsPageRelatedAdsDetailQuery";
    private static final String SEARCH = "MarketplaceSearchApp_MarketplaceSearchFeedHeadQuery";
    private static final String SHAPE = "Marketplace shape: ";

    @Before
    public void prepare() {
        MarketplaceAdFilterForTests.inBuild(Boolean.TRUE);
        MarketplaceAdFilterForTests.forget();
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
    }

    @After
    public void restore() {
        MarketplaceAdFilterForTests.inBuild(null);
        MarketplaceAdFilterForTests.forget();
        BaseSettings.DEBUG.resetToDefault();
        Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.resetToDefault();
        PauseForTests.resume();
        LogBufferManager.clearLogBuffer();
    }

    private static String response() {
        return "{\"data\":{\"edges\":[{\"node\":{\"__typename\":\"MarketplaceFeedGeneralListingObject\","
                + "\"listing\":{\"__typename\":\"GroupCommerceProductItem\",\"is_shipping_offered\":true,"
                + "\"shipping_offer_type\":\"SensitiveDeliveryChoice\",\"id\":\"987654321012345\","
                + "\"marketplace_listing_title\":\"SensitiveListingText\","
                + "\"location\":{\"latitude\":34.123456789,\"longitude\":-82.987654321,\"city\":\"SensitiveCity\"},"
                + "\"private_location_name\":\"SensitivePrivateValue\","
                + "\"https://private.example/key\":\"https://private.example/value\"}}},"
                + MarketplaceSearchAdsTest.adStory(2) + "]}}";
    }

    @Test
    public void theTwoUnprovenAdQueriesAreObservedWithoutChangingAByte() {
        String response = response();
        for (String query : new String[] {THEMED, RELATED}) {
            assertSame(response, MarketplaceAdFilterForTests.responseWhole(query, response));
        }
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains(SHAPE + THEMED));
        assertTrue(report, report.contains(SHAPE + RELATED));
        assertTrue(report, report.contains("model=GroupCommerceProductItem"));
        assertTrue(report, report.contains("model=MarketplaceFeedAdStory"));
        assertTrue(report, report.contains("is_shipping_offered:boolean"));
        assertTrue(report, report.contains("shipping_offer_type:string"));
        assertTrue(report, report.contains("capture=complete"));
        assertTrue(report, report.contains("MarketplaceFeedAdStory:1"));
        for (String privateText : new String[] {"Sensitive", "987654321012345", "34.123456789",
                "82.987654321", "private_location_name", "private.example"}) {
            assertFalse(privateText + " reached the diagnostic report", report.contains(privateText));
        }
    }

    @Test
    public void everySplitIsPassedOnImmediatelyAndAnIncompleteTailIsNeverFlushedTwice() {
        String response = response();
        for (int at = 1; at < response.length(); at++) {
            Object request = new Object();
            String first = response.substring(0, at);
            String second = response.substring(at);
            assertSame(first, MarketplaceAdFilterForTests.responsePiece(THEMED, first, request));
            assertSame(second, MarketplaceAdFilterForTests.responsePiece(THEMED, second, request));
            assertNull(MarketplaceAdFilter.responseEnd(request));
        }
        Object unfinished = new Object();
        String tail = "{\"data\":{\"listing\":";
        assertSame(tail, MarketplaceAdFilterForTests.responsePiece(RELATED, tail, unfinished));
        assertNull(MarketplaceAdFilter.responseEnd(unfinished));
        assertNull(MarketplaceAdFilter.responseEnd(unfinished));
        assertTrue(LogBufferManager.buildExportText().contains("unfinished payload"));
    }

    @Test
    public void debugOffOtherQueriesAndAnAbsentPatchRemainUnread() {
        String response = response();
        BaseSettings.DEBUG.save(false);
        assertSame(response, MarketplaceAdFilterForTests.responseWhole(THEMED, response));
        BaseSettings.DEBUG.save(true);
        assertSame(response, MarketplaceAdFilterForTests.responseWhole("MarketplaceHomeFeedAdsPrivateUserNameQuery", response));
        assertSame(response, MarketplaceAdFilterForTests.responseWhole("EventsBookmarkSurfaceQuery", response));
        MarketplaceAdFilterForTests.inBuild(Boolean.FALSE);
        assertSame(response, MarketplaceAdFilterForTests.responseWhole(RELATED, response));
        assertFalse(LogBufferManager.buildExportText().contains(SHAPE));
    }

    @Test
    public void diagnosticsStillObserveAnUnfilteredComparisonAndSearchKeepsItsExistingFilter() {
        String response = MarketplaceSearchAdsTest.answer(MarketplaceSearchAdsTest.listing(1), MarketplaceSearchAdsTest.adStory(2));
        assertEquals(MarketplaceSearchAdsTest.answer(MarketplaceSearchAdsTest.listing(1)),
                MarketplaceAdFilterForTests.responseWhole(SEARCH, response));
        Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.save(false);
        assertSame(response, MarketplaceAdFilterForTests.responseWhole(SEARCH, response));
        assertTrue(LogBufferManager.buildExportText().contains("model=MarketplaceFeedAdStory"));
    }

    @Test
    public void unknownModelValuesStayPrivateAndOversizedOrMalformedAnswersStillPassThrough() {
        String unknown = "{\"data\":{\"listing\":{\"__typename\":\"SensitivePrivateModel\",\"is_shipping_offered\":false}}}";
        assertSame(unknown, MarketplaceAdFilterForTests.responseWhole(THEMED, unknown));
        String oversized = "{\"data\":\"" + "x".repeat(300_000) + "\"}";
        assertSame(oversized, MarketplaceAdFilterForTests.responseWhole(RELATED, oversized));
        String malformed = "{\"data\":{\"listing\":}}";
        assertSame(malformed, MarketplaceAdFilterForTests.responseWhole(THEMED, malformed));
        String report = LogBufferManager.buildExportText();
        assertFalse(report.contains("SensitivePrivateModel"));
        assertTrue(report, report.contains("model=unrecognized"));
        assertTrue(report, report.contains("payload budget"));
        assertTrue(report, report.contains("unreadable payload"));
        assertTrue(report, report.contains("capture=incomplete"));
        assertTrue(report, report.contains("unrecognized_models=1"));
    }

    @Test
    public void requestSelectionFieldsAreShapesOnlyAndNoLocalOrRadiusValueIsChanged() {
        String request = "variables=%7B%22localOnly%22%3Atrue%2C%22shippedOnly%22%3Anull%2C%22radius%22%3A12345"
                + "%2C%22location%22%3A%7B%22latitude%22%3A34.123456789%2C%22longitude%22%3A-82.987654321%7D%7D";
        assertSame(request, MarketplaceAdFilterForTests.requestBody("MarketplacePlainHomeAppQuery", request));
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("request variables"));
        assertTrue(report, report.contains("localOnly:boolean"));
        assertTrue(report, report.contains("shippedOnly:null"));
        assertTrue(report, report.contains("radius:number"));
        assertTrue(report, report.contains("location:object"));
        assertFalse(report.contains("12345"));
        assertFalse(report.contains("34.123456789"));
        assertFalse(report.contains("82.987654321"));
    }

    @Test
    public void bothFixtureBackedLocalHomeQueriesAlsoPassTheirResponsesOnAsTheyWere() {
        String response = response();
        for (String query : new String[] {"MarketplaceHomeQuery", "MarketplacePlainHomeAppQuery"}) {
            assertSame(response, MarketplaceAdFilterForTests.responseWhole(query, response));
            assertTrue(LogBufferManager.buildExportText().contains(SHAPE + query));
        }
    }

    @Test
    public void concurrentAnswersAndDepthAreBoundedWithoutChangingDelivery() {
        Object[] requests = new Object[20];
        String opening = "{";
        for (int i = 0; i < requests.length; i++) {
            requests[i] = new Object();
            assertSame(opening, MarketplaceAdFilterForTests.responsePiece(THEMED, opening, requests[i]));
        }
        for (Object request : requests) assertNull(MarketplaceAdFilter.responseEnd(request));
        String tooDeep = "[".repeat(65) + "0" + "]".repeat(65);
        assertSame(tooDeep, MarketplaceAdFilterForTests.responseWhole(RELATED, tooDeep));
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("observer request budget"));
        assertTrue(report, report.contains("depth budget"));
    }

    @Test
    public void searchShapeTrafficCannotUseUpEitherMissingQuerysEvidenceBudget() {
        Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS.save(false);
        for (int count = 1; count <= 50; count++) {
            String data = "\"private_field\":null,".repeat(count);
            String response = "{\"data\":{" + data + "\"tail\":null}}";
            assertSame(response, MarketplaceAdFilterForTests.responseWhole(SEARCH, response));
        }
        String response = response();
        assertSame(response, MarketplaceAdFilterForTests.responseWhole(THEMED, response));
        assertSame(response, MarketplaceAdFilterForTests.responseWhole(RELATED, response));
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains(SHAPE + THEMED));
        assertTrue(report, report.contains(SHAPE + RELATED));
        assertFalse(report.contains("private_field"));
        int lines = report.split(java.util.regex.Pattern.quote(SHAPE + SEARCH), -1).length - 1;
        assertTrue("unbounded diagnostic output: " + lines, lines <= 40);
    }

    @Test
    public void aPartialTraversalNeverClaimsToHaveCapturedEveryModel() {
        String item = "{\"__typename\":\"MarketplaceFeedAdStory\"}";
        String response = "{\"data\":[" + (item + ",").repeat(300) + item + "]}";
        assertSame(response, MarketplaceAdFilterForTests.responseWhole(THEMED, response));
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("shape traversal budget"));
        assertTrue(report, report.contains("capture=incomplete"));
        assertFalse(report.contains("capture=complete"));
    }

    @Test
    public void repeatedShapesStayCompleteAtTheLimitButANewShapeMakesTheResponseIncomplete() {
        for (int fields = 1; fields <= MarketplaceResponseDiagnostics.MAX_SHAPES; fields++) {
            String response = privateShape(fields);
            assertSame(response, MarketplaceAdFilterForTests.responseWhole(THEMED, response));
        }
        String report = LogBufferManager.buildExportText();
        assertEquals(MarketplaceResponseDiagnostics.MAX_SHAPES, report.split("model=none", -1).length - 1);
        LogBufferManager.clearLogBuffer();

        Object repeated = new Object();
        String retained = privateShape(1);
        assertSame(retained, MarketplaceAdFilterForTests.responsePiece(THEMED, retained, repeated));
        assertSame(retained, MarketplaceAdFilterForTests.responsePiece(THEMED, retained, repeated));
        assertNull(MarketplaceAdFilter.responseEnd(repeated));
        report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("payloads=2 capture=complete"));
        assertFalse(report.contains("capture=incomplete"));
        LogBufferManager.clearLogBuffer();

        Object omitted = new Object();
        String overflow = privateShape(MarketplaceResponseDiagnostics.MAX_SHAPES + 1);
        assertSame(overflow, MarketplaceAdFilterForTests.responsePiece(THEMED, overflow, omitted));
        assertNull(MarketplaceAdFilter.responseEnd(omitted));
        report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("payloads=1 capture=incomplete"));
        assertFalse(report.contains("capture=complete"));
        assertFalse(report.contains("other_string:" + (MarketplaceResponseDiagnostics.MAX_SHAPES + 1)));
        assertPrivateShapeDataAbsent(report);
    }

    @Test
    public void newSummariesBeyondTheLimitEmitOneNoticeAndDuplicatesDoNotUseTheBudget() {
        String payload = privateShape(1);
        for (int payloads = 1; payloads <= 8; payloads++) {
            String response = payload.repeat(payloads);
            assertSame(response, MarketplaceAdFilterForTests.responseWhole(RELATED, response));
        }
        String report = LogBufferManager.buildExportText();
        assertEquals(8, report.split("response summary payloads=", -1).length - 1);
        LogBufferManager.clearLogBuffer();
        assertSame(payload, MarketplaceAdFilterForTests.responseWhole(RELATED, payload));
        assertFalse(LogBufferManager.buildExportText().contains("summary omitted"));

        Object request = new Object();
        String overflow = payload.repeat(9);
        assertSame(overflow, MarketplaceAdFilterForTests.responsePiece(RELATED, overflow, request));
        assertNull(MarketplaceAdFilter.responseEnd(request));
        assertSame(overflow, MarketplaceAdFilterForTests.responseWhole(RELATED, overflow));
        report = LogBufferManager.buildExportText();
        assertEquals(report, 1, report.split("response summary omitted: summary budget", -1).length - 1);
        assertFalse(report.contains("response summary payloads="));
        assertPrivateShapeDataAbsent(report);
    }

    private static String privateShape(int fields) {
        StringBuilder response = new StringBuilder("{");
        for (int field = 0; field < fields; field++) {
            if (field > 0) response.append(',');
            response.append("\"private_location_name_").append(field).append("\":")
                    .append("\"SensitivePrivateValue https://private.example/987654321012345 34.123456789\"");
        }
        return response.append('}').toString();
    }

    private static void assertPrivateShapeDataAbsent(String report) {
        for (String privateText : new String[] {"private_location_name", "SensitivePrivateValue",
                "private.example", "987654321012345", "34.123456789"}) {
            assertFalse(privateText + " reached the diagnostic report", report.contains(privateText));
        }
    }
}
