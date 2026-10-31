/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.view.OrientationEventListener;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.concurrent.TimeUnit;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.telegram.ui.PhotoViewer;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VideoUprightTest {
    private static final int FREE = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
    private static final int PORTRAIT = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT;
    private static final int LANDSCAPE = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        VideoUpright.reset();
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.VIDEO_ONLY_FROM_BUTTON);
        Settings.VIDEO_ONLY_FROM_BUTTON.resetToDefault();
        Settings.VIDEO_EITHER_LANDSCAPE.resetToDefault();
        HookStatus.clear();
    }

    private static String report() { return String.join("\n", HookStatus.report()); }

    private static void settle() { ShadowLooper.idleMainLooper(400, TimeUnit.MILLISECONDS); }

    private interface Body { void run(Activity activity); }

    private static void withActivity(Body body) {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            body.run(controller.get());
        }
    }

    /** What Telegram's stock restore does with the orientation it saved. */
    private static void stockFullScreenFrom(Activity activity) {
        int saved = VideoUpright.requested(activity);
        VideoTurn.fullScreen(activity, LANDSCAPE);
        assertEquals(LANDSCAPE, activity.getRequestedOrientation());
        VideoUpright.restore(activity, saved);
    }

    @Test public void offByDefaultAVideoLeavesTheScreenFree() {
        withActivity(activity -> {
            VideoUpright.shown(activity);
            assertEquals(FREE, activity.getRequestedOrientation());
            assertEquals(FREE, VideoUpright.requested(activity));
            stockFullScreenFrom(activity);
            assertEquals("stock restore", FREE, activity.getRequestedOrientation());
            VideoUpright.hidden();
            settle();
            assertEquals(FREE, activity.getRequestedOrientation());
        });
    }

    @Test public void onAVideoHoldsPortraitAndTelegramNeverSeesIt() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            assertEquals(PORTRAIT, activity.getRequestedOrientation());
            assertEquals("Telegram saves the app's own", FREE, VideoUpright.requested(activity));
        });
    }

    @Test public void theButtonGoesLandscapeAndLeavingFullScreenIsUprightAgain() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            stockFullScreenFrom(activity);
            assertEquals(PORTRAIT, activity.getRequestedOrientation());
            assertTrue(report(), report().contains(VideoUpright.FROM_BUTTON + " 1"));
        });
    }

    @Test public void theButtonFollowsEitherSideWhenThatSwitchIsOnToo() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        Settings.VIDEO_EITHER_LANDSCAPE.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            VideoTurn.fullScreen(activity, LANDSCAPE);
            assertEquals(ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE, activity.getRequestedOrientation());
        });
    }

    @Test public void closingTheViewerGivesBackTheAppsOwnOrientation() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            VideoUpright.hidden();
            settle();
            assertEquals(FREE, activity.getRequestedOrientation());
            assertEquals(FREE, VideoUpright.requested(activity));
        });
    }

    @Test public void closingFromFullScreenGivesItBackWhicheverStepComesFirst() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            int saved = VideoUpright.requested(activity);
            VideoTurn.fullScreen(activity, LANDSCAPE);
            VideoUpright.hidden();
            settle();
            assertEquals("held in full screen", LANDSCAPE, activity.getRequestedOrientation());
            VideoUpright.restore(activity, saved);
            assertEquals("close, player first", FREE, activity.getRequestedOrientation());
        });
        VideoUpright.reset();
        withActivity(activity -> {
            VideoUpright.shown(activity);
            int saved = VideoUpright.requested(activity);
            VideoTurn.fullScreen(activity, LANDSCAPE);
            VideoUpright.restore(activity, saved);
            assertEquals(PORTRAIT, activity.getRequestedOrientation());
            VideoUpright.hidden();
            settle();
            assertEquals("close, restore first", FREE, activity.getRequestedOrientation());
        });
    }

    @Test public void theNextVideoKeepsThePinInsteadOfFlickering() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            VideoUpright.hidden();
            VideoUpright.shown(activity);
            settle();
            assertEquals(PORTRAIT, activity.getRequestedOrientation());
            assertEquals(FREE, VideoUpright.requested(activity));
        });
    }

    @Test @Config(qualifiers = "land") public void aVideoOpenedInLandscapeIsLeftAlone() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            assertEquals(FREE, activity.getRequestedOrientation());
        });
    }

    @Test public void pausingOrAnEarlyStartLeavesTheScreenFree() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), VideoUprightForTests.holdsPortrait());
            assertTrue(Settings.VIDEO_ONLY_FROM_BUTTON.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), VideoUprightForTests.holdsPortrait());
        }
        SettingsContextRule.withoutContext(() -> assertFalse(VideoUprightForTests.holdsPortrait()));
    }

    @Test public void anUnreadableSwitchLeavesTheScreenFreeAndReportsIt() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        SettingReadsForTests.breakReads(Settings.VIDEO_ONLY_FROM_BUTTON);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            assertEquals(FREE, activity.getRequestedOrientation());
        });
    }

    @Test public void thePhoneTurnedSidewaysIsCountedAsWhatItDid() {
        withActivity(activity -> {
            VideoUpright.shown(activity);
            VideoUpright.Watch watch = new VideoUpright.Watch(activity);
            watch.turned(0);
            watch.turned(90);
            watch.turned(90);
            assertTrue(report(), report().contains(VideoUpright.FROM_TURNING + " 1"));
            watch.turned(0);
            watch.turned(270);
            assertTrue(report(), report().contains(VideoUpright.FROM_TURNING + " 2"));
            assertFalse(report(), report().contains(VideoUpright.KEPT_UPRIGHT));
        });
    }

    @Test public void aTurnTheScreenHeldUprightIsCountedOnItsOwn() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            VideoUpright.shown(activity);
            VideoUpright.Watch watch = new VideoUpright.Watch(activity);
            watch.turned(0);
            watch.turned(270);
            assertTrue(report(), report().contains(VideoUpright.KEPT_UPRIGHT + " 1"));
            assertFalse(report(), report().contains(VideoUpright.FROM_TURNING));
        });
    }

    @Test public void aVideoAlreadySidewaysOrFullScreenOrWithAutoRotateOffCountsNothing() {
        withActivity(activity -> {
            VideoUpright.shown(activity);
            VideoUpright.Watch sideways = new VideoUpright.Watch(activity);
            sideways.turned(90);
            sideways.turned(100);
            sideways.turned(OrientationEventListener.ORIENTATION_UNKNOWN);
            VideoTurn.fullScreen(activity, LANDSCAPE);
            VideoUpright.Watch full = new VideoUpright.Watch(activity);
            full.turned(0);
            full.turned(90);
            VideoUpright.restore(activity, FREE);
            android.provider.Settings.System.putInt(activity.getContentResolver(),
                    android.provider.Settings.System.ACCELEROMETER_ROTATION, 0);
            VideoUpright.Watch locked = new VideoUpright.Watch(activity);
            locked.turned(0);
            locked.turned(90);
            assertFalse(report(), report().contains(VideoUpright.FROM_TURNING));
            assertFalse(report(), report().contains(VideoUpright.KEPT_UPRIGHT));
        });
    }

    @Test public void theViewerAndItsActivityAreFoundByTheirTypesWhateverTheyAreCalled() throws Exception {
        withActivity(activity -> {
            Context context = activity;
            OrientationEventListener listener = new OrientationEventListener(context) {
                @SuppressWarnings("unused") private final PhotoViewer outer = new PhotoViewer(activity);
                @Override public void onOrientationChanged(int degrees) {}
            };
            try {
                assertSame(activity, VideoUpright.activityOf(listener));
            } catch (IllegalAccessException failure) {
                throw new AssertionError(failure);
            }
        });
    }

    @Test public void aListenerWithoutTheViewerIsReportedAndLeavesTheScreenFree() {
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            OrientationEventListener listener = new OrientationEventListener(activity) {
                @Override public void onOrientationChanged(int degrees) {}
            };
            VideoUpright.listenerOn(listener);
            assertEquals(FREE, activity.getRequestedOrientation());
            assertFalse(HookStatus.missing(FamilyNames.KEEP_VIDEOS_MUTED).isEmpty());
        });
    }

    /** Telegram's listener as the hook meets it: it holds the viewer, and remembers being switched on. */
    private static final class ViewerListener extends OrientationEventListener {
        @SuppressWarnings("unused") private final PhotoViewer outer;
        boolean enabled;

        ViewerListener(Activity activity) {
            super(activity);
            outer = new PhotoViewer(activity);
        }

        @Override public void enable() { enabled = true; }
        @Override public void onOrientationChanged(int degrees) {}
    }

    @Test public void offTelegramsListenerStillEndsFullScreenWhenThePhoneTurnsUpright() {
        withActivity(activity -> {
            ViewerListener listener = new ViewerListener(activity);
            VideoUpright.listenerOn(listener);
            assertTrue(listener.enabled);
            assertFalse(report(), report().contains(VideoUpright.ONLY_BUTTON_ENDS));
        });
    }

    @Test public void withEitherSwitchOnTurningThePhoneUprightNoLongerEndsFullScreen() {
        // Telegram's listener is the one thing that ends a button's full screen on an upright turn (#27).
        Settings.VIDEO_EITHER_LANDSCAPE.save(true);
        withActivity(activity -> {
            ViewerListener listener = new ViewerListener(activity);
            VideoUpright.listenerOn(listener);
            assertFalse("either way", listener.enabled);
            assertEquals("the pin is the other switch's", FREE, activity.getRequestedOrientation());
            assertTrue(report(), report().contains(VideoUpright.ONLY_BUTTON_ENDS + " 1"));
        });
        VideoUpright.reset();
        Settings.VIDEO_EITHER_LANDSCAPE.resetToDefault();
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            ViewerListener listener = new ViewerListener(activity);
            VideoUpright.listenerOn(listener);
            assertFalse("only from the button", listener.enabled);
            assertEquals(PORTRAIT, activity.getRequestedOrientation());
            assertTrue(report(), report().contains(VideoUpright.ONLY_BUTTON_ENDS + " 2"));
        });
    }

    @Test public void pausedOrUnreadableTelegramsListenerRunsAsItAlwaysDid() {
        Settings.VIDEO_EITHER_LANDSCAPE.save(true);
        Settings.VIDEO_ONLY_FROM_BUTTON.save(true);
        withActivity(activity -> {
            for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
                if (reason == HushTelegramPause.Reason.NONE) continue;
                PauseForTests.pause(reason);
                ViewerListener listener = new ViewerListener(activity);
                VideoUpright.listenerOn(listener);
                assertTrue(reason.name(), listener.enabled);
                PauseForTests.resume();
                VideoUpright.reset();
            }
            Settings.VIDEO_EITHER_LANDSCAPE.resetToDefault();
            SettingReadsForTests.breakReads(Settings.VIDEO_ONLY_FROM_BUTTON);
            ViewerListener listener = new ViewerListener(activity);
            VideoUpright.listenerOn(listener);
            assertTrue("unreadable switch", listener.enabled);
            assertEquals(FREE, activity.getRequestedOrientation());
        });
    }

    @Test public void theHooksPassTelegramsOwnCallsThroughWhenNothingIsHeld() {
        withActivity(activity -> {
            activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);
            assertEquals(ActivityInfo.SCREEN_ORIENTATION_SENSOR, VideoUpright.requested(activity));
            VideoUpright.restore(activity, LANDSCAPE);
            assertEquals(LANDSCAPE, activity.getRequestedOrientation());
        });
    }
}
