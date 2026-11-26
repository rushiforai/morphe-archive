package app.hushmessenger.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/** Initializes preferences before the main process executes UI hooks. Never exported. */
public final class SettingsProvider extends ContentProvider {
    @Override public boolean onCreate() {
        Settings.initialize(getContext());
        HostScreens.start(getContext());
        // Brings the icon back after a repatch without the Menu row or a lost preference. Hiding it waits for the first
        // screen, since after an update the icon can be back and that screen may have been opened through it.
        DrawerIconWait.atProcessStart(getContext());
        SettingsActivity.syncDrawerIcon(getContext());
        // Android keeps the launcher shortcuts between runs, so each start checks them against Hide the icon shortcuts.
        if (HostScreens.started) HostScreens.refreshShortcuts(getContext());
        return true;
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
