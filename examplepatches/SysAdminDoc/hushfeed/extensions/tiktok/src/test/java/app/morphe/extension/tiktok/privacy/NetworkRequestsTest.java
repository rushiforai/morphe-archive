package app.morphe.extension.tiktok.privacy;

import static org.junit.Assert.*;

import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.DiagnosticRedactor;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.tiktok.SettingsContextRule;
import java.util.List;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** The API request counts the Network request report adds to the diagnostic export. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class NetworkRequestsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String HEADER =
            "TikTok's own API client since this start; downloads and other companies' SDKs are not counted";

    @Before public void reset() {
        NetworkRequests.resetForTests();
    }

    @Test public void aHostIsKeptByItsDomainAndAKindWithNoRegionInIt() {
        assertEquals("tiktokv.com api", NetworkRequests.bucket("api16-normal-c-useast1a.tiktokv.com"));
        assertEquals("tiktokv.com log", NetworkRequests.bucket("log16-normal-c-useast1a.tiktokv.com"));
        assertEquals("tiktokv.us monitoring", NetworkRequests.bucket("mon16-normal-useast5.tiktokv.us"));
        assertEquals("tiktokv.com messages", NetworkRequests.bucket("im-api-va.tiktokv.com"));
        assertEquals("tiktokv.com LIVE", NetworkRequests.bucket("webcast16-normal-c-useast1a.tiktokv.com"));
        assertEquals("byteoversea.com log", NetworkRequests.bucket("applog.byteoversea.com"));
        assertEquals("tiktokcdn.com other", NetworkRequests.bucket("p16-sign-va.tiktokcdn.com"));
        assertEquals("tiktok.co.jp other", NetworkRequests.bucket("www.tiktok.co.jp"));
        assertEquals("tiktok.com other", NetworkRequests.bucket("tiktok.com"));
        assertEquals("tiktokv.com api", NetworkRequests.bucket(" API16-Normal-C-USEast1a.TikTokV.com "));
        assertEquals("unknown host", NetworkRequests.bucket(null));
        assertEquals("unknown host", NetworkRequests.bucket("  "));
    }

    @Test public void aCallIsCountedFromItsRequestAndNothingItThrowsGetsOut() {
        NetworkRequests.onCall(new Call(new Request("api16-normal-c-useast1a.tiktokv.com", new Body(120))));
        NetworkRequests.onCall(new Call(new Request("api19-normal-c-useast2a.tiktokv.com", null)));
        NetworkRequests.onCall(new Call(new Request("log16-normal-c-useast1a.tiktokv.com", new Body(-1))));
        NetworkRequests.onCall(new Call(null));
        NetworkRequests.onCall(null);
        NetworkRequests.onCall(new Object());
        NetworkRequests.onCall(new Call(new BrokenRequest()));
        assertEquals(List.of(HEADER,
                        "tiktokv.com api: 2 requests, 120 B sent",
                        "tiktokv.com log: 1 request, 0 B sent (1 of unknown length)"),
                NetworkRequests.sectionForTests().lines());
    }

    @Test public void nothingCountedSaysNothing() {
        assertTrue(NetworkRequests.sectionForTests().lines().isEmpty());
    }

    @Test public void domainsPastTheCapAreCountedTogether() {
        for (int i = 0; i < NetworkRequests.MAX_BUCKETS + 5; i++) {
            NetworkRequests.record("api.example" + i + ".com", 10);
        }
        List<String> lines = NetworkRequests.sectionForTests().lines();
        // The header, the buckets up to the cap, and the one the rest share.
        assertEquals(1 + NetworkRequests.MAX_BUCKETS + 1, lines.size());
        assertTrue(lines.toString(), lines.contains(NetworkRequests.OVERFLOW + ": 5 requests, 50 B sent"));
    }

    /** The export redacts every TikTok host name; the section has to say its piece anyway. */
    @Test public void theLinesComeThroughTheExportsRedactionUnchanged() {
        NetworkRequests.record("api16-normal-c-useast1a.tiktokv.com", 2048);
        NetworkRequests.record("log-va.tiktokv.com", 5_000_000);
        NetworkRequests.record("applog.byteoversea.com", 10);
        for (String line : NetworkRequests.sectionForTests().lines()) {
            assertEquals(line, DiagnosticRedactor.redact(line));
        }
    }

    @Test public void theExportCarriesTheSectionOnceACallIsCounted() {
        NetworkRequests.onCall(new Call(new Request("api16-normal-c-useast1a.tiktokv.com", new Body(3))));
        LogBufferManager.appendEvent(DiagnosticCategory.FEED_AND_NAVIGATION, "Test", "INFO", "something worth reporting");
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("[" + NetworkRequests.TITLE + "]\n" + HEADER + "\ntiktokv.com api: 1 request, 3 B sent"));
    }

    /** TikTok's SsHttpCall, by the one field the report reads. */
    private static final class Call {
        final Object originalRequest;

        Call(Object request) {
            this.originalRequest = request;
        }
    }

    /** TikTok's client.Request, by its host and body. */
    private static final class Request {
        private final String host;
        private final Body body;

        Request(String host, Body body) {
            this.host = host;
            this.body = body;
        }

        public String getHost() {
            return host;
        }

        public Body getBody() {
            return body;
        }
    }

    /** TikTok's TypedOutput, whose length is -1 when it does not know. */
    private static final class Body {
        private final long length;

        Body(long length) {
            this.length = length;
        }

        public long length() {
            return length;
        }
    }

    private static final class BrokenRequest {
        public String getHost() {
            throw new IllegalStateException("a getter that fails");
        }
    }
}
