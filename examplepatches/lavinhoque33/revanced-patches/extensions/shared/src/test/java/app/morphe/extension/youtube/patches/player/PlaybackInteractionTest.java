/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-20.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewConfiguration;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.swipe.SwipeControlsPatch;
import app.morphe.extension.youtube.patches.video.PlaybackSpeedPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.VideoInformation;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@LooperMode(LooperMode.Mode.PAUSED)
public class PlaybackInteractionTest {
    private final List<Float> appliedSpeeds = new ArrayList<>();
    private View timeBar;

    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.39.525";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        setField(Utils.class, "context", application);
        Settings.REMEMBER_PLAYBACK_SPEED_LAST_SELECTED.save(false);
        Settings.DISABLE_DEFAULT_PLAYBACK_SPEED_MUSIC.save(false);
        Settings.DEFAULT_PLAYBACK_SPEED.save(-1.0f);
        Settings.DEFAULT_PLAYBACK_AUDIO_PITCH.save(1.25f);
        Settings.PLAYBACK_AUDIO_TIME_STRETCHING.save(true);
        Settings.DISABLE_FULLSCREEN_ZOOM_GESTURE.save(false);
        Settings.DISABLE_CHAPTER_SKIP_DOUBLE_TAP.save(false);
        Settings.ENABLE_SEEKBAR_TAPPING.save(true);
        Settings.SPEED_OVERLAY_VALUE.save(3.0f);
        PlaybackSpeedPatch.newPlayerStarted();
        timeBar = new View(application);
    }

    @Test
    public void autoSpeedResetsAtTheNextPlayer() {
        PlaybackSpeedPatch.userSelectedPlaybackSpeed(1.75f);
        PlaybackSpeedPatch.newPlayerStarted();
        PlaybackSpeedPatch.setDefaultPlaybackSpeed(appliedSpeeds::add);

        assertEquals(List.of(1.0f), appliedSpeeds);
    }

    @Test
    public void autoSpeedResetsAtTheNextVideo() {
        PlaybackSpeedPatch.userSelectedPlaybackSpeed(1.75f);
        PlaybackSpeedPatch.newVideoStarted("", "", "nextVideo", "", 1000, false);
        PlaybackSpeedPatch.setDefaultPlaybackSpeed(appliedSpeeds::add);

        assertEquals(List.of(1.0f), appliedSpeeds);
    }

    @Test
    public void rememberedAutoSpeedSurvivesNewPlayer() {
        Settings.REMEMBER_PLAYBACK_SPEED_LAST_SELECTED.save(true);
        PlaybackSpeedPatch.userSelectedPlaybackSpeed(1.75f);
        PlaybackSpeedPatch.newPlayerStarted();
        PlaybackSpeedPatch.setDefaultPlaybackSpeed(appliedSpeeds::add);

        assertEquals(List.of(1.75f), appliedSpeeds);
    }

    @Test
    public void normalDefaultWritesThroughThePlayerSetter() {
        Settings.DEFAULT_PLAYBACK_SPEED.save(1.0f);
        VideoInformation.setPlaybackSpeed(2.0f);
        PlaybackSpeedPatch.setDefaultPlaybackSpeed(appliedSpeeds::add);

        assertEquals(List.of(1.0f), appliedSpeeds);
    }

    @Test
    public void manualSpeedWithinTheSameVideoIsNotOverridden() {
        PlaybackSpeedPatch.userSelectedPlaybackSpeed(1.75f);
        PlaybackSpeedPatch.setDefaultPlaybackSpeed(appliedSpeeds::add);

        assertTrue(appliedSpeeds.isEmpty());
    }

    @Test
    public void newPlayerStillRearmsTheIndependentPitchDefault() {
        assertEquals(1.25f, PlaybackSpeedPatch.getPlaybackAudioPitchOverride(), 0);
        assertEquals(-2.0f, PlaybackSpeedPatch.getPlaybackAudioPitchOverride(), 0);
        PlaybackSpeedPatch.newPlayerStarted();
        assertEquals(1.25f, PlaybackSpeedPatch.getPlaybackAudioPitchOverride(), 0);
    }

    @Test
    public void chapterSkipAccountFlagsFollowThePreference() {
        assertTrue(PlayerPatch.enableDoubleTapChaptersConfig(false));
        assertFalse(PlayerPatch.disableDoubleTapChaptersFeatureFlag(true));
        assertTrue(PlayerPatch.disableDoubleTapChapters(true));

        Settings.DISABLE_CHAPTER_SKIP_DOUBLE_TAP.save(true);
        assertFalse(PlayerPatch.enableDoubleTapChaptersConfig(false));
        assertTrue(PlayerPatch.disableDoubleTapChaptersFeatureFlag(false));
        assertFalse(PlayerPatch.disableDoubleTapChapters(true));
    }

    @Test
    public void directionalDoubleTapSeekKeepsNativeDefaultsAndIndependentOverrides() {
        assertEquals(0, DoubleTapSeekPatch.getOverrideSeconds(1));
        assertEquals(0, DoubleTapSeekPatch.getOverrideSeconds(2));

        Settings.DOUBLE_TAP_SEEK_FORWARD.save(30);
        assertEquals(30, DoubleTapSeekPatch.getOverrideSeconds(1));
        assertEquals(0, DoubleTapSeekPatch.getOverrideSeconds(2));

        Settings.DOUBLE_TAP_SEEK_BACKWARD.save(5);
        Settings.DISABLE_CHAPTER_SKIP_DOUBLE_TAP.save(true);
        assertEquals(30, DoubleTapSeekPatch.getOverrideSeconds(1));
        assertEquals(-5, DoubleTapSeekPatch.getOverrideSeconds(2));
        assertEquals(0, DoubleTapSeekPatch.getOverrideSeconds(0));

        Settings.DOUBLE_TAP_SEEK_FORWARD.save(0);
        assertEquals(0, DoubleTapSeekPatch.getOverrideSeconds(1));
        assertEquals(-5, DoubleTapSeekPatch.getOverrideSeconds(2));

        Settings.DOUBLE_TAP_SEEK_FORWARD.save(Integer.MAX_VALUE);
        Settings.DOUBLE_TAP_SEEK_BACKWARD.save(-5);
        assertEquals(0, DoubleTapSeekPatch.getOverrideSeconds(1));
        assertEquals(0, DoubleTapSeekPatch.getOverrideSeconds(2));
    }

    @Test
    public void heldShortShowsAndUsesTheConfiguredSpeed() {
        assertEquals(3.0f, PlayerPatch.speedOverlayValue(2.0f), 0);
        assertEquals("3x", PlayerPatch.getShortsTapAndHoldText("2x"));
    }

    @Test
    public void disabledTimebarCompletesOnlyGestureEndWithTappingEnabled() {
        timeBar.setEnabled(false);
        assertTrue(completeScrub(MotionEvent.ACTION_UP));
        assertTrue(completeScrub(MotionEvent.ACTION_CANCEL));
        assertFalse(completeScrub(MotionEvent.ACTION_DOWN));
        assertFalse(completeScrub(MotionEvent.ACTION_MOVE));

        timeBar.setEnabled(true);
        assertFalse(completeScrub(MotionEvent.ACTION_UP));
        timeBar.setEnabled(false);
        Settings.ENABLE_SEEKBAR_TAPPING.save(false);
        assertFalse(completeScrub(MotionEvent.ACTION_UP));
    }

    @Test
    public void twoFingerTapDelaysZoomUntilMovementOrTimeout() throws Exception {
        var detector = new ScaleGestureDetector(timeBar.getContext(),
                new ScaleGestureDetector.SimpleOnScaleGestureListener());
        setField(SwipeControlsPatch.class, "zoomFirstPointerMoved", false);
        long now = detector.getEventTime();
        setField(SwipeControlsPatch.class, "zoomSecondPointerDownTime", now - 1);
        assertTrue(SwipeControlsPatch.disableZoomGestureBegin(detector));

        setField(SwipeControlsPatch.class, "zoomFirstPointerMoved", true);
        assertFalse(SwipeControlsPatch.disableZoomGestureBegin(detector));

        setField(SwipeControlsPatch.class, "zoomFirstPointerMoved", false);
        setField(SwipeControlsPatch.class, "zoomSecondPointerDownTime",
                now - ViewConfiguration.getDoubleTapTimeout());
        assertFalse(SwipeControlsPatch.disableZoomGestureBegin(detector));

        Settings.DISABLE_FULLSCREEN_ZOOM_GESTURE.save(true);
        assertTrue(SwipeControlsPatch.disableZoomGestureBegin(detector));
    }

    @Test
    public void newTouchClearsPreviousZoomTapState() throws Exception {
        setField(SwipeControlsPatch.class, "zoomFirstPointerMoved", true);
        setField(SwipeControlsPatch.class, "zoomSecondPointerDownTime", 5L);
        MotionEvent down = MotionEvent.obtain(10, 10, MotionEvent.ACTION_DOWN, 20, 30, 0);
        SwipeControlsPatch.onZoomTouchEvent(timeBar, down);
        down.recycle();

        var detector = new ScaleGestureDetector(timeBar.getContext(),
                new ScaleGestureDetector.SimpleOnScaleGestureListener());
        assertFalse(SwipeControlsPatch.disableZoomGestureBegin(detector));
    }

    private boolean completeScrub(int action) {
        MotionEvent event = MotionEvent.obtain(10, 20, action, 0, 0, 0);
        boolean complete = PlayerPatch.shouldCompleteScrub(timeBar, event);
        event.recycle();
        return complete;
    }

    private static void setField(Class<?> owner, String name, Object value) throws Exception {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        field.set(null, value);
    }
}
