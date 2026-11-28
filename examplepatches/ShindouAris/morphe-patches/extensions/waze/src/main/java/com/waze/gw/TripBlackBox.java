package com.waze.gw;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Log;

import java.io.BufferedWriter;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Local, bounded trip recorder used as a privacy-conscious "black box" for field reports.
 *
 * Location callbacks only publish immutable samples. SQLite writes, retention and GPX export run
 * away from Waze's native/location thread, so a slow flash device cannot stall navigation or AA.
 */
public final class TripBlackBox {
    static final String PREF_ENABLED = "trip_blackbox_enabled";
    private static final String PREFS = "waze_hud_gw";
    private static final String TAG = "WazeGW-BlackBox";
    private static final int KEEP_TRIPS = 10;
    private static final long TRIP_GAP_MS = 10L * 60L * 1000L;
    private static final long MOVING_SAMPLE_MS = 2_000L;
    private static final long STILL_SAMPLE_MS = 10_000L;
    private static final int MOVING_SPEED_KMH = 4;
    private static final AtomicLong LAST_PUBLISHED_ELAPSED = new AtomicLong(0L);
    private static final ExecutorService IO = Executors.newSingleThreadExecutor(
            new ThreadFactory() {
                @Override public Thread newThread(Runnable runnable) {
                    Thread thread = new Thread(runnable, "WazeMod-TripBlackBox");
                    thread.setDaemon(true);
                    return thread;
                }
            });

    private static volatile Db helper;

    private TripBlackBox() { }

    static boolean enabled(Context context) {
        if (context == null) return false;
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(PREF_ENABLED, true);
    }

    static void onEnabledChanged(final Context context, boolean enabled) {
        if (context == null || enabled) return;
        final Context app = app(context);
        IO.execute(new Runnable() {
            @Override public void run() {
                try {
                    SQLiteDatabase db = db(app).getWritableDatabase();
                    closeActiveTrip(db, System.currentTimeMillis());
                } catch (Throwable error) {
                    Log.w(TAG, "Unable to close trip after recorder was disabled", error);
                }
            }
        });
    }

    static void onPosition(Context context, double latitude, double longitude, int speedKmh,
                           int limitKmh, int bearingDeg, double accuracyM, boolean matched,
                           long segmentId, String street) {
        if (context == null || !enabled(context) || !validCoordinate(latitude, longitude)) return;
        long elapsed = SystemClock.elapsedRealtime();
        long previous = LAST_PUBLISHED_ELAPSED.get();
        if (previous > 0L && elapsed - previous < 1_000L) return;
        if (!LAST_PUBLISHED_ELAPSED.compareAndSet(previous, elapsed)) return;
        final Context app = app(context);
        final Sample sample = new Sample(System.currentTimeMillis(),
                latitude, longitude, Math.max(0, speedKmh), limitKmh,
                bearingDeg, accuracyM, matched, segmentId, street);
        IO.execute(new Runnable() {
            @Override public void run() {
                try { record(app, sample); }
                catch (Throwable error) { Log.w(TAG, "Trip sample rejected safely", error); }
            }
        });
    }

    static List<TripSummary> listTrips(Context context) {
        ArrayList<TripSummary> result = new ArrayList<TripSummary>();
        if (context == null) return result;
        Cursor cursor = null;
        try {
            SQLiteDatabase database = db(app(context)).getWritableDatabase();
            closeStaleTrip(database, System.currentTimeMillis());
            cursor = database.rawQuery("SELECT id,start_ms,end_ms,distance_m,moving_speed_sum,"
                    + "moving_samples,max_speed,overspeed_count,point_count,state "
                    + "FROM trips ORDER BY start_ms DESC LIMIT " + KEEP_TRIPS, null);
            while (cursor.moveToNext()) {
                long movingSamples = cursor.getLong(5);
                double average = movingSamples <= 0L ? 0.0 : cursor.getDouble(4) / movingSamples;
                result.add(new TripSummary(cursor.getLong(0), cursor.getLong(1),
                        cursor.getLong(2), cursor.getDouble(3), average,
                        cursor.getInt(6), cursor.getInt(7), cursor.getInt(8),
                        cursor.getInt(9) == 1));
            }
        } catch (Throwable error) {
            Log.w(TAG, "Unable to list recorded trips", error);
        } finally {
            if (cursor != null) cursor.close();
        }
        return result;
    }

