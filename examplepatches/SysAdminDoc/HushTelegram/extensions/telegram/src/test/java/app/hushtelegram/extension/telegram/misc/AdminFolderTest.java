/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AdminFolderTest {
    private static final String MADE = "Made the Admin folder.";
    private static final String REMOVED = "Removed the Admin folder.";
    private static final String NONE = "You don't manage any groups or channels yet.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final ChatTypeFolders.Telegram realFolders = ChatTypeFolders.telegram;
    private final AdminFolder.Telegram realTelegram = AdminFolder.telegram;
    private final LongSupplier realClock = AdminFolder.clock;
    private Context context;
    private ChatTypeFoldersForTests.Recorder folders;
    private Server server;
    private long now = 1_000_000;

    @Before public void setUp() {
        context = Utils.getContext();
        folders = new ChatTypeFoldersForTests.Recorder();
        server = new Server();
        ChatTypeFolders.telegram = folders;
        AdminFolder.telegram = server;
        AdminFolder.clock = () -> now;
        ChatTypeFolders.resetForTests();
        AdminFolder.resetForTests();
        PatchFamilyForTests.inBuild(PatchFamily.CHAT_TYPE_FOLDERS);
        clearRecords();
        Settings.ADMIN_FOLDER.resetToDefault();
        Settings.CHAT_TYPE_FOLDERS.resetToDefault();
        ShadowToast.reset();
    }

    @After public void restore() {
        ChatTypeFolders.telegram = realFolders;
        AdminFolder.telegram = realTelegram;
        AdminFolder.clock = realClock;
        ChatTypeFolders.resetForTests();
        AdminFolder.resetForTests();
        PatchFamilyForTests.reset();
        PauseForTests.resume();
        clearRecords();
        Settings.ADMIN_FOLDER.resetToDefault();
        Settings.CHAT_TYPE_FOLDERS.resetToDefault();
        HookStatus.clear();
    }

    private void clearRecords() {
        AdminFolder.prefs(context).edit().clear().commit();
        ChatTypeFolders.prefs(context).edit().clear().commit();
    }

    /** Flips the switch and lets Telegram answer: what the switch says right away, or else the toast once it has. */
    private String turn(boolean on) {
        ShadowToast.reset();
        Settings.ADMIN_FOLDER.save(on);
        String said = AdminFolder.apply(context);
        ShadowLooper.idleMainLooper();
        return said != null ? said : ShadowToast.getTextOfLatestToast();
    }

    /** Telegram sorts the chat list, a while after the last time. */
    private void sortAfter(long ms) {
        now += ms;
        AdminFolder.refresh();
        ShadowLooper.idleMainLooper();
    }

    private String record() {
        return AdminFolder.prefs(context).getString("1000", null);
    }

    /** Three groups and channels you manage, one you only read, a person, and one you left. */
    private void manageSome() {
        server.dialogs = new long[]{5, -1, -2, -3, -7};
        server.roles.put(-1L, AdminFolder.MANAGED);
        server.roles.put(-2L, AdminFolder.OTHER);
        server.roles.put(-3L, AdminFolder.MANAGED);
        server.roles.put(-7L, AdminFolder.OTHER);
    }

    @Test public void turningItOnMakesTheFolderWithTheChatsYouManage() {
        manageSome();
        assertEquals(MADE, turn(true));
        assertEquals(Collections.singletonList("2/Admin/[-1, -3]"), server.saved);
        assertEquals("1|made|2|Admin", record());
        ChatTypeFolders.Folder made = folders.folder(2);
        assertNotNull("the tab shows before Telegram's list loads again", made);
        assertEquals("Admin", made.name);
        assertEquals(0, made.flags);
        assertEquals(1, server.reloads);
        assertTrue(Settings.ADMIN_FOLDER.get());
        assertTrue(folders.created.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("admin folder made"));
    }

    @Test public void nothingToManageTurnsTheSwitchBack() {
        server.dialogs = new long[]{5, -2};
        server.roles.put(-2L, AdminFolder.OTHER);
        assertEquals(NONE, turn(true));
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
        assertTrue(server.saved.isEmpty());
        assertNull(record());
    }

    @Test public void moreChatsThanAFolderHoldsSaysSomeDidntFit() {
        manageSome();
        server.roles.put(-2L, AdminFolder.MANAGED);
        server.limit = 2;
        assertEquals("Made the Admin folder. Some chats didn't fit.", turn(true));
        assertEquals(Collections.singletonList("2/Admin/[-1, -2]"), server.saved);

        assertTrue(AdminFolder.pick(0, null).cut);
        server.limit = 0;
        AdminFolder.Selection all = AdminFolder.pick(0, null);
        assertEquals("a limit that reads as nothing uses Telegram's default", 3, all.chats.length);
        assertFalse(all.cut);
    }

    @Test public void itTakesAnIdNoFolderOrFolderRecordHas() {
        manageSome();
        folders.with(2, 0, "Work");
        ChatTypeFolders.prefs(context).edit().putString("1000:3", "made by Folders by chat type").commit();
        ChatTypeFolders.prefs(context).edit().putString("2000:4", "another account's").commit();
        assertEquals(MADE, turn(true));
        assertEquals(Collections.singletonList("4/Admin/[-1, -3]"), server.saved);
        assertEquals(Collections.singleton(4), AdminFolder.recordedIds(context, 1000));
        assertTrue(AdminFolder.recordedIds(context, 2000).isEmpty());
    }

    @Test public void foldersByChatTypeSkipsTheAdminFoldersId() {
        AdminFolder.prefs(context).edit().putString("1000", "1|sent|2|Admin").commit();
        Settings.CHAT_TYPE_FOLDERS.save(true);
        ChatTypeFolders.apply(context);
        ShadowLooper.idleMainLooper();
        assertFalse(folders.created.isEmpty());
        for (String made : folders.created) assertFalse(made, made.startsWith("0/2/"));
    }

    @Test public void aFullFolderListTurnsTheSwitchBack() {
        manageSome();
        folders.limit = 1;
        folders.with(0, 0, "All chats").with(2, 0, "Work");
        assertEquals("Folder limit reached. Remove a folder and try again.", turn(true));
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
        assertTrue(server.saved.isEmpty());
    }

    @Test public void turningItOffRemovesIt() {
        manageSome();
        turn(true);
        assertEquals(REMOVED, turn(false));
        assertEquals(Collections.singletonList(2), folders.deleted);
        assertNull(folders.folder(2));
        assertNull(record());
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
    }

    @Test public void aFolderYouChangedStays() {
        manageSome();
        turn(true);
        folders.edit(2, 0, "Mine", ChatTypeFolders.CHATS_ADDED);
        assertEquals("You changed the Admin folder, so it stays.", turn(false));
        assertTrue(folders.deleted.isEmpty());
        assertNull(record());

        for (int[] change : new int[][]{{ChatTypeFolders.ALL_TYPES & 2, 0}, {0, ChatTypeFolders.TITLE_EMOJI},
                {0, ChatTypeFolders.CHATS_LEFT_OUT}, {0, ChatTypeFolders.CHATS_PINNED}}) {
            AdminFolder.Record made = new AdminFolder.Record(AdminFolder.Record.MADE, 2, "Admin");
            assertFalse(AdminFolder.ours(made, new ChatTypeFolders.Folder(2, change[0], "Admin", change[1])));
        }
        AdminFolder.Record made = new AdminFolder.Record(AdminFolder.Record.MADE, 2, "Admin");
        assertTrue("chats it put in itself and a color stay ours",
                AdminFolder.ours(made, new ChatTypeFolders.Folder(2, 0, "Admin", ChatTypeFolders.CHATS_ADDED | ChatTypeFolders.COLOR)));
    }

    @Test public void aFolderAlreadyGoneIsForgottenQuietly() {
        manageSome();
        turn(true);
        folders.drop(0, 2);
        assertNull(turn(false));
        assertTrue(folders.deleted.isEmpty());
        assertNull(record());
    }

    @Test public void telegramTurningDownTheFolderTurnsTheSwitchBack() {
        manageSome();
        server.refuse.put(2, "FILTER_INCLUDE_EMPTY");
        assertEquals("Telegram didn't make the folder. Try again later.", turn(true));
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
        assertNull(record());
        assertNull(folders.folder(2));

        server.refuse.put(2, ChatTypeFolders.TOO_MANY);
        assertEquals("Folder limit reached. Remove a folder and try again.", turn(true));
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
    }

    @Test public void telegramKeepingTheFolderTurnsTheSwitchBackOn() {
        manageSome();
        turn(true);
        folders.refuse.put(2, "FLOOD_WAIT_5");
        assertEquals("Telegram kept the Admin folder. Try again later.", turn(false));
        assertTrue(Settings.ADMIN_FOLDER.savedValue());
        assertEquals("1|made|2|Admin", record());
        assertNotNull(folders.folder(2));
    }

    @Test public void aFolderStillThereFromBeforeIsUpdatedNotDoubled() {
        manageSome();
        AdminFolder.prefs(context).edit().putString("1000", "1|made|2|Admin").commit();
        folders.with(2, 0, "Admin");
        server.chats.put(2, new ArrayList<>(Arrays.asList(-3L)));
        assertEquals(MADE, turn(true));
        assertEquals(Collections.singletonList("2/Admin/[-3, -1]"), server.saved);
        assertEquals(1, folders.folders.size());
        assertEquals("1|made|2|Admin", record());
    }

    @Test public void whileOnItFollowsYourRightsAtMostOnceAMinute() {
        manageSome();
        turn(true);
        // You lost your rights in -1, became an admin of -9, and a chat Telegram hasn't loaded is in the folder.
        server.chats.put(2, new ArrayList<>(Arrays.asList(-1L, -3L, -4L)));
        server.dialogs = new long[]{-3, -9, -1};
        server.roles.put(-1L, AdminFolder.OTHER);
        server.roles.put(-9L, AdminFolder.MANAGED);
        ShadowToast.reset();
        sortAfter(0);
        assertEquals(Arrays.asList("2/Admin/[-1, -3]", "2/Admin/[-3, -4, -9]"), server.saved);
        assertNull("nobody asked, so nothing is said", ShadowToast.getLatestToast());
        assertTrue(String.join("\n", HookStatus.report()).contains("admin folder updated"));

        server.roles.put(-3L, AdminFolder.OTHER);
        sortAfter(AdminFolder.REFRESH_MS / 2);
        assertEquals("within a minute of the last check", 2, server.saved.size());
        sortAfter(AdminFolder.REFRESH_MS / 2);
        assertEquals("2/Admin/[-4, -9]", server.saved.get(2));
        sortAfter(AdminFolder.REFRESH_MS);
        assertEquals("nothing changed", 3, server.saved.size());

        server.roles.put(-9L, AdminFolder.OTHER);
        server.roles.put(-4L, AdminFolder.OTHER);
        sortAfter(AdminFolder.REFRESH_MS);
        assertEquals("a folder with nothing left in it stays as it is", 3, server.saved.size());
    }

    @Test public void aRenamedFolderIsLeftAsYouMadeIt() {
        manageSome();
        turn(true);
        folders.edit(2, 0, "Mine", 0);
        server.roles.put(-9L, AdminFolder.MANAGED);
        server.dialogs = new long[]{-1, -3, -9};
        sortAfter(0);
        assertEquals(1, server.saved.size());
    }

    @Test public void deletingTheFolderInTelegramTurnsTheSwitchOff() {
        manageSome();
        turn(true);
        folders.drop(0, 2);
        sortAfter(0);
        assertEquals("missing once loads Telegram's folders again first", 2, server.reloads);
        assertTrue(Settings.ADMIN_FOLDER.get());
        assertNotNull(record());
        sortAfter(AdminFolder.REFRESH_MS);
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
        assertNull(record());
        assertEquals(1, server.saved.size());
        sortAfter(AdminFolder.REFRESH_MS);
        assertEquals(2, server.reloads);
    }

    @Test public void aSecondFlipWaitsForTelegramsAnswer() {
        manageSome();
        server.holding = true;
        ShadowToast.reset();
        Settings.ADMIN_FOLDER.save(true);
        assertNull(AdminFolder.apply(context));
        assertEquals("1|sent|2|Admin", record());
        Settings.ADMIN_FOLDER.save(false);
        assertEquals("Telegram is still answering. Try again in a moment.", AdminFolder.apply(context));
        assertTrue("the switch goes back to the flip still waiting", Settings.ADMIN_FOLDER.savedValue());
        sortAfter(0);
        assertEquals(1, server.saved.size());
        server.answer();
        ShadowLooper.idleMainLooper();
        assertEquals(MADE, ShadowToast.getTextOfLatestToast());
        assertEquals("1|made|2|Admin", record());
    }

    @Test public void anotherAccountsAnswerChangesOnlyItsOwnRecord() {
        manageSome();
        server.holding = true;
        Settings.ADMIN_FOLDER.save(true);
        assertNull(AdminFolder.apply(context));
        folders.user = 2000;
        server.answer();
        ShadowLooper.idleMainLooper();
        assertNull("the account that asked isn't open now", ShadowToast.getLatestToast());
        assertNull(folders.folder(2));
        assertEquals(0, server.reloads);
        assertEquals("1|made|2|Admin", record());
    }

    @Test public void whenItCantAskTheSwitchGoesBack() {
        folders.signedIn = false;
        assertEquals("Sign in to Telegram first.", turn(true));
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
        folders.signedIn = true;
        folders.loaded = false;
        assertEquals("Telegram is still loading your folders. Try again in a moment.", turn(true));
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
    }

    @Test public void pausedOrNotInTheBuildLeavesYourFoldersAlone() {
        manageSome();
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertEquals("HushTelegram is paused, so your folders stay as they are.", turn(true));
        assertFalse(Settings.ADMIN_FOLDER.savedValue());
        assertTrue(server.saved.isEmpty());
        PauseForTests.resume();

        turn(true);
        server.roles.put(-9L, AdminFolder.MANAGED);
        server.dialogs = new long[]{-1, -3, -9};
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        sortAfter(0);
        assertEquals(1, server.saved.size());
        PauseForTests.resume();

        PatchFamilyForTests.inBuild(PatchFamily.MY_MESSAGES);
        Settings.ADMIN_FOLDER.save(false);
        assertNull(AdminFolder.apply(context));
        sortAfter(AdminFolder.REFRESH_MS);
        assertEquals("a build whose Folders by chat type didn't fit the Admin folder", 1, server.saved.size());
        assertTrue(folders.deleted.isEmpty());
    }

    /** Telegram's dialogs, your rights in them, and the folder requests it answers on the main thread. */
    static final class Server implements AdminFolder.Telegram {
        long[] dialogs = {};
        final Map<Long, Integer> roles = new HashMap<>();
        int limit = 100;
        final Map<Integer, List<Long>> chats = new HashMap<>();
        final List<String> saved = new ArrayList<>();
        final Map<Integer, String> refuse = new HashMap<>();
        int reloads;
        boolean holding;
        private final List<Runnable> held = new ArrayList<>();

        @Override public long[] dialogs(int account) { return dialogs; }

        @Override public int role(int account, long dialogId) {
            if (dialogId >= 0) return AdminFolder.OTHER;
            Integer role = roles.get(dialogId);
            return role == null ? AdminFolder.UNKNOWN : role;
        }

        @Override public int chatLimit(int account) { return limit; }

        @Override public List<Long> chats(int account, int id) {
            List<Long> listed = chats.get(id);
            return listed == null ? null : new ArrayList<>(listed);
        }

        @Override public void save(int account, int id, String name, long[] ids, ChatTypeFolders.Reply reply) {
            saved.add(id + "/" + name + "/" + Arrays.toString(ids));
            Runnable answer = () -> {
                String no = refuse.get(id);
                if (no == null) {
                    List<Long> listed = new ArrayList<>();
                    for (long chat : ids) listed.add(chat);
                    chats.put(id, listed);
                }
                reply.done(no == null ? Boolean.TRUE : null, no);
            };
            if (holding) held.add(answer);
            else Utils.runOnMainThread(answer);
        }

        @Override public void reload(int account) { reloads++; }

        void answer() {
            holding = false;
            for (Runnable answer : held) Utils.runOnMainThread(answer);
            held.clear();
        }
    }
}
