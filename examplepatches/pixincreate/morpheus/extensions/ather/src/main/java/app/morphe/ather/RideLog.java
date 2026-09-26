package app.morphe.ather;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Vehicle telemetry and ride log for the Ather app.
 *
 * <p>Ather's ride API returns no trips while the scooter is in incognito mode, and the v13 app no
 * longer reads the scooter's Firebase RTDB ride node, so the app shows no ride stats. The scooter
 * still publishes its odometer and state over the shadow websocket the app already keeps open.
 *
 * <p>Because the odometer is absolute, a ride can be reconstructed from successive readings: the
 * distance is the difference, the start odometer is the reading before the movement, and the times
 * are the sample times. Nothing has to run in the background. If the app is closed during a ride,
 * the next reading it sees still carries the whole distance, so the ride is not lost.
 *
 * <p>{@code onBikeFull} is called from the {@code ScooterShadow$Telemetry$Bike} constructor with
 * the finished object and reads its getters reflectively. It runs on every shadow update, so it
 * de-duplicates on the field values and only writes when something actually changes.
 */
public final class RideLog {

    private static final String PREFS = "ather_morphe";

    // Live vehicle snapshot.
    private static final String KEY_VEH_SIG = "veh_signature";

    // Ride reconstruction.
    private static final String KEY_ODO_LAST = "odo_last";
    private static final String KEY_ODO_LAST_TIME = "odo_last_time";
    private static final String KEY_OPEN_START = "ride_open_start";
    private static final String KEY_OPEN_START_ODO = "ride_open_start_odo";
    private static final String KEY_OPEN_END_ODO = "ride_open_end_odo";
    private static final String KEY_OPEN_END_TIME = "ride_open_end_time";
    private static final String KEY_OPEN_DIST = "ride_open_dist";
    private static final String KEY_OPEN_EXACT = "ride_open_exact";
    private static final String KEY_OPEN_SOC = "ride_open_soc";
    private static final String KEY_OPEN_END_SOC = "ride_open_end_soc";
    private static final String KEY_HISTORY = "ride_history";
    private static final String KEY_SOC_LAST = "soc_last";
    private static final String KEY_CHG_START = "chg_open_start";
    private static final String KEY_CHG_START_SOC = "chg_open_start_soc";
    private static final String KEY_CHG_END_SOC = "chg_open_end_soc";
    private static final String KEY_CHG_END_TIME = "chg_open_end_time";
    private static final String KEY_CHG_LOG = "chg_history";
    /** Ids of the notifications the server has already pushed, so a resent list does not repeat. */
    private static final String KEY_PUSHED = "push_seen";

    private static final int MAX_RECORDS = 200;

    /** Movement below this many kilometres is treated as noise, not a ride. */
    private static final double MIN_MOVE_KM = 0.05;

    /** A charging session shorter than this is the scooter flapping state, not a real charge. */
    private static final long MIN_CHARGE_MS = 60_000L;

    /**
     * How far back a session may be dated. The start is taken from the previous sample, which is
     * accurate while the app is watching. Past this gap the previous sample is too old to be a
     * useful guess, so the session is dated from the current one instead.
     */
    private static final long MAX_BACKDATE_MS = 15 * 60_000L;

    /** Vehicle states that mean the ride is over. "idle" is excluded: it also occurs mid-ride. */
    private static final String[] STOPPED_STATES = {"sleep", "shutdown", "parked", "charging",
            "standby"};

    /** Getter name -> preference key. Order defines the on-screen order. */
    private static final String[][] VEHICLE_FIELDS = {
            {"getBatterySoc", "veh_soc"},
            {"getRange", "veh_range"},
            {"getMode", "veh_mode"},
            {"getVehicleState", "veh_state"},
            {"getSpeed", "veh_speed"},
            {"getKeySwitch", "veh_key"},
            {"getOdo", "veh_odo"},
            {"getLastSyncedTime", "veh_sync"},
            {"getSoftwareVersion", "veh_sw"},
            {"getOtaStatus", "veh_ota"},
            {"getOtaAvailable", "veh_ota_avail"},
            {"getIncognito", "veh_incognito"},
            {"getVehicleFullCharged", "veh_charged"},
            {"getSmartEcoStatus", "veh_eco"},
            {"getTheftTowMovementState", "veh_tow"},
            {"getParkingAssist", "veh_park"},
            {"getBikeType", "veh_type"},
            {"getVin", "veh_vin"},
    };

