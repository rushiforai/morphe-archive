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
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
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
public class KeepEditsTest {
    private static final KeepEdits.Persist REAL_PERSIST = KeepEdits.persist;
    private static final KeepEdits.Edits REAL_EDITS = KeepEdits.edits;
    private static final KeepEdits.Sources REAL_SOURCES = KeepEdits.sources;
    private static final long SELF = 99;
    private static final long FRIEND = 5;
    private static final long CHANNEL = -1000000000042L;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Memory memory;
    private Account account;

    @Before public void reset() {
        restore();
        memory = new Memory();
        account = new Account();
        KeepEdits.persist = memory;
        KeepEdits.sources = controller -> account;
        // The test's "message" is the edit itself: chat, ID, new text and edit time.
        KeepEdits.edits = message -> (Object[]) message;
        KeepEdits.forgetAllForTests();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_EDIT_HISTORY);
        Settings.KEEP_EDIT_HISTORY.resetToDefault();
        KeepEdits.persist = REAL_PERSIST;
        KeepEdits.edits = REAL_EDITS;
        KeepEdits.sources = REAL_SOURCES;
        KeepEdits.forgetAllForTests();
        HookStatus.clear();
    }

    private static Object[] edit(long dialog, int id, String text, int date) {
        return new Object[] {dialog, id, text, date};
    }

    private static List<String> texts(List<KeepEdits.Version> versions) {
        List<String> out = new ArrayList<>();
        for (KeepEdits.Version version : versions) out.add(version.text);
        return out;
    }

    @Test public void offByDefaultNothingIsReadOrKept() {
        assertFalse(Settings.KEEP_EDIT_HISTORY.get());
        account.rows.put(FRIEND + ":7", new KeepEdits.Stored("before", false, false, false));
        KeepEdits.edited(edit(FRIEND, 7, "after", 1000), null);
        assertTrue("nothing goes to the storage queue", account.queue.isEmpty());
        assertTrue(memory.values.isEmpty());

        // Kept while on, then hidden again once it's off: off reads as stock.
        Settings.KEEP_EDIT_HISTORY.save(true);
        KeepEdits.edited(edit(FRIEND, 7, "after", 1000), null);
        account.runQueue();
        assertEquals(Collections.singletonList("before"), texts(KeepEdits.earlier(SELF, FRIEND, 7)));
        Settings.KEEP_EDIT_HISTORY.save(false);
        assertTrue(KeepEdits.earlier(SELF, FRIEND, 7).isEmpty());
    }

    @Test public void someoneElsesEditKeepsTheTextFromBeforeWithTheEditTime() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        account.rows.put(CHANNEL + ":3", new KeepEdits.Stored("price is 10", false, false, false));
        KeepEdits.edited(edit(CHANNEL, 3, "price is 12", 1_790_000_123), null);
        assertTrue("the stored copy is read on the storage queue, ahead of Telegram's own write", account.read.isEmpty());
        account.runQueue();
        List<KeepEdits.Version> kept = KeepEdits.earlier(SELF, CHANNEL, 3);
        assertEquals(1, kept.size());
        assertEquals("price is 10", kept.get(0).text);
        assertEquals(1_790_000_123, kept.get(0).replaced);
        assertTrue("other messages have nothing", KeepEdits.earlier(SELF, CHANNEL, 4).isEmpty());
        assertTrue("another account has nothing", KeepEdits.earlier(SELF + 1, CHANNEL, 3).isEmpty());

        // A second edit adds the text it replaced, oldest first.
        account.rows.put(CHANNEL + ":3", new KeepEdits.Stored("price is 12", false, false, false));
        KeepEdits.edited(edit(CHANNEL, 3, "price is 15", 1_790_000_200), null);
        account.runQueue();
        assertEquals(Arrays.asList("price is 10", "price is 12"), texts(KeepEdits.earlier(SELF, CHANNEL, 3)));
        assertTrue(String.join("\n", HookStatus.report()).contains("earlier text kept"));
    }

    @Test public void ownTimedProtectedUnchangedAndUnknownMessagesKeepNothing() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        account.rows.put(FRIEND + ":1", new KeepEdits.Stored("mine", true, false, false));
        account.rows.put(FRIEND + ":2", new KeepEdits.Stored("vanishing", false, true, false));
        account.rows.put(FRIEND + ":3", new KeepEdits.Stored("protected", false, false, true));
        account.rows.put(FRIEND + ":4", new KeepEdits.Stored("same", false, false, false));
        account.rows.put(FRIEND + ":5", new KeepEdits.Stored("", false, false, false));
        account.rows.put(SELF + ":6", new KeepEdits.Stored("saved", false, false, false));
        KeepEdits.edited(edit(FRIEND, 1, "x", 10), null);
        KeepEdits.edited(edit(FRIEND, 2, "x", 10), null);
        KeepEdits.edited(edit(FRIEND, 3, "x", 10), null);
        KeepEdits.edited(edit(FRIEND, 4, "same", 10), null);
        KeepEdits.edited(edit(FRIEND, 5, "caption added", 10), null);
        KeepEdits.edited(edit(SELF, 6, "x", 10), null);
        KeepEdits.edited(edit(FRIEND, 8, "not on this phone", 10), null);
        KeepEdits.edited(edit(0, 9, "x", 10), null);
        KeepEdits.edited(edit(FRIEND, 0, "x", 10), null);
        KeepEdits.edited(null, null);
        account.runQueue();
        assertTrue(memory.values.toString(), memory.values.isEmpty());
        for (int id = 0; id <= 9; id++) assertTrue(KeepEdits.earlier(SELF, FRIEND, id).isEmpty());
    }

    @Test public void aMessageKeepsItsFirstTextAndTheNewestAfterIt() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        for (int n = 0; n < KeepEdits.VERSIONS + 2; n++) {
            account.rows.put(FRIEND + ":7", new KeepEdits.Stored("text " + n, false, false, false));
            KeepEdits.edited(edit(FRIEND, 7, "text " + (n + 1), 100 + n), null);
            account.runQueue();
        }
        assertEquals(Arrays.asList("text 0", "text 3", "text 4", "text 5", "text 6"), texts(KeepEdits.earlier(SELF, FRIEND, 7)));
    }

    @Test public void twoEditsInOneBatchKeepTheEarlierTextOnce() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        account.rows.put(FRIEND + ":7", new KeepEdits.Stored("first", false, false, false));
        KeepEdits.edited(edit(FRIEND, 7, "second", 100), null);
        KeepEdits.edited(edit(FRIEND, 7, "third", 101), null);
        account.runQueue();
        assertEquals(Arrays.asList("first"), texts(KeepEdits.earlier(SELF, FRIEND, 7)));
    }

    @Test public void pastTheLimitTheOldestMessageIsForgottenOnDiskToo() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        for (int id = 1; id <= KeepEdits.LIMIT + 1; id++) {
            assertTrue(KeepEdits.remember(SELF, FRIEND, id, "before " + id, 100));
        }
        assertTrue(KeepEdits.earlier(SELF, FRIEND, 1).isEmpty());
        assertFalse(memory.values.containsKey("m_" + SELF + "_" + FRIEND + ":1"));
        assertEquals(KeepEdits.LIMIT, memory.values.get("order_" + SELF).split(",").length);
        assertEquals(Collections.singletonList("before 2"), texts(KeepEdits.earlier(SELF, FRIEND, 2)));

        // Read back from the disk, as after a restart.
        KeepEdits.forgetAllForTests();
        assertEquals(Collections.singletonList("before " + (KeepEdits.LIMIT + 1)),
                texts(KeepEdits.earlier(SELF, FRIEND, KeepEdits.LIMIT + 1)));
    }

    @Test public void aWriteThatDoesntReachTheDiskKeepsNothingAndSaysSo() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        memory.failWrites = true;
        assertFalse(KeepEdits.remember(SELF, FRIEND, 7, "before", 100));
        memory.failWrites = false;
        assertTrue(KeepEdits.earlier(SELF, FRIEND, 7).isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("saving earlier text"));
    }

    @Test public void clearForgetsEveryAccountWithTheSwitchOnOrOff() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        KeepEdits.remember(SELF, FRIEND, 1, "a", 100);
        KeepEdits.remember(SELF, FRIEND, 2, "b", 100);
        KeepEdits.remember(SELF + 1, CHANNEL, 3, "c", 100);
        Settings.KEEP_EDIT_HISTORY.save(false);
        assertEquals(3, KeepEdits.clear());
        assertTrue(memory.values.isEmpty());
        Settings.KEEP_EDIT_HISTORY.save(true);
        assertTrue(KeepEdits.earlier(SELF, FRIEND, 1).isEmpty());
        assertTrue(KeepEdits.earlier(SELF + 1, CHANNEL, 3).isEmpty());
        assertEquals("a second tap has nothing to clear", 0, KeepEdits.clear());
        memory.failClear = true;
        assertEquals(-1, KeepEdits.clear());

        assertEquals("Couldn't complete that action. Try again.", KeepEdits.clearedMessage(-1));
        assertEquals("There's no edit history to clear.", KeepEdits.clearedMessage(0));
        assertEquals("Cleared the edit history of 1 message.", KeepEdits.clearedMessage(1));
        assertEquals("Cleared the edit history of 3 messages.", KeepEdits.clearedMessage(3));
    }

    @Test public void pausedOrUnreadableTheSwitchReadsOff() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        assertTrue(KeepEdits.on());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), KeepEdits.on());
            PauseForTests.resume();
        }
        SettingReadsForTests.breakReads(Settings.KEEP_EDIT_HISTORY);
        assertFalse(KeepEdits.on());
    }

    @Test public void storedTextSurvivesAnyCharacters() {
        List<KeepEdits.Version> versions = Arrays.asList(new KeepEdits.Version("a,b:c", 1), new KeepEdits.Version("", 2),
                new KeepEdits.Version("12,3:line\nnext", 1_790_000_000));
        List<KeepEdits.Version> back = KeepEdits.decode(KeepEdits.encode(versions));
        assertEquals(Arrays.asList("a,b:c", "", "12,3:line\nnext"), texts(back));
        assertEquals(1_790_000_000, back.get(2).replaced);
        assertThrows(IllegalArgumentException.class, () -> KeepEdits.decode("12,99:short"));
        assertThrows(IllegalArgumentException.class, () -> KeepEdits.decode("garbage"));
    }

    @Test public void anUnreadableKeptTextReadsAsNoneAndIsReported() {
        Settings.KEEP_EDIT_HISTORY.save(true);
        KeepEdits.remember(SELF, FRIEND, 7, "before", 100);
        memory.values.put("m_" + SELF + "_" + FRIEND + ":7", "garbage");
        assertTrue(KeepEdits.earlier(SELF, FRIEND, 7).isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("reading earlier text"));
    }

    /** One account's storage queue and stored messages. */
    private static final class Account implements KeepEdits.Source {
        final Map<String, KeepEdits.Stored> rows = new HashMap<>();
        final List<Runnable> queue = new ArrayList<>();
        final List<String> read = new ArrayList<>();

        @Override public long self() { return SELF; }

        @Override public void post(Runnable work) { queue.add(work); }

        @Override public KeepEdits.Stored stored(long dialogId, int id) {
            read.add(dialogId + ":" + id);
            return rows.get(dialogId + ":" + id);
        }

        void runQueue() {
            List<Runnable> work = new ArrayList<>(queue);
            queue.clear();
            for (Runnable runnable : work) runnable.run();
        }
    }

    private static final class Memory implements KeepEdits.Persist {
        final Map<String, String> values = new HashMap<>();
        boolean failWrites;
        boolean failClear;

        @Override public String read(String key) { return values.getOrDefault(key, ""); }

        @Override public boolean write(Map<String, String> entries) {
            if (failWrites) return false;
            for (Map.Entry<String, String> entry : entries.entrySet()) {
                if (entry.getValue() == null) values.remove(entry.getKey());
                else values.put(entry.getKey(), entry.getValue());
            }
            return true;
        }

        @Override public int clear() {
            if (failClear) return -1;
            int count = 0;
            for (String key : values.keySet()) if (key.startsWith("m_")) count++;
            values.clear();
            return count;
        }
    }
}
