/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import org.telegram.tgnet.TLRPC;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FakeTypingTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final FakeTyping.Telegram TELEGRAM = FakeTyping.telegram;
    private static final GhostMode.Requests REQUESTS = GhostMode.requests;

    private HiddenChatsForTests.Fake chats;
    private Clock telegram;
    private Sent sent;

    @Before public void setUp() {
        reset();
        chats = HiddenChatsForTests.use(new HiddenChatsForTests.Fake());
        telegram = new Clock();
        FakeTyping.telegram = telegram;
        sent = new Sent();
        GhostMode.requests = sent;
    }

    @After public void tearDown() {
        HiddenChatsForTests.restore();
        FakeTyping.telegram = TELEGRAM;
        GhostMode.requests = REQUESTS;
        reset();
    }

    private static void reset() {
        Settings.FAKE_TYPING.resetToDefault();
        Settings.GHOST_MODE.resetToDefault();
        Settings.GHOST_TYPING.resetToDefault();
        FakeTyping.forget();
        GhostMode.forgetHeld();
        HookStatus.clear();
    }

    /** Telegram's clock and main thread, moved on by hand. */
    private static final class Clock implements FakeTyping.Telegram {
        long now = 1_000;
        final List<Runnable> waiting = new ArrayList<>();
        final List<Long> delays = new ArrayList<>();

        @Override public Object request(int account, long chat) {
            TLRPC.TL_messages_setTyping request = new TLRPC.TL_messages_setTyping();
            if (chat > 0) {
                TLRPC.TL_inputPeerUser peer = new TLRPC.TL_inputPeerUser();
                peer.user_id = chat;
                request.peer = peer;
            } else {
                TLRPC.TL_inputPeerChat peer = new TLRPC.TL_inputPeerChat();
                peer.chat_id = -chat;
                request.peer = peer;
            }
            request.action = new TLRPC.TL_sendMessageTypingAction();
            return request;
        }

        @Override public long now() {
            return now;
        }

        @Override public void later(Runnable task, long delay) {
            waiting.add(task);
            delays.add(delay);
        }

        /** Moves the clock on by [ms] and runs what was waiting. */
        void pass(long ms) {
            now += ms;
            List<Runnable> due = new ArrayList<>(waiting);
            waiting.clear();
            for (Runnable task : due) task.run();
        }
    }

    /** Telegram's sending as Ghost mode sees it: each request comes back through drop() on its way out. */
    private static final class Sent implements GhostMode.Requests {
        final List<String> sends = new ArrayList<>();

        @Override public int account() {
            return 0;
        }

        @Override public List<Integer> signedIn() {
            return Collections.emptyList();
        }

        @Override public boolean send(int from, Object request, Object callback) {
            assertFalse("Ghost mode kept back a typing status that was asked for", GhostMode.drop(request, callback));
            TLRPC.InputPeer peer = ((TLRPC.TL_messages_setTyping) request).peer;
            long chat = peer instanceof TLRPC.TL_inputPeerUser ? peer.user_id : -peer.chat_id;
            assertTrue(((TLRPC.TL_messages_setTyping) request).action instanceof TLRPC.TL_sendMessageTypingAction);
            sends.add(from + ":" + chat);
            return true;
        }
    }

    private void tap(int account, Long... picked) {
        chats.selected = account;
        chats.picked.clear();
        chats.picked.addAll(Arrays.asList(picked));
        assertEquals(HiddenChats.CLOSE_SELECTION, HiddenChats.menuChoice(new Object(), FakeTyping.MENU_ID));
    }

    private static String toast() {
        return String.valueOf(ShadowToast.getTextOfLatestToast());
    }

    @Test public void theLongPressItemShowsWithItsSwitch() {
        Object list = new Object();
        HiddenChats.menuItem(list, new Object());
        View item = chats.items.get(FakeTyping.MENU_ID);
        assertEquals(View.GONE, item.getVisibility());
        Settings.FAKE_TYPING.save(true);
        HiddenChats.menuShown(list);
        assertEquals(View.VISIBLE, item.getVisibility());
        Settings.FAKE_TYPING.save(false);
        HiddenChats.menuShown(list);
        assertEquals(View.GONE, item.getVisibility());
    }

    @Test public void aTapTypesInThePickedChatsUntilTheyArePickedAgain() {
        Settings.FAKE_TYPING.save(true);
        // Ghost mode keeps back Telegram's own typing, not what you asked for.
        Settings.GHOST_MODE.save(true);
        Settings.GHOST_TYPING.save(true);
        tap(1, 7L, -9L, 0x4000000000000003L);
        assertEquals("Typing in these chats for 10 minutes.", toast());
        assertEquals(Arrays.asList("1:7", "1:-9"), sent.sends);
        assertEquals(Collections.singletonList(FakeTyping.EVERY_MS), telegram.delays);

        // Another account picks a chat of its own, and the first account's chats keep going.
        tap(0, 7L);
        assertEquals(Arrays.asList("1:7", "1:-9", "0:7"), sent.sends);
        assertEquals("one round waits at a time", 1, telegram.waiting.size());
        telegram.pass(FakeTyping.EVERY_MS);
        assertEquals(Arrays.asList("1:7", "1:-9", "0:7", "0:7", "1:7", "1:-9"), sent.sends);
        assertEquals(1, telegram.waiting.size());

        tap(1, 7L, -9L);
        assertEquals("Stopped typing in these chats.", toast());
        sent.sends.clear();
        telegram.pass(FakeTyping.EVERY_MS);
        assertEquals(Collections.singletonList("0:7"), sent.sends);
        tap(0, 7L);
        telegram.pass(FakeTyping.EVERY_MS);
        assertEquals(Collections.singletonList("0:7"), sent.sends);
        assertTrue("nothing left to send, so nothing waits", telegram.waiting.isEmpty());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("fake typing statuses sent 7"));
        assertFalse(report, report.contains("typing statuses kept back"));
    }

    @Test public void typingStopsByItselfAfterTenMinutes() {
        Settings.FAKE_TYPING.save(true);
        tap(0, 7L);
        telegram.pass(FakeTyping.FOR_MS - FakeTyping.EVERY_MS);
        assertTrue(FakeTyping.typing(0, 7L));
        assertEquals(2, sent.sends.size());
        telegram.pass(FakeTyping.EVERY_MS);
        assertFalse(FakeTyping.typing(0, 7L));
        assertEquals(2, sent.sends.size());
        assertTrue(telegram.waiting.isEmpty());
        // Picked again after that, it starts over.
        tap(0, 7L);
        assertEquals("Typing in these chats for 10 minutes.", toast());
        assertEquals(3, sent.sends.size());
    }

    @Test public void secretChatsAndFoldersCantType() {
        Settings.FAKE_TYPING.save(true);
        tap(0, 0x4000000000000003L, 0x2000000000000001L);
        assertEquals("Secret chats can't show typing.", toast());
        assertTrue(sent.sends.isEmpty());
        assertTrue(telegram.waiting.isEmpty());
        assertTrue(FakeTyping.typable(7));
        assertTrue(FakeTyping.typable(-1001234567890L));
        assertFalse(FakeTyping.typable(0));
    }
}
