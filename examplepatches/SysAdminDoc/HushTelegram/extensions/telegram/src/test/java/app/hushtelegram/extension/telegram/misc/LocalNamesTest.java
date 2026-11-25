/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LocalNamesTest {
    /** This phone's own account, signed in on account 0. */
    private static final long ME = 1000;
    private static final long ANN = 5;
    private static final long GROUP = 7;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private HiddenChatsForTests.Fake chats;
    private FakeTelegram telegram;
    private Controller controller;
    private LocalNames.Telegram savedTelegram;
    private java.util.function.LongPredicate savedMine;

    // ---- Telegram's objects, with the fields the extension reads by their source names ----

    public static class TL_user {
        public long id;
        public String first_name;
        public String last_name;
        public String phone;
        public boolean self;
        public boolean contact;
        public boolean mutual_contact;
        public int flags;

        TL_user() {}

        TL_user(long id, String first, String last) {
            this.id = id;
            this.first_name = first;
            this.last_name = last;
        }
    }

    public static class TL_channel {
        public long id;
        public String title;
        public boolean min;

        TL_channel() {}

        TL_channel(long id, String title) {
            this.id = id;
            this.title = title;
        }
    }

    public static class TL_updateUserName {
        public long user_id;
        public String first_name;
        public String last_name;
    }

    public static class TL_updateUserStatus {
        public long user_id;
    }

    public static class TL_inputUser {
        public long user_id;
    }

    public static class TL_inputChannel {
        public long channel_id;
    }

    public static class TL_contacts_addContact {
        public TL_inputUser id = new TL_inputUser();
        public String first_name;
        public String last_name;
        public String phone;
    }

    public static class TL_messages_editChatTitle {
        public long chat_id;
        public String title;
    }

    public static class TL_channels_editTitle {
        public TL_inputChannel channel = new TL_inputChannel();
        public String title;
    }

    public static class InputMedia {
        public String first_name;
        public String last_name;
        public String phone_number;
        public String vcard;
    }

    public static class TL_inputMediaContact extends InputMedia {}

    public static class TL_messages_sendMedia {
        public InputMedia media;
    }

    public static class TL_inputSingleMedia {
        public InputMedia media;
    }

    public static class TL_messages_sendMultiMedia {
        public ArrayList<Object> multi_media = new ArrayList<>();
    }

    public static class TL_inputPhoneContact {
        public long client_id;
        public String phone;
        public String first_name;
        public String last_name;
    }

    public static class TL_contacts_importContacts {
        public ArrayList<Object> contacts = new ArrayList<>();
    }

    public static class setBotInfo {
        public TL_inputUser bot = new TL_inputUser();
        public String name;
    }

    /** A MessagesController, MessagesStorage or ConnectionsManager: each knows its account. */
    public static class Controller {
        public int currentAccount;

        Controller(int account) {
            currentAccount = account;
        }
    }

    /** Each account's users and chats in memory, and each redraw asked for. */
    static final class FakeTelegram implements LocalNames.Telegram {
        final Map<String, Object> users = new HashMap<>();
        final Map<String, Object> chats = new HashMap<>();
        final List<Integer> signedIn = new ArrayList<>(Collections.singletonList(0));
        final List<List<Integer>> redrawn = new ArrayList<>();
        final Map<Long, String> names = new HashMap<>();
        final List<Boolean> shortNames = new ArrayList<>();

        @Override public Object user(int account, long id) { return users.get(account + ":" + id); }
        @Override public Object chat(int account, long id) { return chats.get(account + ":" + id); }
        @Override public Object userOf(Object controller, long id) { return user(((Controller) controller).currentAccount, id); }
        @Override public List<Integer> accounts() { return signedIn; }
        @Override public void redraw(List<Integer> accounts) { redrawn.add(new ArrayList<>(accounts)); }
        @Override public String peerName(int account, long dialog) { return names.get(dialog); }

        /** UserObject.getFirstName's rule, short of its fallbacks. */
        @Override public String firstName(Object user, boolean allowShort) {
            shortNames.add(allowShort);
            if (user == null) return "DELETED";
            TL_user each = (TL_user) user;
            return each.first_name == null || each.first_name.isEmpty() ? each.last_name : each.first_name;
        }
    }

    @Before public void setUp() {
        ShadowToast.reset();
        chats = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
        chats.users.put(0, ME);
        telegram = new FakeTelegram();
        savedTelegram = LocalNames.telegram;
        savedMine = LocalNames.mine;
        LocalNames.telegram = telegram;
        LocalNames.mine = id -> id == ME;
        LocalNames.KEPT.clear();
        controller = new Controller(0);
        PatchFamilyForTests.installed(PatchFamily.Capability.LOCAL_NAMES);
        Settings.LOCAL_NAMES.resetToDefault();
        Settings.LOCAL_NAME_LIST.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        HiddenChatsForTests.restore();
        PauseForTests.resume();
        PatchFamilyForTests.resetCapabilities();
        LocalNames.telegram = savedTelegram;
        LocalNames.mine = savedMine;
        LocalNames.KEPT.clear();
        Settings.LOCAL_NAMES.resetToDefault();
        Settings.LOCAL_NAME_LIST.resetToDefault();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private void named(String list) {
        Settings.LOCAL_NAMES.save(true);
        Settings.LOCAL_NAME_LIST.save(list);
    }

    private String report() {
        return String.join("\n", HookStatus.report());
    }

    // ---- The list ----

    @Test public void onlyValuesThisWritesAreKept() {
        assertTrue(LocalNames.allowed(""));
        String list = "5\tAnn\n-7\tBook club";
        assertTrue(LocalNames.allowed(list));
        assertEquals(2, LocalNames.count(list));
        Map<Long, String> expected = new LinkedHashMap<>();
        expected.put(5L, "Ann");
        expected.put(-7L, "Book club");
        assertEquals(expected, LocalNames.parse(list));
        assertEquals(list, LocalNames.join(LocalNames.parse(list)));
        long encrypted = 0x4000000000000005L;
        long folder = 0x2000000000000001L;
        for (String bad : new String[]{null, "5\tAnn\n5\tBob", "0\tAnn", "5\t", "5\t Ann", "5\tAnn ", "+5\tAnn", "05\tAnn", "5Ann",
                "5\tAnn\n", "\n5\tAnn", "5\tA\tB", encrypted + "\tSecret", folder + "\tFolder", Long.MIN_VALUE + "\tMin", "x\tAnn"}) {
            assertFalse(String.valueOf(bad), LocalNames.allowed(bad));
            assertEquals(String.valueOf(bad), 0, LocalNames.count(bad));
        }
        StringBuilder full = new StringBuilder();
        for (int i = 1; i <= LocalNames.MAX_NAMES; i++) full.append(i == 1 ? "" : "\n").append(i).append("\tA");
        assertTrue(LocalNames.allowed(full.toString()));
        assertFalse(LocalNames.allowed(full + "\n" + (LocalNames.MAX_NAMES + 1) + "\tA"));
    }

    @Test public void aTypedNameIsCleanedAndCut() {
        assertEquals("Ann Lee", LocalNames.clean("  Ann\nLee\t"));
        assertEquals("", LocalNames.clean(null));
        assertEquals("", LocalNames.clean(" \n "));
        StringBuilder longName = new StringBuilder();
        for (int i = 0; i < LocalNames.MAX_NAME_CHARS + 10; i++) longName.append('a');
        assertEquals(LocalNames.MAX_NAME_CHARS, LocalNames.clean(longName.toString()).length());
        // A cut never leaves half of a surrogate pair.
        String face = new String(Character.toChars(0x1F600));
        String edge = longName.substring(0, LocalNames.MAX_NAME_CHARS - 1) + face;
        String cut = LocalNames.clean(edge);
        assertEquals(LocalNames.MAX_NAME_CHARS - 1, cut.length());
        assertFalse(Character.isHighSurrogate(cut.charAt(cut.length() - 1)));
        assertTrue(LocalNames.allowed("5\t" + cut));
    }

    // ---- Telegram's objects ----

    @Test public void aUserGetsTheNameAndTheDatabaseKeepsTheServers() {
        named("5\tAnn");
        TL_user user = new TL_user(ANN, "Annabel", "Lee");
        user.phone = "15550100";
        LocalNames.user(controller, user);
        assertEquals("Ann", user.first_name);
        assertEquals("", user.last_name);
        assertEquals("the server's name waits", "Annabel", LocalNames.KEPT.get(new LocalNames.Key(true, 0, ANN)).first);

        // The database gets a copy with the server's name, and the shown object keeps the given one.
        Object stored = LocalNames.storedUser(new Controller(0), user);
        assertNotSame(user, stored);
        assertEquals("Annabel", ((TL_user) stored).first_name);
        assertEquals("Lee", ((TL_user) stored).last_name);
        assertEquals("15550100", ((TL_user) stored).phone);
        assertEquals(ANN, ((TL_user) stored).id);
        assertEquals("Ann", user.first_name);
        // Another account's copy of the same user, or anyone else, goes in as it is.
        assertSame(user, LocalNames.storedUser(new Controller(1), user));
        TL_user other = new TL_user(6, "Bob", null);
        assertSame(other, LocalNames.storedUser(new Controller(0), other));
        assertNull(LocalNames.storedUser(new Controller(0), null));

        // The same user put again keeps the server's name it had, not the shown one.
        LocalNames.user(controller, user);
        assertEquals("Annabel", LocalNames.KEPT.get(new LocalNames.Key(true, 0, ANN)).first);
        // A fresh copy from the server replaces it.
        TL_user fresh = new TL_user(ANN, "Anna", "Lee");
        LocalNames.user(controller, fresh);
        assertEquals("Ann", fresh.first_name);
        assertEquals("Anna", LocalNames.KEPT.get(new LocalNames.Key(true, 0, ANN)).first);
        assertTrue(report(), report().contains(LocalNames.RENAMED));
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void aMentionPutsInTelegramsNameAndTheChatKeepsTheGivenOne() {
        named("5\tAnn");
        TL_user ann = new TL_user(ANN, "Annabel", "Lee");
        LocalNames.user(controller, ann);
        assertEquals("Ann", ann.first_name);

        // The mention's text goes out to everyone in the chat, so it's Telegram's name for them.
        assertEquals("Annabel", LocalNames.mentionName(ann, 0));
        assertEquals("Annabel", LocalNames.mentionName(ann, 1));
        assertEquals("Telegram's own rule picks the name, asked as the chat asked", Arrays.asList(false, true), telegram.shortNames);
        assertEquals("the chat still shows the given name", "Ann", ann.first_name);
        assertEquals("", ann.last_name);
        // The same person on a second account is mentioned by the server's name there too.
        TL_user second = new TL_user(ANN, "Annabel", "Lee");
        LocalNames.user(new Controller(1), second);
        assertEquals("Ann", second.first_name);
        assertEquals("Annabel", LocalNames.mentionName(second, 0));

        // Someone with no given name, someone else who happens to show the same text, and no user at all go as Telegram names them.
        assertEquals("Bob", LocalNames.mentionName(new TL_user(6, "Bob", "Stone"), 0));
        assertEquals("Ann", LocalNames.mentionName(new TL_user(6, "Ann", ""), 0));
        assertEquals("DELETED", LocalNames.mentionName(null, 0));
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void thePhonesAddressBookGetsTheServersName() {
        named("5\tAnn");
        TL_user ann = new TL_user(ANN, "Annabel", "Lee");
        ann.phone = "15550100";
        LocalNames.user(controller, ann);
        ArrayList<Object> operations = new ArrayList<>();

        // ContactsController writes a copy with the server's name into the phone's contacts.
        Object written = LocalNames.phoneBookUser(new Controller(0), operations, ann);
        assertNotSame(ann, written);
        assertEquals("Annabel", ((TL_user) written).first_name);
        assertEquals("Lee", ((TL_user) written).last_name);
        assertEquals("15550100", ((TL_user) written).phone);
        assertEquals(ANN, ((TL_user) written).id);
        assertEquals("the chat still shows the given name", "Ann", ann.first_name);
        assertTrue("nothing is written for it", operations.isEmpty());

        // Another account's copy, anyone else and no user at all go through as they are.
        assertSame(ann, LocalNames.phoneBookUser(new Controller(1), operations, ann));
        TL_user bob = new TL_user(6, "Bob", null);
        assertSame(bob, LocalNames.phoneBookUser(new Controller(0), operations, bob));
        assertNull(LocalNames.phoneBookUser(new Controller(0), operations, null));
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void yourOwnAccountsAreNeverRenamed() {
        named("1000\tMe\n2000\tOther me");
        TL_user me = new TL_user(ME, "Matt", "P");
        me.self = true;
        LocalNames.user(controller, me);
        assertEquals("Matt", me.first_name);
        // Another of this phone's accounts, seen from this one, isn't self but is still yours.
        LocalNames.mine = id -> id == ME || id == 2000;
        TL_user second = new TL_user(2000, "Work", null);
        LocalNames.user(controller, second);
        assertEquals("Work", second.first_name);
        assertTrue(LocalNames.KEPT.isEmpty());
    }

    @Test public void offOrPausedRenamesNothing() {
        Settings.LOCAL_NAME_LIST.save("5\tAnn");
        TL_user user = new TL_user(ANN, "Annabel", "Lee");
        LocalNames.user(controller, user);
        assertEquals("off by default", "Annabel", user.first_name);
        Settings.LOCAL_NAMES.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        LocalNames.user(controller, user);
        assertEquals("paused", "Annabel", user.first_name);
        PauseForTests.resume();
        LocalNames.user(controller, user);
        assertEquals("Ann", user.first_name);
    }

    @Test public void aGroupOrChannelGetsTheNameAsItsTitle() {
        named("-7\tBook club");
        TL_channel chat = new TL_channel(GROUP, "Readers of the North");
        LocalNames.chat(controller, chat);
        assertEquals("Book club", chat.title);
        Object stored = LocalNames.storedChat(new Controller(0), chat);
        assertNotSame(chat, stored);
        assertEquals("Readers of the North", ((TL_channel) stored).title);
        assertEquals("Book club", chat.title);
        // A user with the same number is someone else.
        TL_user seven = new TL_user(GROUP, "Seven", null);
        LocalNames.user(controller, seven);
        assertEquals("Seven", seven.first_name);
    }

    @Test public void aNewServerNameOfSomeoneNotInContactsIsKeptAndTheUpdateCarriesTheGivenOne() {
        named("5\tAnn\n6\tBob");
        TL_user ann = new TL_user(ANN, "Annabel", "Lee");
        TL_user bob = new TL_user(6, "Robert", null);
        bob.contact = true;
        LocalNames.user(controller, ann);
        LocalNames.user(controller, bob);
        telegram.users.put("0:5", ann);
        telegram.users.put("0:6", bob);
        TL_updateUserName renamed = new TL_updateUserName();
        renamed.user_id = ANN;
        renamed.first_name = "Anna";
        renamed.last_name = "Smith";
        TL_updateUserName contactRenamed = new TL_updateUserName();
        contactRenamed.user_id = 6;
        contactRenamed.first_name = "Rob";
        TL_updateUserName stranger = new TL_updateUserName();
        stranger.user_id = 9;
        stranger.first_name = "Nine";
        LocalNames.updates(controller, new ArrayList<>(Arrays.asList(new TL_updateUserStatus(), renamed, contactRenamed, stranger, null)));
        assertEquals("Ann", renamed.first_name);
        assertEquals("", renamed.last_name);
        LocalNames.Kept kept = LocalNames.KEPT.get(new LocalNames.Key(true, 0, ANN));
        assertEquals("Anna", kept.first);
        assertEquals("Smith", kept.last);
        // Telegram keeps a contact's own name, so its update goes on as it came.
        assertEquals("Rob", contactRenamed.first_name);
        assertEquals("Robert", LocalNames.KEPT.get(new LocalNames.Key(true, 0, 6)).first);
        assertEquals("Nine", stranger.first_name);
        // And the database then gets the new server name.
        assertEquals("Anna", ((TL_user) LocalNames.storedUser(controller, ann)).first_name);
    }

    @Test public void requestsThatCarryAGivenNameGetTheServersBack() {
        named("5\tAnn\n-7\tBook club\n-8\tNews\n9\tHelper");
        TL_user ann = new TL_user(ANN, "Annabel", "Lee");
        ann.phone = "15550100";
        LocalNames.user(controller, ann);
        LocalNames.chat(controller, new TL_channel(GROUP, "Readers"));
        LocalNames.chat(controller, new TL_channel(8, "Daily news"));
        LocalNames.user(controller, new TL_user(9, "My bot", null));
        Controller connections = new Controller(0);

        TL_contacts_addContact add = new TL_contacts_addContact();
        add.id.user_id = ANN;
        add.first_name = "Ann";
        add.last_name = "";
        assertFalse("nothing is dropped", LocalNames.outgoing(connections, add, null));
        assertEquals("Annabel", add.first_name);
        assertEquals("Lee", add.last_name);
        // A name typed over it is the user's choice and goes as typed.
        TL_contacts_addContact typed = new TL_contacts_addContact();
        typed.id.user_id = ANN;
        typed.first_name = "Annie";
        typed.last_name = "";
        assertFalse(LocalNames.outgoing(connections, typed, null));
        assertEquals("Annie", typed.first_name);

        TL_messages_editChatTitle chatTitle = new TL_messages_editChatTitle();
        chatTitle.chat_id = GROUP;
        chatTitle.title = "Book club";
        assertFalse(LocalNames.outgoing(connections, chatTitle, null));
        assertEquals("Readers", chatTitle.title);
        TL_channels_editTitle channelTitle = new TL_channels_editTitle();
        channelTitle.channel.channel_id = 8;
        channelTitle.title = "News";
        assertFalse(LocalNames.outgoing(connections, channelTitle, null));
        assertEquals("Daily news", channelTitle.title);
        TL_channels_editTitle newTitle = new TL_channels_editTitle();
        newTitle.channel.channel_id = 8;
        newTitle.title = "Morning news";
        assertFalse(LocalNames.outgoing(connections, newTitle, null));
        assertEquals("Morning news", newTitle.title);

        setBotInfo bot = new setBotInfo();
        bot.bot.user_id = 9;
        bot.name = "Helper";
        assertFalse(LocalNames.outgoing(connections, bot, null));
        assertEquals("My bot", bot.name);

        // A shared contact card names a renamed user by the name shown.
        TL_messages_sendMedia send = new TL_messages_sendMedia();
        TL_inputMediaContact card = new TL_inputMediaContact();
        card.first_name = "Ann";
        card.last_name = "";
        card.phone_number = "+1 555 0100";
        card.vcard = "BEGIN:VCARD\nFN:Ann\nEND:VCARD";
        send.media = card;
        assertFalse(LocalNames.outgoing(connections, send, null));
        assertEquals("Annabel", card.first_name);
        assertEquals("Lee", card.last_name);
        assertEquals("BEGIN:VCARD\nFN:Annabel Lee\nEND:VCARD", card.vcard);
        TL_messages_sendMultiMedia album = new TL_messages_sendMultiMedia();
        TL_inputSingleMedia single = new TL_inputSingleMedia();
        TL_inputMediaContact second = new TL_inputMediaContact();
        second.first_name = "Ann";
        second.last_name = "";
        single.media = second;
        album.multi_media.add(single);
        assertFalse(LocalNames.outgoing(connections, album, null));
        assertEquals("only one renamed user has that name", "Annabel", second.first_name);

        // A contacts import changes only a contact with the renamed user's number.
        TL_contacts_importContacts imported = new TL_contacts_importContacts();
        TL_inputPhoneContact same = new TL_inputPhoneContact();
        same.phone = "15550100";
        same.first_name = "Ann";
        same.last_name = "";
        TL_inputPhoneContact otherAnn = new TL_inputPhoneContact();
        otherAnn.phone = "15550199";
        otherAnn.first_name = "Ann";
        otherAnn.last_name = "";
        imported.contacts.add(same);
        imported.contacts.add(otherAnn);
        assertFalse(LocalNames.outgoing(connections, imported, null));
        assertEquals("Annabel", same.first_name);
        assertEquals("Ann", otherAnn.first_name);

        // Another account has none of these names, so its requests go as they are.
        TL_contacts_addContact elsewhere = new TL_contacts_addContact();
        elsewhere.id.user_id = ANN;
        elsewhere.first_name = "Ann";
        elsewhere.last_name = "";
        assertFalse(LocalNames.outgoing(new Controller(1), elsewhere, null));
        assertEquals("Ann", elsewhere.first_name);
        assertTrue(report(), report().contains(LocalNames.KEPT_OFF));
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void withNoNamesShownEveryRequestGoesAsItIs() {
        TL_contacts_addContact add = new TL_contacts_addContact();
        add.id.user_id = ANN;
        add.first_name = "Ann";
        assertFalse(LocalNames.outgoing(new Controller(0), add, null));
        assertEquals("Ann", add.first_name);
        assertFalse(LocalNames.outgoing(new Controller(0), null, null));
        assertFalse(LocalNames.outgoing(null, add, null));
    }

    @Test public void theObjectsFollowTheSwitchAndTheList() {
        TL_user ann = new TL_user(ANN, "Annabel", "Lee");
        TL_channel club = new TL_channel(GROUP, "Readers");
        TL_user me = new TL_user(ME, "Matt", null);
        me.self = true;
        telegram.users.put("0:5", ann);
        telegram.users.put("0:1000", me);
        telegram.chats.put("0:7", club);
        named("5\tAnn\n-7\tBook club\n1000\tMe");
        LocalNames.sync();
        assertEquals("Ann", ann.first_name);
        assertEquals("Book club", club.title);
        assertEquals("Matt", me.first_name);
        assertFalse(telegram.redrawn.isEmpty());
        for (List<Integer> each : telegram.redrawn) assertEquals(Collections.singletonList(0), each);
        assertTrue(chats.resorted.contains(0));

        // A new name for Ann: the server's name comes back first and stays the one kept.
        Settings.LOCAL_NAME_LIST.save("5\tAnnie\n-7\tBook club");
        LocalNames.sync();
        assertEquals("Annie", ann.first_name);
        assertEquals("Annabel", LocalNames.KEPT.get(new LocalNames.Key(true, 0, ANN)).first);

        // The switch off: every name goes back.
        Settings.LOCAL_NAMES.save(false);
        LocalNames.sync();
        assertEquals("Annabel", ann.first_name);
        assertEquals("Lee", ann.last_name);
        assertEquals("Readers", club.title);
        assertTrue(LocalNames.KEPT.isEmpty());

        // On again, then Ann's name removed.
        Settings.LOCAL_NAMES.save(true);
        LocalNames.sync();
        assertEquals("Annie", ann.first_name);
        Settings.LOCAL_NAME_LIST.save("-7\tBook club");
        LocalNames.sync();
        assertEquals("Annabel", ann.first_name);
        assertEquals("Book club", club.title);
        // A name Telegram changed in the meantime is left as Telegram has it.
        club.title = "Readers again";
        Settings.LOCAL_NAME_LIST.save("");
        LocalNames.sync();
        assertEquals("Readers again", club.title);
        assertTrue(LocalNames.KEPT.isEmpty());
        assertFalse(report(), report().contains("threw"));
    }

    // ---- The long press menu ----

    @Test public void theMenuItemShowsForOneChatThisCanRename() {
        Object list = new Object();
        LocalNames.menuItem(list, new Object());
        assertEquals(Collections.singletonList("48544807 Rename on this phone"), chats.menu);
        View item = chats.items.get(LocalNames.MENU_ID);
        chats.picked.add(ANN);
        LocalNames.menuShown(list);
        assertEquals("off by default", View.GONE, item.getVisibility());
        Settings.LOCAL_NAMES.save(true);
        LocalNames.menuShown(list);
        assertEquals(View.VISIBLE, item.getVisibility());
        for (Object[] pick : new Object[][]{{ANN, -GROUP}, {ME}, {0x4000000000000005L}, {}}) {
            chats.picked.clear();
            chats.picked.addAll(Arrays.asList(pick));
            LocalNames.menuShown(list);
            assertEquals(Arrays.toString(pick), View.GONE, item.getVisibility());
        }
        chats.picked.clear();
        chats.picked.add(-GROUP);
        LocalNames.menuShown(list);
        assertEquals("a group or channel", View.VISIBLE, item.getVisibility());
        PatchFamilyForTests.resetCapabilities();
        PatchFamilyForTests.installed(PatchFamily.Capability.HIDDEN_CHATS);
        LocalNames.menuShown(list);
        assertEquals("a build without the hooks", View.GONE, item.getVisibility());
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void aTapWithNoScreenToAskOnClosesTheSelection() {
        Settings.LOCAL_NAMES.save(true);
        chats.picked.add(ANN);
        assertEquals(HiddenChats.CLOSE_SELECTION, HiddenChats.menuChoice(new Object(), LocalNames.MENU_ID));
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        Settings.LOCAL_NAMES.save(false);
        assertEquals("off, the id goes on as it came", LocalNames.MENU_ID, HiddenChats.menuChoice(new Object(), LocalNames.MENU_ID));
    }

    // ---- The prompt ----

    @Test public void theNameIsAskedForSavedAndRemoved() throws Exception {
        TL_user ann = new TL_user(ANN, "Annabel", "Lee");
        telegram.users.put("0:5", ann);
        telegram.names.put(ANN, "Annabel Lee");
        Settings.LOCAL_NAMES.save(true);
        try (ActivityController<Activity> activity = Robolectric.buildActivity(Activity.class).setup()) {
            LocalNames.ask(activity.get(), ANN);
            AlertDialog prompt = (AlertDialog) ShadowAlertDialog.getLatestAlertDialog();
            assertEquals("Rename on this phone", String.valueOf(shadowOf(prompt).getTitle()));
            assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                    prompt.getWindow().getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
            EditText field = prompt.findViewById(android.R.id.edit);
            assertEquals("Telegram's name to start from", "Annabel Lee", field.getText().toString());
            assertTrue((field.getImeOptions() & EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) != 0);
            assertEquals("no name given yet, so nothing to remove", View.GONE, visibility(prompt.getButton(AlertDialog.BUTTON_NEUTRAL)));
            field.setText("  Ann\n");
            prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("5\tAnn", Settings.LOCAL_NAME_LIST.savedValue());
            assertEquals("Ann", ann.first_name);
            assertEquals("Renamed on this phone.", String.valueOf(ShadowToast.getTextOfLatestToast()));

            LocalNames.ask(activity.get(), ANN);
            prompt = (AlertDialog) ShadowAlertDialog.getLatestAlertDialog();
            field = prompt.findViewById(android.R.id.edit);
            assertEquals("Ann", field.getText().toString());
            assertEquals("Remove", prompt.getButton(AlertDialog.BUTTON_NEUTRAL).getText().toString());
            prompt.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
            settle();
            assertEquals("", Settings.LOCAL_NAME_LIST.savedValue());
            assertEquals("Annabel", ann.first_name);
            assertEquals("Lee", ann.last_name);
            assertEquals("Telegram's name is back.", String.valueOf(ShadowToast.getTextOfLatestToast()));

            // Saving an empty field removes a name too.
            Settings.LOCAL_NAME_LIST.save("5\tAnn\n-7\tBook club");
            LocalNames.ask(activity.get(), ANN);
            prompt = (AlertDialog) ShadowAlertDialog.getLatestAlertDialog();
            ((EditText) prompt.findViewById(android.R.id.edit)).setText(" ");
            prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            settle();
            assertEquals("-7\tBook club", Settings.LOCAL_NAME_LIST.savedValue());
        }
    }

    @Test public void aFullListSaysSoAndKeepsWhatItHas() throws Exception {
        StringBuilder full = new StringBuilder();
        for (int i = 1; i <= LocalNames.MAX_NAMES; i++) full.append(i == 1 ? "" : "\n").append(100 + i).append("\tA");
        named(full.toString());
        LocalNames.save(ANN, "Ann");
        settle();
        assertEquals(full.toString(), Settings.LOCAL_NAME_LIST.savedValue());
        assertEquals(String.format(Locale.ROOT, "You can rename up to %d chats on this phone.", LocalNames.MAX_NAMES),
                String.valueOf(ShadowToast.getTextOfLatestToast()));
        // A name changed for one already there still fits.
        LocalNames.save(101, "B");
        settle();
        assertTrue(Settings.LOCAL_NAME_LIST.savedValue().startsWith("101\tB\n"));
    }

    @Test public void theToastsFitTwoLinesInEveryLanguage() {
        String[] toasts = {"Renamed on this phone.", "Telegram's name is back.", "Couldn't save the name. Try again in a moment.",
                "You can rename up to %1$d chats on this phone."};
        for (String toast : toasts) {
            assertTrue(toast, toast.length() <= 64);
            assertFitsATwoLineToast("en", String.format(Locale.ROOT, toast, LocalNames.MAX_NAMES));
            for (String language : new String[]{"bg", "de", "es", "in", "it", "pt-rbr", "tr", "zh-hans"}) {
                String row = L10nTablesForTests.of(language).get(toast);
                assertNotNull(language + ": " + toast, row);
                assertTrue(language + ": " + row, row.length() <= 80);
                assertFitsATwoLineToast(language, String.format(Locale.ROOT, row, LocalNames.MAX_NAMES));
            }
        }
    }

    private static int visibility(View button) {
        return button == null ? View.GONE : button.getVisibility();
    }

    /** Runs a dialog button's click (posted to the main looper), its queued save, then the save's toast. */
    private static void settle() throws Exception {
        ShadowLooper.idleMainLooper();
        Utils.awaitBackgroundTasksForTests();
        ShadowLooper.idleMainLooper();
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
