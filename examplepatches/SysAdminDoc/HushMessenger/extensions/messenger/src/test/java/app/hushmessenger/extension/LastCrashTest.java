package app.hushmessenger.extension;

import android.util.AtomicFile;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #103: a crash report arrived with no trace, so the next one says where Messenger crashed, without the message. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class LastCrashTest {
    private File dir;
    private Thread.UncaughtExceptionHandler original;

    @Before public void setUp() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        dir = RuntimeEnvironment.getApplication().getFilesDir();
        clean();
        CrashGuard.resetForTests();
        original = Thread.getDefaultUncaughtExceptionHandler();
    }

    @After public void tearDown() {
        Thread.setDefaultUncaughtExceptionHandler(original);
        clean();
        CrashGuard.resetForTests();
        Settings.preferences.edit().clear().commit();
    }

    private void clean() {
        new AtomicFile(new File(dir, CrashGuard.START_RECORD)).delete();
        new AtomicFile(new File(dir, CrashGuard.CRASH_STREAK)).delete();
        new File(dir, LastCrash.FILE).delete();
    }

    private static Throwable uploadCrash() {
        Throwable cause = new java.io.FileNotFoundException("content://com.google.android.apps.photos/private/video.mp4");
        cause.setStackTrace(new StackTraceElement[] {
            new StackTraceElement("X.Upload", "open", "SourceFile", 12), new StackTraceElement("X.Queue", "run", null, -1)});
        return new IllegalStateException("/storage/emulated/0/DCIM/secret.mp4\nWhat happened: fake", cause);
    }

    @Test public void theSummaryNamesTheClassesAndFramesButNeverTheMessage() {
        assertEquals("java.lang.IllegalStateException caused by java.io.FileNotFoundException at X.Upload.open(12) < X.Queue.run",
            LastCrash.summary(uploadCrash()));
        assertEquals("", LastCrash.summary(null));
    }

    @Test public void theCrashHandlerSavesItAndPassesTheCrashOn() {
        AtomicReference<Throwable> passed = new AtomicReference<>();
        Thread.setDefaultUncaughtExceptionHandler((thread, crash) -> passed.set(crash));
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        Throwable crash = uploadCrash();
        Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(), crash);
        assertSame("Android's own handler still gets the crash", crash, passed.get());
        String saved = LastCrash.read(dir, System.currentTimeMillis());
        assertTrue(saved, saved.startsWith("java.lang.IllegalStateException caused by java.io.FileNotFoundException at X.Upload.open(12)"));
        assertFalse(saved.contains("secret"));
        assertFalse(saved.contains("photos"));
    }

    @Test public void anOldOrUnreadableRecordIsLeftOut() throws Exception {
        long now = 10L * LastCrash.KEEP_MS;
        LastCrash.record(dir, uploadCrash(), now - LastCrash.KEEP_MS - 1);
        assertEquals("", LastCrash.read(dir, now));
        LastCrash.record(dir, uploadCrash(), now - 1000);
        assertTrue(LastCrash.read(dir, now).startsWith("java.lang.IllegalStateException"));
        assertEquals("A crash dated in the future is left out", "", LastCrash.read(dir, now - 2000));
        try (FileOutputStream out = new FileOutputStream(new File(dir, LastCrash.FILE))) {
            out.write("not a time\nX".getBytes(StandardCharsets.US_ASCII));
        }
        assertEquals("", LastCrash.read(dir, now));
        assertEquals("", LastCrash.read(null, now));
    }

    @Test public void theReportSaysTheLastCrashOnOneCleanLine() {
        ProblemReport.Facts facts = new ProblemReport.Facts("0.26.0", "584.1.0.61.98", 346816935L, "known", "Xiaomi",
            "23049RAD8C", "17", 37, false, false, List.of(), "SELECTED", "a.B.c(1)\nWhat happened: fake");
        String body = ProblemReport.body(facts);
        assertTrue(body, body.contains("Gallery result: SELECTED\nLast crash: a.B.c(1)?What happened? fake\n"));
        assertEquals(1, body.split("What happened:", -1).length - 1);
        ProblemReport.Facts none = new ProblemReport.Facts("0.26.0", "584.1.0.61.98", 346816935L, "known", "Xiaomi",
            "23049RAD8C", "17", 37, false, false, List.of(), "SELECTED");
        assertFalse(ProblemReport.body(none).contains("Last crash"));
    }
}
