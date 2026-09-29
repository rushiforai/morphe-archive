package app.hushmessenger.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/** Initializes preferences before the main process executes UI hooks. Never exported. */
public final class SettingsProvider extends ContentProvider {
    @Override public boolean onCreate() {
        Settings.initialize(getContext());
        CrashGuard.onProcessStart(getContext());
        return true;
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
