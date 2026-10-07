/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
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
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.facebook.notifications.NotificationSound.Outcome;
import app.morphe.extension.facebook.notifications.NotificationSound.Result;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Facebook's chime goes into the phone's notification sounds once, as a published audio row
 * Android's picker lists, and every way the copy can fail leaves nothing behind (#83).
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 30)
public class NotificationSoundTest {
    private static final String NAME = "Facebook notification.m4a";

    private Context context;
    private Sounds store;
    private ByteArrayOutputStream written;

    @Before
    public void setUp() {
        context = RuntimeEnvironment.getApplication();
        store = Robolectric.setupContentProvider(Sounds.class, MediaStore.AUTHORITY);
        written = new ByteArrayOutputStream();
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(store.uri(1), written);
        LogBufferManager.clearLogBuffer();
    }

    @After
    public void tearDown() {
        NotificationSound.sourceForTests = null;
        LogBufferManager.clearLogBuffer();
    }

    @Test
    public void theChimeIsWrittenOnceAsANotificationSoundWithoutItsTitleTag() {
        byte[] chime = Mp4TitleTest.tagged("FB_FBPN_min7p8db");
        NotificationSound.sourceForTests = () -> new ByteArrayInputStream(chime.clone());

        Result saved = NotificationSound.save(context);
        assertEquals(Outcome.SAVED, saved.outcome);
        assertEquals(NAME, saved.name);
        byte[] file = written.toByteArray();
        assertEquals(chime.length, file.length);
        int name = Mp4TitleTest.indexOf(chime, new byte[] { (byte) 0xA9, 'n', 'a', 'm' });
        assertEquals("the title tag is dropped so the picker shows the file's name", "free",
                new String(file, name, 4, java.nio.charset.StandardCharsets.US_ASCII));
        assertArrayEquals(Mp4Title.untitled(chime.clone()), file);
        ContentValues row = store.rows.get(1L);
        assertEquals(NAME, row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("Facebook notification", row.getAsString(MediaStore.MediaColumns.TITLE));
        assertEquals("audio/mp4", row.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertEquals("Notifications/", row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals(1, (int) row.getAsInteger(MediaStore.Audio.AudioColumns.IS_NOTIFICATION));
        assertEquals("published after the last byte", 0, (int) row.getAsInteger(MediaStore.MediaColumns.IS_PENDING));

        Result again = NotificationSound.save(context);
        assertEquals(Outcome.ALREADY_THERE, again.outcome);
        assertEquals(NAME, again.name);
        assertEquals("a second tap wrote nothing", 1, store.rows.size());
    }

    @Test
    public void anotherContainerIsCopiedAsItIs() {
        byte[] ogg = "OggS\0\2a vorbis chime".getBytes(StandardCharsets.US_ASCII);
        NotificationSound.sourceForTests = () -> new ByteArrayInputStream(ogg);
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(store.uri(1), written);
        Result saved = NotificationSound.save(context);
        assertEquals(Outcome.SAVED, saved.outcome);
        assertEquals("Facebook notification.ogg", saved.name);
        assertArrayEquals(ogg, written.toByteArray());
        assertEquals("audio/ogg", store.rows.get(1L).getAsString(MediaStore.MediaColumns.MIME_TYPE));
    }

    @Test
    public void aBuildWithoutTheChimeSaysSo() {
        NotificationSound.sourceForTests = () -> null;
        Result result = NotificationSound.save(context);
        assertEquals(Outcome.NO_SOUND, result.outcome);
        assertNull(result.name);
        assertTrue(store.rows.isEmpty());
    }

    @Test
    public void anEntryMediaStoreRefusesFails() {
        NotificationSound.sourceForTests = () -> new ByteArrayInputStream(mp4("the chime"));
        store.refuseInsert = true;
        assertEquals(Outcome.FAILED, NotificationSound.save(context).outcome);
        assertTrue(store.rows.isEmpty());
    }

    @Test
    public void aCopyThatBreaksLeavesNoRow() {
        NotificationSound.sourceForTests = () -> new ByteArrayInputStream(mp4("the chime"));
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(store.uri(1), new OutputStream() {
            @Override
            public void write(int b) throws IOException {
                throw new IOException("the disk is full");
            }
        });
        assertEquals(Outcome.FAILED, NotificationSound.save(context).outcome);
        assertTrue("the pending row was removed", store.rows.isEmpty());
    }

    @Test
    public void aSourceThatCannotBeReadIsNoSound() {
        NotificationSound.sourceForTests = () -> {
            throw new IOException("no such resource");
        };
        assertEquals(Outcome.NO_SOUND, NotificationSound.save(context).outcome);
        assertTrue(store.rows.isEmpty());
    }

    @Test
    public void theContainerNamesTheFile() {
        assertEquals("audio/mp4", NotificationSound.mime(mp4(""), 12));
        assertEquals("audio/ogg", NotificationSound.mime("OggS\0\2".getBytes(StandardCharsets.US_ASCII), 6));
        assertEquals("audio/mpeg", NotificationSound.mime("ID3\4".getBytes(StandardCharsets.US_ASCII), 4));
        assertEquals("audio/mpeg", NotificationSound.mime(new byte[] { (byte) 0xFF, (byte) 0xFB, 0 }, 3));
        assertEquals("an unknown container is kept as the stock one", "audio/mp4", NotificationSound.mime(new byte[] { 1, 2 }, 2));
        assertEquals("audio/mp4", NotificationSound.mime(new byte[0], 0));
        assertEquals(".m4a", NotificationSound.extension("audio/mp4"));
        assertEquals(".ogg", NotificationSound.extension("audio/ogg"));
        assertEquals(".mp3", NotificationSound.extension("audio/mpeg"));
    }

    @Test
    public void onlyThisPackagesResourceSoundNamesTheChime() {
        String pkg = context.getPackageName();
        assertEquals(0, NotificationSound.resourceId(context.getResources(), pkg, null));
        assertEquals(0, NotificationSound.resourceId(context.getResources(), pkg, Uri.parse("content://settings/system/notification_sound")));
        assertEquals(0, NotificationSound.resourceId(context.getResources(), pkg, Uri.parse("android.resource://com.other.app/raw/chime")));
        assertEquals(0, NotificationSound.resourceId(context.getResources(), pkg, Uri.parse("android.resource://" + pkg + "/123")));
        assertEquals("a name this app has no resource for", 0,
                NotificationSound.resourceId(context.getResources(), pkg, Uri.parse("android.resource://" + pkg + "/raw.2/missing")));
        assertEquals("no resource under any raw type here", 0, NotificationSound.resourceId(context));
    }

    /** An MP4 container's first bytes (the box size, then ftyp) ahead of whatever stands in for the sound. */
    private static byte[] mp4(String payload) {
        byte[] body = payload.getBytes(StandardCharsets.US_ASCII);
        byte[] head = { 0, 0, 0, 24, 'f', 't', 'y', 'p', 'M', '4', 'A', ' ' };
        byte[] all = new byte[head.length + body.length];
        System.arraycopy(head, 0, all, 0, head.length);
        System.arraycopy(body, 0, all, head.length, body.length);
        return all;
    }

    /** MediaStore's audio table, as much of it as the save touches: rows by id, and a look-up by name and folder. */
    public static final class Sounds extends ContentProvider {
        final Map<Long, ContentValues> rows = new LinkedHashMap<>();
        boolean refuseInsert;
        private long nextId = 1;

        Uri uri(long id) {
            return ContentUris.withAppendedId(MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY), id);
        }

        @Override public boolean onCreate() {
            return true;
        }

        @Override public Uri insert(Uri uri, ContentValues values) {
            if (refuseInsert) return null;
            long id = nextId++;
            rows.put(id, new ContentValues(values));
            return ContentUris.withAppendedId(uri, id);
        }

        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
            MatrixCursor cursor = new MatrixCursor(projection);
            if (selectionArgs == null || selectionArgs.length != 2) return cursor;
            for (ContentValues row : rows.values()) {
                if (!selectionArgs[0].equals(row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME))) continue;
                if (!selectionArgs[1].equals(row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH))) continue;
                Integer pending = row.getAsInteger(MediaStore.MediaColumns.IS_PENDING);
                if (pending != null && pending == 1) continue;
                Object[] values = new Object[projection.length];
                for (int i = 0; i < projection.length; i++) values[i] = row.get(projection[i]);
                cursor.addRow(values);
            }
            return cursor;
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
            ContentValues row = rows.get(ContentUris.parseId(uri));
            if (row == null) return 0;
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
