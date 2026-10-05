package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.util.AtomicFile;
import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Proxy;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
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
@Config(sdk = {28, 29, 36})
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
        new AtomicFile(new File(dir, CrashGuard.START_RECORD)).delete();
        new AtomicFile(new File(dir, CrashGuard.CRASH_STREAK)).delete();
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
        assertTrue(org.robolectric.shadows.ShadowLog.getLogs().toString(), CrashGuard.write(f, "hello"));
        assertEquals("hello", CrashGuard.read(f));
        assertTrue(org.robolectric.shadows.ShadowLog.getLogs().toString(), CrashGuard.write(f, "replacement"));
        assertEquals("replacement", CrashGuard.read(f));
        f.delete();
    }

    @Test public void interruptedAtomicWriteRetainsThePreviousLegacyRecord() throws Exception {
        File file = new File(dir, "test-interrupted-record");
        AtomicFile atomic = new AtomicFile(file);
        try {
            java.nio.file.Files.write(file.toPath(), "999 123 crashed".getBytes(StandardCharsets.US_ASCII));
            var interrupted = atomic.startWrite();
            interrupted.write("partial".getBytes(StandardCharsets.US_ASCII));
            interrupted.close(); // Model a process exiting before finishWrite or failWrite.
            assertEquals("999 123 crashed", CrashGuard.read(file));
        } finally { atomic.delete(); }
    }

    @Test public void partialAndSilentFinishFailuresKeepCompleteEvidenceAndReportFailure() throws Exception {
        File file = new File(dir, "test-failed-record");
        try {
            for (boolean silentFinish : new boolean[] {false, true}) {
                CrashGuard.atomicFiles = AtomicFile::new;
                assertTrue(CrashGuard.write(file, "999 123 crashed"));
                CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                    @Override public FileOutputStream startWrite() throws IOException {
                        var output = super.startWrite();
                        if (silentFinish) return output;
                        return new FileOutputStream(output.getFD()) {
                            @Override public void write(byte[] bytes) throws IOException {
                                output.write(bytes, 0, bytes.length / 2);
                                throw new IOException("private storage details");
                            }
                            @Override public void close() throws IOException { output.close(); }
                        };
                    }
                    @Override public void finishWrite(FileOutputStream output) {
                        if (silentFinish) {
                            try { output.close(); } catch (IOException error) { throw new IllegalStateException(error); }
                        } else super.finishWrite(output);
                    }
                };
                assertFalse(CrashGuard.write(file, "1000 456"));
                CrashGuard.atomicFiles = AtomicFile::new;
                assertEquals("999 123 crashed", CrashGuard.read(file));
            }
            assertSanitizedPersistenceFailure();
        } finally { CrashGuard.atomicFiles = AtomicFile::new; new AtomicFile(file).delete(); }
    }

    @Test public void missingCorruptAndFailedReadsNeverValidateAReplacement() throws Exception {
        File file = new File(dir, "test-invalid-record");
        try {
            assertNull(CrashGuard.read(file));
            for (byte[] bytes : new byte[][] {new byte[0], new byte[] {(byte) 255}, "x".repeat(65).getBytes(StandardCharsets.US_ASCII)}) {
                java.nio.file.Files.write(file.toPath(), bytes);
                assertNull(CrashGuard.read(file));
            }
            assertFalse(CrashGuard.write(file, "x".repeat(65)));
            assertTrue(CrashGuard.write(file, "999 123 crashed"));
            CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                @Override public java.io.FileInputStream openRead() throws java.io.FileNotFoundException {
                    throw new java.io.FileNotFoundException("private storage details");
                }
            };
            assertNull(CrashGuard.read(file));
            CrashGuard.stagedInput = target -> { throw new IOException("private storage details"); };
            assertFalse(CrashGuard.write(file, "1000 456"));
            CrashGuard.atomicFiles = AtomicFile::new;
            CrashGuard.stagedInput = java.io.FileInputStream::new;
            assertEquals("999 123 crashed", CrashGuard.read(file));
            assertSanitizedPersistenceFailure();
        } finally { CrashGuard.atomicFiles = AtomicFile::new; CrashGuard.stagedInput = java.io.FileInputStream::new; new AtomicFile(file).delete(); }
    }

    @Test public void stagedVerificationFailurePreservesThePriorCompleteRecord() throws Exception {
        File file = new File(dir, "test-staged-verification");
        try {
            assertTrue(CrashGuard.write(file, "999 123 crashed"));
            CrashGuard.stagedInput = target -> { throw new IOException("private storage details"); };
            assertFalse(CrashGuard.write(file, "1000 456"));
            CrashGuard.stagedInput = java.io.FileInputStream::new;
            assertEquals("999 123 crashed", CrashGuard.read(file));
            CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                @Override public java.io.FileInputStream openRead() throws java.io.FileNotFoundException {
                    throw new java.io.FileNotFoundException("private storage details");
                }
            };
            // There is no fallible verification read after committing and discarding the backup.
            assertTrue(CrashGuard.write(file, "1000 456"));
            CrashGuard.atomicFiles = AtomicFile::new;
            assertEquals("1000 456", CrashGuard.read(file));
            assertFalse(new File(file.getPath() + ".bak").exists());
            assertFalse(new File(file.getPath() + ".new").exists());
        } finally {
            CrashGuard.stagedInput = java.io.FileInputStream::new;
            CrashGuard.atomicFiles = AtomicFile::new;
            new AtomicFile(file).delete();
        }
    }

    @Test public void legacyBackupRenameFailureNeverStartsADestructiveWrite() {
        File real = new File(dir, "test-backup-rename");
        File failedRename = new File(real.getPath()) {
            @Override public boolean renameTo(File target) { return false; }
        };
        var opened = new java.util.concurrent.atomic.AtomicBoolean();
        try {
            assertTrue(CrashGuard.write(real, "999 123 crashed"));
            CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                @Override public FileOutputStream startWrite() throws IOException {
                    opened.set(true);
                    var output = super.startWrite();
                    return new FileOutputStream(output.getFD()) {
                        @Override public void write(byte[] bytes) throws IOException {
                            output.write(bytes, 0, 3);
                            throw new IOException("private storage details");
                        }
                        @Override public void close() throws IOException { output.close(); }
                    };
                }
            };
            assertFalse(CrashGuard.write(failedRename, "1000 456"));
            assertEquals(android.os.Build.VERSION.SDK_INT > 29, opened.get());
            CrashGuard.atomicFiles = AtomicFile::new;
            assertEquals("999 123 crashed", CrashGuard.read(real));
        } finally { CrashGuard.atomicFiles = AtomicFile::new; new AtomicFile(real).delete(); }
    }

    @Test public void completedWriteDoesNotUseAFalliblePostCommitReadOrRollback() {
        File real = new File(dir, "test-completed-record");
        var committed = new java.util.concurrent.atomic.AtomicBoolean();
        var readAfterCommit = new java.util.concurrent.atomic.AtomicBoolean();
        var rolledBack = new java.util.concurrent.atomic.AtomicBoolean();
        try {
            assertTrue(CrashGuard.write(real, "999 123 crashed"));
            CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                @Override public void finishWrite(FileOutputStream output) {
                    super.finishWrite(output);
                    committed.set(true);
                }
                @Override public FileInputStream openRead() throws java.io.FileNotFoundException {
                    if (committed.get()) {
                        readAfterCommit.set(true);
                        throw new java.io.FileNotFoundException("Post-commit read failed");
                    }
                    return super.openRead();
                }
                @Override public void failWrite(FileOutputStream output) {
                    rolledBack.set(true);
                    super.failWrite(output);
                }
            };
            CrashGuard.stagedInput = target -> {
                if (committed.get()) {
                    readAfterCommit.set(true);
                    throw new IOException("Post-commit staged read failed");
                }
                return new FileInputStream(target);
            };
            assertTrue(CrashGuard.write(real, "1000 456"));
            assertTrue(committed.get());
            assertFalse(readAfterCommit.get());
            assertFalse(rolledBack.get());
            CrashGuard.atomicFiles = AtomicFile::new;
            CrashGuard.stagedInput = FileInputStream::new;
            assertEquals("1000 456", CrashGuard.read(real));
        } finally {
            CrashGuard.atomicFiles = AtomicFile::new;
            CrashGuard.stagedInput = FileInputStream::new;
            new AtomicFile(real).delete();
        }
    }

    @Test public void failedSafeModeCommitKeepsRuntimeProtectionAndTheCrashCount() {
        SharedPreferences original = Settings.preferences;
        try {
            for (boolean throwing : new boolean[] {false, true}) {
                original.edit().clear().putBoolean("stories", true).commit();
                CrashGuard.resetForTests();
                CrashGuard.write(new File(dir, CrashGuard.START_RECORD), "999 " + System.currentTimeMillis() + " crashed");
                CrashGuard.write(new File(dir, CrashGuard.CRASH_STREAK), "2");
                Settings.preferences = failedCommits(original, throwing);
                CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
                assertTrue(CrashGuard.isSafeMode());
                assertFalse(original.getBoolean("safe_mode", false));
                assertEquals("3", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
                assertTrue(original.getBoolean("stories", false));
                assertSanitizedPersistenceFailure();
            }
        } finally { Settings.preferences = original; }
    }

    @Test public void failedResumeDoesNotClearSafeModeOrItsEvidence() {
        SharedPreferences original = Settings.preferences;
        original.edit().putBoolean("safe_mode", true).putBoolean("stories", true).putBoolean("paused", true).commit();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        File streak = new File(dir, CrashGuard.CRASH_STREAK);
        CrashGuard.write(streak, "2");
        try {
            for (boolean throwing : new boolean[] {false, true}) {
                Settings.preferences = failedCommits(original, throwing);
                assertFalse(CrashGuard.clearSafeMode());
                assertTrue(CrashGuard.isSafeMode());
                assertTrue(original.getBoolean("safe_mode", false));
                assertTrue(original.getBoolean("paused", false));
                assertEquals("2", CrashGuard.read(streak));
            }
            Settings.preferences = original;
            CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                @Override public FileOutputStream startWrite() throws IOException { throw new IOException("private storage details"); }
            };
            assertFalse(CrashGuard.clearSafeMode());
            assertTrue(CrashGuard.isSafeMode());
            assertTrue(original.getBoolean("safe_mode", false));
            assertEquals("2", CrashGuard.read(streak));
            String start = CrashGuard.read(new File(dir, CrashGuard.START_RECORD));
            CrashGuard.survivedTheStart();
            assertEquals(start, CrashGuard.read(new File(dir, CrashGuard.START_RECORD)));
            assertSanitizedPersistenceFailure();
        } finally { Settings.preferences = original; CrashGuard.atomicFiles = AtomicFile::new; }
    }

    @Test public void corruptStartNumbersDoNotResetTheExistingCrashCount() {
        for (String record : new String[] {"broken", "999999999999 123", "999 99999999999999999999", "-1 123"}) {
            CrashGuard.resetForTests();
            assertTrue(CrashGuard.write(new File(dir, CrashGuard.START_RECORD), record));
            assertTrue(CrashGuard.write(new File(dir, CrashGuard.CRASH_STREAK), "2"));
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            assertEquals("2", CrashGuard.read(new File(dir, CrashGuard.CRASH_STREAK)));
            assertSanitizedPersistenceFailure();
        }
    }

    @Test public void unreadableCrashCountStillReachesSafeModeAtTheCleanThreshold() throws Exception {
        File streak = new File(dir, CrashGuard.CRASH_STREAK), staging = new File(streak.getPath() + ".new");
        assertEquals(CrashGuard.THRESHOLD + 1, crashingStartsUntilSafeMode());
        // An interrupted legacy write leaves an empty file; API 30+ can leave only an orphaned staging file.
        var leftovers = new java.util.ArrayList<java.util.Map.Entry<File, byte[]>>(java.util.List.of(
            java.util.Map.entry(streak, new byte[0]), java.util.Map.entry(streak, "garbage".getBytes(StandardCharsets.US_ASCII)),
            java.util.Map.entry(streak, "-1".getBytes(StandardCharsets.US_ASCII))));
        if (android.os.Build.VERSION.SDK_INT >= 30) leftovers.add(java.util.Map.entry(staging, "2".getBytes(StandardCharsets.US_ASCII)));
        try {
            for (var leftover : leftovers) {
                prefs.edit().clear().commit();
                cleanFiles();
                staging.delete();
                java.nio.file.Files.write(leftover.getKey().toPath(), leftover.getValue());
                assertEquals(leftover.getKey().getName() + " " + leftover.getValue().length,
                    CrashGuard.THRESHOLD + 1, crashingStartsUntilSafeMode());
                assertTrue(prefs.getBoolean("safe_mode", false));
                assertFalse(staging.exists());
            }
        } finally { staging.delete(); }
    }

    /** Starts that crash inside the window, counted until safe mode engages, or -1 if it never does. */
    private int crashingStartsUntilSafeMode() {
        for (int start = 1; start <= 3 * CrashGuard.THRESHOLD; start++) {
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (CrashGuard.isSafeMode()) return start;
            CrashGuard.markCrash();
        }
        return -1;
    }

    @Test public void recoveryCannotSucceedWhenTheRecordDirectoryIsUnavailable() {
        prefs.edit().putBoolean("safe_mode", true).commit();
        CrashGuard.onProcessStart(new android.content.ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getFilesDir() { throw new IllegalStateException("private storage details"); }
        });
        assertTrue(CrashGuard.isSafeMode());
        assertFalse(CrashGuard.clearSafeMode());
        assertTrue(CrashGuard.isSafeMode());
        assertTrue(prefs.getBoolean("safe_mode", false));
        assertSanitizedPersistenceFailure();
    }

    @Test public void readersWaitForTheCompleteReplacement() throws Exception {
        File file = new File(dir, "test-serialized-record");
        CountDownLatch partial = new CountDownLatch(1), release = new CountDownLatch(1), readerStarted = new CountDownLatch(1), read = new CountDownLatch(1);
        var result = new java.util.concurrent.atomic.AtomicReference<String>();
        var written = new java.util.concurrent.atomic.AtomicBoolean();
        Thread writer = null, reader = null;
        try {
            assertTrue(CrashGuard.write(file, "old complete"));
            CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                @Override public FileOutputStream startWrite() throws IOException {
                    var output = super.startWrite();
                    return new FileOutputStream(output.getFD()) {
                        @Override public void write(byte[] bytes) throws IOException {
                            output.write(bytes, 0, 3);
                            partial.countDown();
                            try { if (!release.await(5, TimeUnit.SECONDS)) throw new IOException("Fixture timed out"); }
                            catch (InterruptedException error) { throw new IOException(error); }
                            output.write(bytes, 3, bytes.length - 3);
                        }
                        @Override public void close() throws IOException { output.close(); }
                    };
                }
            };
            writer = new Thread(() -> written.set(CrashGuard.write(file, "new complete")));
            reader = new Thread(() -> { readerStarted.countDown(); result.set(CrashGuard.read(file)); read.countDown(); });
            writer.start();
            assertTrue(partial.await(5, TimeUnit.SECONDS));
            reader.start();
            assertTrue(readerStarted.await(5, TimeUnit.SECONDS));
            assertFalse(read.await(100, TimeUnit.MILLISECONDS));
            release.countDown();
            writer.join(5000);
            reader.join(5000);
            assertTrue(written.get());
            assertEquals("new complete", result.get());
        } finally {
            release.countDown();
            if (writer != null) writer.join(5000);
            if (reader != null) reader.join(5000);
            CrashGuard.atomicFiles = AtomicFile::new;
            new AtomicFile(file).delete();
        }
    }

    @Test public void uncaughtHandlerStillDelegatesAfterARecordFailure() {
        var prior = Thread.getDefaultUncaughtExceptionHandler();
        var delegated = new java.util.concurrent.atomic.AtomicBoolean();
        try {
            Thread.setDefaultUncaughtExceptionHandler((thread, error) -> delegated.set(true));
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            CrashGuard.atomicFiles = target -> new AtomicFile(target) {
                @Override public FileOutputStream startWrite() throws IOException { throw new IOException("private storage details"); }
            };
            Thread.getDefaultUncaughtExceptionHandler().uncaughtException(Thread.currentThread(), new IllegalStateException("failure"));
            assertTrue(delegated.get());
            assertSanitizedPersistenceFailure();
        } finally { Thread.setDefaultUncaughtExceptionHandler(prior); }
    }

    @Test @Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    public void failedRecoveryKeepsTheActionAndPauseChoiceVisible() throws Exception {
        for (boolean light : new boolean[] {false, true}) for (float scale : new float[] {1f, 2f}) {
            RuntimeEnvironment.setFontScale(scale);
            prefs.edit().clear().putBoolean("safe_mode", true).putBoolean("paused", true).putBoolean("light", light).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            try (var screen = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
                var root = screen.get().getWindow().getDecorView();
                var action = (android.widget.Button) root.findViewWithTag("resume_safe_mode");
                Settings.preferences = failedCommits(prefs, false);
                assertTrue(action.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
                assertTrue(CrashGuard.isSafeMode());
                assertTrue(prefs.getBoolean("paused", false));
                assertEquals(android.view.View.VISIBLE, action.getVisibility());
                assertEquals("Couldn't save safe mode. Changes stay paused. Try again.",
                    org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
                var pause = (android.widget.Switch) root.findViewWithTag("paused");
                assertNotNull(pause);
                pause.setChecked(false);
                assertTrue(pause.isChecked());
                assertTrue(prefs.getBoolean("paused", false));
                assertTrue(CrashGuard.isSafeMode());
                for (int pass = 0; pass < 3; pass++) {
                    root.measure(android.view.View.MeasureSpec.makeMeasureSpec(411, android.view.View.MeasureSpec.EXACTLY),
                        android.view.View.MeasureSpec.makeMeasureSpec(914, android.view.View.MeasureSpec.EXACTLY));
                    root.layout(0, 0, 411, 914);
                    if (pass == 1) action.requestRectangleOnScreen(new android.graphics.Rect(0, 0, action.getWidth(), action.getHeight()), true);
                    Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                }
                var visible = new android.graphics.Rect();
                assertTrue(action.getGlobalVisibleRect(visible));
                assertEquals(action.getHeight(), visible.height());
                String output = System.getenv("HUSH_SETTINGS_CAPTURES");
                if (output != null) {
                    var directory = java.nio.file.Path.of(output);
                    java.nio.file.Files.createDirectories(directory);
                    var pixels = android.graphics.Bitmap.createBitmap(411, 914, android.graphics.Bitmap.Config.ARGB_8888);
                    root.draw(new android.graphics.Canvas(pixels));
                    try (var stream = java.nio.file.Files.newOutputStream(directory.resolve("safe-mode-" + (light ? "light" : "dark") + "-" + (int) scale + ".png"))) {
                        assertTrue(pixels.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream));
                    } finally { pixels.recycle(); }
                }
            } finally { Settings.preferences = prefs; RuntimeEnvironment.setFontScale(1f); }
        }
    }

    private static SharedPreferences failedCommits(SharedPreferences original, boolean throwing) {
        var editor = (SharedPreferences.Editor) Proxy.newProxyInstance(CrashGuardTest.class.getClassLoader(),
            new Class<?>[] {SharedPreferences.Editor.class}, (proxy, method, args) -> {
                if (method.getName().equals("commit")) {
                    if (throwing) throw new IllegalStateException("private storage details");
                    return false;
                }
                return proxy;
            });
        return (SharedPreferences) Proxy.newProxyInstance(CrashGuardTest.class.getClassLoader(),
            new Class<?>[] {SharedPreferences.class}, (proxy, method, args) ->
                method.getName().equals("edit") ? editor : method.invoke(original, args));
    }

    private static void assertSanitizedPersistenceFailure() {
        var logs = org.robolectric.shadows.ShadowLog.getLogsForTag("HushMessenger");
        assertTrue(logs.stream().anyMatch(log -> log.msg.contains("persistence failed")));
        assertTrue(logs.stream().noneMatch(log -> log.throwable != null || log.msg.contains("private storage details")));
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