    static boolean exportGpx(Context context, long tripId, Uri destination) {
        if (context == null || tripId <= 0L || destination == null) return false;
        Cursor trip = null;
        Cursor points = null;
        OutputStream output = null;
        BufferedWriter writer = null;
        try {
            SQLiteDatabase database = db(app(context)).getReadableDatabase();
            trip = database.rawQuery("SELECT start_ms,end_ms,distance_m,overspeed_count "
                    + "FROM trips WHERE id=?", new String[]{String.valueOf(tripId)});
            if (!trip.moveToFirst()) return false;
            long startMs = trip.getLong(0);
            long endMs = trip.getLong(1);
            double distanceM = trip.getDouble(2);
            int overspeedCount = trip.getInt(3);
            points = database.rawQuery("SELECT time_ms,lat_e6,lon_e6,speed_kmh,limit_kmh,"
                    + "accuracy_cm,bearing_deg,matched,segment_id,street FROM points "
                    + "WHERE trip_id=? ORDER BY time_ms,id", new String[]{String.valueOf(tripId)});

            output = context.getContentResolver().openOutputStream(destination, "w");
            if (output == null) return false;
            writer = new BufferedWriter(new OutputStreamWriter(output, "UTF-8"), 64 * 1024);
            writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
            writer.write("<gpx version=\"1.1\" creator=\"Waze Mod Trip Black Box\" ");
            writer.write("xmlns=\"http://www.topografix.com/GPX/1/1\" ");
            writer.write("xmlns:wz=\"https://wazemod.io.vn/gpx/1\" ");
            writer.write("xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" ");
            writer.write("xsi:schemaLocation=\"http://www.topografix.com/GPX/1/1 ");
            writer.write("http://www.topografix.com/GPX/1/1/gpx.xsd\">\n");
            writer.write("  <metadata><time>" + isoUtc(startMs) + "</time><desc>");
            writer.write(xml(String.format(Locale.US,
                    "Waze Mod black box; distance %.3f km; overspeed episodes %d",
                    distanceM / 1000.0, overspeedCount)));
            writer.write("</desc></metadata>\n  <trk><name>");
            writer.write(xml("Waze Mod trip " + localStamp(startMs)));
            writer.write("</name><desc>");
            writer.write(xml("Recorded " + localStamp(startMs) + " - " + localStamp(endMs)));
            writer.write("</desc><trkseg>\n");
            while (points.moveToNext()) {
                double lat = points.getInt(1) / 1000000.0;
                double lon = points.getInt(2) / 1000000.0;
                int speed = points.getInt(3);
                int limit = points.getInt(4);
                int accuracyCm = points.getInt(5);
                int bearing = points.getInt(6);
                boolean matched = points.getInt(7) != 0;
                long segment = points.getLong(8);
                String street = points.getString(9);
                writer.write(String.format(Locale.US,
                        "    <trkpt lat=\"%.6f\" lon=\"%.6f\"><time>%s</time>",
                        lat, lon, isoUtc(points.getLong(0))));
                // Kept for broad GPX viewer compatibility; exact km/h is also in our extension.
                writer.write(String.format(Locale.US, "<speed>%.3f</speed><extensions>",
                        speed / 3.6));
                writer.write("<wz:speed_kmh>" + speed + "</wz:speed_kmh>");
                if (limit > 0) writer.write("<wz:speed_limit_kmh>" + limit
                        + "</wz:speed_limit_kmh>");
                if (accuracyCm >= 0) writer.write(String.format(Locale.US,
                        "<wz:accuracy_m>%.2f</wz:accuracy_m>", accuracyCm / 100.0));
                if (bearing >= 0) writer.write("<wz:bearing_deg>" + bearing
                        + "</wz:bearing_deg>");
                writer.write("<wz:map_matched>" + matched + "</wz:map_matched>");
                if (segment > 0L) writer.write("<wz:segment_id>" + segment
                        + "</wz:segment_id>");
                if (street != null && street.length() > 0) writer.write("<wz:street>"
                        + xml(street) + "</wz:street>");
                writer.write("</extensions></trkpt>\n");
            }
            writer.write("  </trkseg></trk></gpx>\n");
            writer.flush();
            writer.close();
            writer = null;
            output = null;
            Log.i(TAG, "Exported trip id=" + tripId + " destination=" + destination.getScheme());
            return true;
        } catch (Throwable error) {
            Log.e(TAG, "Unable to export trip id=" + tripId, error);
            return false;
        } finally {
            try { if (writer != null) writer.close(); } catch (Throwable ignored) { }
            try { if (output != null) output.close(); } catch (Throwable ignored) { }
            if (points != null) points.close();
            if (trip != null) trip.close();
        }
    }

    static void deleteAll(final Context context) {
        if (context == null) return;
        final Context app = app(context);
        IO.execute(new Runnable() {
            @Override public void run() {
                try {
                    SQLiteDatabase database = db(app).getWritableDatabase();
                    database.beginTransaction();
                    try {
                        database.delete("points", null, null);
                        database.delete("trips", null, null);
                        database.setTransactionSuccessful();
                    } finally { database.endTransaction(); }
                } catch (Throwable error) {
                    Log.w(TAG, "Unable to clear trip history", error);
                }
            }
        });
    }

    private static void record(Context context, Sample sample) {
        if (!enabled(context)) return;
        SQLiteDatabase database = db(context).getWritableDatabase();
        database.beginTransaction();
        try {
            ActiveTrip active = activeTrip(database);
            boolean moving = sample.speedKmh >= MOVING_SPEED_KMH;
            if (active != null && (sample.timeMs - active.lastPointMs >= TRIP_GAP_MS
                    || (!moving && sample.timeMs - active.lastMovingMs >= TRIP_GAP_MS))) {
                finish(database, active.id, active.lastPointMs);
                active = null;
            }
            if (active == null) {
                if (!moving) {
                    database.setTransactionSuccessful();
                    return;
                }
                active = createTrip(database, sample);
                trim(database);
            }

            long interval = moving ? MOVING_SAMPLE_MS : STILL_SAMPLE_MS;
            if (active.pointCount > 0 && sample.timeMs - active.lastPointMs < interval) {
                database.setTransactionSuccessful();
                return;
            }

            double stepM = 0.0;
            if (active.pointCount > 0) {
                stepM = distanceM(active.lastLatitude(), active.lastLongitude(),
                        sample.latitude, sample.longitude);
                double seconds = Math.max(0.001, (sample.timeMs - active.lastPointMs) / 1000.0);
                double allowance = Math.max(250.0, seconds * 100.0
                        + Math.max(0.0, sample.accuracyM) * 2.0);
                if (!Double.isFinite(stepM) || stepM > allowance
                        || (!sample.matched && sample.accuracyM > 100.0)) stepM = 0.0;
            }

            boolean overspeed = sample.limitKmh >= 10 && sample.speedKmh > sample.limitKmh;
            int episodes = active.overspeedCount + (overspeed && !active.wasOverspeed ? 1 : 0);
            long movingSamples = active.movingSamples + (moving ? 1L : 0L);
            double movingSum = active.movingSpeedSum + (moving ? sample.speedKmh : 0.0);

            ContentValues point = new ContentValues();
            point.put("trip_id", active.id);
            point.put("time_ms", sample.timeMs);
            point.put("lat_e6", (int) Math.round(sample.latitude * 1000000.0));
            point.put("lon_e6", (int) Math.round(sample.longitude * 1000000.0));
            point.put("speed_kmh", sample.speedKmh);
            point.put("limit_kmh", sample.limitKmh);
            point.put("accuracy_cm", sample.accuracyM < 0.0 ? -1
                    : (int) Math.min(Integer.MAX_VALUE, Math.round(sample.accuracyM * 100.0)));
            point.put("bearing_deg", sample.bearingDeg);
            point.put("matched", sample.matched ? 1 : 0);
            point.put("segment_id", sample.segmentId);
            point.put("street", limited(sample.street, 180));
            database.insertOrThrow("points", null, point);

            ContentValues update = new ContentValues();
            update.put("end_ms", sample.timeMs);
            update.put("last_point_ms", sample.timeMs);
            update.put("last_moving_ms", moving ? sample.timeMs : active.lastMovingMs);
            update.put("last_lat_e6", (int) Math.round(sample.latitude * 1000000.0));
            update.put("last_lon_e6", (int) Math.round(sample.longitude * 1000000.0));
            update.put("distance_m", active.distanceM + stepM);
            update.put("moving_speed_sum", movingSum);
            update.put("moving_samples", movingSamples);
            update.put("max_speed", Math.max(active.maxSpeed, sample.speedKmh));
            update.put("overspeed_count", episodes);
            update.put("was_overspeed", overspeed ? 1 : 0);
            update.put("point_count", active.pointCount + 1);
            database.update("trips", update, "id=?", new String[]{String.valueOf(active.id)});
            database.setTransactionSuccessful();
        } finally { database.endTransaction(); }
    }

    private static ActiveTrip createTrip(SQLiteDatabase database, Sample sample) {
        ContentValues values = new ContentValues();
        values.put("start_ms", sample.timeMs);
        values.put("end_ms", sample.timeMs);
        values.put("last_point_ms", 0L);
        values.put("last_moving_ms", sample.timeMs);
        values.put("last_lat_e6", 0);
        values.put("last_lon_e6", 0);
        values.put("state", 1);
        long id = database.insertOrThrow("trips", null, values);
        return new ActiveTrip(id, sample.timeMs, 0L, sample.timeMs, 0, 0,
                0.0, 0.0, 0L, 0, 0, false, 0);
    }

    private static ActiveTrip activeTrip(SQLiteDatabase database) {
        Cursor cursor = null;
        try {
            cursor = database.rawQuery("SELECT id,start_ms,last_point_ms,last_moving_ms,"
                    + "last_lat_e6,last_lon_e6,distance_m,moving_speed_sum,moving_samples,"
                    + "max_speed,overspeed_count,was_overspeed,point_count FROM trips "
                    + "WHERE state=1 ORDER BY id DESC LIMIT 1", null);
            if (!cursor.moveToFirst()) return null;
            return new ActiveTrip(cursor.getLong(0), cursor.getLong(1), cursor.getLong(2),
                    cursor.getLong(3), cursor.getInt(4), cursor.getInt(5), cursor.getDouble(6),
                    cursor.getDouble(7), cursor.getLong(8), cursor.getInt(9), cursor.getInt(10),
                    cursor.getInt(11) != 0, cursor.getInt(12));
        } finally { if (cursor != null) cursor.close(); }
    }

    private static void closeStaleTrip(SQLiteDatabase database, long now) {
        ActiveTrip active = activeTrip(database);
        if (active != null && active.lastPointMs > 0L && now - active.lastPointMs >= TRIP_GAP_MS)
            finish(database, active.id, active.lastPointMs);
    }

    private static void closeActiveTrip(SQLiteDatabase database, long now) {
        ActiveTrip active = activeTrip(database);
        if (active != null) finish(database, active.id,
                active.lastPointMs > 0L ? active.lastPointMs : now);
    }

    private static void finish(SQLiteDatabase database, long id, long endMs) {
        ContentValues values = new ContentValues();
        values.put("state", 0);
        values.put("end_ms", endMs);
        values.put("was_overspeed", 0);
        database.update("trips", values, "id=?", new String[]{String.valueOf(id)});
    }

    private static void trim(SQLiteDatabase database) {
        Cursor cursor = null;
        ArrayList<Long> old = new ArrayList<Long>();
        try {
            cursor = database.rawQuery("SELECT id FROM trips ORDER BY start_ms DESC LIMIT -1 OFFSET "
                    + KEEP_TRIPS, null);
            while (cursor.moveToNext()) old.add(Long.valueOf(cursor.getLong(0)));
        } finally { if (cursor != null) cursor.close(); }
        for (Long id : old) {
            String[] where = {String.valueOf(id.longValue())};
            database.delete("points", "trip_id=?", where);
            database.delete("trips", "id=?", where);
        }
    }

    private static Db db(Context context) {
        Db value = helper;
        if (value != null) return value;
        synchronized (TripBlackBox.class) {
            if (helper == null) helper = new Db(app(context));
            return helper;
        }
    }

    private static Context app(Context context) {
        Context application = context.getApplicationContext();
        return application == null ? context : application;
    }

    private static boolean validCoordinate(double latitude, double longitude) {
        return Double.isFinite(latitude) && Double.isFinite(longitude)
                && latitude >= -90.0 && latitude <= 90.0
                && longitude >= -180.0 && longitude <= 180.0
                && !(Math.abs(latitude) < 0.000001 && Math.abs(longitude) < 0.000001);
    }

    private static double distanceM(double lat1, double lon1, double lat2, double lon2) {
        double p1 = Math.toRadians(lat1), p2 = Math.toRadians(lat2);
        double dp = Math.toRadians(lat2 - lat1), dl = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dp / 2.0) * Math.sin(dp / 2.0)
                + Math.cos(p1) * Math.cos(p2)
                * Math.sin(dl / 2.0) * Math.sin(dl / 2.0);
        return 6371000.0 * 2.0 * Math.atan2(Math.sqrt(a), Math.sqrt(1.0 - a));
    }

