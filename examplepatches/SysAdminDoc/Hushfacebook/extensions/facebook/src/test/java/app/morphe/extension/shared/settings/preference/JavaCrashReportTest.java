/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;

/**
 * A Java crash is kept with its whole trace for the next diagnostic report (#94), once for each
 * exception, and nothing that isn't a crash takes its place: not a missing one, and not one off the
 * main thread that Facebook swallowed.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 30)
public class JavaCrashReportTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;

    @Before
    public void start() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        BaseSettings.DEBUG_LOG_FILTERS.save("all");
        LogBufferManager.clearLogBuffer();
        JavaCrashReport.resetForTests();
    }

    @After
    public void finish() {
        LogBufferManager.clearLogBuffer();
        JavaCrashReport.resetForTests();
    }

    @Test
    public void aCrashIsInTheNextReportWithItsWholeTrace() {
        assertEquals("a crash was already kept", "", LogBufferManager.readCrashReport(context));
        Throwable crash = new IllegalStateException("outer", new NullPointerException("inner cause"));
        JavaCrashReport.save(new Thread("CombinedTP7"), crash);

        String kept = LogBufferManager.readCrashReport(context);
        assertTrue(kept, kept.contains("exception: java.lang.IllegalStateException\n"));
        assertTrue(kept, kept.contains("thread: CombinedTP7\n"));
        assertTrue("the cause was left out: " + kept,
                kept.contains("Caused by: java.lang.NullPointerException: inner cause"));
        assertTrue("the frames were left out: " + kept,
                kept.contains("at " + JavaCrashReportTest.class.getName() + ".aCrashIsInTheNextReportWithItsWholeTrace"));

        String report = LogBufferManager.buildExportText();
        assertTrue("the report has no crash section: " + report, report.contains("[LATEST JAVA CRASH]"));
        assertTrue(report, report.contains("Caused by: java.lang.NullPointerException: inner cause"));
    }

    @Test
    public void theSameCrashHandedBackIsKeptOnceAndALaterOneReplacesIt() {
        Throwable first = new IllegalStateException("the first");
        assertEquals("nothing was kept before it", "", JavaCrashReport.save(Thread.currentThread(), first));
        // A handler Facebook put in front of ours can hand the same crash back to the one under it.
        assertNull("the same crash was written again", JavaCrashReport.save(Thread.currentThread(), first));
        assertTrue(LogBufferManager.readCrashReport(context).contains("java.lang.IllegalStateException: the first"));

        JavaCrashReport.save(Thread.currentThread(), new IllegalArgumentException("the second"));
        String kept = LogBufferManager.readCrashReport(context);
        assertTrue(kept, kept.contains("java.lang.IllegalArgumentException: the second"));
        assertFalse("the earlier crash is still there: " + kept, kept.contains("the first"));
    }

    /**
     * An exception off the main thread that one of Facebook's handlers swallowed ended nothing, so
     * the report goes back to the crash it held. One on the main thread stays: Facebook freezes.
     */
    @Test
    public void aSwallowedExceptionOffTheMainThreadPutsTheEarlierCrashBack() throws Exception {
        LogBufferManager.persistCrashReport(context, "an earlier start's crash");
        Thread worker = new Thread("CombinedTP3");
        String before = JavaCrashReport.save(worker, new IllegalStateException("swallowed"));
        assertTrue("the exception wasn't written first", LogBufferManager.readCrashReport(context).contains("swallowed"));
        JavaCrashReport.survived(worker, before);
        String kept = LogBufferManager.readCrashReport(context);
        assertTrue(kept, kept.contains("an earlier start's crash"));
        assertFalse(kept, kept.contains("swallowed"));

        String main = JavaCrashReport.save(Thread.currentThread(), new IllegalStateException("on the main thread"));
        JavaCrashReport.survived(Thread.currentThread(), main);
        assertTrue("the control: on the main thread the trace stays",
                LogBufferManager.readCrashReport(context).contains("java.lang.IllegalStateException: on the main thread"));
    }

    @Test
    public void nothingToKeepLeavesTheNextCrashItsPlace() {
        JavaCrashReport.save(Thread.currentThread(), null);
        assertEquals("", LogBufferManager.readCrashReport(context));

        JavaCrashReport.save(null, new IllegalStateException("after"));
        String kept = LogBufferManager.readCrashReport(context);
        assertTrue(kept, kept.contains("java.lang.IllegalStateException: after"));
        assertTrue(kept, kept.contains("thread: unknown\n"));
    }
}
