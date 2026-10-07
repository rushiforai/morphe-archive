package nl.nlziet.pip;

import android.app.Activity;
import android.app.PictureInPictureParams;
import android.content.pm.PackageManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bitmovin.player.PlayerView;
import com.bitmovin.player.api.Player;
import nl.nlziet.mobile.presentation.ui.player.PlayerFragment;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.Shadows;
import static org.junit.Assert.*;

/** Android framework shadows + test-only public Bitmovin API doubles; not DRM/playback tests. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, manifest = Config.NONE)
public class NativePipTest {
    public static class PipActivity extends Activity {
        boolean pip, accepted = true;
        int entries;
        Object fragment = new PlayerFragment();
        public Object getCurrentFragment() { return fragment; }
        @Override public boolean isInPictureInPictureMode() { return pip; }
        @Override public boolean enterPictureInPictureMode(PictureInPictureParams params) {
            entries++; pip = accepted; return accepted;
        }
    }
    public static class LocalPlayer implements Player, com.bitmovin.player.api.casting.RemoteControlApi {
        boolean playing = true, destroyed, casting;
        Object source = new Object();
        public boolean isCasting() { return casting; }
        public boolean isPlaying() { return playing; }
        public boolean isDestroyed() { return destroyed; }
        public Object getSource() { return source; }
    }
    PipActivity activity;
    PlayerView surface;
    LocalPlayer player;
    View controls;
    @Before public void setup() {
        activity = Robolectric.buildActivity(PipActivity.class).setup().visible().get();
        Shadows.shadowOf(activity.getPackageManager()).setSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE, true);
        FrameLayout root = new FrameLayout(activity);
        surface = new PlayerView(activity);
        player = new LocalPlayer(); surface.player = player;
        root.addView(surface, new FrameLayout.LayoutParams(640, 360));
        controls = new View(activity); root.addView(controls, new FrameLayout.LayoutParams(44, 44));
        activity.setContentView(root);
        activity.getWindow().getDecorView().measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        activity.getWindow().getDecorView().layout(0, 0, 1080, 1920);
    }
    @After public void cleanup() { activity.pip = false; NativePip.onResume(activity); }
    @Test public void activePlaybackEntersAndPreservesSdkPlayback() {
        NativePip.onUserLeaveHint(activity);
        assertEquals(1, activity.entries);
        NativePip.onPlayerPause(surface);
        assertEquals(0, surface.pauses);
    }
    @Test public void pausedPlaybackDoesNotEnterAndPausesNormally() {
        player.playing = false;
        NativePip.onUserLeaveHint(activity);
        assertEquals(0, activity.entries);
        NativePip.onPlayerPause(surface);
        assertEquals(1, surface.pauses);
    }
    @Test public void missingSourceDoesNotEnter() {
        player.source = null; NativePip.onUserLeaveHint(activity); assertEquals(0, activity.entries);
    }
    @Test public void destroyedPlayerDoesNotEnter() {
        player.destroyed = true; NativePip.onUserLeaveHint(activity); assertEquals(0, activity.entries);
    }
    @Test public void loginDestinationDoesNotEnter() {
        activity.fragment = new Object(); NativePip.onUserLeaveHint(activity); assertEquals(0, activity.entries);
    }
    @Test public void deniedPipRetainsNormalPause() {
        activity.accepted = false; NativePip.onUserLeaveHint(activity);
        assertEquals(1, activity.entries);
        NativePip.onPlayerPause(surface); assertEquals(1, surface.pauses);
    }
    @Test public void finishingActivityRetainsNormalPause() {
        NativePip.onUserLeaveHint(activity); activity.finish();
        NativePip.onPlayerPause(surface); assertEquals(1, surface.pauses);
    }
    @Test public void unavailableFeatureDoesNotEnter() {
        Shadows.shadowOf(activity.getPackageManager()).setSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE, false);
        NativePip.onUserLeaveHint(activity); assertEquals(0, activity.entries);
    }
    @Test public void modeCallbackHidesChromeAndRestoresOriginalDimensions() {
        NativePip.onUserLeaveHint(activity);
        NativePip.onModeChanged(activity, true, activity.getResources().getConfiguration());
        assertEquals(View.INVISIBLE, controls.getVisibility());
        assertEquals(ViewGroup.LayoutParams.MATCH_PARENT, surface.getLayoutParams().width);
        assertTrue(surface.mode);
        activity.pip = false;
        NativePip.onModeChanged(activity, false, activity.getResources().getConfiguration());
        assertEquals(View.VISIBLE, controls.getVisibility());
        assertEquals(640, surface.getLayoutParams().width);
        assertEquals(360, surface.getLayoutParams().height);
        assertFalse(surface.mode);
        NativePip.onPlayerPause(surface); assertEquals(1, surface.pauses);
    }
    @Test public void secondSurfaceFailsClosed() {
        FrameLayout root = (FrameLayout) surface.getParent();
        PlayerView second = new PlayerView(activity); second.player = player;
        root.addView(second, new FrameLayout.LayoutParams(640, 360));
        NativePip.onUserLeaveHint(activity); assertEquals(0, activity.entries);
    }

    @Test public void castingDoesNotEnter() {
        player.casting = true;
        NativePip.onUserLeaveHint(activity);
        assertEquals(0, activity.entries);
    }
    @Test public void resumeRestoresSdkModeEvenWithoutExitCallback() {
        NativePip.onUserLeaveHint(activity);
        NativePip.onModeChanged(activity, true, activity.getResources().getConfiguration());
        activity.pip = false;
        NativePip.onResume(activity);
        assertFalse(surface.mode);
    }
}
