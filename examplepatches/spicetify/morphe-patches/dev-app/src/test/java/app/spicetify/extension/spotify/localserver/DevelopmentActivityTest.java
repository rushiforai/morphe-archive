package app.spicetify.extension.spotify.localserver;

import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.media.MediaPlayer;
import android.os.Handler;
import android.os.Looper;
import app.spicetify.extension.spotify.settings.PatchSettings;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowMediaPlayer;
import org.robolectric.shadows.util.DataSource;
import org.robolectric.util.ReflectionHelpers;
import java.net.URI;
import java.time.Duration;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class DevelopmentActivityTest {
    @Test public void opensProductionSettingsInTheDevelopmentPackage() {
        try (var controller = Robolectric.buildActivity(DevelopmentActivity.class).setup()) {
            var activity = controller.get();
            Button settings = button(activity.getWindow().getDecorView(), "Open patch settings");
            assertNotNull("The launcher must expose production settings", settings);
            settings.performClick();
            assertNull(shadowOf(activity).getNextStartedActivity());
            assertTrue(ShadowDialog.getLatestDialog().isShowing());
        }
    }

    @Test public void initializesRealPreferencesWithoutSpotify() {
        try (var controller = Robolectric.buildActivity(DevelopmentActivity.class).setup()) {
            PatchSettings.setHidePremiumTabEnabled(false);
            assertTrue(PatchSettings.showPremiumTab(true));
            PatchSettings.setHidePremiumTabEnabled(true);
            assertFalse(PatchSettings.showPremiumTab(true));
            assertNotNull(button(controller.get().getWindow().getDecorView(), "Refresh tracks"));
        }
    }

    @Test public void leavingTheLauncherReleasesPlaybackAndCancelsPositionUpdates() {
        try (var controller = Robolectric.buildActivity(DevelopmentActivity.class).setup()) {
            var activity = controller.get();
            MediaPlayer player = startPreview(activity);
            assertTrue(player.isPlaying());
            assertTrue(button(activity.getWindow().getDecorView(), "Seek forward 5 seconds").isEnabled());
            controller.pause().stop();
            assertStopped(activity, player, "Stopped");
        }
    }

    @Test public void explicitStopAndCompletionReleasePlayback() {
        try (var controller = Robolectric.buildActivity(DevelopmentActivity.class).setup()) {
            var activity = controller.get();
            MediaPlayer stopped = startPreview(activity);
            button(activity.getWindow().getDecorView(), "Stop playback").performClick();
            assertStopped(activity, stopped, "Stopped");
            MediaPlayer finished = startPreview(activity);
            shadowOf(finished).invokeCompletionListener();
            assertStopped(activity, finished, "Finished");
        }
    }

    @Test public void errorReleasesPlaybackAndAnOldCallbackCannotStopTheNextTrack() {
        try (var controller = Robolectric.buildActivity(DevelopmentActivity.class).setup()) {
            var activity = controller.get();
            MediaPlayer failed = startPreview(activity);
            var staleCompletion = shadowOf(failed).getOnCompletionListener();
            var stalePrepared = shadowOf(failed).getOnPreparedListener();
            shadowOf(failed).invokeErrorListener(MediaPlayer.MEDIA_ERROR_UNKNOWN, 0);
            assertStopped(activity, failed, "Playback failed. Check the server and refresh tracks.");
            MediaPlayer next = startPreview(activity);
            staleCompletion.onCompletion(failed);
            stalePrepared.onPrepared(failed);
            assertTrue(next.isPlaying());
            assertEquals(ShadowMediaPlayer.State.END, shadowOf(failed).getState());
        }
    }

    private MediaPlayer startPreview(DevelopmentActivity activity) {
        var connection = new ServerConnection("https://fixture.example/music/", "", "");
        var track = new RemoteTrack(connection, URI.create("https://fixture.example/music/tone.wav"), 352844, "fixture");
        ShadowMediaPlayer.addMediaInfo(DataSource.toDataSource(activity, ServerFileProvider.uriFor(track)),
                new ShadowMediaPlayer.MediaInfo(8000, 0));
        MediaPlayer[] created = new MediaPlayer[1];
        ShadowMediaPlayer.setCreateListener((player, shadow) -> {
            created[0] = player;
            shadow.setInvalidStateBehavior(ShadowMediaPlayer.InvalidStateBehavior.ASSERT);
        });
        ReflectionHelpers.callInstanceMethod(activity, "play", ReflectionHelpers.ClassParameter.from(RemoteTrack.class, track));
        shadowOf(Looper.getMainLooper()).idle();
        assertNotNull(created[0]);
        assertTrue(created[0].isPlaying());
        return created[0];
    }

    private void assertStopped(DevelopmentActivity activity, MediaPlayer player, String message) {
        assertEquals(ShadowMediaPlayer.State.END, shadowOf(player).getState());
        assertFalse(button(activity.getWindow().getDecorView(), "Seek forward 5 seconds").isEnabled());
        Handler handler = ReflectionHelpers.getField(activity, "handler");
        Runnable position = ReflectionHelpers.getField(activity, "position");
        assertFalse(handler.hasCallbacks(position));
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        TextView playback = ReflectionHelpers.getField(activity, "playback");
        assertEquals(message, playback.getText().toString());
    }

    private Button button(View view, String label) {
        if (view instanceof Button && label.contentEquals(((Button) view).getText())) return (Button) view;
        if (view instanceof ViewGroup) {
            var group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Button found = button(group.getChildAt(i), label);
                if (found != null) return found;
            }
        }
        return null;
    }
}
