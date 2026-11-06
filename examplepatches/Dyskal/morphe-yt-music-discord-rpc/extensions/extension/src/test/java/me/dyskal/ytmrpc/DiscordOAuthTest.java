package me.dyskal.ytmrpc;

import okhttp3.OkHttpClient;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import org.junit.Test;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.*;

public class DiscordOAuthTest {
    private static final String APP = "1559278040175878146";
    static MockResponse token(String access) {
        return new MockResponse().setBody("{\"access_token\":\"" + access + "\",\"refresh_token\":\"refresh\","
                + "\"expires_in\":3600,\"token_type\":\"Bearer\",\"scope\":\"openid sdk.social_layer_presence\"}");
    }

    @Test public void pkceMatchesRfc7636AndRejectsInvalidId() throws Exception {
        assertEquals("E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM",
                DiscordOAuth.challenge("dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk"));
        String url = DiscordOAuth.authorizeUrl(APP, "state", DiscordOAuth.randomSecret());
        assertTrue(url.contains("code_challenge_method=S256"));
        assertTrue(url.contains("scope=openid+sdk.social_layer_presence"));
        assertFalse(url.contains("client_secret"));
        assertFalse(DiscordOAuth.isValidApplicationId("not-an-id"));
        assertThrows(DiscordFailure.class, () -> DiscordOAuth.authorizeUrl("bad", "state", "verifier"));
    }

    @Test public void nativeHandoffPreservesPkceStateScopesAndRegisteredRedirectExactly() throws Exception {
        String web = DiscordOAuth.authorizeUrl(APP, "state+with&symbols", "verifier");
        java.net.URI browser = new java.net.URI(web), nativeApp = new java.net.URI(DiscordOAuth.appAuthorizeUrl(web));
        assertEquals("discord", nativeApp.getScheme()); assertEquals("action", nativeApp.getHost());
        assertEquals("/oauth2/authorize", nativeApp.getPath());
        assertEquals(browser.getRawQuery(), nativeApp.getRawQuery());
        assertTrue(nativeApp.getRawQuery().contains("redirect_uri=ytmdiscord%3A%2F%2Foauth2%2Fcallback"));
        assertTrue(nativeApp.getRawQuery().contains("scope=openid+sdk.social_layer_presence"));
        assertTrue(nativeApp.getRawQuery().contains("state=state%2Bwith%26symbols"));
        assertFalse(nativeApp.toString().contains("code_verifier="));
        assertThrows(IllegalArgumentException.class, () -> DiscordOAuth.appAuthorizeUrl("https://discord.com.evil.example/oauth2/authorize?state=x"));
    }

