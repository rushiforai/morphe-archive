/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
 */
package com.samsung.android.app.galaxyraw.mod;

import android.content.ContentResolver;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

/**
 * MOD: Stand-in for Samsung's private "secmedia" provider, which a re-signed Expert RAW cannot read.
 * Re-runs the query against the standard MediaStore "files" table and returns a cursor with the
 * secmedia column names the app expects (used by the camera's latest-photo thumbnail / quick view).
 */
public final class SecMediaShim {
    private static final String TAG = "GrawMod";
    private static final Uri FILES = Uri.parse("content://media/external/file");
    private static final String[] MS_PROJ = {
        "_id", "_data", "title", "mime_type", "datetaken", "date_modified",
        "orientation", "width", "height", "bucket_id", "media_type"
    };

    private SecMediaShim() {}

    public static boolean isSecMedia(Uri uri) {
        return uri != null && "secmedia".equals(uri.getAuthority());
    }

    /** query(Uri, String[], String, String[], String) form. */
    public static Cursor query(ContentResolver cr, Uri uri, String[] proj, String sel, String[] args, String sort) {
        return run(cr, proj, sel, args, sort, uri);
    }

    /** query(Uri, String[], Bundle, CancellationSignal) form. */
    public static Cursor query(ContentResolver cr, Uri uri, String[] proj, Bundle qa) {
        String sel = qa == null ? null : qa.getString(ContentResolver.QUERY_ARG_SQL_SELECTION);
        String[] args = qa == null ? null : qa.getStringArray(ContentResolver.QUERY_ARG_SQL_SELECTION_ARGS);
        String sort = qa == null ? null : qa.getString(ContentResolver.QUERY_ARG_SQL_SORT_ORDER);
        return run(cr, proj, sel, args, sort, uri);
    }

    private static Cursor run(ContentResolver cr, String[] proj, String sel, String[] args, String sort, Uri uri) {
        // Only rows for a specific id (content://secmedia/media/<id>) or list queries are supported.
        String id = null;
        if (uri.getPathSegments().size() >= 2) id = uri.getLastPathSegment();
        // Samsung-only columns have no MediaStore equivalent; only the "latest media" style queries
        // (which ask for _data_draft) and per-id lookups are translated. Everything else stays empty.
        boolean latest = contains(proj, "_data_draft");
        if (!latest && id == null) return empty(proj);
        String s;
        String[] a;
        if (id != null) {
            s = "_id=?";
            a = new String[]{id};
        } else {
            s = translate(sel);
            a = args;
            if (sel != null && (sel.contains("burst_group_id") || sel.contains("group_type"))) return empty(proj);
        }
        String o = sort == null ? "datetaken DESC, _id DESC" : sort.replace("datetime", "datetaken");
        Bundle qa = new Bundle();
        if (s != null) qa.putString(ContentResolver.QUERY_ARG_SQL_SELECTION, s);
        if (a != null) qa.putStringArray(ContentResolver.QUERY_ARG_SQL_SELECTION_ARGS, a);
        qa.putString(ContentResolver.QUERY_ARG_SQL_SORT_ORDER, o);
        qa.putInt(ContentResolver.QUERY_ARG_LIMIT, 50);
        String[] outCols = proj != null ? proj : MS_PROJ;
        MatrixCursor out = new MatrixCursor(outCols);
        try (Cursor c = cr.query(FILES, MS_PROJ, qa, null)) {
            if (c == null) return out;
            while (c.moveToNext()) {
                Object[] row = new Object[outCols.length];
                for (int i = 0; i < outCols.length; i++) row[i] = value(c, outCols[i]);
                out.addRow(row);
            }
        } catch (RuntimeException e) {
            Log.w(TAG, "SecMediaShim query failed: " + e + " sel=" + s);
        }
        Log.i(TAG, "SecMediaShim: " + out.getCount() + " row(s) for " + uri);
        return out;
    }

    private static String translate(String sel) {
        if (sel == null) return null;
        return sel
            .replace("(is_hide != 1 OR is_hide is NULL)", "1=1")
            .replace("datetime", "datetaken");
    }

    private static Object value(Cursor c, String col) {
        switch (col) {
            case "_id": case "media_id": return c.getLong(0);
            case "_data": return c.getString(1);
            case "title": return c.getString(2);
            case "mime_type": return c.getString(3);
            case "datetime": return c.isNull(4) ? c.getLong(5) * 1000L : c.getLong(4);
            case "orientation": return c.getInt(6);
            case "width": return c.getInt(7);
            case "height": return c.getInt(8);
            case "bucket_id": return c.getLong(9);
            case "media_type": return c.getInt(10);
            case "is_cloud": return 1;           // local-only
            case "is_trashed": case "is_hide": case "group_type": case "sef_file_type": case "best_image": return 0;
            default: return null;                // _data_draft, cloud_thumb_path, burst_group_id, ...
        }
    }

    private static boolean contains(String[] arr, String v) {
        if (arr == null) return false;
        for (String s : arr) if (v.equals(s)) return true;
        return false;
    }

    private static Cursor empty(String[] proj) {
        return new MatrixCursor(proj != null ? proj : new String[]{"_id"});
    }
}
