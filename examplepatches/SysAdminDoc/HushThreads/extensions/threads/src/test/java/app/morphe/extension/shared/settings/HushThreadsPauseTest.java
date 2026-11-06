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
import app.morphe.extension.shared.settings.preference.JavaCrashReport;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

/** Three crashed starts in a row, the crash report, the marker file and the way back, for Pause HushThreads. */
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

    /**
     * The handlers after ours: each records what it was handed and the report kept by then, and
     * returns, so a test lives on.
     */
    private static final class Delegate implements Thread.UncaughtExceptionHandler {
        final List<Throwable> handed = new ArrayList<>();
        final List<String> reports = new ArrayList<>();
        /** Runs while this handler has the exception, as another thread's crash arriving then would. */
        Runnable meanwhile;

        @Override public void uncaughtException(Thread thread, Throwable throwable) {
            handed.add(throwable);
            reports.add(LogBufferManager.readCrashReport(Utils.getContext()));
            Runnable then = meanwhile;
            meanwhile = null;
            if (then != null) then.run();
        }
    }

    /**
     * Sections standing in for the patches' switches and for Supported links. Each says its line
     * while that holds one and nothing otherwise, so it stays out of every other test's report
     * once registered.
     */
    private static volatile String switchLine;
    private static volatile String linkLine;

    private static final LogBufferManager.ReportSection SWITCHES = new LogBufferManager.ReportSection() {
        @Override public String title() {
            return "SWITCH PROBE";
        }

        @Override public List<String> lines() {
            String line = switchLine;
            return line == null ? Collections.emptyList() : Collections.singletonList(line);
        }
    };

    private static final LogBufferManager.ReportSection LINKS = new LogBufferManager.ReportSection() {
        @Override public String title() {
            return "SUPPORTED LINKS";
        }

        @Override public List<String> lines() {
            String line = linkLine;
            return line == null ? Collections.emptyList() : Collections.singletonList(line);
        }
    };

    @Test public void aCrashInTheFirstMinuteKeepsItsReportForTheNextExportAndHandsTheCrashOn() {
        LogBufferManager.clearLogBuffer();
        LogBufferManager.registerReportSection(SWITCHES);
        LogBufferManager.registerReportSection(LINKS);
        switchLine = "Hide suggested posts: on";
        linkLine = "www.threads.com -> verified";
        try {
            start(null);
            Delegate delegate = new Delegate();
            Throwable crash = new IllegalStateException("feed went away", new java.io.IOException("socket closed"));
            HushThreadsPause.crashMarkForTests(delegate).uncaughtException(Thread.currentThread(), crash);

            assertEquals("the crash was not handed on", Collections.singletonList(crash), delegate.handed);
            assertTrue("the safe mode count lost its mark", HushThreadsPause.read(record).trim().endsWith("crashed"));
            String report = LogBufferManager.readCrashReport(context);
            for (String part : new String[]{"complete: true\n", "app_version: ", "app_version_code: ",
                    "patch_build: ", "thread: " + Thread.currentThread().getName() + "\n",
                    "exception: java.lang.IllegalStateException\n", "java.lang.IllegalStateException: feed went away",
                    "Caused by: java.io.IOException: socket closed", "[SWITCH PROBE]\nHide suggested posts: on\n"}) {
                assertTrue("the report lost " + part + ": " + report, report.contains(part));
            }
            assertFalse("Supported links went into the crash report: " + report, report.contains("[SUPPORTED LINKS]"));

            // The next start's export carries it, and still shows Supported links in its own place.
            start(null);
            String export = LogBufferManager.buildExportText();
            assertTrue(export, export.contains("[LATEST JAVA CRASH]\n"));
            assertTrue(export, export.contains("java.lang.IllegalStateException: feed went away"));
            assertTrue(export, export.contains("[SUPPORTED LINKS]\nwww.threads.com -> verified\n"));
        } finally {
            switchLine = null;
            linkLine = null;
            LogBufferManager.clearLogBuffer();
        }
    }

    @Test public void aCrashAfterTheFirstMinuteKeepsNoReportUnlessDebugLoggingIsOn() {
        LogBufferManager.clearLogBuffer();
        try {
            start(null);
            ShadowSystemClock.advanceBy(HushThreadsPause.START_WINDOW_MS + 1000, TimeUnit.MILLISECONDS);
            Delegate delegate = new Delegate();
            Thread.UncaughtExceptionHandler handler = HushThreadsPause.crashMarkForTests(delegate);
            Throwable late = new IllegalStateException("late");
            handler.uncaughtException(Thread.currentThread(), late);
            assertEquals("a late crash kept a report", "", LogBufferManager.readCrashReport(context));
            assertEquals(Collections.singletonList(late), delegate.handed);

            BaseSettings.DEBUG.save(true);
            Throwable debugged = new IllegalStateException("late, with Debug logging on");
            handler.uncaughtException(Thread.currentThread(), debugged);
            assertTrue("Debug logging kept no report of a late crash",
                    LogBufferManager.readCrashReport(context).contains("late, with Debug logging on"));
            assertEquals(Arrays.asList(late, debugged), delegate.handed);
            assertFalse("a late crash marked the start", HushThreadsPause.read(record).trim().endsWith("crashed"));
        } finally {
            BaseSettings.DEBUG.save(false);
            LogBufferManager.clearLogBuffer();
        }
    }

    @Test public void anExceptionSwallowedOffTheMainThreadPutsTheReportBack() throws Exception {
        LogBufferManager.clearLogBuffer();
        try {
            LogBufferManager.persistCrashReport(context, EARLIER);
            start(null);
            Thread worker = new Thread("worker");
            Delegate delegate = new Delegate();
            Throwable swallowed = new IllegalStateException("swallowed");
            HushThreadsPause.crashMarkForTests(delegate).uncaughtException(worker, swallowed);
            // Kept while Threads' handlers had it, as a crash that ends the process needs it to be.
            assertTrue("nothing was kept: " + delegate.reports, delegate.reports.get(0).contains("swallowed"));
            assertEquals(EARLIER, LogBufferManager.readCrashReport(context));

            // On the main thread the app is frozen after it, so that report stays. The same exception
            // handed in again is kept, since the first time gave its report back.
            HushThreadsPause.crashMarkForTests(new Delegate()).uncaughtException(Thread.currentThread(), swallowed);
            assertTrue(LogBufferManager.readCrashReport(context).contains("swallowed"));
        } finally {
            LogBufferManager.clearLogBuffer();
        }
    }

    private static final String EARLIER = "complete: true\nan earlier start's crash\n";

    /** A second thread's exception while the first one's handlers run, both swallowed. */
    @Test public void twoExceptionsSwallowedAtOnceLeaveTheEarlierReport() throws Exception {
        LogBufferManager.clearLogBuffer();
        try {
            LogBufferManager.persistCrashReport(context, EARLIER);
            start(null);
            Delegate outer = new Delegate();
            Delegate inner = new Delegate();
            String[] between = new String[1];
            outer.meanwhile = () -> {
                HushThreadsPause.crashMarkForTests(inner)
                        .uncaughtException(new Thread("second"), new IllegalStateException("second one"));
                between[0] = LogBufferManager.readCrashReport(context);
            };
            HushThreadsPause.crashMarkForTests(outer)
                    .uncaughtException(new Thread("first"), new IllegalStateException("first one"));

            assertTrue(inner.reports.toString(), inner.reports.get(0).contains("second one"));
            // The first can still end the process, so its report is the one back in place.
            assertTrue("the second one's return lost the first: " + between[0], between[0].contains("first one"));
            assertEquals(EARLIER, LogBufferManager.readCrashReport(context));
        } finally {
            LogBufferManager.clearLogBuffer();
        }
    }

    /**
     * One thread's handlers return while another's still have its exception: that one can still end
     * the process, so its report stays, and goes too if it's swallowed in turn.
     */
    @Test public void anExceptionSwallowedFirstLeavesTheOneStillBeingHandled() throws Exception {
        LogBufferManager.clearLogBuffer();
        try {
            LogBufferManager.persistCrashReport(context, EARLIER);
            start(null);
            Thread first = new Thread("first");
            Thread second = new Thread("second");
            JavaCrashReport.Saved one = JavaCrashReport.save(first, new IllegalStateException("first one"));
            JavaCrashReport.Saved two = JavaCrashReport.save(second, new IllegalStateException("second one"));
            JavaCrashReport.survived(first, one);
            assertTrue(LogBufferManager.readCrashReport(context).contains("second one"));
            JavaCrashReport.survived(second, two);
            assertEquals(EARLIER, LogBufferManager.readCrashReport(context));

            // A main-thread exception stays, so one swallowed over it gives it back.
            JavaCrashReport.Saved main = JavaCrashReport.save(Thread.currentThread(), new IllegalStateException("main thread"));
            JavaCrashReport.Saved worker = JavaCrashReport.save(second, new IllegalStateException("worker"));
            JavaCrashReport.survived(Thread.currentThread(), main);
            JavaCrashReport.survived(second, worker);
            assertTrue(LogBufferManager.readCrashReport(context).contains("main thread"));
        } finally {
            LogBufferManager.clearLogBuffer();
        }
    }

    /** Clear diagnostic data while the handlers have it: its Undo puts back the earlier crash. */
    @Test public void aClearWhileTheHandlersRunUndoesToTheEarlierReport() throws Exception {
        LogBufferManager.clearLogBuffer();
        try {
            LogBufferManager.persistCrashReport(context, EARLIER);
            start(null);
            Thread worker = new Thread("worker");
            JavaCrashReport.Saved saved = JavaCrashReport.save(worker, new IllegalStateException("swallowed"));
            LogBufferManager.clearLogBuffer();
            JavaCrashReport.survived(worker, saved);
            assertEquals("", LogBufferManager.readCrashReport(context));
            assertEquals(LogBufferManager.UndoResult.RESTORED, LogBufferManager.undoClear());
            assertEquals(EARLIER, LogBufferManager.readCrashReport(context));
        } finally {
            LogBufferManager.clearLogBuffer();
        }
    }

    @Test public void aReportThatCanNotBeBuiltStillHandsTheCrashOn() throws Exception {
        LogBufferManager.clearLogBuffer();
        try {
            LogBufferManager.persistCrashReport(context, "complete: true\nan earlier start's crash\n");
            start(null);
            Delegate delegate = new Delegate();
            Throwable unprintable = new IllegalStateException("unprintable") {
                @Override public void printStackTrace(java.io.PrintWriter writer) {
                    throw new IllegalStateException("no trace");
                }
            };
            HushThreadsPause.crashMarkForTests(delegate).uncaughtException(Thread.currentThread(), unprintable);
            // The earlier report standing shows the build threw before anything was written.
            assertEquals("complete: true\nan earlier start's crash\n", LogBufferManager.readCrashReport(context));
            assertEquals(Collections.singletonList(unprintable), delegate.handed);
            assertTrue(HushThreadsPause.read(record).trim().endsWith("crashed"));
        } finally {
            LogBufferManager.clearLogBuffer();
        }
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

    /** API 28 has no exit history: the real handler marker must drive a persisted safe-mode start. */
    @Test @Config(sdk = 28)
    public void platformApi28PersistsHandlerCrashRecoveryUntilResume() {
        start(null);
        for (int crash = 1; crash <= 3; crash++) {
            HushThreadsPause.markCrash();
            assertTrue("the handler didn't mark crash " + crash, HushThreadsPause.read(record).trim().endsWith("crashed"));
            HushThreadsPause.resetForTests();
            HushThreadsPause.onProcessStart(context);
            if (crash < 3) {
                assertEquals(Integer.toString(crash), HushThreadsPause.read(streak));
                assertFalse("safe mode started before the third crash", Setting.isPaused());
            }
        }
        assertSafeModeSurvivesHealthyStartsUntilResume();
    }

    /** Android 16's platform exit reason wins over a stale marker, then counts all crash kinds. */
    @Test @Config(sdk = 36)
    public void platformApi36PersistsExitHistoryCrashRecoveryUntilResume() {
        exited(7200, ApplicationExitInfo.REASON_USER_REQUESTED, 11_000);
        start("7200 1000 crashed");
        assertEquals("a force stop counted as a crash", "0", HushThreadsPause.read(streak));
        assertFalse(Setting.isPaused());
        int[] reasons = {ApplicationExitInfo.REASON_CRASH, ApplicationExitInfo.REASON_CRASH_NATIVE,
                ApplicationExitInfo.REASON_ANR};
        for (int index = 0; index < reasons.length; index++) {
            int pid = 7301 + index;
            exited(pid, reasons[index], 11_000);
            start(pid + " 1000");
            if (index < 2) {
                assertEquals(Integer.toString(index + 1), HushThreadsPause.read(streak));
                assertFalse("safe mode started before the third crash", Setting.isPaused());
            }
        }
        assertSafeModeSurvivesHealthyStartsUntilResume();
    }

    private void assertSafeModeSurvivesHealthyStartsUntilResume() {
        assertEquals(HushThreadsPause.Reason.CRASH_LOOP, HushThreadsPause.reason());
        assertTrue(Setting.isPaused());
        assertTrue("safe mode wasn't persisted", stored(BaseSettings.SAFE_MODE));
        assertFalse("crash recovery turned on the ordinary Pause switch", stored(BaseSettings.PAUSED));
        start(null);
        shadowOf(Looper.getMainLooper()).idleFor(HushThreadsPause.START_WINDOW_MS + 1, TimeUnit.MILLISECONDS);
        assertTrue("a healthy safe-mode start silently resumed the patches", BaseSettings.SAFE_MODE.savedValue());
        assertTrue(stored(BaseSettings.SAFE_MODE));
        assertTrue(HushThreadsPause.pausesNextStart(context));
        start(null);
        assertEquals(HushThreadsPause.Reason.CRASH_LOOP, HushThreadsPause.reason());

        assertEquals(HushThreadsPause.Reason.NONE, HushThreadsPause.turnBackOn(context));
        assertFalse(BaseSettings.SAFE_MODE.savedValue());
        assertFalse(stored(BaseSettings.SAFE_MODE));
        start(null);
        assertFalse(Setting.isPaused());
        assertFalse(HushThreadsPause.pausesNextStart(context));
    }
}