    @Test public void exchangeAndRefreshUsePublicClientForms() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(token("access-one")); server.enqueue(token("access-two"));
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString());
            assertEquals("access-one", oauth.exchange(APP, "code+with&symbols", "verifier").getString("access_token"));
            String form = server.takeRequest().getBody().readUtf8();
            assertTrue(form.contains("code=code%2Bwith%26symbols"));
            assertTrue(form.contains("code_verifier=verifier"));
            assertTrue(form.contains("redirect_uri=ytmdiscord%3A%2F%2Foauth2%2Fcallback"));
            assertFalse(form.contains("client_secret"));
            assertEquals("access-two", oauth.refresh(APP, "refresh").getString("access_token"));
            assertTrue(server.takeRequest().getBody().readUtf8().contains("grant_type=refresh_token"));
        }
    }

    @Test public void invalidGrantStopsRetriesAndNeverLeaksBody() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(new MockResponse().setResponseCode(400)
                    .setBody("{\"error\":\"invalid_grant\",\"error_description\":\"SECRET TOKEN DATA\"}"));
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString());
            DiscordFailure error = assertThrows(DiscordFailure.class, () -> oauth.refresh(APP, "revoked"));
            assertEquals(DiscordFailure.Kind.AUTHORIZATION, error.kind);
            assertFalse(error.isRetryable());
            assertEquals(400, error.httpStatus);
            assertTrue(error.getMessage().contains("invalid_grant"));
            assertFalse(error.getMessage().contains("SECRET"));
        }
    }

    @Test public void serverAndRateLimitErrorsAreTransient() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(new MockResponse().setResponseCode(503).setBody("SECRET"));
            server.enqueue(new MockResponse().setResponseCode(429).addHeader("Retry-After", "3").setBody("{}"));
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString());
            assertTrue(assertThrows(DiscordFailure.class, () -> oauth.refresh(APP, "token")).isRetryable());
            DiscordFailure limited = assertThrows(DiscordFailure.class, () -> oauth.refresh(APP, "token"));
            assertTrue(limited.isRetryable()); assertEquals(3000, limited.retryAfterMillis);
        }
    }

    @Test public void explicitMissingPresenceScopeRequiresConfigurationChange() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(new MockResponse().setBody("{\"access_token\":\"secret\",\"token_type\":\"Bearer\",\"expires_in\":3600,\"scope\":\"openid\"}"));
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString());
            DiscordFailure error = assertThrows(DiscordFailure.class, () -> oauth.exchange(APP, "code", "verifier"));
            assertEquals(DiscordFailure.Kind.CONFIGURATION, error.kind); assertFalse(error.isRetryable());
            assertFalse(error.getMessage().contains("secret"));
        }
    }

    @Test public void knownConfigurationErrorsOverrideStatusAndUnknownCodesStayPrivate() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(new MockResponse().setResponseCode(401).setBody("{\"error\":\"invalid_scope\"}"));
            server.enqueue(new MockResponse().setResponseCode(429).setBody("{\"error\":\"PRIVATE DATA\"}"));
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString());
            assertEquals(DiscordFailure.Kind.CONFIGURATION, assertThrows(DiscordFailure.class, () -> oauth.refresh(APP, "token")).kind);
            DiscordFailure unknown = assertThrows(DiscordFailure.class, () -> oauth.refresh(APP, "token"));
            assertTrue(unknown.isRetryable()); assertFalse(unknown.getMessage().contains("PRIVATE"));
        }
    }

    @Test public void cancellationInterruptsInFlightHttp() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(token("access").setBodyDelay(4, TimeUnit.SECONDS));
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString());
            CompletableFuture<DiscordFailure> result = CompletableFuture.supplyAsync(() -> {
                try { oauth.exchange(APP, "code", "verifier"); return null; }
                catch (Exception error) { return (DiscordFailure) error; }
            });
            assertNotNull(server.takeRequest(3, TimeUnit.SECONDS));
            oauth.cancel();
            assertEquals(DiscordFailure.Kind.CANCELLED, result.get(3, TimeUnit.SECONDS).kind);
        }
    }

    @Test public void redirectsDoNotForwardAuthorizationCodesOrRefreshTokens() throws Exception {
        try (MockWebServer server = new MockWebServer(); MockWebServer destination = new MockWebServer()) {
            destination.enqueue(token("must-not-be-requested"));
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString());
            for (int status : new int[]{302, 307}) {
                server.enqueue(new MockResponse().setResponseCode(status)
                        .addHeader("Location", destination.url("/token")));
                DiscordFailure error = assertThrows(DiscordFailure.class, () -> {
                    if (status == 302) oauth.exchange(APP, "private-code", "private-verifier");
                    else oauth.refresh(APP, "private-refresh");
                });
                assertEquals(status, error.httpStatus);
                assertEquals(DiscordFailure.Kind.CONFIGURATION, error.kind);
            }
            assertEquals(0, destination.getRequestCount());
        }
    }

    @Test public void wholeCallTimeoutLimitsSlowResponses() throws Exception {
        try (MockWebServer server = new MockWebServer()) {
            server.enqueue(token("access").setBodyDelay(2, TimeUnit.SECONDS));
            OkHttpClient http = new OkHttpClient.Builder().callTimeout(250, TimeUnit.MILLISECONDS).build();
            DiscordOAuth oauth = new DiscordOAuth(server.url("/token").toString(), http);
            long started = System.nanoTime();
            assertTrue(assertThrows(DiscordFailure.class, () -> oauth.exchange(APP, "code", "verifier")).isRetryable());
            assertTrue(TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started) < 1500);
        }
    }
}
