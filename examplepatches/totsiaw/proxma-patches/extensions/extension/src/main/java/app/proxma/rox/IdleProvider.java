package app.proxma.rox;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

/**
 * Does nothing as a provider. Android creates every declared provider when the app's process
 * starts, whatever started it (a push message, a job, an alarm or the app icon), so this is the
 * one place that sees every ROX process and can let IdleClose watch it.
 */
public final class IdleProvider extends ContentProvider {

    @Override public boolean onCreate() {
        try {
            IdleClose.onProcessStart(getContext());
        } catch (Throwable t) {
            Log.w("PROXMA_ROX", "IDLE_PROVIDER_ERR " + t);
        }
        return true;
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) {
        return null;
    }

    @Override public String getType(Uri uri) {
        return null;
    }

    @Override public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override public int delete(Uri uri, String selection, String[] args) {
        return 0;
    }

    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) {
        return 0;
    }
}