    private static final int ODO_INDEX = indexOf("veh_odo", VEHICLE_FIELDS);
    private static final int STATE_INDEX = indexOf("veh_state", VEHICLE_FIELDS);
    private static final int SOC_INDEX = indexOf("veh_soc", VEHICLE_FIELDS);

    /** Preference key -> label, used when rendering the vehicle section. */
    private static final String[][] VEHICLE_LABELS = {
            {"veh_soc", "Battery"},
            {"veh_range", "Range"},
            {"veh_mode", "Ride mode"},
            {"veh_state", "Vehicle state"},
            {"veh_speed", "Speed"},
            {"veh_key", "Key switch"},
            {"veh_odo", "Odometer"},
            {"veh_eco", "Smart Eco"},
            {"veh_incognito", "Incognito"},
            {"veh_charged", "Fully charged"},
            {"veh_tow", "Tow movement"},
            {"veh_park", "Parking assist"},
            {"veh_sync", "Last synced"},
            {"veh_sw", "Software"},
            {"veh_ota", "OTA status"},
            {"veh_ota_avail", "OTA available"},
            {"veh_type", "Bike type"},
            {"veh_vin", "VIN"},
    };

    private static volatile String lastVehicleSignature;

    private RideLog() {
    }

    // ------------------------------------------------------------------ hooks

    /**
     * Hook called from the scooter constructor with the finished object. The server pushes a list
     * of notifications on the scooter's shadow, each with a title, a description and an action
     * type. The app deserialises that list and never reads it, so this is the one server-initiated
     * notification path that needs no Google service. Every entry carries an id, so a list that is
     * resent unchanged does not alert twice.
     */
    public static void onScooters(Object scooters) {
        try {
            if (scooters == null) {
                return;
            }
            Object value = scooters.getClass().getMethod("getNotifications").invoke(scooters);
            if (!(value instanceof List)) {
                return;
            }
            List<?> entries = (List<?>) value;
            Context ctx = MapPref.appContext();
            if (ctx == null || entries.isEmpty()) {
                return;
            }
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String seen = p.getString(KEY_PUSHED, "");
            StringBuilder ids = new StringBuilder(seen);
            for (Object entry : entries) {
                if (entry == null) {
                    continue;
                }
                Class<?> type = entry.getClass();
                String id = (String) type.getMethod("getId").invoke(entry);
                String title = (String) type.getMethod("getUiTitle").invoke(entry);
                String text = (String) type.getMethod("getUiDescription").invoke(entry);
                String action = (String) type.getMethod("getActionType").invoke(entry);
                if (id == null) {
                    continue;
                }
                if (seen.indexOf("|" + id + "|") >= 0) {
                    continue;
                }
                Notify.post(ctx, title == null || title.isEmpty() ? "Ather" : title, text);
                ids.append('|').append(id).append('|');
            }
            p.edit().putString(KEY_PUSHED, tail(ids.toString(), 40)).apply();
        } catch (Throwable t) {
            // Never break shadow parsing.
        }
    }

    /** The last {@code keep} pipe-separated entries of {@code value}. */
    private static String tail(String value, int keep) {
        String[] parts = value.split("\\|");
        if (parts.length <= keep) {
            return value;
        }
        StringBuilder kept = new StringBuilder();
        for (int i = parts.length - keep; i < parts.length; i++) {
            kept.append('|').append(parts[i]);
        }
        return kept.toString();
    }

