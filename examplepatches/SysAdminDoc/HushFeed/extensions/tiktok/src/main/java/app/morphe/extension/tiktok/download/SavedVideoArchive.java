/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.download;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.os.Bundle;
import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;

/** A bounded local record of successful video saves, checked off the UI thread. */
public final class SavedVideoArchive {
    static final String DATABASE_NAME = "hushfeed-saved-videos.db";
    public static final int LIMIT = 10_000;
    private SavedVideoArchive() {}

    static void remember(Context context, String id, MediaFileWriter.Saved saved) {
        try (Database helper = new Database(context)) {
            SQLiteDatabase db = helper.getWritableDatabase();
            ContentValues row = new ContentValues();
            row.put("aid", id);
            row.put("name", saved.name);
            row.put("uri", saved.uri == null ? "" : saved.uri.toString());
            row.put("path", saved.file == null ? "" : saved.file.getAbsolutePath());
            row.put("saved_at", System.currentTimeMillis());
            db.beginTransaction();
            try {
                if (db.insertWithOnConflict("saved_videos", null, row, SQLiteDatabase.CONFLICT_REPLACE) == -1) {
                    throw new android.database.sqlite.SQLiteException("Could not remember the saved video");
                }
                db.execSQL("DELETE FROM saved_videos WHERE aid IN (SELECT aid FROM saved_videos "
                        + "ORDER BY saved_at DESC, aid DESC LIMIT -1 OFFSET ?)", new Object[]{LIMIT});
                db.setTransactionSuccessful();
            } finally {
                db.endTransaction();
            }
        }
    }

    static MediaFileWriter.Saved find(Context context, String id) {
        MediaFileWriter.Saved saved;
        try (Database helper = new Database(context);
             var cursor = helper.getReadableDatabase().query("saved_videos", new String[]{"name", "uri", "path"},
                     "aid=?", new String[]{id}, null, null, null)) {
            if (!cursor.moveToFirst()) return null;
            String uri = cursor.getString(1);
            String path = cursor.getString(2);
            saved = new MediaFileWriter.Saved(cursor.getString(0), uri.isEmpty() ? null : Uri.parse(uri),
                    path.isEmpty() ? null : new File(path));
        }
        if (saved.uri == null) return saved.file != null && saved.file.isFile() && saved.file.length() > 0 ? saved : null;
        try (var file = context.getContentResolver().openFileDescriptor(saved.uri, "r")) {
            return file != null && file.getStatSize() != 0 ? saved : null;
        } catch (IOException | SecurityException missing) {
            // A deleted file or revoked access must not stop a new save. Keep the row because
            // permissions can return, and it is still bounded by the same retention limit.
            return null;
        }
    }

    static void offer(MediaFileWriter.Saved saved, Runnable saveAgain, Runnable release) {
        Utils.runOnMainThread(() -> {
            Activity activity = Utils.getActivity();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                release.run();
                Utils.showToastLong(L10n.t("This video is already saved. Open TikTok to save another copy."));
                return;
            }
            AtomicBoolean saving = new AtomicBoolean();
            try {
                SettingsUi.syncDarkMode(activity);
                AlertDialog dialog = new AlertDialog.Builder(activity)
                        .setTitle(L10n.t("This video is already saved"))
                        .setMessage(saved.name)
                        .setNegativeButton(L10n.t("Open"), (ignored, which) -> SaveNotice.open(saved))
                        .setPositiveButton(L10n.t("Save again"), (ignored, which) -> {
                            saving.set(true);
                            saveAgain.run();
                        })
                        .setNeutralButton(L10n.t("Cancel"), null).create();
                Application application = activity.getApplication();
                Application.ActivityLifecycleCallbacks lifecycle = new Application.ActivityLifecycleCallbacks() {
                    @Override public void onActivityDestroyed(Activity destroyed) {
                        if (destroyed == activity) dialog.dismiss();
                    }
                    @Override public void onActivityCreated(Activity item, Bundle state) { }
                    @Override public void onActivityStarted(Activity item) { }
                    @Override public void onActivityResumed(Activity item) { }
                    @Override public void onActivityPaused(Activity item) { }
                    @Override public void onActivityStopped(Activity item) { }
                    @Override public void onActivitySaveInstanceState(Activity item, Bundle state) { }
                };
                dialog.setOnDismissListener(ignored -> {
                    application.unregisterActivityLifecycleCallbacks(lifecycle);
                    if (!saving.get()) release.run();
                });
                dialog.setOnShowListener(ignored -> SettingsUi.styleStandardAlertDialog(dialog));
                application.registerActivityLifecycleCallbacks(lifecycle);
                try {
                    dialog.show();
                } catch (RuntimeException failure) {
                    application.unregisterActivityLifecycleCallbacks(lifecycle);
                    throw failure;
                }
            } catch (RuntimeException failure) {
                release.run();
                Logger.printException(() -> "Could not offer the previously saved video", failure);
                Utils.showToastLong(L10n.t("The saved-video choice couldn't open. Try again."));
            }
        });
    }

    private static final class Database extends SQLiteOpenHelper {
        Database(Context context) { super(context.getApplicationContext(), DATABASE_NAME, null, 1); }
        @Override public void onCreate(SQLiteDatabase db) {
            db.execSQL("CREATE TABLE saved_videos (aid TEXT PRIMARY KEY NOT NULL, name TEXT NOT NULL, "
                    + "uri TEXT NOT NULL, path TEXT NOT NULL, saved_at INTEGER NOT NULL)");
            db.execSQL("CREATE INDEX saved_videos_recency ON saved_videos(saved_at)");
        }
        @Override public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            throw new IllegalStateException("Unsupported saved-video archive upgrade");
        }
    }
}
