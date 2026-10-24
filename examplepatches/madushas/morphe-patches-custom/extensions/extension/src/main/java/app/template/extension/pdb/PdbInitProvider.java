package app.template.extension.pdb;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/**
 * Runs {@link PdbStartup#applyDefaults} at the earliest possible moment.
 *
 * Content providers are created right after {@code Application.attachBaseContext()}
 * and just before {@code Application.onCreate()}, so the extra values are in place
 * before the app reads them.
 */
public final class PdbInitProvider extends ContentProvider {

    @Override
    public boolean onCreate() {
        PdbStartup.applyDefaults(getContext());
        return true;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection,
                        String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
