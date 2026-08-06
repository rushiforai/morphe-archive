package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Application;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/** Starts the userscript engine before Chrome creates its first activity. */
public final class ChromeUserscriptInitProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        if (getContext() != null &&
                getContext().getApplicationContext() instanceof Application) {
            ChromeUserscriptController.install(
                    (Application) getContext().getApplicationContext()
            );
        }
        return true;
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection,
                                  String[] selectionArgs, String sortOrder) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] selectionArgs) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection,
                                String[] selectionArgs) { return 0; }
}
