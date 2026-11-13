/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
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
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.DocumentsContract;
import android.provider.MediaStore;

import org.junit.After;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CallRecordingsTest {
    @Rule public final TemporaryFolder temp = new TemporaryFolder();
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final byte[] AUDIO = {0, 0, 0, 24, 'f', 't', 'y', 'p', 'M', '4', 'A', ' '};
    private static final String NAME = "Telegram call 2026-10-30 21-15.m4a";

    private Recordings recordings;

    @Before public void setUp() {
        recordings = Robolectric.setupContentProvider(Recordings.class, MediaStore.AUTHORITY);
    }

    @After public void tearDown() {
        Settings.RECORD_CALLS_FOLDER.resetToDefault();
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
        CallRecordings.Saved saved = CallRecordings.save(context(), finished(), NAME);
        assertEquals("Music/Telegram calls", saved.folder);
        assertEquals(recordings.uriFor(1), saved.uri);
        assertEquals("audio/mp4", saved.mime);

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
        assertEquals("Recordings/Telegram calls", CallRecordings.save(context(), finished(), NAME).folder);
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
        CallRecordings.Saved saved = CallRecordings.save(context(), finished(), NAME);
        assertEquals("Music/Telegram calls", saved.folder);
        assertNull("a plain file has no address to share", saved.uri);
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

    @Test public void aNameSaysWhoTheCallWasWithWhenThereIsSomeone() {
        long began = new GregorianCalendar(2026, Calendar.OCTOBER, 30, 21, 15).getTimeInMillis();
        assertEquals("Telegram call with Alex Kim 2026-10-30 21-15.m4a", CallRecordings.name(began, "Alex Kim"));
        assertEquals(NAME, CallRecordings.name(began, null));
        assertEquals(NAME, CallRecordings.name(began, " \t "));
    }

    @Test public void aNameKeepsNothingAFileNameCantCarry() {
        assertEquals("a b c d e f g h i j", CallRecordings.fileSafe("a/b\\c:d*e?f\"g<h>i|j"));
        assertEquals("two lines", CallRecordings.fileSafe("two\n\tlines"));
        assertEquals("hidden", CallRecordings.fileSafe(". .hidden"));
        // A direction mark could turn the rest of the name around, and a zero width one hides.
        String marks = "evil" + (char) 0x202E + "gpj.exe" + (char) 0x200B;
        assertEquals("evil gpj.exe", CallRecordings.fileSafe(marks));
        assertEquals("", CallRecordings.fileSafe(null));

        String face = new String(Character.toChars(0x1F600));
        StringBuilder long61 = new StringBuilder();
        for (int i = 0; i < 61; i++) long61.append(face);
        String cut = CallRecordings.fileSafe(long61.toString());
        assertEquals("cut by characters, never through one", 60, cut.codePointCount(0, cut.length()));
        assertEquals(120, cut.length());
    }

    private static final long BEFORE = new GregorianCalendar(2026, Calendar.NOVEMBER, 1).getTimeInMillis();

    private void listed(long id, String name, String path, Long added) {
        recordings.rows.put(id, new ContentValues());
        recordings.listing.add(new Object[]{id, name, path, added});
    }

    @Test public void cleanupDeletesOnlyOurOldRecordingsInOurFolder() {
        recordings.listing = new ArrayList<>();
        long old = BEFORE / 1000 - 86_400;
        listed(1, "Telegram call 2026-01-01 10-00.m4a", "Music/Telegram calls/", old);
        listed(2, "Telegram call 2026-11-10 10-00.m4a", "Music/Telegram calls/", BEFORE / 1000);
        listed(3, "Voice memo.m4a", "Music/Telegram calls/", old);
        listed(4, "Telegram call 2026-01-01 10-00.m4a", "Music/Other/", old);
        listed(5, "Telegram call 2026-01-02 10-00.m4a", "Music/Telegram calls/", old);
        listed(6, "Telegram call 2026-01-03 10-00.m4a", "Music/Telegram calls/", null);
        listed(7, "Telegram call with Alex 2026-01-04 10-00.m4a", "Music/Telegram calls/", old);
        recordings.notOurs.add(5L);

        assertEquals(2, CallRecordings.clean(context(), BEFORE));
        assertEquals(new HashSet<>(Arrays.asList(2L, 3L, 4L, 5L, 6L)), recordings.rows.keySet());
        assertArrayEquals(new String[]{"Music/Telegram calls/", "Telegram call %", String.valueOf(BEFORE / 1000)},
                recordings.selectionArgs);
        assertTrue(recordings.selection, recordings.selection.contains(MediaStore.MediaColumns.DATE_ADDED + "<?"));
    }

    @Config(sdk = 28)
    @Test public void android9CleansTheMusicFolderByTheFilesDates() throws IOException {
        @SuppressWarnings("deprecation")
        File music = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC), CallRecordings.FOLDER);
        assertTrue(music.mkdirs() || music.isDirectory());
        File old = new File(music, "Telegram call 2026-01-01 10-00.m4a");
        File fresh = new File(music, "Telegram call 2026-11-10 10-00.m4a");
        File theirs = new File(music, "Voice memo.m4a");
        for (File file : new File[]{old, fresh, theirs}) assertTrue(file.createNewFile());
        assertTrue(old.setLastModified(BEFORE - 1_000));
        assertTrue(fresh.setLastModified(BEFORE));
        assertTrue(theirs.setLastModified(BEFORE - 1_000));

        assertEquals(1, CallRecordings.clean(context(), BEFORE));
        assertFalse(old.exists());
        assertTrue(fresh.exists());
        assertTrue(theirs.exists());
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

        /** What a cleanup's query answers, every row whatever it asked, so the code's own check is what picks. */
        List<Object[]> listing;
        String selection;
        String[] selectionArgs;
        /** Entries an earlier install saved, which MediaStore won't let this one delete. */
        final Set<Long> notOurs = new HashSet<>();

        @Override public Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder) {
            if (listing == null) throw new AssertionError("saving a call looks nothing up");
            assertEquals(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, uri);
            this.selection = selection;
            this.selectionArgs = selectionArgs;
            MatrixCursor cursor = new MatrixCursor(projection);
            for (Object[] row : listing) cursor.addRow(row);
            return cursor;
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
            ContentValues row = rows.get(ContentUris.parseId(uri));
            if (row == null || !publishes) return 0;
            row.putAll(values);
            return 1;
        }

        @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
            if (notOurs.contains(ContentUris.parseId(uri))) throw new SecurityException("owned by another install");
            return rows.remove(ContentUris.parseId(uri)) == null ? 0 : 1;
        }

        @Override public String getType(Uri uri) {
            return "audio/mp4";
        }
    }

    private static final String DOCUMENTS = "com.android.externalstorage.documents";
    private static final Uri PICKED = DocumentsContract.buildTreeDocumentUri(DOCUMENTS, "primary:Recordings/Calls");

    private Folder pick() {
        Folder folder = Robolectric.setupContentProvider(Folder.class, DOCUMENTS);
        assertTrue(Settings.RECORD_CALLS_FOLDER.saveCommitted(PICKED.toString()));
        return folder;
    }

    private static Uri inPicked(String name) {
        return DocumentsContract.buildDocumentUriUsingTree(PICKED, "primary:Recordings/Calls/" + name);
    }

    @Test public void aPickedFolderTakesTheRecordingAndIsNamedByItsPath() throws IOException {
        Folder folder = pick();
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(inPicked(NAME), body);

        CallRecordings.Saved saved = CallRecordings.save(context(), finished(), NAME);
        assertEquals("Recordings/Calls", saved.folder);
        assertEquals("Recordings/Calls", CallRecordings.shown());
        assertEquals(inPicked(NAME), saved.uri);
        assertEquals("audio/mp4", saved.mime);
        assertEquals(Arrays.asList(NAME + " as audio/mp4 in primary:Recordings/Calls"), folder.made);
        assertArrayEquals(AUDIO, body.toByteArray());
        assertTrue("nothing went to MediaStore", recordings.rows.isEmpty());
    }

    @Test public void aPickedFolderTelegramLostLeavesTheRecordingInTheUsualOne() throws IOException {
        pick().refuses = true;
        bodyOf(1);
        CallRecordings.Saved saved = CallRecordings.save(context(), finished(), NAME);
        assertEquals("Music/Telegram calls", saved.folder);
        assertEquals(recordings.uriFor(1), saved.uri);
    }

    @Test public void aCopyThatFailsInThePickedFolderTakesItsFileWithIt() throws IOException {
        Folder folder = pick();
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(inPicked(NAME), new OutputStream() {
            @Override public void write(int b) throws IOException {
                throw new IOException("card pulled");
            }
        });
        bodyOf(1);
        CallRecordings.Saved saved = CallRecordings.save(context(), finished(), NAME);
        assertEquals(Arrays.asList("primary:Recordings/Calls/" + NAME), folder.deleted);
        assertEquals(recordings.uriFor(1), saved.uri);
    }

    @Test public void cleanupReachesThePickedFolderToo() {
        recordings.listing = new ArrayList<>();
        Folder folder = pick();
        folder.listing.add(new Object[]{"primary:Recordings/Calls/a", "Telegram call 2026-01-01 10-00.m4a", "audio/mp4", BEFORE - 1_000});
        folder.listing.add(new Object[]{"primary:Recordings/Calls/b", "Telegram call 2026-11-10 10-00.m4a", "audio/mp4", BEFORE});
        folder.listing.add(new Object[]{"primary:Recordings/Calls/c", "Voice memo.m4a", "audio/mp4", BEFORE - 1_000});
        folder.listing.add(new Object[]{"primary:Recordings/Calls/d", "Telegram call 2026-01-02 10-00",
                DocumentsContract.Document.MIME_TYPE_DIR, BEFORE - 1_000});
        folder.listing.add(new Object[]{"primary:Recordings/Calls/e", "Telegram call 2026-01-03 10-00.ogg", "audio/ogg", null});
        folder.listing.add(new Object[]{"primary:Recordings/Calls/f", "Telegram call with Alex 2026-01-04 10-00.ogg", "audio/ogg", BEFORE - 1_000});

        assertEquals(2, CallRecordings.clean(context(), BEFORE));
        assertEquals(Arrays.asList("primary:Recordings/Calls/a", "primary:Recordings/Calls/f"), folder.deleted);
    }

    @Test public void aPickedFolderIsNamedTheWayThePickerShowsIt() {
        assertEquals("Music", CallRecordings.label(DocumentsContract.buildTreeDocumentUri(DOCUMENTS, "1234-ABCD:Music")));
        assertEquals("Internal storage", CallRecordings.label(DocumentsContract.buildTreeDocumentUri(DOCUMENTS, "primary:")));
        assertEquals("1234-ABCD", CallRecordings.label(DocumentsContract.buildTreeDocumentUri(DOCUMENTS, "1234-ABCD:")));
        assertTrue(Settings.RECORD_CALLS_FOLDER.saveCommitted(DocumentsContract.buildDocumentUri(DOCUMENTS, "primary:Music").toString()));
        assertNull("a single document isn't a folder", CallRecordings.chosen());
        assertEquals(CallRecordings.folder(), CallRecordings.shown());
    }

    /** A picked folder's documents app, as much of it as saving into the folder and cleaning it touch. */
    public static final class Folder extends ContentProvider {
        final List<String> made = new ArrayList<>();
        final List<String> deleted = new ArrayList<>();
        final List<Object[]> listing = new ArrayList<>();
        /** As when the folder was deleted or Telegram's data cleared, taking its permission. */
        boolean refuses;

        @Override public boolean onCreate() {
            return true;
        }

        @SuppressWarnings("deprecation")
        @Override public Bundle call(String method, String arg, Bundle extras) {
            if (refuses) throw new SecurityException("no permission for the folder");
            // DocumentsContract's own names for these, which the SDK keeps hidden.
            Uri target = extras.getParcelable("uri");
            String id = DocumentsContract.getDocumentId(target);
            Bundle out = new Bundle();
            if ("android:createDocument".equals(method)) {
                String name = extras.getString(DocumentsContract.Document.COLUMN_DISPLAY_NAME);
                made.add(name + " as " + extras.getString(DocumentsContract.Document.COLUMN_MIME_TYPE) + " in " + id);
                out.putParcelable("uri", DocumentsContract.buildDocumentUriUsingTree(target, id + "/" + name));
            } else if ("android:deleteDocument".equals(method)) {
                deleted.add(id);
            } else {
                throw new AssertionError("unexpected " + method);
            }
            return out;
        }

        @Override public Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder) {
            if (refuses) throw new SecurityException("no permission for the folder");
            assertEquals(DocumentsContract.buildChildDocumentsUriUsingTree(PICKED, "primary:Recordings/Calls"), uri);
            MatrixCursor cursor = new MatrixCursor(projection);
            for (Object[] row : listing) cursor.addRow(row);
            return cursor;
        }

        @Override public Uri insert(Uri uri, ContentValues values) {
            throw new AssertionError("a folder's documents are made through createDocument");
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
            throw new AssertionError("nothing in a picked folder is updated");
        }

        @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
            throw new AssertionError("a folder's documents go through deleteDocument");
        }

        @Override public String getType(Uri uri) {
            return "audio/mp4";
        }
    }

    @Test public void anOpusRecordingIsAnOggInMediaStore() throws IOException {
        bodyOf(1);
        long began = new GregorianCalendar(2026, Calendar.OCTOBER, 30, 21, 15).getTimeInMillis();
        String name = CallRecordings.name(began, "Alex Kim", CallRecordings.Format.OPUS);
        assertEquals("Telegram call with Alex Kim 2026-10-30 21-15.ogg", name);
        CallRecordings.Saved saved = CallRecordings.save(context(), finished(), name);
        assertEquals("audio/ogg", saved.mime);
        assertEquals("audio/ogg", recordings.row(1).getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertEquals(CallRecordings.Format.AAC, CallRecordings.Format.of(NAME));
        assertEquals(CallRecordings.Format.OPUS, CallRecordings.Format.of(name));
    }
}
