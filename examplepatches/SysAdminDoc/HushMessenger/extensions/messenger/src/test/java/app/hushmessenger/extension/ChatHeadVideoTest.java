package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.app.Service;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.view.ContextThemeWrapper;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ChatHeadVideoTest {
    /** Messenger's chat heads draw from a service, so the player's context never leads to an activity. */
    public static class ChatHeadService extends Service {
        @Override public IBinder onBind(Intent intent) {
            return null;
        }
    }

    /** A chat Android opened in a bubble. */
    public static class BubbleActivity extends Activity {
        @Override public boolean isLaunchedFromBubble() {
            return true;
        }
    }

    private Application app;
    private Activity activity;

    @Before public void setUp() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        HostScreens.started = true;
        HostScreens.failed = false;
        Settings.hookErrors.clear();
        activity = Robolectric.buildActivity(Activity.class).setup().get();
    }

    @After public void tearDown() {
        Settings.hookErrors.clear();
        Settings.hookErrorLogged.clear();
    }

    @Test public void videosInTheAppKeepMessengersChoice() {
        assertFalse(ChatHeadVideo.textureView(activity, false));
        assertFalse("A themed view context over the chat screen", ChatHeadVideo.textureView(new ContextThemeWrapper(activity, 0), false));
        assertFalse(ChatHeadVideo.textureView(new ContextWrapper(new ContextThemeWrapper(activity, 0)), false));
        assertTrue("Messenger's own TextureView stays", ChatHeadVideo.textureView(activity, true));
    }

    @Test public void videosInAChatHeadDrawIntoATextureView() {
        Context service = Robolectric.buildService(ChatHeadService.class).create().get();
        assertTrue(ChatHeadVideo.textureView(service, false));
        assertTrue(ChatHeadVideo.textureView(new ContextThemeWrapper(service, 0), false));
        assertTrue(ChatHeadVideo.textureView(app, false));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aChatOpenedInABubbleDrawsIntoATextureViewOnAndroid12AndNewer() {
        Activity bubble = Robolectric.buildActivity(BubbleActivity.class).setup().get();
        boolean bubbles = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
        assertEquals(bubbles, ChatHeadVideo.textureView(bubble, false));
        assertEquals(bubbles, ChatHeadVideo.textureView(new ContextThemeWrapper(bubble, 0), false));
    }

    @Test public void pauseSafeModeAndNoContextLeaveMessengersChoice() {
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(app);
            Settings.preferences.edit().clear().putBoolean("paused", state.equals("paused"))
                .putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(app);
            assertFalse(state, ChatHeadVideo.textureView(app, false));
            assertTrue(state, ChatHeadVideo.textureView(app, true));
        }
        assertFalse(ChatHeadVideo.textureView(null, false));
        assertTrue(ChatHeadVideo.textureView(null, true));
    }

    @Test public void aFailureIsLoggedAndTheVideoStillPlaysMessengersWay() {
        Context broken = new ContextWrapper(app) {
            @Override public Context getBaseContext() {
                throw new IllegalStateException("no base context");
            }
        };
        assertFalse(ChatHeadVideo.textureView(broken, false));
        assertTrue(Settings.hookErrors.containsKey(ChatHeadVideo.KEY));
        assertTrue(ChatHeadVideo.textureView(broken, true));
    }
}