    /** Hook called from the telemetry Bike constructor with the finished object. */
    public static void onBikeFull(Object bike) {
        try {
            if (bike == null) {
                return;
            }
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return;
            }
            String[] values = new String[VEHICLE_FIELDS.length];
            StringBuilder sig = new StringBuilder();
            for (int i = 0; i < VEHICLE_FIELDS.length; i++) {
                values[i] = text(get(bike, VEHICLE_FIELDS[i][0]), VEHICLE_FIELDS[i][1]);
                sig.append(values[i]).append('|');
            }
            String signature = sig.toString();
            if (signature.equals(lastVehicleSignature)) {
                return;
            }
            lastVehicleSignature = signature;

            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

            // The scooter can deliver shadows out of order. A sample whose odometer sits behind
            // the last one stored is stale: acting on it would close and re-open the same ride,
            // and would record a charging session that never happened.
            Double odo = asDouble(values[ODO_INDEX]);
            Double previous = asDouble(p.getString(KEY_ODO_LAST, null));
            if (odo != null && previous != null && odo < previous) {
                return;
            }

            SharedPreferences.Editor e = p.edit();
            for (int i = 0; i < VEHICLE_FIELDS.length; i++) {
                if (values[i] == null) {
                    e.remove(VEHICLE_FIELDS[i][1]);
                } else {
                    e.putString(VEHICLE_FIELDS[i][1], values[i]);
                }
            }
            e.putString(KEY_VEH_SIG, signature);

            trackRide(p, e, ODO_INDEX, STATE_INDEX, values);
            trackCharge(p, e, SOC_INDEX, STATE_INDEX, values);
            trackAlerts(ctx, p, values);
            e.apply();

        } catch (Throwable t) {
            // Never let the hook break shadow parsing.
        }
    }

    /**
     * Alerts on the moments the app's own push would have reported. Every one is an edge, so a
     * value that simply persists does not alert again.
     */
    private static void trackAlerts(Context ctx, SharedPreferences p, String[] values) {
        String state = values[STATE_INDEX];
        boolean charging = state != null && "charging".equalsIgnoreCase(state);
        boolean wasCharging = "charging".equalsIgnoreCase(p.getString("veh_state", null));
        boolean charged = "true".equalsIgnoreCase(values[indexOf("veh_charged", VEHICLE_FIELDS)]);
        boolean wasCharged = "true".equalsIgnoreCase(p.getString("veh_charged", null));

        if (charged && !wasCharged) {
            Notify.post(ctx, "Fully charged", "Your Ather has finished charging.");
        } else if (wasCharging && !charging) {
            // Not when it finished charging, because that case alerted just above.
            Notify.post(ctx, "Charging stopped",
                    "Your Ather is no longer charging. Battery is at "
                            + asString(values[SOC_INDEX]) + "%.");
        }
        if (charging && !wasCharging) {
            Notify.post(ctx, "Charging started",
                    "Your Ather is charging. Battery is at " + asString(values[SOC_INDEX]) + "%.");
        }

        // The scooter reports movement while parked here. The app reads it through
        // StringsKt.isEnabled, which is exactly "1".equals(value), and turns it into
        // WidgetXState.MOVEMENT_DETECTED, so match the same value.
        alert(ctx, p, values, "veh_tow", "Movement detected",
                "Your Ather reports movement while parked. Open the app to check on it.");
        alert(ctx, p, values, "veh_key", "Scooter switched on",
                "Your Ather was switched on.");
        alert(ctx, p, values, "veh_ota_avail", "Update available",
                "An update is waiting for your Ather.");

        threshold(ctx, p, values, SOC_INDEX, "veh_soc", 20.0, "Battery low",
                "Battery is down to %s%.");
        threshold(ctx, p, values, indexOf("veh_range", VEHICLE_FIELDS), "veh_range", 10.0,
                "Range low", "Range is down to %s km.");
    }

    /** Alerts when a flag changes to "1", the value the app itself reads as enabled. */
    private static void alert(Context ctx, SharedPreferences p, String[] values, String key,
                              String title, String text) {
        boolean now = "1".equals(values[indexOf(key, VEHICLE_FIELDS)]);
        boolean before = "1".equals(p.getString(key, null));
        if (now && !before) {
            Notify.post(ctx, title, text);
        }
    }

    /** Alerts when a numeric value falls below a limit that it was at or above before. */
    private static void threshold(Context ctx, SharedPreferences p, String[] values, int index,
                                  String key, double limit, String title, String text) {
        Double now = asDouble(values[index]);
        Double before = asDouble(p.getString(key, null));
        if (now != null && before != null && before >= limit && now < limit) {
            Notify.post(ctx, title, String.format(Locale.US, text, trim(now)));
        }
    }

    // ------------------------------------------------------- ride reconstruction

    /**
     * Extends or closes the open ride from an odometer reading. Called once per shadow update.
     */
    private static void trackRide(SharedPreferences p, SharedPreferences.Editor e, int odoIndex,
                                  int stateIndex, String[] values) {
        Double odo = asDouble(values[odoIndex]);
        if (odo == null) {
            return;
        }
        long now = System.currentTimeMillis();
        Double lastOdo = asDouble(p.getString(KEY_ODO_LAST, null));
        long lastTime = p.getLong(KEY_ODO_LAST_TIME, 0L);
        String state = values[stateIndex];

        if (lastTime != 0L && lastOdo != null) {
            if (odo - lastOdo > MIN_MOVE_KM) {
                // The scooter moved: open a ride if none is open, then extend it.
                long openStart = p.getLong(KEY_OPEN_START, 0L);
                double openDist = orZero(asDouble(p.getString(KEY_OPEN_DIST, null)));
                if (openStart == 0L || openDist < MIN_MOVE_KM) {
                    // The ride began somewhere between the previous sample and this one, so that
                    // window is what the app actually knows. A tight window means it watched the
                    // ride start; a wide one means it only saw the scooter after the ride.
                    openStart = sessionStart(lastTime, now);
                    openDist = 0.0;
                    e.putLong(KEY_OPEN_START, openStart);
                    e.putString(KEY_OPEN_START_ODO, odo(lastOdo));
                    e.putString(KEY_OPEN_DIST, "0");
                    e.putBoolean(KEY_OPEN_EXACT,
                            lastTime != 0L && now - lastTime <= MAX_BACKDATE_MS);
                    // The state of charge the ride started from. The previous sample's value is
                    // still in the prefs here, because the charge tracker runs after this.
                    e.putString(KEY_OPEN_SOC, p.getString(KEY_SOC_LAST, values[SOC_INDEX]));
                }
                double distance = openDist + (odo - lastOdo);
                e.putString(KEY_OPEN_DIST, trim(distance));
                e.putString(KEY_OPEN_END_ODO, odo(odo));
                e.putLong(KEY_OPEN_END_TIME, now);
                e.putString(KEY_OPEN_END_SOC, values[SOC_INDEX]);
            } else if (isStopped(state)) {
                closeRide(p, e, now);
            }
        }

        e.putString(KEY_ODO_LAST, odo(odo));
        e.putLong(KEY_ODO_LAST_TIME, now);
    }

    /**
     * The start of a session that began somewhere between the previous sample and this one. The
     * previous sample is the better guess while the app is watching; past {@link
     * #MAX_BACKDATE_MS} it is too old to mean anything, so the current sample is used.
     */
    private static long sessionStart(long previousSample, long now) {
        if (previousSample != 0L && now - previousSample <= MAX_BACKDATE_MS) {
            return previousSample;
        }
        return now;
    }

    // ------------------------------------------------------- charge reconstruction

    /**
     * Opens, extends or closes a charging session from a SOC reading. Called once per shadow
     * update. A session is bounded by the scooter reporting and then leaving "charging", so the
     * app does not need to run while the scooter charges.
     */
    private static void trackCharge(SharedPreferences p, SharedPreferences.Editor e, int socIndex,
                                    int stateIndex, String[] values) {
        String soc = values[socIndex];
        if (soc == null) {
            return;
        }
        long now = System.currentTimeMillis();
        String lastSoc = p.getString(KEY_SOC_LAST, null);
        long lastTime = p.getLong(KEY_ODO_LAST_TIME, 0L);
        String state = values[stateIndex];
        // "charged" is a full battery, not the end of the session: treating it as an end made a
        // full scooter record a fresh session every time the state flapped.
        boolean charging = "charging".equalsIgnoreCase(state) || "charged".equalsIgnoreCase(state);

        if (charging) {
            if (p.getLong(KEY_CHG_START, 0L) == 0L) {
                e.putLong(KEY_CHG_START, sessionStart(lastTime, now));
                e.putString(KEY_CHG_START_SOC, lastSoc != null ? lastSoc : soc);
            }
            e.putString(KEY_CHG_END_SOC, soc);
            e.putLong(KEY_CHG_END_TIME, now);
        } else if (p.getLong(KEY_CHG_START, 0L) != 0L) {
            closeCharge(p, e, now);
        }

        e.putString(KEY_SOC_LAST, soc);
    }

    /** Appends the open charging session to the log and clears it. */
    private static void closeCharge(SharedPreferences p, SharedPreferences.Editor e, long now) {
        long start = p.getLong(KEY_CHG_START, 0L);
        String from = p.getString(KEY_CHG_START_SOC, null);
        String to = p.getString(KEY_CHG_END_SOC, null);
        long end = p.getLong(KEY_CHG_END_TIME, now);
        if (start != 0L && end - start >= MIN_CHARGE_MS) {
            appendChargeLine(p, e, start, end, from, to);
        }
        e.remove(KEY_CHG_START);
        e.remove(KEY_CHG_START_SOC);
        e.remove(KEY_CHG_END_SOC);
        e.remove(KEY_CHG_END_TIME);
    }

    private static void appendChargeLine(SharedPreferences p, SharedPreferences.Editor e,
                                         long start, long end, String from, String to) {
        String line = "start=" + start + " end=" + end
                + " fromSoc=" + orQuestion(from) + " toSoc=" + orQuestion(to);
        String old = p.getString(KEY_CHG_LOG, "");
        String merged = line + "\n" + (old == null ? "" : old);
        int cut = nthNewline(merged, MAX_RECORDS);
        e.putString(KEY_CHG_LOG, cut > 0 ? merged.substring(0, cut) : merged);
    }

    /** The charging session in progress, as label/value rows. Empty when not charging. */
    public static List<String[]> currentChargeRows() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            long start = p.getLong(KEY_CHG_START, 0L);
            if (start == 0L) {
                return rows;
            }
            rows.add(new String[]{"Charging since", time(start)});
            rows.add(new String[]{"State of charge",
                    orQuestion(p.getString(KEY_CHG_START_SOC, null)) + " → "
                            + orQuestion(p.getString(KEY_CHG_END_SOC, null))});
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /** Appends the open ride to the history and clears it. */
    private static void closeRide(SharedPreferences p, SharedPreferences.Editor e, long now) {
        long start = p.getLong(KEY_OPEN_START, 0L);
        String dist = p.getString(KEY_OPEN_DIST, null);
        double distance = orZero(asDouble(dist));
        if (start != 0L && distance >= MIN_MOVE_KM) {
            long end = p.getLong(KEY_OPEN_END_TIME, now);
            appendLine(p, e, start, end, trim(distance),
                    p.getString(KEY_OPEN_START_ODO, null),
                    p.getString(KEY_OPEN_END_ODO, null),
                    p.getBoolean(KEY_OPEN_EXACT, true),
                    p.getString(KEY_OPEN_SOC, null),
                    p.getString(KEY_OPEN_END_SOC, null));
        }
        // Always clear, so a ride that never accumulated real distance cannot linger.
        e.remove(KEY_OPEN_START);
        e.remove(KEY_OPEN_DIST);
        e.remove(KEY_OPEN_START_ODO);
        e.remove(KEY_OPEN_END_ODO);
        e.remove(KEY_OPEN_END_TIME);
        e.remove(KEY_OPEN_EXACT);
        e.remove(KEY_OPEN_SOC);
        e.remove(KEY_OPEN_END_SOC);
    }

    /**
     * Appends a ride to the history. Used to backfill a ride the app could not observe live,
     * for example one taken before this log existed.
     */
    public static boolean addRecord(long start, long end, double distance, String startOdo,
                                    String endOdo) {
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null || start <= 0L || end < start) {
                return false;
            }
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            SharedPreferences.Editor e = p.edit();
            // A backfilled ride is given both times by the caller, so they are exact.
            appendLine(p, e, start, end, trim(distance), startOdo, endOdo, true, null, null);
            e.apply();
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Wipes every recorded ride and charging session, including any session in progress. */
    public static void clear() {
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return;
            }
            ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .remove(KEY_HISTORY)
                    .remove(KEY_CHG_LOG)
                    .remove(KEY_OPEN_START)
                    .remove(KEY_OPEN_DIST)
                    .remove(KEY_OPEN_START_ODO)
                    .remove(KEY_OPEN_END_ODO)
                    .remove(KEY_OPEN_END_TIME)
                    .remove(KEY_OPEN_EXACT)
                    .remove(KEY_OPEN_SOC)
                    .remove(KEY_OPEN_END_SOC)
                    .remove(KEY_CHG_START)
                    .remove(KEY_CHG_START_SOC)
                    .remove(KEY_CHG_END_SOC)
                    .remove(KEY_CHG_END_TIME)
                    // Forget which pushed notifications were shown, so they can appear again.
                    .remove(KEY_PUSHED)
                    .apply();
        } catch (Throwable t) {
            // Nothing to do.
        }
    }

    private static void appendLine(SharedPreferences p, SharedPreferences.Editor e, long start,
                                   long end, String distance, String startOdo, String endOdo,
                                   boolean exact, String soc0, String soc1) {
        String line = "start=" + start + " end=" + end + " distance=" + distance
                + " startOdo=" + orQuestion(startOdo)
                + " endOdo=" + orQuestion(endOdo)
                + " exact=" + (exact ? "1" : "0")
                + " soc0=" + orQuestion(soc0)
                + " soc1=" + orQuestion(soc1);
        String old = p.getString(KEY_HISTORY, "");
        String merged = line + "\n" + (old == null ? "" : old);
        int cut = nthNewline(merged, MAX_RECORDS);
        e.putString(KEY_HISTORY, cut > 0 ? merged.substring(0, cut) : merged);
    }

    private static boolean isStopped(String state) {
        if (state == null) {
            return false;
        }
        for (String candidate : STOPPED_STATES) {
            if (candidate.equalsIgnoreCase(state)) {
                return true;
            }
        }
        return false;
    }

    // --------------------------------------------------------------- read API

    /** Label/value rows for the live vehicle state, empty when nothing has arrived yet. */
    public static List<String[]> vehicleRows() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            for (String[] entry : VEHICLE_LABELS) {
                String value = p.getString(entry[0], null);
                if (value != null && !value.isEmpty() && !"null".equals(value)) {
                    rows.add(new String[]{entry[1], display(entry[0], value)});
                }
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /** Label/value rows for the ride currently in progress, empty when none is open. */
    public static List<String[]> currentTripRows() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            long start = p.getLong(KEY_OPEN_START, 0L);
            if (start == 0L) {
                return rows;
            }
            rows.add(new String[]{"Distance so far", orQuestion(p.getString(KEY_OPEN_DIST, null))});
            // The app only knows the ride began between the previous sample and the one that
            // showed movement. When that window is wide it never watched the ride start, so the
            // time it holds is the earliest the ride could have begun, not the time it did.
            boolean exact = p.getBoolean(KEY_OPEN_EXACT, true);
            rows.add(new String[]{exact ? "Started" : "Moved after", time(start)});
            rows.add(new String[]{"Start odometer",
                    orQuestion(p.getString(KEY_OPEN_START_ODO, null))});
            rows.add(new String[]{"Current odometer",
                    orQuestion(p.getString(KEY_OPEN_END_ODO, null))});
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /**
     * Recorded rides, newest first, as raw values:
     * {startMillis, endMillis, distanceKm, startOdo, endOdo}.
     */
    public static List<String[]> historyRecords() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            String raw = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getString(KEY_HISTORY, "");
            if (raw == null || raw.isEmpty()) {
                return rows;
            }
            for (String line : raw.split("\n")) {
                if (line.isEmpty()) {
                    continue;
                }
                long start = field(line, "start=");
                long end = field(line, "end=");
                if (start <= 0L || end <= 0L) {
                    continue;
                }
                // A record written before the "exact" field existed has no flag. A ride whose
                // start and end are the same reading was never observed while it happened, so it
                // is reported as a window rather than a timed ride.
                String exact = fieldText(line, "exact=");
                if (exact == null) {
                    exact = start >= end ? "0" : "1";
                }
                rows.add(new String[]{
                        String.valueOf(start),
                        String.valueOf(end),
                        fieldText(line, "distance="),
                        fieldText(line, "startOdo="),
                        fieldText(line, "endOdo="),
                        exact,
                        fieldText(line, "soc0="),
                        fieldText(line, "soc1=")});
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /**
     * How the ride used its charge, as "3.2 %/km   ·   12.4 km/unit", or an empty string when the
     * ride has no usable charge readings. The %/km figure is measured from the two readings; the
     * km/unit figure needs the pack size set in Morphe settings, so it is an estimate.
     */
    public static String efficiency(String[] record) {
        try {
            if (record == null || record.length < 8) {
                return "";
            }
            Double distance = asDouble(record[2]);
            Double soc0 = asDouble(record[6]);
            Double soc1 = asDouble(record[7]);
            if (distance == null || soc0 == null || soc1 == null) {
                return "";
            }
            double used = soc0 - soc1;
            if (distance <= 0.0 || used <= 0.0) {
                return "";
            }
            double perKm = used / distance;
            if (perKm > 25.0) {
                // A drop this large over one ride is a bad reading rather than a real figure.
                return "";
            }
            double kwh = used / 100.0 * MapPref.packKwh();
            if (kwh <= 0.0) {
                return "";
            }
            return trim(perKm) + " %/km   ·   " + trim(distance / kwh) + " km/unit";
        } catch (Throwable t) {
            return "";
        }
    }

    /**
     * Recorded charging sessions, newest first, as raw values:
     * {startMillis, endMillis, fromSoc, toSoc}.
     */
    public static List<String[]> chargeRecords() {
        List<String[]> rows = new ArrayList<>();
        try {
            Context ctx = MapPref.appContext();
            if (ctx == null) {
                return rows;
            }
            String raw = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getString(KEY_CHG_LOG, "");
            if (raw == null || raw.isEmpty()) {
                return rows;
            }
            for (String line : raw.split("\n")) {
                if (line.isEmpty()) {
                    continue;
                }
                if (field(line, "start=") <= 0L || field(line, "end=") <= 0L) {
                    continue;
                }
                rows.add(new String[]{
                        String.valueOf(field(line, "start=")),
                        String.valueOf(field(line, "end=")),
                        fieldText(line, "fromSoc="),
                        fieldText(line, "toSoc=")});
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rows;
    }

    /** One recorded ride by its synthetic id, or null when unknown. */
    public static String[] rideRecord(long rideId) {
        try {
            long key = -rideId;
            for (String[] record : historyRecords()) {
                // New records are keyed by the time the ride was observed; older ones by their
                // window start, so both are matched.
                if (asLong(record[0]) == key || asLong(record[1]) == key) {
                    return record;
                }
            }
        } catch (Throwable t) {
            // Nothing to do.
        }
        return null;
    }

    /** Every recorded ride as a CSV table. */
    public static String ridesCsv() {
        StringBuilder sb = new StringBuilder("start,end,distance_km,start_odo,end_odo,times_exact\n");
        try {
            for (String[] record : historyRecords()) {
                sb.append(iso(asLong(record[0]))).append(',')
                        .append(iso(asLong(record[1]))).append(',')
                        .append(escape(record[2])).append(',')
                        .append(escape(record[3])).append(',')
                        .append(escape(record[4])).append(',')
                        .append("0".equals(record[5]) ? "no" : "yes").append('\n');
            }
        } catch (Throwable t) {
            // Return what was built.
        }
        return sb.toString();
    }

    /** Every recorded charging session as a CSV table. */
    public static String chargingCsv() {
        StringBuilder sb = new StringBuilder("start,end,from_soc,to_soc\n");
        try {
            for (String[] record : chargeRecords()) {
                sb.append(iso(asLong(record[0]))).append(',')
                        .append(iso(asLong(record[1]))).append(',')
                        .append(escape(record[2])).append(',')
                        .append(escape(record[3])).append('\n');
            }
        } catch (Throwable t) {
            // Return what was built.
        }
        return sb.toString();
    }

    /** A timestamp a spreadsheet can sort, for example 2026-09-20 19:36:27. */
    private static String iso(long millis) {
        if (millis <= 0L) {
            return "";
        }
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date(millis));
    }

    /** A CSV field, quoted when it holds a comma or a quote. */
    private static String escape(String value) {
        if (value == null) {
            return "";
        }
        if (value.indexOf(',') < 0 && value.indexOf('"') < 0) {
            return value;
        }
        return "\"" + value.replace("\"", "\"\"") + "\"";
    }

    // --------------------------------------------------------------- internals

    private static int indexOf(String key, String[][] table) {
        for (int i = 0; i < table.length; i++) {
            if (table[i][1].equals(key)) {
                return i;
            }
        }
        return -1;
    }

    /**
     * Formats a stored value for display. Booleans and epoch timestamps get human
     * readable text; everything else is passed through.
     */
    private static String display(String key, String value) {
        if ("veh_incognito".equals(key) || "veh_charged".equals(key)) {
            return "true".equalsIgnoreCase(value) ? "Yes" : "No";
        }
        if ("veh_sync".equals(key)) {
            long millis = asLong(value);
            return millis <= 0L ? value : time(millis);
        }
        return value;
    }

    private static String text(Object value, String key) {
        if (value == null) {
            return null;
        }
        if (value instanceof Boolean) {
            return String.valueOf(value);
        }
        if (value instanceof Number) {
            if ("veh_sync".equals(key)) {
                return String.valueOf(((Number) value).longValue());
            }
            return String.valueOf(value);
        }
        String s = String.valueOf(value);
        return s.isEmpty() ? null : s;
    }

    /** Calls a no-arg getter reflectively; returns null when it does not exist. */
    private static Object get(Object target, String name) {
        try {
            Method m = target.getClass().getMethod(name);
            m.setAccessible(true);
            return m.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static long field(String line, String key) {
        String v = fieldText(line, key);
        return v == null ? 0L : asLong(v);
    }

    private static String fieldText(String line, String key) {
        int i = line.indexOf(key);
        if (i < 0) {
            return null;
        }
        int from = i + key.length();
        int to = line.indexOf(' ', from);
        return to < 0 ? line.substring(from) : line.substring(from, to);
    }

    /** Formats an epoch time for display. Public so other screens render times the same way. */
    public static String stamp(long millis) {
        return time(millis);
    }

    private static String time(long millis) {
        if (millis <= 0L) {
            return "?";
        }
        return new SimpleDateFormat("dd MMM HH:mm", Locale.US).format(new Date(millis));
    }

    private static String trim(double v) {
        long rounded = Math.round(v * 10.0);
        return (rounded / 10) + "." + Math.abs(rounded % 10) + "";
    }

    /**
     * Formats an odometer reading with full precision. Rounding the odometer before storing it
     * leaves a residue that looks like movement, which would open a ride on every update.
     */
    private static String odo(double v) {
        return String.format(Locale.US, "%.3f", v);
    }

    private static String orQuestion(String s) {
        return s == null || s.isEmpty() ? "?" : s;
    }

    private static double orZero(Double d) {
        return d == null ? 0.0 : d;
    }

    private static Double asDouble(Object o) {
        if (o instanceof Number) {
            return ((Number) o).doubleValue();
        }
        if (o instanceof String) {
            try {
                return Double.valueOf(((String) o).trim());
            } catch (NumberFormatException ignored) {
                return null;
            }
        }
        return null;
    }

    private static int nthNewline(String s, int n) {
        int idx = -1;
        for (int i = 0; i < n; i++) {
            idx = s.indexOf('\n', idx + 1);
            if (idx < 0) {
                return -1;
            }
        }
        return idx + 1;
    }

    private static String asString(Object o) {
        return o == null ? null : String.valueOf(o);
    }

    private static long asLong(Object o) {
        if (o instanceof Number) {
            return ((Number) o).longValue();
        }
        if (o instanceof String) {
            try {
                return Long.parseLong((String) o);
            } catch (NumberFormatException ignored) {
                return 0L;
            }
        }
        return 0L;
    }
}
