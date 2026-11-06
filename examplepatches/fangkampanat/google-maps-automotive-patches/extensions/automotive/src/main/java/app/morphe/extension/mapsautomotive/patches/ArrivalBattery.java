package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;

import org.json.JSONException;
import org.json.JSONObject;

import app.morphe.extension.shared.Utils;

/**
 * Battery on arrival, chosen in the BYD battery dialog (patch "BYD battery (EV)").
 * <p>
 * Maps plans EV charging stops so the car reaches each charger and the destination with at least a
 * set battery level. It takes both levels from the car maker's settings for Maps, which BYD does not
 * have, and otherwise uses Google's default. The patch passes Maps' stored level through
 * {@link #chargingStop} and {@link #destination} right after Maps reads it: Auto keeps Maps' value
 * (none on BYD, so Google's default follows), a choice gives its percentage. Apart from a debug dump,
 * every reader of the levels goes through these two getters, among them the vehicle info Maps uploads
 * for its EV routes.
 * When Maps falls back to Google's default, the value passes through {@link #mapsChargingStop} and
 * {@link #mapsDestination}, for the dialog and the report.
 * <p>
 * The choices are kept in memory once read, and the dialog updates them, so a new choice applies to
 * Maps' next read without a restart. While BYD battery does not feed Maps (off in Settings, its switch
 * off, safe mode, not a BYD car), Maps gets its own value.
 */
@SuppressWarnings("unused")
public final class ArrivalBattery {
    private static final String TAG = "MorpheArrivalBattery";
    private static final String PREFERENCES = "morphe_arrival_battery";
    static final String CHARGING_STOP = "charging_stop", DESTINATION = "destination";
    static final int AUTO = 0;
    static final int[] CHARGING_STOP_CHOICES = {AUTO, 10, 15, 20, 25, 30};
    static final int[] DESTINATION_CHOICES = {AUTO, 10, 20, 30, 40, 50};
    private static final int UNSET = -1;

    /** Whether the feature runs in this process, null until decided with a context. */
    private static volatile Boolean on;
    /** The stored choices (AUTO or a percentage), UNSET until read. */
    private static volatile int chargingStopChoice = UNSET, destinationChoice = UNSET;
    /** Maps' stored levels at its last read (0 = none), UNSET before. */
    private static volatile int mapsChargingStopStored = UNSET, mapsDestinationStored = UNSET;
    /** Google's defaults at Maps' last fallback, UNSET before. */
    private static volatile int googleChargingStop = UNSET, googleDestination = UNSET;

    private ArrivalBattery() {
    }

    /** Injection point: Maps' stored minimum at charging stops (0 when none). Returns the choice, or Maps' value for Auto. */
    public static int chargingStop(int stored) {
        if (mapsChargingStopStored != stored) {
            mapsChargingStopStored = stored;
            ReportLog.i(TAG, "Maps' stored level at charging stops " + stored);
        }
        int choice = applied(CHARGING_STOP);
        return choice != AUTO ? choice : stored;
    }

    /** Injection point: Maps' stored level at the destination (0 when none). Returns the choice, or Maps' value for Auto. */
    public static int destination(int stored) {
        if (mapsDestinationStored != stored) {
            mapsDestinationStored = stored;
            ReportLog.i(TAG, "Maps' stored level at the destination " + stored);
        }
        int choice = applied(DESTINATION);
        return choice != AUTO ? choice : stored;
    }

    /** Injection point: Google's default at charging stops, when Maps falls back to it. */
    public static void mapsChargingStop(int value) {
        if (googleChargingStop != value) {
            googleChargingStop = value;
            ReportLog.i(TAG, "Google's default at charging stops " + value + "%");
        }
    }

    /** Injection point: Google's default at the destination, when Maps falls back to it. */
    public static void mapsDestination(int value) {
        if (googleDestination != value) {
            googleDestination = value;
            ReportLog.i(TAG, "Google's default at the destination " + value + "%");
        }
    }

