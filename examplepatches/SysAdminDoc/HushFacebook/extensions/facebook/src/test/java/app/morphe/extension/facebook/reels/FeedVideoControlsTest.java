/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.os.Looper;
import android.view.Gravity;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import androidx.recyclerview.widget.RecyclerView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.RobolectricTestRunner;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.HushfacebookPause;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w1080dp-h2400dp-mdpi")
public class FeedVideoControlsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private ActivityController<Activity> window;
    private Activity activity;
    private FrameLayout root;
    private RecyclerView list;
    private FrameLayout row;
    private final Player player = new Player();
    private final List<Boolean> commands = new ArrayList<>();
    private final List<String> casts = new ArrayList<>();
    private boolean fail;

    private static final class Media { String id = "video"; boolean ordinary = true; }
    private static final class Player {
        ViewGroup view;
        Media params = new Media();
        String origin = "newsfeed::feed_story";
        boolean playing;
    }

    @Before public void setUp() {
        FeedVideoControls.reset();
        FeedVideoControls.inBuildForTests = true;
        FeedVideoControls.access = new FeedVideoControls.Players() {
            public ViewGroup view(Object of) {
                if (fail) throw new IllegalStateException("unavailable player");
                return ((Player) of).view;
            }
            public Object params(Object of) { return ((Player) of).params; }
            public Object origin(Object of) { return ((Player) of).origin; }
            public String videoId(Object params) { return ((Media) params).id; }
            public boolean eligible(Object params) { return ((Media) params).ordinary; }
            public boolean playing(Object of) { return ((Player) of).playing; }
            public void command(Object of, boolean play) {
                assertEquals(Looper.getMainLooper(), Looper.myLooper());
                assertTrue(of == player);
                commands.add(play);
                ((Player) of).playing = play;
            }
            public void cast(View from, String videoId) {
                assertTrue(from == FeedVideoControls.showingCast(player));
                casts.add(videoId);
            }
        };
        Settings.TAP_TO_PLAY.save(false);
        Settings.INLINE_FEED_VIDEO_CONTROLS.save(true);
        window = Robolectric.buildActivity(Activity.class).setup();
        activity = window.get();
        root = new FrameLayout(activity);
        list = new RecyclerView(activity, true);
        place(root, list, 0, 100, 1080, 2100);
        row = new FrameLayout(activity);
        place(list, row, 0, 0, 1080, 1100);
        player.view = container(row, 300);
        place(player.view, new SurfaceView(activity), 0, 0, 1080, 600);
        activity.setContentView(root);
        layout();
        window.windowFocusChanged(true);
        attach(player);
    }

    @After public void restore() {
        FeedVideoControls.reset();
        Settings.INLINE_FEED_VIDEO_CONTROLS.resetToDefault();
        Settings.FEED_VIDEO_CAST_BUTTON.resetToDefault();
        Settings.TAP_TO_PLAY.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
        if (window != null) window.pause().stop().destroy();
    }

    private FrameLayout container(ViewGroup into, int top) {
        FrameLayout container = new FrameLayout(activity);
        place(into, container, 0, top, 1080, 600);
        return container;
    }

    private static void place(ViewGroup parent, View child, int left, int top, int width, int height) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, height, Gravity.LEFT | Gravity.TOP);
        params.leftMargin = left;
        params.topMargin = top;
        parent.addView(child, params);
    }

    private void layout() {
        activity.getWindow().getDecorView().requestLayout();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(100));
    }

    private void attach(Player of) {
        FeedVideoControls.attached(of.view, of);
        drain();
    }

    private static void drain() { shadowOf(Looper.getMainLooper()).idle(); }

    private View button() { return FeedVideoControls.showing(player); }

    private View cast() { return FeedVideoControls.showingCast(player); }

    private void castOn() {
        FeedVideoControls.videoPatchInBuildForTests = true;
        Settings.FEED_VIDEO_CAST_BUTTON.save(true);
        FeedVideoControls.settingsChanged();
        drain();
    }

    private static FrameLayout.LayoutParams at(View button) {
        return (FrameLayout.LayoutParams) button.getLayoutParams();
    }

    @Test public void castButtonSitsAcrossFromPlayAndHandsOverTheVideoOnScreen() {
        assertNull("the cast button starts off", cast());
        castOn();
        assertNotNull(cast());
        assertEquals("Cast this video", cast().getContentDescription());
        assertTrue(cast().getParent() == button().getParent());
        // 1080 px wide surface at mdpi: a 48 px button 8 px in from each side, same row.
        assertEquals(8, at(button()).leftMargin);
        assertEquals(1080 - 8 - 48, at(cast()).leftMargin);
        assertEquals(at(button()).topMargin, at(cast()).topMargin);
        cast().performClick();
        assertEquals(java.util.Arrays.asList("video"), casts);
        assertTrue("a cast tap never plays or pauses", commands.isEmpty());
        button().performClick();
        assertEquals(java.util.Arrays.asList(true), commands);
        assertEquals(1, casts.size());
    }

    @Test public void castButtonStandsAloneWhenPlayPauseIsOff() {
        Settings.INLINE_FEED_VIDEO_CONTROLS.save(false);
        castOn();
        assertNull(button());
        assertNotNull(cast());
        cast().performClick();
        assertEquals(java.util.Arrays.asList("video"), casts);
    }

    @Test public void castButtonNeedsItsSwitchTheVideoPatchAndNoPause() {
        castOn();
        View old = cast();
        Settings.FEED_VIDEO_CAST_BUTTON.save(false);
        old.performClick();
        drain();
        assertNull(cast());
        assertNotNull("play/pause stays", button());
        castOn();
        FeedVideoControls.videoPatchInBuildForTests = false;
        FeedVideoControls.settingsChanged();
        drain();
        assertNull("no player record to hand over without the video patch", cast());
        castOn();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        FeedVideoControls.settingsChanged();
        drain();
        assertNull(cast());
        PauseForTests.resume();
        castOn();
        FeedVideoControls.inBuildForTests = false;
        FeedVideoControls.settingsChanged();
        drain();
        assertNull(cast());
        assertTrue(casts.isEmpty());
    }

    @Test public void oldCastClickNeverSendsAnotherVideo() {
        castOn();
        View old = cast();
        player.params.id = "another video";
        old.performClick();
        assertTrue(casts.isEmpty());
        assertNull(cast());
        FeedVideoControls.changed(player);
        drain();
        View next = cast();
        assertNotNull(next);
        player.params = new Media();
        FeedVideoControls.rebound(player);
        next.performClick();
        assertTrue(casts.isEmpty());
        drain();
        cast().performClick();
        assertEquals(java.util.Arrays.asList("video"), casts);
    }

    @Test public void aSurfaceTooNarrowForTwoButtonsGetsNeitherButOneFits() {
        player.view.removeAllViews();
        place(player.view, new SurfaceView(activity), 0, 0, 100, 600);
        layout();
        castOn();
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        assertNull(cast());
        Settings.INLINE_FEED_VIDEO_CONTROLS.save(false);
        drain();
        assertNotNull(cast());
        assertEquals(100 - 8 - 48, at(cast()).leftMargin);
    }

    @Test public void buttonStartsPausesAndResumesWithoutChangingNativeTaps() {
        assertNotNull(button());
        assertEquals("Play feed video", button().getContentDescription());
        button().performClick();
        assertEquals("Pause feed video", button().getContentDescription());
        button().performClick();
        button().performClick();
        assertEquals(java.util.Arrays.asList(true, false, true), commands);
        List<String> nativeActions = new ArrayList<>();
        player.view.setOnClickListener(v -> nativeActions.add("fullscreen"));
        View comment = new View(activity);
        comment.setOnClickListener(v -> nativeActions.add("comments"));
        place(row, comment, 0, 950, 200, 100);
        player.view.performClick();
        comment.performClick();
        assertEquals(java.util.Arrays.asList("fullscreen", "comments"), nativeActions);
        assertEquals(3, commands.size());
    }

    @Test public void nativePlaybackChangesUpdateButtonWithAutoplaySettingIndependent() {
        Settings.TAP_TO_PLAY.save(true);
        player.playing = true;
        FeedVideoControls.changed(player);
        drain();
        assertEquals("Pause feed video", button().getContentDescription());
        player.playing = false;
        FeedVideoControls.changed(player);
        drain();
        assertEquals("Play feed video", button().getContentDescription());
        assertTrue(commands.isEmpty());
    }

    @Test public void oldClickCannotControlAReboundVideoEvenBeforeRefresh() {
        View old = button();
        player.params = new Media();
        FeedVideoControls.rebound(player);
        old.performClick();
        assertTrue(commands.isEmpty());
        drain();
        assertNotNull(button());
        assertFalse(old == button());
        button().performClick();
        assertEquals(java.util.Arrays.asList(true), commands);
    }

    @Test public void paramsChangedWithoutANotificationStillRejectOldClick() {
        View old = button();
        player.params = new Media();
        old.performClick();
        assertTrue(commands.isEmpty());
        assertNull(button());
    }

    @Test public void changedMediaIdRejectsAClickEvenWithTheSameParamsObject() {
        View old = button();
        player.params.id = "another video";
        old.performClick();
        assertTrue(commands.isEmpty());
        assertNull(button());
    }

    @Test public void switchStartsOffAndRestoresTheNativeFeed() {
        Settings.INLINE_FEED_VIDEO_CONTROLS.resetToDefault();
        drain();
        assertFalse(Settings.INLINE_FEED_VIDEO_CONTROLS.get());
        assertNull(button());
    }

    @Test public void recycledPlayerUsesItsCurrentContainer() {
        View old = button();
        FrameLayout next = container(row, 100);
        place(next, new TextureView(activity), 0, 0, 1080, 500);
        FeedVideoControls.attached(next, player);
        player.view = next;
        old.performClick();
        assertTrue(commands.isEmpty());
        layout();
        drain();
        assertNotNull(button());
        assertFalse(old == button());
        button().performClick();
        assertEquals(java.util.Arrays.asList(true), commands);
    }

    @Test public void sameBoundPlayerRestoresItsButtonAfterScrollingOutAndBack() {
        View old = button();
        ViewGroup container = player.view;
        row.removeView(container);
        drain();
        assertNull(button());
        old.performClick();
        assertTrue(commands.isEmpty());
        place(row, container, 0, 300, 1080, 600);
        layout();
        drain();
        assertNotNull(button());
        assertFalse(old == button());
        button().performClick();
        assertEquals(java.util.Arrays.asList(true), commands);
    }

    @Test public void playerBoundBeforeWindowAttachmentGetsControlsWhenItAppears() {
        row.removeView(player.view);
        drain();
        FeedVideoControls.attached(player.view, player);
        drain();
        assertNull(button());
        place(row, player.view, 0, 300, 1080, 600);
        layout();
        drain();
        assertNotNull(button());
        button().performClick();
        assertEquals(java.util.Arrays.asList(true), commands);
    }

    @Test public void releaseRetiresOldParamsUntilAnotherAttach() {
        View old = button();
        FeedVideoControls.released(player);
        old.performClick();
        drain();
        assertNull(button());
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        attach(player);
        assertNotNull(button());
        assertTrue(commands.isEmpty());
    }

    @Test public void offPauseUnreadyAndAbsentPatchRemoveControlsAndRejectOldClicks() {
        View old = button();
        Settings.INLINE_FEED_VIDEO_CONTROLS.save(false);
        old.performClick();
        drain();
        assertNull(button());
        assertTrue(commands.isEmpty());
        Settings.INLINE_FEED_VIDEO_CONTROLS.save(true);
        drain();
        assertNotNull(button());
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        FeedVideoControls.settingsChanged();
        drain();
        assertNull(button());
        PauseForTests.resume();
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            FeedVideoControls.settingsChanged();
            drain();
            assertNull(button());
        });
        FeedVideoControls.inBuildForTests = false;
        FeedVideoControls.settingsChanged();
        drain();
        assertNull(button());
    }

    @Test public void absentAndAmbiguousSurfacesGetNoButton() {
        player.view.removeAllViews();
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        place(player.view, new TextureView(activity), 0, 0, 500, 500);
        place(player.view, new SurfaceView(activity), 500, 0, 500, 500);
        layout();
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        assertTrue(commands.isEmpty());
    }

    @Test public void twoCurrentPlayersCannotOwnTheSameSurface() {
        Player other = new Player();
        other.view = player.view;
        attach(other);
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        assertNull(FeedVideoControls.showing(other));
    }

    @Test public void wrongOriginAdsLiveAudioAndMissingMediaAreRefused() {
        player.origin = "fb_shorts_tab::fb_shorts_viewer";
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        player.origin = "newsfeed::feed_story";
        player.params.ordinary = false;
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        player.params.ordinary = true;
        player.params.id = "";
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        player.params = null;
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
    }

    @Test public void detachedHiddenAndFailedOwnershipRemoveAnExistingButton() {
        player.view.setVisibility(View.GONE);
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        player.view.setVisibility(View.VISIBLE);
        layout();
        FeedVideoControls.changed(player);
        drain();
        assertNotNull(button());
        fail = true;
        FeedVideoControls.changed(player);
        drain();
        assertNull(button());
        fail = false;
        attach(player);
        assertNotNull(button());
        row.removeView(player.view);
        drain();
        assertNull(button());
    }
}
