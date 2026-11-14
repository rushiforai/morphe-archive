package app.soundsync.settings;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;

/**
 * Lets patched apps read the delay and mode. Read-only: other apps can't change anything.
 * Android starts this on demand when a patched app asks; nothing runs in the background.
 */
public class SettingsProvider extends ContentProvider {

    @Override
    public boolean onCreate() {
        return true;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs,
                        String sortOrder) {
        MatrixCursor c = new MatrixCursor(new String[]{"delay_ms", "mode"}, 1);
        c.addRow(new Object[]{Settings.delay(getContext()), Settings.mode(getContext())});
        c.setNotificationUri(getContext().getContentResolver(), Settings.CONFIG);
        return c;
    }

    @Override
    public String getType(Uri uri) {
        return "vnd.android.cursor.item/vnd.app.soundsync.config";
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        throw new UnsupportedOperationException("Read-only");
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("Read-only");
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("Read-only");
    }
}
