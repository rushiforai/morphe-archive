// Based on SysAdminDoc/HushMessenger (GPL-3.0), extensions/messenger/src/main/java/app/hushmessenger/extension/SettingsProvider.java:
// a non-exported ContentProvider used only to initialise before Application.onCreate, with no data operations;
// modified 2026-10-14: main-process check, Heval engine and crash guard, a safe-mode notice, never throws.

package app.template.extension.hevalcontrols;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

/**
 * Starts Heval Controls early. The patch declares it with {@code android:exported="false"} and a
 * high {@code android:initOrder}, so Android creates it in the main process before the app's own
 * providers and before {@code Application.onCreate}. It serves no data: queries answer null and
 * writes are refused.
 */
@SuppressWarnings("unused")
public final class InitProvider extends ContentProvider {
    private static final String TAG = "HevalControls";

    @Override
    public boolean onCreate() {
        try {
            final Context context = getContext();
            if (context == null || !AppContext.isMainProcess(context)) return true;
            final long start = SystemClock.uptimeMillis();
            HevalSettings.init(context);
            CrashGuard.onProcessStart(context);
            Log.i(TAG, "Patch settings started in " + (SystemClock.uptimeMillis() - start) + " ms (paused="
                    + HevalSettings.isPaused() + ", safeMode=" + HevalSettings.isSafeMode()
                    + ", engineFailed=" + HevalSettings.isEngineFailed() + ")");
            if (CrashGuard.enteredSafeModeThisStart()) {
                final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            Toast.makeText(app, "Patch settings turned off its features after repeated crashes. "
                                    + "Open Patch settings to resume.", Toast.LENGTH_LONG).show();
                        } catch (Throwable ignored) {
                            // A notice is optional.
                        }
                    }
                });
            }
        } catch (Throwable failure) {
            // Never break the app's startup: hooks fall back to their defaults or stock behaviour.
            Log.e(TAG, "Patch settings could not start: " + failure.getClass().getName());
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
        throw new UnsupportedOperationException();
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }
}
