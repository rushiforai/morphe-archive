/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProxyOrderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Telegram's own sort for the screen here: by name. */
    private static final Comparator<Object> TELEGRAM = (a, b) -> String.valueOf(a).compareTo(String.valueOf(b));

    private final ProxyOrder.Store storeBefore = ProxyOrder.store;
    private FakeList list;

    @Before public void setUp() {
        restore();
        list = new FakeList();
        ProxyOrder.store = list;
    }

    @After public void restore() {
        ProxyOrder.store = storeBefore;
        PauseForTests.resume();
        ProxyOrder.Stored.ARRANGED.resetToDefault();
        HookStatus.clear();
    }

    // ---- The proxy screen -----------------------------------------------------------------------

    @Test public void withNothingKeptTheScreenSortsAsTelegramDoes() {
        assertEquals(Arrays.asList("A", "B", "C"), sorted("C", "A", "B"));
        assertFalse(report().contains("proxy list in your order"));
    }

    @Test public void keptOnesComeFirstInTheirOrderAndTheRestInTelegrams() {
        ProxyOrder.Stored.ARRANGED.save("*kD\nkB");
        assertEquals(Arrays.asList("D", "B", "A", "C", "E"), sorted("A", "B", "C", "D", "E"));
        assertTrue(report().contains("proxy list in your order"));
    }

    @Test public void anOrderOfProxiesNoLongerSavedIsTelegrams() {
        ProxyOrder.Stored.ARRANGED.save("*kZ\nkY");
        assertEquals(Arrays.asList("A", "B"), sorted("B", "A"));
    }

    @Test public void pausedOrNotReadyTheScreenSortsAsTelegramDoes() {
        ProxyOrder.Stored.ARRANGED.save("kB\nkA");
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), Arrays.asList("A", "B"), sorted("B", "A"));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertEquals(Arrays.asList("A", "B"), sorted("B", "A")));
        SettingsContextRule.beforeThePauseIsDecided(() -> assertEquals(Arrays.asList("A", "B"), sorted("B", "A")));
        assertEquals("kept through the pause", Arrays.asList("B", "A"), sorted("A", "B"));
    }

    @Test public void aProxyThatCantBeReadLeavesTelegramsSort() {
        ProxyOrder.Stored.ARRANGED.save("kB\nkA");
        list.broken = true;
        assertEquals(Arrays.asList("A", "B"), sorted("B", "A"));
        assertTrue(report().contains("proxy order key"));
    }

    // ---- Keys -----------------------------------------------------------------------------------

    @Test public void aProxyIsKnownByItsAddressPortAndSecretWhateverElseIsWritten() {
        String key = ProxyOrder.key(written("proxy_ip", "10.1.2.3", "proxy_port", "443", "proxy_secret", "ee00"));
        assertTrue(key, key.matches("[0-9a-f]{64}"));
        assertEquals("a field Telegram adds later doesn't lose the order", key,
                ProxyOrder.key(written("proxy_type", "1", "proxy_secret", "ee00", "proxy_port", "443", "proxy_ip", "10.1.2.3")));
        assertNotEquals(key, ProxyOrder.key(written("proxy_ip", "10.1.2.3", "proxy_port", "443", "proxy_secret", "ee01")));
        assertNotEquals(key, ProxyOrder.key(written("proxy_ip", "10.1.2.3", "proxy_port", "80", "proxy_secret", "ee00")));
        assertNotEquals(key, ProxyOrder.key(written("proxy_ip", "10.1.2.3", "proxy_port", "443", "proxy_secret", "ee00",
                "proxy_user", "me")));
        assertNotEquals("renamed fields still tell proxies apart",
                ProxyOrder.key(written("ip", "10.1.2.3")), ProxyOrder.key(written("ip", "10.1.2.4")));
    }

    @Test public void whatTelegramWritesIsTakenDownAndNotSaved() {
        ProxyOrder.Capture capture = new ProxyOrder.Capture();
        capture.putString("proxy_ip", "10.1.2.3").putInt("proxy_port", 443).putString("proxy_secret", null)
                .putBoolean("proxy_enabled", true).putString("gone", "x").remove("gone");
        assertTrue(capture.commit());
        Map<String, String> expected = written("proxy_enabled", "true", "proxy_ip", "10.1.2.3", "proxy_port", "443");
        assertEquals(expected, capture.written);
        assertEquals("10.1.2.3:443", ProxyOrder.label(capture.written));
        assertEquals("Proxy", ProxyOrder.label(written("proxy_port", "443")));
        assertEquals("10.1.2.3", ProxyOrder.label(written("proxy_ip", "10.1.2.3")));
    }

    // ---- The order editor -----------------------------------------------------------------------

    @Test public void theEditorShowsPinsThenTheOrderKeptThenTheRestWithTheOneInUseFirst() {
        list.entries = new ArrayList<>(Arrays.asList("A", "B", "C", "D", "E", "C"));
        list.current = "D";
        ProxyOrder.Stored.ARRANGED.save("*kC\nkA\nkGone");
        List<ProxyOrder.Row> rows = ProxyOrder.rows();
        assertEquals(Arrays.asList("kC", "kA", "kD", "kB", "kE"), keys(rows));
        assertTrue(rows.get(0).pinned);
        assertFalse(rows.get(1).pinned);
        assertTrue(rows.get(2).inUse);
        assertEquals("D:443", rows.get(2).label);
    }

    @Test public void noListGivesNoRows() {
        list.entries = null;
        assertTrue(ProxyOrder.rows().isEmpty());
        list.entries = new ArrayList<>(Arrays.asList("A"));
        list.broken = true;
        assertTrue(ProxyOrder.rows().isEmpty());
    }

    @Test public void pinsAloneKeepTelegramsOrderForTheRest() {
        list.entries = new ArrayList<>(Arrays.asList("A", "B", "C"));
        assertEquals("Drag the proxies in Telegram's proxy list into your own order, or pin some on top.", ProxyOrder.summary());
        List<ProxyOrder.Row> rows = ProxyOrder.rows();
        rows.get(2).pinned = true;
        rows.add(0, rows.remove(2));
        assertTrue(ProxyOrder.save(rows, false));
        assertEquals("*kC", ProxyOrder.Stored.ARRANGED.savedValue());
        assertFalse(ProxyOrder.ownOrder());
        assertTrue(ProxyOrder.pinned("C"));
        assertFalse(ProxyOrder.pinned("A"));
        assertEquals("1 proxy pinned on top of Telegram's proxy list. The rest keep Telegram's order.", ProxyOrder.summary());
        assertEquals(Arrays.asList("C", "A", "B"), sorted("B", "C", "A"));
    }

    @Test public void aMovedProxyKeepsTheWholeListInThatOrder() {
        list.entries = new ArrayList<>(Arrays.asList("A", "B", "C"));
        List<ProxyOrder.Row> rows = ProxyOrder.rows();
        rows.add(0, rows.remove(2));
        assertTrue(ProxyOrder.save(rows, true));
        assertEquals("kC\nkA\nkB", ProxyOrder.Stored.ARRANGED.savedValue());
        assertTrue(ProxyOrder.ownOrder());
        assertEquals("Telegram's proxy list is in your order. Tap to change it.", ProxyOrder.summary());
        assertEquals("one saved later goes below, in Telegram's order",
                Arrays.asList("C", "A", "B", "D"), sorted("D", "A", "B", "C"));

        rows.get(1).pinned = true;
        rows.add(0, rows.remove(1));
        assertTrue(ProxyOrder.save(rows, true));
        assertEquals("*kA\nkC\nkB", ProxyOrder.Stored.ARRANGED.savedValue());
        assertEquals("Telegram's proxy list is in your order, with 1 proxy pinned on top.", ProxyOrder.summary());
    }

    @Test public void aPinnedProxyDeletedInTelegramStopsCountingAndComesBackPinnedWhenSavedAgain() {
        list.entries = new ArrayList<>(Arrays.asList("A", "B"));
        ProxyOrder.Stored.ARRANGED.save("*kA");
        assertEquals("1 proxy pinned on top of Telegram's proxy list. The rest keep Telegram's order.", ProxyOrder.summary());

        // Both deleted in Telegram's proxy screen, as on the phone.
        list.entries = new ArrayList<>();
        assertEquals("Drag the proxies in Telegram's proxy list into your own order, or pin some on top.", ProxyOrder.summary());
        ProxyOrder.Stored.ARRANGED.save("kB\n*kA");
        assertEquals("Drag the proxies in Telegram's proxy list into your own order, or pin some on top.", ProxyOrder.summary());

        list.entries = new ArrayList<>(Arrays.asList("A"));
        assertEquals("1 proxy pinned on top of Telegram's proxy list. The rest keep Telegram's order.", ProxyOrder.summary());
        assertTrue(ProxyOrder.rows().get(0).pinned);

        // A list that can't be read counts every line kept.
        list.entries = null;
        assertEquals("Telegram's proxy list is in your order, with 1 proxy pinned on top.", ProxyOrder.summary());
    }

    // ---- Helpers --------------------------------------------------------------------------------

    private static List<Object> sorted(String... shown) {
        List<Object> list = new ArrayList<>(Arrays.asList((Object[]) shown));
        ProxyOrder.sort(list, TELEGRAM);
        return list;
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    private static Map<String, String> written(String... pairs) {
        Map<String, String> map = new java.util.TreeMap<>();
        for (int i = 0; i < pairs.length; i += 2) map.put(pairs[i], pairs[i + 1]);
        return map;
    }

    private static List<String> keys(List<ProxyOrder.Row> rows) {
        List<String> keys = new ArrayList<>();
        for (ProxyOrder.Row row : rows) keys.add(row.key);
        return keys;
    }

    /** Telegram's proxy list: each entry a name, known as "k" and its name. */
    private static final class FakeList implements ProxyOrder.Store {
        List<Object> entries = new ArrayList<>();
        String current;
        boolean broken;

        @Override public List<?> entries() {
            return entries;
        }

        @Override public String key(Object entry) {
            if (broken) throw new IllegalStateException("no such field");
            return "k" + entry;
        }

        @Override public String label(Object entry) {
            return entry + ":443";
        }

        @Override public boolean inUse(Object entry) {
            return entry.equals(current);
        }
    }
}
