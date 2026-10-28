/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.telegram.tgnet.RequestDelegate;
import org.telegram.tgnet.TLRPC;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ChatTypeFoldersTest {
    private static final String MADE = "Made Private, Groups, Channels and Bots folders.";
    private static final String REMOVED = "Removed the folders HushTelegram made. Changed ones stay.";
    private static final String NONE_TO_REMOVE = "There were no folders from HushTelegram to remove.";
    private static final String COULDNT = "Couldn't change your folders. Try again in a moment.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final Function<Context, SharedPreferences> realStore = ChatTypeFolders.store;
    private ChatTypeFolders.Telegram real;
    private ChatTypeFoldersForTests.Recorder telegram;
    private Context context;

    @Before public void setUp() {
        context = Utils.getContext();
        real = ChatTypeFolders.telegram;
        telegram = new ChatTypeFoldersForTests.Recorder();
        ChatTypeFolders.telegram = telegram;
        ChatTypeFolders.resetForTests();
        PatchFamilyForTests.inBuild(PatchFamily.CHAT_TYPE_FOLDERS);
        ChatTypeFolders.prefs(context).edit().clear().commit();
        Settings.CHAT_TYPE_FOLDERS.resetToDefault();
        ShadowToast.reset();
    }

    @After public void restore() {
        ChatTypeFolders.telegram = real;
        ChatTypeFolders.store = realStore;
        ChatTypeFolders.resetForTests();
        PatchFamilyForTests.reset();
        PauseForTests.resume();
        ChatTypeFolders.prefs(context).edit().clear().commit();
        Settings.CHAT_TYPE_FOLDERS.resetToDefault();
        HookStatus.clear();
    }

    /** Flips the switch and lets Telegram answer: what the switch says right away, or else the toast once it has. */
    private String turn(boolean on) {
        ShadowToast.reset();
        Settings.CHAT_TYPE_FOLDERS.save(on);
        String said = ChatTypeFolders.apply(context);
        ShadowLooper.idleMainLooper();
        return said != null ? said : ShadowToast.getTextOfLatestToast();
    }

    /** Telegram's server answers what it held while offline. */
    private String reconnect() {
        ShadowToast.reset();
        telegram.reconnect();
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    private String record(int id) {
        return ChatTypeFolders.prefs(context).getString("1000:" + id, null);
    }

    private java.util.Set<String> records() {
        return ChatTypeFolders.prefs(context).getAll().keySet();
    }

    private static List<Integer> sorted(List<Integer> ids) {
        List<Integer> copy = new ArrayList<>(ids);
        Collections.sort(copy);
        return copy;
    }

    private static List<Integer> ids(List<ChatTypeFolders.Folder> folders) {
        List<Integer> ids = new ArrayList<>();
        for (ChatTypeFolders.Folder folder : folders) ids.add(folder.id);
        return ids;
    }

    /** The records' store, as one whose writes never land. */
    private static SharedPreferences lost(SharedPreferences target) {
        ClassLoader loader = ChatTypeFoldersTest.class.getClassLoader();
        return (SharedPreferences) Proxy.newProxyInstance(loader, new Class<?>[]{SharedPreferences.class}, (proxy, method, args) -> {
            if (!method.getName().equals("edit")) return method.invoke(target, args);
            return Proxy.newProxyInstance(loader, new Class<?>[]{SharedPreferences.Editor.class}, (editor, edit, values) -> {
                if (edit.getName().equals("commit")) return false;
                return edit.getName().equals("apply") ? null : editor;
            });
        });
    }

    @Test public void turningItOnMakesAFolderForEachTypeWithFreeIds() {
        telegram.with(0, 0, "All chats").with(2, 1 | 2 | 4, "Work");

        assertEquals(MADE, turn(true));

        assertEquals(Arrays.asList("0/3/Private/3", "0/4/Groups/4", "0/5/Channels/8", "0/6/Bots/16"), telegram.created);
        assertEquals(Arrays.asList(0, 2, 3, 4, 5, 6), ids(telegram.folders));
        assertEquals(4, records().size());
        // Made, with the server's color not known: its list didn't have one for it.
        assertEquals("2|made|16||Bots", record(6));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertTrue(String.join("\n", HookStatus.report()).contains("folder made"));
        // Once, after all four, with the list as the tabs show it, so Telegram's server keeps that order.
        assertEquals(Collections.singletonList(Arrays.asList(0, 2, 3, 4, 5, 6)), telegram.orders);
        assertEquals(1, telegram.fetches);
    }

    @Test public void noOrderIsSentWhenNothingWasMade() {
        telegram.with(2, 1 | 2, "People").with(3, 4, "Groups").with(4, 8, "Channels").with(5, 16, "Bots");
        assertEquals("You already have a folder for each chat type.", turn(true));

        telegram.folders.clear();
        telegram.limit = 0;
        assertEquals("Folder limit reached. Remove a folder and try again.", turn(true));

        turn(false);
        assertTrue(telegram.created.isEmpty());
        assertTrue(telegram.orders.isEmpty());
    }

    @Test public void eachToastFitsTwoLines() {
        // Android shows two lines of a toast from an app that targets 12 or later; about 70 characters fit there.
        for (String said : Arrays.asList(MADE, REMOVED, NONE_TO_REMOVE, COULDNT, "You already have a folder for each chat type.",
                "Folder limit reached. Remove a folder and try again.",
                "Made some folders. The folder limit left no room for the rest.",
                "HushTelegram is paused, so your folders stay as they are.", "Sign in to Telegram first.",
                "Telegram is still loading your folders. Try again in a moment.",
                "Telegram is still answering. Try again in a moment.", "Asking Telegram to make your folders.",
                "Asking Telegram to remove the folders.", "Made some folders. Telegram turned the rest down.",
                "Telegram turned the folders down. Try again later.", "Made the folders. Telegram didn't save their order.",
                "Telegram kept some folders. Turn this off again to retry.",
                "Telegram didn't remove the folders. Try again in a moment.")) {
            assertTrue(said, said.length() <= 64);
        }
    }

    @Test public void typesYouAlreadyHaveAFolderForAreSkipped() {
        // Groups with muted ones left out is still a groups folder. Channels and bots together is neither.
        telegram.with(2, 4 | 32, "Mine").with(3, 1 | 2, "People").with(5, 8 | 16, "Feeds");

        assertEquals(MADE, turn(true));
        assertEquals(Arrays.asList("0/4/Channels/8", "0/6/Bots/16"), telegram.created);

        telegram.created.clear();
        assertEquals("You already have a folder for each chat type.", turn(true));
        assertTrue(telegram.created.isEmpty());
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
    }

    @Test public void telegramsFolderLimitIsKept() {
        telegram.limit = 3;
        telegram.with(0, 0, "All chats").with(2, 7, "Work");

        assertEquals("Made some folders. The folder limit left no room for the rest.", turn(true));
        assertEquals(Arrays.asList("0/3/Private/3", "0/4/Groups/4"), telegram.created);
        assertEquals(1, telegram.orders.size());

        telegram.created.clear();
        assertEquals("Folder limit reached. Remove a folder and try again.", turn(true));
        assertEquals(1, telegram.orders.size());
        assertTrue(telegram.created.isEmpty());
        assertEquals(2, records().size());
        // Nothing was made, so the switch goes back off.
        assertFalse(Settings.CHAT_TYPE_FOLDERS.savedValue());
    }

    @Test public void turningItOffRemovesOnlyTheFoldersLeftAsTheyWereMade() {
        turn(true);
        telegram.edit(2, 1 | 2, "Friends", 0);
        telegram.edit(3, 4 | 8, "Groups", 0);
        // Chats added, left out or pinned, a color or an emoji: Telegram's list says it isn't plain.
        telegram.edit(4, 8, "Channels", ChatTypeFolders.CHATS_PINNED);

        assertEquals(REMOVED, turn(false));
        assertEquals(Collections.singletonList(5), telegram.deleted);
        assertNull("out of the list once the server said yes", telegram.folder(5));
        assertTrue(records().isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("folder removed"));

        assertEquals(NONE_TO_REMOVE, turn(false));
        assertEquals(1, telegram.deleted.size());
    }

    @Test public void theColorTelegramsServerGivesANewFolderDoesntKeepIt() {
        for (int id = 2; id <= 5; id++) telegram.serverColors.put(id, id + 1);

        assertEquals(MADE, turn(true));
        // Telegram's list gets the server's color now, and the record keeps it as where the color started.
        assertEquals(3, telegram.folder(2).color);
        assertEquals(6, telegram.folder(5).color);
        assertEquals("2|made|3|3|Private", record(2));

        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 3, 4, 5), sorted(telegram.deleted));
    }

    @Test public void aColorYouPickLaterKeepsTheFolder() {
        for (int id = 2; id <= 5; id++) telegram.serverColors.put(id, id + 1);
        turn(true);
        // Premium's folder screen: a new color on one, no color on another.
        telegram.recolor(3, 1);
        telegram.recolor(4, -1);

        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 5), sorted(telegram.deleted));
        assertEquals(Arrays.asList(3, 4), sorted(ids(telegram.folders)));
        assertTrue("kept folders are yours now", records().isEmpty());
    }

    @Test public void eachThingYouCanSetOnAFolderKeepsIt() {
        int[] each = {ChatTypeFolders.TITLE_EMOJI, ChatTypeFolders.CHATS_ADDED, ChatTypeFolders.CHATS_LEFT_OUT,
                ChatTypeFolders.CHATS_PINNED, ChatTypeFolders.COLOR | ChatTypeFolders.CHATS_ADDED};
        for (int change : each) {
            telegram = new ChatTypeFoldersForTests.Recorder();
            ChatTypeFolders.telegram = telegram;
            turn(true);
            telegram.edit(2, 1 | 2, "Private", change);

            assertEquals(String.valueOf(change), REMOVED, turn(false));
            assertEquals(String.valueOf(change), Arrays.asList(3, 4, 5), sorted(telegram.deleted));
        }
    }

    @Test public void aFolderYouDeletedIsForgottenAndNothingIsSentForItsId() {
        turn(true);
        // Deleted in Telegram, and its id given to a folder made on another device since.
        telegram.folders.removeIf(folder -> folder.id == 5);

        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 3, 4), sorted(telegram.deleted));
        assertTrue(records().isEmpty());
    }

    @Test public void eachTelegramUserKeepsTheirOwnFolders() {
        telegram.user = 1;
        turn(true);
        assertEquals(4, telegram.created.size());

        // Another user signed in on the same account slot: their folders with the same ids aren't touched.
        telegram.user = 2;
        assertEquals(NONE_TO_REMOVE, turn(false));
        assertTrue(telegram.deleted.isEmpty());
        assertEquals(4, records().size());

        // User 11's records start with "11:", and user 1 still finds only theirs.
        ChatTypeFolders.prefs(context).edit().putString("11:2", "16:Bots").commit();
        telegram.user = 1;
        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 3, 4, 5), sorted(telegram.deleted));
        assertEquals(Collections.singleton("11:2"), records());
    }

    @Test public void whenNothingCanBeDoneTheSwitchGoesBack() {
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), "HushTelegram is paused, so your folders stay as they are.", turn(true));
            assertFalse(reason.name(), Settings.CHAT_TYPE_FOLDERS.savedValue());
            PauseForTests.resume();
        }

        telegram.signedIn = false;
        assertEquals("Sign in to Telegram first.", turn(true));
        assertFalse(Settings.CHAT_TYPE_FOLDERS.savedValue());
        telegram.signedIn = true;

        telegram.loaded = false;
        assertEquals("Telegram is still loading your folders. Try again in a moment.", turn(false));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        telegram.loaded = true;

        Settings.CHAT_TYPE_FOLDERS.save(true);
        SettingsContextRule.withoutContext(() -> assertNull(ChatTypeFolders.apply(context)));
        assertNull(ChatTypeFolders.apply(null));
        PatchFamilyForTests.inBuild();
        assertNull(ChatTypeFolders.apply(context));

        assertTrue(telegram.created.isEmpty());
        assertTrue(telegram.deleted.isEmpty());
        assertTrue(records().isEmpty());
    }

    @Test public void nothingIsAddedOrSaidUntilTelegramAnswers() {
        telegram.offline = true;

        assertNull(turn(true));
        assertEquals(4, telegram.created.size());
        assertTrue("nothing is in the list until the server has it", telegram.folders.isEmpty());
        assertEquals("2|sent|3||Private", record(2));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        // A while without an answer, as offline, says it's still being asked.
        ShadowLooper.idleMainLooper(ChatTypeFolders.PATIENCE_MS, TimeUnit.MILLISECONDS);
        assertEquals("Asking Telegram to make your folders.", ShadowToast.getTextOfLatestToast());
        // Flipping it again meanwhile waits for the answers.
        assertEquals("Telegram is still answering. Try again in a moment.", turn(false));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertTrue(telegram.deleted.isEmpty());

        assertEquals(MADE, reconnect());
        assertEquals(Arrays.asList(2, 3, 4, 5), ids(telegram.folders));
        assertEquals(Collections.singletonList(Arrays.asList(2, 3, 4, 5)), telegram.orders);
        assertEquals("2|made|3||Private", record(2));
        assertEquals(REMOVED, turn(false));
    }

    @Test public void foldersKeepTheirTypeOrderWhateverOrderTheServerAnswersIn() {
        telegram.with(0, 0, "All chats");
        telegram.offline = true;
        turn(true);
        // Seen on a phone: the answers came back Bots, Private, Channels, Groups, and the tabs followed them.
        Collections.reverse(telegram.held);

        assertEquals(MADE, reconnect());
        assertEquals(Arrays.asList(0, 2, 3, 4, 5), ids(telegram.folders));
        assertEquals(Collections.singletonList(Arrays.asList(0, 2, 3, 4, 5)), telegram.orders);
    }

    @Test public void aFolderLimitTelegramsServerKeepsTurnsTheRestDownLater() {
        telegram.offline = true;
        turn(true);
        // The server counts folders from other devices this one hasn't heard about yet.
        telegram.refuse.put(4, ChatTypeFolders.TOO_MANY);
        telegram.refuse.put(5, ChatTypeFolders.TOO_MANY);

        assertEquals("Made some folders. The folder limit left no room for the rest.", reconnect());
        assertEquals(Arrays.asList(2, 3), ids(telegram.folders));
        assertEquals(Collections.singletonList(Arrays.asList(2, 3)), telegram.orders);
        assertEquals(new HashSet<>(Arrays.asList("1000:2", "1000:3")), records());
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
    }

    @Test public void whenTelegramsServerTurnsEveryFolderDownTheSwitchGoesBack() {
        for (int id = 2; id <= 5; id++) telegram.refuse.put(id, ChatTypeFolders.TOO_MANY);
        assertEquals("Folder limit reached. Remove a folder and try again.", turn(true));
        assertFalse(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertTrue(telegram.folders.isEmpty());
        assertTrue(telegram.orders.isEmpty());
        assertTrue(records().isEmpty());

        for (int id = 2; id <= 5; id++) telegram.refuse.put(id, "FLOOD_WAIT_30");
        assertEquals("Telegram turned the folders down. Try again later.", turn(true));
        assertFalse(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertTrue(records().isEmpty());

        telegram.refuse.remove(2);
        assertEquals("Made some folders. Telegram turned the rest down.", turn(true));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertEquals(Collections.singletonList(2), ids(telegram.folders));
    }

    @Test public void anOrderTelegramTurnsDownIsSaid() {
        telegram.refuseOrder = "FILTER_INCLUDE_EMPTY";
        assertEquals("Made the folders. Telegram didn't save their order.", turn(true));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertEquals(4, telegram.folders.size());
    }

    @Test public void aDeleteTelegramTurnsDownKeepsTheFolderAndItsRecord() {
        turn(true);
        telegram.refuse.put(3, "FLOOD_WAIT_5");

        assertEquals("Telegram kept some folders. Turn this off again to retry.", turn(false));
        assertEquals(Arrays.asList(2, 3, 4, 5), sorted(telegram.deleted));
        assertEquals(Collections.singletonList(3), ids(telegram.folders));
        assertEquals(Collections.singleton("1000:3"), records());
        assertEquals("2|made|4||Groups", record(3));
        // Back on, so off asks again for just the one still there, and nothing is made again first.
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());

        telegram.refuse.clear();
        telegram.deleted.clear();
        assertEquals(REMOVED, turn(false));
        assertEquals(Collections.singletonList(3), telegram.deleted);
        assertEquals(4, telegram.created.size());
        assertTrue(telegram.folders.isEmpty());
        assertTrue(records().isEmpty());
    }

    // The switch and its notes are about the account Telegram has open, so a slow answer for another one keeps quiet.
    @Test public void answersForAnAccountThatsNoLongerOpenLeaveTheSwitchAlone() {
        turn(true);
        telegram.offline = true;
        telegram.refuse.put(3, "FLOOD_WAIT_5");
        assertNull(turn(false));

        // The person opens another account before Telegram answers.
        telegram.account = 1;
        ShadowLooper.idleMainLooper(ChatTypeFolders.PATIENCE_MS, TimeUnit.MILLISECONDS);
        assertNull("the wait isn't announced over another account", ShadowToast.getTextOfLatestToast());
        assertNull("nothing is said while another account is open", reconnect());
        assertFalse("the switch isn't put back on for the account on screen", Settings.CHAT_TYPE_FOLDERS.savedValue());
        // The answers still settle the first account's records: the kept folder stays its to remove.
        assertEquals(Collections.singletonList(3), ids(telegram.folders));
        assertEquals(Collections.singleton("1000:3"), records());
    }

    @Test public void whenTelegramKeepsEveryFolderTheSwitchGoesBackOn() {
        turn(true);
        for (int id = 2; id <= 5; id++) telegram.refuse.put(id, "INTERNAL");

        assertEquals("Telegram didn't remove the folders. Try again in a moment.", turn(false));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertEquals(4, telegram.folders.size());
        assertEquals("2|made|16||Bots", record(5));

        // A folder the server no longer has counts as removed.
        for (int id = 2; id <= 5; id++) telegram.refuse.put(id, ChatTypeFolders.NO_SUCH_FOLDER);
        assertEquals(REMOVED, turn(false));
        assertTrue(telegram.folders.isEmpty());
        assertTrue(records().isEmpty());
    }

    @Test public void aRecordThatCantBeSavedSendsNothing() {
        ChatTypeFolders.store = c -> lost(realStore.apply(c));
        assertEquals(COULDNT, turn(true));
        assertTrue(telegram.created.isEmpty());
        assertFalse(Settings.CHAT_TYPE_FOLDERS.savedValue());

        ChatTypeFolders.store = realStore;
        turn(true);
        ChatTypeFolders.store = c -> lost(realStore.apply(c));
        assertEquals(COULDNT, turn(false));
        assertTrue(telegram.deleted.isEmpty());
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        ChatTypeFolders.store = realStore;
        assertEquals("2|made|3||Private", record(2));
    }

    @Test public void aRestartBeforeTelegramAnsweredGoesByItsList() {
        telegram.offline = true;
        turn(true);
        assertEquals("2|sent|3||Private", record(2));

        // The app closes before any answer. After the restart, Telegram's list has what the server made.
        ChatTypeFolders.resetForTests();
        telegram = new ChatTypeFoldersForTests.Recorder().with(2, 1 | 2, "Private").with(3, 4, "Groups");
        ChatTypeFolders.telegram = telegram;

        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 3), sorted(telegram.deleted));
        assertTrue(records().isEmpty());
    }

    @Test public void aRestartWhileRemovingAsksAgainForWhatsStillThere() {
        turn(true);
        telegram.offline = true;
        assertNull(turn(false));
        assertEquals("2|removing|3||Private", record(2));
        ShadowLooper.idleMainLooper(ChatTypeFolders.PATIENCE_MS, TimeUnit.MILLISECONDS);
        assertEquals("Asking Telegram to remove the folders.", ShadowToast.getTextOfLatestToast());

        // The server took two of the deletes before the app closed.
        ChatTypeFolders.resetForTests();
        telegram = new ChatTypeFoldersForTests.Recorder().with(4, 8, "Channels").with(5, 16, "Bots");
        ChatTypeFolders.telegram = telegram;

        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(4, 5), sorted(telegram.deleted));
        assertTrue(records().isEmpty());
    }

    @Test public void answersAfterSomeoneElseSignedInKeepTheRecordsAndSayNothing() {
        telegram.offline = true;
        assertNull(turn(true));

        // Someone else signs in on this account before the answers come, and their flip isn't held up.
        telegram.user = 2;
        assertEquals(NONE_TO_REMOVE, turn(false));
        assertNull("nothing is said to whoever is signed in now", reconnect());
        assertTrue("their folder list isn't touched", telegram.folders.isEmpty());
        assertTrue(telegram.orders.isEmpty());
        // The server made the folders, so they stay the first user's to remove once they're back.
        assertEquals("2|made|3||Private", record(2));

        telegram.user = 1000;
        telegram.with(2, 1 | 2, "Private").with(3, 4, "Groups").with(4, 8, "Channels").with(5, 16, "Bots");
        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 3, 4, 5), sorted(telegram.deleted));
    }

    @Test public void answersToAFlipLeftBehindSayNothingEvenWithItsUserBack() {
        telegram.offline = true;
        assertNull(turn(true));
        // Someone else flips it off meanwhile, and the first user is back before the answers come.
        telegram.user = 2;
        assertEquals(NONE_TO_REMOVE, turn(false));
        telegram.user = 1000;

        assertNull("the switch moved on since, so nothing is said", reconnect());
        assertFalse(Settings.CHAT_TYPE_FOLDERS.savedValue());
        // The server made them, so they're in the list and stay the first user's to remove.
        assertEquals(Arrays.asList(2, 3, 4, 5), ids(telegram.folders));
        assertTrue(telegram.orders.isEmpty());
        assertEquals("2|made|3||Private", record(2));
        assertEquals(REMOVED, turn(false));
    }

    @Test public void aRefusalAfterItsUserSignedOutLeavesTheListToDecide() {
        telegram.offline = true;
        assertNull(turn(true));
        // Signed out before the answers: Telegram drops what it had queued, though the server may have made some.
        telegram.signedIn = false;
        for (int id = 2; id <= 5; id++) telegram.refuse.put(id, "UNKNOWN");
        assertNull(reconnect());
        assertEquals("2|sent|3||Private", record(2));
        assertEquals(4, records().size());

        // Back, with two of them made after all: off removes those and forgets the rest.
        telegram.signedIn = true;
        telegram.refuse.clear();
        telegram.with(2, 1 | 2, "Private").with(3, 4, "Groups");
        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 3), sorted(telegram.deleted));
        assertTrue(records().isEmpty());
    }

    @Test public void aFolderTheServerMadeCountsEvenIfTheListCantTakeIt() {
        telegram = new ChatTypeFoldersForTests.Recorder() {
            @Override public void add(int account, int id, String name, int flags) {
                throw new IllegalStateException("list changed");
            }
        };
        ChatTypeFolders.telegram = telegram;

        assertEquals(MADE, turn(true));
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertFalse(HookStatus.missing(FamilyNames.CHAT_TYPE_FOLDERS).isEmpty());
        assertEquals("2|made|3||Private", record(2));
    }

    @Test public void anAccountCheckThatThrowsDuringAnAnswerDoesntCloseTelegram() {
        boolean[] broken = {false};
        telegram = new ChatTypeFoldersForTests.Recorder() {
            @Override public boolean signedIn(int account) {
                if (broken[0]) throw new IllegalStateException("account gone");
                return super.signedIn(account);
            }
        };
        ChatTypeFolders.telegram = telegram;
        telegram.offline = true;
        assertNull(turn(true));

        broken[0] = true;
        assertNull("not knowing who's signed in counts as gone", reconnect());
        assertEquals("2|made|3||Private", record(2));
        assertFalse(HookStatus.missing(FamilyNames.CHAT_TYPE_FOLDERS).isEmpty());
    }

    @Test public void recordsFromBeforeThisVersionStillWork() {
        ChatTypeFolders.prefs(context).edit().putString("1000:2", "3:Private").putString("1000:3", "4:Groups")
                .putString("1000:4", "8:Channels").putString("1000:9", "unreadable").commit();
        // The server colored them, which a record from before doesn't know about, and one was renamed since.
        telegram.with(2, 1 | 2, "Private", ChatTypeFolders.COLOR).with(3, 4, "Chats", ChatTypeFolders.COLOR)
                .with(4, 8, "Channels");
        Settings.CHAT_TYPE_FOLDERS.save(true);

        assertEquals(REMOVED, turn(false));
        assertEquals(Arrays.asList(2, 4), sorted(telegram.deleted));
        assertTrue(records().isEmpty());
    }

    @Test public void aRequestThatCantBeSentIsReportedAndTheOnesSentStillLand() {
        telegram = new ChatTypeFoldersForTests.Recorder() {
            @Override public void create(int account, int id, String name, int flags, ChatTypeFolders.Reply reply) {
                if (id > 2) throw new IllegalStateException("no connection");
                super.create(account, id, name, flags, reply);
            }
        };
        ChatTypeFolders.telegram = telegram;

        assertEquals("Made some folders. Telegram turned the rest down.", turn(true));
        assertFalse(HookStatus.missing(FamilyNames.CHAT_TYPE_FOLDERS).isEmpty());
        assertTrue(Settings.CHAT_TYPE_FOLDERS.savedValue());
        // Private went out before the failure, so turning it off can still find it. The rest were never asked for.
        assertEquals(Collections.singleton("1000:2"), records());
        assertEquals("2|made|3||Private", record(2));
    }

    @Test public void whenNoRequestCanBeSentNothingIsKept() {
        telegram = new ChatTypeFoldersForTests.Recorder() {
            @Override public void create(int account, int id, String name, int flags, ChatTypeFolders.Reply reply) {
                throw new IllegalStateException("not patched");
            }
        };
        ChatTypeFolders.telegram = telegram;

        assertEquals(COULDNT, turn(true));
        assertFalse(Settings.CHAT_TYPE_FOLDERS.savedValue());
        assertTrue(records().isEmpty());
    }

    @Test public void telegramsCallbackAnswersOnTheMainThread() {
        List<String> answers = new ArrayList<>();
        RequestDelegate delegate = (RequestDelegate) ChatTypeFolders.delegate(RequestDelegate.class,
                (response, error) -> answers.add(response + "/" + error));
        delegate.run("yes", null);
        delegate.run("ignored", new TLRPC.TL_error(400, "FILTER_ID_INVALID"));
        assertTrue("Telegram calls from its network thread, so the answer is posted", answers.isEmpty());

        ShadowLooper.idleMainLooper();
        // Unpatched, the error's text isn't read, so a refusal still comes through as one.
        assertEquals(Arrays.asList("yes/null", "null/UNKNOWN"), answers);
        assertEquals(delegate, delegate);
        assertNotEquals(delegate, ChatTypeFolders.delegate(RequestDelegate.class, (response, error) -> {}));
        assertEquals(System.identityHashCode(delegate), delegate.hashCode());
        assertNotNull(delegate.toString());
        assertThrows(IllegalStateException.class, () -> ChatTypeFolders.delegate(null, (response, error) -> {}));
    }

    @Test public void theRealTelegramReadsThroughTheStubs() {
        ChatTypeFolders.telegram = real;
        // Unpatched stubs say signed out, so nothing is sent.
        assertEquals("Sign in to Telegram first.", turn(true));
        assertNull(real.folders(0));
    }
}
