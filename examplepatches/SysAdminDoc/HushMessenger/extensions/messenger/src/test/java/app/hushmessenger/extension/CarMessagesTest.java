package app.hushmessenger.extension;

import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class CarMessagesTest {
    private PendingIntent read;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        Intent intent = new Intent("read_thread").setClassName("com.facebook.orca", "com.facebook.messengercar.CarNotificationService");
        read = PendingIntent.getService(RuntimeEnvironment.getApplication(), 7, intent, PendingIntent.FLAG_IMMUTABLE);
    }

    /** The car bundle the way AndroidX's CarExtender stores it for a Messenger notification. */
    private Bundle car() {
        Bundle conversation = new Bundle();
        conversation.putStringArray("participants", new String[] {"Matt"});
        conversation.putParcelable("on_read", read);
        Bundle car = new Bundle();
        car.putBundle("car_conversation", conversation);
        return car;
    }

    private void on() {
        Settings.preferences.edit().putBoolean("car_messages", true).commit();
    }

    @Test public void theCarBundleGetsOneInvisibleMarkAsReadActionWithMessengersReadIntent() {
        on();
        Bundle car = car();
        CarMessages.markRead(car);
        Bundle actions = car.getBundle("invisible_actions");
        assertNotNull(actions);
        assertEquals(1, actions.size());
        Bundle action = actions.getBundle("0");
        assertEquals(2, action.getInt("semanticAction"));
        assertFalse(action.getBoolean("showsUserInterface", true));
        assertSame(read, action.getParcelable("actionIntent"));
        assertEquals("Mark as read", action.getCharSequence("title").toString());
        assertEquals(0, action.getInt("icon", -1));
        assertFalse(action.getBundle("extras").getBoolean("android.support.allowGeneratedReplies", true));
        assertNull("No typed reply on mark as read", action.get("remoteInputs"));
        assertTrue(Settings.lastActive("car_messages") > 0);
    }

    @Test public void aSecondPassOrAnActionAlreadyThereAddsNothingMore() {
        on();
        Bundle car = car();
        CarMessages.markRead(car);
        CarMessages.markRead(car);
        assertEquals(1, car.getBundle("invisible_actions").size());

        Bundle other = new Bundle();
        other.putInt("semanticAction", 0);
        Bundle actions = new Bundle();
        actions.putBundle("0", other);
        Bundle withOther = car();
        withOther.putBundle("invisible_actions", actions);
        CarMessages.markRead(withOther);
        Bundle after = withOther.getBundle("invisible_actions");
        assertEquals(2, after.size());
        assertSame(other, after.getBundle("0"));
        assertEquals(2, after.getBundle("1").getInt("semanticAction"));
    }

    @Test public void withoutAReadIntentTheBundleStaysAsItWas() {
        on();
        Bundle empty = new Bundle();
        CarMessages.markRead(empty);
        assertTrue(empty.isEmpty());
        Bundle noRead = car();
        noRead.getBundle("car_conversation").remove("on_read");
        CarMessages.markRead(noRead);
        assertNull(noRead.getBundle("invisible_actions"));
        CarMessages.markRead(null);
    }

    @Test public void offPauseSafeModeAndAMissingControlLeaveTheBundleAlone() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("car_messages", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Bundle car = car();
            CarMessages.markRead(car);
            assertNull(state, car.getBundle("invisible_actions"));
        }
    }

    @Test public void theSwitchSitsUnderConversationsAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("car_messages")) spec = control;
        assertNotNull(spec);
        assertEquals("conversations", spec[3]);
        assertTrue(Settings.installed.contains("car_messages"));
        assertFalse(Settings.preferences.getBoolean("car_messages", false));
    }
}
