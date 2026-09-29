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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/**
 * A bounded local record of successful video saves, checked off the UI thread.
 *
 * <p>The reader can forget it from settings. Forgetting takes every row out at once, keeps them in
 * memory for the settings banner's Undo and nowhere else, and moves the record to a new
 * generation: a save that was already running when the reader forgot records nothing, so the
 * record they emptied doesn't fill back up behind them. The saved files are left alone.
 */
public final class SavedVideoArchive {
    static final String DATABASE_NAME = "hushfeed-saved-videos.db";
    public static final int LIMIT = 10_000;

    /** Serializes writes, so a forget and a save finishing at the same moment can't interleave. */
    private static final Object LOCK = new Object();
    /** Moved on by every forget. A save records only into the generation it started in. */
    private static final AtomicLong GENERATION = new AtomicLong();
    /**
     * What the latest forget took, for its Undo. Set under {@link #LOCK} and never written out.
     * Read and let go of without the lock: the settings row asks about it and its banner expires
     * it on the main thread, which must not wait on a restore or a save's database write.
     */
    private static final AtomicReference<Snapshot> UNDO = new AtomicReference<>();

    public enum ForgetResult { FORGOTTEN, NOTHING_SAVED, FAILED }

    public enum UndoResult { RESTORED, EXPIRED, FAILED }

    private static final class Row {
        final String aid, name, uri, path;
        final long savedAt;

        Row(String aid, String name, String uri, String path, long savedAt) {
            this.aid = aid;
            this.name = name;
            this.uri = uri;
            this.path = path;
            this.savedAt = savedAt;
        }
    }

    private static final class Snapshot {
        final long generation;
        final List<Row> rows;

        Snapshot(long generation, List<Row> rows) {
            this.generation = generation;
            this.rows = rows;
        }
    }

    private SavedVideoArchive() {}

    /** The generation a save starts in, read as the save is accepted. */
    static long generation() {
        return GENERATION.get();
    }

    /**
     * Records a finished save, unless the record was forgotten after the save began.
     *
     * @param startedIn {@link #generation()} as the save was accepted
     */
    static void remember(Context context, String id, MediaFileWriter.Saved saved, long startedIn) {
        synchronized (LOCK) {
            if (GENERATION.get() != startedIn) return;
            remember(context, id, saved);
        }
    }

    private static void remember(Context context, String id, MediaFileWriter.Saved saved) {
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

    /**
     * Takes every row out of the record and keeps them in memory for {@link #undo}. Off the main
     * thread. A failure changes nothing, the Undo of an earlier forget included.
     *
     * @return the result, and through {@code forgotten} the generation an Undo must name
     */
    public static ForgetResult forget(Context context, long[] forgotten) {
        synchronized (LOCK) {
            List<Row> rows = new ArrayList<>();
            try (Database helper = new Database(context)) {
                SQLiteDatabase db = helper.getWritableDatabase();
                db.beginTransaction();
                try {
                    try (var cursor = db.query("saved_videos",
                            new String[]{"aid", "name", "uri", "path", "saved_at"},
                            null, null, null, null, "saved_at DESC", String.valueOf(LIMIT))) {
                        while (cursor.moveToNext()) {
                            rows.add(new Row(cursor.getString(0), cursor.getString(1),
                                    cursor.getString(2), cursor.getString(3), cursor.getLong(4)));
                        }
                    }
                    db.delete("saved_videos", null, null);
                    db.setTransactionSuccessful();
                } finally {
                    db.endTransaction();
                }
            } catch (RuntimeException failure) {
                Logger.printException(() -> "Could not forget the saved videos", failure);
                return ForgetResult.FAILED;
            }
            long generation = GENERATION.incrementAndGet();
            if (forgotten != null && forgotten.length > 0) forgotten[0] = generation;
            // A newer forget replaces an older Undo: putting that one back now would restore rows
            // the reader has since chosen to forget again.
            UNDO.set(rows.isEmpty() ? null : new Snapshot(generation, Collections.unmodifiableList(rows)));
            return rows.isEmpty() ? ForgetResult.NOTHING_SAVED : ForgetResult.FORGOTTEN;
        }
    }

    /**
     * Puts back what the forget of {@code generation} took, around anything saved since: a newer
     * save of the same video keeps its row, and the record stays within {@link #LIMIT} with the
     * oldest rows the first to go. Off the main thread.
     */
    public static UndoResult undo(Context context, long generation) {
        synchronized (LOCK) {
            Snapshot held = UNDO.get();
            if (held == null || held.generation != generation) return UndoResult.EXPIRED;
            try (Database helper = new Database(context)) {
                SQLiteDatabase db = helper.getWritableDatabase();
                db.beginTransaction();
                try {
                    for (Row row : held.rows) {
                        ContentValues values = new ContentValues();
                        values.put("aid", row.aid);
                        values.put("name", row.name);
                        values.put("uri", row.uri);
                        values.put("path", row.path);
                        values.put("saved_at", row.savedAt);
                        db.insertWithOnConflict("saved_videos", null, values, SQLiteDatabase.CONFLICT_IGNORE);
                    }
                    db.execSQL("DELETE FROM saved_videos WHERE aid IN (SELECT aid FROM saved_videos "
                            + "ORDER BY saved_at DESC, aid DESC LIMIT -1 OFFSET ?)", new Object[]{LIMIT});
                    db.setTransactionSuccessful();
                } finally {
                    db.endTransaction();
                }
            } catch (RuntimeException failure) {
                // Kept, so the reader can try again until the banner's time is up.
                Logger.printException(() -> "Could not put the saved videos back", failure);
                return UndoResult.FAILED;
            }
            // Unless the banner let go of it meanwhile, or a newer forget replaced it.
            UNDO.compareAndSet(held, null);
            return UndoResult.RESTORED;
        }
    }

    /** Whether the forget of {@code generation} can still be undone. */
    public static boolean canUndo(long generation) {
        Snapshot held = UNDO.get();
        return held != null && held.generation == generation;
    }

    /** Lets go of the rows the forget of {@code generation} took, once its Undo is gone. */
    public static void discardUndo(long generation) {
        Snapshot held = UNDO.get();
        if (held != null && held.generation == generation) UNDO.compareAndSet(held, null);
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
            Activity activity = Utils.getVisibleActivity();
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

    /** Forgets the in-memory Undo and the generation, as a new process would. Tests only. */
    static void resetForTests() {
        synchronized (LOCK) {
            UNDO.set(null);
            GENERATION.set(0);
        }
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
