/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.hushtelegram.extension.shared.L10nTablesForTests;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LocalPinsTest {
    private static final long ARCHIVE = 99;
    private static final String STOCK = "[99, 11, 12, 13, 14, 15, 16, 17]";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private HiddenChatsForTests.Fake telegram;
    private final Map<Long, Integer> dates = new HashMap<>();

    @Before public void setUp() {
        // All Chats as Telegram sorts it: the archive row, two server pins (11, 12), then 13 to 17 newest first.
        telegram = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
        ArrayList<Object> all = new ArrayList<>();
        all.add(new HiddenChatsForTests.Dialog(ARCHIVE));
        all.add(new HiddenChatsForTests.Dialog(11).pin(2));
        all.add(new HiddenChatsForTests.Dialog(12).pin(1));
        for (long id = 13; id <= 17; id++) all.add(new HiddenChatsForTests.Dialog(id));
        telegram.folders.put(0, all);
        // The archive's own list.
        telegram.folder(1, 13, 14, 15);
        telegram.users.put(0, 1000L);
        dates.put(11L, 100);
        dates.put(12L, 90);
        dates.put(13L, 500);
        dates.put(14L, 450);
        dates.put(15L, 400);
        dates.put(16L, 300);
        dates.put(17L, 200);
        ChatSort.telegram = new ChatSort.Telegram() {
            @Override public int lastDate(Object dialog) { return dates.get(((HiddenChatsForTests.Dialog) dialog).id); }
            @Override public boolean isFolder(Object dialog) { return ((HiddenChatsForTests.Dialog) dialog).id == ARCHIVE; }
        };
        PatchFamilyForTests.installed(PatchFamily.Capability.LOCAL_PINS);
        LocalPins.selection = list -> telegram.picked;
        Settings.LOCAL_PINS.resetToDefault();
        Settings.LOCAL_PINNED_CHATS.resetToDefault();
        Settings.SORT_BY_DATE.resetToDefault();
        Settings.SORT_OLDEST_FIRST.resetToDefault();
        Settings.HIDDEN_CHATS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        HiddenChatsForTests.restore();
        PauseForTests.resume();
        PatchFamilyForTests.resetCapabilities();
        LocalPins.selection = LocalPins::selectedOf;
        ChatSort.telegram = new ChatSort.Telegram() {
            @Override public int lastDate(Object dialog) { return ChatSort.lastDate(dialog); }
            @Override public boolean isFolder(Object dialog) { return ChatSort.isFolder(dialog); }
        };
        SettingReadsForTests.mend(Settings.LOCAL_PINS);
        Settings.LOCAL_PINS.resetToDefault();
        Settings.LOCAL_PINNED_CHATS.resetToDefault();
        Settings.SORT_BY_DATE.resetToDefault();
        Settings.SORT_OLDEST_FIRST.resetToDefault();
        Settings.HIDDEN_CHATS.resetToDefault();
        HookStatus.clear();
    }

    private String all() {
        return String.valueOf(telegram.folders.get(0));
    }

    private String report() {
        return String.join("\n", HookStatus.report());
    }

    private void tap(int id) throws Exception {
        assertEquals(HiddenChats.CLOSE_SELECTION, HiddenChats.menuChoice(new Object(), id));
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
    }

    @Test public void offByDefaultTheListKeepsTelegramsOrder() {
        Settings.LOCAL_PINNED_CHATS.save("16,17");
        assertFalse(Settings.LOCAL_PINS.get());
        HiddenChats.prune(new Object());
        assertEquals(STOCK, all());
        assertFalse(report(), report().contains(LocalPins.SORTED));
    }

    @Test public void onThePickedChatsSitRightUnderTheServerPinsNewestFirst() {
        Settings.LOCAL_PINS.save(true);
        // 11 is pinned on the server too and keeps its place there.
        Settings.LOCAL_PINNED_CHATS.save("17,11,15");
        HiddenChats.prune(new Object());
        assertEquals("[99, 11, 12, 15, 17, 13, 14, 16]", all());
        assertTrue(report(), report().contains(LocalPins.SORTED));
        // A newer message moves a picked chat up among the picked ones, never above the server pins.
        dates.put(17L, 900);
        HiddenChats.prune(new Object());
        assertEquals("[99, 11, 12, 17, 15, 13, 14, 16]", all());
    }

    @Test public void theArchiveAndTheFolderTabsKeepTelegramsOrder() {
        Settings.LOCAL_PINS.save(true);
        Settings.LOCAL_PINNED_CHATS.save("15");
        HiddenChatsForTests.Filter tab = new HiddenChatsForTests.Filter();
        tab.dialogs.add(new HiddenChatsForTests.Dialog(14));
        tab.dialogs.add(new HiddenChatsForTests.Dialog(15));
        telegram.filters = new Object[]{tab, null};
        HiddenChats.prune(new Object());
        assertEquals("[99, 11, 12, 15, 13, 14, 16, 17]", all());
        assertEquals("[13, 14, 15]", String.valueOf(telegram.folders.get(1)));
        assertEquals("[14, 15]", String.valueOf(tab.dialogs));
    }

    @Test public void oldestChatsFirstLeavesThePickedChatsNewestFirst() {
        Settings.SORT_BY_DATE.save(true);
        Settings.SORT_OLDEST_FIRST.save(true);
        Settings.LOCAL_PINS.save(true);
        Settings.LOCAL_PINNED_CHATS.save("16,13");
        HiddenChats.prune(new Object());
        assertEquals("[99, 11, 12, 13, 16, 17, 15, 14]", all());
    }

    @Test public void hiddenChatsStayOutEvenWhenPickedHere() {
        Settings.HIDDEN_CHATS.save(true);
        HiddenChats.hide(1000, new LinkedHashSet<>(Collections.singletonList(15L)));
        Settings.LOCAL_PINS.save(true);
        Settings.LOCAL_PINNED_CHATS.save("15,16");
        HiddenChats.prune(new Object());
        assertEquals("[99, 11, 12, 16, 13, 14, 17]", all());
    }

    @Test public void nullsAndFixedEntriesNeverMove() {
        List<String> list = new ArrayList<>(Arrays.asList("p", null, "x", "y", "z", "q"));
        Map<String, Integer> by = new HashMap<>();
        by.put("y", 1);
        by.put("z", 2);
        LocalPins.lead(list, each -> each.equals("p") || each.equals("q"), each -> !each.equals("x"), by::get);
        assertEquals(Arrays.asList("p", null, "z", "y", "x", "q"), list);
        // Nothing picked: nothing moves.
        List<String> none = new ArrayList<>(Arrays.asList("a", "b"));
        LocalPins.lead(none, each -> false, each -> false, each -> 0);
        assertEquals(Arrays.asList("a", "b"), none);
    }

    @Test public void aBuildWithoutTheSelectionStubKeepsTheStockListAndMenu() {
        PatchFamilyForTests.installed();
        Settings.LOCAL_PINS.save(true);
        Settings.LOCAL_PINNED_CHATS.save("16");
        HiddenChats.prune(new Object());
        assertEquals(STOCK, all());
        Object list = new Object();
        HiddenChats.menuItem(list, new Object());
        telegram.picked.add(16L);
        HiddenChats.menuShown(list);
        assertEquals(View.GONE, telegram.items.get(LocalPins.PIN_ID).getVisibility());
        assertEquals(View.GONE, telegram.items.get(LocalPins.UNPIN_ID).getVisibility());
        assertEquals(LocalPins.PIN_ID, HiddenChats.menuChoice(new Object(), LocalPins.PIN_ID));
        assertEquals("16", Settings.LOCAL_PINNED_CHATS.get());
    }

    @Test public void pauseMissingContextBrokenReadsAndAStrangeValueKeepTheStockOrder() {
        Settings.LOCAL_PINS.save(true);
        Settings.LOCAL_PINNED_CHATS.save("16,17");
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            HiddenChats.prune(new Object());
            assertEquals(reason.name(), STOCK, all());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> HiddenChats.prune(new Object()));
        assertEquals(STOCK, all());
        assertFalse(report(), report().contains(LocalPins.SORTED));
        SettingReadsForTests.breakReads(Settings.LOCAL_PINS);
        HiddenChats.prune(new Object());
        assertEquals(STOCK, all());
        SettingReadsForTests.mend(Settings.LOCAL_PINS);
        HookStatus.clear();
        Settings.LOCAL_PINNED_CHATS.save("16,abc");
        HiddenChats.prune(new Object());
        assertEquals(STOCK, all());
        assertFalse(report(), report().contains(LocalPins.SORTED));
        // Telegram's side changing under the hook leaves the order as it was and says so.
        Settings.LOCAL_PINNED_CHATS.save("16,17");
        HiddenChatsForTests.use(new HiddenChatsForTests.Fake() {
            @Override public long dialogId(Object dialog) { throw new IllegalStateException("Telegram changed"); }
        }).folders.put(0, telegram.folders.get(0));
        HiddenChats.prune(new Object());
        assertEquals(STOCK, all());
        String missed = String.join("\n", HookStatus.missing(FamilyNames.HIDE_FOLDER_COUNTERS));
        assertTrue(missed, missed.contains("'" + LocalPins.SORTED + "'"));
    }

    @Test public void theMenuOffersPinOrUnpinForWhatIsSelected() {
        Object list = new Object();
        HiddenChats.menuItem(list, new Object());
        View pin = telegram.items.get(LocalPins.PIN_ID);
        View unpin = telegram.items.get(LocalPins.UNPIN_ID);
        assertEquals(View.GONE, pin.getVisibility());
        assertEquals(View.GONE, unpin.getVisibility());
        Settings.LOCAL_PINS.save(true);
        telegram.picked.add(13L);
        HiddenChats.menuShown(list);
        assertEquals(View.VISIBLE, pin.getVisibility());
        assertEquals(View.GONE, unpin.getVisibility());
        // Every selected chat already pinned here: Unpin on this phone instead.
        Settings.LOCAL_PINNED_CHATS.save("13,14");
        telegram.picked.add(14L);
        HiddenChats.menuShown(list);
        assertEquals(View.GONE, pin.getVisibility());
        assertEquals(View.VISIBLE, unpin.getVisibility());
        // One that isn't: Pin on this phone again.
        telegram.picked.add(15L);
        HiddenChats.menuShown(list);
        assertEquals(View.VISIBLE, pin.getVisibility());
        assertEquals(View.GONE, unpin.getVisibility());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            HiddenChats.menuShown(list);
            assertEquals(reason.name(), View.GONE, pin.getVisibility());
            assertEquals(reason.name(), View.GONE, unpin.getVisibility());
            PauseForTests.resume();
        }
        Settings.LOCAL_PINS.save(false);
        HiddenChats.menuShown(list);
        assertEquals(View.GONE, pin.getVisibility());
        assertEquals(View.GONE, unpin.getVisibility());
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void aTapPinsThePickedChatsSortsTheListAgainAndSaysSo() throws Exception {
        Settings.LOCAL_PINS.save(true);
        telegram.picked.addAll(Arrays.asList(16L, 17L));
        tap(LocalPins.PIN_ID);
        assertEquals("16,17", Settings.LOCAL_PINNED_CHATS.get());
        assertEquals(Collections.singletonList(0), telegram.resorted);
        assertEquals("Pinned in All Chats on this phone.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        HiddenChats.prune(new Object());
        assertEquals("[99, 11, 12, 16, 17, 13, 14, 15]", all());
        // Picking one again doesn't repeat it.
        telegram.picked.clear();
        telegram.picked.add(17L);
        tap(LocalPins.PIN_ID);
        assertEquals("16,17", Settings.LOCAL_PINNED_CHATS.get());
    }

    @Test public void unpinTakesOnlyThePickedChatsOff() throws Exception {
        Settings.LOCAL_PINS.save(true);
        Settings.LOCAL_PINNED_CHATS.save("15,16,17");
        telegram.picked.add(16L);
        tap(LocalPins.UNPIN_ID);
        assertEquals("15,17", Settings.LOCAL_PINNED_CHATS.get());
        assertEquals("Unpinned on this phone.", String.valueOf(ShadowToast.getTextOfLatestToast()));
        HiddenChats.prune(new Object());
        assertEquals("[99, 11, 12, 15, 17, 13, 14, 16]", all());
    }

    @Test public void pastTheLimitNothingIsSaved() throws Exception {
        Settings.LOCAL_PINS.save(true);
        List<String> twenty = new ArrayList<>();
        for (int i = 101; i <= 100 + LocalPins.MAX_PINS; i++) twenty.add(String.valueOf(i));
        String full = String.join(",", twenty);
        Settings.LOCAL_PINNED_CHATS.save(full);
        telegram.picked.add(16L);
        tap(LocalPins.PIN_ID);
        assertEquals(full, Settings.LOCAL_PINNED_CHATS.get());
        assertTrue(telegram.resorted.isEmpty());
        assertEquals("You can pin up to 20 chats on this phone.", String.valueOf(ShadowToast.getTextOfLatestToast()));
    }

    @Test public void offEmptyOrOtherTapsGoOnAsTheyCame() throws Exception {
        telegram.picked.add(16L);
        assertEquals(LocalPins.PIN_ID, HiddenChats.menuChoice(new Object(), LocalPins.PIN_ID));
        assertEquals(LocalPins.UNPIN_ID, HiddenChats.menuChoice(new Object(), LocalPins.UNPIN_ID));
        assertEquals("", Settings.LOCAL_PINNED_CHATS.get());
        Settings.LOCAL_PINS.save(true);
        telegram.picked.clear();
        tap(LocalPins.PIN_ID);
        assertEquals("", Settings.LOCAL_PINNED_CHATS.get());
        assertTrue(telegram.resorted.isEmpty());
        assertNull(ShadowToast.getTextOfLatestToast());
        // A broken read of the selection leaves the tap to Telegram.
        HiddenChatsForTests.use(new HiddenChatsForTests.Fake() {
            @Override public List<?> selectedChats(Object listener) { throw new IllegalStateException("Telegram changed"); }
        });
        assertEquals(LocalPins.PIN_ID, HiddenChats.menuChoice(new Object(), LocalPins.PIN_ID));
        assertEquals("", Settings.LOCAL_PINNED_CHATS.get());
    }

    @Test public void onlyValuesThisWritesAreKept() {
        assertTrue(LocalPins.allowed(""));
        assertTrue(LocalPins.allowed("12,-34"));
        assertEquals(2, LocalPins.count("12,-34"));
        assertEquals(new LinkedHashSet<>(Arrays.asList(12L, -34L)), LocalPins.parse("12,-34"));
        for (String bad : new String[]{null, "12,12", "0", "12,abc", "+5", " 5", "05", "12,", ",12", "-0", "1.5"}) {
            assertFalse(String.valueOf(bad), LocalPins.allowed(bad));
            assertEquals(String.valueOf(bad), 0, LocalPins.count(bad));
        }
        List<String> ids = new ArrayList<>();
        for (int i = 1; i <= LocalPins.MAX_PINS; i++) ids.add(String.valueOf(i));
        assertTrue(LocalPins.allowed(String.join(",", ids)));
        ids.add("21");
        assertFalse(LocalPins.allowed(String.join(",", ids)));
        assertEquals("12,-34", LocalPins.join(LocalPins.parse("12,-34")));
    }

    @Test public void theToastsFitTwoLinesInEveryLanguage() {
        String[] toasts = {"Pinned in All Chats on this phone.", "Unpinned on this phone.",
                "You can pin up to %1$d chats on this phone.", "Couldn't save the chats. Try again in a moment."};
        for (String toast : toasts) {
            assertFitsATwoLineToast("en", String.format(Locale.ROOT, toast, LocalPins.MAX_PINS));
            for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr", "zh-hans"}) {
                String row = L10nTablesForTests.of(language).get(toast);
                assertNotNull(language + ": " + toast, row);
                assertFitsATwoLineToast(language, String.format(Locale.ROOT, row, LocalPins.MAX_PINS));
            }
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }
}
