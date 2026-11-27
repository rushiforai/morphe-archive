package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.app.Service;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
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
import org.robolectric.shadows.ShadowBuild;
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
        HostScreens.screensShown = 0;
        Settings.hookErrors.clear();
        activity = Robolectric.buildActivity(Activity.class).setup().get();
    }

    @After public void tearDown() {
        HostScreens.screensShown = 0;
        Settings.hookErrors.clear();
        Settings.hookErrorLogged.clear();
    }

    /**
     * #249: chat heads hide while any of Messenger's screens is up, so a player built on the app's context then is in
     * the app or a bubble Messenger opened by itself, whatever is picked under Allow chat bubbles, and keeps
     * Messenger's choice. Once every screen has stopped, the app's context can be a chat head's again.
     */
    @Test @Config(sdk = 36) public void withAMessengerScreenUpTheAppContextKeepsMessengersChoice() {
        assertFalse(Settings.enableBubbles());
        app.registerActivityLifecycleCallbacks(new HostScreens.LeavingMessenger());
        org.robolectric.android.controller.ActivityController<BubbleActivity> bubble =
            Robolectric.buildActivity(BubbleActivity.class).setup();
        assertTrue(HostScreens.messengerShowing());
        assertFalse(ChatHeadVideo.textureView(app, false));
        assertFalse(ChatHeadVideo.textureView(new ContextThemeWrapper(app, 0), false));
        assertTrue("Messenger's own TextureView stays", ChatHeadVideo.textureView(app, true));
        Context service = Robolectric.buildService(ChatHeadService.class).create().get();
        assertTrue("The chat head service still gets its TextureView", ChatHeadVideo.textureView(service, false));

        bubble.pause().stop();
        assertFalse(HostScreens.messengerShowing());
        assertTrue(ChatHeadVideo.textureView(app, false));
        assertTrue(Settings.hookErrors.isEmpty());
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

    /**
     * #221: a chat Android opened as a bubble is a real activity, and its video layer draws fine there. Forcing a
     * TextureView in one put a black box over a link's preview and blanked the bubble when the gallery opened.
     */
    @Test public void aChatOpenedInABubbleKeepsMessengersChoice() {
        Activity bubble = Robolectric.buildActivity(BubbleActivity.class).setup().get();
        assertFalse(ChatHeadVideo.textureView(bubble, false));
        assertFalse(ChatHeadVideo.textureView(new ContextThemeWrapper(bubble, 0), false));
        assertTrue("Messenger's own TextureView stays", ChatHeadVideo.textureView(bubble, true));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /**
     * #249: with Android bubbles picked there are no chat heads, so a player built on the app's own context is in a
     * bubble or the app, and keeps Messenger's choice. The chat head service still gets its TextureView.
     */
    @Test @Config(sdk = 36) public void withAndroidBubblesPickedTheAppContextKeepsMessengersChoice() {
        Settings.preferences.edit().putBoolean("bubbles", true).commit();
        assertTrue(Settings.enableBubbles());
        assertFalse(ChatHeadVideo.textureView(app, false));
        assertFalse(ChatHeadVideo.textureView(new ContextThemeWrapper(app, 0), false));
        assertTrue("Messenger's own TextureView stays", ChatHeadVideo.textureView(app, true));
        Context service = Robolectric.buildService(ChatHeadService.class).create().get();
        assertTrue(ChatHeadVideo.textureView(service, false));
        assertTrue(ChatHeadVideo.textureView(new ContextThemeWrapper(service, 0), false));

        Settings.preferences.edit().putBoolean(Settings.BUBBLE_CHAT_HEADS, true).commit();
        assertTrue(Settings.forceChatHeads());
        assertTrue("Chat heads picked, so the app's context may be one", ChatHeadVideo.textureView(app, false));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** #104: on a Huawei the box stayed behind in the chat itself too, not only in a chat head. */
    @Test public void everyVideoOnAPhoneThatLeavesABoxBehindDrawsIntoATextureView() {
        for (String maker : new String[] {"HUAWEI", "Huawei", " honor "}) {
            ShadowBuild.setManufacturer(maker);
            assertTrue(maker, ChatHeadVideo.layerLeavesABox());
            assertTrue(maker, ChatHeadVideo.textureView(activity, false));
            assertTrue(maker, ChatHeadVideo.textureView(new ContextThemeWrapper(activity, 0), false));
        }
        for (String maker : new String[] {"samsung", "Google", "Xiaomi", ""}) {
            ShadowBuild.setManufacturer(maker);
            assertFalse(maker, ChatHeadVideo.layerLeavesABox());
            assertFalse(maker, ChatHeadVideo.textureView(activity, false));
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** #104: a video sent in a chat plays through the newer player, which swaps on exactly the same phones. */
    @Test public void aSentVideoDrawsIntoATextureViewOnlyOnAPhoneThatLeavesABoxBehind() {
        for (String maker : new String[] {"HUAWEI", "Huawei", " honor "}) {
            ShadowBuild.setManufacturer(maker);
            assertTrue(maker, ChatHeadVideo.grootTextureView());
        }
        for (String maker : new String[] {"samsung", "Google", "Xiaomi", ""}) {
            ShadowBuild.setManufacturer(maker);
            assertFalse(maker, ChatHeadVideo.grootTextureView());
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Paused or in safe mode, a sent video stays on Messenger's own SurfaceView even on those phones. */
    @Test public void aPausedHushLeavesSentVideosOnMessengersSurface() {
        ShadowBuild.setManufacturer("Huawei");
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(app);
            Settings.preferences.edit().clear().putBoolean("paused", state.equals("paused"))
                .putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(app);
            assertFalse(state, ChatHeadVideo.grootTextureView());
        }
    }

    /** A phone that leaves a box behind still leaves Messenger's videos alone while Hush is paused. */
    @Test public void aPausedHushLeavesEveryVideoAsMessengerDrewIt() {
        ShadowBuild.setManufacturer("Huawei");
        Settings.initialize(app);
        Settings.preferences.edit().clear().putBoolean("paused", true).commit();
        CrashGuard.resetForTests();
        assertFalse(ChatHeadVideo.textureView(activity, false));
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
