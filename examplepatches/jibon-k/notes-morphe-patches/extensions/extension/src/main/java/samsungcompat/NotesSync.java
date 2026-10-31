package samsungcompat;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

import samsungcompat.sync.SyncPlanner;
import samsungcompat.sync.SyncRunner;

/** Experimental folder sync. Runs on "Sync now" and quietly whenever the app comes to the foreground. */
public final class NotesSync {
    private static final String PREFS = "oneport_notes_sync";
    private static final String TREE_URI = "tree_uri";
    private static final String DEVICE_ID = "device_id";
    private static final String TAG = "OnePortSync";
    private static final long TOMBSTONE_RETENTION_MS = 90L * 24 * 60 * 60 * 1000;
    private static final AtomicBoolean RUNNING = new AtomicBoolean();
    private static final long AUTO_SYNC_MIN_INTERVAL_MS = 30_000;
    private static int startedActivities;
    private static long lastAutoSync = -AUTO_SYNC_MIN_INTERVAL_MS;

    private NotesSync() {}

    /**
     * Syncs when the app comes to the foreground, at most every 30 s. Skipped when it comes back
     * into the editor, because an open note is not detected yet.
     */
    public static void installAutoSync(Application app) {
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityStarted(Activity activity) {
                if (startedActivities++ > 0) return;
                if (activity.getClass().getName().contains("Composer")) return;
                long now = SystemClock.elapsedRealtime();
                if (now - lastAutoSync < AUTO_SYNC_MIN_INTERVAL_MS) return;
                if (!hasSyncFolder(activity)) return;
                lastAutoSync = now;
                Log.i(TAG, "Auto sync on app open");
                run(activity, true);
            }
            @Override public void onActivityStopped(Activity activity) {
                if (startedActivities > 0) startedActivities--;
            }
            @Override public void onActivityCreated(Activity activity, Bundle state) {}
            @Override public void onActivityResumed(Activity activity) {}
            @Override public void onActivityPaused(Activity activity) {}
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
            @Override public void onActivityDestroyed(Activity activity) {}
        });
    }

    public static boolean hasSyncFolder(Context context) {
        return prefs(context).getString(TREE_URI, null) != null;
    }

    public static void onFolderSelected(Context context, Uri treeUri) {
        if (context == null || treeUri == null) return;
        try {
            context.getContentResolver().takePersistableUriPermission(treeUri,
                Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
            prefs(context).edit().putString(TREE_URI, treeUri.toString()).apply();
            show(context, "Sync folder saved");
        } catch (Exception e) {
            show(context, "Could not access that sync folder");
            Log.e(TAG, "Unable to access selected sync folder", e);
        }
    }

    /** See {@link NotesSyncStore#rememberRestored}; skipped while a sync runs (it rewrites the state). */
    static void rememberRestored(Context context, String uuid, String originalHash) {
        if (!RUNNING.compareAndSet(false, true)) return;
        try {
            new NotesSyncStore(context, stateDir(context)).rememberRestored(uuid, originalHash);
        } catch (Exception e) {
            Log.w(TAG, "Could not record restored note " + uuid, e);
        } finally {
            RUNNING.set(false);
        }
    }

    private static File stateDir(Context context) {
        return new File(context.getFilesDir(), "oneport_sync");
    }

    public static void syncNow(Context context) {
        run(context, false);
    }

    /** quiet: report only changes and failures, not "nothing to do" or "already running". */
    private static void run(Context context, boolean quiet) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        String value = prefs(app).getString(TREE_URI, null);
        if (value == null) {
            if (!quiet) show(app, "Choose a sync folder first");
            return;
        }
        if (!RUNNING.compareAndSet(false, true)) {
            if (!quiet) show(app, "Sync is already running");
            return;
        }
        Uri tree = Uri.parse(value);
        new Thread(() -> {
            String message;
            boolean noChanges = false;
            try {
                if (!NoteFiles.treeExists(app, tree)) {
                    prefs(app).edit().remove(TREE_URI).apply();
                    throw new FolderGoneException();
                }
                String deviceId = deviceId(app);
                SyncRunner runner = new SyncRunner(deviceId,
                    new SyncPlanner(deviceId, Build.MODEL, "4.4.48.15-port", TOMBSTONE_RETENTION_MS),
                    new NotesSyncFolder(app.getContentResolver(), tree),
                    new NotesSyncStore(app, stateDir(app)));
                SyncRunner.Result result = runner.run(System.currentTimeMillis());
                for (String warning : result.warnings) Log.w(TAG, warning);
                if (result.success) {
                    SyncPlanner.Plan plan = result.plan;
                    int changes = plan.actions.size();
                    noChanges = changes == 0;
                    message = "Sync done: " + changes + (changes == 1 ? " change" : " changes")
                        + (plan.conflicts > 0 ? ", " + plan.conflicts + " conflicts kept as copies" : "")
                        + (plan.waiting > 0 ? ", " + plan.waiting + " waiting for files" : "")
                        + (plan.skippedExcluded > 0 ? ", " + plan.skippedExcluded + " locked or busy skipped" : "");
                } else {
                    message = "Sync could not finish; nothing was published";
                    Log.e(TAG, "Sync failed", result.error);
                }
            } catch (FolderGoneException e) {
                message = "The sync folder was deleted or moved. Choose it again";
            } catch (SecurityException e) {
                prefs(app).edit().remove(TREE_URI).apply();
                message = "Choose the sync folder again";
                Log.e(TAG, "Sync folder permission expired", e);
            } catch (Exception e) {
                message = "Sync could not finish";
                Log.e(TAG, "Sync failed", e);
            } finally {
                RUNNING.set(false);
            }
            Log.i(TAG, "Result: " + message);
            if (!(quiet && noChanges)) show(app, message);
        }, "NotesSync").start();
    }

    /** Random, created on first use; never derived from hardware IDs. */
    private static String deviceId(Context context) {
        SharedPreferences prefs = prefs(context);
        String id = prefs.getString(DEVICE_ID, null);
        if (id == null) {
            id = UUID.randomUUID().toString();
            prefs.edit().putString(DEVICE_ID, id).commit();
        }
        return id;
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static void show(Context context, String text) {
        Context app = context.getApplicationContext();
        new Handler(Looper.getMainLooper()).post(() ->
            Toast.makeText(app, text, Toast.LENGTH_LONG).show());
    }
}
