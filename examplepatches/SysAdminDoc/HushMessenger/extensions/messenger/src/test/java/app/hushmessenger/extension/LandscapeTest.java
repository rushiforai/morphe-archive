package app.hushmessenger.extension;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import java.util.Collections;
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
public class LandscapeTest {
    private Activity screen;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.landscape = null;
        CrashGuard.resetForTests();
        screen = Robolectric.buildActivity(Activity.class).get();
    }

    @Test public void onUnlocksScreensMessengerWouldLockAndNeverLocksOne() {
        Settings.preferences.edit().putBoolean("landscape", true).commit();
        assertFalse(Settings.portraitLock(false, screen));
        assertEquals("A phone whose lock is already off changes nothing, so it isn't counted", 0, Settings.lastActive("landscape"));
        assertNull("Nor does it wait for a restart", Settings.landscape);
        assertFalse(Settings.portraitLock(true, screen));
        assertTrue(Settings.lastActive("landscape") > 0);
        assertFalse(Settings.portraitLock(true, null));
    }

    @Test public void theCamerasStayUprightWithItOn() {
        Settings.preferences.edit().putBoolean("landscape", true).commit();
        assertTrue(Settings.keepsUpright("com.facebook.messaging.quicksnap.QuicksnapActivity"));
        assertTrue(Settings.keepsUpright("com.facebook.messaging.encryptedbackups.networkverification.qrcode.scanqrcode.scanner.NetworkVerificationQrCodeScannerActivity"));
        assertFalse(Settings.keepsUpright("com.facebook.messaging.threadview.activity.ThreadViewActivity"));
        assertFalse(Settings.keepsUpright(screen.getClass().getName()));
    }

    @Test public void theViewersPutBackUnlockedInsteadOfPortrait() {
        Settings.preferences.edit().putBoolean("landscape", true).commit();
        assertEquals(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED, Settings.mediaOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT));
        for (int other : new int[] {ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED, ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE,
                ActivityInfo.SCREEN_ORIENTATION_SENSOR, ActivityInfo.SCREEN_ORIENTATION_REVERSE_PORTRAIT}) {
            assertEquals(other, Settings.mediaOrientation(other));
        }
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMessengersAnswer() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("landscape", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.landscape = null;
            Settings.activeAt.clear();
            assertTrue(state, Settings.portraitLock(true, screen));
            assertFalse(state, Settings.portraitLock(false, screen));
            assertEquals(state, ActivityInfo.SCREEN_ORIENTATION_PORTRAIT, Settings.mediaOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT));
            assertEquals(state, 0, Settings.lastActive("landscape"));
        }
    }

    @Test public void theFirstAnswerHoldsUntilARestartAndTheRowSaysSo() {
        assertTrue(Settings.portraitLock(true, screen));
        Settings.preferences.edit().putBoolean("landscape", true).commit();
        assertTrue("Turning it on mid-session waits for Restart Messenger", Settings.portraitLock(true, screen));
        assertEquals(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT, Settings.mediaOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT));
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart("landscape"));

        Settings.landscape = null;
        assertFalse(Settings.portraitLock(true, screen));
        assertNull(Settings.heldUntilRestart("landscape"));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse("Pause, like the switch, takes effect on the next start", Settings.portraitLock(true, screen));
        assertEquals(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED, Settings.mediaOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT));
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart("landscape"));

        Settings.landscape = null;
        assertTrue(Settings.portraitLock(true, screen));
    }

    @Test public void concurrentFirstAsksAllGetTheSameAnswer() throws Exception {
        Settings.preferences.edit().putBoolean("landscape", true).commit();
        Thread[] askers = new Thread[8];
        boolean[] answers = new boolean[askers.length];
        for (int i = 0; i < askers.length; i++) {
            int at = i;
            askers[i] = new Thread(() -> answers[at] = Settings.portraitLock(true, null));
        }
        for (Thread asker : askers) asker.start();
        Settings.preferences.edit().putBoolean("landscape", false).commit();
        for (Thread asker : askers) asker.join();
        boolean first = Settings.landscape;
        for (boolean answer : answers) assertEquals(!first, answer);
    }
}
