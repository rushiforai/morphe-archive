/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Notification;
import android.content.SharedPreferences;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.PauseForTests;
import app.hushgram.extension.shared.settings.Setting;
import app.hushgram.extension.shared.settings.preference.SharedPrefCategory;

/**
 * Locked and hidden chats with two accounts signed in: each account's choices are its own, a
 * notification goes by the account it was sent to, a switch forgets what the last account opened,
 * an account that can't be read sees nothing and changes nothing, and a list from before accounts
 * were keeps every chat on it until each account lets it go.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class ChatAccountsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final String ME = MessagesLockTest.ME;
    private static final String OTHER = "5678";
    private static final String ALICE = "340282366841710300949128111";
    private static final String BOB = "340282366841710300949128222";
    /** A group both accounts are in: the same thread id on each. */
    private static final String GROUP = "340282366841710300949128333";

    private static final int CHAT = 0x7f0b0003;
    private static final int TITLE = 0x7f0b0004;

    /** One of Instagram's screens, as the patch hands it over: signed in to [account], showing [chat] if it's a chat. */
    private static final class Screen {
        final String account;
        final String chat;

        Screen(String account, String chat) {
            this.account = account;
            this.chat = chat;
        }
    }

    private SharedPreferences store;
    private final List<Object[]> redrawn = new ArrayList<>();

    @Before
    public void enable() {
        MessagesLock.resetForTests();
        Map<String, Integer> ids = new HashMap<>();
        ids.put(MessagesLock.CHAT_ROOT, CHAT);
        ids.put(ChatLocks.TITLES[0], TITLE);
        MessagesLock.idsForTests = ids;
        MessagesLock.asker = (activity, confirmed, notConfirmed) -> { };
        readers();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.LOCK_MESSAGES.save(false);
        HookStatus.clear();
        store = Setting.preferences.preferences;
    }

    private void readers() {
        ChatAccounts.reader = screen -> screen instanceof Screen ? ((Screen) screen).account : null;
        ChatLocks.reader = screen -> screen instanceof Screen ? ((Screen) screen).chat : null;
        HiddenChats.reader = summary -> (String) summary;
        HiddenChats.redrawer = (holder, summaries) -> redrawn.add(new Object[]{holder, summaries});
    }

    @After
    public void restore() throws Exception {
        setStore(store);
        MessagesLock.resetForTests();
        Settings.LOCKED_CHATS.resetToDefault();
        Settings.HIDDEN_CHATS.resetToDefault();
        Settings.LOCK_MESSAGES.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** A screen signed in to [account] comes to the front. */
    private static void resume(String account) {
        ChatAccounts.resumed(new Screen(account, null));
    }

    /** [account] opens [chat]: the chat screen's own hook runs first, then its base screen's. */
    private static void open(String account, String chat) {
        Screen screen = new Screen(account, chat);
        ChatLocks.opened(screen);
        ChatAccounts.resumed(screen);
    }

    @Test
    public void theAccountInFrontIsReadOffTheScreensOwnSession() {
        assertNull("no screen has come up yet", ChatAccounts.active());
        resume(ME);
        assertEquals(ME, ChatAccounts.active());
        resume(OTHER);
        assertEquals(OTHER, ChatAccounts.active());
        resume(null);
        assertNull("a screen with no signed-in session", ChatAccounts.active());
        resume(" " + ME + " ");
        assertEquals(ME, ChatAccounts.active());
        resume("12,34");
        assertNull("an id that couldn't be one", ChatAccounts.active());
        ChatAccounts.resumed(null);
        assertNull(ChatAccounts.active());

        ChatAccounts.reader = screen -> { throw new ClassCastException("a signed-out session"); };
        ChatAccounts.resumed(new Object());
        assertNull(ChatAccounts.active());
        assertTrue("a signed-out screen isn't a failure: " + HookStatus.missing(FamilyNames.MESSAGES_LOCK),
                HookStatus.missing(FamilyNames.MESSAGES_LOCK).isEmpty());

        ChatAccounts.resetForTests();
        ChatAccounts.resumed(new Object());
        assertNull("a build without the session bridge never has an account in front", ChatAccounts.active());
    }

    @Test
    public void aGroupBothAccountsAreInIsLockedOnlyOnTheOneThatLockedIt() {
        open(ME, GROUP);
        assertTrue(ChatLocks.add(GROUP, "Friends"));
        assertTrue(ChatLocks.currentListed());
        assertTrue(MessagesLock.chatLocked());

        open(OTHER, GROUP);
        assertEquals(OTHER, ChatAccounts.active());
        assertFalse("the same group on the other account opens as before", ChatLocks.currentListed());
        assertFalse(MessagesLock.chatLocked());
        assertTrue(ChatLocks.chats().isEmpty());
        assertEquals(Collections.singletonList("Friends"), names(ChatLocks.chats(ME)));

        assertTrue(ChatLocks.add(GROUP, "Our group"));
        resume(ME);
        assertTrue(ChatLocks.remove(GROUP));
        assertFalse(ChatLocks.listed(GROUP));
        assertTrue("taken off one account's list, it stays on the other's", ChatLocks.listed(OTHER, GROUP));

        resume(OTHER);
        assertTrue(HiddenChats.add(GROUP, "Our group"));
        ArrayList<Object> inbox = new ArrayList<>(Arrays.asList(GROUP, ALICE));
        assertEquals(Collections.singletonList(ALICE), HiddenChats.filter(inbox));
        resume(ME);
        assertSame("hidden on the other account only", inbox, HiddenChats.filter(inbox));
        assertTrue(HiddenChats.saved().isEmpty());
        assertFalse("taking it off here doesn't touch the other's", HiddenChats.listed(GROUP));
        assertTrue(HiddenChats.remove(GROUP));
        assertTrue(HiddenChats.listed(OTHER, GROUP));
    }

    @Test
    public void aNotificationGoesByTheAccountItWasSentToWhicheverIsInFront() {
        resume(ME);
        assertTrue(ChatLocks.add(ALICE, "Alice"));
        resume(OTHER);

        Notification toMe = MessagesLockTest.message("ig_direct", Notification.CATEGORY_MESSAGE);
        assertFalse(ChatLocks.track(toMe, null, null, "direct_v2?id=" + ALICE, null, null, ME));
        Notification hidden = MessagesLock.notification(toMe);
        assertNotSame("locked on the account it was sent to", toMe, hidden);
        assertEquals("the copy keeps the account", ME, ChatLocks.accountOf(hidden));
        assertEquals(ALICE, ChatLocks.idsOf(hidden));

        Notification toOther = MessagesLockTest.message("ig_direct", Notification.CATEGORY_MESSAGE);
        ChatLocks.track(toOther, null, null, "direct_v2?id=" + ALICE, null, null, OTHER);
        assertSame("the same chat on the other account", toOther, MessagesLock.notification(toOther));
        resume(ME);
        assertSame("whichever account is in front", toOther, MessagesLock.notification(toOther));

        Notification nobody = MessagesLockTest.message("ig_direct", Notification.CATEGORY_MESSAGE);
        ChatLocks.track(nobody, null, null, "direct_v2?id=" + ALICE, null, null, null);
        assertNotSame("a push that names no account goes by every account's list", nobody, MessagesLock.notification(nobody));

        Notification unmarked = MessagesLockTest.message("ig_direct", Notification.CATEGORY_MESSAGE);
        assertTrue(ChatLocks.listedIn(unmarked, "direct|" + ME + ChatLocks.TAG_THREAD + ALICE));
        assertFalse("by Instagram's tag, the account it names", ChatLocks.listedIn(unmarked, "direct|" + OTHER + ChatLocks.TAG_THREAD + ALICE));
        assertTrue("a tag that names no account", ChatLocks.listedIn(unmarked, "direct|" + ChatLocks.TAG_THREAD + ALICE));
        assertEquals(ME, ChatLocks.tagAccount("direct|" + ME + ChatLocks.TAG_THREAD + ALICE + ";type:rr"));
        assertNull(ChatLocks.tagAccount("direct|" + ME));
        assertNull("a tag with no bar names no account", ChatLocks.tagAccount("direct" + ChatLocks.TAG_THREAD + ALICE));
        assertTrue("so every account's list counts", ChatLocks.listedIn(unmarked, "direct" + ChatLocks.TAG_THREAD + ALICE));

        assertTrue(HiddenChats.add(BOB, "Bob"));
        resume(OTHER);
        assertTrue("dropped for the account it was hidden on", ChatLocks.track(null, null, null, null, BOB, null, ME));
        assertFalse("posted for the other", ChatLocks.track(null, null, null, null, BOB, null, OTHER));
        assertTrue(ChatLocks.track(null, null, null, null, BOB, null, null));
        assertTrue(HookStatus.missing(FamilyNames.MESSAGES_LOCK).toString(), HookStatus.missing(FamilyNames.MESSAGES_LOCK).isEmpty());
    }

    @Test
    public void aSwitchForgetsWhatTheLastAccountOpenedAndKeepsWhatItChose() {
        open(ME, ALICE);
        assertEquals(ALICE, ChatLocks.lastOpened().id);
        assertEquals(ALICE, HiddenChats.lastOpened().id);
        assertTrue(ChatLocks.add(BOB, "Bob"));

        resume(OTHER);
        assertNull("another account isn't offered the chat", ChatLocks.lastOpened());
        assertNull(HiddenChats.lastOpened());
        resume(ME);
        assertNull("the chat opened before the switch is forgotten", ChatLocks.lastOpened());
        assertEquals("the account's choices are kept", Collections.singletonList("Bob"), names(ChatLocks.chats()));

        open(OTHER, GROUP);
        assertEquals("a chat the new account opens as it comes up stays offered", GROUP, ChatLocks.lastOpened().id);

        resume(ME);
        assertTrue(HiddenChats.add(ALICE, "Alice"));
        Object holder = new Object();
        List<Object> instagrams = new ArrayList<>(Arrays.asList(ALICE, BOB));
        assertEquals(Collections.singletonList(BOB), HiddenChats.inbox(holder, instagrams));
        redrawn.clear();
        resume(OTHER);
        assertEquals("the inbox is drawn again for the other account", 1, redrawn.size());
        assertSame(holder, redrawn.get(0)[0]);
        assertEquals(Arrays.asList(ALICE, BOB), redrawn.get(0)[1]);
        resume(OTHER);
        resume(null);
        assertEquals("the same account again, or a screen with none, draws nothing", 1, redrawn.size());
        resume(ME);
        assertEquals(2, redrawn.size());
        assertEquals(Collections.singletonList(BOB), redrawn.get(1)[1]);
    }

    @Test
    public void anAccountThatCantBeReadSeesNothingAndChangesNothing() {
        resume(ME);
        assertTrue(ChatLocks.add(ALICE, "Alice"));
        assertTrue(HiddenChats.add(BOB, "Bob"));
        resume(OTHER);
        assertTrue(ChatLocks.add(GROUP, "Friends"));
        String locked = Settings.LOCKED_CHATS.savedValue();
        String hidden = Settings.HIDDEN_CHATS.savedValue();

        Activity activity = chatScreen("Alice Smith");
        open(null, ALICE);

        assertNull(ChatAccounts.active());
        assertTrue(ChatLocks.chats().isEmpty());
        assertTrue(HiddenChats.saved().isEmpty());
        assertTrue(HiddenChats.chats().isEmpty());
        assertTrue("locked on some account, it's covered", ChatLocks.currentListed());
        assertTrue(MessagesLock.chatLocked());
        assertNull("it's offered to no list", ChatLocks.lastOpened());
        assertNull(ChatLocks.lastOpened(ME));
        assertTrue(ChatLocks.listed(GROUP));
        assertTrue(ChatLocks.listed(ALICE));
        assertEquals("every account's hidden chats stay out", Arrays.asList(ALICE, GROUP),
                HiddenChats.filter(new ArrayList<>(Arrays.asList(ALICE, BOB, GROUP))));

        assertFalse(ChatLocks.add(BOB, "Bob"));
        assertFalse(ChatLocks.remove(ALICE));
        assertFalse(ChatLocks.remove(GROUP));
        assertFalse(HiddenChats.add(ALICE, "Alice"));
        assertFalse(HiddenChats.remove(BOB));
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals(locked, Settings.LOCKED_CHATS.savedValue());
        assertEquals(hidden, Settings.HIDDEN_CHATS.savedValue());
    }

    @Test
    public void theListsComeBackTheSameAfterARestart() {
        open(ME, ALICE);
        assertTrue(ChatLocks.add(ALICE, "Alice"));
        assertTrue(HiddenChats.add(BOB, "Bob"));
        resume(OTHER);
        assertTrue(ChatLocks.add(GROUP, "Friends"));
        String locked = Settings.LOCKED_CHATS.savedValue();
        assertTrue(locked.startsWith(ChatList.HEADER + "\n"));
        assertEquals("on disk as it is in memory", locked, store.getString(Settings.LOCKED_CHATS.key, null));

        // A fresh start: nothing in memory but what was saved.
        MessagesLock.resetForTests();
        readers();

        assertNull(ChatAccounts.active());
        assertTrue("before any screen, every account's chat stays locked", ChatLocks.listed(ALICE) && ChatLocks.listed(GROUP));
        resume(ME);
        assertEquals(Collections.singletonList("Alice"), names(ChatLocks.chats()));
        assertEquals(Collections.singletonList("Bob"), names(HiddenChats.saved()));
        assertNull("what was opened before the restart isn't remembered", ChatLocks.lastOpened());
        resume(OTHER);
        assertEquals(Collections.singletonList("Friends"), names(ChatLocks.chats()));
        assertTrue(HiddenChats.saved().isEmpty());
    }

    @Test
    public void anOldListKeepsEveryChatUntilEachAccountLetsItGo() {
        Settings.LOCKED_CHATS.save(ALICE + "\tAlice\n" + BOB + "\tBob");
        Settings.HIDDEN_CHATS.save(GROUP + "\tFriends");
        resume(ME);

        assertEquals(Arrays.asList(ChatList.placeholder(ALICE), ChatList.placeholder(BOB)), names(ChatLocks.chats()));
        assertEquals(Collections.singletonList(ChatList.placeholder(GROUP)), names(HiddenChats.saved()));
        for (String account : Arrays.asList(ME, OTHER, null)) {
            assertTrue(String.valueOf(account), ChatLocks.listed(account, ALICE));
            assertTrue(String.valueOf(account), ChatLocks.listed(account, BOB));
            assertTrue(String.valueOf(account), HiddenChats.listed(account, GROUP));
        }

        assertTrue(ChatLocks.remove(ALICE));
        String migrated = Settings.LOCKED_CHATS.savedValue();
        assertTrue("written over in the new form, all at once", migrated.startsWith(ChatList.HEADER + "\n"));
        assertFalse(migrated.contains("Alice"));
        assertFalse(migrated.contains("Bob"));
        assertFalse(ChatLocks.listed(ME, ALICE));
        assertTrue("the other account still has it", ChatLocks.listed(OTHER, ALICE));
        assertTrue(ChatLocks.listed(OTHER, BOB));
        assertTrue(HiddenChats.remove(GROUP));
        assertTrue(HiddenChats.listed(OTHER, GROUP));

        Activity activity = chatScreen("Bob Smith");
        open(ME, BOB);
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals("opened while signed in, it gets a line for this account under the name seen here",
                Collections.singletonList("Bob Smith"), names(ChatLocks.chats()));

        resume(OTHER);
        assertEquals("and is never handed to the first account that came along",
                Arrays.asList(ChatList.placeholder(ALICE), ChatList.placeholder(BOB)), names(ChatLocks.chats()));
        assertTrue(ChatLocks.listed(BOB));
        assertTrue(HiddenChats.listed(GROUP));
    }

    @Test
    public void aSaveThatFailsChangesNothingAndUnlocksNothing() throws Exception {
        resume(ME);
        assertTrue(ChatLocks.add(ALICE, "Alice"));
        assertTrue(HiddenChats.add(BOB, "Bob"));
        String locked = Settings.LOCKED_CHATS.savedValue();
        String hidden = Settings.HIDDEN_CHATS.savedValue();
        redrawn.clear();
        HiddenChats.inbox(new Object(), new ArrayList<>(Arrays.asList(ALICE, BOB)));

        failCommits();
        assertFalse(ChatLocks.add(GROUP, "Friends"));
        assertFalse(ChatLocks.listed(GROUP));
        assertFalse(ChatLocks.remove(ALICE));
        assertTrue("a failed save leaves the chat locked", ChatLocks.listed(ALICE));
        assertFalse(HiddenChats.remove(BOB));
        assertTrue(HiddenChats.listed(BOB));
        assertTrue("nothing is drawn again for a change that didn't happen", redrawn.isEmpty());
        assertEquals(locked, Settings.LOCKED_CHATS.savedValue());
        assertEquals(hidden, Settings.HIDDEN_CHATS.savedValue());

        // An old list whose first rewrite fails stays the old list, with every chat on it locked.
        setStore(store);
        Settings.LOCKED_CHATS.save(ALICE + "\tAlice");
        failCommits();
        assertFalse(ChatLocks.remove(ALICE));
        assertEquals(ALICE + "\tAlice", Settings.LOCKED_CHATS.savedValue());
        assertTrue(ChatLocks.listed(ME, ALICE));
        assertTrue(ChatLocks.listed(OTHER, ALICE));
        Activity activity = chatScreen("Alice Smith");
        open(ME, ALICE);
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals(ALICE + "\tAlice", Settings.LOCKED_CHATS.savedValue());
        assertTrue(ChatLocks.currentListed());
    }

    @Test
    public void noAccountOrChatIdReachesTheDiagnosticReport() {
        resume(ME);
        ChatLocks.add(ALICE, "Alice");
        HiddenChats.add(BOB, "Bob");
        ChatLocks.track(null, null, null, null, BOB, null, ME);
        ChatLocks.reader = screen -> { throw new IllegalStateException("unreadable"); };
        open(OTHER, ALICE);

        String report = HookStatus.report().toString();
        assertTrue("the failure is reported: " + report, report.contains(IllegalStateException.class.getName()));
        for (String secret : new String[]{ME, OTHER, ALICE, BOB, "Alice", "Bob"}) {
            assertFalse(secret + " is in the report: " + report, report.contains(secret));
        }
    }

    /**
     * A header that only stands in for the chat's name, before the chat has loaded, is looked past
     * and never kept, on the list or as the chat opened last, and the real name that follows it is.
     */
    @Test
    public void aNameThatOnlyStandsInIsLookedPastAndTheRealOneKept() {
        resume(ME);
        assertTrue(ChatLocks.add(ALICE, ""));
        Activity activity = chatScreen("…");
        open(ME, ALICE);
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals(Collections.singletonList(ChatLocks.placeholder(ALICE)), names(ChatLocks.chats(ME)));
        assertTrue("still looking for the name", ChatLocks.wantsName());

        ((TextView) activity.findViewById(TITLE)).setText("Alice Smith");
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals(Collections.singletonList("Alice Smith"), names(ChatLocks.chats(ME)));
        assertFalse(ChatLocks.wantsName());

        // The chat opened last is offered under the real name, never the stand-in.
        activity = chatScreen(" - ");
        open(ME, BOB);
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals(ChatLocks.placeholder(BOB), ChatLocks.lastOpened(ME).name);
        ((TextView) activity.findViewById(TITLE)).setText("Bob Smith");
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals("Bob Smith", ChatLocks.lastOpened(ME).name);

        // A stand-in kept before is no name, and the real one takes its place.
        Settings.LOCKED_CHATS.save(ChatList.HEADER + "\n" + ME + "\t" + BOB + "\t...");
        assertEquals(Collections.singletonList(ChatLocks.placeholder(BOB)), names(ChatLocks.chats(ME)));
        open(ME, BOB);
        ChatLocks.learnName(activity.findViewById(CHAT));
        assertEquals(Collections.singletonList("Bob Smith"), names(ChatLocks.chats(ME)));
    }

    /** A chat screen whose header shows [name]. */
    private static Activity chatScreen(String name) {
        Activity activity = MessagesLockTest.focused().get();
        FrameLayout root = new FrameLayout(activity);
        FrameLayout chat = new FrameLayout(activity);
        chat.setId(CHAT);
        TextView title = new TextView(activity);
        title.setId(TITLE);
        title.setText(name);
        chat.addView(title, new FrameLayout.LayoutParams(300, 80));
        root.addView(chat, new FrameLayout.LayoutParams(300, 500));
        activity.setContentView(root);
        MessagesLockTest.layout(activity);
        return activity;
    }

    private static List<String> names(List<ChatLocks.Chat> chats) {
        List<String> names = new ArrayList<>();
        for (ChatLocks.Chat chat : chats) names.add(chat.name);
        return names;
    }

    private static void setStore(SharedPreferences preferences) throws Exception {
        Field field = SharedPrefCategory.class.getDeclaredField("preferences");
        field.setAccessible(true);
        field.set(Setting.preferences, preferences);
    }

    /** Every save from now on fails to commit, and lands nothing. */
    private void failCommits() throws Exception {
        SharedPreferences original = store;
        SharedPreferences failing = (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                new Class<?>[]{SharedPreferences.class}, (object, method, args) -> {
                    Object result = method.invoke(original, args);
                    if (!method.getName().equals("edit")) return result;
                    SharedPreferences.Editor editor = (SharedPreferences.Editor) result;
                    return Proxy.newProxyInstance(SharedPreferences.Editor.class.getClassLoader(),
                            new Class<?>[]{SharedPreferences.Editor.class}, (self, action, parameters) -> {
                                if (action.getName().equals("commit")) return false;
                                if (action.getName().equals("apply")) return null;
                                Object answer = action.invoke(editor, parameters);
                                return answer == editor ? self : answer;
                            });
                });
        setStore(failing);
    }
}
