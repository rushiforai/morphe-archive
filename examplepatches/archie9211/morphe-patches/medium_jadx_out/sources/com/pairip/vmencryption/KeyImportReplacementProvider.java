package com.pairip.vmencryption;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public class KeyImportReplacementProvider extends ContentProvider {
    private static final String TAG = "KeyImport.Provider";

    @Override // android.content.ContentProvider
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override // android.content.ContentProvider
    public String getType(Uri uri) {
        return null;
    }

    @Override // android.content.ContentProvider
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override // android.content.ContentProvider
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override // android.content.ContentProvider
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        Log.d(TAG, "KeyImportReplacementProvider.onCreate called - applying application swap");
        Context context = getContext();
        if (context == null) {
            return true;
        }
        Context applicationContext = context.getApplicationContext();
        if (!(applicationContext instanceof KeyImportApplication)) {
            return true;
        }
        ((KeyImportApplication) applicationContext).replaceApplicationReferences();
        return true;
    }
}
