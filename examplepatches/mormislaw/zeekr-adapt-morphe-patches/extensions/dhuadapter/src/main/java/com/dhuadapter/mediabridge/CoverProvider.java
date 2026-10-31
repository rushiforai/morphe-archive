package com.dhuadapter.mediabridge;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;

/**
 * Minimal ContentProvider that exposes the current track's album art as a
 * content:// Uri so Zeekr MediaCenter (a system app) can read it via
 * ContentResolver.openFileDescriptor.
 *
 * Declared into the patched APK's manifest by patch_manifest.py --provider:
 *   <provider android:name="com.dhuadapter.mediabridge.CoverProvider"
 *             android:authorities="<pkg>.dhucovers"
 *             android:exported="true"
 *             android:grantUriPermissions="true" />
 *
 * MediaBridge writes the bitmap to a private cache file, then calls
 * grantUriPermission("com.zeekr.mediacenter", uri, FLAG_GRANT_READ) before
 * handing the Uri over AIDL. The fd is opened by OUR process (owner of the
 * file — no SELinux conflict) and passed to system as a ParcelFileDescriptor.
 */
public final class CoverProvider extends ContentProvider {

    private static final String TAG = "DhuAdapter";
    private static final String COVER_FILE = "dhu_current_cover.png";

    private static volatile String authority;

    /** Compute authority as "<packageName>.dhucovers". */
    public static String authority(Context ctx) {
        return ctx.getPackageName() + ".dhucovers";
    }

    /**
     * Persist the given bitmap to the cache and return its content:// Uri,
     * or null on failure. Called by MediaBridge on metadata change.
     */
    public static Uri publish(Context ctx, Bitmap bmp) {
        if (ctx == null || bmp == null) {
            return null;
        }
        try {
            File f = new File(ctx.getCacheDir(), COVER_FILE);
            try (FileOutputStream fos = new FileOutputStream(f)) {
                bmp.compress(Bitmap.CompressFormat.PNG, 100, fos);
            }
            String auth = authority(ctx);
            authority = auth;
            // Cache-busting query param so MediaCenter re-reads on change.
            return new Uri.Builder()
                    .scheme("content")
                    .authority(auth)
                    .path("cover")
                    .appendQueryParameter("v", String.valueOf(System.currentTimeMillis()))
                    .build();
        } catch (Exception e) {
            Log.e(TAG, "CoverProvider.publish failed", e);
            return null;
        }
    }

    @Override
    public boolean onCreate() {
        Context ctx = getContext();
        if (ctx != null) {
            authority = authority(ctx);
        }
        return true;
    }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode) {
        Context ctx = getContext();
        if (ctx == null) {
            return null;
        }
        File f = new File(ctx.getCacheDir(), COVER_FILE);
        if (!f.exists()) {
            return null;
        }
        try {
            return ParcelFileDescriptor.open(f, ParcelFileDescriptor.MODE_READ_ONLY);
        } catch (Exception e) {
            Log.e(TAG, "CoverProvider.openFile failed", e);
            return null;
        }
    }

    @Override
    public String getType(Uri uri) {
        return "image/png";
    }

    @Override
    public Cursor query(Uri uri, String[] p, String s, String[] a, String o) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues v) {
        return null;
    }

    @Override
    public int delete(Uri uri, String s, String[] a) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues v, String s, String[] a) {
        return 0;
    }
}
