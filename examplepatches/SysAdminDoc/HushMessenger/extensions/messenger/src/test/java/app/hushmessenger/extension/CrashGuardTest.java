package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.io.File;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class CrashGuardTest {
    private File dir;
    private SharedPreferences prefs;

    @Before public void setUp() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        prefs = Settings.preferences;
        prefs.edit().clear().commit();
        dir = RuntimeEnvironment.getApplication().getFilesDir();
        cleanFiles();
        CrashGuard.resetForTests();
    }

    @After public void tearDown() {
        cleanFiles();
        CrashGuard.resetForTests();
        prefs.edit().clear().commit();
    }

    private void cleanFiles() {
        new File(dir, CrashGuard.START_RECORD).delete();
        new File(dir, CrashGuard.CRASH_STREAK).delete();
    }

    @Test public void normalStartClearsTheRecordAfterSurvival() {
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertTrue(new File(dir, CrashGuard.START_RECORD).exists());
        assertFalse(CrashGuard.isSafeMode());
        CrashGuard.survivedTheStart();
        assertFalse(new File(dir, CrashGuard.START_RECORD).exists());
        assertEquals("0", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
    }

    @Test public void parseCountHandlesEdgeCases() {
        assertEquals(0, CrashGuard.parseCount(null));
        assertEquals(0, CrashGuard.parseCount(""));
        assertEquals(0, CrashGuard.parseCount("abc"));
        assertEquals(0, CrashGuard.parseCount("-5"));
        assertEquals(3, CrashGuard.parseCount("3"));
        assertEquals(7, CrashGuard.parseCount(" 7 "));
    }

    @Test public void crashMarkerIsWrittenToTheStartRecord() {
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        String before = CrashGuard.read(new File(dir, CrashGuard.START_RECORD));
        assertNotNull(before);
        assertFalse(before.contains("crashed"));
        CrashGuard.markCrash();
        String after = CrashGuard.read(new File(dir, CrashGuard.START_RECORD));
        assertNotNull(after);
        assertTrue(after.trim().endsWith("crashed"));
    }

    @Test public void diedYoungDetectsCrashMarker() {
        long now = System.currentTimeMillis();
        String record = "12345 " + now + " crashed";
        assertTrue(CrashGuard.diedYoungFromACrash(RuntimeEnvironment.getApplication(), record));
    }

    @Test public void diedYoungIgnoresNonCrashRecords() {
        long now = System.currentTimeMillis();
        assertFalse(CrashGuard.diedYoungFromACrash(RuntimeEnvironment.getApplication(), "12345 " + now));
        assertFalse(CrashGuard.diedYoungFromACrash(RuntimeEnvironment.getApplication(), ""));
        assertFalse(CrashGuard.diedYoungFromACrash(RuntimeEnvironment.getApplication(), "invalid"));
    }

    @Test public void threeCrashesActivateSafeMode() {
        long now = System.currentTimeMillis();
        for (int i = 0; i < CrashGuard.THRESHOLD; i++) {
            CrashGuard.write(new File(dir, CrashGuard.START_RECORD), "999 " + now + " crashed");
            CrashGuard.write(new File(dir, CrashGuard.CRASH_STREAK), Integer.toString(i));
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        }
        assertTrue(prefs.getBoolean("safe_mode", false));
        assertTrue(CrashGuard.isSafeMode());
    }

    @Test public void safeModeDisablesAllControls() {
        prefs.edit().putBoolean("stories", true).commit();
        Settings.initialize(RuntimeEnvironment.getApplication());
        assertTrue(Settings.enabled("stories") || !Settings.installed.contains("stories"));
        prefs.edit().putBoolean("safe_mode", true).commit();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertTrue(CrashGuard.isSafeMode());
        assertFalse(Settings.enabled("stories"));
    }

    @Test public void clearSafeModeResetsThePreferenceAndStreak() {
        prefs.edit().putBoolean("safe_mode", true).commit();
        CrashGuard.write(new File(dir, CrashGuard.CRASH_STREAK), "2");
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertTrue(CrashGuard.isSafeMode());
        CrashGuard.clearSafeMode();
        assertFalse(CrashGuard.isSafeMode());
        assertFalse(prefs.getBoolean("safe_mode", false));
        assertEquals("0", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
    }

    @Test public void survivedStartIsIdempotentWithoutCrashMark() {
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        CrashGuard.survivedTheStart();
        assertFalse(new File(dir, CrashGuard.START_RECORD).exists());
        CrashGuard.survivedTheStart();
        assertFalse(new File(dir, CrashGuard.START_RECORD).exists());
    }

    @Test public void doubleStartIsIgnored() {
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        String first = CrashGuard.read(new File(dir, CrashGuard.START_RECORD));
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertEquals(first, CrashGuard.read(new File(dir, CrashGuard.START_RECORD)));
    }

    @Test public void readAndWriteRoundTrip() {
        File f = new File(dir, "test-round-trip");
        assertNull(CrashGuard.read(f));
        CrashGuard.write(f, "hello");
        assertEquals("hello", CrashGuard.read(f));
        f.delete();
    }

    @Test public void safeModeShowsInCopySetup() {
        prefs.edit().putBoolean("safe_mode", true).commit();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        try (var screen = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = screen.get().getWindow().getDecorView();
            android.widget.TextView count = root.findViewWithTag("enabled_count");
            assertTrue(count.getText().toString().contains("Safe mode"));
        }
    }
}
