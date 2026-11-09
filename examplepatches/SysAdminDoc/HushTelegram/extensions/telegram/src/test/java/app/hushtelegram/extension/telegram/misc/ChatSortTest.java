/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChatSortTest {
    private static final long ARCHIVE = 99;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private HiddenChatsForTests.Fake telegram;
    private final Map<Long, Integer> dates = new HashMap<>();

    @Before public void setUp() {
        // Chats 11 to 16 by id. 11 is pinned and 99 is the archive row, both fixed in place.
        telegram = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
        ArrayList<Object> list = new ArrayList<>();
        list.add(new HiddenChatsForTests.Dialog(11).pin(1));
        list.add(new HiddenChatsForTests.Dialog(ARCHIVE));
        for (long id = 12; id <= 16; id++) list.add(new HiddenChatsForTests.Dialog(id));
        telegram.folders.put(0, list);
        telegram.users.put(0, 1000L);
        // Stock order is newest first, 12 the newest. Chat 14 got a later message since.
        dates.put(11L, 100);
        dates.put(12L, 500);
        dates.put(13L, 400);
        dates.put(14L, 450);
        dates.put(15L, 300);
        dates.put(16L, 200);
        ChatSort.telegram = new ChatSort.Telegram() {
            @Override public int lastDate(Object dialog) { return dates.get(((HiddenChatsForTests.Dialog) dialog).id); }
            @Override public boolean isFolder(Object dialog) { return ((HiddenChatsForTests.Dialog) dialog).id == ARCHIVE; }
        };
        Settings.SORT_BY_DATE.resetToDefault();
        Settings.SORT_OLDEST_FIRST.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        HiddenChatsForTests.restore();
        ChatSort.telegram = new ChatSort.Telegram() {
            @Override public int lastDate(Object dialog) { return ChatSort.lastDate(dialog); }
            @Override public boolean isFolder(Object dialog) { return ChatSort.isFolder(dialog); }
        };
        SettingReadsForTests.mend(Settings.SORT_BY_DATE);
        Settings.SORT_BY_DATE.resetToDefault();
        Settings.SORT_OLDEST_FIRST.resetToDefault();
        HookStatus.clear();
    }

    private String list() {
        return String.valueOf(telegram.folders.get(0));
    }

    @Test public void offByDefaultTheSortLeavesTheListAlone() {
        HiddenChats.prune(new Object());
        assertEquals("[11, 99, 12, 13, 14, 15, 16]", list());
    }

    @Test public void newestFirstPutsTheLaterMessageUpAndKeepsPinnedAndArchiveInPlace() {
        Settings.SORT_BY_DATE.save(true);
        HiddenChats.prune(new Object());
        assertEquals("[11, 99, 12, 14, 13, 15, 16]", list());
        assertTrue(String.join("\n", HookStatus.report()), String.join("\n", HookStatus.report()).contains(ChatSort.SORTED));
    }

    @Test public void oldestFirstTurnsTheMovableChatsAround() {
        Settings.SORT_BY_DATE.save(true);
        Settings.SORT_OLDEST_FIRST.save(true);
        HiddenChats.prune(new Object());
        assertEquals("[11, 99, 16, 15, 13, 14, 12]", list());
    }

    @Test public void theFolderTabsListsFollowToo() {
        Settings.SORT_BY_DATE.save(true);
        Settings.SORT_OLDEST_FIRST.save(true);
        HiddenChatsForTests.Filter tab = new HiddenChatsForTests.Filter();
        tab.dialogs.add(new HiddenChatsForTests.Dialog(12));
        tab.dialogs.add(new HiddenChatsForTests.Dialog(13));
        telegram.filters = new Object[]{tab, null};
        HiddenChats.prune(new Object());
        assertEquals("[13, 12]", String.valueOf(tab.dialogs));
    }

    @Test public void datesThatMatchKeepTheirOrder() {
        List<String> list = new ArrayList<>(Arrays.asList("a", "b", "c", "d"));
        ChatSort.sortSlots(list, false, each -> 5, each -> false);
        assertEquals(Arrays.asList("a", "b", "c", "d"), list);
        ChatSort.sortSlots(list, true, each -> 5, each -> false);
        assertEquals(Arrays.asList("a", "b", "c", "d"), list);
    }

    @Test public void nullsAndFixedEntriesNeverMove() {
        List<String> list = new ArrayList<>(Arrays.asList("p", null, "x", "y", "q"));
        Map<String, Integer> by = new HashMap<>();
        by.put("x", 1);
        by.put("y", 2);
        ChatSort.sortSlots(list, false, by::get, each -> each.equals("p") || each.equals("q"));
        assertEquals(Arrays.asList("p", null, "y", "x", "q"), list);
    }
}
