package com.gdjztech.ringconn.provider;

import android.app.Activity;
import android.app.Application;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import com.gdjztech.ringconn.engine.IntervalsSyncEngine;
import com.gdjztech.ringconn.ui.HookHelper;
import java.io.File;
import java.util.ArrayList;

public class HealthDataProvider extends ContentProvider {
    private SQLiteDatabase db;

    @Override
    public boolean onCreate() {
        try {
            Context context = getContext();
            if (context != null) {
                Context appCtx = context.getApplicationContext();
                if (appCtx instanceof Application) {
                    ((Application) appCtx).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                        @Override
                        public void onActivityResumed(Activity activity) {
                            if (activity != null && !activity.getClass().getName().contains("IntervalsActivity")) {
                                HookHelper.attachFloatingButton(activity);
                                checkAutoSync(activity);
                            }
                        }

                        @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
                        @Override public void onActivityStarted(Activity activity) {}
                        @Override public void onActivityPaused(Activity activity) {}
                        @Override public void onActivityStopped(Activity activity) {}
                        @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
                        @Override public void onActivityDestroyed(Activity activity) {}
                    });

                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                SQLiteDatabase database = getDbInstance(appCtx);
                                if (database != null) {
                                    database.execSQL("UPDATE UserInfo SET isOSAHSAgreeTerm = 1, hasOpenOSAReport = 1 WHERE isOSAHSAgreeTerm != 1 OR hasOpenOSAReport != 1;");
                                }
                            } catch (Exception ignored) {}
                        }
                    }).start();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    private static SQLiteDatabase sDb;

    public static synchronized SQLiteDatabase getDbInstance(Context context) {
        if (sDb != null && sDb.isOpen()) {
            return sDb;
        }
        if (context == null) return null;
        try {
            File dbFile = context.getDatabasePath("ring_conn.db");
            if (dbFile != null && dbFile.exists()) {
                sDb = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READWRITE);
                try {
                    sDb.execSQL("PRAGMA busy_timeout = 5000;");
                } catch (Exception ignored) {}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sDb;
    }

    private SQLiteDatabase getDb() {
        return getDbInstance(getContext());
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        SQLiteDatabase database = getDb();
        if (database == null) return null;
        String path = uri.getPath();
        if (path == null) path = "";
        String last = uri.getLastPathSegment();

        String table = "SleepSyncModel";
        if (last != null && !last.isEmpty()) {
            if ("sleep".equalsIgnoreCase(last) || last.contains("SleepSyncModel")) {
                table = "SleepSyncModel";
            } else if ("daily".equalsIgnoreCase(last) || last.contains("DailyModel")) {
                table = "DailyModel";
            } else if ("temp".equalsIgnoreCase(last) || last.contains("TempOffsetModel")) {
                table = "TempOffsetModel";
            } else if ("history_hr".equalsIgnoreCase(last) || last.contains("HistoryHrModel")) {
                table = "HistoryHrModel";
            } else {
                table = last; // Direct table name (e.g. sqlite_master or any table)
            }
        }

        try {
            return database.query(table, projection, selection, selectionArgs, null, null, sortOrder);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        Bundle result = new Bundle();
        SQLiteDatabase database = getDb();
        if (database == null) {
            result.putBoolean("success", false);
            result.putString("error", "Database not opened");
            return result;
        }

        try {
            if ("getTables".equalsIgnoreCase(method)) {
                ArrayList<String> tables = new ArrayList<>();
                Cursor c = database.rawQuery("SELECT name FROM sqlite_master WHERE type='table'", null);
                if (c != null) {
                    while (c.moveToNext()) {
                        tables.add(c.getString(0));
                    }
                    c.close();
                }
                result.putStringArrayList("tables", tables);
                result.putBoolean("success", true);
                return result;
            } else if ("exportBackup".equalsIgnoreCase(method)) {
                String status = IntervalsSyncEngine.exportLocalBackup(getContext());
                result.putString("status", status);
                result.putBoolean("success", true);
                return result;
            } else if ("rawQuery".equalsIgnoreCase(method) && arg != null) {
                Cursor c = database.rawQuery(arg, null);
                if (c != null) {
                    result.putInt("rowCount", c.getCount());
                    c.close();
                }
                result.putBoolean("success", true);
                return result;
            }
        } catch (Exception e) {
            result.putBoolean("success", false);
            result.putString("error", e.getMessage());
        }
        return result;
    }

    @Override
    public String getType(Uri uri) {
        return "vnd.android.cursor.dir/vnd.com.gdjztech.ringconn.provider";
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    private static long sLastAutoSyncCheck = 0;

    private static void checkAutoSync(final Context context) {
        if (context == null) return;
        long now = System.currentTimeMillis();
        if (now - sLastAutoSyncCheck < 10 * 60 * 1000) return; // at most once every 10 min
        sLastAutoSyncCheck = now;

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    android.content.SharedPreferences prefs = IntervalsSyncEngine.getPrefs(context);
                    boolean autoSync = prefs.getBoolean(IntervalsSyncEngine.KEY_AUTO_SYNC, true);
                    if (!autoSync) return;

                    long lastSync = prefs.getLong(IntervalsSyncEngine.KEY_LAST_SYNC_TIME, 0);
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.getDefault());
                    String todayStr = sdf.format(new java.util.Date());
                    String lastSyncStr = lastSync > 0 ? sdf.format(new java.util.Date(lastSync)) : "";

                    if (!todayStr.equals(lastSyncStr) || (System.currentTimeMillis() - lastSync > 4 * 3600 * 1000)) {
                        SQLiteDatabase database = getDbInstance(context);
                        if (database != null) {
                            Cursor c = null;
                            try {
                                c = database.rawQuery("SELECT dateSleep FROM SleepSyncModel ORDER BY dateSleep DESC LIMIT 1", null);
                                if (c != null && c.moveToFirst()) {
                                    String latestDate = c.getString(0);
                                    if (latestDate != null && !latestDate.isEmpty()) {
                                        IntervalsSyncEngine.syncDate(context, latestDate);
                                    }
                                }
                            } finally {
                                if (c != null) c.close();
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
