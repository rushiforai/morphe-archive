package me.dyskal.ytmrpc;

import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import org.json.JSONObject;
import org.junit.Test;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
import static org.junit.Assert.*;

public class DiscordExternalAssetsTest {
    private static final String APP = "1559278040175878146";
    private static final String IMAGE = "https://lh3.googleusercontent.com/cover";
    private static MockResponse asset(String path) { return new MockResponse().setBody("[{\"external_asset_path\":\"external/" + path + "\"}]"); }

    @Test public void resolvesBearerArtworkAndCachesPerApplication() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(asset("one")); server.enqueue(asset("two"));
            DiscordExternalAssets resolver = new DiscordExternalAssets(server.url("/applications/").toString());
            assertEquals("mp:external/one", resolver.resolve(APP, "oauth-token", IMAGE));
            var request = server.takeRequest();
            assertEquals("Bearer oauth-token", request.getHeader("Authorization"));
            assertEquals("/applications/" + APP + "/external-assets", request.getPath());
            assertEquals(IMAGE, new JSONObject(request.getBody().readUtf8()).getJSONArray("urls").getString(0));
            assertEquals("mp:external/one", resolver.resolve(APP, "oauth-token", IMAGE));
            assertEquals(1, server.getRequestCount());
            assertEquals("mp:external/two", resolver.resolve("123456789012345678", "other-token", IMAGE));
            assertEquals(2, server.getRequestCount());
        }
    }

    @Test public void artworkRejectionIsNonAuthAndHasCooldownWithoutLeakingBody() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(new MockResponse().setResponseCode(403).setBody("PRIVATE BODY WITH TOKENS"));
            DiscordExternalAssets resolver = new DiscordExternalAssets(server.url("/applications/").toString());
            DiscordFailure failure = assertThrows(DiscordFailure.class, () -> resolver.resolve(APP, "token", IMAGE));
            assertEquals(DiscordFailure.Kind.CONFIGURATION, failure.kind); assertEquals(403, failure.httpStatus);
            assertFalse(failure.getMessage().contains("PRIVATE")); assertFalse(resolver.canRequest(APP, IMAGE));
            assertNull(resolver.cached(APP, IMAGE));
            assertEquals(failure.getMessage(), resolver.cachedFailure(APP, IMAGE).getMessage());
        }
    }

    @Test public void cancellationAllowsAnImmediateRetryAndLocalUrisAreRejected() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(asset("slow").setBodyDelay(2, TimeUnit.SECONDS));
            DiscordExternalAssets resolver = new DiscordExternalAssets(server.url("/applications/").toString());
            CompletableFuture<DiscordFailure> result = CompletableFuture.supplyAsync(() -> {
                try { resolver.resolve(APP, "token", IMAGE); return null; }
                catch (Exception failure) { return (DiscordFailure) failure; }
            });
            assertNotNull(server.takeRequest(3, TimeUnit.SECONDS)); resolver.cancel();
            assertEquals(DiscordFailure.Kind.CANCELLED, result.get(3, TimeUnit.SECONDS).kind);
            assertTrue(resolver.canRequest(APP, IMAGE));
            assertThrows(DiscordFailure.class, () -> resolver.resolve(APP, "token", "content://local/image"));
        }
    }

    @Test public void redirectsDoNotForwardBearerCredentials() throws Exception {
        try (MockWebServer server = new MockWebServer(); MockWebServer destination = new MockWebServer()) {
            destination.enqueue(asset("must-not-be-requested"));
            server.enqueue(new MockResponse().setResponseCode(307)
                    .addHeader("Location", destination.url("/external-assets")));
            DiscordExternalAssets resolver = new DiscordExternalAssets(server.url("/applications/").toString());
            DiscordFailure error = assertThrows(DiscordFailure.class, () -> resolver.resolve(APP, "private-token", IMAGE));
            assertEquals(307, error.httpStatus);
            assertEquals(DiscordFailure.Kind.CONFIGURATION, error.kind);
            assertEquals(0, destination.getRequestCount());
        }
    }
}
