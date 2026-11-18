/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.telegram.misc.V2RayFakes.Fake;
import app.hushtelegram.extension.telegram.misc.V2RayFakes.Heard;
import app.hushtelegram.extension.telegram.misc.V2RayFakes.TestCert;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import javax.net.ssl.TrustManager;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowLooper;

/** The switch, the one entry in Telegram's list, the timing and the picker, through a stand-in for that list. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class V2RayProxiesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ID = "b831381d-6324-4d53-ad4f-8cda48b30811";
    private static final String OWN = "tg://socks?server=own.example.com&port=1080";
    private static final String FREE = "tg://proxy?server=free.example.com&port=443&secret=ee00";
    private static final byte[] DC = {(byte) 149, (byte) 154, (byte) 167, 51};

    private final V2RayProxies.Store storeBefore = V2RayProxies.store;
    private final V2RayProxies.Prober proberBefore = V2RayProxies.prober;
    private final Random randomBefore = V2RayProxies.random;
    private final long delayBefore = V2RayProxies.startDelayMs;
    private final V2RayTunnels.Target dcBefore = V2RayProxies.dc;
    private final FreeProxies.Transport transportBefore = FreeProxies.transport;
    private final TrustManager[] trustedBefore = V2RayDialer.trusted;
    private final List<Closeable> open = new ArrayList<>();
    private FakeStore list;
    private Map<String, Long> times;
    private final AtomicInteger changes = new AtomicInteger();
    private final V2RayProxies.Listener listener = changes::incrementAndGet;

    @Before public void setUp() {
        restore();
        list = new FakeStore();
        times = new HashMap<>();
        V2RayProxies.store = list;
        V2RayProxies.prober = server -> {
            Long ms = times.get(server.host);
            if (ms == null) throw new IOException("no answer");
            return ms;
        };
        V2RayProxies.random = new Random(71);
        V2RayProxies.startDelayMs = 0;
        PatchFamilyForTests.inBuild(PatchFamily.FREE_PROXIES);
        V2RayProxies.watch(listener);
    }

    @After public void restore() {
        settle();
        V2RayProxies.unwatch(listener);
        V2RayProxies.resetForTests();
        V2RayProxies.store = storeBefore;
        V2RayProxies.prober = proberBefore;
        V2RayProxies.random = randomBefore;
        V2RayProxies.startDelayMs = delayBefore;
        V2RayProxies.dc = dcBefore;
        FreeProxies.transport = transportBefore;
        V2RayDialer.trusted = trustedBefore;
        for (Closeable closeable : open) {
            try {
                closeable.close();
            } catch (IOException ignored) {
                // Already gone.
            }
        }
        open.clear();
        PauseForTests.resume();
        Settings.V2RAY_PROXIES.resetToDefault();
        V2RayProxies.Stored.LINKS.resetToDefault();
        V2RayProxies.Stored.LOCAL.resetToDefault();
        V2RayProxies.Stored.ENTRY.resetToDefault();
        V2RayProxies.Stored.RESUME.resetToDefault();
        V2RayProxies.Stored.PICK.resetToDefault();
        V2RayProxies.Stored.FOUND.resetToDefault();
        V2RayProxies.Stored.RESULT.resetToDefault();
        V2RayProxies.Stored.TRIED_AT.resetToDefault();
        FreeProxies.Stored.ADDED.resetToDefault();
        FreeProxies.Stored.LISTS.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        HookStatus.clear();
    }

    // ---- The switch and Telegram's list ----------------------------------------------------------

    @Test public void switchingOnStartsTheLocalProxyAndConnectsThroughItsOneEntry() {
        list.add(OWN);
        switchOn();
        assertTrue(V2RayProxies.running());
        V2RayProxies.Local local = V2RayProxies.Local.read(V2RayProxies.Stored.LOCAL.get());
        assertNotNull(local);
        assertEquals(V2RayProxies.port(), local.port);
        assertTrue(local.port >= V2RayProxies.PORT_FROM && local.port < V2RayProxies.PORT_FROM + V2RayProxies.PORT_COUNT);
        String entry = V2RayProxies.Stored.ENTRY.get();
        assertEquals("tg://socks?server=127.0.0.1&port=" + local.port + "&user=" + local.user + "&pass=" + local.pass, entry);
        assertEquals("one entry of its own, and the person's proxy kept", Arrays.asList(entry, OWN), list.saved);
        assertEquals(entry, list.current);
        assertTrue(list.enabled);
        assertTrue("the settings page heard", changes.get() > 0);
        assertTrue("switching on tests the servers", V2RayProxies.tested());
    }

    @Test public void switchingOffStopsItAndTakesOutOnlyItsEntry() throws Exception {
        list.add(OWN);
        switchOn();
        int port = V2RayProxies.port();
        Settings.V2RAY_PROXIES.save(false);
        V2RayProxies.switched();
        settle();
        assertFalse(V2RayProxies.running());
        assertEquals(Arrays.asList(OWN), list.saved);
        assertEquals("", V2RayProxies.Stored.ENTRY.get());
        assertFalse("Telegram goes without a proxy, as it did before", list.inUse());
        assertNothingListens(port);
        assertFalse(V2RayProxies.Stored.RESUME.get());
    }

    @Test public void switchingOnLeavesAProxyOfThePersonsOwnInUse() {
        list.add(OWN);
        list.use(OWN);
        switchOn();
        assertTrue(list.saved.contains(V2RayProxies.Stored.ENTRY.get()));
        assertEquals(OWN, list.current);
        assertEquals(1, list.uses);
    }

    @Test public void switchingOnTakesOverAProxyFreeProxiesAdded() {
        FreeProxies.Stored.ADDED.save(FREE);
        list.add(FREE);
        list.use(FREE);
        switchOn();
        assertEquals(V2RayProxies.Stored.ENTRY.get(), list.current);
        assertTrue("Free proxies' entry stays for Free proxies to manage", list.saved.contains(FREE));
    }

    @Test public void aNewTelegramStartKeepsThePortAndPasswordAndLeavesUseProxyAlone() {
        switchOn();
        String entry = V2RayProxies.Stored.ENTRY.get();
        String local = V2RayProxies.Stored.LOCAL.get();
        int port = V2RayProxies.port();
        // The person turned Use proxy off, then Telegram started again.
        list.enabled = false;
        int uses = list.uses;
        V2RayProxies.resetForTests();
        assertFalse(V2RayProxies.running());
        V2RayProxies.onTelegramStart(V2RayProxies.Stored.TRIED_AT.get() + TimeUnit.HOURS.toMillis(1));
        settle();
        assertTrue(V2RayProxies.running());
        assertEquals(port, V2RayProxies.port());
        assertEquals(local, V2RayProxies.Stored.LOCAL.get());
        assertEquals(entry, V2RayProxies.Stored.ENTRY.get());
        assertEquals(Arrays.asList(entry), list.saved);
        assertEquals(uses, list.uses);
        assertFalse(list.enabled);
    }

    @Test public void aStartPutsBackAnEntryThePersonDeleted() {
        switchOn();
        String entry = V2RayProxies.Stored.ENTRY.get();
        list.remove(entry);
        V2RayProxies.resetForTests();
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertEquals(Arrays.asList(entry), list.saved);
        assertFalse("put back, not connected", list.inUse());
    }

    @Test public void aPauseTakesTheEntryOutAndTheFirstStartAfterUsesItAgain() {
        switchOn();
        String entry = V2RayProxies.Stored.ENTRY.get();
        V2RayProxies.resetForTests();
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertFalse(V2RayProxies.running());
        assertTrue("nothing listens behind it while paused", list.saved.isEmpty());
        assertFalse(list.inUse());
        assertTrue(V2RayProxies.Stored.RESUME.get());

        PauseForTests.resume();
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertTrue(V2RayProxies.running());
        assertEquals(entry, list.current);
        assertTrue(list.enabled);
        assertFalse(V2RayProxies.Stored.RESUME.get());
    }

    @Test public void aPauseWhileTheEntryWasntUsedDoesntConnectAfter() {
        switchOn();
        list.enabled = false;
        V2RayProxies.resetForTests();
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertFalse(V2RayProxies.Stored.RESUME.get());
        PauseForTests.resume();
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertEquals(Arrays.asList(V2RayProxies.Stored.ENTRY.get()), list.saved);
        assertFalse(list.enabled);
    }

    @Test public void offAtStartTakesOutAnEntryLeftBehind() {
        String left = "tg://socks?server=127.0.0.1&port=23456&user=a&pass=b";
        V2RayProxies.Stored.ENTRY.save(left);
        list.add(OWN);
        list.add(left);
        list.use(left);
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertEquals(Arrays.asList(OWN), list.saved);
        assertEquals("", V2RayProxies.Stored.ENTRY.get());
        assertFalse(V2RayProxies.Stored.RESUME.get());
        assertFalse(V2RayProxies.running());
    }

    @Test public void nothingStartsWithoutThePatchTheSwitchOrTheSettings() {
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertFalse("off by default", V2RayProxies.running());

        Settings.V2RAY_PROXIES.save(true);
        PatchFamilyForTests.inBuild();
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        V2RayProxies.switched();
        settle();
        assertFalse("a switch left on by an older build does nothing", V2RayProxies.running());

        PatchFamilyForTests.inBuild(PatchFamily.FREE_PROXIES);
        PatchFamilyForTests.installed(PatchFamily.Capability.PROXY_ORDER);
        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertFalse("a patch that can't hand Telegram a SOCKS5 link", V2RayProxies.running());
        PatchFamilyForTests.resetCapabilities();

        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            V2RayProxies.onTelegramStart(System.currentTimeMillis());
            settle();
            assertFalse(reason.name(), V2RayProxies.running());
            assertFalse(reason.name(), V2RayProxies.wanted());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> V2RayProxies.onTelegramStart(System.currentTimeMillis()));
        settle();
        assertFalse(V2RayProxies.running());
        assertTrue(list.saved.isEmpty());

        V2RayProxies.onTelegramStart(System.currentTimeMillis());
        settle();
        assertTrue(V2RayProxies.running());
    }

    @Test public void aTakenPortMovesTheEntryAndKeepsItInUse() throws Exception {
        switchOn();
        String entry = V2RayProxies.Stored.ENTRY.get();
        V2RayProxies.Local before = V2RayProxies.Local.read(V2RayProxies.Stored.LOCAL.get());
        V2RayProxies.resetForTests();
        try (ServerSocket other = new ServerSocket(before.port, 50, InetAddress.getByAddress(new byte[]{127, 0, 0, 1}))) {
            V2RayProxies.onTelegramStart(System.currentTimeMillis());
            settle();
            assertTrue(other.isBound());
        }
        V2RayProxies.Local after = V2RayProxies.Local.read(V2RayProxies.Stored.LOCAL.get());
        assertNotEquals(before.port, after.port);
        assertEquals(before.user, after.user);
        assertEquals(before.pass, after.pass);
        assertEquals(after.port, V2RayProxies.port());
        String moved = V2RayProxies.Stored.ENTRY.get();
        assertNotEquals(entry, moved);
        assertEquals(after.link(), moved);
        assertEquals("the old entry came out", Arrays.asList(moved), list.saved);
        assertEquals("it was in use, so the new one is", moved, list.current);
    }

    @Test public void aListThatWontTakeTheEntryLeavesItEmpty() {
        list.refuseAll = true;
        switchOn();
        assertTrue(V2RayProxies.running());
        assertEquals("", V2RayProxies.Stored.ENTRY.get());
        assertTrue(list.saved.isEmpty());
    }

    // ---- Testing and picking ---------------------------------------------------------------------

    @Test public void aTestKeepsWhatAnsweredFastestFirst() throws Exception {
        String alpha = "vless://" + ID + "@a.example.com:443?security=tls&sni=a.example.com#Alpha";
        String beta = "trojan://pw@b.example.com:443#Beta";
        String nameless = "ss://aes-128-gcm:pw@c.example.com:8388";
        String delta = "trojan://pw@d.example.com:443#Delta";
        V2RayProxies.Stored.LINKS.save(String.join("\n", alpha, beta, nameless,
                "vless://" + ID + "@r.example.com:443?security=reality&pbk=k&sid=1#R", "hysteria2://pw@h.example.com:443#H"));
        FreeProxies.Stored.LISTS.save("https://lists.example.com/mine?token=private");
        FreeProxies.transport = new Lists(Base64.getEncoder().encodeToString(delta.getBytes(StandardCharsets.UTF_8)));
        times.put("a.example.com", 120L);
        times.put("b.example.com", 40L);
        times.put("d.example.com", 70L);
        ShadowLog.clear();

        V2RayProxies.test(1234L);
        assertEquals(1234L, (long) V2RayProxies.Stored.TRIED_AT.get());
        assertEquals("3 4 4 0 REALITY HYSTERIA", V2RayProxies.Stored.RESULT.get());
        assertEquals(Arrays.asList("b.example.com", "d.example.com", "a.example.com"), hosts(V2RayProxies.route()));
        assertEquals("40\t" + beta + "\n70\t" + delta + "\n120\t" + alpha, V2RayProxies.Stored.FOUND.get());

        List<V2RayProxies.Choice> choices = V2RayProxies.choices();
        assertEquals(4, choices.size());
        assertEquals("Beta", choices.get(0).name);
        assertEquals(40L, choices.get(0).ms);
        assertEquals("Delta", choices.get(1).name);
        assertEquals("Alpha", choices.get(2).name);
        assertEquals("didn't answer", 0L, choices.get(3).ms);
        assertEquals("Server 4", V2RayProxies.label(choices.get(3)));
        assertEquals("Beta", V2RayProxies.label(choices.get(0)));
        assertEquals("Servers that answered last time: 3 of 4. Skipped, not supported yet: REALITY and Hysteria.",
                V2RayProxies.serverSummary());

        assertTrue(V2RayProxies.pick(choices.get(3).id));
        assertEquals(choices.get(3).id, V2RayProxies.picked());
        assertEquals(Arrays.asList("c.example.com"), hosts(V2RayProxies.route()));
        assertTrue(V2RayProxies.serverSummary().endsWith(" Using Server 4."));
        V2RayProxies.pick("0123456789abcdef");
        assertEquals("a pick that's gone falls back to the fastest", "b.example.com", V2RayProxies.route().get(0).host);
        V2RayProxies.pick("");
        assertEquals("b.example.com", V2RayProxies.route().get(0).host);

        V2RayProxies.resetForTests();
        V2RayProxies.choices();
        assertEquals("what answered is kept for the next start", Arrays.asList("b.example.com", "d.example.com", "a.example.com"),
                hosts(V2RayProxies.route()));

        for (ShadowLog.LogItem item : ShadowLog.getLogs()) {
            String text = String.valueOf(item.msg);
            assertFalse(text, text.contains("lists.example.com"));
            assertFalse(text, text.contains("token=private"));
            assertFalse(text, text.contains(ID));
        }
    }

    @Test public void untestedEveryServerIsTriedInTheOrderPasted() {
        V2RayProxies.Stored.LINKS.save("trojan://pw@one.example.com:443\ntrojan://pw@two.example.com:443");
        V2RayProxies.choices();
        assertEquals(Arrays.asList("one.example.com", "two.example.com"), hosts(V2RayProxies.route()));
        assertFalse(V2RayProxies.tested());
    }

    @Test public void theServerRowSaysWhatTheLastTestFound() {
        assertEquals("Not tested yet. Tap to pick a server or test them now.", V2RayProxies.serverSummary());
        V2RayProxies.Stored.TRIED_AT.save(5L);
        V2RayProxies.Stored.RESULT.save("0 0 0 0");
        assertEquals("No V2Ray-style links found in your links or proxy lists.", V2RayProxies.serverSummary());
        V2RayProxies.Stored.RESULT.save("0 3 3 1");
        assertEquals("None of your servers answered last time.", V2RayProxies.serverSummary());
        V2RayProxies.Stored.RESULT.save("1 1 1 0 TCP_HEADERS SOMETHING_NEWER");
        assertEquals("Servers that answered last time: 1 of 1. Skipped, not supported yet: TCP with HTTP headers.",
                V2RayProxies.serverSummary());
        V2RayProxies.Stored.RESULT.save("x 1 1 0");
        assertEquals("Not tested yet. Tap to pick a server or test them now.", V2RayProxies.serverSummary());
    }

    @Test public void theLinksRowCountsWhatWasPasted() {
        assertEquals("Paste vmess://, vless://, trojan:// and ss:// links here. Links in Your proxy lists are read too.",
                V2RayProxies.linksSummary());
        List<String> links = Arrays.asList("trojan://pw@one.example.com:443", "ss://aes-128-gcm:pw@two.example.com:8388");
        assertEquals(0, V2RayProxies.notALink(links));
        assertEquals(2, V2RayProxies.notALink(Arrays.asList(links.get(0), "hello", links.get(1))));
        assertTrue(V2RayProxies.saveLinks(links));
        settle();
        assertEquals(links, V2RayProxies.pastedLinks());
        assertEquals("Links saved: 2. Links in Your proxy lists are read too.", V2RayProxies.linksSummary());
        assertFalse("with the switch off, saving doesn't test", V2RayProxies.tested());

        Settings.V2RAY_PROXIES.save(true);
        times.put("one.example.com", 9L);
        assertTrue(V2RayProxies.saveLinks(links.subList(0, 1)));
        settle();
        assertTrue(V2RayProxies.tested());
        assertEquals("1 1 1 0", V2RayProxies.Stored.RESULT.get());
    }

    @Test public void atMostSixtyServersAreTimedPastedOnesFirst() throws Exception {
        List<V2RayLinks.Server> servers = new ArrayList<>();
        for (int i = 0; i < 100; i++) servers.add(V2RayLinks.parseLink("trojan://pw@s" + i + ".example.com:443"));
        List<V2RayLinks.Server> picked = V2RayProxies.pick(servers, 10, new Random(3));
        assertEquals(V2RayProxies.MAX_TIMED, picked.size());
        assertEquals(servers.subList(0, 10), picked.subList(0, 10));
        Set<V2RayLinks.Server> rest = new HashSet<>(picked.subList(10, picked.size()));
        assertEquals("no server twice", 50, rest.size());
        for (V2RayLinks.Server server : rest) assertTrue(servers.indexOf(server) >= 10);
        assertEquals(servers.subList(0, 60), V2RayProxies.pick(servers, 70, new Random(3)));
        assertEquals(servers.subList(0, 50), V2RayProxies.pick(servers.subList(0, 50), 0, new Random(3)));
    }

    @Test public void aServerThatDoesntAnswerIsLeftOutOfTheTimes() throws Exception {
        List<V2RayLinks.Server> servers = Arrays.asList(V2RayLinks.parseLink("trojan://pw@a.example.com:443"),
                V2RayLinks.parseLink("trojan://pw@b.example.com:443"), V2RayLinks.parseLink("trojan://pw@c.example.com:443"));
        Map<V2RayLinks.Server, Long> ms = V2RayProxies.time(server -> {
            if (server.host.startsWith("b")) throw new IOException("no answer");
            if (server.host.startsWith("c")) throw new IllegalStateException("broken");
            return 5L;
        }, servers);
        assertEquals(1, ms.size());
        assertEquals(5L, (long) ms.get(servers.get(0)));
        assertTrue(V2RayProxies.time(server -> 1L, new ArrayList<>()).isEmpty());
    }

    // ---- The timing's request --------------------------------------------------------------------

    @Test public void theTimingAsksForTheFirstStepOfASignIn() {
        byte[] nonce = new byte[16];
        for (int i = 0; i < 16; i++) nonce[i] = (byte) (0xa0 + i);
        long now = 1_700_000_000_123L;
        byte[] packet = V2RayProxies.reqPq(nonce, now);
        assertEquals(48, packet.length);
        // The intermediate transport's tag, then the length of the one packet, little-endian.
        assertArrayEquals(new byte[]{(byte) 0xee, (byte) 0xee, (byte) 0xee, (byte) 0xee, 40, 0, 0, 0},
                Arrays.copyOfRange(packet, 0, 8));
        assertArrayEquals("auth_key_id 0: not encrypted", new byte[8], Arrays.copyOfRange(packet, 8, 16));
        long id = 0;
        for (int i = 7; i >= 0; i--) id = id << 8 | (packet[16 + i] & 0xff);
        assertEquals("the message id's high half is the time in seconds", 1_700_000_000L, id >>> 32);
        assertEquals("a client's message id is divisible by 4", 0, id & 3);
        assertTrue("its low half is the fraction of a second", (id & 0xffffffffL) > 0x1f000000L && (id & 0xffffffffL) < 0x20000000L);
        assertArrayEquals("the body is 20 bytes", new byte[]{20, 0, 0, 0}, Arrays.copyOfRange(packet, 24, 28));
        assertArrayEquals("req_pq_multi#be7e8ef1", new byte[]{(byte) 0xf1, (byte) 0x8e, 0x7e, (byte) 0xbe},
                Arrays.copyOfRange(packet, 28, 32));
        assertArrayEquals(nonce, Arrays.copyOfRange(packet, 32, 48));
    }

    @Test public void aResPqForAnotherNonceOrAnotherKindIsNotAnAnswer() throws Exception {
        byte[] nonce = new byte[16];
        Arrays.fill(nonce, (byte) 7);
        assertTrue(V2RayProxies.resPq(new java.io.ByteArrayInputStream(resPq(nonce, 0x05162463L, 64)), nonce));
        byte[] other = nonce.clone();
        other[15] = 8;
        assertFalse(V2RayProxies.resPq(new java.io.ByteArrayInputStream(resPq(other, 0x05162463L, 64)), nonce));
        assertFalse(V2RayProxies.resPq(new java.io.ByteArrayInputStream(resPq(nonce, 0x12345678L, 64)), nonce));
        assertFalse("too short to be one", V2RayProxies.resPq(new java.io.ByteArrayInputStream(new byte[]{39, 0, 0, 0}), nonce));
        assertFalse("too long to be one", V2RayProxies.resPq(new java.io.ByteArrayInputStream(new byte[]{1, 0x10, 0, 0}), nonce));
        try {
            V2RayProxies.resPq(new java.io.ByteArrayInputStream(new byte[]{64, 0, 0, 0, 1, 2}), nonce);
            fail("a cut answer read as one");
        } catch (IOException expected) {
            // Cut short.
        }
    }

    @Test public void aProbeGoesThroughTheWholeTunnelToTelegramsServer() throws Exception {
        V2RayDialer.trusted = TestCert.get().trust();
        V2RayProxies.dc = new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443);
        Fake fake = fake(V2RayLinks.TROJAN, "pw", true);
        fake.destination = telegram(true);
        long ms = V2RayProxies.probe(V2RayLinks.parseLink("trojan://pw@127.0.0.1:" + fake.port() + "?sni=" + TestCert.NAME));
        assertTrue(ms >= 1);
        Heard heard = fake.next();
        assertArrayEquals(DC, heard.address);
        assertEquals(443, heard.port);
        assertEquals(48, heard.data().length);
        assertEquals((byte) 0xee, heard.data()[0]);

        fake.destination = telegram(false);
        try {
            V2RayProxies.probe(V2RayLinks.parseLink("trojan://pw@127.0.0.1:" + fake.port() + "?sni=" + TestCert.NAME));
            fail("an answer to another request counted");
        } catch (IOException expected) {
            assertEquals("not Telegram's answer", expected.getMessage());
        }
    }

    // ---- All of it ------------------------------------------------------------------------------

    @Test public void theEntryCarriesTelegramThroughTheServerThatAnswered() throws Exception {
        BaseSettings.DEBUG.save(true);
        V2RayProxies.prober = V2RayProxies::probe;
        V2RayProxies.dc = new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, DC, 443);
        Fake near = fake(V2RayLinks.VLESS, ID, false);
        near.destination = telegramOrEcho();
        // A Trojan server with another password drops every request: it never answers.
        Fake wrong = fake(V2RayLinks.TROJAN, "not this one", false);
        String wrongLink = "trojan://secret-word@127.0.0.1:" + wrong.port() + "?security=none#Wrong";
        V2RayProxies.Stored.LINKS.save(wrongLink + "\nvless://" + ID + "@127.0.0.1:" + near.port() + "?security=none#Near");
        ShadowLog.clear();
        String bufferBefore = LogBufferManager.snapshotForCrash(1 << 20);
        switchOn();

        assertEquals("1 2 2 0", V2RayProxies.Stored.RESULT.get());
        assertEquals(Arrays.asList(near.port()), ports(V2RayProxies.route()));
        Heard probe = near.next();
        assertEquals(48, probe.data().length);
        assertTrue(wrong.next().failure != null);

        V2RayProxies.Local local = V2RayProxies.Local.read(V2RayProxies.Stored.LOCAL.get());
        try (Socket telegram = new Socket()) {
            telegram.connect(new InetSocketAddress("127.0.0.1", V2RayProxies.port()), 5000);
            telegram.setSoTimeout(15_000);
            OutputStream out = telegram.getOutputStream();
            InputStream in = telegram.getInputStream();
            out.write(new byte[]{5, 1, 2});
            assertArrayEquals(new byte[]{5, 2}, readN(in, 2));
            byte[] user = local.user.getBytes(StandardCharsets.UTF_8);
            byte[] pass = local.pass.getBytes(StandardCharsets.UTF_8);
            ByteArrayOutputStream login = new ByteArrayOutputStream();
            login.write(1);
            login.write(user.length);
            login.write(user);
            login.write(pass.length);
            login.write(pass);
            out.write(login.toByteArray());
            assertArrayEquals(new byte[]{1, 0}, readN(in, 2));
            out.write(new byte[]{5, 1, 0, 1, (byte) 149, (byte) 154, (byte) 175, 50, 0x01, (byte) 0xbb});
            assertArrayEquals(V2RayServer.reply(0), readN(in, 10));
            out.write("hello, telegram".getBytes(StandardCharsets.US_ASCII));
            assertEquals("hello, telegram", new String(readN(in, 15), StandardCharsets.US_ASCII));
        }
        Heard carried = near.next();
        assertArrayEquals(new byte[]{(byte) 149, (byte) 154, (byte) 175, 50}, carried.address);
        assertEquals("hello, telegram", new String(carried.data(), StandardCharsets.US_ASCII));

        // The links, the ids and the local proxy's password are secrets: none of them is logged.
        List<String> secrets = new ArrayList<>(Arrays.asList(ID, "secret-word", local.pass, local.user));
        for (int port : new int[]{near.port(), wrong.port(), local.port}) {
            secrets.add(":" + port);
            secrets.add("port=" + port);
            secrets.add("port " + port);
        }
        String after = LogBufferManager.snapshotForCrash(1 << 20);
        // Only what this test logged: the buffer outlives a test, and an older line can hold any number.
        String buffer = after.startsWith(bufferBefore) ? after.substring(bufferBefore.length()) : after;
        boolean logged = false;
        for (ShadowLog.LogItem item : ShadowLog.getLogs()) {
            String text = item.msg + " " + (item.throwable == null ? "" : item.throwable.getMessage());
            logged |= text.contains("V2Ray proxy:");
            for (String secret : secrets) assertFalse(secret + " in " + text, text.contains(secret));
        }
        for (String secret : secrets) assertFalse(secret + " in the log buffer", buffer.contains(secret));
        assertTrue("the test's counts were logged", logged);
    }

    // ---- Helpers --------------------------------------------------------------------------------

    private void switchOn() {
        Settings.V2RAY_PROXIES.save(true);
        V2RayProxies.switched();
        settle();
    }

    /** Every start, test and change on its way has ended. */
    private static void settle() {
        try {
            for (int round = 0; round < 4; round++) {
                Utils.awaitBackgroundTasksForTests();
                ShadowLooper.idleMainLooper();
            }
        } catch (Exception failure) {
            throw new AssertionError(failure);
        }
    }

    private Fake fake(String kind, String secret, boolean tls) throws IOException {
        Fake fake = new Fake(kind, secret, "", tls, false);
        open.add(fake);
        return fake;
    }

    private static void assertNothingListens(int port) {
        try (Socket socket = new Socket()) {
            socket.connect(new InetSocketAddress("127.0.0.1", port), 2000);
            fail("still listening on " + port);
        } catch (IOException expected) {
            // Stopped.
        }
    }

    private static List<String> hosts(List<V2RayLinks.Server> servers) {
        List<String> hosts = new ArrayList<>();
        for (V2RayLinks.Server server : servers) hosts.add(server.host);
        return hosts;
    }

    private static List<Integer> ports(List<V2RayLinks.Server> servers) {
        List<Integer> ports = new ArrayList<>();
        for (V2RayLinks.Server server : servers) ports.add(server.port);
        return ports;
    }

    private static byte[] readN(InputStream in, int length) throws IOException {
        byte[] bytes = new byte[length];
        V2RayTunnels.readFully(in, bytes, false);
        return bytes;
    }

    /** A resPQ as Telegram's server sends it in the intermediate transport, [size] bytes of packet. */
    private static byte[] resPq(byte[] nonce, long constructor, int size) {
        byte[] answer = new byte[4 + size];
        answer[0] = (byte) size;
        answer[1] = (byte) (size >> 8);
        // auth_key_id 0 and a message id, then the body's length, its constructor and the client's nonce.
        answer[4 + 16] = (byte) (size - 20);
        for (int i = 0; i < 4; i++) answer[4 + 20 + i] = (byte) (constructor >>> (8 * i));
        System.arraycopy(nonce, 0, answer, 4 + 24, 16);
        return answer;
    }

    /** Telegram's server as far as the first step of a sign-in: a resPQ for the nonce asked, or for another. */
    private static V2RayFakes.Destination telegram(boolean sameNonce) {
        return (heard, in, out) -> {
            byte[] request = V2RayFakes.readN(in, 48);
            heard.got(request, request.length);
            answer(request, sameNonce, out);
        };
    }

    /** Answers a timing as Telegram would, and echoes anything else. */
    private static V2RayFakes.Destination telegramOrEcho() {
        return (heard, in, out) -> {
            byte[] head = V2RayFakes.readN(in, 4);
            if (head[0] == (byte) 0xee && head[1] == (byte) 0xee && head[2] == (byte) 0xee && head[3] == (byte) 0xee) {
                byte[] request = V2RayCrypto.concat(head, V2RayFakes.readN(in, 44));
                heard.got(request, request.length);
                answer(request, true, out);
                return;
            }
            heard.got(head, head.length);
            out.write(head);
            out.flush();
            V2RayFakes.echo(heard, in, out);
        };
    }

    private static void answer(byte[] request, boolean sameNonce, OutputStream out) throws IOException {
        byte[] nonce = Arrays.copyOfRange(request, 32, 48);
        if (!sameNonce) nonce[0] ^= 1;
        out.write(resPq(nonce, 0x05162463L, 84));
        out.flush();
    }

    /** Proxy lists by address, answering one list with [text]. */
    private static final class Lists implements FreeProxies.Transport {
        private final String text;

        Lists(String text) {
            this.text = text;
        }

        @Override public String get(String address, int limit, long deadline) {
            return text;
        }

        @Override public long connectMs(String host, int port, int timeoutMs) throws IOException {
            throw new IOException("not asked here");
        }
    }

    /** Telegram's proxy list as the patch's calls behave, the current one deletable as {@link V2RayProxies.TelegramStore}'s is. */
    private static final class FakeStore implements V2RayProxies.Store {
        final List<String> saved = new ArrayList<>();
        String current;
        boolean enabled;
        boolean refuseAll;
        int uses;

        @Override public boolean saved(String link) {
            return saved.contains(link);
        }

        @Override public boolean add(String link) {
            if (refuseAll) return false;
            if (!saved.contains(link)) saved.add(0, link);
            return true;
        }

        @Override public boolean inUse() {
            return enabled && current != null;
        }

        @Override public boolean current(String link) {
            return link.equals(current);
        }

        @Override public boolean use(String link) {
            if (!saved.contains(link)) return false;
            uses++;
            current = link;
            enabled = true;
            return true;
        }

        @Override public void remove(String link) {
            saved.remove(link);
            if (link.equals(current)) current = null;
        }
    }
}
