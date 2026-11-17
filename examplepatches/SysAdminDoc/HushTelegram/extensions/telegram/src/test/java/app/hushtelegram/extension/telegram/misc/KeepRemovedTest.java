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
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
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
import org.robolectric.shadows.ShadowToast;

/** Keep chats you're removed from (#71): which removals it keeps, the list it keeps them in, and what stays Telegram's. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KeepRemovedTest {
    private static final KeepRemoved.Telegram REAL = KeepRemoved.telegram;
    private static final long CHANNEL = 1234567890L;
    private static final long GROUP = 4242L;
    private static final String TOAST = "You were removed. This is what's saved on this phone.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A chat as Telegram's update hands it over. */
    static final class Chat {
        final long id;
        int state;

        Chat(long id, int state) {
            this.id = id;
            this.state = state;
        }
    }

    /** A chat screen showing [chat]. */
    static final class Screen {
        final Chat chat;

        Screen(Chat chat) {
            this.chat = chat;
        }
    }

    private final Object controller = new Object();
    private final Map<Long, Chat> chats = new HashMap<>();
    private final List<String> deletes = new ArrayList<>();
    private boolean broken;

    @Before public void fake() {
        restore();
        PatchFamilyForTests.installed(PatchFamily.Capability.REMOVED_CHATS);
        KeepRemoved.telegram = new KeepRemoved.Telegram() {
            @Override public Object chat(Object owner, long chatId) {
                assertSame(controller, owner);
                if (broken) throw new IllegalStateException("broken");
                return chats.get(chatId);
            }

            @Override public int chatState(Object chat) { return chat == null ? 0 : ((Chat) chat).state; }

            @Override public long chatId(Object chat) { return ((Chat) chat).id; }

            @Override public boolean notInChat(Object chat) {
                return chat == null || (((Chat) chat).state & (KeepRemoved.FORBIDDEN | KeepRemoved.KICKED | KeepRemoved.LEFT
                        | KeepRemoved.DEACTIVATED)) != 0;
            }

            @Override public void delete(Object owner, int onlyHistory, long dialogId, int revoke) {
                assertSame(controller, owner);
                deletes.add(dialogId + "/" + onlyHistory + "/" + revoke);
            }

            @Override public Object screenChat(Object screen) {
                if (broken) throw new IllegalStateException("broken");
                return ((Screen) screen).chat;
            }
        };
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_REMOVED_CHATS);
        Settings.KEEP_REMOVED_CHATS.resetToDefault();
        Settings.KEPT_REMOVED_CHATS.resetToDefault();
        PatchFamilyForTests.resetCapabilities();
        KeepRemoved.telegram = REAL;
        HookStatus.clear();
        ShadowToast.reset();
    }

    private Chat chat(long id, int state) {
        Chat chat = new Chat(id, state);
        chats.put(id, chat);
        return chat;
    }

    private void removing(long dialogId) {
        KeepRemoved.removing(controller, 0, dialogId, 0);
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    @Test public void startsOffSoARemovalDeletesTheChatAsUsual() {
        assertFalse(Settings.KEEP_REMOVED_CHATS.get());
        chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        assertEquals(List.of(-CHANNEL + "/0/0"), deletes);
        assertEquals("", Settings.KEPT_REMOVED_CHATS.get());
    }

    @Test public void aBannedChannelIsKeptListedAndStaysInTheChatList() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        Chat channel = chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        assertTrue("nothing deleted", deletes.isEmpty());
        assertEquals(String.valueOf(-CHANNEL), Settings.KEPT_REMOVED_CHATS.get());
        assertFalse("the chat list keeps it", KeepRemoved.notInChat(channel));
        assertTrue(report(), report().contains(KeepRemoved.KEPT + " 1"));
        removing(-CHANNEL);
        assertEquals("listed once", String.valueOf(-CHANNEL), Settings.KEPT_REMOVED_CHATS.get());
    }

    @Test public void aGroupThatKickedYouIsKeptToo() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        Chat group = chat(GROUP, KeepRemoved.KICKED);
        removing(-GROUP);
        assertTrue(deletes.isEmpty());
        assertFalse(KeepRemoved.notInChat(group));
        chat(CHANNEL, KeepRemoved.FORBIDDEN | KeepRemoved.KICKED);
        removing(-CHANNEL);
        assertTrue(deletes.isEmpty());
        assertEquals(-GROUP + "," + -CHANNEL, Settings.KEPT_REMOVED_CHATS.get());
    }

    @Test public void aChatYouLeftADeletedGroupAndAMovedOneDeleteAsUsual() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        chat(1, KeepRemoved.LEFT);
        chat(2, KeepRemoved.KICKED | KeepRemoved.DEACTIVATED);
        chat(3, KeepRemoved.FORBIDDEN | KeepRemoved.MIGRATED);
        chat(4, KeepRemoved.EMPTY);
        chat(5, 0);
        for (long id = 1; id <= 6; id++) removing(-id);
        assertEquals(List.of("-1/0/0", "-2/0/0", "-3/0/0", "-4/0/0", "-5/0/0", "-6/0/0"), deletes);
        assertEquals("", Settings.KEPT_REMOVED_CHATS.get());
        assertFalse(report().contains(KeepRemoved.KEPT));
    }

    @Test public void onlyAWholeDeleteOfAGroupOrChannelIsEverKept() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        chat(CHANNEL, KeepRemoved.FORBIDDEN);
        KeepRemoved.removing(controller, 1, -CHANNEL, 1);
        KeepRemoved.removing(controller, 0, CHANNEL, 0);
        assertEquals(List.of(-CHANNEL + "/1/1", CHANNEL + "/0/0"), deletes);
        assertEquals("", Settings.KEPT_REMOVED_CHATS.get());
    }

    @Test public void pausedHushTelegramLeavesEveryRemovalAndKeptChatStock() {
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            Settings.KEEP_REMOVED_CHATS.save(true);
            Settings.KEPT_REMOVED_CHATS.save(String.valueOf(-GROUP));
            Chat group = chat(GROUP, KeepRemoved.KICKED);
            Chat channel = chat(CHANNEL, KeepRemoved.FORBIDDEN);
            PauseForTests.pause(reason);
            removing(-CHANNEL);
            assertEquals(reason.name(), List.of(-CHANNEL + "/0/0"), deletes);
            assertTrue(reason.name(), KeepRemoved.notInChat(group));
            assertTrue(reason.name(), KeepRemoved.notInChat(channel));
            assertFalse(reason.name(), KeepRemoved.cantOpen(new Screen(group)));
            assertEquals(reason.name(), String.valueOf(-GROUP), Settings.KEPT_REMOVED_CHATS.savedValue());
            PauseForTests.resume();
            deletes.clear();
        }
    }

    @Test public void aBuildWithoutEveryHookLeavesRemovalsStock() {
        PatchFamilyForTests.resetCapabilities();
        Settings.KEEP_REMOVED_CHATS.save(true);
        chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        assertEquals(List.of(-CHANNEL + "/0/0"), deletes);
    }

    @Test public void aFailingLookupDeletesAsUsualAndIsReported() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        chat(CHANNEL, KeepRemoved.FORBIDDEN);
        broken = true;
        removing(-CHANNEL);
        assertEquals(List.of(-CHANNEL + "/0/0"), deletes);
        assertFalse("no toast and the alert shows", KeepRemoved.cantOpen(new Screen(chats.get(CHANNEL))));
        List<String> missing = HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES);
        assertTrue(missing.toString(), missing.toString().contains("removed chat"));
        assertTrue(missing.toString(), missing.toString().contains("kept chat screen"));
    }

    @Test public void aBrokenSwitchReadDeletesAsUsual() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        SettingReadsForTests.breakReads(Settings.KEEP_REMOVED_CHATS);
        chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        assertEquals(List.of(-CHANNEL + "/0/0"), deletes);
    }

    @Test public void aFullListDeletesTheNextChatAndSaysSo() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        StringBuilder full = new StringBuilder();
        for (int i = 1; i <= KeepRemoved.MAX_CHATS; i++) full.append(i == 1 ? "" : ",").append(-1000L - i);
        Settings.KEPT_REMOVED_CHATS.save(full.toString());
        chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        assertEquals(List.of(-CHANNEL + "/0/0"), deletes);
        assertEquals(full.toString(), Settings.KEPT_REMOVED_CHATS.get());
        assertTrue(report(), report().contains(KeepRemoved.FULL + " 1"));
    }

    @Test public void theChatListKeepsOnlyAListedChatThatStillReadsRemoved() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        Settings.KEPT_REMOVED_CHATS.save(String.valueOf(-CHANNEL));
        Chat channel = chat(CHANNEL, KeepRemoved.FORBIDDEN);
        Chat other = chat(GROUP, KeepRemoved.KICKED);
        Chat member = chat(77, 0);
        assertFalse(KeepRemoved.notInChat(channel));
        assertTrue("not on the list", KeepRemoved.notInChat(other));
        assertFalse("Telegram's own no", KeepRemoved.notInChat(member));
        assertTrue("no chat", KeepRemoved.notInChat(null));
        channel.state = KeepRemoved.LEFT;
        assertTrue("left after all", KeepRemoved.notInChat(channel));
        channel.state = 0;
        assertFalse("back in", KeepRemoved.notInChat(channel));
    }

    @Test public void turningTheSwitchOffLetsTheNextLoadDropTheChatButKeepsTheList() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        Chat channel = chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        Settings.KEEP_REMOVED_CHATS.save(false);
        assertTrue(KeepRemoved.notInChat(channel));
        assertFalse(KeepRemoved.cantOpen(new Screen(channel)));
        assertEquals(String.valueOf(-CHANNEL), Settings.KEPT_REMOVED_CHATS.get());
        Settings.KEEP_REMOVED_CHATS.save(true);
        assertFalse("back on brings it back", KeepRemoved.notInChat(channel));
    }

    @Test public void openingAKeptChatSkipsTheAlertWithOneToastPerScreen() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        Chat channel = chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        Screen screen = new Screen(channel);
        assertTrue(KeepRemoved.cantOpen(screen));
        ShadowLooper.idleMainLooper();
        assertEquals(TOAST, ShadowToast.getTextOfLatestToast());
        assertEquals(1, ShadowToast.shownToastCount());
        assertTrue("the full chat load asks again", KeepRemoved.cantOpen(screen));
        ShadowLooper.idleMainLooper();
        assertEquals("quiet the second time", 1, ShadowToast.shownToastCount());
        assertTrue(KeepRemoved.cantOpen(new Screen(channel)));
        ShadowLooper.idleMainLooper();
        assertEquals("a new screen says it again", 2, ShadowToast.shownToastCount());
        assertTrue(report(), report().contains(KeepRemoved.OPENED + " 3"));
    }

    @Test public void anyOtherChatShowsTelegramsAlert() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        assertFalse("not listed", KeepRemoved.cantOpen(new Screen(chat(CHANNEL, KeepRemoved.FORBIDDEN))));
        assertFalse("no chat", KeepRemoved.cantOpen(new Screen(null)));
        Settings.KEPT_REMOVED_CHATS.save(String.valueOf(-GROUP));
        assertFalse("left", KeepRemoved.cantOpen(new Screen(chat(GROUP, KeepRemoved.LEFT))));
        ShadowLooper.idleMainLooper();
        assertEquals(0, ShadowToast.shownToastCount());
    }

    @Test public void deletingAKeptChatTakesItOffTheListWhateverTheSwitchSays() {
        Settings.KEPT_REMOVED_CHATS.save(-GROUP + "," + -CHANNEL);
        KeepRemoved.deleting(-GROUP, 1, 1);
        assertEquals("clearing history keeps it", -GROUP + "," + -CHANNEL, Settings.KEPT_REMOVED_CHATS.get());
        KeepRemoved.deleting(-GROUP, 1, 0);
        assertEquals(String.valueOf(-CHANNEL), Settings.KEPT_REMOVED_CHATS.get());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        KeepRemoved.deleting(-CHANNEL, 0, 3);
        assertEquals("", Settings.KEPT_REMOVED_CHATS.savedValue());
        KeepRemoved.deleting(-CHANNEL, 1, 0);
        KeepRemoved.deleting(CHANNEL, 1, 0);
        assertEquals("", Settings.KEPT_REMOVED_CHATS.savedValue());
    }

    @Test public void aDeletedChatComesBackOnlyIfItsRemovedAgain() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        Chat channel = chat(CHANNEL, KeepRemoved.FORBIDDEN);
        removing(-CHANNEL);
        KeepRemoved.deleting(-CHANNEL, 1, 0);
        assertTrue("the list let it go", KeepRemoved.notInChat(channel));
        removing(-CHANNEL);
        assertFalse(KeepRemoved.notInChat(channel));
    }

    @Test public void theListTakesOnlyWhatItWrites() {
        assertEquals(0, KeepRemoved.count(""));
        assertTrue(KeepRemoved.allowed(""));
        assertEquals(2, KeepRemoved.count("-5,-1001234567890"));
        assertFalse("a person's chat", KeepRemoved.allowed("5"));
        assertFalse("no dialog", KeepRemoved.allowed("0"));
        assertFalse("a repeat", KeepRemoved.allowed("-5,-5"));
        assertFalse("padding", KeepRemoved.allowed("-05"));
        assertFalse("a space", KeepRemoved.allowed("-5, -6"));
        assertFalse("an empty part", KeepRemoved.allowed("-5,"));
        assertFalse("not a number", KeepRemoved.allowed("-x"));
        assertFalse(KeepRemoved.allowed(null));
        assertEquals(0, KeepRemoved.count("-5,-5"));
        StringBuilder text = new StringBuilder();
        for (int i = 1; i <= KeepRemoved.MAX_CHATS; i++) text.append(i == 1 ? "" : ",").append(-i);
        assertTrue(KeepRemoved.allowed(text.toString()));
        assertFalse("past the limit", KeepRemoved.allowed(text + ",-999"));
    }

    @Test public void aListThisNeverWroteKeepsNothing() {
        Settings.KEEP_REMOVED_CHATS.save(true);
        Settings.KEPT_REMOVED_CHATS.save("-5,-5");
        assertTrue(KeepRemoved.notInChat(chat(5, KeepRemoved.FORBIDDEN)));
    }

    @Test public void theUnpatchedStubsReadNothingAsRemoved() {
        Object chat = new Object();
        assertNull(KeepRemoved.chat(controller, CHANNEL));
        assertEquals(0, KeepRemoved.chatState(chat));
        assertEquals(0, KeepRemoved.chatId(chat));
        assertTrue(KeepRemoved.stockNotInChat(null));
        assertFalse(KeepRemoved.stockNotInChat(chat));
        assertNull(KeepRemoved.screenChat(new Object()));
        KeepRemoved.stockDelete(controller, 0, -CHANNEL, 0);
        KeepRemoved.telegram = REAL;
        Settings.KEEP_REMOVED_CHATS.save(true);
        assertFalse(KeepRemoved.notInChat(chat));
        assertFalse(KeepRemoved.cantOpen(new Object()));
        KeepRemoved.removing(controller, 0, -CHANNEL, 0);
        assertEquals("", Settings.KEPT_REMOVED_CHATS.get());
    }
}
