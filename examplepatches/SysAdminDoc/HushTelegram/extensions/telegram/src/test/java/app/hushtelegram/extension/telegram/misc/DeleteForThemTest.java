/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import android.os.Looper;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
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
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

/** Delete for them in the message menu (#71): where it's offered, what it keeps and sends, and what a deletion update does after. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {DeleteForThemTest.Menu.class, DeleteForThemTest.Hidden.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class DeleteForThemTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    static final long SELF = 5L;
    static final long PERSON = 100L;
    static final long GROUP = -200L;
    static final long SUPERGROUP = -300L;
    static final long BOT = 400L;
    static final int NOW = 1_000_000;
    static final int GROUP_LIMIT = 172_800;

    /** A message as the open chat holds it. */
    static final class Message {
        final int id;
        final long dialog;
        final long sender;
        final int date;
        boolean apart;
        boolean live;

        Message(int id, long dialog, long sender, int date) {
            this.id = id;
            this.dialog = dialog;
            this.sender = sender;
            this.date = date;
        }
    }

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static ArrayList<?> album;
        static boolean secret;

        @Implementation protected static ArrayList<?> grouped(Object chat) { return album; }
        @Implementation protected static int id(Object message) { return ((Message) message).id; }
        @Implementation protected static long dialog(Object message) { return ((Message) message).dialog; }
        @Implementation protected static long sender(Object message) { return ((Message) message).sender; }
        @Implementation protected static int date(Object message) { return ((Message) message).date; }
        @Implementation protected static int account(Object message) { return 0; }
        @Implementation protected static long selfId(int account) { return account == 0 ? SELF : 0L; }
        @Implementation protected static boolean secret(long dialog) { return secret; }
    }

    @Implements(value = HiddenMessages.class, isInAndroidSdk = false)
    public static class Hidden {
        @Implementation protected static boolean apart(Object message) { return ((Message) message).apart; }
        @Implementation protected static boolean live(Object message) { return ((Message) message).live; }
    }

    /** Telegram's side: the chat kinds above, its time limits, and the requests it was asked to send. */
    final class Fake implements DeleteForThem.Telegram {
        final Queue queue = new Queue();
        final List<String> deleted = new ArrayList<>();
        final List<Boolean> keptFirst = new ArrayList<>();
        boolean failDelete;

        @Override public int kind(int account, long dialog) {
            return dialog == PERSON ? DeleteForThem.PERSON : dialog == GROUP ? DeleteForThem.GROUP
                    : dialog == SUPERGROUP ? DeleteForThem.SUPERGROUP : DeleteForThem.NONE;
        }

        @Override public int limit(int account, int kind) {
            return kind == DeleteForThem.GROUP ? GROUP_LIMIT : Integer.MAX_VALUE;
        }

        @Override public int now(int account) { return NOW; }

        @Override public KeepDeleted.Source source(int account) { return queue; }

        @Override public void delete(int account, long dialog, ArrayList<Integer> ids, long channel) {
            if (failDelete) throw new IllegalStateException("no connection");
            keptFirst.add(KeepDeleted.isKept(SELF, dialog, ids.get(0)));
            deleted.add(dialog + ":" + ids + ":" + channel);
        }
    }

    /** The account's storage queue, run by hand, and the stored messages a deletion update finds. */
    static final class Queue implements KeepDeleted.Source {
        final List<Runnable> posted = new ArrayList<>();
        final List<String> stock = new ArrayList<>();
        final List<Long> redrawn = new ArrayList<>();
        List<KeepDeleted.Row> rows = Collections.emptyList();
        long self = SELF;
        boolean refusePost;

        @Override public long self() { return self; }

        @Override public void post(Runnable work) {
            if (refusePost) throw new IllegalStateException("no work");
            posted.add(work);
        }

        @Override public List<KeepDeleted.Row> rows(long dialogId, List<Integer> ids) { return rows; }

        @Override public void stock(long dialogId, ArrayList<Integer> ids, long channelId) {
            stock.add(dialogId + ":" + ids + ":" + channelId);
        }

        @Override public void clearNotifications(ArrayList<Integer> ids, long channelId) {}

        @Override public long channel(long dialogId) { return 0; }

        @Override public void redraw(long dialogId, ArrayList<Object> messages) { redrawn.add(dialogId); }

        @Override public int saveMedia(List<Object> messages) { return 0; }

        void run() {
            List<Runnable> work = new ArrayList<>(posted);
            posted.clear();
            for (Runnable each : work) each.run();
        }
    }

    static final class Memory implements KeepDeleted.Persist {
        final Map<String, String> values = new HashMap<>();
        boolean failWrites;

        @Override public String read(String key) { return values.get(key); }

        @Override public boolean write(Map<String, String> entries) {
            if (failWrites) return false;
            values.putAll(entries);
            return true;
        }
    }

    private Context context;
    private Fake telegram;
    private Memory memory;
    private DeleteForThem.Telegram realTelegram;
    private KeepDeleted.Persist realPersist;
    private KeepDeleted.Keys realKeys;

    @Before public void setUp() {
        restore();
        context = RuntimeEnvironment.getApplication();
        realTelegram = DeleteForThem.telegram;
        realPersist = KeepDeleted.persist;
        realKeys = KeepDeleted.keys;
        telegram = new Fake();
        memory = new Memory();
        DeleteForThem.telegram = telegram;
        KeepDeleted.persist = memory;
        KeepDeleted.keys = message -> new long[] {SELF, ((Message) message).dialog, ((Message) message).id};
        KeepDeleted.forgetAllForTests();
        PatchFamilyForTests.installed(PatchFamily.Capability.HIDE_FOR_ME);
        PatchFamilyForTests.inBuild(PatchFamily.MESSAGE_MENU_REPEAT, PatchFamily.KEEP_DELETED_MESSAGES);
        Settings.MESSAGE_MENU_DELETE_FOR_THEM.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        KeepDeleted.measuring(null);
        if (realTelegram != null) DeleteForThem.telegram = realTelegram;
        if (realPersist != null) KeepDeleted.persist = realPersist;
        if (realKeys != null) KeepDeleted.keys = realKeys;
        KeepDeleted.forgetAllForTests();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_DELETE_FOR_THEM);
        Settings.MESSAGE_MENU_DELETE_FOR_THEM.resetToDefault();
        SettingReadsForTests.mend(Settings.KEEP_DELETED_MESSAGES);
        Settings.KEEP_DELETED_MESSAGES.resetToDefault();
        PatchFamilyForTests.resetCapabilities();
        PatchFamilyForTests.reset();
        Menu.album = null;
        Menu.secret = false;
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static Message own(int id, long dialog) { return new Message(id, dialog, SELF, NOW - 60); }

    private static ArrayList<Integer> ids(Integer... ids) { return new ArrayList<>(Arrays.asList(ids)); }

    private void unsend(Message message) {
        DeleteForThem.unsend(context, new Object(), message);
        telegram.queue.run();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void theSwitchStartsOffAndNothingIsOffered() {
        Settings.MESSAGE_MENU_DELETE_FOR_THEM.resetToDefault();
        assertFalse(Settings.MESSAGE_MENU_DELETE_FOR_THEM.get());
        assertFalse(DeleteForThem.offered(own(10, PERSON)));
        assertFalse("a measuring bubble isn't told to look for a label", DeleteForThem.on());
    }

    @Test public void offeredOnYourOwnMessagesInChatsAndGroups() {
        assertTrue(DeleteForThem.offered(own(10, PERSON)));
        assertTrue(DeleteForThem.offered(own(11, GROUP)));
        assertTrue("a supergroup has no time limit", DeleteForThem.offered(new Message(12, SUPERGROUP, SELF, 1)));
        assertTrue("a chat with a person has none either", DeleteForThem.offered(new Message(13, PERSON, SELF, 1)));
    }

    @Test public void notOfferedWhereTelegramWouldNotDeleteForEveryone() {
        assertFalse("someone else's message", DeleteForThem.offered(new Message(10, PERSON, PERSON, NOW - 60)));
        assertFalse("a bot", DeleteForThem.offered(own(10, BOT)));
        assertFalse("Saved Messages", DeleteForThem.offered(own(10, SELF)));
        assertFalse("still sending", DeleteForThem.offered(own(-3, PERSON)));
        assertTrue(DeleteForThem.offered(new Message(10, GROUP, SELF, NOW - GROUP_LIMIT + 1)));
        assertFalse("past the group's limit", DeleteForThem.offered(new Message(10, GROUP, SELF, NOW - GROUP_LIMIT)));
        Message scheduled = own(10, PERSON);
        scheduled.apart = true;
        Message live = own(11, PERSON);
        live.live = true;
        assertFalse(DeleteForThem.offered(scheduled));
        assertFalse(DeleteForThem.offered(live));
        Menu.secret = true;
        assertFalse("a secret chat", DeleteForThem.offered(own(10, PERSON)));
    }

    @Test public void notOfferedWithoutTheBuildOrWhilePaused() {
        PatchFamilyForTests.installed();
        assertFalse("a build without the hidden message hooks", DeleteForThem.offered(own(10, PERSON)));
        PatchFamilyForTests.installed(PatchFamily.Capability.HIDE_FOR_ME);
        PatchFamilyForTests.inBuild(PatchFamily.MESSAGE_MENU_REPEAT);
        assertFalse("a build without Keep deleted messages", DeleteForThem.offered(own(10, PERSON)));
        PatchFamilyForTests.inBuild(PatchFamily.MESSAGE_MENU_REPEAT, PatchFamily.KEEP_DELETED_MESSAGES);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(DeleteForThem.offered(own(10, PERSON)));
        assertFalse(DeleteForThem.on());
    }

    @Test public void theMessageIsKeptFirstThenTheServerIsAsked() {
        Message message = own(10, PERSON);
        DeleteForThem.unsend(context, new Object(), message);
        assertTrue("nothing goes before the storage queue runs", telegram.deleted.isEmpty());
        assertFalse(KeepDeleted.isKept(SELF, PERSON, 10));
        telegram.queue.run();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(Collections.singletonList("100:[10]:0"), telegram.deleted);
        assertEquals(Collections.singletonList(true), telegram.keptFirst);
        assertEquals("Deleted for them, kept here.", ShadowToast.getTextOfLatestToast());
        assertFalse("kept now, so not offered again", DeleteForThem.offered(message));
        KeepDeleted.forgetAllForTests();
        assertTrue("read back from the phone", KeepDeleted.isKept(SELF, PERSON, 10));
    }

    @Test public void aSupergroupGoesByItsChannelAndAnAlbumGoesTogether() {
        Message first = new Message(20, SUPERGROUP, SELF, 1);
        Message second = new Message(21, SUPERGROUP, SELF, 1);
        Message scheduled = new Message(22, SUPERGROUP, SELF, 1);
        scheduled.apart = true;
        Menu.album = new ArrayList<>(Arrays.asList(first, second, scheduled));
        unsend(second);
        assertEquals(Collections.singletonList("-300:[20, 21]:300"), telegram.deleted);
        assertTrue(KeepDeleted.isKept(SELF, SUPERGROUP, 20));
        assertTrue(KeepDeleted.isKept(SELF, SUPERGROUP, 21));
        assertFalse(KeepDeleted.isKept(SELF, SUPERGROUP, 22));
    }

    @Test public void aRequestThatCantGoOutTakesTheMessageOffTheListAgain() {
        telegram.failDelete = true;
        unsend(own(10, PERSON));
        assertFalse(KeepDeleted.isKept(SELF, PERSON, 10));
        KeepDeleted.forgetAllForTests();
        assertFalse("nor on the phone", KeepDeleted.isKept(SELF, PERSON, 10));
        assertEquals("Couldn't complete that action. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void nothingGoesOutUnlessTheListWasSaved() {
        memory.failWrites = true;
        unsend(own(10, PERSON));
        assertTrue(telegram.deleted.isEmpty());
        assertFalse(KeepDeleted.isKept(SELF, PERSON, 10));
        assertEquals("Couldn't complete that action. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void nothingGoesOutWhenTheAccountChangedOrTheQueueRefused() {
        DeleteForThem.unsend(context, new Object(), own(10, PERSON));
        telegram.queue.self = 6L;
        telegram.queue.run();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(telegram.deleted.isEmpty());
        assertFalse(KeepDeleted.isKept(SELF, PERSON, 10));
        ShadowToast.reset();
        telegram.queue.self = SELF;
        telegram.queue.refusePost = true;
        unsend(own(11, PERSON));
        assertTrue(telegram.deleted.isEmpty());
        assertEquals("Couldn't complete that action. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aKeptMessageStaysWhenItsDeletionArrivesWithKeepDeletedOff() {
        assertFalse(Settings.KEEP_DELETED_MESSAGES.get());
        unsend(own(10, PERSON));
        assertTrue(KeepDeleted.holds(SELF, ids(10, 11)));
        assertFalse("nothing there to hold back", KeepDeleted.holds(SELF, ids(11)));
        Queue queue = telegram.queue;
        queue.rows = Arrays.asList(new KeepDeleted.Row(PERSON, 10, true, false, false), new KeepDeleted.Row(PERSON, 11, false, false, false));
        KeepDeleted.decide(queue, 0, ids(10, 11), 0, false);
        assertEquals("someone else's message goes as usual", Collections.singletonList("0:[11]:0"), queue.stock);
        assertTrue(KeepDeleted.isKept(SELF, PERSON, 10));
        assertFalse(KeepDeleted.isKept(SELF, PERSON, 11));
    }

    @Test public void withKeepDeletedOnBothStay() {
        unsend(own(10, PERSON));
        Queue queue = telegram.queue;
        queue.rows = Arrays.asList(new KeepDeleted.Row(PERSON, 10, true, false, false), new KeepDeleted.Row(PERSON, 11, false, false, false));
        KeepDeleted.decide(queue, 0, ids(10, 11), 0, true);
        assertTrue(queue.stock.isEmpty());
        assertTrue("your own message, held by the list", KeepDeleted.isKept(SELF, PERSON, 10));
        assertTrue(KeepDeleted.isKept(SELF, PERSON, 11));
    }

    @Test public void theLabelShowsWithKeepDeletedOffAndTheBubbleIsDrawnAgain() {
        Message message = own(10, PERSON);
        KeepDeleted.measuring(message);
        assertEquals("not kept yet", "9:41 PM", KeepDeleted.labelled("9:41 PM"));
        unsend(message);
        assertEquals("the bubble measured before is drawn again", Collections.singletonList(PERSON), telegram.queue.redrawn);
        KeepDeleted.measuring(message);
        assertEquals("deleted 9:41 PM", KeepDeleted.labelled("9:41 PM"));
        Settings.MESSAGE_MENU_DELETE_FOR_THEM.save(false);
        KeepDeleted.measuring(message);
        assertEquals("both switches off", "9:41 PM", KeepDeleted.labelled("9:41 PM"));
    }
}
