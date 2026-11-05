package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.view.View;

import org.json.JSONException;
import org.json.JSONObject;

import app.morphe.extension.shared.Utils;

/**
 * Driver side, chosen in Maps' Settings (row "Driver side").
 * <p>
 * Maps for Android Automotive puts its cards (search, route, guidance) on the driver's side and its
 * map buttons on the other side. Its central display takes the side from the car's driver seat
 * (INFO_DRIVER_SEAT). DiLink 3 has no car service, so Maps sees no seat and draws the left-hand-drive
 * layout.
 * <p>
 * The patch passes the seat Maps' central display reads through {@link #driverSeat}: Auto keeps
 * Maps' seat, left-hand drive gives the front left seat and right-hand drive the front right seat.
 * Maps then lays out its screens as in a car with that seat. The choice is read once per process
 * (Maps builds its layout as the activity starts), so a new choice applies after a restart.
 */
@SuppressWarnings("unused")
public final class DriverSide {
    private static final String TAG = "MorpheDriverSide";
    private static final String PREFERENCES = "morphe_driver_side";
    private static final String KEY_SIDE = "side";
    static final String AUTO = "auto", LEFT = "left", RIGHT = "right";
    private static final String[] CHOICES = {AUTO, LEFT, RIGHT};
    /** VehicleAreaSeat ROW_1_LEFT and ROW_1_RIGHT. */
    private static final int SEAT_LEFT = 0x1, SEAT_RIGHT = 0x4;
    /** The seats Maps counts as a right-hand driver: ROW_1_RIGHT, ROW_2_RIGHT, ROW_3_RIGHT. */
    private static final int[] RIGHT_SEATS = {SEAT_RIGHT, 0x40, 0x400};
    private static final int UNSET = Integer.MIN_VALUE;

    /** The choice this process uses, read at Maps' first ask. */
    private static volatile String applied;
    /**
     * The seat Maps' central display read, UNSET before it asked. 0 when Maps' car info has no seat: no
     * car service (DiLink 3), or Maps' demo EV vehicle, which replaces the car info while BYD battery is active.
     */
    private static volatile int mapsSeat = UNSET;
    /**
     * The seat Maps' car info read from the car (INFO_DRIVER_SEAT, 0 when the read failed), UNSET
     * without that car info (no automotive feature).
     */
    private static volatile int carSeat = UNSET;

    private DriverSide() {
    }

    /**
     * Injection point: the driver seat Maps' central display turns into a driver position. Returns
     * Maps' seat for Auto, else the front seat of the chosen side.
     */
    public static int driverSeat(int maps) {
        if (mapsSeat != maps) {
            mapsSeat = maps;
            ReportLog.i(TAG, "Maps' driver seat " + maps);
        }
        String side = choice();
        if (LEFT.equals(side)) return SEAT_LEFT;
        if (RIGHT.equals(side)) return SEAT_RIGHT;
        return maps;
    }

    /** Injection point: the driver seat Maps read from the car (INFO_DRIVER_SEAT, 0 when unreadable). For the report. */
    public static void carDriverSeat(int seat) {
        if (carSeat != seat) {
            carSeat = seat;
            ReportLog.i(TAG, "The car's driver seat " + seat);
        }
    }

    private static boolean isRightSeat(int seat) {
        for (int right : RIGHT_SEATS) if (seat == right) return true;
        return false;
    }

    /** The choice for this process: the stored one while the feature is on, else Auto. */
    static String choice() {
        String value = applied;
        if (value != null) return value;
        // Without a context the stored choice cannot be read yet; Maps' seat until then.
        if (!Utils.isContextSet()) return AUTO;
        boolean on = SafeMode.on(SafeMode.DRIVER_SIDE);
        value = on ? stored(Utils.getContext()) : AUTO;
        applied = value;
        ReportLog.i(TAG, "Driver side " + value + (on ? "" : " (switched off)"));
        return value;
    }

    /** The stored choice, Auto when none or unknown. */
    static String stored(Context context) {
        String value = storedOrNull(context);
        return value == null ? AUTO : value;
    }

    private static String storedOrNull(Context context) {
        try {
            String value = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getString(KEY_SIDE, null);
            if (value == null) return null;
            for (String choice : CHOICES) if (choice.equals(value)) return value;
            ReportLog.w(TAG, "Ignoring unknown stored driver side " + value);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the driver side choice", error);
        }
        return null;
    }

