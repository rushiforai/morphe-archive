package me.dyskal.ytmrpc;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.junit.Test;
import static org.junit.Assert.*;

public class HttpTest {
    @Test public void derivedClientsShareTransportWithoutFollowingRedirects() {
        var client = Http.CLIENT.newBuilder().build();
        assertSame(Http.CLIENT.connectionPool(), client.connectionPool());
        assertSame(Http.CLIENT.dispatcher(), client.dispatcher());
        assertFalse(client.followRedirects());
        assertFalse(client.followSslRedirects());
    }

    @Test public void responseReadsAreBoundedAndMissingBodiesAreProtocolErrors() throws Exception {
        try (Response response = response(ResponseBody.create(null, new byte[65_536]))) {
            assertEquals(65_536, Http.readBody(response, "Discord test").length());
        }
        try (Response response = response(ResponseBody.create(null, new byte[65_537]))) {
            assertEquals(DiscordFailure.Kind.PROTOCOL,
                    assertThrows(DiscordFailure.class, () -> Http.readBody(response, "Discord test")).kind);
        }
        DiscordFailure missing = assertThrows(DiscordFailure.class, () -> Http.readBody(response(null), "Discord test"));
        assertEquals(DiscordFailure.Kind.PROTOCOL, missing.kind);
        assertEquals("Discord test response was empty", missing.getMessage());
    }

    private static Response response(ResponseBody body) {
        return new Response.Builder().request(new Request.Builder().url("https://discord.com/").build())
                .protocol(Protocol.HTTP_1_1).code(200).message("OK").body(body).build();
    }

    @Test public void utf8ReadsAllowTheByteLimitAndRejectOverflowWithoutLeakingContent() throws Exception {
        byte[] body = "🎵SECRET".getBytes(StandardCharsets.UTF_8);
        assertEquals("🎵SECRET", Http.readLimited(new ByteArrayInputStream(body), body.length));
        DiscordFailure error = assertThrows(DiscordFailure.class,
                () -> Http.readLimited(new ByteArrayInputStream(body), body.length - 1));
        assertEquals(DiscordFailure.Kind.PROTOCOL, error.kind);
        assertFalse(error.getMessage().contains("SECRET"));
        assertEquals("", Http.readLimited(new ByteArrayInputStream(new byte[0]), 0));
    }

    @Test public void retryAfterKeepsCallerMinimumsForMissingInvalidOrShortValues() {
        assertEquals(0, Http.retryAfterMillis(null, 0));
        assertEquals(60_000, Http.retryAfterMillis("invalid", 60_000));
        assertEquals(60_000, Http.retryAfterMillis("-1", 60_000));
        assertEquals(60_000, Http.retryAfterMillis("3", 60_000));
        assertEquals(3500, Http.retryAfterMillis("3.5", 0));
        assertEquals(90_000, Http.retryAfterMillis("90", 60_000));
    }
}
