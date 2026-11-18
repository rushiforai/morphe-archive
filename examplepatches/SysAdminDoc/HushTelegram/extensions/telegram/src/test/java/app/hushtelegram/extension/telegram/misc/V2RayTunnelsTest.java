/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import app.hushtelegram.extension.telegram.misc.V2RayFakes.Fake;
import app.hushtelegram.extension.telegram.misc.V2RayFakes.Heard;
import app.hushtelegram.extension.telegram.misc.V2RayFakes.TestCert;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicReference;
import javax.net.ssl.TrustManager;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Each kind of link through {@link V2RayDialer} and {@link V2RayTunnels} to a fake server on
 * 127.0.0.1 that speaks the protocol from its spec: TCP and WebSocket, with and without TLS.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class V2RayTunnelsTest {
    private static final String ID = "b831381d-6324-4d53-ad4f-8cda48b30811";
    private static final String PASSWORD = "pass word";
    /** One of Telegram's own data centers, as Telegram asks for it. */
    private static final byte[] DC = {(byte) 149, (byte) 154, (byte) 167, 51};
    private static final byte[] DC_V6 = {0x20, 0x01, 0x06, 0x7c, 0x04, (byte) 0xe8, (byte) 0xf0, 0x04,
            0, 0, 0, 0, 0, 0, 0, 0x0a};

    private final List<Closeable> open = new ArrayList<>();
    private TrustManager[] trustedBefore;

    @Before
    public void trustTheTestCertificate() throws Exception {
        trustedBefore = V2RayDialer.trusted;
        V2RayDialer.trusted = TestCert.get().trust();
    }

    @After
    public void closeEverything() {
        for (Closeable closeable : open) {
            try {
                closeable.close();
            } catch (IOException ignored) {
                // Already gone.
            }
        }
        V2RayDialer.trusted = trustedBefore;
        V2RayLinks.chacha = null;
    }

    // ---- Shadowsocks --------------------------------------------------------------------------------

    @Test
    public void shadowsocksCarriesEachCipherBothWays() throws Exception {
        for (String cipher : new String[]{"aes-128-gcm", "aes-256-gcm", "chacha20-ietf-poly1305"}) {
            Fake fake = fake(V2RayLinks.SS, PASSWORD, cipher, false, false);
            String user = Base64.getUrlEncoder().withoutPadding()
                    .encodeToString((cipher + ":" + PASSWORD).getBytes(StandardCharsets.UTF_8));
            byte[] early = payload(64, 1);
            // Past two of Shadowsocks's 16383-byte chunks.
            byte[] rest = payload(40_000, 2);
            V2RayTunnels.Tunnel tunnel = open("ss://" + user + "@127.0.0.1:" + fake.port() + "#" + cipher,
                    new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443), early);
            assertArrayEquals(cipher, concat(early, rest), roundTrip(tunnel, early.length, rest));
            Heard heard = fake.next();
            assertNull(cipher + ": " + heard.failure, heard.failure);
            assertEquals(V2RayTunnels.Target.IPV4, heard.type);
            assertArrayEquals(DC, heard.address);
            assertEquals(443, heard.port);
            assertArrayEquals(concat(early, rest), heard.data());
        }
    }

    @Test
    public void shadowsocksWithTheWrongPasswordGetsNothingBack() throws Exception {
        Fake fake = fake(V2RayLinks.SS, "the right one", "aes-256-gcm", false, false);
        V2RayTunnels.Tunnel tunnel = open("ss://aes-256-gcm:the%20wrong%20one@127.0.0.1:" + fake.port(),
                V2RayTunnels.Target.domain("venus.web.telegram.org", 443), ascii("hello"));
        assertEndsOrFails(tunnel.in);
        assertNotNull("the server can't open the first chunk", fake.next().failure);
    }

    @Test
    public void shadowsocksSaltsEveryConnectionAfresh() throws Exception {
        Fake fake = fake(V2RayLinks.SS, PASSWORD, "aes-128-gcm", false, false);
        String link = "ss://aes-128-gcm:pass%20word@127.0.0.1:" + fake.port();
        for (int i = 0; i < 3; i++) {
            byte[] early = ascii("same bytes each time");
            V2RayTunnels.Tunnel tunnel = open(link, V2RayTunnels.Target.domain("venus.web.telegram.org", 443), early);
            assertArrayEquals(early, roundTrip(tunnel, early.length, new byte[0]));
            assertNull(fake.next().failure);
        }
    }

    // ---- Trojan -------------------------------------------------------------------------------------

    @Test
    public void trojanOverTlsSendsTheSniAndTheLinksAlpn() throws Exception {
        Fake fake = fake(V2RayLinks.TROJAN, PASSWORD, "", true, false);
        byte[] early = payload(200, 3);
        byte[] rest = payload(70_000, 4);
        V2RayTunnels.Tunnel tunnel = open("trojan://pass%20word@127.0.0.1:" + fake.port()
                        + "?sni=" + TestCert.NAME + "&alpn=h2,http%2F1.1#T",
                V2RayTunnels.Target.domain("venus.web.telegram.org", 443), early);
        assertArrayEquals(concat(early, rest), roundTrip(tunnel, early.length, rest));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertEquals(TestCert.NAME, heard.sni);
        assertEquals("h2", heard.alpn);
        assertEquals(V2RayTunnels.Target.DOMAIN, heard.type);
        assertEquals("venus.web.telegram.org", new String(heard.address, StandardCharsets.US_ASCII));
        assertEquals(443, heard.port);
    }

    @Test
    public void trojanOverAWebSocketUnderTlsAnswersPings() throws Exception {
        Fake fake = fake(V2RayLinks.TROJAN, PASSWORD, "", true, true);
        byte[] early = payload(41, 5);
        byte[] rest = payload(30_000, 6);
        V2RayTunnels.Tunnel tunnel = open("trojan://pass%20word@127.0.0.1:" + fake.port()
                        + "?type=ws&path=%2Ftj%3Fed%3D2048&host=cdn.hush.test&sni=" + TestCert.NAME,
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV6, DC_V6, 443), early);
        assertArrayEquals(concat(early, rest), roundTrip(tunnel, early.length, rest));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertEquals("/tj", heard.path);
        assertEquals("cdn.hush.test", heard.host);
        assertEquals(TestCert.NAME, heard.sni);
        assertEquals("a WebSocket only speaks HTTP/1.1", "http/1.1", heard.alpn);
        assertTrue("the ping before the data got its pong", heard.pongs >= 1);
        assertEquals(V2RayTunnels.Target.IPV6, heard.type);
        assertArrayEquals(DC_V6, heard.address);
    }

    @Test
    public void aServerAddressedByIpIsCheckedAgainstTheCertificatesIpWithNoSni() throws Exception {
        Fake fake = fake(V2RayLinks.TROJAN, PASSWORD, "", true, false);
        V2RayTunnels.Tunnel tunnel = open("trojan://pass%20word@127.0.0.1:" + fake.port(),
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 80), ascii("x"));
        assertArrayEquals(ascii("x"), roundTrip(tunnel, 1, new byte[0]));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertNull("an IP address isn't a server name", heard.sni);
    }

    @Test
    public void aCertificateForAnotherNameIsRefused() throws Exception {
        Fake fake = fake(V2RayLinks.TROJAN, PASSWORD, "", true, false);
        V2RayLinks.Server server = V2RayLinks.parseLink("trojan://pw@127.0.0.1:" + fake.port() + "?sni=other.test");
        assertDialFails(server);
        assertNotNull(fake.next().failure);
    }

    @Test
    public void aCertificateNoAuthorityVouchesForIsRefused() throws Exception {
        V2RayDialer.trusted = null;
        Fake fake = fake(V2RayLinks.TROJAN, PASSWORD, "", true, false);
        assertDialFails(V2RayLinks.parseLink("trojan://pw@127.0.0.1:" + fake.port() + "?sni=" + TestCert.NAME));
        assertNotNull(fake.next().failure);
    }

    @Test
    public void allowInsecureTakesAnyCertificateAsThePersonAsked() throws Exception {
        V2RayDialer.trusted = null;
        Fake fake = fake(V2RayLinks.TROJAN, PASSWORD, "", true, false);
        V2RayTunnels.Tunnel tunnel = open("trojan://pass%20word@127.0.0.1:" + fake.port() + "?sni=other.test&allowInsecure=1",
                V2RayTunnels.Target.domain("venus.web.telegram.org", 443), ascii("insecure"));
        assertArrayEquals(ascii("insecure"), roundTrip(tunnel, 8, new byte[0]));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertEquals("other.test", heard.sni);
    }

    @Test
    public void trojanWithTheWrongPasswordIsDropped() throws Exception {
        Fake fake = fake(V2RayLinks.TROJAN, "the right one", "", true, false);
        V2RayTunnels.Tunnel tunnel = open("trojan://wrong@127.0.0.1:" + fake.port() + "?sni=" + TestCert.NAME,
                V2RayTunnels.Target.domain("venus.web.telegram.org", 443), ascii("hello"));
        assertEndsOrFails(tunnel.in);
        assertEquals("wrong password", fake.next().failure.getMessage());
    }

    // ---- VLESS --------------------------------------------------------------------------------------

    @Test
    public void vlessOverPlainTcp() throws Exception {
        Fake fake = fake(V2RayLinks.VLESS, ID, "", false, false);
        byte[] rest = payload(50_000, 7);
        V2RayTunnels.Tunnel tunnel = open("vless://" + ID + "@127.0.0.1:" + fake.port() + "?type=tcp&security=none",
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV6, DC_V6, 443), new byte[0]);
        assertArrayEquals("nothing sent first is fine too", rest, roundTrip(tunnel, 0, rest));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertEquals(V2RayTunnels.Target.IPV6, heard.type);
        assertArrayEquals(DC_V6, heard.address);
        assertEquals(443, heard.port);
    }

    @Test
    public void vlessOverTlsAndTcp() throws Exception {
        Fake fake = fake(V2RayLinks.VLESS, ID, "", true, false);
        byte[] early = payload(100, 8);
        V2RayTunnels.Tunnel tunnel = open("vless://" + ID + "@127.0.0.1:" + fake.port() + "?security=tls&sni=" + TestCert.NAME,
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443), early);
        assertArrayEquals(early, roundTrip(tunnel, early.length, new byte[0]));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertEquals(TestCert.NAME, heard.sni);
        assertArrayEquals(DC, heard.address);
    }

    @Test
    public void vlessOverAPlainWebSocketNamesTheServerAndPortInHost() throws Exception {
        Fake fake = fake(V2RayLinks.VLESS, ID, "", false, true);
        byte[] early = payload(10, 9);
        byte[] rest = payload(20_000, 10);
        V2RayTunnels.Tunnel tunnel = open("vless://" + ID + "@127.0.0.1:" + fake.port() + "?type=ws&path=/v",
                V2RayTunnels.Target.domain("pluto.web.telegram.org", 80), early);
        assertArrayEquals(concat(early, rest), roundTrip(tunnel, early.length, rest));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertEquals("/v", heard.path);
        assertEquals("127.0.0.1:" + fake.port(), heard.host);
        assertEquals(V2RayTunnels.Target.DOMAIN, heard.type);
        assertEquals("pluto.web.telegram.org", new String(heard.address, StandardCharsets.US_ASCII));
        assertEquals(80, heard.port);
    }

    @Test
    public void vlessOverAWebSocketUnderTlsSendsTheSniAsHost() throws Exception {
        Fake fake = fake(V2RayLinks.VLESS, ID, "", true, true);
        byte[] early = payload(10, 11);
        V2RayTunnels.Tunnel tunnel = open("vless://" + ID + "@127.0.0.1:" + fake.port()
                        + "?security=tls&type=ws&path=%2Fw&sni=" + TestCert.NAME + "&alpn=h2",
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443), early);
        assertArrayEquals(early, roundTrip(tunnel, early.length, new byte[0]));
        Heard heard = fake.next();
        assertNull(String.valueOf(heard.failure), heard.failure);
        assertEquals("/w", heard.path);
        assertEquals(TestCert.NAME + ":" + fake.port(), heard.host);
        assertEquals("a WebSocket offers HTTP/1.1 whatever the link says", "http/1.1", heard.alpn);
    }

    @Test
    public void vlessWithAnotherIdIsDropped() throws Exception {
        Fake fake = fake(V2RayLinks.VLESS, ID, "", false, false);
        V2RayTunnels.Tunnel tunnel = open("vless://" + "00000000-0000-0000-0000-000000000001@127.0.0.1:" + fake.port(),
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443), ascii("hi"));
        assertEndsOrFails(tunnel.in);
        assertEquals("wrong id", fake.next().failure.getMessage());
    }

    // ---- VMess --------------------------------------------------------------------------------------

    @Test
    public void vmessSealsTheBodyAsTheLinkAsks() throws Exception {
        String[][] cases = {{"aes-128-gcm", "3", "5"}, {"chacha20-poly1305", "4", "5"}, {"none", "5", "5"}, {"zero", "5", "0"}};
        for (String[] each : cases) {
            Fake fake = fake(V2RayLinks.VMESS, ID, "", false, false);
            byte[] early = payload(300, 12);
            // Past VMess's 8000-byte chunks both ways.
            byte[] rest = payload(30_000, 13);
            V2RayTunnels.Tunnel tunnel = open("vmess://" + ID + "@127.0.0.1:" + fake.port() + "?type=tcp&security=none&scy=" + each[0],
                    new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443), early);
            assertArrayEquals(each[0], concat(early, rest), roundTrip(tunnel, early.length, rest));
            Heard heard = fake.next();
            assertNull(each[0] + ": " + heard.failure, heard.failure);
            assertEquals(each[0], Integer.parseInt(each[1]), heard.vmessSecurity);
            assertEquals(each[0], Integer.parseInt(each[2]), heard.vmessOptions);
            assertArrayEquals(DC, heard.address);
            assertEquals(443, heard.port);
            assertArrayEquals(concat(early, rest), heard.data());
        }
    }

    @Test
    public void vmessOverAWebSocketWithAndWithoutTls() throws Exception {
        for (boolean tls : new boolean[]{false, true}) {
            Fake fake = fake(V2RayLinks.VMESS, ID, "", tls, true);
            String json = "{\"v\":\"2\",\"ps\":\"W\",\"add\":\"127.0.0.1\",\"port\":\"" + fake.port() + "\",\"id\":\"" + ID
                    + "\",\"aid\":\"0\",\"net\":\"ws\",\"path\":\"/ray\",\"host\":\"" + TestCert.NAME + "\""
                    + (tls ? ",\"tls\":\"tls\",\"sni\":\"" + TestCert.NAME + "\"" : "") + "}";
            byte[] early = payload(77, 14);
            byte[] rest = payload(25_000, 15);
            V2RayTunnels.Tunnel tunnel = open("vmess://" + Base64.getEncoder().encodeToString(json.getBytes(StandardCharsets.UTF_8)),
                    new V2RayTunnels.Target(V2RayTunnels.Target.IPV6, DC_V6, 443), early);
            assertArrayEquals(concat(early, rest), roundTrip(tunnel, early.length, rest));
            Heard heard = fake.next();
            assertNull(tls + ": " + heard.failure, heard.failure);
            assertEquals("/ray", heard.path);
            assertEquals(TestCert.NAME, heard.host);
            assertEquals(tls ? TestCert.NAME : null, heard.sni);
            assertArrayEquals(DC_V6, heard.address);
            assertTrue(heard.pongs >= 1);
        }
    }

    @Test
    public void vmessRefusesAnAnswerToSomeoneElsesRequest() throws Exception {
        Fake fake = fake(V2RayLinks.VMESS, ID, "", false, false);
        fake.wrongCheck = true;
        V2RayTunnels.Tunnel tunnel = open("vmess://" + ID + "@127.0.0.1:" + fake.port() + "?scy=aes-128-gcm",
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443), ascii("hello"));
        try {
            tunnel.in.read();
            fail("an answer with the wrong check byte was read");
        } catch (IOException expected) {
            // The answer doesn't belong to this request.
        }
    }

    @Test
    public void vmessWithAnotherIdIsDropped() throws Exception {
        Fake fake = fake(V2RayLinks.VMESS, ID, "", false, false);
        V2RayTunnels.Tunnel tunnel = open("vmess://" + "00000000-0000-0000-0000-000000000001@127.0.0.1:" + fake.port(),
                new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443), ascii("hi"));
        assertEndsOrFails(tunnel.in);
        assertNotNull(fake.next().failure);
    }

    // ---- WebSocket refusals and ends ----------------------------------------------------------------

    @Test
    public void aWebSocketAnswerWithTheWrongAcceptKeyIsRefused() throws Exception {
        Fake fake = fake(V2RayLinks.VLESS, ID, "", false, true);
        fake.wrongAccept = true;
        IOException failure = assertDialFails(V2RayLinks.parseLink("vless://" + ID + "@127.0.0.1:" + fake.port() + "?type=ws"));
        assertEquals("the WebSocket answer doesn't match", failure.getMessage());
    }

    @Test
    public void aServerThatWontUpgradeIsRefused() throws Exception {
        Fake fake = fake(V2RayLinks.VLESS, ID, "", false, true);
        fake.refuseUpgrade = true;
        IOException failure = assertDialFails(V2RayLinks.parseLink("vless://" + ID + "@127.0.0.1:" + fake.port() + "?type=ws&path=/nope"));
        assertEquals("the server didn't take the WebSocket", failure.getMessage());
        assertEquals("/nope", fake.next().path);
    }

    @Test
    public void theDestinationEndingReadsAsTheEndForEveryKind() throws Exception {
        Object[][] cases = {
                {V2RayLinks.SS, PASSWORD, "aes-256-gcm", false, false, "ss://aes-256-gcm:pass%20word@127.0.0.1:PORT"},
                {V2RayLinks.VMESS, ID, "", false, true, "vmess://" + ID + "@127.0.0.1:PORT?type=ws"},
                {V2RayLinks.VMESS, ID, "", false, false, "vmess://" + ID + "@127.0.0.1:PORT?scy=zero"},
                {V2RayLinks.VLESS, ID, "", true, true, "vless://" + ID + "@127.0.0.1:PORT?type=ws&security=tls&sni=" + TestCert.NAME},
                {V2RayLinks.TROJAN, PASSWORD, "", true, false, "trojan://pass%20word@127.0.0.1:PORT?sni=" + TestCert.NAME},
        };
        for (Object[] each : cases) {
            Fake fake = fake((String) each[0], (String) each[1], (String) each[2], (Boolean) each[3], (Boolean) each[4]);
            fake.destination = V2RayFakes.says(5, "bye");
            // Not String.format: the links' own %20 would read as a format.
            V2RayTunnels.Tunnel tunnel = open(((String) each[5]).replace("PORT", String.valueOf(fake.port())),
                    V2RayTunnels.Target.domain("venus.web.telegram.org", 443), ascii("hello"));
            assertEquals(each[5].toString(), "bye", new String(readToEnd(tunnel.in), StandardCharsets.US_ASCII));
            Heard heard = fake.next();
            assertNull(each[5] + ": " + heard.failure, heard.failure);
            assertArrayEquals(ascii("hello"), heard.data());
        }
    }

    // ---- Pieces -------------------------------------------------------------------------------------

    @Test
    public void targetsWriteBothAddressForms() {
        V2RayTunnels.Target v4 = new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443);
        assertArrayEquals(new byte[]{1, (byte) 149, (byte) 154, (byte) 167, 51, 1, (byte) 0xbb}, v4.socks());
        assertArrayEquals(new byte[]{1, (byte) 0xbb, 1, (byte) 149, (byte) 154, (byte) 167, 51}, v4.portFirst());
        V2RayTunnels.Target name = V2RayTunnels.Target.domain("a.io", 80);
        assertArrayEquals(new byte[]{3, 4, 'a', '.', 'i', 'o', 0, 80}, name.socks());
        assertArrayEquals(new byte[]{0, 80, 2, 4, 'a', '.', 'i', 'o'}, name.portFirst());
        V2RayTunnels.Target v6 = new V2RayTunnels.Target(V2RayTunnels.Target.IPV6, DC_V6, 5222);
        assertEquals(4, v6.socks()[0]);
        assertEquals(19, v6.socks().length);
        assertEquals(3, v6.portFirst()[2]);
        assertEquals(0x14, v6.portFirst()[0]);
        assertEquals(0x66, v6.portFirst()[1]);
    }

    @Test
    public void targetsThatCantBeWrittenAreRefused() {
        int[][] wrong = {{V2RayTunnels.Target.IPV4, 3, 1}, {V2RayTunnels.Target.IPV6, 4, 1}, {V2RayTunnels.Target.DOMAIN, 0, 1},
                {V2RayTunnels.Target.DOMAIN, 256, 1}, {2, 4, 1}, {V2RayTunnels.Target.IPV4, 4, -1}, {V2RayTunnels.Target.IPV4, 4, 65536}};
        for (int[] each : wrong) {
            try {
                new V2RayTunnels.Target(each[0], new byte[each[1]], each[2]);
                fail("took type " + each[0] + " with " + each[1] + " bytes and port " + each[2]);
            } catch (IllegalArgumentException expected) {
                // Not a destination.
            }
        }
    }

    @Test
    public void theHostHeaderLeavesOutTheUsualPort() throws Exception {
        assertEquals("cdn.example", V2RayDialer.hostHeader(V2RayLinks.parseLink("vless://" + ID + "@h.example:443?type=ws&security=tls&host=cdn.example")));
        assertEquals("s.example", V2RayDialer.hostHeader(V2RayLinks.parseLink("vless://" + ID + "@h.example:443?type=ws&security=tls&sni=s.example")));
        assertEquals("h.example", V2RayDialer.hostHeader(V2RayLinks.parseLink("vless://" + ID + "@h.example:80?type=ws")));
        assertEquals("h.example:8080", V2RayDialer.hostHeader(V2RayLinks.parseLink("vless://" + ID + "@h.example:8080?type=ws")));
        assertEquals("[2001:db8::1]:8443", V2RayDialer.hostHeader(V2RayLinks.parseLink("vless://" + ID + "@[2001:db8::1]:8443?type=ws&security=tls")));
        assertTrue(V2RayDialer.literal("127.0.0.1"));
        assertTrue(V2RayDialer.literal("2001:db8::1"));
        assertFalse(V2RayDialer.literal("hush.test"));
        assertFalse(V2RayDialer.literal("1.2.3.example"));
    }

    @Test
    public void shadowsocksNoncesCountUpLittleEndian() {
        byte[] nonce = new byte[12];
        V2RayTunnels.increment(nonce);
        assertArrayEquals(new byte[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, nonce);
        nonce[0] = (byte) 0xff;
        V2RayTunnels.increment(nonce);
        assertArrayEquals(new byte[]{0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, nonce);
    }

    // ---- Helpers ------------------------------------------------------------------------------------

    private Fake fake(String kind, String secret, String cipher, boolean tls, boolean ws) throws IOException {
        Fake fake = new Fake(kind, secret, cipher, tls, ws);
        open.add(fake);
        return fake;
    }

    private V2RayTunnels.Tunnel open(String link, V2RayTunnels.Target target, byte[] early) throws Exception {
        V2RayLinks.Server server = V2RayLinks.parseLink(link);
        V2RayTunnels.Wire wire;
        try {
            wire = V2RayDialer.dial(server);
        } catch (IOException dropped) {
            // The client only sees the connection drop. The fake knows why.
            for (Closeable each : open) {
                if (each instanceof Fake && ((Fake) each).lastFailure != null) dropped.addSuppressed(((Fake) each).lastFailure);
            }
            throw dropped;
        }
        open.add(wire);
        V2RayTunnels.Tunnel tunnel = V2RayTunnels.open(server, wire, target, early);
        open.add(tunnel);
        return tunnel;
    }

    private static IOException assertDialFails(V2RayLinks.Server server) {
        try {
            V2RayDialer.dial(server).close();
        } catch (IOException expected) {
            return expected;
        }
        throw new AssertionError("the connection was set up");
    }

    /**
     * Sends [rest] from another thread while this one reads back what the echo sends, so neither side
     * waits on a full buffer, then closes the tunnel.
     */
    private static byte[] roundTrip(V2RayTunnels.Tunnel tunnel, int earlyLength, byte[] rest) throws Exception {
        AtomicReference<Throwable> writing = new AtomicReference<>();
        Thread writer = new Thread(() -> {
            try {
                for (int at = 0; at < rest.length; at += 6000) {
                    tunnel.out.write(rest, at, Math.min(6000, rest.length - at));
                }
                tunnel.out.flush();
            } catch (Throwable failure) {
                writing.set(failure);
            }
        }, "tunnel-test-writer");
        writer.setDaemon(true);
        writer.start();
        byte[] back = new byte[earlyLength + rest.length];
        V2RayTunnels.readFully(tunnel.in, back, false);
        writer.join(15_000);
        if (writing.get() != null) throw new AssertionError("writing failed", writing.get());
        tunnel.close();
        return back;
    }

    private static byte[] readToEnd(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int n;
        while ((n = in.read(buffer)) >= 0) out.write(buffer, 0, n);
        return out.toByteArray();
    }

    /** Nothing comes back from a server that dropped the request: the stream ends or breaks. */
    private static void assertEndsOrFails(InputStream in) {
        try {
            assertEquals(-1, in.read());
        } catch (IOException fine) {
            // A reset or a short answer is the same refusal.
        }
    }

    private static byte[] payload(int length, int seed) {
        byte[] bytes = new byte[length];
        new Random(seed).nextBytes(bytes);
        return bytes;
    }

    private static byte[] concat(byte[] a, byte[] b) {
        return V2RayCrypto.concat(a, b);
    }

    private static byte[] ascii(String text) {
        return text.getBytes(StandardCharsets.US_ASCII);
    }
}
