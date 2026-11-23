package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.junit.Test;

/** The client never reaches the network here: every request goes to a recording fake. */
public class ComposeClientTest {
    private static final String SECRET = "secret-token-value";

    private static final class Recorder implements ComposeClient.Transport {
        final List<URL> urls = new ArrayList<>();
        final List<Map<String, String>> headers = new ArrayList<>();
        ComposeClient.RawResponse response = new ComposeClient.RawResponse(200, "{}");
        IOException failure;

        @Override public ComposeClient.RawResponse get(URL url, Map<String, String> sent) throws IOException {
            urls.add(url);
            headers.add(sent);
            if (failure != null) throw failure;
            return response;
        }
    }

    private static Model.ComposeAuth auth(String storefront) { return new Model.ComposeAuth(SECRET, "device-1", storefront, "user|us"); }

    @Test public void homeSendsTheStorefrontAndTheCapsThePhonesOwnRequestSends() {
        Recorder transport = new Recorder();
        new ComposeClient(transport).fetch("home", auth("us"));
        assertEquals("https://api.eclipsemusic.app/api/compose/home?storefront=us&caps=linkedRows:2,linkedPlaylists:2",
            transport.urls.get(0).toString());
    }

    @Test public void theAutoStorefrontIsOmittedAndDiscoverHasNoCaps() {
        Recorder transport = new Recorder();
        ComposeClient client = new ComposeClient(transport);
        client.fetch("home", auth("auto"));
        client.fetch("discover", auth("auto"));
        client.fetch("discover", auth("nl"));
        assertEquals("https://api.eclipsemusic.app/api/compose/home?caps=linkedRows:2,linkedPlaylists:2", transport.urls.get(0).toString());
        assertEquals("https://api.eclipsemusic.app/api/compose/discover", transport.urls.get(1).toString());
        assertEquals("https://api.eclipsemusic.app/api/compose/discover?storefront=nl", transport.urls.get(2).toString());
    }

    @Test public void aStorefrontThatIsNotASimpleCodeIsNotSent() {
        assertEquals("https://api.eclipsemusic.app/api/compose/discover", ComposeClient.url("discover", "us&evil=1"));
        assertEquals("https://api.eclipsemusic.app/api/compose/discover", ComposeClient.url("discover", ""));
    }

    @Test public void theRequestCarriesTheBearerTokenDeviceIdAndAcceptHeaderOnly() {
        Recorder transport = new Recorder();
        new ComposeClient(transport).fetch("home", auth("us"));
        Map<String, String> sent = transport.headers.get(0);
        assertEquals("Bearer " + SECRET, sent.get("Authorization"));
        assertEquals("device-1", sent.get("X-Device-Id"));
        assertEquals("application/json", sent.get("Accept"));
        assertEquals(3, sent.size());
        assertFalse("the token must never be put in the URL", transport.urls.get(0).toString().contains(SECRET));
    }

    @Test public void statusCodesMapToTheStatesOfDesignSectionFour() {
        Recorder transport = new Recorder();
        ComposeClient client = new ComposeClient(transport);
        transport.response = new ComposeClient.RawResponse(200, "{\"rows\":[]}");
        assertEquals(ComposeClient.Status.OK, client.fetch("home", auth("us")).status);
        assertEquals("{\"rows\":[]}", client.fetch("home", auth("us")).body);
        transport.response = new ComposeClient.RawResponse(401, null);
        assertEquals(ComposeClient.Status.UNAUTHORIZED, client.fetch("home", auth("us")).status);
        transport.response = new ComposeClient.RawResponse(403, null);
        assertEquals(ComposeClient.Status.UNAUTHORIZED, client.fetch("home", auth("us")).status);
        transport.response = new ComposeClient.RawResponse(503, null);
        assertEquals(ComposeClient.Status.DISABLED, client.fetch("home", auth("us")).status);
        transport.response = new ComposeClient.RawResponse(500, null);
        assertEquals(ComposeClient.Status.FAILED, client.fetch("home", auth("us")).status);
        transport.response = new ComposeClient.RawResponse(200, null);
        assertEquals("a success without a body is a failure", ComposeClient.Status.FAILED, client.fetch("home", auth("us")).status);
    }

    @Test public void noNetworkIsAFailureNotACrash() {
        Recorder transport = new Recorder();
        transport.failure = new IOException("offline");
        ComposeClient.Response response = new ComposeClient(transport).fetch("home", auth("us"));
        assertEquals(ComposeClient.Status.FAILED, response.status);
        assertNull(response.body);
    }

    @Test public void aSignedOutAuthNeverReachesTheTransport() {
        Recorder transport = new Recorder();
        ComposeClient.Response response = new ComposeClient(transport).fetch("home", new Model.ComposeAuth(null, "d", "us", "k"));
        assertEquals(ComposeClient.Status.UNAUTHORIZED, response.status);
        assertTrue(transport.urls.isEmpty());
    }

    @Test public void theRealTransportUsesThePinnedTimeouts() {
        assertEquals(15000, ComposeClient.CONNECT_TIMEOUT_MS);
        assertEquals(30000, ComposeClient.READ_TIMEOUT_MS);
    }

    @Test public void printingTheAuthNeverRevealsTheToken() {
        assertFalse(auth("us").toString().contains(SECRET));
        assertTrue(auth("us").toString().contains("redacted"));
        assertEquals("ComposeAuth[signed out]", new Model.ComposeAuth(null, null, null, null).toString());
        assertEquals("android_unknown", new Model.ComposeAuth("t", null, null, null).deviceId);
    }
}
