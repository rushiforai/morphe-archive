package app.hushmessenger.extension;

import android.os.Looper;

import com.facebook.messaging.model.messages.Message;
import com.facebook.messaging.model.messages.MessagesCollection;
import com.facebook.messaging.model.messages.ParticipantInfo;
import com.facebook.messaging.model.threadkey.ThreadKey;
import com.facebook.messaging.model.threads.ThreadSummary;
import com.facebook.user.model.User;
import com.facebook.user.model.UserKey;

import java.time.Duration;
import java.util.Collections;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class StrangerSendTest {
    /** Messenger's friendship values, in its order, under an enum that says nothing by its own name. */
    enum Bond { UNKNOWN, CANNOT_REQUEST, ARE_FRIENDS, INCOMING_REQUEST, OUTGOING_REQUEST, CAN_REQUEST }

    /** Messenger's kinds of user. */
    enum Kind { FACEBOOK, INSTAGRAM, PAGE, EVENT, GROUP, PARENT_APPROVED_USER, UNSET }

    /** Some of the thread key's types. */
    enum Chat { ONE_TO_ONE, GROUP, OCCAMADILLO_ONE_TO_ONE, INTEROP_ONE_TO_ONE, PENDING_THREAD, OPTIMISTIC_GROUP_THREAD }

    /** The compose fragment's chat view parameters: the loaded messages, the key, the summary and the other person. */
    static final class Params {
        final MessagesCollection A00;
        final ThreadKey A01;
        final ThreadSummary A02;
        final User A03;

        Params(ThreadKey key, User person, Message... messages) {
            A00 = new MessagesCollection(key, messages);
            A01 = key;
            A02 = new ThreadSummary("Chat", key);
            A03 = person;
        }
    }

    private static final String THEM = "100042";
    private static final String ME = "100001";

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean(StrangerSend.KEY, true).commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        StrangerSend.resetForTests();
        ShadowToast.reset();
    }

    @After public void restore() {
        StrangerSend.resetForTests();
        Settings.hookErrors.clear();
    }

    private static User person(Bond bond, Kind kind, String typeName) {
        User user = new User("Pat", typeName, false);
        user.A0f = bond;
        user.A0Y = kind;
        user.A0p = new UserKey(THEM);
        return user;
    }

    private static Params stranger(ThreadKey key, Message... messages) {
        return new Params(key, person(Bond.CAN_REQUEST, Kind.FACEBOOK, "User"), messages);
    }

    private static boolean send(Object params) {
        boolean held = StrangerSend.holdStrangerSend(params);
        shadowOf(Looper.getMainLooper()).idle();
        return held;
    }

    private static void later(int seconds) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(seconds));
    }

    private static String held() {
        return new SettingsText(RuntimeEnvironment.getApplication()).get(StrangerSend.HELD);
    }

    @Test public void aFriendIsNeverAsked() {
        ThreadKey key = new ThreadKey(Chat.ONE_TO_ONE, 1L);
        assertFalse(send(new Params(key, person(Bond.ARE_FRIENDS, Kind.FACEBOOK, "User"))));
        assertFalse(send(new Params(key, person(Bond.ARE_FRIENDS, Kind.FACEBOOK, "User"))));
        assertNull(ShadowToast.getTextOfLatestToast());
        assertTrue("A send that went through still counts as a use", Settings.lastActive(StrangerSend.KEY) > 0);
    }

    @Test public void theFirstSendToSomeoneYouDontKnowIsHeldWithTheToast() {
        assertTrue(send(stranger(new ThreadKey(Chat.ONE_TO_ONE, 1L))));
        assertEquals("Not your friend yet. Tap Send again to send.", held());
        assertEquals(held(), ShadowToast.getTextOfLatestToast());
        assertEquals(1, ShadowToast.shownToastCount());
    }

    @Test public void everyKindOfNonFriendIsAskedInEveryKindOfOneToOneChat() {
        for (Chat chat : new Chat[] {Chat.ONE_TO_ONE, Chat.OCCAMADILLO_ONE_TO_ONE, Chat.INTEROP_ONE_TO_ONE}) {
            for (Bond bond : new Bond[] {Bond.CAN_REQUEST, Bond.CANNOT_REQUEST, Bond.INCOMING_REQUEST, Bond.OUTGOING_REQUEST}) {
                for (Kind kind : new Kind[] {Kind.FACEBOOK, Kind.INSTAGRAM}) {
                    StrangerSend.resetForTests();
                    Params params = new Params(new ThreadKey(chat, 1L), person(bond, kind, "User"));
                    assertTrue(chat + " " + bond + " " + kind, send(params));
                }
            }
        }
    }

    @Test public void aSecondSendWithinFiveSecondsGoesThroughAndTheNextOneAsksAgain() {
        ThreadKey key = new ThreadKey(Chat.ONE_TO_ONE, 1L);
        assertTrue(send(stranger(key)));
        later(4);
        assertFalse("The second tap sends", send(stranger(key)));
        assertEquals(1, ShadowToast.shownToastCount());
        assertTrue("The one after that asks again", send(stranger(key)));
        assertEquals(2, ShadowToast.shownToastCount());
    }

    @Test public void aSecondSendAfterFiveSecondsIsHeldAgain() {
        ThreadKey key = new ThreadKey(Chat.ONE_TO_ONE, 1L);
        assertTrue(send(stranger(key)));
        later(6);
        assertTrue(send(stranger(key)));
        assertEquals(2, ShadowToast.shownToastCount());
        later(1);
        assertFalse("The new hold opened a window of its own", send(stranger(key)));
    }

    @Test public void theSecondTapHasToBeInTheSameChat() {
        ThreadKey first = new ThreadKey(Chat.ONE_TO_ONE, 1L), other = new ThreadKey(Chat.ONE_TO_ONE, 2L);
        assertTrue(send(stranger(first)));
        assertTrue("Another chat asks for itself", send(stranger(other)));
        assertTrue("and the first chat's window went with it", send(stranger(first)));
        assertFalse(send(stranger(first)));
    }

    @Test public void groupsAndOtherChatsAreNeverAsked() {
        for (Chat chat : new Chat[] {Chat.GROUP, Chat.PENDING_THREAD, Chat.OPTIMISTIC_GROUP_THREAD}) {
            assertFalse(chat.name(), send(stranger(new ThreadKey(chat, 1L))));
        }
        assertFalse("No thread key yet", send(stranger(null)));
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void pagesBusinessesAndUsersMessengerHasntReadAreNeverAsked() {
        ThreadKey key = new ThreadKey(Chat.ONE_TO_ONE, 1L);
        assertFalse("A page", send(new Params(key, person(Bond.CAN_REQUEST, Kind.PAGE, "User"))));
        assertFalse("A user the server typed as a page", send(new Params(key, person(Bond.CANNOT_REQUEST, Kind.FACEBOOK, "page"))));
        assertFalse("A kind that isn't a person", send(new Params(key, person(Bond.CAN_REQUEST, Kind.UNSET, "User"))));
        assertFalse("Friendship not known yet", send(new Params(key, person(Bond.UNKNOWN, Kind.FACEBOOK, "User"))));
        assertFalse("No friendship at all", send(new Params(key, person(null, Kind.FACEBOOK, "User"))));
        assertFalse("No other person", send(new Params(key, null)));
        User nobody = person(Bond.CAN_REQUEST, Kind.FACEBOOK, "User");
        nobody.A0p = null;
        assertFalse("No user key to check their messages against", send(new Params(key, nobody)));
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aChatTheyWroteInIsNeverAsked() {
        ThreadKey key = new ThreadKey(Chat.ONE_TO_ONE, 1L);
        assertFalse(send(stranger(key, Message.from(ME), Message.from(THEM))));
        Message forThem = Message.from(ME);
        forThem.A0T = new ParticipantInfo(THEM, "Pat");
        assertFalse("Either participant on a message counts", send(stranger(key, forThem)));
        assertNull(ShadowToast.getTextOfLatestToast());
        assertTrue("Only your own messages there still asks", send(stranger(key, Message.from(ME), Message.from(ME), new Message())));
    }

    @Test public void offPauseSafeModeAndAMissingControlNeverAsk() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(StrangerSend.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            StrangerSend.resetForTests();
            assertFalse(state, send(stranger(new ThreadKey(Chat.ONE_TO_ONE, 1L))));
            assertEquals(state, 0, Settings.lastActive(StrangerSend.KEY));
        }
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void anythingItCantReadSendsAsMessengerWould() {
        assertFalse(send(null));
        assertFalse(send(new Object()));
        assertFalse(send("not a chat"));
        assertNull(Settings.hookErrors.get(StrangerSend.KEY));
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void theSwitchSitsUnderInboxBesideHidePeopleYouDontKnowAndStartsOff() {
        int at = -1, search = -1;
        for (int i = 0; i < SettingsActivity.CONTROLS.length; i++) {
            if (SettingsActivity.CONTROLS[i][0].equals(StrangerSend.KEY)) at = i;
            if (SettingsActivity.CONTROLS[i][0].equals(SearchSections.STRANGERS)) search = i;
        }
        assertEquals(search + 1, at);
        assertEquals("Ask before messaging people you don't know", SettingsActivity.CONTROLS[at][1]);
        assertEquals("inbox", SettingsActivity.CONTROLS[at][3]);
        assertTrue(Settings.installed.contains(StrangerSend.KEY));
        assertTrue("Not yet checked on a phone", SettingsActivity.EXPERIMENTAL.contains(StrangerSend.KEY));
        Settings.preferences.edit().clear().commit();
        assertFalse(Settings.preferences.getBoolean(StrangerSend.KEY, false));
    }
}
