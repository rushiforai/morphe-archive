package app.hushmessenger.extension;

import android.content.Context;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class MarkReadButtonTest {
    private final Object session = new Object();
    private final ThreadKey thread = new ThreadKey("chat");

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        Settings.lastReply = null;
        synchronized (MarkReadButton.held) { MarkReadButton.held.clear(); }
        SeenHandler.sent.clear();
    }

    private void on(boolean hide, boolean button) {
        Settings.preferences.edit().putBoolean("hide_read_receipts", hide).putBoolean(MarkReadButton.KEY, button).commit();
    }

    private static String lastToast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    @Test public void aTapSendsTheHeldSeenOnceThroughMessengersOwnHandler() {
        on(true, true);
        SeenHandler handler = new SeenHandler(thread);
        SeenHandler.open(session, handler, "message-1");
        SeenHandler.open(session, handler, "message-2");
        assertTrue("opening the chat sends nothing", SeenHandler.sent.isEmpty());

        // A reopened chat has a new key object that compares equal, as Messenger's ThreadKey does.
        Object tag = MarkReadButton.tag(session, new ThreadKey("chat"));
        assertTrue(MarkReadButton.clicked(tag, null));
        assertEquals(Arrays.asList("message-2"), SeenHandler.sent);
        assertEquals("Marked as read", lastToast());

        assertTrue(MarkReadButton.clicked(tag, null));
        assertEquals("a second tap has nothing left to send", Arrays.asList("message-2"), SeenHandler.sent);
        assertEquals("Nothing new to mark as read", lastToast());

        // The replay ends with the tap, so the next Seen is held back again.
        SeenHandler.open(session, handler, "message-3");
        assertEquals(Arrays.asList("message-2"), SeenHandler.sent);
    }

    @Test public void nothingIsHeldWhileTheButtonIsOffOrHideReadReceiptsIsPaused() {
        on(true, false);
        SeenHandler handler = new SeenHandler(thread);
        SeenHandler.open(session, handler, "message-1");
        assertTrue(SeenHandler.sent.isEmpty());
        assertTrue(MarkReadButton.held.isEmpty());
        assertFalse(MarkReadButton.shown());

        on(true, true);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        SeenHandler.open(session, handler, "message-2");
        assertEquals("paused, Messenger sends Seen itself", Arrays.asList("message-2"), SeenHandler.sent);
        assertTrue(MarkReadButton.held.isEmpty());
        assertFalse(MarkReadButton.shown());
    }

    @Test public void anotherAccountsTagOrAnotherChatSendsNothing() {
        on(true, true);
        SeenHandler.open(session, new SeenHandler(thread), "message-1");
        assertTrue(MarkReadButton.clicked(MarkReadButton.tag(new Object(), thread), null));
        assertTrue(MarkReadButton.clicked(MarkReadButton.tag(session, new ThreadKey("another-chat")), null));
        assertTrue(SeenHandler.sent.isEmpty());
        assertEquals("Nothing new to mark as read", lastToast());
    }

    @Test public void messengersOwnButtonsGoOnAsBefore() {
        assertFalse(MarkReadButton.clicked(null, null));
        assertFalse(MarkReadButton.clicked(new Object(), null));
        assertFalse(MarkReadButton.clicked("thread_view_title_bar_qr_scanner_button", null));
        assertNull(MarkReadButton.tag(null, thread));
        assertNull(MarkReadButton.tag(session, null));
    }

    @Test public void theButtonTakesTheDetailsButtonsPlaceInAFullBar() throws Exception {
        Object voice = new Button("audio_call_button"), video = new Button("video_call_button");
        Object details = new DetailsButton();
        Object ours = new Object();
        List<Object> full = new ArrayList<>(Arrays.asList(voice, video, details, null));
        assertTrue(MarkReadButton.place(full, ours));
        assertEquals(Arrays.asList(voice, video, ours, null), full);

        // The newer bar's list has no padding.
        List<Object> unpadded = new ArrayList<>(Arrays.asList(voice, video, details));
        assertTrue(MarkReadButton.place(unpadded, ours));
        assertEquals(Arrays.asList(voice, video, ours), unpadded);

        List<Object> roomy = new ArrayList<>(Arrays.asList(voice, details, null));
        assertTrue(MarkReadButton.place(roomy, ours));
        assertEquals("with room, it goes in ahead of details", Arrays.asList(voice, ours, details, null), roomy);
    }

    @Test public void onlyTheSettingsTagMarksTheDetailsButton() throws Exception {
        assertTrue(MarkReadButton.isDetails(new DetailsButton()));
        assertFalse(MarkReadButton.isDetails(new Button("circles_settings_button")));
        assertFalse(MarkReadButton.isDetails(new Button(null)));
        assertFalse(MarkReadButton.isDetails(new Object()));
    }

    /** #122: the chats with no button. Their bars were full with no details button, or had details past the three it shows. */
    @Test public void aFullBarWithoutADetailsButtonGivesUpItsLastButtonThatIsntForCalls() throws Exception {
        Object voice = new Button("audio_call_button"), video = new Button("video_call_button");
        Object friend = new Button("friendship_status_button"), details = new DetailsButton();
        Object ours = new Button("hush_mark_read_button");

        List<Object> noDetails = new ArrayList<>(Arrays.asList(friend, voice, video, null));
        assertTrue(MarkReadButton.place(noDetails, ours));
        assertEquals(Arrays.asList(ours, voice, video, null), noDetails);

        List<Object> detailsCutOff = new ArrayList<>(Arrays.asList(friend, voice, video, details));
        assertTrue(MarkReadButton.place(detailsCutOff, ours));
        assertEquals("it shows, among the first three", Arrays.asList(ours, voice, video, details), detailsCutOff);

        Object share = new Button("broadcast_channel_share_button"), bell = new Button("notification_button");
        Object invite = new Button("thread_view_title_bar_channel_invite_button");
        List<Object> channel = new ArrayList<>(Arrays.asList(share, invite, bell));
        assertTrue(MarkReadButton.place(channel, ours));
        assertEquals(Arrays.asList(share, invite, ours), channel);
    }

    @Test public void noCallButtonIsEverGivenUp() throws Exception {
        Object ours = new Button("hush_mark_read_button");
        for (String tag : MarkReadButton.CALL_TAGS) assertTrue(tag, MarkReadButton.isCall(new Button(tag)));
        assertFalse(MarkReadButton.isCall(new Button("friendship_status_button")));
        assertFalse(MarkReadButton.isCall(new Object()));

        Object voice = new Button("audio_call_button"), dot = new Button("audio_call_button_green_dot"), video = new Button("video_call_button");
        List<Object> calls = new ArrayList<>(Arrays.asList(voice, dot, video, new Button("friendship_status_button")));
        List<Object> same = new ArrayList<>(calls);
        assertFalse(MarkReadButton.place(calls, ours));
        assertEquals(same, calls);

        // Messenger's join a call button is another class with no tag to read.
        Object join = new Object(), friend = new Button("friendship_status_button");
        List<Object> joining = new ArrayList<>(Arrays.asList(friend, voice, join));
        assertTrue(MarkReadButton.place(joining, ours));
        assertEquals(Arrays.asList(ours, voice, join), joining);
    }

    @Test public void withRoomItsAddedAndNothingIsGivenUp() throws Exception {
        Object a = new Button("a");
        Object ours = new Button("hush_mark_read_button");
        List<Object> roomy = new ArrayList<>(Arrays.asList(a, null, null));
        assertTrue(MarkReadButton.place(roomy, ours));
        assertEquals(Arrays.asList(a, null, null, ours), roomy);

        List<Object> untouched = new ArrayList<>(Arrays.asList(a, null));
        assertFalse(MarkReadButton.place(untouched, null));
        assertEquals(Arrays.asList(a, null), untouched);
    }

    @Test public void theBarIsLeftAloneWhenTheButtonIsOff() {
        on(true, false);
        List<Object> buttons = new ArrayList<>(Arrays.asList(new DetailsButton()));
        MarkReadButton.add(buttons, new Object());
        assertEquals(1, buttons.size());
        MarkReadButton.add(null, new Object());
    }

    @Test public void theNewerBarGetsItsOwnListBackWhenNothingIsAdded() {
        List<Object> buttons = Collections.unmodifiableList(Arrays.asList(new Button("audio_call_button"), new DetailsButton()));
        on(true, false);
        assertSame(buttons, MarkReadButton.addTo(buttons, session, thread, new Object()));
        // Unpatched, the extension has no button to build, so the list stays Messenger's own.
        on(true, true);
        assertSame(buttons, MarkReadButton.addTo(buttons, session, thread, new Object()));
        assertNull(MarkReadButton.addTo(null, session, thread, new Object()));
    }

    /** Messenger's read handler as the patch leaves it: Hide read receipts asks first, then the stock job runs. */
    static final class SeenHandler {
        static final List<String> sent = new ArrayList<>();
        final Object thread;

        SeenHandler(Object thread) { this.thread = thread; }

        static void open(Object session, SeenHandler handler, String messageId) {
            if (Settings.hideChatSeen(session, handler.thread, handler, messageId)) return;
            sent.add(messageId);
        }
    }

    /** A top bar button shaped like Messenger's: a listener and the test tag, kept in more than one String field. */
    static class Button {
        final Object listener = new Object();
        final String label = "Thread details";
        final String tag;

        Button(String tag) { this.tag = tag; }
    }

    /** The details button, whose tag sits in its superclass's field. */
    static final class DetailsButton extends Button {
        DetailsButton() { super("settings_button"); }
    }

    private static final class ThreadKey {
        private final String id;

        ThreadKey(String id) { this.id = id; }

        @Override public boolean equals(Object other) {
            return other instanceof ThreadKey && id.equals(((ThreadKey) other).id);
        }

        @Override public int hashCode() { return id.hashCode(); }
    }
}
