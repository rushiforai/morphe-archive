/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class V2RayLinksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ID = "b831381d-6324-4d53-ad4f-8cda48b30811";

    @After public void restore() {
        V2RayLinks.chacha = null;
    }

    // ---- Shadowsocks ----------------------------------------------------------------------------

    @Test public void shadowsocksSip002WithBase64UserInfo() throws Exception {
        String user = Base64.getUrlEncoder().withoutPadding()
                .encodeToString("aes-256-gcm:pass word".getBytes(StandardCharsets.UTF_8));
        V2RayLinks.Server server = V2RayLinks.parseLink("ss://" + user + "@203.0.113.5:8388#Tokyo%201");
        assertEquals(V2RayLinks.SS, server.kind);
        assertEquals("203.0.113.5", server.host);
        assertEquals(8388, server.port);
        assertEquals("aes-256-gcm", server.cipher);
        assertEquals("pass word", server.secret);
        assertEquals("Tokyo 1", server.name);
        assertFalse(server.tls);
        assertFalse(server.ws);
    }

    @Test public void shadowsocksSip002PercentEncodedWithAnIpv6Server() throws Exception {
        V2RayLinks.Server server = V2RayLinks.parseLink("ss://aes-128-gcm:p%40ss@[2001:db8::1]:443/?plugin=none#x");
        assertEquals("2001:db8::1", server.host);
        assertEquals(443, server.port);
        assertEquals("aes-128-gcm", server.cipher);
        assertEquals("p@ss", server.secret);
    }

    @Test public void shadowsocksLegacyFormIsBase64UpToTheName() throws Exception {
        String packed = Base64.getEncoder().encodeToString(
                "chacha20-ietf-poly1305:secret@198.51.100.7:8443".getBytes(StandardCharsets.UTF_8));
        V2RayLinks.Server server = V2RayLinks.parseLink("ss://" + packed + "#Old");
        assertEquals("198.51.100.7", server.host);
        assertEquals(8443, server.port);
        assertEquals("chacha20-ietf-poly1305", server.cipher);
        assertEquals("secret", server.secret);
        assertEquals("Old", server.name);
    }

    // ---- VMess ----------------------------------------------------------------------------------

    @Test public void vmessBase64JsonWithWebSocketAndTls() throws Exception {
        String json = "{\"v\":\"2\",\"ps\":\"Frankfurt\",\"add\":\"vm.example.com\",\"port\":\"443\",\"id\":\"" + ID
                + "\",\"aid\":\"0\",\"scy\":\"auto\",\"net\":\"ws\",\"type\":\"none\",\"host\":\"cdn.example.com\","
                + "\"path\":\"/ray?ed=2048\",\"tls\":\"tls\",\"sni\":\"sni.example.com\",\"alpn\":\"h2,http/1.1\","
                + "\"allowInsecure\":true}";
        V2RayLinks.Server server = V2RayLinks.parseLink("vmess://" + base64(json));
        assertEquals(V2RayLinks.VMESS, server.kind);
        assertEquals("vm.example.com", server.host);
        assertEquals(443, server.port);
        assertEquals(ID, server.secret);
        assertEquals("aes-128-gcm", server.cipher);
        assertTrue(server.ws);
        assertEquals("Xray's early-data parameter is dropped", "/ray", server.path);
        assertEquals("cdn.example.com", server.hostHeader);
        assertTrue(server.tls);
        assertEquals("sni.example.com", server.sni);
        assertTrue(server.insecure);
        assertEquals(Arrays.asList("h2", "http/1.1"), server.alpn);
        assertEquals("Frankfurt", server.name);
        assertEquals("sni.example.com", server.serverName());
    }

    @Test public void vmessUrlFormAndItsBodySealing() throws Exception {
        V2RayLinks.Server zero = V2RayLinks.parseLink("vmess://" + ID + "@[2001:db8::2]:8080?type=tcp&security=none&encryption=zero#Plain");
        assertEquals("2001:db8::2", zero.host);
        assertEquals(8080, zero.port);
        assertEquals("zero", zero.cipher);
        assertFalse(zero.tls);
        assertFalse(zero.ws);
        assertEquals("Plain", zero.name);
        assertEquals("none", V2RayLinks.parseLink("vmess://" + ID + "@h.example:1?scy=none").cipher);
        assertEquals("chacha20-poly1305", V2RayLinks.parseLink("vmess://" + ID + "@h.example:1?scy=chacha20-poly1305").cipher);
    }

    @Test public void vmessShadowrocketForm() throws Exception {
        String link = "vmess://" + base64("auto:" + ID + "@h.example:443")
                + "?remarks=SR&obfs=websocket&path=/sr&obfsParam=cdn.example&tls=1&peer=p.example";
        V2RayLinks.Server server = V2RayLinks.parseLink(link);
        assertEquals("h.example", server.host);
        assertEquals(ID, server.secret);
        assertTrue(server.ws);
        assertEquals("/sr", server.path);
        assertEquals("cdn.example", server.hostHeader);
        assertTrue(server.tls);
        assertEquals("p.example", server.sni);
        assertEquals("SR", server.name);
        assertEquals("aes-128-gcm", server.cipher);
    }

    @Test public void aPhoneWithoutChaChaSkipsShadowsocksChaChaAndSealsVmessWithAes() throws Exception {
        V2RayLinks.chacha = false;
        assertSkipped(V2RayLinks.Skip.CHACHA, "ss://chacha20-ietf-poly1305:pw@h.example:443");
        assertEquals("aes-128-gcm", V2RayLinks.parseLink("vmess://" + ID + "@h.example:1?scy=chacha20-poly1305").cipher);
        V2RayLinks.chacha = true;
        assertEquals("chacha20-ietf-poly1305", V2RayLinks.parseLink("ss://chacha20-poly1305:pw@h.example:443").cipher);
    }

    // ---- VLESS and Trojan -----------------------------------------------------------------------

    @Test public void vlessWithWebSocketAndTls() throws Exception {
        V2RayLinks.Server server = V2RayLinks.parseLink("vless://" + ID + "@example.org:443?encryption=none&security=tls"
                + "&type=ws&host=cdn.example.org&path=%2Fws%3Fed%3D2048&sni=example.org&alpn=h2%2Chttp%2F1.1#V1");
        assertEquals(V2RayLinks.VLESS, server.kind);
        assertEquals("example.org", server.host);
        assertEquals(443, server.port);
        assertTrue(server.ws);
        assertTrue(server.tls);
        assertEquals("/ws", server.path);
        assertEquals("cdn.example.org", server.hostHeader);
        assertEquals("example.org", server.sni);
        assertFalse(server.insecure);
        assertEquals(Arrays.asList("h2", "http/1.1"), server.alpn);
        assertEquals("V1", server.name);
    }

    @Test public void vlessPlainTcpWithANameForAnId() throws Exception {
        V2RayLinks.Server server = V2RayLinks.parseLink("vless://my-name@10.0.0.2:8443");
        assertFalse(server.tls);
        assertFalse(server.ws);
        assertEquals("my-name", server.secret);
        assertEquals("/", server.path);
        assertEquals(Collections.emptyList(), server.alpn);
    }

    @Test public void trojanUsesTlsUnlessTheLinkSaysNone() throws Exception {
        V2RayLinks.Server tls = V2RayLinks.parseLink("trojan://p%40ss@t.example.net:443?sni=t.example.net#T");
        assertEquals(V2RayLinks.TROJAN, tls.kind);
        assertTrue(tls.tls);
        assertFalse(tls.ws);
        assertEquals("p@ss", tls.secret);
        assertFalse(V2RayLinks.parseLink("trojan://pw@127.0.0.1:8080?security=none").tls);
        V2RayLinks.Server ws = V2RayLinks.parseLink("trojan://pw@t.example.net:443?type=ws&path=/tws&host=t.example.net&allowInsecure=1");
        assertTrue(ws.ws);
        assertTrue(ws.tls);
        assertTrue(ws.insecure);
        assertEquals("/tws", ws.path);
    }

    // ---- Skipped and unreadable -----------------------------------------------------------------

    @Test public void everyKindLeftOutIsNamedWhy() {
        assertSkipped(V2RayLinks.Skip.REALITY, "vless://" + ID + "@h.example:443?security=reality&pbk=x&sni=a.example");
        assertSkipped(V2RayLinks.Skip.XTLS, "vless://" + ID + "@h.example:443?security=tls&flow=xtls-rprx-vision");
        assertSkipped(V2RayLinks.Skip.XTLS, "vless://" + ID + "@h.example:443?security=xtls");
        assertSkipped(V2RayLinks.Skip.GRPC, "vless://" + ID + "@h.example:443?type=grpc&security=tls");
        assertSkipped(V2RayLinks.Skip.HTTP2, "trojan://pw@h.example:443?type=h2");
        assertSkipped(V2RayLinks.Skip.QUIC, "vless://" + ID + "@h.example:443?type=quic");
        assertSkipped(V2RayLinks.Skip.KCP, "vmess://" + ID + "@h.example:443?type=kcp");
        assertSkipped(V2RayLinks.Skip.HTTP_UPGRADE, "vless://" + ID + "@h.example:443?type=httpupgrade");
        assertSkipped(V2RayLinks.Skip.XHTTP, "vless://" + ID + "@h.example:443?type=xhttp");
        assertSkipped(V2RayLinks.Skip.TCP_HEADERS, "vless://" + ID + "@h.example:443?type=tcp&headerType=http");
        assertSkipped(V2RayLinks.Skip.HYSTERIA, "hysteria2://pw@h.example:443");
        assertSkipped(V2RayLinks.Skip.HYSTERIA, "hy2://pw@h.example:443");
        assertSkipped(V2RayLinks.Skip.TUIC, "tuic://" + ID + ":pw@h.example:443");
        assertSkipped(V2RayLinks.Skip.WIREGUARD, "wireguard://key@h.example:51820");
        assertSkipped(V2RayLinks.Skip.DNSTT, "dnstt://t.example.com?pubkey=abc");
        assertSkipped(V2RayLinks.Skip.SHADOWSOCKS_2022, "ss://2022-blake3-aes-128-gcm:a2V5@h.example:443");
        assertSkipped(V2RayLinks.Skip.SHADOWSOCKSR, "ssr://abc");
        assertSkipped(V2RayLinks.Skip.SHADOWSOCKS_PLUGIN, "ss://aes-128-gcm:pw@h.example:443/?plugin=obfs-local%3Bobfs%3Dhttp");
        assertSkipped(V2RayLinks.Skip.SHADOWSOCKS_CIPHER, "ss://rc4-md5:pw@h.example:443");
        assertSkipped(V2RayLinks.Skip.VMESS_ALTER_ID, "vmess://" + base64("{\"add\":\"h.example\",\"port\":443,\"id\":\""
                + ID + "\",\"aid\":\"64\"}"));
        assertSkipped(V2RayLinks.Skip.VMESS_ALTER_ID, "vmess://" + ID + "@h.example:443?aid=4");
        assertSkipped(V2RayLinks.Skip.VLESS_ENCRYPTION, "vless://" + ID + "@h.example:443?encryption=mlkem768x25519plus.native.0rtt.abc");
        assertEquals("TCP with HTTP headers", V2RayLinks.Skip.TCP_HEADERS.label());
        assertEquals("REALITY", V2RayLinks.Skip.REALITY.label());
    }

    @Test public void malformedLinksDoNotRead() {
        StringBuilder longText = new StringBuilder("trojan://pw@h.example:443#");
        while (longText.length() <= 8192) longText.append('a');
        String[] links = {
                "vless://not-a-uuid-and-much-too-long-to-be-a-name@h.example:443",
                "trojan://@h.example:443",
                "vless://" + ID + "@h.example",
                "vless://" + ID + "@h.example:99999",
                "vless://" + ID + "@h.example:0",
                "vless://" + ID + "@h.example:443?type=carrier-pigeon",
                "vless://" + ID + "@h.example:443?security=ftp",
                "vless://" + ID + "@bad_host!:443",
                "vless://" + ID + "@[zz::1]:443",
                "vless://" + ID + "@h.example:443?type=ws&path=%2Fa%20b",
                "vmess://" + base64("{not json"),
                "vmess://" + ID + "@h.example:443?encryption=rc4",
                "ss://!!!@h.example:443",
                "ss://aes-128-gcm:@h.example:443",
                "ss://aes-128-gcm:pw@h.example",
                "trojan://p%G1@h.example:443",
                "ftp://h.example",
                "nothing",
                longText.toString(),
        };
        for (String link : links) {
            try {
                V2RayLinks.parseLink(link);
                fail("read: " + link.substring(0, Math.min(60, link.length())));
            } catch (IllegalArgumentException expected) {
                // As it should.
            } catch (V2RayLinks.Skipped skipped) {
                fail("skipped rather than unreadable: " + link + " " + skipped.why);
            }
        }
    }

    // ---- Lists ----------------------------------------------------------------------------------

    @Test public void aSubscriptionCountsWhatItCouldNotUse() {
        String good = "vless://" + ID + "@a.example:443?security=tls#A";
        String text = "Servers:\n" + good + "\n"
                + "- [B](trojan://pw@t.example.net:443#T)\n"
                + "vless://" + ID + "@r.example:443?security=reality\n"
                + "and hysteria2://pw@h.example:443 too\n"
                + "vless://" + ID + "@h.example:99999\n"
                + good + "\n"
                + "https://not.a.link.example/\n";
        V2RayLinks.Found found = V2RayLinks.parse(text);
        assertEquals("the same link once", 2, found.servers.size());
        assertEquals("a.example", found.servers.get(0).host);
        assertEquals("the markdown's closing bracket isn't part of the link", "T", found.servers.get(1).name);
        assertEquals(Integer.valueOf(1), found.skipped.get(V2RayLinks.Skip.REALITY));
        assertEquals(Integer.valueOf(1), found.skipped.get(V2RayLinks.Skip.HYSTERIA));
        assertEquals(2, found.skippedCount());
        assertEquals(1, found.unreadable);

        V2RayLinks.Found decoded = V2RayLinks.parse(Base64.getMimeEncoder().encodeToString(text.getBytes(StandardCharsets.UTF_8)));
        assertEquals("a base64 list reads the same", 2, decoded.servers.size());
        assertEquals(2, decoded.skippedCount());
        assertEquals(1, decoded.unreadable);
    }

    @Test public void nothingToReadIsAnEmptyFind() {
        for (String text : new String[]{null, "", "no links here at all", base64("still no links in here")}) {
            V2RayLinks.Found found = V2RayLinks.parse(text);
            assertTrue(found.servers.isEmpty());
            assertEquals(0, found.skippedCount());
            assertEquals(0, found.unreadable);
        }
    }

    @Test public void oneReadKeepsAtMostFiveHundredServers() {
        StringBuilder text = new StringBuilder();
        for (int i = 1; i <= V2RayLinks.MAX_SERVERS + 20; i++) text.append("trojan://pw@h.example:").append(i).append('\n');
        assertEquals(V2RayLinks.MAX_SERVERS, V2RayLinks.parse(text.toString()).servers.size());
    }

    @Test public void foundAddsAnotherReadsCounts() {
        V2RayLinks.Found pasted = V2RayLinks.parse("trojan://pw@a.example:1\nhy2://x@b.example:1");
        pasted.add(V2RayLinks.parse("trojan://pw@a.example:1\ntrojan://pw@c.example:1\nhy2://y@d.example:1\nss://x"));
        assertEquals(2, pasted.servers.size());
        assertEquals(Integer.valueOf(2), pasted.skipped.get(V2RayLinks.Skip.HYSTERIA));
        assertEquals(1, pasted.unreadable);
    }

    // ---- Pieces ---------------------------------------------------------------------------------

    @Test public void thePasteBoxKnowsALinkLine() {
        assertTrue(V2RayLinks.looksLikeLink("vmess://abc"));
        assertTrue(V2RayLinks.looksLikeLink("VLESS://abc"));
        assertTrue(V2RayLinks.looksLikeLink("hy2://abc"));
        assertFalse(V2RayLinks.looksLikeLink("https://example.com/list"));
        assertFalse(V2RayLinks.looksLikeLink("notvless://abc"));
        assertFalse(V2RayLinks.looksLikeLink("see vless://abc"));
    }

    @Test public void aWebSocketPathLosesOnlyTheEarlyDataParameter() {
        assertEquals("/", V2RayLinks.wsPath(null));
        assertEquals("/", V2RayLinks.wsPath(" "));
        assertEquals("/ws", V2RayLinks.wsPath("ws"));
        assertEquals("/a?b=1", V2RayLinks.wsPath("/a?ed=2048&b=1"));
        assertEquals("/a", V2RayLinks.wsPath("/a?ED=1"));
        assertEquals("/a%20b", V2RayLinks.wsPath("/a%20b"));
        try {
            V2RayLinks.wsPath("/a b");
            fail();
        } catch (IllegalArgumentException expected) {
            // A space would break the request line.
        }
    }

    @Test public void tlsNamesTheSniThenTheWebSocketHostThenTheServer() throws Exception {
        assertEquals("s.example", V2RayLinks.parseLink("vless://" + ID + "@h.example:443?security=tls&type=ws&host=w.example&sni=s.example").serverName());
        assertEquals("w.example", V2RayLinks.parseLink("vless://" + ID + "@h.example:443?security=tls&type=ws&host=w.example").serverName());
        assertEquals("h.example", V2RayLinks.parseLink("vless://" + ID + "@h.example:443?security=tls&host=w.example").serverName());
    }

    @Test public void anIdIsShortStableAndHoldsNoSecret() throws Exception {
        String link = "trojan://hunter2secret@h.example:443";
        String id = V2RayLinks.parseLink(link).id();
        assertEquals(16, id.length());
        assertTrue(id.matches("[0-9a-f]{16}"));
        assertEquals(id, V2RayLinks.parseLink(link).id());
        assertNotEquals(id, V2RayLinks.parseLink("trojan://hunter2secret@h.example:444").id());
        assertFalse(id.contains("hunter2"));
    }

    @Test public void aNameIsDecodedCleanedAndCut() throws Exception {
        assertEquals("a b", V2RayLinks.parseLink("trojan://pw@h.example:443#a%0Ab").name);
        StringBuilder longText = new StringBuilder();
        for (int i = 0; i < 100; i++) longText.append('n');
        assertEquals(60, V2RayLinks.parseLink("trojan://pw@h.example:443#" + longText).name.length());
        assertEquals("not encoded %", V2RayLinks.parseLink("trojan://pw@h.example:443#not encoded %").name);
    }

    // ---- Helpers --------------------------------------------------------------------------------

    private static void assertSkipped(V2RayLinks.Skip why, String link) {
        try {
            V2RayLinks.parseLink(link);
            fail("read: " + link);
        } catch (V2RayLinks.Skipped skipped) {
            assertEquals(link, why, skipped.why);
        }
        V2RayLinks.Found found = V2RayLinks.parse(link);
        assertTrue(found.servers.isEmpty());
        assertEquals(link, Integer.valueOf(1), found.skipped.get(why));
    }

    private static String base64(String text) {
        return Base64.getEncoder().encodeToString(text.getBytes(StandardCharsets.UTF_8));
    }
}
