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
import org.robolectric.shadows.ShadowLooper;
import org.telegram.tgnet.TLRPC;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KeepDeletedTest {
    private static final KeepDeleted.Persist REAL_PERSIST = KeepDeleted.persist;
    private static final KeepDeleted.Keys REAL_KEYS = KeepDeleted.keys;
    private static final KeepDeleted.Accounts REAL_ACCOUNTS = KeepDeleted.accounts;
    private static final long SELF = 99;
    private static final long CHANNEL = -1000000000042L;

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
        KeepDeleted.accounts = REAL_ACCOUNTS;
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

    @Test public void aKeptMessageOnScreenIsDrawnAgainSoTheOpenChatShowsItsLabel() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        Object first = new Object();
        Object second = new Object();
        Object mine = new Object();
        Object elsewhere = new Object();
        Map<Object, long[]> shown = new HashMap<>();
        shown.put(first, new long[] {SELF, 10, 1});
        shown.put(mine, new long[] {SELF, 10, 2});
        shown.put(elsewhere, new long[] {SELF, 11, 3});
        shown.put(second, new long[] {SELF, 10, 5});
        KeepDeleted.keys = shown::get;
        for (Object bubble : shown.keySet()) {
            KeepDeleted.measuring(bubble);
            assertEquals("measured before it was kept", "9:41 PM", KeepDeleted.labelled("9:41 PM"));
        }

        Fake telegram = new Fake(new KeepDeleted.Row(10, 1, false, false, false), new KeepDeleted.Row(10, 2, true, false, false),
                new KeepDeleted.Row(11, 3, false, false, false), new KeepDeleted.Row(12, 4, false, false, false),
                new KeepDeleted.Row(10, 5, false, false, false));
        KeepDeleted.decide(telegram, 0, ids(1, 2, 3, 4, 5), 0);
        assertEquals("each chat's kept bubbles, once; mine went and 4 was never on screen",
                Arrays.asList("10:" + Arrays.asList(first, second), "11:" + Arrays.asList(elsewhere)), telegram.redrawn);
        assertEquals(Arrays.asList("0:[2]:0"), telegram.stock);

        // Drawn again, the bubble measures its time and the label is there.
        KeepDeleted.measuring(first);
        assertEquals("deleted 9:41 PM", KeepDeleted.labelled("9:41 PM"));
        // A kept bubble isn't asked twice.
        KeepDeleted.redraw(telegram, SELF, Arrays.asList(new long[] {10, 1}));
        assertEquals(2, telegram.redrawn.size());
    }

    @Test public void aRedrawThatFailsStillKeepsTheMessageAndShowsInTheReport() {
        Settings.KEEP_DELETED_MESSAGES.save(true);
        KeepDeleted.keys = message -> new long[] {SELF, 10, 1};
        KeepDeleted.measuring(new Object());
        KeepDeleted.labelled("9:41 PM");
        Fake telegram = new Fake(new KeepDeleted.Row(10, 1, false, false, false));
        telegram.failRedraw = true;
        KeepDeleted.decide(telegram, 0, ids(1), 0);
        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
        assertTrue(telegram.stock.isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("redraw"));
    }

    @Test public void theBridgeMarksEachMessageAndPostsTheReplacementOnTheMainThread() throws Exception {
        TelegramController controller = new TelegramController();
        Bubble first = new Bubble();
        Bubble second = new Bubble();
        ArrayList<Object> messages = new ArrayList<>(Arrays.asList(first, second));
        KeepDeletedBridge.of(controller).redraw(CHANNEL, messages);
        assertTrue("nothing reaches the chat off the main thread", controller.center.posts.isEmpty());
        assertFalse(first.forceUpdate);

        ShadowLooper.idleMainLooper();
        assertTrue(first.forceUpdate);
        assertTrue(second.forceUpdate);
        assertEquals("the event Telegram's own storage posts, with the chat and the same messages",
                Arrays.asList(Center.replaceMessagesObjects + ":" + Arrays.asList(CHANNEL, messages)), controller.center.posts);
    }

    @Test public void clearingHandsEveryKeptMessageToTelegramChatByChatAndForgetsThem() {
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {10, 2}, new long[] {CHANNEL, 7},
                new long[] {-555, 8}, new long[] {CHANNEL, 9}));
        KeepDeleted.remember(77, Arrays.asList(new long[] {20, 3}));
        Fake first = new Fake();
        first.channels.put(CHANNEL, -CHANNEL);
        Fake second = new Fake();
        second.self = 77;
        KeepDeleted.accounts = () -> Arrays.asList(first, second);

        assertFalse("works with the switch off", Settings.KEEP_DELETED_MESSAGES.get());
        assertEquals(6, KeepDeleted.clear());
        assertEquals("forgotten at once", Collections.emptyList(), KeepDeleted.keptBy(SELF));
        assertTrue("the deletion runs on the storage queue", first.stock.isEmpty());
        first.posted.get(0).run();
        second.posted.get(0).run();
        assertEquals("one deletion per chat, with the channel's ID for a channel and 0 otherwise",
                Arrays.asList("10:[1, 2]:0", CHANNEL + ":[7, 9]:" + -CHANNEL, "-555:[8]:0"), first.stock);
        assertEquals("only groups are asked whether they're channels", Arrays.asList(CHANNEL, -555L), first.asked);
        assertEquals(Arrays.asList("[1, 2]:0", "[7, 9]:" + -CHANNEL, "[8]:0"), first.cleared);
        assertEquals(Arrays.asList("20:[3]:0"), second.stock);

        KeepDeleted.forgetAllForTests();
        assertFalse("still forgotten after a restart", KeepDeleted.isKept(SELF, 10, 1));
        assertFalse(KeepDeleted.isKept(SELF, CHANNEL, 9));
        assertFalse(KeepDeleted.isKept(77, 20, 3));
        assertEquals("Removed 6 kept messages.", KeepDeleted.clearedMessage(6));
        assertEquals("Removed 1 kept message.", KeepDeleted.clearedMessage(1));
    }

    @Test public void nothingKeptGivesThePlainNoticeAndAsksNothingOfTelegram() {
        Fake telegram = new Fake();
        KeepDeleted.accounts = () -> Collections.singletonList(telegram);
        assertEquals(0, KeepDeleted.clear());
        assertTrue(telegram.posted.isEmpty());
        assertEquals("There are no kept messages to clear.", KeepDeleted.clearedMessage(0));
    }

    @Test public void whatCantBeHandedOverStaysKeptAndShowsInTheReport() {
        KeepDeleted.accounts = () -> { throw new ClassNotFoundException("no Telegram"); };
        KeepDeleted.remember(SELF, Arrays.asList(new long[] {10, 1}, new long[] {CHANNEL, 7}, new long[] {CHANNEL, 9}));
        assertEquals(0, KeepDeleted.clear());
        assertTrue(KeepDeleted.isKept(SELF, 10, 1));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("accounts"));

        // A queue that takes no work keeps the account's list, and the next account still clears.
        Fake refusing = new Fake();
        refusing.refusePost = true;
        Fake unreadable = new Fake();
        unreadable.failSelf = true;
        Fake other = new Fake();
        other.self = 77;
        KeepDeleted.remember(77, Arrays.asList(new long[] {20, 3}));
        KeepDeleted.accounts = () -> Arrays.asList(refusing, unreadable, other);
        assertEquals(1, KeepDeleted.clear());
        KeepDeleted.forgetAllForTests();
        assertTrue("saved back", KeepDeleted.isKept(SELF, 10, 1) && KeepDeleted.isKept(SELF, CHANNEL, 9));
        assertFalse(KeepDeleted.isKept(77, 20, 3));

        // A chat whose deletion can't start is remembered again; the others go.
        Fake failing = new Fake();
        failing.failChannel = true;
        KeepDeleted.accounts = () -> Collections.singletonList(failing);
        assertEquals(3, KeepDeleted.clear());
        failing.posted.get(0).run();
        assertEquals(Arrays.asList("10:[1]:0"), failing.stock);
        KeepDeleted.forgetAllForTests();
        assertFalse(KeepDeleted.isKept(SELF, 10, 1));
        assertTrue(KeepDeleted.isKept(SELF, CHANNEL, 7));
        assertTrue(KeepDeleted.isKept(SELF, CHANNEL, 9));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("clearing kept messages"));
    }

    @Test public void theBridgeTellsAChannelOrSupergroupFromABasicGroup() throws Exception {
        TelegramController controller = new TelegramController();
        controller.chats.put(42L, new TLRPC.TL_channel());
        controller.chats.put(555L, new TLRPC.Chat());
        controller.storage.chats.put(43L, new TLRPC.TL_channel());
        KeepDeletedBridge bridge = KeepDeletedBridge.of(controller);
        assertEquals(42, bridge.channel(-42));
        assertEquals("a basic group", 0, bridge.channel(-555));
        assertEquals("found in the stored chats", 43, bridge.channel(-43));
        assertEquals("a chat found nowhere goes as a plain chat", 0, bridge.channel(-44));
        assertEquals("a person", 0, bridge.channel(10));
    }

    private static ArrayList<Integer> ids(Integer... ids) { return new ArrayList<>(Arrays.asList(ids)); }

    /** Public, like Telegram's own classes, so the bridge reaches them the same way. */
    public static final class TelegramController {
        final Notifications notifications = new Notifications();
        final Center center = new Center();
        final Storage storage = new Storage();
        final Map<Long, TLRPC.Chat> chats = new HashMap<>();

        public Storage getMessagesStorage() { return storage; }

        public Notifications getNotificationsController() { return notifications; }

        public Center getNotificationCenter() { return center; }

        public TLRPC.Chat getChat(Long id) { return chats.get(id); }
    }

    public static final class Storage {
        final Map<Long, TLRPC.Chat> chats = new HashMap<>();

        public TLRPC.Chat getChat(long id) { return chats.get(id); }
    }

    /** Telegram's NotificationCenter: an event number in a static field and a varargs post. */
    public static final class Center {
        public static int replaceMessagesObjects = 7;
        final List<String> posts = new ArrayList<>();

        public void postNotificationName(int id, Object... args) { posts.add(id + ":" + Arrays.asList(args)); }
    }

    /** A message with the mark Telegram's bubble reads. */
    public static final class Bubble {
        public boolean forceUpdate;
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
        final List<String> redrawn = new ArrayList<>();
        final List<Long> asked = new ArrayList<>();
        final Map<Long, Long> channels = new HashMap<>();
        long self = SELF;
        boolean failSelf;
        boolean failRows;
        boolean refusePost;
        boolean failStock;
        boolean failClear;
        boolean failChannel;
        boolean failRedraw;

        Fake(KeepDeleted.Row... rows) { this.rows = Arrays.asList(rows); }

        @Override public long self() {
            if (failSelf) throw new IllegalStateException("no account");
            return self;
        }

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

        @Override public long channel(long dialogId) {
            asked.add(dialogId);
            if (failChannel) throw new IllegalStateException("no chat");
            Long channel = channels.get(dialogId);
            return channel == null ? 0 : channel;
        }

        @Override public void redraw(long dialogId, ArrayList<Object> messages) {
            if (failRedraw) throw new IllegalStateException("no chat screen");
            redrawn.add(dialogId + ":" + messages);
        }
    }
}
