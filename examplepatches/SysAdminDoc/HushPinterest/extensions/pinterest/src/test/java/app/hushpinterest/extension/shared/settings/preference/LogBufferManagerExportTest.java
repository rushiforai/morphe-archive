/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.hushpinterest.extension.shared.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import app.hushpinterest.extension.shared.SettingsContextRule;
import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.ContextWrapper;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 30)
public class LogBufferManagerExportTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Test @Config(sdk = {28, 29, 30}) public void thePreferenceNamesTheDirectoryUsedByItsWriter() {
        Context context = RuntimeEnvironment.getApplication();
        String directory = Build.VERSION.SDK_INT < 29
                ? new java.io.File(context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), "Morphe").getAbsolutePath()
                : Environment.DIRECTORY_DOWNLOADS + "/Morphe";
        ExportDiagnosticReportPreference preference = new ExportDiagnosticReportPreference(context);

        assertEquals("Copy a quick report or save the full one to "
                + app.hushpinterest.extension.shared.L10n.isolate(directory)
                + ". Links, IDs, cookies and sign-in tokens are left out. Check it for other private text before you share it.",
                preference.getSummary());
        assertEquals("Save the full report in " + app.hushpinterest.extension.shared.L10n.isolate(directory) + ".",
                preference.fullReportSummary());
    }

    @Test @Config(sdk = {29, 30}) public void theSavedLocationUsesTheProvidersFolderAndName() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Downloads downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
        downloads.assignedDirectory = Environment.DIRECTORY_DOWNLOADS + "/Reports/";
        downloads.assignedName = "report (1).txt";
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(downloads.uriFor(1), new ByteArrayOutputStream());

        assertEquals(downloads.assignedDirectory + downloads.assignedName,
                LogBufferManager.writeToFile(context, "MORPHE DIAGNOSTIC REPORT\nschema: 1\n"));
    }

    @Test public void noExitOnRecordMeansNoLastExitSection() {
        // Android has kept no exit for this process yet, so the section has to be absent rather
        // than empty or guessed at.
        app.hushpinterest.extension.shared.Utils.setContext(RuntimeEnvironment.getApplication());
        app.hushpinterest.extension.shared.settings.BaseSettings.DEBUG_LOG_FILTERS.save("all");
        app.hushpinterest.extension.shared.diagnostics.HookStatus.clear();
        LogBufferManager.clearLogBuffer();
        app.hushpinterest.extension.shared.diagnostics.HookStatus.missingViewId("Hide ads", "jlk");

        String report = LogBufferManager.buildExportText();
        assertNotEquals("nothing was reported at all", "", report);
        assertTrue("the report claimed to know why the process went away: " + report,
                report.indexOf("[LAST EXIT]") < 0);
    }

    @Test
    public void theReportSaysWhyTheProcessWentAwayLastTime() throws Exception {
        // A Java crash handler sees none of the ways the system ends an app. Android 17 kills one
        // that goes over a RAM-proportional limit and leaves only this behind.
        app.hushpinterest.extension.shared.Utils.setContext(RuntimeEnvironment.getApplication());
        app.hushpinterest.extension.shared.settings.BaseSettings.DEBUG_LOG_FILTERS.save("all");
        app.hushpinterest.extension.shared.diagnostics.HookStatus.clear();
        LogBufferManager.clearLogBuffer();

        android.app.ApplicationExitInfo exit =
                org.robolectric.shadows.ShadowActivityManager.ApplicationExitInfoBuilder.newBuilder()
                .setReason(13)
                .setTimestamp(1757260800000L)
                .setProcessName(RuntimeEnvironment.getApplication().getPackageName())
                .setDescription("MemoryLimiter:AnonSwap")
                .build();

        // Pinterest runs several processes, and the most recent record is routinely a background
        // helper the system reaped. Reporting that as why the app went away is worse than saying
        // nothing, so the newer of the two here must be passed over.
        android.app.ApplicationExitInfo helper = org.robolectric.shadows.ShadowActivityManager
                .ApplicationExitInfoBuilder.newBuilder()
                .setReason(10)
                .setTimestamp(1757260900000L)
                .setProcessName(RuntimeEnvironment.getApplication().getPackageName() + ":push")
                .setDescription("a background helper nobody asked about")
                .build();
        android.app.ActivityManager manager = (android.app.ActivityManager) RuntimeEnvironment
                .getApplication().getSystemService(Context.ACTIVITY_SERVICE);
        org.robolectric.Shadows.shadowOf(manager).addApplicationExitInfo(exit);
        org.robolectric.Shadows.shadowOf(manager).addApplicationExitInfo(helper);

        // Every report asked for carries the line, a healthy one with nothing else found included.
        String report = LogBufferManager.buildExportText();
        assertTrue("the report does not say why the process went away: " + report,
                report.contains("[LAST EXIT]"));
        assertTrue("the reason was not named: " + report, report.contains("reason: OTHER"));
        assertTrue("the description the kill carried was dropped: " + report,
                report.contains("MemoryLimiter:AnonSwap"));
        assertTrue("a background helper's exit was reported as the app's: " + report,
                report.indexOf("a background helper nobody asked about") < 0);
        java.text.SimpleDateFormat utc =
                new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", java.util.Locale.US);
        utc.setTimeZone(java.util.TimeZone.getTimeZone("UTC"));
        String when = utc.format(new java.util.Date(1757260800000L));
        assertTrue("the time it happened was left out or in another format: " + report,
                report.contains(when));
    }

    /**
     * On Android 10 and newer, the report goes through MediaStore into
     * Download/Morphe. The path handed back is the name MediaStore gave the file, which differs
     * from the one asked for when a file of that name is already there.
     */
    @Test public void repeatedExportsEachGetTheirOwnDownloadsEntry() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Downloads downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
        ByteArrayOutputStream firstBody = new ByteArrayOutputStream();
        ByteArrayOutputStream secondBody = new ByteArrayOutputStream();
        ShadowContentResolver resolver = Shadows.shadowOf(context.getContentResolver());
        resolver.registerOutputStream(downloads.uriFor(1), firstBody);
        resolver.registerOutputStream(downloads.uriFor(2), secondBody);

        String report = "MORPHE DIAGNOSTIC REPORT\nschema: 1\n";
        String first = LogBufferManager.writeToFile(context, report);
        String second = LogBufferManager.writeToFile(context, report);

        String folder = Environment.DIRECTORY_DOWNLOADS + "/Morphe/";
        assertTrue(first, first.startsWith(folder + "morphe-diagnostics-") && first.endsWith(".txt"));
        assertTrue(second, second.startsWith(folder + "morphe-diagnostics-") && second.endsWith(".txt"));
        assertNotEquals(first, second);
        assertEquals(folder + downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME), first);
        assertEquals(folder + downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME), second);
        for (int id = 1; id <= 2; id++) {
            assertEquals("entry " + id + " was left pending", Integer.valueOf(0),
                    downloads.row(id).getAsInteger(MediaStore.MediaColumns.IS_PENDING));
            assertEquals(Environment.DIRECTORY_DOWNLOADS + "/Morphe",
                    downloads.row(id).getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        }
        assertEquals(report, firstBody.toString(StandardCharsets.UTF_8.name()));
        assertEquals(report, secondBody.toString(StandardCharsets.UTF_8.name()));
    }

    /**
     * Android 9 has no Downloads collection in MediaStore, so the report goes into the app's own
     * folder on shared storage, which needs no permission there, and the path handed back is where
     * it went.
     */
    @Test @Config(sdk = 28) public void onAndroid9TheReportGoesIntoTheAppsOwnFolder() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        String report = "MORPHE DIAGNOSTIC REPORT\nschema: 1\n";

        String first = LogBufferManager.writeToFile(context, report);
        String second = LogBufferManager.writeToFile(context, report);

        java.io.File folder = new java.io.File(context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), "Morphe");
        for (String saved : new String[]{first, second}) {
            java.io.File file = new java.io.File(saved);
            assertEquals(folder.getAbsolutePath(), file.getParent());
            assertTrue(saved, file.getName().startsWith("morphe-diagnostics-") && file.getName().endsWith(".txt"));
            assertEquals(report, new String(java.nio.file.Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
        }
        assertNotEquals(first, second);
    }

    @Test @Config(sdk = 28) public void android9SaveFeedbackNamesTheFileInThePreferenceDirectory() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        File folder = new File(LogBufferManager.fileExportDirectory(context));
        String[] existing = folder.list();
        java.util.List<String> before = existing == null ? java.util.Collections.emptyList() : java.util.Arrays.asList(existing);

        LogBufferManager.exportToFile();
        app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();
        org.robolectric.shadows.ShadowLooper.idleMainLooper();

        File[] created = folder.listFiles(file -> !before.contains(file.getName()));
        assertNotNull("the export created no folder", created);
        assertEquals("the export didn't create exactly one report", 1, created.length);
        assertEquals("Full report saved to " + app.hushpinterest.extension.shared.L10n.isolate(created[0].getAbsolutePath()),
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        String summary = new ExportDiagnosticReportPreference(context).getSummary().toString();
        assertTrue(summary, summary.contains(app.hushpinterest.extension.shared.L10n.isolate(created[0].getParent())));
    }

    @Test @Config(sdk = 28) public void unavailableAndroid9StorageDoesNotPromiseAFolderOrReportASave() throws Exception {
        Context context = withExternalDownloads(null);
        ExportDiagnosticReportPreference preference = new ExportDiagnosticReportPreference(context);
        assertEquals("Copy a quick report. Report storage is unavailable right now. Links, IDs, cookies "
                + "and sign-in tokens are left out. Check it for other private text before you share it.", preference.getSummary());
        assertEquals("Report storage is unavailable right now. You can still copy a quick report.", preference.fullReportSummary());
        assertThrows(IOException.class, () -> LogBufferManager.writeToFile(context, "report"));
        app.hushpinterest.extension.shared.Utils.setContext(context);
        assertExportFails();
    }

    @Test @Config(sdk = 28) public void anUnavailableReportDirectoryLeavesTheExistingFileAlone() throws Exception {
        File downloads = new File(RuntimeEnvironment.getApplication().getCacheDir(), "diagnostic-storage");
        assertTrue(downloads.mkdirs());
        File existing = new File(downloads, "Morphe");
        java.nio.file.Files.write(existing.toPath(), "keep this file".getBytes(StandardCharsets.UTF_8));
        Context context = withExternalDownloads(downloads);
        app.hushpinterest.extension.shared.Utils.setContext(context);

        assertExportFails();

        assertEquals("keep this file", new String(java.nio.file.Files.readAllBytes(existing.toPath()), StandardCharsets.UTF_8));
    }

    private static Context withExternalDownloads(File downloads) {
        return new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getExternalFilesDir(String type) {
                assertEquals(Environment.DIRECTORY_DOWNLOADS, type);
                return downloads;
            }

            @Override public Context getApplicationContext() {
                return this;
            }
        };
    }

    @Test @Config(sdk = {29, 30}) public void aFailedWriteRemovesThePendingEntryAndAllowsAnotherSave() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Downloads downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(downloads.uriFor(1), new OutputStream() {
            @Override public void write(int value) throws IOException {
                throw new IOException("synthetic private provider detail");
            }
        });

        assertExportFails();
        assertFalse("the incomplete report was left behind", downloads.rows.containsKey(1L));
        ByteArrayOutputStream retry = new ByteArrayOutputStream();
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(downloads.uriFor(2), retry);
        LogBufferManager.exportToFile();
        app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();
        org.robolectric.shadows.ShadowLooper.idleMainLooper();
        assertTrue("the failure prevented a later save", retry.size() > 0);
        assertEquals("Full report saved to " + app.hushpinterest.extension.shared.L10n.isolate(
                Environment.DIRECTORY_DOWNLOADS + "/Morphe/" + downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME)),
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
    }

    @Test @Config(sdk = {29, 30}) public void aFailedPublishRemovesThePendingEntryAndReportsFailure() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Downloads downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
        downloads.rejectPublish = true;
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(downloads.uriFor(1), new ByteArrayOutputStream());

        assertExportFails();
        assertFalse("the unpublished report was left behind", downloads.rows.containsKey(1L));
    }

    @Test @Config(sdk = {29, 30}) public void missingProviderLocationDoesNotProduceAnInventedSuccessPath() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Downloads downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
        downloads.assignedDirectory = "";
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(downloads.uriFor(1), new ByteArrayOutputStream());

        assertExportFails();
        assertFalse("the unpublished report was left behind", downloads.rows.containsKey(1L));
    }

    private static void assertExportFails() throws Exception {
        org.robolectric.shadows.ShadowToast.reset();
        LogBufferManager.exportToFile();
        app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();
        org.robolectric.shadows.ShadowLooper.idleMainLooper();
        assertEquals("The diagnostic report couldn't be saved. Try again.",
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
    }

    /**
     * The file's place is a value set into a sentence, so the toast isolates it: a right-to-left
     * sentence then keeps "Download/Morphe/..." in the order it was written.
     */
    @Test @Config(sdk = {29, 30}) public void theSavedPathIsIsolatedInItsToast() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Downloads downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(downloads.uriFor(1), new ByteArrayOutputStream());
        app.hushpinterest.extension.shared.Utils.setContext(context);
        app.hushpinterest.extension.shared.settings.BaseSettings.DEBUG_LOG_FILTERS.save("all");
        app.hushpinterest.extension.shared.diagnostics.HookStatus.clear();
        LogBufferManager.clearLogBuffer();
        app.hushpinterest.extension.shared.diagnostics.HookStatus.missingViewId("Hide ads", "jlk");
        org.robolectric.shadows.ShadowToast.reset();

        LogBufferManager.exportToFile();
        String toast = null;
        long until = System.currentTimeMillis() + 20_000;
        while (toast == null && System.currentTimeMillis() < until) {
            Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            toast = org.robolectric.shadows.ShadowToast.getTextOfLatestToast();
            if (toast == null) Thread.sleep(50);
        }

        assertNotNull("the export said nothing", toast);
        String saved = Environment.DIRECTORY_DOWNLOADS + "/Morphe/" + downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME);
        assertEquals("Full report saved to " + app.hushpinterest.extension.shared.L10n.isolate(saved), toast);
    }

    /**
     * Both exports end to end, with the redactor's credential corpus in every place a report takes
     * text from: buffered events, the saved crash and a section the bundle registers. No synthetic
     * secret reaches the clipboard or the saved file, and the build lines, timestamps and stack
     * frames a maintainer reads the report for arrive intact.
     */
    @Test @Config(sdk = {28, 29, 30}) public void neitherExportCarriesASyntheticCredential() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        app.hushpinterest.extension.shared.Utils.setContext(context);
        app.hushpinterest.extension.shared.settings.BaseSettings.DEBUG_LOG_FILTERS.save("all");
        app.hushpinterest.extension.shared.diagnostics.HookStatus.clear();
        LogBufferManager.clearLogBuffer();
        String[][] corpus = app.hushpinterest.extension.shared.diagnostics.DiagnosticRedactorTest.CREDENTIAL_CORPUS;
        java.util.List<String> lines = new java.util.ArrayList<>();
        StringBuilder crash = new StringBuilder("complete: true\njava.io.IOException: 401\n");
        for (String[] row : corpus) {
            LogBufferManager.appendEvent(app.hushpinterest.extension.shared.diagnostics.DiagnosticCategory.FEED,
                    "Probe", "INFO", row[0]);
            lines.add(row[0]);
            crash.append(row[0]).append('\n');
        }
        String pinterestProbe = app.hushpinterest.extension.shared.diagnostics.DiagnosticRedactorTest.PINTEREST_EXPORT_PROBE;
        String pinterestRedacted = app.hushpinterest.extension.shared.diagnostics.DiagnosticRedactorTest.PINTEREST_EXPORT_REDACTED;
        // Keep this event last so clipboard trimming cannot make the privacy assertion pass by
        // dropping it. Each source has its own marker, and all must keep the numeric controls.
        LogBufferManager.appendEvent(app.hushpinterest.extension.shared.diagnostics.DiagnosticCategory.FEED,
                "PinterestProbe", "INFO", pinterestProbe);
        lines.add("section " + pinterestProbe);
        crash.append("crash ").append(pinterestProbe).append('\n');
        String frame = "\tat app.hushpinterest.extension.pinterest.settings.ReleaseTransport.open(ReleaseTransport.java:120)";
        crash.append(frame).append('\n');
        LogBufferManager.persistCrashReport(context, crash.toString());
        LogBufferManager.registerReportSection(new LogBufferManager.ReportSection() {
            @Override public String title() {
                return "PROBE";
            }

            @Override public java.util.List<String> lines() {
                return lines;
            }
        });
        try {
            android.content.ClipboardManager clipboard = context.getSystemService(android.content.ClipboardManager.class);
            LogBufferManager.exportToClipboard();
            app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();
            org.robolectric.shadows.ShadowLooper.idleMainLooper();
            String copied = String.valueOf(clipboard.getPrimaryClip().getItemAt(0).getText());

            ByteArrayOutputStream body = new ByteArrayOutputStream();
            if (Build.VERSION.SDK_INT >= 29) {
                Downloads downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
                Shadows.shadowOf(context.getContentResolver()).registerOutputStream(downloads.uriFor(1), body);
            }
            org.robolectric.shadows.ShadowToast.reset();
            LogBufferManager.exportToFile();
            app.hushpinterest.extension.shared.Utils.awaitBackgroundTasksForTests();
            org.robolectric.shadows.ShadowLooper.idleMainLooper();
            String saved;
            if (Build.VERSION.SDK_INT < 29) {
                String toast = org.robolectric.shadows.ShadowToast.getTextOfLatestToast();
                String prefix = "Full report saved to " + (char) 0x2068;
                assertNotNull("the export said nothing", toast);
                assertTrue(toast, toast.startsWith(prefix) && toast.endsWith(String.valueOf((char) 0x2069)));
                File report = new File(toast.substring(prefix.length(), toast.length() - 1));
                assertEquals(LogBufferManager.fileExportDirectory(context), report.getParent());
                saved = new String(java.nio.file.Files.readAllBytes(report.toPath()), StandardCharsets.UTF_8);
            } else {
                saved = body.toString(StandardCharsets.UTF_8.name());
            }

            String[][] exports = {{"clipboard", copied}, {"file", saved}};
            for (String[] export : exports) {
                String where = export[0];
                String text = export[1];
                assertTrue(where + " holds no report: " + text, text.startsWith("MORPHE DIAGNOSTIC REPORT\n"));
                for (String[] row : corpus) {
                    for (int i = 1; i < row.length; i++) {
                        assertTrue(row[i] + " reached the " + where + ":\n" + text, text.indexOf(row[i]) < 0);
                    }
                }
                assertTrue(where + " lost the app line: " + text,
                        text.contains("\napp: " + context.getPackageName() + " "));
                assertTrue(where + " lost the abi line: " + text, text.contains("\nabi: app "));
                assertTrue(where + " lost the report time: " + text,
                        java.util.regex.Pattern.compile("\ngenerated_utc: \\d{4}-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\d\\.\\d{3}Z\n")
                                .matcher(text).find());
                assertTrue(where + " lost the event times: " + text,
                        java.util.regex.Pattern.compile("\nfeed \\| \\d{4}-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\d\\.\\d{3}Z \\| ")
                                .matcher(text).find());
                assertTrue(where + " lost the stack frame: " + text, text.contains(frame + "\n"));
                assertTrue(where + " lost the crash heading: " + text, text.contains("[LATEST JAVA CRASH]"));
                assertTrue(where + " lost the section: " + text, text.contains("[PROBE]"));
                String pinterestEvent = " | PinterestProbe | INFO | " + pinterestRedacted;
                assertTrue(where + " lost the redacted Pinterest event or its numeric controls: " + text,
                        text.contains(pinterestEvent + "\n") || text.endsWith(pinterestEvent));
                assertTrue(where + " lost the redacted Pinterest crash line or its numeric controls: " + text,
                        text.contains("crash " + pinterestRedacted + "\n"));
                assertTrue(where + " lost the redacted Pinterest section or its numeric controls: " + text,
                        text.contains("section " + pinterestRedacted + "\n"));
            }
        } finally {
            LogBufferManager.clearReportSectionsForTests();
            LogBufferManager.clearLogBuffer();
        }
    }

    /** MediaStore's Downloads table, as much of it as an export touches. */
    public static final class Downloads extends ContentProvider {
        private final Map<Long, ContentValues> rows = new HashMap<>();
        private long nextId = 1;
        String assignedDirectory;
        String assignedName;
        boolean rejectPublish;

        Uri uriFor(long id) {
            return ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, id);
        }

        ContentValues row(long id) {
            ContentValues row = rows.get(id);
            assertTrue("no Downloads entry " + id, row != null);
            return row;
        }

        @Override public boolean onCreate() {
            return true;
        }

        @Override public Uri insert(Uri uri, ContentValues values) {
            ContentValues row = new ContentValues(values);
            if (assignedDirectory != null) row.put(MediaStore.MediaColumns.RELATIVE_PATH, assignedDirectory);
            if (assignedName != null) row.put(MediaStore.MediaColumns.DISPLAY_NAME, assignedName);
            // MediaStore keeps names in a folder unique by numbering the newcomer.
            String name = row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME);
            for (ContentValues other : rows.values()) {
                if (name.equals(other.getAsString(MediaStore.MediaColumns.DISPLAY_NAME))) {
                    row.put(MediaStore.MediaColumns.DISPLAY_NAME, name.replace(".txt", " (1).txt"));
                }
            }
            long id = nextId++;
            rows.put(id, row);
            return uriFor(id);
        }

        @Override public Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder) {
            MatrixCursor cursor = new MatrixCursor(projection);
            ContentValues row = rows.get(ContentUris.parseId(uri));
            if (row != null) {
                Object[] values = new Object[projection.length];
                for (int i = 0; i < projection.length; i++) values[i] = row.get(projection[i]);
                cursor.addRow(values);
            }
            return cursor;
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
            if (rejectPublish) return 0;
            ContentValues row = rows.get(ContentUris.parseId(uri));
            if (row == null) return 0;
            row.putAll(values);
            return 1;
        }

        @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
            return rows.remove(ContentUris.parseId(uri)) == null ? 0 : 1;
        }

        @Override public String getType(Uri uri) {
            return "text/plain";
        }
    }
}
