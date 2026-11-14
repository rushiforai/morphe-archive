/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.telegram.tgnet.TLRPC;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Send read receipts in a chat's menu at the top (#69), with the chat and Telegram's send stood in for. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = ReadsMenuTest.Host.class)
public class ReadsMenuTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final GhostMode.Requests REQUESTS = GhostMode.requests;
    private final List<Object> sent = new ArrayList<>();
    private final List<Integer> from = new ArrayList<>();
    private boolean sends = true;

    @Before public void setUp() {
        reset();
        GhostMode.requests = new GhostMode.Requests() {
            @Override public int account() { return 0; }
            @Override public List<Integer> signedIn() { return Collections.singletonList(0); }
            @Override public boolean send(int account, Object request, Object callback) {
                if (!sends) return false;
                sent.add(request);
                from.add(account);
                return true;
            }
        };
    }

    @After public void tearDown() {
        GhostMode.requests = REQUESTS;
        reset();
    }

    private static void reset() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.GHOST_READS_BUTTON);
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_READS.resetToDefault();
        Settings.GHOST_READS_BUTTON.resetToDefault();
        GhostMode.forgetHeld();
        ReadsMenu.resetForTests();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static void on() {
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_READS.save(true);
        Settings.GHOST_READS_BUTTON.save(true);
    }

    /** A read Telegram sends for [user]'s chat, which Ghost mode keeps back while it's on. */
    private static TLRPC.TL_messages_readHistory heldRead(long user) {
        TLRPC.TL_messages_readHistory read = new TLRPC.TL_messages_readHistory();
        TLRPC.InputPeer peer = new TLRPC.TL_inputPeerUser();
        peer.user_id = user;
        read.peer = peer;
        read.max_id = 1;
        assertTrue("Ghost mode keeps the read back", GhostMode.drop(read, null));
        return read;
    }

    private static String toast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    @Test public void offByDefaultAddsNothing() {
        Chat chat = new Chat(5);
        ReadsMenu.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
    }

    @Test public void aChatGetsTheItemOnceWhileTheButtonIsOn() {
        on();
        Chat chat = new Chat(5);
        ReadsMenu.headerMenu(chat);
        ReadsMenu.headerMenu(chat);
        assertEquals("every later update of the Translate item leaves it alone", 1, chat.items.size());
        assertEquals(ReadsMenu.ITEM, chat.items.get(0).id);
        assertEquals("Send read receipts", chat.items.get(0).text);
        Chat bare = new Chat(6);
        bare.hasHeader = false;
        ReadsMenu.headerMenu(bare);
        assertTrue("a chat that built no menu", bare.items.isEmpty());
        ReadsMenu.headerMenu(null);
        for (Runnable off : Arrays.<Runnable>asList(() -> Settings.GHOST_MODE.save(false),
                () -> Settings.GHOST_READS.save(false), () -> Settings.GHOST_READS_BUTTON.save(false))) {
            on();
            off.run();
            Chat later = new Chat(7);
            ReadsMenu.headerMenu(later);
            assertTrue("it shows with the chat list's button", later.items.isEmpty());
        }
    }

    @Test public void choosingTheItemSendsOnlyThisChatsRead() {
        on();
        TLRPC.TL_messages_readHistory here = heldRead(5);
        TLRPC.TL_messages_readHistory elsewhere = heldRead(6);
        Chat chat = new Chat(5);
        chat.account = 2;
        assertTrue(ReadsMenu.headerClick(chat, ReadsMenu.ITEM));
        assertTrue("held under the account on screen, nothing for account 2", sent.isEmpty());
        assertEquals("No read receipts waiting", toast());

        chat.account = 0;
        assertTrue(ReadsMenu.headerClick(chat, ReadsMenu.ITEM));
        assertEquals(Collections.singletonList((Object) here), sent);
        assertEquals(Collections.singletonList(0), from);
        assertEquals("Read receipts sent", toast());
        assertTrue(ReadsMenu.headerClick(chat, ReadsMenu.ITEM));
        assertEquals("No read receipts waiting", toast());
        assertEquals("the other chat's read is still held", 1, GhostMode.sendHeld());
        assertEquals(Arrays.asList((Object) here, elsewhere), sent);
        assertTrue(String.join("\n", HookStatus.report()).contains("reads sent from a chat's menu 1"));
    }

    @Test public void aReadThatCouldntGoSaysSoAndWaits() {
        on();
        TLRPC.TL_messages_readHistory here = heldRead(5);
        sends = false;
        Chat chat = new Chat(5);
        assertTrue(ReadsMenu.headerClick(chat, ReadsMenu.ITEM));
        assertEquals("Couldn't send read receipts", toast());
        sends = true;
        assertTrue(ReadsMenu.headerClick(chat, ReadsMenu.ITEM));
        assertEquals(Collections.singletonList((Object) here), sent);
        Chat broken = new Chat(5);
        broken.failId = true;
        assertTrue(ReadsMenu.headerClick(broken, ReadsMenu.ITEM));
        assertEquals("Couldn't send read receipts", toast());
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
    }

    @Test public void anItemLeftOpenAfterTheSwitchWentOffStillSendsThatChatsRead() {
        on();
        TLRPC.TL_messages_readHistory here = heldRead(5);
        Settings.GHOST_READS_BUTTON.save(false);
        assertTrue(ReadsMenu.headerClick(new Chat(5), ReadsMenu.ITEM));
        assertEquals(Collections.singletonList((Object) here), sent);
    }

    @Test public void telegramsOwnChoicesPassThrough() {
        on();
        heldRead(5);
        Chat chat = new Chat(5);
        for (int id : new int[] {0, 1, 13, 0x48545408, 0x4854540C, 0x4854540D}) {
            assertFalse(ReadsMenu.headerClick(chat, id));
        }
        assertTrue(sent.isEmpty());
        assertNull(ShadowToast.getLatestToast());
    }

    @Test public void pausedOrUnreadableAddsNothing() {
        on();
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            Chat chat = new Chat(5);
            ReadsMenu.headerMenu(chat);
            assertTrue(reason.name(), chat.items.isEmpty());
            PauseForTests.resume();
        }
        SettingReadsForTests.breakReads(Settings.GHOST_READS_BUTTON);
        Chat chat = new Chat(5);
        ReadsMenu.headerMenu(chat);
        assertTrue(chat.items.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_ANALYTICS).isEmpty());
    }

    static final class Chat {
        final long dialog;
        int account;
        boolean hasHeader = true;
        boolean failId;
        final List<Item> items = new ArrayList<>();

        Chat(long dialog) { this.dialog = dialog; }
    }

    static final class Item {
        final int id;
        final String text;
        Item(int id, String text) { this.id = id; this.text = text; }
    }

    @Implements(value = ReadsMenu.class, isInAndroidSdk = false)
    public static class Host {
        @Implementation protected static boolean hasHeader(Object chat) { return ((Chat) chat).hasHeader; }
        @Implementation protected static Object chatOf(Object delegate) { return delegate; }
        @Implementation protected static Object addHeaderItem(Object chat, int id, int icon, String text) {
            Item item = new Item(id, text);
            ((Chat) chat).items.add(item);
            return item;
        }
        @Implementation protected static long dialogId(Object chat) {
            if (((Chat) chat).failId) throw new IllegalStateException("chat closed");
            return ((Chat) chat).dialog;
        }
        @Implementation protected static int account(Object chat) { return ((Chat) chat).account; }
    }
}
