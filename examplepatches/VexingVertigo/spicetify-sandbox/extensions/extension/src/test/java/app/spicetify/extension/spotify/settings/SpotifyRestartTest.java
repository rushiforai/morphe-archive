package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.IntentFilter;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class SpotifyRestartTest {
    private final Runnable original = SpotifyRestart.terminate;

    @Before public void initialize() {
        var application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(application);
    }

    @After public void restoreTerminate() {
        SpotifyRestart.terminate = original;
    }

    @Test public void startupSettingsRequireARestartUntilChangedBack() {
        assertFalse(PatchSettings.restartRequired());
        PatchSettings.setHidePremiumTabEnabled(false);
        assertTrue(PatchSettings.restartRequired());
        PatchSettings.setHidePremiumTabEnabled(true);
        assertFalse(PatchSettings.restartRequired());
        PatchSettings.setCleanSharingEnabled(false);
        assertFalse(PatchSettings.restartRequired());
    }

    @Test public void restartRelaunchesTheMainActivityInANewTaskThenExits() {
        var application = RuntimeEnvironment.getApplication();
        ComponentName main = new ComponentName(application, "com.spotify.music.MainActivity");
        var packages = Shadows.shadowOf(application.getPackageManager());
        packages.addActivityIfNotPresent(main);
        IntentFilter launcher = new IntentFilter(Intent.ACTION_MAIN);
        launcher.addCategory(Intent.CATEGORY_LAUNCHER);
        packages.addIntentFilterForActivity(main, launcher);
        AtomicBoolean exited = new AtomicBoolean();
        SpotifyRestart.terminate = () -> exited.set(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            SpotifyRestart.restart(controller.get());
            Intent next = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(main, next.getComponent());
            assertTrue((next.getFlags() & Intent.FLAG_ACTIVITY_CLEAR_TASK) != 0);
            assertTrue((next.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
            assertTrue(exited.get());
        }
    }

    @Test public void restartWithoutALauncherActivityDoesNotExit() {
        AtomicBoolean exited = new AtomicBoolean();
        SpotifyRestart.terminate = () -> exited.set(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            SpotifyRestart.restart(controller.get());
            assertFalse(exited.get());
        }
    }
}
