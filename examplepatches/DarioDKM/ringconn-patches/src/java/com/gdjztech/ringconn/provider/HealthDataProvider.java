package com.gdjztech.ringconn.provider;

import android.app.Activity;
import android.app.Application;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import android.os.Bundle;
import com.gdjztech.ringconn.engine.IntervalsSyncEngine;
import com.gdjztech.ringconn.ui.HookHelper;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public class HealthDataProvider extends ContentProvider {
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
                                enforceGen2Capabilities(activity);
                            }
                        }

                        @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}
                        @Override public void onActivityStarted(Activity activity) {}
                        @Override public void onActivityPaused(Activity activity) {}
                        @Override public void onActivityStopped(Activity activity) {}
                        @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
                        @Override public void onActivityDestroyed(Activity activity) {}
                    });

                    enforceGen2Capabilities(appCtx);

                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                applyResearchFlags(getDbInstance(appCtx));
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

    /** Einziger verbleibender Schreibpfad, app-intern, nie ueber die IPC-Oberflaeche erreichbar. */
    private static void applyResearchFlags(SQLiteDatabase database) {
        if (database == null) return;
        try {
            database.execSQL("UPDATE UserInfo SET isOSAHSAgreeTerm = 1, hasOpenOSAReport = 1, researchUser = 1"
                    + " WHERE isOSAHSAgreeTerm != 1 OR hasOpenOSAReport != 1 OR researchUser != 1;");
        } catch (Exception ignored) {}
    }

    public static void enforceGen2Capabilities(Context context) {
        if (context == null) return;
        try {
            SharedPreferences prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE);
            String devInfo = prefs.getString("flutter.DeviceInfo", null);
            if (devInfo != null) {
                JSONObject obj = new JSONObject(devInfo);
                boolean changed = false;
                if (obj.optInt("deviceType", 0) != 2) {
                    obj.put("deviceType", 2);
                    changed = true;
                }
                JSONArray feats = obj.optJSONArray("features");
                if (feats == null) {
                    feats = new JSONArray();
                    feats.put(1);
                    feats.put(2);
                    feats.put(3);
                    obj.put("features", feats);
                    changed = true;
                } else {
                    boolean has1 = false;
                    for (int i = 0; i < feats.length(); i++) {
                        if (feats.optInt(i) == 1) {
                            has1 = true;
                            break;
                        }
                    }
                    if (!has1) {
                        feats.put(1);
                        obj.put("features", feats);
                        changed = true;
                    }
                }
                if (changed) {
                    prefs.edit().putString("flutter.DeviceInfo", obj.toString()).apply();
                }
            }
        } catch (Exception ignored) {}
    }

    /** Einzige Berechtigung, die Fremd-Apps Lesezugriff gibt. Muss im Manifest deklariert sein. */
    public static final String PERMISSION_READ =
            "com.gdjztech.ringconn.permission.ACCESS_HEALTH_DATA";

    /** Abschliessende Liste lesbarer Tabellen. Alles andere wird abgelehnt. */
    private static final Set<String> ALLOWED_TABLES = Collections.unmodifiableSet(
            new HashSet<>(Arrays.asList(
                    "SleepSyncModel",
                    "DailyModel",
                    "TempOffsetModel",
                    "HistoryHrModel",
                    "HistoryHrSyncInfo",   // Tagespuls und Intraday-HRV (CyclingCoach)
                    "PressureAsyncModel",  // Tagesstress (CyclingCoach)
                    "OSADataModel")));

    private static final Map<String, String> TABLE_ALIASES;
    static {
        Map<String, String> m = new HashMap<>();
        m.put("sleep", "SleepSyncModel");
        m.put("daily", "DailyModel");
        m.put("temp", "TempOffsetModel");
        m.put("history_hr", "HistoryHrModel");
        m.put("osa", "OSADataModel");
        TABLE_ALIASES = Collections.unmodifiableMap(m);
    }

    /**
     * Loest ein URI-Pfadsegment auf einen freigegebenen Tabellennamen auf.
     * Wirft, statt einen beliebigen Bezeichner in das FROM zu reichen.
     */
    private static String resolveTable(Uri uri) {
        String seg = uri != null ? uri.getLastPathSegment() : null;
        if (seg == null || seg.isEmpty()) {
            throw new IllegalArgumentException("Kein Tabellensegment in der URI");
        }
        String alias = TABLE_ALIASES.get(seg.toLowerCase(Locale.US));
        String table = alias != null ? alias : seg;
        if (!ALLOWED_TABLES.contains(table)) {
            throw new IllegalArgumentException("Tabelle nicht freigegeben: " + seg);
        }
        return table;
    }

    /** Spaltennamen je Tabelle, zur Laufzeit aus der DB gelesen statt hart kodiert. */
    private static final Map<String, Set<String>> COLUMN_CACHE = new HashMap<>();

    private static synchronized Set<String> columnsOf(SQLiteDatabase db, String table) {
        Set<String> cached = COLUMN_CACHE.get(table);
        if (cached != null) return cached;
        Set<String> cols = new HashSet<>();
        Cursor c = null;
        try {
            c = db.query(table, null, null, null, null, null, null, "0");
            if (c != null) Collections.addAll(cols, c.getColumnNames());
        } catch (Exception ignored) {
        } finally {
            if (c != null) c.close();
        }
        Set<String> immutable = Collections.unmodifiableSet(cols);
        COLUMN_CACHE.put(table, immutable);
        return immutable;
    }

    /**
     * Schluesselwoerter und Kommentarzeichen, die in selection und sortOrder nichts zu suchen
     * haben. Gesucht wird mit Wortgrenzen statt mit Leerzeichen: die fruehere Pruefung auf
     * " union " liess sich mit einem Zeilenumbruch oder Tab umgehen ("1=1\nUNION\nSELECT ...").
     * Spaltennamen wie "updateTime" bleiben erlaubt, weil dort keine Wortgrenze folgt.
     */
    private static final java.util.regex.Pattern FORBIDDEN_SQL = java.util.regex.Pattern.compile(
            "(;|--|/\\*|\\*/|\\b(union|select|attach|detach|pragma|insert|update|delete|drop|alter|create|replace|vacuum|reindex)\\b)",
            java.util.regex.Pattern.CASE_INSENSITIVE);

    /**
     * Konservativer Filter fuer selection und sortOrder. setStrict() gibt es erst ab API 30,
     * minSdk ist 26, also braucht es fuer 26 bis 29 eine eigene Schranke.
     */
    private static void rejectSuspiciousSelection(String selection) {
        if (selection == null) return;
        if (FORBIDDEN_SQL.matcher(selection).find()) {
            throw new IllegalArgumentException("Unzulaessige selection-Klausel");
        }
    }

    /**
     * Zweite Verteidigungslinie hinter android:permission im Manifest.
     * Der eigene Prozess darf immer, jede andere App braucht PERMISSION_READ.
     */
    private void enforceCaller() {
        Context ctx = getContext();
        if (ctx == null) throw new SecurityException("Kein Provider-Kontext");

        // Kein laufender IPC, also der eigene Prozess. checkCallingPermission wuerde hier
        // faelschlich DENIED liefern, weil die App ihre eigene Permission nicht anfordert.
        if (android.os.Binder.getCallingPid() == android.os.Process.myPid()) return;

        String caller = getCallingPackage();
        if (caller != null && caller.equals(ctx.getPackageName())) return;

        if (ctx.checkCallingPermission(PERMISSION_READ) != PackageManager.PERMISSION_GRANTED) {
            throw new SecurityException("Zugriff verweigert: "
                    + (caller != null ? caller : "unbekannter Aufrufer")
                    + " haelt " + PERMISSION_READ + " nicht");
        }
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
        enforceCaller();
        // Jede berechtigte Abfrage darf einen Abgleich anstossen (gedrosselt, laeuft im Hintergrund).
        checkAutoSyncInternal(getContext());

        // Wirft bei unbekanntem Segment, statt es in das FROM zu reichen.
        String table = resolveTable(uri);

        SQLiteDatabase database = getDb();
        if (database == null) return null;

        rejectSuspiciousSelection(selection);
        rejectSuspiciousSelection(sortOrder);

        SQLiteQueryBuilder qb = new SQLiteQueryBuilder();
        qb.setTables(table);

        // Projektionsmap aus den echten Spalten der Tabelle: unbekannte Spalten werden
        // abgelehnt, ohne dass hier ein Schema fest verdrahtet ist.
        Map<String, String> projectionMap = new HashMap<>();
        for (String col : columnsOf(database, table)) {
            projectionMap.put(col, col);
        }
        if (!projectionMap.isEmpty()) {
            qb.setProjectionMap(projectionMap);
        }

        // setStrict verbietet zusaetzlich angehaengte Klauseln, gibt es aber erst ab API 30.
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
            qb.setStrict(true);
        }

        try {
            Cursor c = qb.query(database, projection, selection, selectionArgs, null, null, sortOrder);
            Context ctx = getContext();
            if (c != null && ctx != null) {
                c.setNotificationUri(ctx.getContentResolver(), uri);
            }
            return c;
        } catch (IllegalArgumentException e) {
            // Unbekannte Spalte oder abgelehnte Klausel: dem Aufrufer sagen, was los ist.
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        enforceCaller();

        Bundle result = new Bundle();
        SQLiteDatabase database = getDb();
        if (database == null) {
            result.putBoolean("success", false);
            result.putString("error", "Database not opened");
            return result;
        }

        try {
            if ("triggerSync".equalsIgnoreCase(method)) {
                String today = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.US).format(new java.util.Date());
                org.json.JSONObject res = IntervalsSyncEngine.syncDate(getContext(), today);
                result.putBoolean("success", res != null && res.optBoolean("success", false));
                return result;
            }

            // Einzige IPC-Methode ist triggerSync. Kein execSql, rawQuery oder getTables, und auch
            // kein exportBackup (schrieb Gesundheitsdaten in den oeffentlichen Download-Ordner) oder
            // enforceGen2 (Schreibzugriff auf die DB): beides war mit einer reinen
            // Leseberechtigung ausloesbar. Das Framework prueft android:permission bei call()
            // nicht, hier schuetzt nur enforceCaller().
            result.putBoolean("success", false);
            result.putString("error", "Unsupported method: " + method);
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
        throw new UnsupportedOperationException("Provider ist ausschliesslich lesend");
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("Provider ist ausschliesslich lesend");
    }

    // ---------------------------------------------------------------------------------------
    // Auto-Sync nach intervals.icu (seit 1.3.2)
    //
    // Frueher: hoechstens einmal pro Tag bzw. alle 4 Stunden, nur beim Oeffnen von RingConn.
    // Wurde RingConn geoeffnet, bevor der Ring die Nacht uebertragen hatte, lud der Patch die
    // vorletzte Nacht hoch und sperrte danach 4 Stunden. Jetzt entscheidet allein, ob sich eine
    // der letzten Naechte gegenueber dem zuletzt erfolgreich hochgeladenen Stand geaendert hat
    // (neue Nacht, nachtraeglich neu berechnete Nacht, frueherer Fehlschlag).
    // Ausloeser: RingConn kommt in den Vordergrund (plus zwei Nachpruefungen, damit eine Nacht,
    // die waehrend der Sitzung vom Ring kommt, nicht liegen bleibt) und jede Abfrage einer
    // berechtigten App ueber diesen Provider, etwa der stuendliche Worker von CyclingCoach.
    // ---------------------------------------------------------------------------------------

    private static final String KEY_SYNCED_NIGHTS = "synced_night_signatures";
    private static final long MIN_CHECK_INTERVAL_MS = 60 * 1000;
    private static final int NIGHTS_TO_CHECK = 3;
    private static long sLastAutoSyncCheck = 0;
    private static boolean sSyncRunning = false;

    private static void checkAutoSync(final Context context) {
        if (context == null) return;
        checkAutoSyncInternal(context.getApplicationContext() != null ? context.getApplicationContext() : context);
        // Nachpruefung nach 90 s und 5 min: in dieser Zeit uebertraegt der Ring meist die Nacht.
        final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        android.os.Handler h = new android.os.Handler(android.os.Looper.getMainLooper());
        h.postDelayed(new Runnable() { @Override public void run() { checkAutoSyncInternal(app); } }, 90 * 1000);
        h.postDelayed(new Runnable() { @Override public void run() { checkAutoSyncInternal(app); } }, 5 * 60 * 1000);
    }

    private static synchronized void checkAutoSyncInternal(final Context context) {
        if (context == null || sSyncRunning) return;
        long now = System.currentTimeMillis();
        if (now - sLastAutoSyncCheck < MIN_CHECK_INTERVAL_MS) return;
        sLastAutoSyncCheck = now;
        sSyncRunning = true;

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    SharedPreferences prefs = IntervalsSyncEngine.getPrefs(context);
                    if (!prefs.getBoolean(IntervalsSyncEngine.KEY_AUTO_SYNC, true)) return;
                    String athlete = prefs.getString(IntervalsSyncEngine.KEY_ATHLETE_ID, "");
                    String key = prefs.getString(IntervalsSyncEngine.KEY_API_KEY, "");
                    if (athlete == null || athlete.isEmpty() || key == null || key.isEmpty()) return;

                    SQLiteDatabase database = getDbInstance(context);
                    if (database == null) return;

                    JSONObject synced;
                    try {
                        synced = new JSONObject(prefs.getString(KEY_SYNCED_NIGHTS, "{}"));
                    } catch (Exception e) {
                        synced = new JSONObject();
                    }

                    // Aelteste zuerst, damit ein Rueckstand in der richtigen Reihenfolge ankommt.
                    java.util.List<String[]> nights = new java.util.ArrayList<>();
                    Cursor c = null;
                    try {
                        c = database.rawQuery(
                                "SELECT dateSleep, sleepDuration, updateTime, deepDuration, remDuration FROM SleepSyncModel "
                                        + "WHERE sleepDuration > 0 ORDER BY dateSleep DESC LIMIT " + NIGHTS_TO_CHECK, null);
                        while (c != null && c.moveToNext()) {
                            String date = c.getString(0);
                            if (date == null || date.isEmpty()) continue;
                            String sig = c.getString(1) + "|" + c.getString(2) + "|" + c.getString(3) + "|" + c.getString(4);
                            nights.add(0, new String[]{date, sig});
                        }
                    } finally {
                        if (c != null) c.close();
                    }

                    boolean changed = false;
                    for (String[] n : nights) {
                        if (n[1].equals(synced.optString(n[0], null))) continue;
                        JSONObject res = IntervalsSyncEngine.syncDate(context, n[0]);
                        if (res != null && res.optBoolean("success", false)) {
                            synced.put(n[0], n[1]);
                            changed = true;
                        }
                    }

                    if (changed) {
                        // Nur die juengsten Eintraege behalten.
                        JSONObject pruned = new JSONObject();
                        for (String[] n : nights) {
                            if (synced.has(n[0])) pruned.put(n[0], synced.getString(n[0]));
                        }
                        prefs.edit().putString(KEY_SYNCED_NIGHTS, pruned.toString()).apply();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    synchronized (HealthDataProvider.class) { sSyncRunning = false; }
                }
            }
        }).start();
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("Provider ist ausschliesslich lesend");
    }
}
