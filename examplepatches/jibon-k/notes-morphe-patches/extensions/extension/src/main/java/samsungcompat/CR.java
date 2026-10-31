package samsungcompat;

import android.content.ContentProviderResult;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import java.util.ArrayList;

/** ContentResolver bridge used by the OnePort patcher for Samsung-only providers. */
public final class CR {
    private CR() {}

    public static Cursor query(ContentResolver cr, Uri uri, String[] projection,
            String selection, String[] args, String sort) {
        try { return cr.query(uri, projection, selection, args, sort); }
        catch (IllegalArgumentException e) { return unknown(e, null); }
    }

    public static Cursor query(ContentResolver cr, Uri uri, String[] projection,
            String selection, String[] args, String sort, CancellationSignal signal) {
        try { return cr.query(uri, projection, selection, args, sort, signal); }
        catch (IllegalArgumentException e) { return unknown(e, null); }
    }

    public static Cursor query(ContentResolver cr, Uri uri, String[] projection,
            Bundle args, CancellationSignal signal) {
        try { return cr.query(uri, projection, args, signal); }
        catch (IllegalArgumentException e) { return unknown(e, null); }
    }

    public static Bundle call(ContentResolver cr, Uri uri, String method, String arg, Bundle extras) {
        try { return cr.call(uri, method, arg, extras); }
        catch (IllegalArgumentException e) { return unknown(e, null); }
    }

    public static Bundle call(ContentResolver cr, String authority, String method, String arg, Bundle extras) {
        try { return cr.call(authority, method, arg, extras); }
        catch (IllegalArgumentException e) { return unknown(e, null); }
    }

    public static ContentProviderResult[] applyBatch(ContentResolver cr, String authority, ArrayList ops) {
        try { return cr.applyBatch(authority, ops); }
        catch (Exception e) { return unknown(e, new ContentProviderResult[0]); }
    }

    public static int bulkInsert(ContentResolver cr, Uri uri, ContentValues[] values) {
        try { return cr.bulkInsert(uri, values); }
        catch (IllegalArgumentException e) { return unknown(e, 0); }
    }

    public static int delete(ContentResolver cr, Uri uri, String where, String[] args) {
        try { return cr.delete(uri, where, args); }
        catch (IllegalArgumentException e) { return unknown(e, 0); }
    }

    public static int delete(ContentResolver cr, Uri uri, Bundle args) {
        try { return cr.delete(uri, args); }
        catch (IllegalArgumentException e) { return unknown(e, 0); }
    }

    public static Uri insert(ContentResolver cr, Uri uri, ContentValues values) {
        try { return cr.insert(uri, values); }
        catch (IllegalArgumentException e) { return unknown(e, null); }
    }

    public static Uri insert(ContentResolver cr, Uri uri, ContentValues values, Bundle extras) {
        try { return cr.insert(uri, values, extras); }
        catch (IllegalArgumentException e) { return unknown(e, null); }
    }

    public static int update(ContentResolver cr, Uri uri, ContentValues values,
            String where, String[] args) {
        try { return cr.update(uri, values, where, args); }
        catch (IllegalArgumentException e) { return unknown(e, 0); }
    }

    public static int update(ContentResolver cr, Uri uri, ContentValues values, Bundle args) {
        try { return cr.update(uri, values, args); }
        catch (IllegalArgumentException e) { return unknown(e, 0); }
    }

    public static void registerContentObserver(ContentResolver cr, Uri uri, boolean descendants,
            ContentObserver observer) {
        try { cr.registerContentObserver(uri, descendants, observer); }
        catch (IllegalArgumentException e) { unknown(e, null); }
    }

    public static void unregisterContentObserver(ContentResolver cr, ContentObserver observer) {
        cr.unregisterContentObserver(observer);
    }

    private static <T> T unknown(IllegalArgumentException e, T fallback) {
        String message = e.getMessage();
        if (message != null && message.contains("Unknown ")) return fallback;
        throw e;
    }

    private static <T> T unknown(Exception e, T fallback) {
        String message = e.getMessage();
        if (message != null && (message.contains("Unknown ") || message.contains("No content provider"))) return fallback;
        throw new IllegalStateException(e);
    }
}
