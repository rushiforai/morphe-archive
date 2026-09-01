package com.facebook.internal;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import defpackage.f94;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class FacebookInitProvider extends ContentProvider {
    @Override // android.content.ContentProvider
    public final int delete(Uri uri, String str, String[] strArr) {
        uri.getClass();
        return 0;
    }

    @Override // android.content.ContentProvider
    public final String getType(Uri uri) {
        uri.getClass();
        return null;
    }

    @Override // android.content.ContentProvider
    public final Uri insert(Uri uri, ContentValues contentValues) {
        uri.getClass();
        return null;
    }

    @Override // android.content.ContentProvider
    public final boolean onCreate() {
        try {
            Context context = getContext();
            if (context == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            f94 f94Var = f94.a;
            synchronized (f94.class) {
                f94.j(context);
            }
            return false;
        } catch (Exception e) {
            Log.i("FacebookInitProvider", "Failed to auto initialize the Facebook SDK", e);
            return false;
        }
    }

    @Override // android.content.ContentProvider
    public final Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        uri.getClass();
        return null;
    }

    @Override // android.content.ContentProvider
    public final int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        uri.getClass();
        return 0;
    }
}
