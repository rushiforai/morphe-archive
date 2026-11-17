/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import android.os.Looper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
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
import org.telegram.tgnet.TLRPC;

/**
 * Send read receipt in the message menu (#79): where Ghost mode offers it, and that the read it
 * sends goes out past Ghost mode's gate once, up to the message, while Telegram's own reads stay
 * kept back.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = ReadReceiptTest.Menu.class, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class ReadReceiptTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    static final long SELF = 5L;
    static final long PERSON = 100L;
    static final long GROUP = -200L;
    static final long SUPERGROUP = -300L;
    static final long CHANNEL = -400L;
    static final long UNKNOWN = -500L;

    /** A message as the open chat holds it. */
    static final class Message {
        final int id;
        final long dialog;
        final long sender;

        Message(int id, long dialog, long sender) {
            this.id = id;
            this.dialog = dialog;
            this.sender = sender;
        }
    }

    @Implements(value = MessageMenu.class, isInAndroidSdk = false)
    public static class Menu {
        static boolean secret;
        static Object selected;

        @Implementation protected static int id(Object message) { return ((Message) message).id; }
        @Implementation protected static long dialog(Object message) { return ((Message) message).dialog; }
        @Implementation protected static long sender(Object message) { return ((Message) message).sender; }
        @Implementation protected static int account(Object message) { return 0; }
        @Implementation protected static long selfId(int account) { return account == 0 ? SELF : 0L; }
        @Implementation protected static boolean secret(long dialog) { return secret; }
        @Implementation protected static Object selected(Object chat) { return selected; }
    }

    /** Telegram's side: the chat kinds above, and its reads built the way it marks a chat read. */
    static final class Fake implements ReadReceipt.Telegram {
        @Override public int kind(int account, long dialog) {
            return dialog == CHANNEL ? ReadReceipt.BROADCAST : dialog == UNKNOWN ? ReadReceipt.NONE : ReadReceipt.CHAT;
        }

        @Override public Object request(int account, long dialog, int id) {
            if (dialog == UNKNOWN) return null;
            if (dialog == SUPERGROUP) {
                TLRPC.TL_channels_readHistory read = new TLRPC.TL_channels_readHistory();
                read.channel = new TLRPC.TL_inputChannel();
                read.channel.channel_id = -dialog;
                read.max_id = id;
                return read;
            }
            TLRPC.TL_messages_readHistory read = new TLRPC.TL_messages_readHistory();
            read.peer = dialog > 0 ? new TLRPC.TL_inputPeerUser() : new TLRPC.TL_inputPeerChat();
            if (dialog > 0) read.peer.user_id = dialog;
            else read.peer.chat_id = -dialog;
            read.max_id = id;
            return read;
        }
    }

    /** The connection: every request passes Ghost mode's gate the way ConnectionsManager's send does. */
    static final class Wire implements GhostMode.Requests {
        final List<Object> out = new ArrayList<>();
        final List<Object> dropped = new ArrayList<>();

        @Override public int account() { return 0; }

        @Override public boolean send(int account, Object request, Object callback) {
            if (GhostMode.drop(request, callback)) dropped.add(request);
            else out.add(request);
            return true;
        }

        @Override public List<Integer> signedIn() { return Collections.singletonList(0); }
    }

    private static final ReadReceipt.Telegram TELEGRAM = ReadReceipt.telegram;
    private static final GhostMode.Requests REQUESTS = GhostMode.requests;

    private Context context;
    private Wire wire;

    @Before public void setUp() {
        restore();
        context = RuntimeEnvironment.getApplication();
        ReadReceipt.telegram = new Fake();
        wire = new Wire();
        GhostMode.requests = wire;
        PatchFamilyForTests.installed(PatchFamily.Capability.GHOST_MODE);
        PatchFamilyForTests.inBuild(PatchFamily.DISABLE_ANALYTICS, PatchFamily.MESSAGE_MENU_REPEAT);
        Settings.GHOST_MODE.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        ReadReceipt.telegram = TELEGRAM;
        GhostMode.requests = REQUESTS;
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_READS.resetToDefault();
        Settings.GHOST_CHATS.resetToDefault();
        GhostChats.save(Collections.emptySet());
        GhostMode.forgetHeld();
        PatchFamilyForTests.resetCapabilities();
        PatchFamilyForTests.reset();
        Menu.secret = false;
        Menu.selected = null;
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static Message from(long dialog, int id) { return new Message(id, dialog, dialog > 0 ? dialog : 77L); }

    private void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void offeredOnOtherPeoplesMessagesWhereGhostModeKeepsReadsBack() {
        assertTrue(ReadReceipt.offered(from(PERSON, 10)));
        assertTrue(ReadReceipt.offered(from(GROUP, 11)));
        assertTrue("a supergroup's read is kept back too", ReadReceipt.offered(from(SUPERGROUP, 12)));

        assertFalse("your own message", ReadReceipt.offered(new Message(13, PERSON, SELF)));
        assertFalse("Saved Messages", ReadReceipt.offered(new Message(14, SELF, SELF)));
        assertFalse("a channel's read already goes out", ReadReceipt.offered(from(CHANNEL, 15)));
        assertFalse("a chat this phone can't place", ReadReceipt.offered(from(UNKNOWN, 16)));
        assertFalse("a message still sending", ReadReceipt.offered(from(PERSON, -1)));
        Menu.secret = true;
        assertFalse("a secret chat reads through its own service message", ReadReceipt.offered(from(PERSON, 17)));
    }

    @Test public void offeredOnlyWhereGhostModeCoversTheChat() {
        Settings.GHOST_CHATS.save(true);
        assertTrue(GhostChats.save(new LinkedHashSet<>(Arrays.asList(PERSON))));
        assertFalse("an exception sends its reads while Ghost mode is on", ReadReceipt.offered(from(PERSON, 10)));
        assertTrue(ReadReceipt.offered(from(GROUP, 11)));

        Settings.GHOST_MODE.save(false);
        assertTrue("an exception keeps them back while it's off", ReadReceipt.offered(from(PERSON, 10)));
        assertFalse(ReadReceipt.offered(from(GROUP, 11)));

        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS.save(false);
        assertFalse("without the read receipts part nothing is kept back", ReadReceipt.offered(from(GROUP, 11)));
        assertFalse(ReadReceipt.on());
    }

    @Test public void notOfferedWithoutGhostModeInTheBuildOrWhilePaused() {
        PatchFamilyForTests.installed();
        assertFalse(ReadReceipt.offered(from(PERSON, 10)));
        PatchFamilyForTests.installed(PatchFamily.Capability.GHOST_MODE);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(ReadReceipt.offered(from(PERSON, 10)));
    }

    @Test public void theReadGoesOutPastTheGateOnceUpToTheMessage() {
        // Telegram's own read of the chat is kept back as usual.
        TLRPC.TL_messages_readHistory own = (TLRPC.TL_messages_readHistory) new Fake().request(0, PERSON, 40);
        wire.send(0, own, null);
        assertEquals(Collections.singletonList(own), wire.dropped);

        ReadReceipt.send(context, from(PERSON, 33));
        idle();
        assertEquals(1, wire.out.size());
        TLRPC.TL_messages_readHistory read = (TLRPC.TL_messages_readHistory) wire.out.get(0);
        assertEquals(33, read.max_id);
        assertEquals(PERSON, read.peer.user_id);
        assertEquals("Read receipt sent.", ShadowToast.getTextOfLatestToast());
        assertTrue(String.join("\n", HookStatus.report()).contains("read receipts sent from the message menu"));

        // It went out once: the next read Telegram sends there is kept back again.
        wire.send(0, new Fake().request(0, PERSON, 41), null);
        assertEquals(1, wire.out.size());
        assertEquals(2, wire.dropped.size());
    }

    @Test public void aSupergroupGoesByItsChannel() {
        ReadReceipt.send(context, from(SUPERGROUP, 9));
        idle();
        TLRPC.TL_channels_readHistory read = (TLRPC.TL_channels_readHistory) wire.out.get(0);
        assertEquals(300L, read.channel.channel_id);
        assertEquals(9, read.max_id);
    }

    @Test public void aReadThatCantBeBuiltSaysSo() {
        ReadReceipt.send(context, from(UNKNOWN, 9));
        idle();
        assertTrue(wire.out.isEmpty());
        assertEquals("Couldn't send the read receipt. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void theMenuPutsItBeforeMessageDetailsAndItsChoiceSendsIt() {
        Message message = from(PERSON, 21);
        List<Object> icons = new ArrayList<>(Collections.singletonList(0));
        List<Object> items = new ArrayList<>(Collections.singletonList("Message details"));
        List<Object> options = new ArrayList<>(Collections.singletonList(MessageMenu.DETAILS));
        assertTrue("the menu asks even with no message menu switch on", MessageMenuTools.any());
        MessageMenuTools.offer(new Object(), message, icons, items, options, false);
        assertEquals(Arrays.asList(MessageMenuTools.READ, MessageMenu.DETAILS), options);
        assertEquals("Send read receipt", items.get(0));

        Menu.selected = message;
        MessageMenu.chosen(new Object(), MessageMenuTools.READ);
        idle();
        assertEquals(1, wire.out.size());
        assertEquals(21, ((TLRPC.TL_messages_readHistory) wire.out.get(0)).max_id);
    }
}
