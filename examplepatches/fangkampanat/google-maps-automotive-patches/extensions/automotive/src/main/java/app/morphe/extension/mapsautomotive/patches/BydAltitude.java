package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.os.SystemClock;

/**
 * The height of the last GPS fix, for the drive records ({@link BydDriveLog}): climbs and descents
 * take energy that the speed alone does not explain. Reads LocationManager's last known GPS location,
 * which Maps keeps fresh while it runs; requests no updates and starts nothing. Only the altitude is
 * read: latitude and longitude are never read, logged or stored, and the fix itself is never logged
 * (its text holds the position).
 */
final class BydAltitude {
    private static final String TAG = "MorpheBydDrive";
    /** A fix older than this is from before the last stretch driven. */
    static final long MAX_AGE_NANOS = 30_000_000_000L;
    /** Outside this a GPS height is a fault. */
    static final double MIN_M = -500, MAX_M = 9000;
    private static volatile LocationManager manager;
    private static volatile boolean deniedLogged, failedLogged;

    private BydAltitude() {
    }

    /** Metres above the WGS 84 ellipsoid as the fix gives it, or NaN without a fresh fix with a height. Never throws. */
    static double read(Context context) {
        try {
            LocationManager locations = manager;
            if (locations == null) {
                Context app = context.getApplicationContext();
                locations = (LocationManager) (app != null ? app : context).getSystemService(Context.LOCATION_SERVICE);
                if (locations == null) return Double.NaN;
                manager = locations;
            }
            Location fix = locations.getLastKnownLocation(LocationManager.GPS_PROVIDER);
            if (fix == null) return Double.NaN;
            boolean has = fix.hasAltitude();
            return altitude(fix.getElapsedRealtimeNanos(), SystemClock.elapsedRealtimeNanos(), has, has ? fix.getAltitude() : Double.NaN);
        } catch (SecurityException error) {
            if (!deniedLogged) {
                deniedLogged = true;
                ReportLog.w(TAG, "altitude unavailable: no location permission (" + error.getClass().getSimpleName() + ")");
            }
            return Double.NaN;
        } catch (Throwable error) {
            if (!failedLogged) {
                failedLogged = true;
                ReportLog.w(TAG, "altitude unavailable: " + error.getClass().getName());
            }
            return Double.NaN;
        }
    }

    /** The height when the fix is at most 30 s old and has one, NaN otherwise (no Android call). */
    static double altitude(long fixElapsedNanos, long nowElapsedNanos, boolean hasAltitude, double metres) {
        long age = nowElapsedNanos - fixElapsedNanos;
        if (!hasAltitude || fixElapsedNanos <= 0 || age < 0 || age > MAX_AGE_NANOS) return Double.NaN;
        return metres >= MIN_M && metres <= MAX_M ? metres : Double.NaN;
    }
}
