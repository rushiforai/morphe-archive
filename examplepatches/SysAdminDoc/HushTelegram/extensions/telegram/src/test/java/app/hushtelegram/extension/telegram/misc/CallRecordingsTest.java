/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.Manifest;
import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowMediaScannerConnection;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.Map;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CallRecordingsTest {
    @Rule public final TemporaryFolder temp = new TemporaryFolder();

    private static final byte[] AUDIO = {0, 0, 0, 24, 'f', 't', 'y', 'p', 'M', '4', 'A', ' '};
    private static final String NAME = "Telegram call 2026-10-30 21-15.m4a";

    private Recordings recordings;

    @Before public void setUp() {
        recordings = Robolectric.setupContentProvider(Recordings.class, MediaStore.AUTHORITY);
    }

    private static Context context() {
        return RuntimeEnvironment.getApplication();
    }

    private File finished() throws IOException {
        File file = new File(temp.getRoot(), "call-1.m4a");
        try (OutputStream out = new FileOutputStream(file)) {
            out.write(AUDIO);
        }
        return file;
    }

    private ByteArrayOutputStream bodyOf(long id) {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(recordings.uriFor(id), body);
        return body;
    }

    private static byte[] read(File file) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (InputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[256];
            for (int read; (read = in.read(buffer)) != -1; ) bytes.write(buffer, 0, read);
        }
        return bytes.toByteArray();
    }

    @Test public void aNameSaysWhenTheCallBeganInThePhonesOwnTime() {
        assertEquals(NAME, CallRecordings.name(new GregorianCalendar(2026, Calendar.OCTOBER, 30, 21, 15, 59).getTimeInMillis()));
        assertEquals("Telegram call 2026-01-05 09-03.m4a",
                CallRecordings.name(new GregorianCalendar(2026, Calendar.JANUARY, 5, 9, 3).getTimeInMillis()));
    }

    @Test public void android11AndOlderSaveToMusicHiddenUntilTheCopyIsWhole() throws IOException {
        ByteArrayOutputStream body = bodyOf(1);
        assertEquals("Music/Telegram calls", CallRecordings.folder());
        assertEquals("Music/Telegram calls", CallRecordings.save(context(), finished(), NAME));

        ContentValues row = recordings.row(1);
        assertEquals(NAME, row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("Music/Telegram calls/", row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals("audio/mp4", row.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertEquals(1, recordings.pendingInserts);
        assertEquals(Integer.valueOf(0), row.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertArrayEquals(AUDIO, body.toByteArray());
    }

    @Config(sdk = 31)
    @Test public void android12AndNewerSaveToRecordings() throws IOException {
        bodyOf(1);
        assertEquals("Recordings/Telegram calls", CallRecordings.folder());
        assertEquals("Recordings/Telegram calls", CallRecordings.save(context(), finished(), NAME));
        assertEquals("Recordings/Telegram calls/", recordings.row(1).getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
    }

    @Test public void aCopyThatFailsTakesItsHiddenEntryWithIt() throws IOException {
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(recordings.uriFor(1), new OutputStream() {
            @Override public void write(int b) throws IOException {
                throw new IOException("storage full");
            }
        });
        try {
            CallRecordings.save(context(), finished(), NAME);
            fail("a failed copy isn't a saved call");
        } catch (IOException expected) {
            assertEquals("storage full", expected.getMessage());
        }
        assertEquals(1, recordings.pendingInserts);
        assertTrue(recordings.rows.isEmpty());
    }

    @Test public void anEntryMediaStoreWontShowIsTakenBackToo() throws IOException {
        bodyOf(1);
        recordings.publishes = false;
        try {
            CallRecordings.save(context(), finished(), NAME);
            fail("an entry left hidden isn't a saved call");
        } catch (IOException expected) {
            assertTrue(expected.getMessage(), expected.getMessage().contains("publish"));
        }
        assertTrue(recordings.rows.isEmpty());

        recordings.takes = false;
        try {
            CallRecordings.save(context(), finished(), NAME);
            fail("no entry, no saved call");
        } catch (IOException expected) {
            assertTrue(expected.getMessage(), expected.getMessage().contains("didn't take"));
        }
    }

    @Config(sdk = 28)
    @Test public void android9WritesStraightToMusicOnlyWithTheStoragePermission() throws IOException {
        Shadows.shadowOf(RuntimeEnvironment.getApplication()).denyPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        try {
            CallRecordings.save(context(), finished(), NAME);
            fail("no storage permission, no saved call");
        } catch (IOException expected) {
            assertTrue(expected.getMessage(), expected.getMessage().contains("storage"));
        }

        Shadows.shadowOf(RuntimeEnvironment.getApplication()).grantPermissions(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        @SuppressWarnings("deprecation")
        File music = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC), CallRecordings.FOLDER);
        assertEquals("Music/Telegram calls", CallRecordings.save(context(), finished(), NAME));
        CallRecordings.save(context(), finished(), NAME);
        File first = new File(music, NAME);
        File second = new File(music, "Telegram call 2026-10-30 21-15 (2).m4a");
        assertArrayEquals(AUDIO, read(first));
        assertArrayEquals(AUDIO, read(second));
        assertTrue(ShadowMediaScannerConnection.getSavedPaths().contains(second.getPath()));
        assertTrue("MediaStore isn't used before Android 10", recordings.rows.isEmpty());
    }

    @Test public void aTakenNameIsNumberedTheWayMediaStoreNumbersIt() throws IOException {
        File folder = temp.newFolder("calls");
        assertEquals(new File(folder, NAME), CallRecordings.free(folder, NAME));
        assertTrue(new File(folder, NAME).createNewFile());
        assertEquals(new File(folder, "Telegram call 2026-10-30 21-15 (2).m4a"), CallRecordings.free(folder, NAME));
        assertTrue(new File(folder, "Telegram call 2026-10-30 21-15 (2).m4a").createNewFile());
        assertEquals(new File(folder, "Telegram call 2026-10-30 21-15 (3).m4a"), CallRecordings.free(folder, NAME));
        assertTrue(new File(folder, "plain").createNewFile());
        assertEquals(new File(folder, "plain (2)"), CallRecordings.free(folder, "plain"));
    }

    @Test public void aCallStartsInTelegramsCacheAndClearsWhatAnUnfinishedOneLeft() throws IOException {
        File first = CallRecordings.scratch(context(), 100);
        assertEquals(new File(new File(context().getCacheDir(), CallRecordings.SCRATCH), "call-100.m4a"), first);
        assertFalse(first.exists());
        assertTrue(first.createNewFile());

        File next = CallRecordings.scratch(context(), 200);
        assertEquals("call-200.m4a", next.getName());
        assertFalse("Telegram closed mid-call, so the old file can't be played", first.exists());
        String[] left = first.getParentFile().list();
        assertNotNull(left);
        assertEquals(0, left.length);
    }

    /** MediaStore's audio table, as much of it as saving a call touches. */
    public static final class Recordings extends ContentProvider {
        final Map<Long, ContentValues> rows = new LinkedHashMap<>();
        long nextId = 1;
        int pendingInserts;
        boolean takes = true;
        boolean publishes = true;

        Uri uriFor(long id) {
            return ContentUris.withAppendedId(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, id);
        }

        ContentValues row(long id) {
            ContentValues row = rows.get(id);
            assertNotNull("no audio entry " + id, row);
            return row;
        }

        @Override public boolean onCreate() {
            return true;
        }

        @Override public Uri insert(Uri uri, ContentValues values) {
            assertEquals(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, uri);
            if (!takes) return null;
            ContentValues row = new ContentValues(values);
            if (Integer.valueOf(1).equals(row.getAsInteger(MediaStore.MediaColumns.IS_PENDING))) pendingInserts++;
            long id = nextId++;
            rows.put(id, row);
            return uriFor(id);
        }

        @Override public Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder) {
            throw new AssertionError("saving a call looks nothing up");
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
            ContentValues row = rows.get(ContentUris.parseId(uri));
            if (row == null || !publishes) return 0;
            row.putAll(values);
            return 1;
        }

        @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
            return rows.remove(ContentUris.parseId(uri)) == null ? 0 : 1;
        }

        @Override public String getType(Uri uri) {
            return "audio/mp4";
        }
    }
}
