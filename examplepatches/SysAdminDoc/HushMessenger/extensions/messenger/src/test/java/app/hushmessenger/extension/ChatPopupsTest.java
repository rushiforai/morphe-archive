package app.hushmessenger.extension;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import java.lang.reflect.Method;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class ChatPopupsTest {
    private static final int USER_LOCKED_IMPORTANCE = 4;

    @Before public void setUp() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        HostScreens.started = true;
        HostScreens.failed = false;
    }

    private static NotificationChannel channel(String id, int importance) {
        return new NotificationChannel(id, "Chats", importance);
    }

    private static NotificationChannel chats(int importance) {
        return channel("messenger_orca_050_messaging@982cc48a", importance);
    }

    private static NotificationChannel loweredByTheUser() throws Exception {
        NotificationChannel channel = chats(NotificationManager.IMPORTANCE_DEFAULT);
        Method lock = NotificationChannel.class.getDeclaredMethod("lockFields", int.class);
        lock.setAccessible(true);
        lock.invoke(channel, USER_LOCKED_IMPORTANCE);
        assertTrue(channel.hasUserSetImportance());
        return channel;
    }

    private static void pickChatHeads() {
        Settings.preferences.edit().putBoolean("bubbles", true).putBoolean(Settings.BUBBLE_CHAT_HEADS, true).commit();
        assertTrue(Settings.forceChatHeads());
    }

    @Test public void messengerCantLowerTheChatsChannel() {
        assertTrue(ChatPopups.keepChannel(chats(NotificationManager.IMPORTANCE_HIGH), NotificationManager.IMPORTANCE_DEFAULT));
    }

    @Test public void messengersOtherChangesGoThrough() {
        // Its own raise, a change that isn't one, and every other channel.
        assertFalse(ChatPopups.keepChannel(chats(NotificationManager.IMPORTANCE_DEFAULT), NotificationManager.IMPORTANCE_HIGH));
        assertFalse(ChatPopups.keepChannel(chats(NotificationManager.IMPORTANCE_HIGH), NotificationManager.IMPORTANCE_HIGH));
        assertFalse(ChatPopups.keepChannel(channel("messenger_orca_250_calls@1", NotificationManager.IMPORTANCE_HIGH), NotificationManager.IMPORTANCE_DEFAULT));
        assertFalse(ChatPopups.keepChannel(null, NotificationManager.IMPORTANCE_DEFAULT));
    }

    @Test public void aChannelMessengerLoweredComesBack() {
        assertTrue(ChatPopups.raiseChannel(chats(NotificationManager.IMPORTANCE_DEFAULT)));
    }

    @Test public void aChannelTheUserLoweredStaysDown() throws Exception {
        assertFalse(ChatPopups.raiseChannel(loweredByTheUser()));
    }

    @Test public void onlyTheChatsChannelComesBack() {
        assertFalse(ChatPopups.raiseChannel(channel("messenger_orca_700_other@1", NotificationManager.IMPORTANCE_DEFAULT)));
        assertFalse(ChatPopups.raiseChannel(null));
    }

    @Test public void pickingChatHeadsKeepsMessengersBehavior() {
        pickChatHeads();
        assertFalse(ChatPopups.keepChannel(chats(NotificationManager.IMPORTANCE_HIGH), NotificationManager.IMPORTANCE_DEFAULT));
        assertFalse(ChatPopups.raiseChannel(chats(NotificationManager.IMPORTANCE_DEFAULT)));
    }

    @Test public void pauseGivesMessengerItsBehaviorBack() {
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(ChatPopups.keepChannel(chats(NotificationManager.IMPORTANCE_HIGH), NotificationManager.IMPORTANCE_DEFAULT));
        assertFalse(ChatPopups.raiseChannel(chats(NotificationManager.IMPORTANCE_DEFAULT)));
    }

    @Test public void safeModeGivesMessengerItsBehaviorBack() throws Exception {
        java.lang.reflect.Field active = CrashGuard.class.getDeclaredField("safeModeActive");
        active.setAccessible(true);
        active.setBoolean(null, true);
        assertFalse(ChatPopups.keepChannel(chats(NotificationManager.IMPORTANCE_HIGH), NotificationManager.IMPORTANCE_DEFAULT));
        assertFalse(ChatPopups.raiseChannel(chats(NotificationManager.IMPORTANCE_DEFAULT)));
    }

    @Config(sdk = 28)
    @Test public void android9CantTellWhoLoweredItSoItStaysDown() {
        assertFalse(ChatPopups.raiseChannel(chats(NotificationManager.IMPORTANCE_DEFAULT)));
        assertTrue(ChatPopups.keepChannel(chats(NotificationManager.IMPORTANCE_HIGH), NotificationManager.IMPORTANCE_DEFAULT));
    }
}