    /** The side of Maps' cards from Maps' own seat (none = left), null before Maps asked in this process. */
    private static String mapsCards() {
        int seat = mapsSeat;
        if (seat == UNSET) return null;
        return isRightSeat(seat) ? RIGHT : LEFT;
    }

    /** The side of Maps' cards in this process, null before Maps asked. */
    private static String cards() {
        String side = applied, maps = mapsCards();
        if (maps == null || side == null || AUTO.equals(side)) return maps;
        return side;
    }

    /** For the problem report (main process): the choice, the seats and the side in use. */
    static JSONObject report(Context context) throws JSONException {
        int maps = mapsSeat, car = carSeat;
        return new JSONObject()
                .put("choice", orNull(storedOrNull(context)))
                .put("applied", orNull(applied))
                .put("maps_driver_seat", maps != UNSET ? maps : JSONObject.NULL)
                .put("car_driver_seat", car != UNSET ? car : JSONObject.NULL)
                .put("maps_cards", orNull(mapsCards()))
                .put("cards", orNull(cards()));
    }

    private static Object orNull(Object value) {
        return value != null ? value : JSONObject.NULL;
    }

    // Settings row. The patch adds it to Maps' Settings list, after UI density.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "ฝั่งพวงมาลัย (Driver side)" : "Driver side";
    }

    /** Injection point: the row subtitle, the current choice. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        if (!SafeMode.on(context, SafeMode.DRIVER_SIDE)) {
            return thai ? "ใช้ฝั่งของ Maps ชั่วคราว · สวิตช์ใน Report Maps Car" : "Maps' side for now · switch in Report Maps Car";
        }
        return describedLabel(context, stored(context));
    }

    /**
     * Injection point: the row's click action. The container view of the Settings screen, if the
     * patch found one, gives the activity when the given context is not one.
     */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> showChooser(context, container);
    }

    private static void showChooser(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the driver side chooser: " + context);
            return;
        }
        Activity host = activity;
        boolean thai = UiDensityPatch.isThai(host);
        String current = stored(host);
        String[] labels = new String[CHOICES.length];
        int checked = 0;
        for (int index = 0; index < CHOICES.length; index++) {
            labels[index] = describedLabel(host, CHOICES[index]);
            if (CHOICES[index].equals(current)) checked = index;
        }
        new AlertDialog.Builder(host)
                .setTitle(getSettingsTitle(host))
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    dialog.dismiss();
                    if (!CHOICES[which].equals(current)) confirmRestart(host, CHOICES[which]);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // Maps reads the side when it builds its views, so the app restarts to use a new choice.
    private static void confirmRestart(Activity activity, String side) {
        boolean thai = UiDensityPatch.isThai(activity);
        String label = choiceLabel(activity, side);
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "Maps จะเริ่มใหม่เพื่อใช้ " + label + " การนำทางที่กำลังทำงานจะหยุด"
                        : "Maps restarts to use " + label + ". Active navigation stops.")
                .setPositiveButton(thai ? "เริ่มใหม่" : "Restart", (dialog, which) -> {
                    // commit, not apply: the process exits right after.
                    boolean saved = activity.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                            .edit().putString(KEY_SIDE, side).commit();
                    ReportLog.i(TAG, "Driver side set to " + side + " (saved " + saved + "), restarting");
                    Utils.restartApp(activity);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    private static String choiceLabel(Context context, String side) {
        boolean thai = UiDensityPatch.isThai(context);
        if (LEFT.equals(side)) return thai ? "พวงมาลัยซ้าย" : "Left-hand drive";
        if (RIGHT.equals(side)) return thai ? "พวงมาลัยขวา" : "Right-hand drive";
        return thai ? "อัตโนมัติ (ตาม Maps)" : "Auto (Maps' choice)";
    }

    /** The label with where the cards go, for the chooser and the Settings row. */
    private static String describedLabel(Context context, String side) {
        boolean thai = UiDensityPatch.isThai(context);
        String cards = AUTO.equals(side) ? mapsCards() : side;
        if (cards == null) return choiceLabel(context, side);
        String where = LEFT.equals(cards) ? (thai ? "การ์ดอยู่ซ้าย" : "cards on the left")
                : (thai ? "การ์ดอยู่ขวา" : "cards on the right");
        return choiceLabel(context, side) + " · " + where;
    }
}