    private static String xml(String value) {
        if (value == null) return "";
        return value.replace("&", "&amp;").replace("<", "&lt;")
                .replace(">", "&gt;").replace("\"", "&quot;")
                .replace("'", "&apos;");
    }

    private static String limited(String value, int max) {
        if (value == null) return "";
        String clean = value.replace('\t', ' ').replace('\n', ' ').replace('\r', ' ').trim();
        return clean.length() <= max ? clean : clean.substring(0, max);
    }

    private static String isoUtc(long timeMs) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        return format.format(new Date(timeMs));
    }

    private static String localStamp(long timeMs) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault())
                .format(new Date(timeMs));
    }

    static final class TripSummary {
        final long id;
        final long startMs;
        final long endMs;
        final double distanceM;
        final double averageSpeedKmh;
        final int maxSpeedKmh;
        final int overspeedCount;
        final int pointCount;
        final boolean active;

        TripSummary(long id, long startMs, long endMs, double distanceM,
                    double averageSpeedKmh, int maxSpeedKmh, int overspeedCount,
                    int pointCount, boolean active) {
            this.id = id;
            this.startMs = startMs;
            this.endMs = endMs;
            this.distanceM = distanceM;
            this.averageSpeedKmh = averageSpeedKmh;
            this.maxSpeedKmh = maxSpeedKmh;
            this.overspeedCount = overspeedCount;
            this.pointCount = pointCount;
            this.active = active;
        }
    }

    private static final class Sample {
        final long timeMs, segmentId;
        final double latitude, longitude, accuracyM;
        final int speedKmh, limitKmh, bearingDeg;
        final boolean matched;
        final String street;

        Sample(long timeMs, double latitude, double longitude, int speedKmh,
               int limitKmh, int bearingDeg, double accuracyM, boolean matched, long segmentId,
               String street) {
            this.timeMs = timeMs;
            this.latitude = latitude;
            this.longitude = longitude;
            this.speedKmh = speedKmh;
            this.limitKmh = limitKmh;
            this.bearingDeg = bearingDeg;
            this.accuracyM = accuracyM;
            this.matched = matched;
            this.segmentId = segmentId;
            this.street = street == null ? "" : street;
        }
    }

    private static final class ActiveTrip {
        final long id, startMs, lastPointMs, lastMovingMs, movingSamples;
        final int lastLatE6, lastLonE6, maxSpeed, overspeedCount, pointCount;
        final double distanceM, movingSpeedSum;
        final boolean wasOverspeed;

        ActiveTrip(long id, long startMs, long lastPointMs, long lastMovingMs,
                   int lastLatE6, int lastLonE6, double distanceM, double movingSpeedSum,
                   long movingSamples, int maxSpeed, int overspeedCount,
                   boolean wasOverspeed, int pointCount) {
            this.id = id;
            this.startMs = startMs;
            this.lastPointMs = lastPointMs;
            this.lastMovingMs = lastMovingMs;
            this.lastLatE6 = lastLatE6;
            this.lastLonE6 = lastLonE6;
            this.distanceM = distanceM;
            this.movingSpeedSum = movingSpeedSum;
            this.movingSamples = movingSamples;
            this.maxSpeed = maxSpeed;
            this.overspeedCount = overspeedCount;
            this.wasOverspeed = wasOverspeed;
            this.pointCount = pointCount;
        }

        double lastLatitude() { return lastLatE6 / 1000000.0; }
        double lastLongitude() { return lastLonE6 / 1000000.0; }
    }

    private static final class Db extends SQLiteOpenHelper {
        Db(Context context) { super(context, "wazemod_blackbox.db", null, 1); }

        @Override public void onConfigure(SQLiteDatabase database) {
            super.onConfigure(database);
            database.setForeignKeyConstraintsEnabled(true);
        }

        @Override public void onCreate(SQLiteDatabase database) {
            database.execSQL("CREATE TABLE trips (id INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "start_ms INTEGER NOT NULL,end_ms INTEGER NOT NULL,last_point_ms INTEGER NOT NULL,"
                    + "last_moving_ms INTEGER NOT NULL,last_lat_e6 INTEGER NOT NULL DEFAULT 0,"
                    + "last_lon_e6 INTEGER NOT NULL DEFAULT 0,distance_m REAL NOT NULL DEFAULT 0,"
                    + "moving_speed_sum REAL NOT NULL DEFAULT 0,moving_samples INTEGER NOT NULL DEFAULT 0,"
                    + "max_speed INTEGER NOT NULL DEFAULT 0,overspeed_count INTEGER NOT NULL DEFAULT 0,"
                    + "was_overspeed INTEGER NOT NULL DEFAULT 0,point_count INTEGER NOT NULL DEFAULT 0,"
                    + "state INTEGER NOT NULL DEFAULT 1)");
            database.execSQL("CREATE TABLE points (id INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "trip_id INTEGER NOT NULL,time_ms INTEGER NOT NULL,lat_e6 INTEGER NOT NULL,"
                    + "lon_e6 INTEGER NOT NULL,speed_kmh INTEGER NOT NULL,limit_kmh INTEGER NOT NULL,"
                    + "accuracy_cm INTEGER NOT NULL,bearing_deg INTEGER NOT NULL,matched INTEGER NOT NULL,"
                    + "segment_id INTEGER NOT NULL,street TEXT NOT NULL,"
                    + "FOREIGN KEY(trip_id) REFERENCES trips(id) ON DELETE CASCADE)");
            database.execSQL("CREATE INDEX points_trip_time ON points(trip_id,time_ms)");
        }

        @Override public void onUpgrade(SQLiteDatabase database, int oldVersion, int newVersion) { }
    }
}
