package app.danielthemaniel.patches.memoryeditor.extension;

import android.app.Application;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;

/**
 * Added to the manifest by the "Memory editor" patch. Content providers are created right
 * after the Application object (before Application.onCreate), so this boots the editor in
 * any app without hooking app-specific code. It serves no data.
 */
public final class MemoryEditorProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        Context c = getContext();
        if (c != null && c.getApplicationContext() instanceof Application) {
            MemoryEditor.install((Application) c.getApplicationContext());
        }
        return true;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
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
