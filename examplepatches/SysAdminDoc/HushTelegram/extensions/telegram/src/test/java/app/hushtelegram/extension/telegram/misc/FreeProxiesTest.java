/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FreeProxiesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final FreeProxies.Transport transportBefore = FreeProxies.transport;
    private final FreeProxies.Store storeBefore = FreeProxies.store;
    private final Random randomBefore = FreeProxies.random;
    private FakeNet net;
    private FakeList list;

    @Before public void setUp() {
        restore();
        net = new FakeNet();
        list = new FakeList();
        FreeProxies.transport = net;
        FreeProxies.store = list;
        FreeProxies.random = new Random(66);
    }

    @After public void restore() {
        settle();
        FreeProxies.transport = transportBefore;
        FreeProxies.store = storeBefore;
        FreeProxies.random = randomBefore;
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SIGN_IN_PROXY);
        Settings.FREE_PROXIES.resetToDefault();
        Settings.SIGN_IN_PROXY.resetToDefault();
        FreeProxies.Stored.TRIED_AT.resetToDefault();
        FreeProxies.Stored.RESULT.resetToDefault();
        FreeProxies.Stored.ADDED.resetToDefault();
        PatchFamilyForTests.reset();
        HookStatus.clear();
    }

    // ---- Lists ----------------------------------------------------------------------------------

    @Test public void readsEveryKindOfLinkAListHas() {
        String secret = secret();
        List<FreeProxies.Proxy> found = FreeProxies.parse(String.join("\n",
                "https://t.me/proxy?server=Proxy.Example.org&port=443&secret=" + secret,
                "  tg://proxy?server=10.1.2.3&amp;port=8443&amp;secret=" + secret + "\r",
                "telegram.me/proxy?server=mt.example.net&port=80&secret=" + secret,
                "https://telegram.dog/proxy?secret=" + secret + "&port=9000&server=dog.example.com&extra=1",
                "tg://proxy?server=b64.example.com&port=443&secret=ABCDEFGHIJKLMNOPQRSTUVwx-_%3D%3D"));
        assertEquals(Arrays.asList("proxy.example.org", "10.1.2.3", "mt.example.net", "dog.example.com", "b64.example.com"),
                servers(found));
        assertEquals(8443, found.get(1).port);
        assertEquals("the link is built back the way Telegram reads it",
                "tg://proxy?server=10.1.2.3&port=8443&secret=" + secret, found.get(1).link());
        assertEquals("ABCDEFGHIJKLMNOPQRSTUVwx-_==", found.get(4).secret);
    }

    @Test public void skipsWhatIsNotAProxyItCouldReach() {
        String secret = secret();
        String[] bad = {
            "https://t.me/proxy?server=0.0.0.0&port=0&secret=" + secret,
            "https://t.me/proxy?server=a.example.com&port=65536&secret=" + secret,
            "https://t.me/proxy?server=a.example.com&port=44a&secret=" + secret,
            "https://t.me/proxy?server=bad_host.example.com&port=443&secret=" + secret,
            "https://t.me/proxy?server=999.1.1.1&port=443&secret=" + secret,
            "https://t.me/proxy?server=localhost&port=443&secret=" + secret,
            "https://t.me/proxy?server=a.example.com&port=443&secret=abcd",
            "https://t.me/proxy?server=a.example.com&port=443",
            "https://t.me/socks?server=a.example.com&port=443&secret=" + secret,
            "https://example.com/proxy?server=a.example.com&port=443&secret=" + secret,
            "https://t.me/proxy?server=a.example.com%zz&port=443&secret=" + secret,
            "https://t.me/proxy",
            "?server=a.example.com&port=443&secret=" + secret,
        };
        for (String link : bad) assertNull(link, FreeProxies.parseLink(link));
        assertTrue(FreeProxies.parse(String.join("\n", bad)).isEmpty());
        assertTrue(FreeProxies.parse("").isEmpty());
    }

    @Test public void oneProxyPerServerAndPort() {
        String secret = secret();
        List<FreeProxies.Proxy> found = FreeProxies.parse(
                "tg://proxy?server=a.example.com&port=443&secret=" + secret
                        + " https://t.me/proxy?server=A.example.com&port=443&secret=dd" + secret
                        + " tg://proxy?server=a.example.com&port=444&secret=" + secret);
        assertEquals(2, found.size());
        assertEquals("the first one listed stays", secret, found.get(0).secret);
        assertEquals(444, found.get(1).port);
    }

    @Test public void timesSixtyAtMostPickedAtRandom() {
        List<FreeProxies.Proxy> many = proxies(100);
        List<FreeProxies.Proxy> picked = FreeProxies.pick(many, new Random(1));
        assertEquals(FreeProxies.MAX_TIMED, picked.size());
        assertEquals(FreeProxies.MAX_TIMED, new HashSet<>(picked).size());
        assertTrue(many.containsAll(picked));
        assertNotEquals("each try reaches different ones", picked, FreeProxies.pick(many, new Random(2)));
        List<FreeProxies.Proxy> few = proxies(5);
        assertEquals(few, FreeProxies.pick(few, new Random(1)));
    }

    @Test public void keepsTheTenFastestFastestFirst() {
        List<FreeProxies.Proxy> listed = proxies(15);
        for (int i = 0; i < 15; i++) {
            // Every fourth one doesn't answer, which leaves twelve.
            if (i % 4 != 3) net.answers(listed.get(i), 1000 - i * 50);
        }
        List<FreeProxies.Proxy> fastest = FreeProxies.time(net, listed);
        assertEquals(FreeProxies.KEEP, fastest.size());
        for (int i = 1; i < fastest.size(); i++) assertTrue(fastest.get(i - 1).ms <= fastest.get(i).ms);
        assertEquals("p14.example.com", fastest.get(0).server);
        for (FreeProxies.Proxy proxy : fastest) assertTrue(proxy.server, net.times.containsKey(proxy.server + ":" + proxy.port));
        assertFalse("the two slowest are left out", servers(fastest).contains("p0.example.com"));
        assertFalse(servers(fastest).contains("p1.example.com"));
        assertEquals(15, net.connects.get());
        assertTrue(FreeProxies.time(net, Collections.emptyList()).isEmpty());
    }

    @Test public void listsAreTriedInOrderUntilOneHasProxies() {
        net.lists.put(FreeProxies.FEEDS.get(1), "not a proxy");
        net.lists.put(FreeProxies.FEEDS.get(2), "tg://proxy?server=a.example.com&port=443&secret=" + secret());
        assertEquals(1, FreeProxies.fetch(net).size());
        assertEquals(FreeProxies.FEEDS, net.asked);
        assertTrue(FreeProxies.fetch(new FakeNet()).isEmpty());
    }

    // ---- Telegram's list ------------------------------------------------------------------------

    @Test public void theFastestGoesOnTopAndTelegramConnectsThroughIt() {
        Set<String> owned = FreeProxies.apply(list, Arrays.asList("A", "B", "C"), set(), true);
        assertEquals(Arrays.asList("A", "B", "C"), list.saved);
        assertEquals(set("A", "B", "C"), owned);
        assertEquals("A", list.current);
        assertTrue(list.enabled);
        assertTrue("Telegram moves on by itself when one stops answering", list.rotating);
    }

    @Test public void aProxyOfTheirOwnInUseStaysInUse() {
        list.saved.add("MINE");
        list.use("MINE");
        Set<String> owned = FreeProxies.apply(list, Arrays.asList("A", "B"), set(), true);
        assertEquals(set("A", "B"), owned);
        assertEquals(Arrays.asList("A", "B", "MINE"), list.saved);
        assertEquals("MINE", list.current);
        assertFalse(list.rotating);

        // Saved but turned off, it isn't in use, so the fastest is.
        list.enabled = false;
        FreeProxies.apply(list, Arrays.asList("A", "B"), owned, true);
        assertEquals("A", list.current);
        assertTrue(list.enabled);
    }

    @Test public void withTheSwitchOffTheyGoInTheListButAreNotUsed() {
        Set<String> owned = FreeProxies.apply(list, Arrays.asList("A", "B"), set(), false);
        assertEquals(Arrays.asList("A", "B"), list.saved);
        assertEquals(set("A", "B"), owned);
        assertNull(list.current);
        assertFalse(list.enabled);
        assertFalse(list.rotating);
    }

    @Test public void onlyItsOwnComeOutAgainAndNeverTheOneInUse() {
        list.saved.add("SAVED");
        Set<String> owned = FreeProxies.apply(list, Arrays.asList("A", "SAVED", "B"), set(), true);
        assertEquals("one they saved stays theirs", set("A", "B"), owned);
        assertEquals("A", list.current);

        owned = FreeProxies.apply(list, Arrays.asList("C", "D"), owned, false);
        assertEquals("the one in use stays until a later try moves off it", set("C", "D", "A"), owned);
        assertEquals(Arrays.asList("C", "D", "A", "SAVED"), list.saved);
        assertEquals("A", list.current);

        owned = FreeProxies.apply(list, Arrays.asList("C", "D"), owned, true);
        assertEquals("C", list.current);
        assertEquals(set("C", "D"), owned);
        assertEquals(Arrays.asList("C", "D", "SAVED"), list.saved);
    }

    @Test public void onePinnedInProxyOrderStaysAndIsTheirsFromThen() {
        Set<String> owned = FreeProxies.apply(list, Arrays.asList("A", "B"), set(), false);
        list.pinned.add("B");
        owned = FreeProxies.apply(list, Arrays.asList("C"), owned, false);
        assertEquals(Arrays.asList("C", "B"), list.saved);
        assertEquals("the pinned one is no longer owned", set("C"), owned);

        list.pinned.clear();
        FreeProxies.apply(list, Arrays.asList("D"), owned, false);
        assertEquals("unpinned later, it's still theirs", Arrays.asList("D", "B"), list.saved);
    }

    @Test public void theBestAlreadyInUseIsLeftAlone() {
        Set<String> owned = FreeProxies.apply(list, Arrays.asList("A", "B"), set(), true);
        list.uses = 0;
        list.rotating = false;
        FreeProxies.apply(list, Arrays.asList("A", "C"), owned, true);
        assertEquals(0, list.uses);
        assertFalse(list.rotating);
        assertEquals("B is no longer among the fastest", Arrays.asList("C", "A"), list.saved);
    }

    @Test public void oneTelegramWontTakeIsNotOwnedOrUsed() {
        list.refused.add("A");
        Set<String> owned = FreeProxies.apply(list, Arrays.asList("A", "B"), set(), true);
        assertEquals(set("B"), owned);
        assertEquals("B", list.current);
        FreeProxies.apply(list, Arrays.asList("D"), owned, false);
        list.refused.add("C");
        owned = FreeProxies.apply(list, Arrays.asList("C"), set("B", "D"), true);
        assertEquals("nothing taken, nothing moves", "B", list.current);
        assertEquals(set("B", "D"), owned);
        assertEquals(Arrays.asList("D", "B"), list.saved);
    }

    @Test public void whatEachPlacingCameToIsKept() {
        Settings.FREE_PROXIES.save(true);
        FreeProxies.place(Arrays.asList("A", "B"));
        assertEquals("ADDED 2", FreeProxies.Stored.RESULT.get());
        assertEquals(set("A", "B"), FreeProxies.added());
        assertEquals("A", list.current);

        list.refused.add("C");
        FreeProxies.place(Arrays.asList("C"));
        assertEquals("NOT_TAKEN 0", FreeProxies.Stored.RESULT.get());
        assertEquals(set("A", "B"), FreeProxies.added());
        assertEquals(Arrays.asList("A", "B"), list.saved);

        FreeProxies.store = new FakeList() {
            @Override public boolean add(String link) {
                throw new IllegalStateException("a build whose proxy calls changed");
            }
        };
        FreeProxies.place(Arrays.asList("D"));
        assertEquals("NOT_TAKEN 0", FreeProxies.Stored.RESULT.get());
        assertEquals("the list it owns is as it was", set("A", "B"), FreeProxies.added());
    }

    // ---- A whole try ----------------------------------------------------------------------------

    @Test public void findNowAddsTheFastestEvenWithTheSwitchOffButOnlyConnectsWithItOn() {
        serve(12);
        assertTrue(FreeProxies.findNow());
        assertEquals("Looking for free proxies now.", FreeProxies.summary());
        settle();
        assertEquals(FreeProxies.KEEP, list.saved.size());
        assertEquals("p11.example.com", FreeProxies.parseLink(list.saved.get(0)).server);
        assertNull("off, Telegram isn't told to use one", list.current);
        assertEquals("ADDED 10", FreeProxies.Stored.RESULT.get());
        assertEquals(FreeProxies.KEEP, FreeProxies.added().size());
        assertTrue(FreeProxies.Stored.TRIED_AT.get() > 0);
        assertEquals("Proxies added last time: 10. They're in Telegram's proxy list.", FreeProxies.summary());

        Settings.FREE_PROXIES.save(true);
        assertTrue(FreeProxies.findNow());
        settle();
        assertEquals(list.saved.get(0), list.current);
        assertEquals("a second try adds nothing twice", FreeProxies.KEEP, list.saved.size());
    }

    @Test public void aTryOnItsWayAnswersASecondTap() {
        serve(3);
        assertTrue(FreeProxies.findNow());
        assertTrue(FreeProxies.findNow());
        settle();
        assertEquals(1, net.asked.size());
    }

    @Test public void theScreenHearsWhenATryEndsWhileItWatches() {
        AtomicInteger heard = new AtomicInteger();
        FreeProxies.Listener screen = heard::incrementAndGet;
        FreeProxies.watch(screen);
        try {
            FreeProxies.findNow();
            settle();
            assertEquals(1, heard.get());
            assertEquals("Couldn't download a proxy list last time. Check your connection and try again.",
                    FreeProxies.summary());
            FreeProxies.unwatch(screen);
            FreeProxies.findNow();
            settle();
            assertEquals(1, heard.get());
        } finally {
            FreeProxies.unwatch(screen);
        }
    }

    @Test public void noListAndNoAnswerAreToldApart() {
        assertTrue(FreeProxies.findNow());
        settle();
        assertEquals("NO_LIST 0", FreeProxies.Stored.RESULT.get());
        assertEquals(FreeProxies.FEEDS, net.asked);

        net.lists.put(FreeProxies.FEEDS.get(0), "tg://proxy?server=a.example.com&port=443&secret=" + secret());
        assertTrue(FreeProxies.findNow());
        settle();
        assertEquals("NONE_ANSWERED 0", FreeProxies.Stored.RESULT.get());
        assertEquals("None of the listed proxies answered last time. Try again later.", FreeProxies.summary());
        assertTrue(list.saved.isEmpty());
    }

    @Test public void aStartTriesOnlyWithTheSwitchOnInABuildWithThePatchAndSixHoursGone() {
        serve(3);
        long now = TimeUnit.DAYS.toMillis(20_000);
        PatchFamilyForTests.inBuild(PatchFamily.FREE_PROXIES);
        FreeProxies.onTelegramStart(now);
        settle();
        assertTrue("off by default", net.asked.isEmpty());

        Settings.FREE_PROXIES.save(true);
        PatchFamilyForTests.inBuild();
        FreeProxies.onTelegramStart(now);
        settle();
        assertTrue("a switch left on by an older build does nothing", net.asked.isEmpty());

        PatchFamilyForTests.inBuild(PatchFamily.FREE_PROXIES);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            FreeProxies.onTelegramStart(now);
            settle();
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> FreeProxies.onTelegramStart(now));
        settle();
        assertTrue("paused or before the settings are ready, nothing", net.asked.isEmpty());

        FreeProxies.onTelegramStart(now);
        settle();
        assertEquals(1, net.asked.size());
        assertEquals(now, (long) FreeProxies.Stored.TRIED_AT.get());
        FreeProxies.onTelegramStart(now + TimeUnit.HOURS.toMillis(5));
        settle();
        assertEquals(1, net.asked.size());
        FreeProxies.onTelegramStart(now + TimeUnit.HOURS.toMillis(6));
        settle();
        assertEquals(2, net.asked.size());
    }

    @Test public void dueAfterSixHoursOrWhenTheClockWentBack() {
        long hour = TimeUnit.HOURS.toMillis(1);
        assertTrue(FreeProxies.due(100 * hour, 0));
        assertFalse(FreeProxies.due(100 * hour, 100 * hour - 5 * hour));
        assertTrue(FreeProxies.due(100 * hour, 100 * hour - 6 * hour));
        assertTrue("set back past the last try", FreeProxies.due(100 * hour, 101 * hour));
    }

    @Test public void theRowSaysWhatTheLastTryFound() {
        assertEquals("Downloads a public list of proxies now, times them and adds the fastest to Telegram's "
                + "proxy list, even with the switch above off.", FreeProxies.summary());
        FreeProxies.Stored.TRIED_AT.save(5L);
        FreeProxies.Stored.RESULT.save("NOT_TAKEN 0");
        assertEquals("Telegram didn't take the proxies last time.", FreeProxies.summary());
        FreeProxies.Stored.RESULT.save("ADDED 7");
        assertEquals("Proxies added last time: 7. They're in Telegram's proxy list.", FreeProxies.summary());
        FreeProxies.Stored.RESULT.save("SOMETHING_NEWER 3");
        assertTrue("a result it doesn't know reads as no try", FreeProxies.summary().startsWith("Downloads"));
    }

    // ---- The phone number screen -----------------------------------------------------------------

    @Test public void theSignInScreenShowsTheProxyButtonUnlessTurnedOff() {
        assertTrue(Settings.SIGN_IN_PROXY.get());
        assertTrue(FreeProxies.signInButton(1));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.FREE_PROXIES));
        Settings.SIGN_IN_PROXY.save(false);
        assertFalse(FreeProxies.signInButton(1));
    }

    @Test public void pausedOrUnreadableTheSignInScreenStaysAsTelegramBuiltIt() {
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), FreeProxies.signInButton(1));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(FreeProxies.signInButton(1)));
        SettingReadsForTests.breakReads(Settings.SIGN_IN_PROXY);
        assertFalse(FreeProxies.signInButton(1));
        assertFalse(HookStatus.missing(FamilyNames.FREE_PROXIES).isEmpty());
    }

    // ---- Helpers --------------------------------------------------------------------------------

    /** Every try on its way has ended and told the main thread. */
    private static void settle() {
        try {
            for (int round = 0; round < 3; round++) {
                Utils.awaitBackgroundTasksForTests();
                ShadowLooper.idleMainLooper();
            }
        } catch (Exception failure) {
            throw new AssertionError(failure);
        }
    }

    /** A secret of 17 bytes in hex, made here so no key-shaped constant sits in the source. */
    private static String secret() {
        StringBuilder hex = new StringBuilder("ee");
        for (int i = 0; i < 16; i++) hex.append(Integer.toHexString(0xa0 + i));
        return hex.toString();
    }

    private static List<FreeProxies.Proxy> proxies(int count) {
        List<FreeProxies.Proxy> made = new ArrayList<>();
        for (int i = 0; i < count; i++) made.add(new FreeProxies.Proxy("p" + i + ".example.com", 443, secret()));
        return made;
    }

    /** The first list has [count] proxies, and the later in the list, the faster it answers. */
    private void serve(int count) {
        StringBuilder text = new StringBuilder();
        List<FreeProxies.Proxy> listed = proxies(count);
        for (int i = 0; i < count; i++) {
            text.append(listed.get(i).link()).append('\n');
            net.answers(listed.get(i), 1000 - i);
        }
        net.lists.put(FreeProxies.FEEDS.get(0), text.toString());
    }

    private static List<String> servers(List<FreeProxies.Proxy> proxies) {
        List<String> names = new ArrayList<>();
        for (FreeProxies.Proxy proxy : proxies) names.add(proxy.server);
        return names;
    }

    private static Set<String> set(String... links) {
        return new LinkedHashSet<>(Arrays.asList(links));
    }

    /** Lists and connect times by address, and every request made. */
    private static final class FakeNet implements FreeProxies.Transport {
        final Map<String, String> lists = new HashMap<>();
        final Map<String, Long> times = new ConcurrentHashMap<>();
        final List<String> asked = Collections.synchronizedList(new ArrayList<>());
        final AtomicInteger connects = new AtomicInteger();

        void answers(FreeProxies.Proxy proxy, long ms) {
            times.put(proxy.server + ":" + proxy.port, ms);
        }

        @Override public String get(String address, int limit, long deadline) throws IOException {
            asked.add(address);
            String text = lists.get(address);
            if (text == null) throw new IOException("no list there");
            return text;
        }

        @Override public long connectMs(String host, int port, int timeoutMs) throws IOException {
            connects.incrementAndGet();
            Long ms = times.get(host + ":" + port);
            if (ms == null) throw new IOException("no answer");
            return ms;
        }
    }

    /** Telegram's proxy list as the patch's calls behave: new ones on top, the current one never deleted. */
    private static class FakeList implements FreeProxies.Store {
        final List<String> saved = new ArrayList<>();
        final Set<String> refused = new HashSet<>();
        final Set<String> pinned = new HashSet<>();
        String current;
        boolean enabled;
        boolean rotating;
        int uses;

        @Override public boolean saved(String link) {
            return saved.contains(link);
        }

        @Override public boolean add(String link) {
            if (refused.contains(link)) return false;
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

        @Override public void delete(String link) {
            if (!link.equals(current)) saved.remove(link);
        }

        @Override public boolean pinned(String link) {
            return pinned.contains(link);
        }

        @Override public void rotate() {
            rotating = true;
        }
    }
}
