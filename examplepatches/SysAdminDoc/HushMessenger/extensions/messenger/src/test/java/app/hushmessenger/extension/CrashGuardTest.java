package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import java.io.File;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;
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

    @Test public void safeModeActionPreservesChoicesAndIntentionalPause() {
        for (boolean paused : new boolean[] {false, true}) {
            prefs.edit().putBoolean("stories", true).putBoolean("paused", paused).commit();
            for (int i = 0; i < CrashGuard.THRESHOLD; i++) {
                CrashGuard.write(new File(dir, CrashGuard.START_RECORD),
                    "999 " + System.currentTimeMillis() + " crashed");
                CrashGuard.write(new File(dir, CrashGuard.CRASH_STREAK), Integer.toString(i));
                CrashGuard.resetForTests();
                CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            }
            assertTrue(CrashGuard.isSafeMode());
            try (var screen = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
                android.view.View root = screen.get().getWindow().getDecorView();
                android.widget.Button action = root.findViewWithTag("resume_safe_mode");
                assertNotNull("Safe mode must provide its advertised recovery action", action);
                assertEquals(android.view.View.VISIBLE, action.getVisibility());
                assertEquals(paused ? "Clear safe mode" : "Resume", action.getText().toString());
                action.performClick();
                assertFalse(CrashGuard.isSafeMode());
                assertFalse(prefs.getBoolean("safe_mode", true));
                assertEquals(paused, prefs.getBoolean("paused", false));
                assertTrue(prefs.getBoolean("stories", false));
                assertEquals("0", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
                assertEquals(android.view.View.GONE, action.getVisibility());
                assertEquals(!paused, Settings.wouldUse("stories"));
            }
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            assertFalse(CrashGuard.isSafeMode());
            assertEquals(paused, prefs.getBoolean("paused", false));
        }
    }

    @Test @Config(sdk = {30, 36, 37}) public void osExitReasonsOnlyCountEarlyCrashesAndAnrs() {
        int[] reasons = {ApplicationExitInfo.REASON_CRASH, ApplicationExitInfo.REASON_CRASH_NATIVE,
            ApplicationExitInfo.REASON_ANR, ApplicationExitInfo.REASON_LOW_MEMORY,
            ApplicationExitInfo.REASON_USER_REQUESTED, ApplicationExitInfo.REASON_USER_STOPPED,
            ApplicationExitInfo.REASON_PACKAGE_UPDATED, ApplicationExitInfo.REASON_OTHER};
        int pid = 90000;
        for (int reason : reasons) {
            long started = System.currentTimeMillis() - 2000;
            addExit(++pid, reason, started + 1000, "MemoryLimiter:AnonSwap");
            prefs.edit().putBoolean("safe_mode", false).putBoolean("stories", true).putBoolean("paused", true).commit();
            CrashGuard.write(new File(dir, CrashGuard.START_RECORD), pid + " " + started + " crashed");
            CrashGuard.write(new File(dir, CrashGuard.CRASH_STREAK), "2");
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            boolean qualifies = reason == ApplicationExitInfo.REASON_CRASH || reason == ApplicationExitInfo.REASON_CRASH_NATIVE || reason == ApplicationExitInfo.REASON_ANR;
            assertEquals("OS reason " + reason, qualifies, CrashGuard.isSafeMode());
            assertEquals(qualifies, prefs.getBoolean("safe_mode", false));
            assertTrue(prefs.getBoolean("stories", false));
            assertTrue(prefs.getBoolean("paused", false));
        }
    }

    @Test @Config(sdk = {30, 36, 37}) public void oldAndLateOsRecordsDoNotCount() {
        long started = System.currentTimeMillis() - 2 * CrashGuard.WINDOW_MS;
        int pid = 91000;
        for (long offset : new long[] {-1, CrashGuard.WINDOW_MS, CrashGuard.WINDOW_MS + 1}) {
            addExit(++pid, ApplicationExitInfo.REASON_CRASH, started + offset, "Crash");
            assertEquals("Exit offset " + offset, offset == CrashGuard.WINDOW_MS,
                CrashGuard.diedYoungFromACrash(RuntimeEnvironment.getApplication(), pid + " " + started));
        }
    }

    @Test @Config(sdk = {30, 36, 37}) public void duplicateHistoryAndRepeatedStartsDoNotAdvanceTheSameFailureTwice() {
        long started = System.currentTimeMillis() - 2000;
        addExit(92000, ApplicationExitInfo.REASON_CRASH, started + 1000, "Crash");
        addExit(92000, ApplicationExitInfo.REASON_CRASH, started + 1000, "Crash duplicate");
        CrashGuard.write(new File(dir, CrashGuard.START_RECORD), "92000 " + started);
        CrashGuard.write(new File(dir, CrashGuard.CRASH_STREAK), "0");
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertEquals("1", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertEquals("1", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertEquals("0", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
        assertFalse(CrashGuard.isSafeMode());
    }

    @Test @Config(sdk = {30, 36, 37}) public void earliestMatchingExitWinsOverReusedPidsAndTheHandlerMarker() {
        long started = System.currentTimeMillis() - 2000;
        addExit(93001, ApplicationExitInfo.REASON_CRASH, started + 1, "Different process");
        addExit(93000, ApplicationExitInfo.REASON_CRASH, started - 1, "Older process");
        addExit(93000, ApplicationExitInfo.REASON_USER_STOPPED, started + 500, "Stopped");
        addExit(93000, ApplicationExitInfo.REASON_CRASH, started + 1000, "Later PID reuse");
        assertFalse(CrashGuard.diedYoungFromACrash(RuntimeEnvironment.getApplication(), "93000 " + started + " crashed"));
    }

    private void addExit(int pid, int reason, long timestamp, String description) {
        ApplicationExitInfo exit = ReflectionHelpers.callConstructor(ApplicationExitInfo.class);
        ReflectionHelpers.callInstanceMethod(exit, "setPid", ClassParameter.from(int.class, pid));
        ReflectionHelpers.callInstanceMethod(exit, "setReason", ClassParameter.from(int.class, reason));
        ReflectionHelpers.callInstanceMethod(exit, "setTimestamp", ClassParameter.from(long.class, timestamp));
        ReflectionHelpers.callInstanceMethod(exit, "setDescription", ClassParameter.from(String.class, description));
        ActivityManager manager = RuntimeEnvironment.getApplication().getSystemService(ActivityManager.class);
        Shadows.shadowOf(manager).addApplicationExitInfo(exit);
    }
}
