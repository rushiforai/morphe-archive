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
public class KeepDeletedTest {
    private static final KeepDeleted.Persist REAL_PERSIST = KeepDeleted.persist;
    private static final KeepDeleted.Keys REAL_KEYS = KeepDeleted.keys;
    private static final long SELF = 99;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() {
        restore();
        KeepDeleted.persist = new Memory();
        KeepDeleted.forgetAllForTests();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_DELETED_MESSAGES);
        Settings.KEEP_DELETED_MESSAGES.resetToDefault();
        KeepDeleted.persist = REAL_PERSIST;
        KeepDeleted.keys = REAL_KEYS;
        KeepDeleted.STOCK.remove();
        KeepDeleted.forgetAllForTests();
        HookStatus.clear();
    }

    @Test public void offByDefaultNothingIsTaken() {
        assertFalse(Settings.KEEP_DELETED_MESSAGES.get());
        assertFalse(KeepDeleted.userUpdate(new Update(1, 2), null));
        assertFalse(KeepDeleted.channelUpdate(new Update(1, 2), null));
        assertFalse(KeepDeleted.push(null, 0, new ArrayList<>(Arrays.asList(1, 2)), 0));
        KeepDeleted.measuring(new Object());
        assertEquals("9:41 PM", KeepDeleted.labelled("9:41 PM"));
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.KEEP_DELETED_MESSAGES));
    }

    @Test public void onKeepsPlainMessagesFromOthersAndHandsTheRestToTelegram() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Fake telegram = new Fake(
                new KeepDeleted.Row(10, 1, false, false, false),
                new KeepDeleted.Row(10, 2, true, false, false),
                new KeepDeleted.Row(10, 3, false, true, false),
                new KeepDeleted.Row(10, 4, false, false, true),
                new KeepDeleted.Row(SELF, 6, false, false, false));
        assertTrue(KeepDeleted.start(telegram, 0, ids(1, 2, 3, 4, 5, 6), 0));
        assertEquals("the decision runs on the storage queue", 1, telegram.posted.size());
        assertTrue("nothing happens before it runs", telegram.stock.isEmpty());
        telegram.posted.get(0).run();

        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
        for (int id = 2; id <= 4; id++) assertFalse("id " + id, KeepDeleted.isKept(SELF, 10, id));
        assertFalse(KeepDeleted.isKept(SELF, SELF, 6));
        assertEquals("your own, timed, protected, saved-messages and unknown ones go the stock way",
                Arrays.asList("0:[2, 3, 4, 5, 6]:0"), telegram.stock);
    }

    @Test public void aFailedLookupLeavesEverythingToTelegramAndKeepsNothing() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Fake telegram = new Fake();
        telegram.failRows = true;
        KeepDeleted.decide(telegram, -1000000000042L, ids(7, 8), 42);
        assertFalse(KeepDeleted.isKept(SELF, -1000000000042L, 7));
        assertEquals(Arrays.asList("-1000000000042:[7, 8]:42"), telegram.stock);

        Fake refusing = new Fake();
        refusing.refusePost = true;
        assertFalse("a queue that takes no work leaves the deletion to Telegram",
                KeepDeleted.start(refusing, 0, ids(1), 0));
    }

    @Test public void pausingAnEarlyStartAnUnreadableSwitchOrAnyFailureKeepsTelegramsDeletion() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        // With the switch on, a controller that can't be read still ends in the stock deletion.
        assertFalse(KeepDeleted.userUpdate(new Update(1, 2), null));
        assertFalse(KeepDeleted.push(new Object(), 0, new ArrayList<>(Arrays.asList(1)), 0));
        // The ids handed back to Telegram aren't asked again.
        KeepDeleted.STOCK.set(Boolean.TRUE);
        assertFalse(KeepDeleted.push(new Object(), 0, new ArrayList<>(Arrays.asList(1)), 0));
        KeepDeleted.STOCK.remove();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), KeepDeleted.on());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(KeepDeleted.on()));
        SettingReadsForTests.breakReads(Settings.KEEP_DELETED_MESSAGES);
        assertFalse(KeepDeleted.on());
        assertFalse(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).isEmpty());
    }

    @Test public void aKeptMessageShowsTheLabelAndStaysKeptAfterARestart() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}));
        long[] shown = {SELF, 10, 1};
        KeepDeleted.keys = message -> shown;
        KeepDeleted.measuring(new Object());
        assertEquals("deleted 9:41 PM", KeepDeleted.labelled("9:41 PM"));
        shown[2] = 2;
        assertEquals("9:41 PM", KeepDeleted.labelled("9:41 PM"));
        assertNull(KeepDeleted.labelled(null));

        KeepDeleted.forgetAllForTests();
        assertTrue("read back from what was saved", KeepDeleted.isKept(SELF, 10, 1));
        Settings.KEEP_DELETED_MESSAGES.save(false);
        KeepDeleted.measuring(new Object());
        shown[2] = 1;
        assertEquals("off shows no label, and keeps what was saved", "9:41 PM", KeepDeleted.labelled("9:41 PM"));
        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
    }

    @Test public void aMessageThatStillGoesHasItsNotificationClearedUnderTelegramsOwnKey() {
        long channel = -1000000000042L;
        Fake telegram = new Fake(new KeepDeleted.Row(channel, 1, false, false, false), new KeepDeleted.Row(channel, 2, true, false, false));
        KeepDeleted.decide(telegram, channel, ids(1, 2), 42);
        assertEquals(Arrays.asList(channel + ":[2]:42"), telegram.stock);
        assertEquals("only the message that goes, after Telegram deleted it", Arrays.asList("[2]:42"), telegram.cleared);

        Fake user = new Fake(new KeepDeleted.Row(10, 3, true, false, false));
        KeepDeleted.decide(user, 0, ids(3, 4), 0);
        assertEquals(Arrays.asList("[3, 4]:0"), user.cleared);
    }

    @Test public void nothingReleasedOrAFailedDeletionClearsNoNotification() {
        Fake kept = new Fake(new KeepDeleted.Row(10, 1, false, false, false));
        KeepDeleted.decide(kept, 0, ids(1), 0);
        assertTrue(kept.stock.isEmpty());
        assertTrue(kept.cleared.isEmpty());

        Fake failing = new Fake();
        failing.failStock = true;
        KeepDeleted.decide(failing, 0, ids(5), 0);
        assertTrue("a message Telegram didn't delete keeps its notification", failing.cleared.isEmpty());
    }

    @Test public void aFailedCleanupStillLeavesTheDeletionDoneAndShowsInTheReport() {
        Fake telegram = new Fake();
        telegram.failClear = true;
        KeepDeleted.decide(telegram, 0, ids(5), 0);
        assertEquals(Arrays.asList("0:[5]:0"), telegram.stock);
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("notification cleanup"));
    }

    @Test public void theBridgeFillsTelegramsRenamedSparseArrayWithItsOnlyPut() throws Exception {
        TelegramController controller = new TelegramController();
        KeepDeletedBridge bridge = KeepDeletedBridge.of(controller);
        bridge.clearNotifications(ids(5, 6), 42);
        bridge.clearNotifications(ids(7), 0);
        assertEquals(Arrays.asList("-42=[5, 6] reactions=false", "0=[7] reactions=false"), controller.notifications.calls);
    }

    private static ArrayList<Integer> ids(Integer... ids) { return new ArrayList<>(Arrays.asList(ids)); }

    /** Public, like Telegram's own classes, so the bridge reaches them the same way. */
    public static final class TelegramController {
        final Notifications notifications = new Notifications();

        public Object getMessagesStorage() { return new Object(); }

        public Notifications getNotificationsController() { return notifications; }
    }

    public static final class Notifications {
        final List<String> calls = new ArrayList<>();

        public void removeDeletedMessagesFromNotifications(RenamedSparseArray deleted, boolean reactions) {
            calls.add(deleted.key + "=" + deleted.value + " reactions=" + reactions);
        }

        public void removeDeletedHisoryFromNotifications(Object counts) {
            throw new AssertionError("the history cleanup isn't this one");
        }
    }

    /** Shaped like R8's androidx LongSparseArray in the fixtures: one (Object, long) put among other one-letter methods. */
    public static final class RenamedSparseArray {
        long key = Long.MIN_VALUE;
        Object value;

        public RenamedSparseArray() { }

        public void k(Object value, long key) {
            this.key = key;
            this.value = value;
        }

        public Object g(Object value, long key) { throw new AssertionError("not the put"); }

        public void a(Long value, long key) { throw new AssertionError("not the put"); }
    }

    /** What a deletion update looks like to the bridge: public fields with Telegram's names. */
    public static final class Update {
        public ArrayList<Integer> messages;
        public long channel_id;

        Update(Integer first, Integer second) { messages = ids(first, second); }
    }

    private static final class Memory implements KeepDeleted.Persist {
        private final Map<String, String> values = new HashMap<>();

        @Override public String read(String key) { return values.get(key); }

        @Override public void write(String key, String value) { values.put(key, value); }
    }

    private static final class Fake implements KeepDeleted.Source {
        final List<KeepDeleted.Row> rows;
        final List<Runnable> posted = new ArrayList<>();
        final List<String> stock = new ArrayList<>();
        final List<String> cleared = new ArrayList<>();
        boolean failRows;
        boolean refusePost;
        boolean failStock;
        boolean failClear;

        Fake(KeepDeleted.Row... rows) { this.rows = Arrays.asList(rows); }

        @Override public long self() { return SELF; }

        @Override public void post(Runnable work) {
            if (refusePost) throw new IllegalStateException("no work");
            posted.add(work);
        }

        @Override public List<KeepDeleted.Row> rows(long dialogId, List<Integer> ids) {
            if (failRows) throw new IllegalStateException("no database");
            return rows;
        }

        @Override public void stock(long dialogId, ArrayList<Integer> ids, long channelId) {
            if (failStock) throw new IllegalStateException("no deletion");
            stock.add(dialogId + ":" + ids + ":" + channelId);
        }

        @Override public void clearNotifications(ArrayList<Integer> ids, long channelId) {
            if (failClear) throw new IllegalStateException("no notifications");
            cleared.add(ids + ":" + channelId);
        }
    }
}
