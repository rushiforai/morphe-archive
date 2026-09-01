package com.pairip.vmencryption;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public final class KeyImportPlaceholderContentProvider extends ContentProvider {
    @Override // android.content.ContentProvider
    public boolean onCreate() {
        logKeyNotImported();
        return false;
    }

    @Override // android.content.ContentProvider
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        logKeyNotImported();
        return null;
    }

    @Override // android.content.ContentProvider
    public String getType(Uri uri) {
        logKeyNotImported();
        return null;
    }

    @Override // android.content.ContentProvider
    public Uri insert(Uri uri, ContentValues values) {
        logKeyNotImported();
        return null;
    }

    @Override // android.content.ContentProvider
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        logKeyNotImported();
        return 0;
    }

    @Override // android.content.ContentProvider
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        logKeyNotImported();
        return 0;
    }

    private static void logKeyNotImported() {
        Log.w("KeyNotImported", "Cannot handle content provider before key import is complete.  App needs to be restarted.");
    }
}