    /** The choice Maps gets for [level]: the stored one while the feature is on, else AUTO. */
    private static int applied(String level) {
        Boolean feature = on;
        if (feature == null) {
            // Without a context the switch and the choice cannot be read yet; Maps' value until then.
            if (!Utils.isContextSet()) return AUTO;
            feature = decide();
        }
        if (!feature) return AUTO;
        int choice = CHARGING_STOP.equals(level) ? chargingStopChoice : destinationChoice;
        if (choice == UNSET) choice = load(Utils.getContext(), level);
        return choice;
    }

    // BYD battery decides in the Application's attachBaseContext, before Maps reads a level.
    private static synchronized boolean decide() {
        Boolean feature = on;
        if (feature == null) {
            feature = BydBatteryPatch.isActive();
            on = feature;
            ReportLog.i(TAG, "Battery on arrival " + (feature ? "on" : "off (BYD battery not active)"));
        }
        return feature;
    }

    /** The stored choice for [level], AUTO when none or unknown. Remembered for later reads. */
    static int stored(Context context, String level) {
        int choice = CHARGING_STOP.equals(level) ? chargingStopChoice : destinationChoice;
        return choice != UNSET ? choice : load(context, level);
    }

    private static synchronized int load(Context context, String level) {
        // A choice from the dialog may have come in meanwhile.
        int cached = CHARGING_STOP.equals(level) ? chargingStopChoice : destinationChoice;
        if (cached != UNSET) return cached;
        int choice = AUTO;
        try {
            int value = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getInt(level, AUTO);
            if (contains(choices(level), value)) {
                choice = value;
            } else {
                ReportLog.w(TAG, "Ignoring unknown stored " + level + " level " + value);
            }
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the " + level + " level", error);
        }
        if (CHARGING_STOP.equals(level)) chargingStopChoice = choice;
        else destinationChoice = choice;
        return choice;
    }

    /** From the dialog: stores [percent] (AUTO or one of the choices) for [level]; Maps gets it at its next read. */
    static void choose(Context context, String level, int percent) {
        if (!contains(choices(level), percent)) return;
        // Under the lock, so a first read in load() cannot put the previous choice back.
        synchronized (ArrivalBattery.class) {
            if (CHARGING_STOP.equals(level)) chargingStopChoice = percent;
            else destinationChoice = percent;
            try {
                context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putInt(level, percent).apply();
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "Could not store the " + level + " level", error);
            }
        }
        ReportLog.i(TAG, level + " level set to " + (percent == AUTO ? "auto" : percent + "%"));
        // A report opened right after the choice reads the main process's snapshot.
        ReportBuilder.saveSnapshot(context.getApplicationContext(), true);
    }

    static int[] choices(String level) {
        return CHARGING_STOP.equals(level) ? CHARGING_STOP_CHOICES : DESTINATION_CHOICES;
    }

    /** Google's default for [level] as Maps last used it, -1 before Maps fell back to it in this process. */
    static int googleDefault(String level) {
        return CHARGING_STOP.equals(level) ? googleChargingStop : googleDestination;
    }

    private static boolean contains(int[] values, int value) {
        for (int each : values) if (each == value) return true;
        return false;
    }

    /** For the problem report (main process): per level the choice, Maps' stored value and Google's default. */
    static JSONObject report(Context context) throws JSONException {
        Boolean feature = on;
        return new JSONObject()
                .put("on", feature != null ? feature : JSONObject.NULL)
                .put(CHARGING_STOP, level(context, CHARGING_STOP, mapsChargingStopStored, googleChargingStop))
                .put(DESTINATION, level(context, DESTINATION, mapsDestinationStored, googleDestination));
    }

    private static JSONObject level(Context context, String level, int mapsStored, int google) throws JSONException {
        int choice = stored(context, level);
        return new JSONObject()
                .put("choice", choice == AUTO ? "auto" : choice)
                .put("maps_stored", mapsStored != UNSET ? mapsStored : JSONObject.NULL)
                .put("google_default", google != UNSET ? google : JSONObject.NULL);
    }
}
