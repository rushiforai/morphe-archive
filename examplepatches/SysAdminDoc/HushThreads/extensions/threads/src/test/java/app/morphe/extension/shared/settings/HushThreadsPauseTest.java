/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.shared.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.os.Looper;

import app.morphe.extension.shared.Utils;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivityManager;
import org.robolectric.shadows.ShadowSystemClock;

import java.io.File;
import java.util.concurrent.TimeUnit;

/** Three crashed starts in a row, the marker file and the way back, for Pause HushThreads. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HushThreadsPauseTest {
    private Context context;
    private File record;
    private File streak;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        HushThreadsPause.resetForTests();
        record = new File(context.getFilesDir(), HushThreadsPause.START_RECORD_NAME);
        streak = new File(context.getFilesDir(), HushThreadsPause.CRASH_STREAK_NAME);
        record.delete();
        streak.delete();
        File marker = HushThreadsPause.markerFile(context);
        if (marker != null) marker.delete();
        BaseSettings.SAFE_MODE.save(false);
        BaseSettings.PAUSED.save(false);
    }

    @After public void tearDown() {
        setUp();
        HushThreadsPause.resetForTests();
    }

    /** One start that ended the way [lastRecord] says, then this start. */
    private void start(String lastRecord) {
        HushThreadsPause.resetForTests();
        if (lastRecord == null) record.delete();
        else HushThreadsPause.write(record, lastRecord);
        HushThreadsPause.onProcessStart(context);
    }

    @Test public void threeStartsThatCrashedInTheirFirstMinuteTurnSafeModeOn() {
        start(null);
        assertFalse(Setting.isPaused());

        start("4101 1000 crashed");
        assertEquals("1", HushThreadsPause.read(streak));
        start("4102 2000 crashed");
        assertEquals("2", HushThreadsPause.read(streak));
        assertFalse("two crashes are not yet a loop", Setting.isPaused());

        start("4103 3000 crashed");
        assertTrue("the fourth start runs in safe mode", Setting.isPaused());
        assertEquals(HushThreadsPause.Reason.CRASH_LOOP, HushThreadsPause.reason());
        assertTrue(BaseSettings.SAFE_MODE.savedValue());
        assertEquals("the count starts again once safe mode is on", "0", HushThreadsPause.read(streak));

        // Safe mode holds for every later start until someone turns HushThreads back on.
        start(null);
        assertEquals(HushThreadsPause.Reason.CRASH_LOOP, HushThreadsPause.reason());
    }

    @Test public void aStartThatDiedWithoutACrashEndsTheStreak() {
        start("4101 1000 crashed");
        start("4102 2000 crashed");
        assertEquals("2", HushThreadsPause.read(streak));

        // Swiped away inside its first minute: no crash mark, and the streak is over.
        start("4103 3000");
        assertEquals("0", HushThreadsPause.read(streak));
        start("4104 4000 crashed");
        assertEquals("1", HushThreadsPause.read(streak));
        assertFalse(Setting.isPaused());
    }

    @Test public void aStartThatRanForAMinuteClearsItsRecordAndTheStreak() {
        start("4101 1000 crashed");
        assertTrue("this start left its own record", record.exists());
        shadowOf(Looper.getMainLooper()).idleFor(HushThreadsPause.START_WINDOW_MS + 1, TimeUnit.MILLISECONDS);
        assertFalse("the record of a start that survived is gone", record.exists());
        assertEquals("0", HushThreadsPause.read(streak));
    }

    @Test public void aCrashAndroidHoldsOpenPastTheMinuteStillCounts() {
        start("4101 1000 crashed");
        start("4102 2000 crashed");
        assertEquals("2", HushThreadsPause.read(streak));

        // This start crashes off the main thread, and Android holds it open behind "keeps
        // stopping" while the main looper runs on past the minute.
        HushThreadsPause.markCrash();
        HushThreadsPause.crashState = () -> true;
        shadowOf(Looper.getMainLooper()).idleFor(HushThreadsPause.START_WINDOW_MS + 1, TimeUnit.MILLISECONDS);
        assertTrue("the minute cleared the record of a start that crashed", record.exists());
        assertEquals("2", HushThreadsPause.read(streak));

        // The next start judges the record this one left: the third crash in a row.
        HushThreadsPause.resetForTests();
        HushThreadsPause.onProcessStart(context);
        assertEquals(HushThreadsPause.Reason.CRASH_LOOP, HushThreadsPause.reason());
    }

    @Test public void anExceptionAHandlerSwallowedDoesNotEndTheStart() {
        start("4101 1000 crashed");
        assertEquals("1", HushThreadsPause.read(streak));
        HushThreadsPause.markCrash();
        HushThreadsPause.crashState = () -> false;
        shadowOf(Looper.getMainLooper()).idleFor(HushThreadsPause.START_WINDOW_MS + 1, TimeUnit.MILLISECONDS);
        assertFalse("a start still running after the minute kept its record", record.exists());
        assertEquals("0", HushThreadsPause.read(streak));
    }

    @Test public void onlyACrashInsideTheFirstMinuteMarksTheStart() {
        start(null);
        ShadowSystemClock.advanceBy(HushThreadsPause.START_WINDOW_MS - 1000, TimeUnit.MILLISECONDS);
        HushThreadsPause.markCrash();
        assertTrue("a crash inside the minute was not marked",
                HushThreadsPause.read(record).trim().endsWith("crashed"));

        // The clock runs past the minute before the looper gets to clear the record: a crash
        // this late is not a start crash.
        start(null);
        ShadowSystemClock.advanceBy(HushThreadsPause.START_WINDOW_MS + 1000, TimeUnit.MILLISECONDS);
        HushThreadsPause.markCrash();
        assertTrue(record.exists());
        assertFalse("a crash after the minute was marked",
                HushThreadsPause.read(record).trim().endsWith("crashed"));
    }

    /** An exit Android wrote down for the pid at the wall-clock moment [at]. */
    private void exited(int pid, int reason, long at) {
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        shadowOf(manager).addApplicationExitInfo(ShadowActivityManager.ApplicationExitInfoBuilder.newBuilder()
                .setProcessName(context.getPackageName())
                .setPid(pid)
                .setReason(reason)
                .setStatus(reason == ApplicationExitInfo.REASON_CRASH ? 1 : 0)
                .setTimestamp(at)
                .build());
    }

    @Test @Config(sdk = 30)
    public void android11CountsCrashesNativeCrashesAndHangsButNotBeingSwipedAway() {
        exited(5101, ApplicationExitInfo.REASON_CRASH, 11_000);
        exited(5102, ApplicationExitInfo.REASON_CRASH_NATIVE, 12_000);
        exited(5103, ApplicationExitInfo.REASON_ANR, 13_000);
        exited(5104, ApplicationExitInfo.REASON_USER_REQUESTED, 14_000);
        exited(5105, ApplicationExitInfo.REASON_LOW_MEMORY, 15_000);

        assertTrue(HushThreadsPause.diedYoungFromACrash(context, "5101 1000"));
        assertTrue(HushThreadsPause.diedYoungFromACrash(context, "5102 1000"));
        assertTrue(HushThreadsPause.diedYoungFromACrash(context, "5103 1000"));
        // Android's own reason wins over the handler's mark: a force stop is not a crash.
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "5104 1000 crashed"));
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "5105 1000"));
        // No reason on record for the process, so the handler's mark decides.
        assertTrue(HushThreadsPause.diedYoungFromACrash(context, "5199 1000 crashed"));
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "5199 1000"));
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "not a pid"));
    }

    @Test @Config(sdk = 30)
    public void android11ReadsTheCrashOffTheFirstRecordSinceTheStart() {
        // Held open behind "keeps stopping": Android wrote the crash down at 30 s and the kill
        // that ended the dialog five minutes later. The first record is the crash.
        exited(6101, ApplicationExitInfo.REASON_CRASH, 1000 + 30_000);
        exited(6101, ApplicationExitInfo.REASON_CRASH, 1000 + 330_000);
        assertTrue(HushThreadsPause.diedYoungFromACrash(context, "6101 1000"));

        // The device slept before the process saw a minute of uptime, so the record was still
        // there when it crashed two minutes of wall time after its start: not a young crash.
        exited(6102, ApplicationExitInfo.REASON_CRASH, 1000 + 120_000);
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "6102 1000 crashed"));

        // A pid handed out again: the crash on record is older than this start, so it belonged
        // to another process, and only the handler's mark can speak for this one.
        exited(6103, ApplicationExitInfo.REASON_CRASH, 500);
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "6103 1000"));
        assertTrue(HushThreadsPause.diedYoungFromACrash(context, "6103 1000 crashed"));
    }

    @Test public void theMarkerFilePausesEveryStartUntilItIsGone() throws Exception {
        File marker = HushThreadsPause.markerFile(context);
        assertTrue(marker.getParentFile().exists() || marker.getParentFile().mkdirs());
        assertTrue(marker.createNewFile());

        start(null);
        assertEquals(HushThreadsPause.Reason.MARKER_FILE, HushThreadsPause.reason());
        assertTrue(Setting.isPaused());

        assertEquals("turning back on could not remove the marker", HushThreadsPause.Reason.NONE,
                HushThreadsPause.turnBackOn(context));
        assertFalse(marker.exists());
        start(null);
        assertEquals(HushThreadsPause.Reason.NONE, HushThreadsPause.reason());
    }

    @Test public void thePauseSwitchPausesTheNextStartAndTurningBackOnUndoesEverything() {
        BaseSettings.PAUSED.save(true);
        start(null);
        assertEquals(HushThreadsPause.Reason.SWITCH, HushThreadsPause.reason());

        BaseSettings.SAFE_MODE.save(true);
        HushThreadsPause.write(streak, "2");
        assertEquals(HushThreadsPause.Reason.NONE, HushThreadsPause.turnBackOn(context));
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertFalse(BaseSettings.SAFE_MODE.savedValue());
        assertEquals("0", HushThreadsPause.read(streak));
        start(null);
        assertFalse(Setting.isPaused());
    }

    /**
     * Safe mode and the Pause switch go off together or not at all, so a failed write can't leave
     * the next start paused by one of them after the other went. Whatever happened, the switches,
     * the store and the next start agree.
     */
    @Test public void resumeTurnsBothSwitchesOffTogetherOrNeither() {
        FailingStore.Fault[][] scripts = {
                {FailingStore.Fault.NONE, FailingStore.Fault.COMMIT_THROWS},
                {FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS},
                {FailingStore.Fault.COMMIT_FALSE, FailingStore.Fault.LOST}};
        for (FailingStore.Fault[] script : scripts) {
            BaseSettings.SAFE_MODE.save(true);
            BaseSettings.PAUSED.save(true);
            HushThreadsPause.Reason still;
            try (FailingStore ignored = FailingStore.install(script)) {
                still = HushThreadsPause.turnBackOn(context);
            }
            String name = java.util.Arrays.toString(script);
            assertEquals(name + " answered " + still, BaseSettings.PAUSED.savedValue(), still != HushThreadsPause.Reason.NONE);
            assertEquals(name + " turned one switch off", BaseSettings.SAFE_MODE.savedValue(),
                    BaseSettings.PAUSED.savedValue());
            assertEquals(name, BaseSettings.SAFE_MODE.savedValue(), stored(BaseSettings.SAFE_MODE));
            assertEquals(name, BaseSettings.PAUSED.savedValue(), stored(BaseSettings.PAUSED));
            assertEquals(name, BaseSettings.PAUSED.savedValue(), HushThreadsPause.pausesNextStart(context));
        }
    }

    /**
     * A marker that can't be removed leaves the switches on: the pause they hold still applies
     * once the file is gone, and nothing says it won't.
     */
    @Test public void aMarkerThatCanNotBeRemovedLeavesThePauseSwitchOn() throws Exception {
        File marker = HushThreadsPause.markerFile(context);
        File held = new File(marker, "held");
        // A folder with something in it can't be deleted.
        assertTrue(marker.mkdirs() && held.createNewFile());
        try {
            BaseSettings.PAUSED.save(true);
            assertEquals(HushThreadsPause.Reason.MARKER_FILE, HushThreadsPause.turnBackOn(context));
            assertTrue("the Pause switch went while the file stayed", BaseSettings.PAUSED.savedValue());
            assertTrue(marker.exists());
            assertTrue(HushThreadsPause.pausesNextStart(context));
        } finally {
            held.delete();
            marker.delete();
        }
    }

    private static boolean stored(BooleanSetting setting) {
        return Setting.preferences.preferences.getBoolean(setting.key, setting.defaultValue);
    }

    @Test public void theStreakFileSurvivesNonsense() {
        HushThreadsPause.write(streak, "not a number");
        assertEquals(0, HushThreadsPause.parseCount(HushThreadsPause.read(streak)));
        assertEquals(0, HushThreadsPause.parseCount("-4"));
        assertEquals(0, HushThreadsPause.parseCount(null));
        assertNull(HushThreadsPause.read(new File(context.getFilesDir(), "never-written")));
    }

    /** Android 9 and 10 keep no exit reasons, so there the handler's mark alone decides. */
    @Test @Config(sdk = 28)
    public void android9GoesByTheHandlersMarkAlone() {
        assertTrue(HushThreadsPause.diedYoungFromACrash(context, "5199 1000 crashed"));
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "5199 1000"));
        assertFalse(HushThreadsPause.diedYoungFromACrash(context, "not a pid"));
    }
}
