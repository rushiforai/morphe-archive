package app.hushmessenger.extension;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import java.util.Collections;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #187: an open chat holds its window secure, so Android refuses a screenshot or a recording of it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class SecureChatTest {
    private static final int SECURE = WindowManager.LayoutParams.FLAG_SECURE;
    private static final int KEEP = WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean(SecureChat.KEY, true).commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
    }

    private static int secure(Window window) {
        return window.getAttributes().flags & SECURE;
    }

    @Test public void aChatOnScreenHoldsItsWindowSecureAndGivesItBackWhenItGoes() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            Window window = activity.getWindow();
            window.addFlags(KEEP);
            View chat = new View(activity);
            activity.setContentView(chat);
            assertEquals("nothing until the chat says it's open", 0, secure(window));

            SecureChat.chatShown(new Object(), chat);
            assertEquals(SECURE, secure(window));
            assertTrue("the control is in use now", Settings.activeAt.containsKey(SecureChat.KEY));

            ((ViewGroup) chat.getParent()).removeView(chat);
            assertEquals(0, secure(window));
            assertEquals("the window's other flags are left alone", KEEP, window.getAttributes().flags & KEEP);
            assertTrue(Settings.hookErrors.isEmpty());
        }
    }

    @Test public void aChatThatReachesTheScreenAfterwardsIsSecuredOnItsWayIn() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View chat = new View(activity);
            SecureChat.chatShown(new Object(), chat);
            assertEquals("not on screen yet", 0, secure(activity.getWindow()));
            activity.setContentView(chat);
            assertEquals(SECURE, secure(activity.getWindow()));
        }
    }

    @Test public void theLastChatOutOfAWindowIsTheOneThatGivesItBack() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            Window window = activity.getWindow();
            ViewGroup room = new android.widget.FrameLayout(activity);
            activity.setContentView(room);
            View first = new View(activity);
            View second = new View(activity);
            room.addView(first);
            room.addView(second);
            SecureChat.chatShown(new Object(), first);
            SecureChat.chatShown(new Object(), second);
            assertEquals(SECURE, secure(window));
            room.removeView(first);
            assertEquals("the other chat is still open", SECURE, secure(window));
            room.removeView(second);
            assertEquals(0, secure(window));
        }
    }

    @Test public void aWindowMessengerSecuredItselfStaysSecureAfterTheChatGoes() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            Window window = activity.getWindow();
            window.addFlags(SECURE);
            View chat = new View(activity);
            activity.setContentView(chat);
            SecureChat.chatShown(new Object(), chat);
            assertEquals(SECURE, secure(window));
            ((ViewGroup) chat.getParent()).removeView(chat);
            assertEquals("Messenger's own, so it's left as it was", SECURE, secure(window));
        }
    }

    @Test public void offPausedInSafeModeOrWithoutTheCapabilityTheWindowIsMessengersOwn() {
        Set<String> installed = Settings.installed;
        try {
            for (String state : new String[] {"off", "paused", "safe", "missing"}) {
                Settings.initialize(RuntimeEnvironment.getApplication());
                Settings.preferences.edit().clear().putBoolean(SecureChat.KEY, !state.equals("off"))
                    .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
                CrashGuard.resetForTests();
                CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
                if (state.equals("missing")) Settings.installed = Collections.emptySet();
                try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
                    Activity activity = screen.get();
                    View chat = new View(activity);
                    activity.setContentView(chat);
                    SecureChat.chatShown(new Object(), chat);
                    assertEquals(state, 0, secure(activity.getWindow()));
                    ((ViewGroup) chat.getParent()).removeView(chat);
                    assertEquals(state, 0, secure(activity.getWindow()));
                }
                Settings.installed = installed;
            }
        } finally {
            Settings.installed = installed;
            Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", false).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        }
    }

    @Test public void aChatWithNoScreenBehindItIsNoFailure() {
        SecureChat.chatShown(new Object(), null);
        View loose = new View(RuntimeEnvironment.getApplication());
        SecureChat.chatShown(new Object(), loose);
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
