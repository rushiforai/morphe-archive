package app.template.extension.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/**
 * Installs the {@link StravaTouchLock} lifecycle callback at the earliest
 * possible moment. Content providers are created right after
 * Application.attachBaseContext(), so the callback is registered before any
 * activity can resume.
 */
public final class StravaLockInitProvider extends ContentProvider {

    @Override
    public boolean onCreate() {
        try {
            StravaTouchLock.install(getContext());
        } catch (Throwable ignored) {
            // never break app startup
        }
        return true;
    }

    @Override public Cursor query(Uri uri, String[] p, String s, String[] a, String o) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues v) { return null; }
    @Override public int delete(Uri uri, String s, String[] a) { return 0; }
    @Override public int update(Uri uri, ContentValues v, String s, String[] a) { return 0; }
}
