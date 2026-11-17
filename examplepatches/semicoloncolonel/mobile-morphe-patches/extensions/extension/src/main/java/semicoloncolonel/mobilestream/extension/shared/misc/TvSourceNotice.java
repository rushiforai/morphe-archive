package semicoloncolonel.mobilestream.extension.shared.misc;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.UiModeManager;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

/**
 * Tells Android TV users of the combined patch bundle that future Android TV
 * patches come from the tv-morphe-patches source.
 *
 * The patch registers this provider in the manifest, so it starts with the app
 * without a hook in the app's own code. On a TV, it shows a dialog over the
 * first activity that resumes, until the viewer confirms it. On a phone it does
 * nothing.
 */
public final class TvSourceNotice extends ContentProvider {
    private static final String TAG = "MSP-TvSourceNotice";
    private static final String PREFS = "msp_tv_source_notice";
    private static final String KEY_SEEN = "seen";

    static final String TITLE = "Android TV patches have moved";
    static final String MESSAGE = "Starting with version 1.2.0, the phone patch source no longer "
            + "includes the Android TV patches. To keep receiving updates for this app, add the tv-morphe-patches "
            + "source in Morphe Manager and patch the app with it.\n\n"
            + "github.com/semicoloncolonel/tv-morphe-patches";

    private static boolean shownThisLaunch;

    @Override
    public boolean onCreate() {
        try {
            Context context = getContext();
            if (context == null || !isTelevision(context) || seen(context)) {
                return true;
            }
            Context app = context.getApplicationContext();
            if (app instanceof Application) {
                ((Application) app).registerActivityLifecycleCallbacks(new Callbacks());
            }
        } catch (Throwable t) {
            Log.w(TAG, "setup failed: " + t);
        }
        return true;
    }

    static boolean isTelevision(Context context) {
        UiModeManager uiMode = (UiModeManager) context.getSystemService(Context.UI_MODE_SERVICE);
        if (uiMode != null && uiMode.getCurrentModeType() == Configuration.UI_MODE_TYPE_TELEVISION) {
            return true;
        }
        PackageManager pm = context.getPackageManager();
        return pm.hasSystemFeature(PackageManager.FEATURE_LEANBACK)
                || pm.hasSystemFeature("android.software.leanback_only");
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static boolean seen(Context context) {
        return prefs(context).getBoolean(KEY_SEEN, false);
    }

    private static void show(Activity activity) {
        if (shownThisLaunch || activity.isFinishing() || seen(activity)) {
            return;
        }
        shownThisLaunch = true;
        // The framework dialog theme, so the app's own theme cannot break it.
        new AlertDialog.Builder(activity, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle(TITLE)
                .setMessage(MESSAGE)
                .setPositiveButton("OK", (dialog, which) ->
                        prefs(activity).edit().putBoolean(KEY_SEEN, true).apply())
                .show();
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity activity) {
            if (shownThisLaunch) {
                activity.getApplication().unregisterActivityLifecycleCallbacks(this);
                return;
            }
            // Posted, so the activity's window is attached before the dialog opens.
            activity.getWindow().getDecorView().post(() -> {
                try {
                    show(activity);
                } catch (Throwable t) {
                    Log.w(TAG, "show failed: " + t);
                }
            });
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }

    // A provider that holds no data.

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
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
