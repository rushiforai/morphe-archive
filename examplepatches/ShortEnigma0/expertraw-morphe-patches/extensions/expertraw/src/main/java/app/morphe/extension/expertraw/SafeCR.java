/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Expert RAW extension for Morphe. See LICENSE and NOTICE in the repository root.
 */
package app.morphe.extension.expertraw;

import android.content.ContentProviderOperation;
import android.content.ContentProviderResult;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.OperationApplicationException;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.RemoteException;
import android.util.Log;
import java.util.ArrayList;

/**
 * ContentResolver wrappers. A SecurityException from a provider a re-signed build can't use
 * (Samsung secmedia, GPPM, Gallery provider2) is logged and turned into an empty result.
 * secmedia is additionally emulated: queries via MediaStore, inserts get a synthetic row id.
 */
@SuppressWarnings("unused")
public final class SafeCR {
    private static final String TAG = PpBypass.TAG;

    private SafeCR() {}

    private static void denied(String what, Object uri) {
        Log.w(TAG, "SafeCR." + what + " denied: " + uri);
    }

    public static ContentProviderResult[] applyBatch(ContentResolver cr, String authority,
            ArrayList<ContentProviderOperation> ops) throws RemoteException, OperationApplicationException {
        try {
            return cr.applyBatch(authority, ops);
        } catch (SecurityException e) {
            denied("applyBatch", authority);
            return new ContentProviderResult[0];
        }
    }

    public static Bundle call(ContentResolver cr, Uri uri, String method, String arg, Bundle extras) {
        try {
            return cr.call(uri, method, arg, extras);
        } catch (SecurityException e) {
            denied("call", uri);
            return null;
        }
    }

    public static int delete(ContentResolver cr, Uri uri, Bundle extras) {
        try {
            return cr.delete(uri, extras);
        } catch (SecurityException e) {
            denied("delete", uri);
            return 0;
        }
    }

    public static int delete(ContentResolver cr, Uri uri, String where, String[] args) {
        try {
            return cr.delete(uri, where, args);
        } catch (SecurityException e) {
            denied("delete", uri);
            return 0;
        }
    }

    public static Uri insert(ContentResolver cr, Uri uri, ContentValues values) {
        try {
            return cr.insert(uri, values);
        } catch (SecurityException e) {
            denied("insert", uri);
            // Saving continues with a synthetic secmedia row id; the real file is written to DCIM
            // and indexed by MediaScanner.
            if (SecMediaShim.isSecMedia(uri)) {
                return ContentUris.withAppendedId(uri, System.currentTimeMillis() % 1_000_000_000L);
            }
            return null;
        }
    }

    public static Cursor query(ContentResolver cr, Uri uri, String[] proj, Bundle args, CancellationSignal cancel) {
        try {
            return cr.query(uri, proj, args, cancel);
        } catch (SecurityException e) {
            denied("query", uri);
            return SecMediaShim.isSecMedia(uri) ? SecMediaShim.query(cr, uri, proj, args) : null;
        }
    }

    public static Cursor query(ContentResolver cr, Uri uri, String[] proj, String sel, String[] selArgs, String sort) {
        try {
            return cr.query(uri, proj, sel, selArgs, sort);
        } catch (SecurityException e) {
            denied("query", uri);
            return SecMediaShim.isSecMedia(uri) ? SecMediaShim.query(cr, uri, proj, sel, selArgs, sort) : null;
        }
    }

    public static void registerContentObserver(ContentResolver cr, Uri uri, boolean descendants, ContentObserver o) {
        try {
            cr.registerContentObserver(uri, descendants, o);
        } catch (SecurityException e) {
            denied("registerContentObserver", uri);
            // secmedia notifications are unavailable; listen to MediaStore instead.
            if (SecMediaShim.isSecMedia(uri)) {
                cr.registerContentObserver(Uri.parse("content://media/external"), true, o);
            }
        }
    }

    public static int update(ContentResolver cr, Uri uri, ContentValues values, Bundle extras) {
        try {
            return cr.update(uri, values, extras);
        } catch (SecurityException e) {
            denied("update", uri);
            return 0;
        }
    }

    public static int update(ContentResolver cr, Uri uri, ContentValues values, String where, String[] args) {
        try {
            return cr.update(uri, values, where, args);
        } catch (SecurityException e) {
            denied("update", uri);
            return 0;
        }
    }
}
