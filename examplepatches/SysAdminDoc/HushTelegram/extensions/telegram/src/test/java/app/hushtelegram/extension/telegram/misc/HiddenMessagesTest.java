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
import java.util.List;
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

/** Hide for me in the message menu (#20): what it hides, for whom, for how long, and how it all comes back. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {HiddenMessagesTest.Menu.class, HiddenMessagesTest.Hidden.class},
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class HiddenMessagesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A message as the open chat holds it: its id, chat and account, and what kind it is. */
    static final class Message {
        final int id;
        final long dialog;
        final int account;
        boolean apart;
        boolean live;

        Message(int id, long dialog, int account) {
            this.id = id;
            this.dialog = dialog;
            this.account = account;
        }
    }

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static ArrayList<?> album;

        @Implementation protected static ArrayList<?> grouped(Object chat) { return album; }
        @Implementation protected static int id(Object message) { return ((Message) message).id; }
        @Implementation protected static long dialog(Object message) { return ((Message) message).dialog; }
        @Implementation protected static int account(Object message) { return ((Message) message).account; }
        @Implementation protected static long selfId(int account) { return account == 0 ? 5L : account == 1 ? 6L : 0L; }
    }

    @Implements(value = HiddenMessages.class, isInAndroidSdk = false)
    public static class Hidden {
        static final List<String> vanished = new ArrayList<>();

        @Implementation protected static boolean apart(Object message) { return ((Message) message).apart; }
        @Implementation protected static boolean live(Object message) { return ((Message) message).live; }
        @Implementation protected static void vanish(Object message, ArrayList<Integer> ids) {
            vanished.add(((Message) message).dialog + " " + ids);
        }
    }

    private Context context;

    @Before public void setUp() {
        restore();
        context = RuntimeEnvironment.getApplication();
        PatchFamilyForTests.installed(PatchFamily.Capability.HIDE_FOR_ME);
        Settings.MESSAGE_MENU_HIDE.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        HiddenMessages.showAll();
        HiddenMessages.forgetForTests();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_HIDE);
        Settings.MESSAGE_MENU_HIDE.resetToDefault();
        PatchFamilyForTests.resetCapabilities();
        Menu.album = null;
        Hidden.vanished.clear();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private void hide(Message message) {
        HiddenMessages.hide(context, new Object(), message);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void theSwitchStartsOffAndNothingIsOffered() {
        Settings.MESSAGE_MENU_HIDE.resetToDefault();
        assertFalse(Settings.MESSAGE_MENU_HIDE.get());
        assertFalse(HiddenMessages.offered(new Message(10, 100L, 0)));
    }

    @Test public void offeredOnlyWhereTheBuildHidesAndTheMessageCanBe() {
        assertTrue(HiddenMessages.offered(new Message(10, 100L, 0)));
        PatchFamilyForTests.installed();
        assertFalse("a build without the type tests", HiddenMessages.offered(new Message(10, 100L, 0)));
        PatchFamilyForTests.installed(PatchFamily.Capability.HIDE_FOR_ME);
        Message live = new Message(11, 100L, 0);
        live.live = true;
        Message scheduled = new Message(12, 100L, 0);
        scheduled.apart = true;
        assertFalse("its deleted notice would end the sharing", HiddenMessages.offered(live));
        assertFalse(HiddenMessages.offered(scheduled));
        assertFalse("still sending", HiddenMessages.offered(new Message(-3, 100L, 0)));
        assertFalse("an account with no user yet", HiddenMessages.offered(new Message(10, 100L, 2)));
    }

    @Test public void aHiddenMessageLeavesTheOpenChatAndStaysOut() {
        Message message = new Message(10, 100L, 0);
        assertEquals(4, HiddenMessages.type(message, 4));
        hide(message);
        assertEquals(Collections.singletonList("100 [10]"), Hidden.vanished);
        assertEquals("Hidden on this phone.", ShadowToast.getTextOfLatestToast());
        assertEquals(-1, HiddenMessages.type(message, 4));
        assertEquals("a type Telegram already skips", -7, HiddenMessages.type(message, -7));
        assertEquals("another message in the chat", 4, HiddenMessages.type(new Message(11, 100L, 0), 4));
        assertEquals("the same id in another chat", 4, HiddenMessages.type(new Message(10, 200L, 0), 4));
        HiddenMessages.forgetForTests();
        assertEquals("read back from the phone", -1, HiddenMessages.type(message, 4));
    }

    @Test public void theWholeAlbumGoesButNeverALiveLocation() {
        Message first = new Message(20, 100L, 0);
        Message second = new Message(21, 100L, 0);
        Message live = new Message(22, 100L, 0);
        live.live = true;
        Menu.album = new ArrayList<>(Arrays.asList(first, second, live));
        hide(second);
        assertEquals(Collections.singletonList("100 [20, 21]"), Hidden.vanished);
        assertEquals(-1, HiddenMessages.type(first, 1));
        assertEquals(-1, HiddenMessages.type(second, 1));
        assertEquals(1, HiddenMessages.type(live, 1));
    }

    @Test public void eachAccountKeepsItsOwnList() {
        hide(new Message(10, 100L, 0));
        assertEquals(-1, HiddenMessages.type(new Message(10, 100L, 0), 0));
        assertEquals(0, HiddenMessages.type(new Message(10, 100L, 1), 0));
    }

    @Test public void aScheduledCopyWithTheSameIdStays() {
        hide(new Message(10, 100L, 0));
        Message scheduled = new Message(10, 100L, 0);
        scheduled.apart = true;
        assertEquals(2, HiddenMessages.type(scheduled, 2));
    }

    @Test public void theSwitchOffOrPausedShowsThemAgainWithoutForgetting() {
        Message message = new Message(10, 100L, 0);
        hide(message);
        Settings.MESSAGE_MENU_HIDE.save(false);
        assertEquals(3, HiddenMessages.type(message, 3));
        Settings.MESSAGE_MENU_HIDE.save(true);
        assertEquals(-1, HiddenMessages.type(message, 3));
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertEquals(3, HiddenMessages.type(message, 3));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertEquals(3, HiddenMessages.type(message, 3)));
        assertEquals(-1, HiddenMessages.type(message, 3));
    }

    @Test public void nothingHideableShowsTheFailureAndKeepsNothing() {
        Message live = new Message(10, 100L, 0);
        live.live = true;
        hide(live);
        assertTrue(Hidden.vanished.isEmpty());
        assertEquals("Couldn't complete that action. Try again.", ShadowToast.getTextOfLatestToast());
        live.live = false;
        assertEquals(5, HiddenMessages.type(live, 5));
    }

    @Test public void eachAccountKeepsTheNewestTwoThousand() {
        List<String> keys = new ArrayList<>();
        for (int id = 1; id <= HiddenMessages.LIMIT + 5; id++) keys.add(HiddenMessages.key(100L, id));
        assertTrue(HiddenMessages.remember(5L, keys));
        HiddenMessages.forgetForTests();
        assertEquals("the oldest went", 0, HiddenMessages.type(new Message(5, 100L, 0), 0));
        assertEquals(-1, HiddenMessages.type(new Message(6, 100L, 0), 0));
        assertEquals(-1, HiddenMessages.type(new Message(HiddenMessages.LIMIT + 5, 100L, 0), 0));
        assertTrue("hiding an old one again makes it the newest", HiddenMessages.remember(5L, Collections.singletonList(HiddenMessages.key(100L, 6))));
        assertTrue(HiddenMessages.remember(5L, Collections.singletonList(HiddenMessages.key(100L, 1))));
        assertEquals(0, HiddenMessages.type(new Message(7, 100L, 0), 0));
        assertEquals(-1, HiddenMessages.type(new Message(6, 100L, 0), 0));
        assertEquals(HiddenMessages.LIMIT, HiddenMessages.showAll());
    }

    @Test public void showHiddenMessagesBringsEveryAccountsBack() {
        Message mine = new Message(10, 100L, 0);
        Message other = new Message(10, 100L, 1);
        hide(mine);
        hide(other);
        hide(new Message(11, 100L, 0));
        assertEquals(3, HiddenMessages.showAll());
        assertEquals(4, HiddenMessages.type(mine, 4));
        assertEquals(4, HiddenMessages.type(other, 4));
        HiddenMessages.forgetForTests();
        assertEquals("gone from the phone too", 4, HiddenMessages.type(mine, 4));
        assertEquals(0, HiddenMessages.showAll());
    }

    @Test public void theRowSaysHowManyCameBack() {
        assertEquals("No messages are hidden.", HiddenMessages.shownMessage(0));
        assertEquals("1 message shows again.", HiddenMessages.shownMessage(1));
        assertEquals("3 messages show again.", HiddenMessages.shownMessage(3));
        assertEquals("Couldn't complete that action. Try again.", HiddenMessages.shownMessage(-1));
    }
}
