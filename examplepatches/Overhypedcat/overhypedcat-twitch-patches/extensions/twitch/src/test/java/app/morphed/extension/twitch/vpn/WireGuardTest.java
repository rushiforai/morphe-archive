package app.morphed.extension.twitch.vpn;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.security.SecureRandom;
import java.util.Base64;

import app.morphed.extension.twitch.net.Web;
import app.morphed.extension.twitch.vpn.crypto.X25519;

/** WireGuard configs, the replay window and HTTP answers through the tunnel. */
public class WireGuardTest {
    private static String key() {
        return Base64.getEncoder().encodeToString(X25519.generatePrivateKey(new SecureRandom()));
    }

    private static String config(String extra) {
        return "[Interface]\n# Key for test\nPrivateKey = " + key() + "\nAddress = 10.2.0.2/32, fd00::2/128\nDNS = 10.2.0.1\n"
                + extra + "\n[Peer]\nPublicKey = " + key() + "\nAllowedIPs = 0.0.0.0/0\nEndpoint = 203.0.113.5:51820\n";
    }

    @Test
    public void readsAProviderConfig() {
        WgConfig config = WgConfig.parse("NL-1", config("MTU = 1380"));
        assertEquals("NL-1", config.name);
        assertArrayEquals(new byte[]{10, 2, 0, 2}, config.address);
        assertArrayEquals(new byte[]{10, 2, 0, 1}, config.dns);
        assertEquals("203.0.113.5", config.endpointHost);
        assertEquals(51820, config.endpointPort);
        assertEquals(1380, config.mtu);
        assertArrayEquals(new byte[32], config.presharedKey);
    }

    @Test
    public void refusesWhatIsNotAUsableConfig() {
        String[] broken = {
                "hello",
                config("").replace("Endpoint = 203.0.113.5:51820", ""),
                config("").replace("Address = 10.2.0.2/32, fd00::2/128", "Address = fd00::2/128"),
                "[Interface]\nPrivateKey = short\nAddress = 10.0.0.2/32\n[Peer]\nPublicKey = " + key() + "\nEndpoint = a:1\n"};
        for (String text : broken) {
            try {
                WgConfig.parse("x", text);
                fail("accepted: " + text);
            } catch (IllegalArgumentException expected) {
                assertTrue(expected.getMessage(), expected.getMessage().length() > 3);
            }
        }
    }

    @Test
    public void replayWindowTakesEachCounterOnce() {
        WireGuard.Replay replay = new WireGuard.Replay();
        assertTrue(replay.accept(0));
        assertTrue(replay.accept(2));
        assertTrue(replay.accept(1)); // late but new
        assertFalse(replay.accept(1)); // seen
        assertTrue(replay.accept(5000));
        assertFalse(replay.accept(100)); // too far behind the window
        assertTrue(replay.accept(4999));
        assertFalse(replay.accept(-1));
    }

    private static InputStream stream(String text) {
        return new java.io.ByteArrayInputStream(text.getBytes(java.nio.charset.StandardCharsets.ISO_8859_1));
    }

    @Test
    public void readsHttpAnswersWithLengthOrChunks() throws IOException {
        Web.Response plain = TunnelWeb.readResponse(stream("HTTP/1.1 200 OK\r\nContent-Length: 5\r\nContent-Type: x\r\n\r\nhello"), "GET");
        assertEquals(200, plain.status);
        assertEquals("hello", plain.text());
        assertEquals("x", plain.header("content-type"));

        Web.Response chunked = TunnelWeb.readResponse(stream(
                "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n6;x=y\r\n world\r\n0\r\n\r\n"), "GET");
        assertEquals("hello world", chunked.text());

        Web.Response empty = TunnelWeb.readResponse(stream("HTTP/1.1 204 No Content\r\n\r\n"), "GET");
        assertEquals(0, empty.body.length);

        Web.Response untilClose = TunnelWeb.readResponse(stream("HTTP/1.0 404 Not Found\r\n\r\nnope"), "GET");
        assertEquals(404, untilClose.status);
        assertEquals("close", untilClose.header("Connection"));
    }

    @Test(expected = IOException.class)
    public void anAnswerThatEndsEarlyIsAnError() throws IOException {
        TunnelWeb.readResponse(stream("HTTP/1.1 200 OK\r\nContent-Length: 50\r\n\r\nshort"), "GET");
    }

    @Test
    public void skipsInterimAnswers() throws IOException {
        String crlf = "\r\n";
        Web.Response answer = TunnelWeb.readResponse(stream("HTTP/1.1 100 Continue" + crlf + crlf
                + "HTTP/1.1 103 Early Hints" + crlf + "Link: x" + crlf + crlf
                + "HTTP/1.1 200 OK" + crlf + "Content-Length: 2" + crlf + crlf + "ok"), "GET");
        assertEquals(200, answer.status);
        assertEquals("ok", answer.text());
    }

    @Test(expected = IOException.class)
    public void aBrokenStatusLineIsAnIoError() throws IOException {
        TunnelWeb.readResponse(stream("HTTP/1.1 abc OK\r\n\r\n"), "GET");
    }
}
