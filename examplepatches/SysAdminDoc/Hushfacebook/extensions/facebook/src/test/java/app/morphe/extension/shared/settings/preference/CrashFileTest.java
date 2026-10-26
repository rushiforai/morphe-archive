/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.provider.MediaStore;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeMap;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * A Java crash that ends the app also lands in Download/Hushfacebook as a text file holding the
 * report's redacted crash section, so it can be sent when Facebook won't open. At most five are
 * kept, nothing is written with the switch off or while paused, and an exception the process lived
 * through takes its file back.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 30)
public class CrashFileTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;
    private Downloads downloads;
    private final Map<Long, ByteArrayOutputStream> bodies = new TreeMap<>();

    @Before
    public void start() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        BaseSettings.DEBUG_LOG_FILTERS.save("all");
        LogBufferManager.clearLogBuffer();
        JavaCrashReport.resetForTests();
        // Loads Facebook's settings, which hand the crash file its switch, as a start does.
        Settings.SAVE_CRASH_FILE.resetToDefault();
        downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
        ShadowContentResolver resolver = Shadows.shadowOf(context.getContentResolver());
        for (long id = 1; id <= 10; id++) {
            ByteArrayOutputStream body = new ByteArrayOutputStream();
            bodies.put(id, body);
            resolver.registerOutputStream(downloads.uriFor(id), body);
        }
    }

    @After
    public void finish() {
        PauseForTests.resume();
        Settings.SAVE_CRASH_FILE.resetToDefault();
        LogBufferManager.clearLogBuffer();
        JavaCrashReport.resetForTests();
    }

    private String body(long id) throws Exception {
        return bodies.get(id).toString(StandardCharsets.UTF_8.name());
    }

    @Test
    public void aCrashGoesToDownloadsWithTheReportsRedactedText() throws Exception {
        assertTrue("the switch doesn't start on", Settings.SAVE_CRASH_FILE.get());
        Throwable crash = new IllegalStateException("outer, see https://example.com/private?id=12345",
                new NullPointerException("inner cause"));
        JavaCrashReport.save(Thread.currentThread(), crash);

        assertEquals("not one file", 1, downloads.ids().size());
        ContentValues row = downloads.row(1);
        assertEquals(CrashFile.FOLDER, row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals("text/plain", row.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        String name = row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME);
        assertTrue(name, name.matches("crash-\\d{4}-\\d\\d-\\d\\d-\\d{4}\\.txt"));

        String file = body(1);
        assertEquals("the file isn't the report's crash section", LogBufferManager.readCrashReport(context), file);
        assertTrue(file, file.contains("app_version: ") && file.contains("morphe_version: "));
        assertTrue(file, file.contains("app_version_code: "));
        assertTrue(file, file.contains("abi: app "));
        assertTrue(file, file.contains("patch_build: unknown\n"));
        assertTrue(file, file.contains("Caused by: java.lang.NullPointerException: inner cause"));
        assertFalse("the address went in as it was: " + file, file.contains("example.com/private"));
    }

    @Test
    public void theNewestFiveAreKept() throws Exception {
        for (int i = 1; i <= 7; i++) {
            assertNotNull("crash " + i + " wasn't written", CrashFile.write(context, "crash " + i, 1_000_000L * i));
        }
        List<Long> left = downloads.ids();
        assertEquals("the oldest weren't let go", java.util.Arrays.asList(3L, 4L, 5L, 6L, 7L), left);
        assertEquals("crash 7", body(7));

        // Another app's file in the same folder, or one of this install's with another name, isn't counted.
        downloads.add("notes.txt", CrashFile.FOLDER);
        downloads.add("crash-2026-01-01-0000.txt", "Download/Other/");
        CrashFile.write(context, "crash 8", 9_000_000L);
        assertEquals(java.util.Arrays.asList(4L, 5L, 6L, 7L, 8L, 9L, 10L), downloads.ids());
    }

    @Test
    public void offOrPausedNothingIsWritten() {
        Settings.SAVE_CRASH_FILE.save(false);
        JavaCrashReport.save(Thread.currentThread(), new IllegalStateException("with the switch off"));
        assertTrue("a file was written with the switch off", downloads.ids().isEmpty());
        assertTrue("the report lost the crash", LogBufferManager.readCrashReport(context).contains("with the switch off"));

        Settings.SAVE_CRASH_FILE.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        JavaCrashReport.save(Thread.currentThread(), new IllegalStateException("while paused"));
        assertTrue("a file was written while paused", downloads.ids().isEmpty());
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() ->
                JavaCrashReport.save(Thread.currentThread(), new IllegalStateException("before settings were ready")));
        assertTrue("a file was written before the settings were ready", downloads.ids().isEmpty());

        JavaCrashReport.save(Thread.currentThread(), new IllegalStateException("the control"));
        assertEquals("the control: on and not paused, the crash is written", 1, downloads.ids().size());
    }

    /**
     * An exception off the main thread that Facebook swallowed ended nothing, so its file goes with
     * it. One on the main thread stays, as its report section does.
     */
    @Test
    public void aSwallowedExceptionOffTheMainThreadTakesItsFileBack() {
        Thread worker = new Thread("CombinedTP3");
        JavaCrashReport.Saved before = JavaCrashReport.save(worker, new IllegalStateException("swallowed"));
        assertEquals(1, downloads.ids().size());
        JavaCrashReport.survived(worker, before);
        assertTrue("the swallowed exception's file stayed", downloads.ids().isEmpty());

        JavaCrashReport.Saved main = JavaCrashReport.save(Thread.currentThread(), new IllegalStateException("on the main thread"));
        assertEquals(1, downloads.ids().size());
        JavaCrashReport.survived(Thread.currentThread(), main);
        assertEquals("the control: on the main thread the file stays", 1, downloads.ids().size());

        // A later swallowed exception that wrote no file has nothing to take back.
        Settings.SAVE_CRASH_FILE.save(false);
        JavaCrashReport.Saved quiet = JavaCrashReport.save(worker, new IllegalStateException("swallowed with the switch off"));
        JavaCrashReport.survived(worker, quiet);
        assertEquals("a swallowed exception with no file of its own took another's", 1, downloads.ids().size());
    }

    /**
     * A swallowed exception takes back only its own file: another thread's crash written after it
     * keeps its file, and two that both end nothing leave neither.
     */
    @Test
    public void aSwallowedExceptionTakesBackOnlyItsOwnFile() throws Exception {
        Thread worker = new Thread("CombinedTP3");
        JavaCrashReport.Saved swallowed = JavaCrashReport.save(worker, new IllegalStateException("swallowed"));
        Throwable fatal = new IllegalArgumentException("the fatal one");
        JavaCrashReport.save(new Thread("Background"), fatal);
        assertEquals(java.util.Arrays.asList(1L, 2L), downloads.ids());
        JavaCrashReport.survived(worker, swallowed);
        assertEquals("the newer crash's file went with the swallowed one", java.util.Collections.singletonList(2L), downloads.ids());
        assertTrue(body(2), body(2).contains("the fatal one"));
        JavaCrashReport.save(new Thread("Background"), fatal);
        assertEquals("the same crash handed back got a second file", java.util.Collections.singletonList(2L), downloads.ids());

        JavaCrashReport.resetForTests();
        Thread one = new Thread("CombinedTP4");
        Thread two = new Thread("CombinedTP5");
        JavaCrashReport.Saved first = JavaCrashReport.save(one, new IllegalStateException("first swallowed"));
        JavaCrashReport.Saved second = JavaCrashReport.save(two, new IllegalStateException("second swallowed"));
        assertEquals(java.util.Arrays.asList(2L, 3L, 4L), downloads.ids());
        JavaCrashReport.survived(one, first);
        JavaCrashReport.survived(two, second);
        assertEquals("a swallowed exception's file stayed", java.util.Collections.singletonList(2L), downloads.ids());
    }

    @Test
    public void aFileIsNamedForThePhonesTime() {
        TimeZone before = TimeZone.getDefault();
        try {
            TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
            // 2026-10-11 14:05 UTC.
            assertEquals("crash-2026-10-11-1405.txt", CrashFile.fileName(1_791_727_500_000L));
            TimeZone.setDefault(TimeZone.getTimeZone("America/New_York"));
            assertEquals("crash-2026-10-11-1005.txt", CrashFile.fileName(1_791_727_500_000L));
        } finally {
            TimeZone.setDefault(before);
        }
    }

    /** MediaStore's Downloads table, as much of it as a crash file touches. */
    public static final class Downloads extends ContentProvider {
        private final Map<Long, ContentValues> rows = new TreeMap<>();
        private long nextId = 1;

        Uri uriFor(long id) {
            return ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, id);
        }

        ContentValues row(long id) {
            ContentValues row = rows.get(id);
            assertNotNull("no Downloads entry " + id, row);
            return row;
        }

        List<Long> ids() {
            return new ArrayList<>(rows.keySet());
        }

        void add(String name, String folder) {
            ContentValues row = new ContentValues();
            row.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            row.put(MediaStore.MediaColumns.RELATIVE_PATH, folder);
            rows.put(nextId++, row);
        }

        @Override public boolean onCreate() {
            return true;
        }

        @Override public Uri insert(Uri uri, ContentValues values) {
            long id = nextId++;
            rows.put(id, new ContentValues(values));
            return uriFor(id);
        }

        /**
         * The collection, filtered the way the crash file asks: a folder, and a name LIKE
         * "crash-%.txt". Newest first, which here is the highest id, as DATE_ADDED then _ID sorts.
         */
        @Override public Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder) {
            assertEquals(MediaStore.MediaColumns.RELATIVE_PATH + "=? AND " + MediaStore.MediaColumns.DISPLAY_NAME
                    + " LIKE ?", selection);
            assertEquals(CrashFile.PREFIX + "%" + CrashFile.SUFFIX, selectionArgs[1]);
            MatrixCursor cursor = new MatrixCursor(projection);
            List<Long> newestFirst = ids();
            java.util.Collections.reverse(newestFirst);
            for (long id : newestFirst) {
                ContentValues row = rows.get(id);
                String name = row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME);
                if (!selectionArgs[0].equals(row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH))
                        || !name.startsWith(CrashFile.PREFIX) || !name.endsWith(CrashFile.SUFFIX)) continue;
                cursor.addRow(new Object[]{id});
            }
            return cursor;
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
            return 0;
        }

        @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
            return rows.remove(ContentUris.parseId(uri)) == null ? 0 : 1;
        }

        @Override public String getType(Uri uri) {
            return "text/plain";
        }
    }
}
