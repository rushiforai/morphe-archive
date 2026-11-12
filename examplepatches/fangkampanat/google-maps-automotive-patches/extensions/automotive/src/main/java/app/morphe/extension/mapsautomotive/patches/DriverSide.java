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
 * The patch passes the seat Maps' central display reads through {@link #driverSeat}: left-hand drive
 * gives the front left seat and right-hand drive the front right seat. Auto keeps Maps' seat when Maps
 * has one; without one, a BYD's steering side setting gives the front seat of that side
 * (persist.sys.vehicle_rudder_info: 1 left, 2 right, as on DiLink 3; else
 * persist.vendor.byd.cfg.huc.steering.wheel.position: 0 left, 1 right, as on DiLink 5), else Maps
 * keeps its own (left-hand drive) layout. Maps then lays out its screens as in a car with that
 * seat. The choice is read once per process (Maps builds its layout as the activity starts), so a
 * new choice applies after a restart.
 */
@SuppressWarnings("unused")
public final class DriverSide {
    private static final String TAG = "MorpheDriverSide";
    private static final String PREFERENCES = "morphe_driver_side";
    private static final String KEY_SIDE = "side";
    static final String AUTO = "auto", LEFT = "left", RIGHT = "right", CENTER = "center";
    private static final String[] CHOICES = {AUTO, LEFT, RIGHT};
    /** VehicleAreaSeat ROW_1_LEFT and ROW_1_RIGHT. */
    private static final int SEAT_LEFT = 0x1, SEAT_RIGHT = 0x4;
    /** The seats Maps counts as a right-hand driver: ROW_1_RIGHT, ROW_2_RIGHT, ROW_3_RIGHT. */
    private static final int[] RIGHT_SEATS = {SEAT_RIGHT, 0x40, 0x400};
    /** The centre seats: ROW_1_CENTER, ROW_2_CENTER, ROW_3_CENTER. */
    private static final int[] CENTER_SEATS = {0x2, 0x20, 0x200};
    /**
     * The seats Maps' central display turns into a driver position: left, centre and right of rows 1
     * to 3. Maps counts any other value as no seat, and so does Auto.
     */
    private static final int[] MAPS_SEATS = {0x1, 0x2, 0x4, 0x10, 0x20, 0x40, 0x100, 0x200, 0x400};
    /** BYD's steering side settings and their two values; the rudder setting wins when both have a side. */
    private static final String RUDDER_PROPERTY = "persist.sys.vehicle_rudder_info";
    private static final String RUDDER_LEFT = "1", RUDDER_RIGHT = "2";
    private static final String WHEEL_PROPERTY = "persist.vendor.byd.cfg.huc.steering.wheel.position";
    private static final String WHEEL_LEFT = "0", WHEEL_RIGHT = "1";
    /** Where Auto's side comes from (report and log). */
    static final String FROM_MAPS = "maps_seat", FROM_BYD = "byd_property", FROM_DEFAULT = "default", FROM_OFF = "off";
    private static final int UNSET = Integer.MIN_VALUE;

    /** The choice this process uses, read at Maps' first ask. */
    private static volatile String applied;
    /** Whether Auto looks beyond Maps' seat in this process: the feature is on. Set before {@link #applied}. */
    private static volatile boolean detecting;
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
    /** The seat this process gave Maps' central display last, UNSET before Maps asked. */
    private static volatile int givenSeat = UNSET;
    /**
     * BYD's steering side settings, each read once: "" when unset (or hidden from apps), null on a car
     * that is not a BYD or when the read failed.
     */
    private static volatile String rudder, wheel;
    private static volatile boolean rudderRead, wheelRead;
    private static volatile String loggedAuto;

    private DriverSide() {
    }

    /**
     * Injection point: the driver seat Maps' central display turns into a driver position. Returns
     * the front seat of the chosen side, or Auto's seat.
     */
    public static int driverSeat(int maps) {
        if (mapsSeat != maps) {
            mapsSeat = maps;
            ReportLog.i(TAG, "Maps' driver seat " + maps);
        }
        String side = choice();
        int seat;
        if (LEFT.equals(side)) seat = SEAT_LEFT;
        else if (RIGHT.equals(side)) seat = SEAT_RIGHT;
        else if (detecting) seat = auto(maps);
        else seat = maps;
        givenSeat = seat;
        return seat;
    }

    /** Injection point: the driver seat Maps read from the car (INFO_DRIVER_SEAT, 0 when unreadable). For the report. */
    public static void carDriverSeat(int seat) {
        if (carSeat != seat) {
            carSeat = seat;
            ReportLog.i(TAG, "The car's driver seat " + seat);
        }
    }

    private static boolean isRightSeat(int seat) {
        return contains(RIGHT_SEATS, seat);
    }

    private static boolean isMapsSeat(int seat) {
        return contains(MAPS_SEATS, seat);
    }

    private static boolean contains(int[] seats, int seat) {
        for (int each : seats) if (seat == each) return true;
        return false;
    }

    /** The side of Maps' cards for a seat: right for a right-hand driver, else left (as in Maps). */
    private static String cardsOf(int seat) {
        return isRightSeat(seat) ? RIGHT : LEFT;
    }

    /** The driver's side for a seat: left, right or center; no seat counts as left, as in Maps' layout. */
    private static String sideOf(int seat) {
        if (isRightSeat(seat)) return RIGHT;
        return contains(CENTER_SEATS, seat) ? CENTER : LEFT;
    }

    // Auto. The decision itself has no Android dependency.

    /**
     * Auto's seat from Maps' seat and BYD's two steering side settings (each null on a car that is not a
     * BYD or when unreadable): Maps' seat when Maps has one, else the front seat of the rudder setting's
     * side (exactly "1" left, "2" right), else of the wheel setting's side (exactly "0" left, "1"
     * right), else Maps' seat.
     */
    static int autoSeat(int maps, String rudder, String wheel) {
        if (isMapsSeat(maps)) return maps;
        if (RUDDER_LEFT.equals(rudder)) return SEAT_LEFT;
        if (RUDDER_RIGHT.equals(rudder)) return SEAT_RIGHT;
        if (WHEEL_LEFT.equals(wheel)) return SEAT_LEFT;
        if (WHEEL_RIGHT.equals(wheel)) return SEAT_RIGHT;
        return maps;
    }

    /** Where {@link #autoSeat}'s seat comes from: Maps' seat, one of BYD's settings or neither (Maps' default). */
    static String autoSource(int maps, String rudder, String wheel) {
        if (isMapsSeat(maps)) return FROM_MAPS;
        if (RUDDER_LEFT.equals(rudder) || RUDDER_RIGHT.equals(rudder)) return FROM_BYD;
        if (WHEEL_LEFT.equals(wheel) || WHEEL_RIGHT.equals(wheel)) return FROM_BYD;
        return FROM_DEFAULT;
    }

    /** Auto's seat in this process. BYD's settings are read only when Maps has no seat. */
    private static int auto(int maps) {
        boolean byd = !isMapsSeat(maps);
        String setting = byd ? rudder() : null, position = byd ? wheel() : null;
        int seat = autoSeat(maps, setting, position);
        String source = autoSource(maps, setting, position);
        String line = "Auto: " + sideOf(seat) + " (" + source
                + (FROM_MAPS.equals(source) ? " " + maps
                : ", BYD rudder info " + quoted(setting) + ", steering wheel position " + quoted(position)) + ")";
        if (!line.equals(loggedAuto)) {
            loggedAuto = line;
            ReportLog.i(TAG, line);
        }
        return seat;
    }

    private static String quoted(String value) {
        return value == null ? "none" : "\"" + value + "\"";
    }

    /** persist.sys.vehicle_rudder_info, read once per process. */
    private static String rudder() {
        if (rudderRead) return rudder;
        String value = bydProperty(RUDDER_PROPERTY);
        rudder = value;
        rudderRead = true;
        return value;
    }

    /** persist.vendor.byd.cfg.huc.steering.wheel.position, read once per process. */
    private static String wheel() {
        if (wheelRead) return wheel;
        String value = bydProperty(WHEEL_PROPERTY);
        wheel = value;
        wheelRead = true;
        return value;
    }

    /**
     * A system property on a BYD: "" when unset or when the system hides it from apps; null on a car that
     * is not a BYD or when the read failed.
     */
    private static String bydProperty(String name) {
        try {
            if (BydBatteryPatch.isByd()) {
                return (String) Class.forName("android.os.SystemProperties").getMethod("get", String.class)
                        .invoke(null, name);
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "Could not read " + name, error);
        }
        return null;
    }

    /** The choice for this process: the stored one while the feature is on, else Auto with Maps' seat. */
    static String choice() {
        String value = applied;
        if (value != null) return value;
        // Without a context the stored choice cannot be read yet; Maps' seat until then.
        if (!Utils.isContextSet()) return AUTO;
        boolean on = SafeMode.on(SafeMode.DRIVER_SIDE);
        value = on ? stored(Utils.getContext()) : AUTO;
        detecting = on;
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
        return seat == UNSET ? null : cardsOf(seat);
    }

    /** The side of Maps' cards in this process, from the seat Maps got; null before Maps asked. */
    private static String cards() {
        int seat = givenSeat;
        return seat == UNSET ? null : cardsOf(seat);
    }

    /** For the problem report (main process): the choice, the seats, Auto's side and the side in use. */
    static JSONObject report(Context context) throws JSONException {
        int maps = mapsSeat, car = carSeat;
        String setting = rudder(), position = wheel(), autoSide = null, source = null;
        if (maps != UNSET) {
            boolean off = applied != null && !detecting;
            int seat = off ? maps : autoSeat(maps, setting, position);
            autoSide = sideOf(seat);
            source = off ? FROM_OFF : autoSource(maps, setting, position);
        }
        return new JSONObject()
                .put("choice", orNull(storedOrNull(context)))
                .put("applied", orNull(applied))
                .put("maps_driver_seat", maps != UNSET ? maps : JSONObject.NULL)
                .put("car_driver_seat", car != UNSET ? car : JSONObject.NULL)
                .put("byd_rudder_info", orNull(setting))
                .put("byd_steering_wheel_position", orNull(position))
                .put("auto_side", orNull(autoSide))
                .put("auto_source", orNull(source))
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
            return (thai ? "ใช้ฝั่งของ Maps ชั่วคราว · สวิตช์ใน " : "Maps' side for now · switch in ")
                    + ReportPatch.reportPlace(context, thai);
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
                    if (CHOICES[which].equals(current)) return;
                    if (SafeMode.on(host, SafeMode.DRIVER_SIDE)) confirmRestart(host, CHOICES[which]);
                    else saveForLater(host, CHOICES[which]);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // While the switch is off this process uses Maps' seat whatever is stored, so a restart would change
    // nothing: the choice is saved for the next process with the switch on.
    private static void saveForLater(Activity activity, String side) {
        boolean saved = activity.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .edit().putString(KEY_SIDE, side).commit();
        ReportLog.i(TAG, "Driver side set to " + side + " (saved " + saved + ") while switched off, no restart");
        ReportBuilder.saveSnapshot(activity.getApplicationContext(), true);
        boolean thai = UiDensityPatch.isThai(activity);
        // Plain "Auto": what it detects is known only once the switch is on.
        String label = AUTO.equals(side) ? (thai ? "แบบอัตโนมัติ" : "Auto") : choiceLabel(activity, side);
        new AlertDialog.Builder(activity)
                .setTitle(getSettingsTitle(activity))
                .setMessage(thai
                        ? "บันทึกแล้ว จะใช้" + label + " เมื่อเปิด Driver side อีกครั้งใน " + ReportPatch.reportPlace(activity, true)
                        : "Saved. " + label + " is used once Driver side is switched on again in "
                        + ReportPatch.reportPlace(activity, false) + ".")
                .setPositiveButton(thai ? "ตกลง" : "OK", null)
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
        return autoLabel(context, thai);
    }

    /**
     * Auto with the side it gives and where that comes from; "Auto" before Maps asked. While the
     * switch is off Auto gives Maps' seat, after a restart too, so the label leaves BYD's settings out.
     */
    private static String autoLabel(Context context, boolean thai) {
        int maps = mapsSeat;
        if (maps == UNSET) return thai ? "อัตโนมัติ" : "Auto";
        boolean on = SafeMode.on(context, SafeMode.DRIVER_SIDE);
        boolean byd = on && !isMapsSeat(maps);
        String setting = byd ? rudder() : null, position = byd ? wheel() : null;
        String side = sideOf(autoSeat(maps, setting, position));
        boolean fromCar = !FROM_DEFAULT.equals(autoSource(maps, setting, position));
        String drive = RIGHT.equals(side) ? (thai ? "พวงมาลัยขวา" : "right-hand drive")
                : CENTER.equals(side) ? (thai ? "ที่นั่งกลาง" : "center seat")
                : (thai ? "พวงมาลัยซ้าย" : "left-hand drive");
        if (thai) return "อัตโนมัติ (" + drive + " " + (fromCar ? "ตามรถ" : "ค่าเริ่มต้นของ Maps") + ")";
        return "Auto (" + drive + ", " + (fromCar ? "from the car" : "Maps' default") + ")";
    }

    /** The label for the chooser and the Settings row; Left and Right also say where the cards go. */
    private static String describedLabel(Context context, String side) {
        if (AUTO.equals(side)) return choiceLabel(context, side);
        boolean thai = UiDensityPatch.isThai(context);
        String where = LEFT.equals(side) ? (thai ? "การ์ดอยู่ซ้าย" : "cards on the left")
                : (thai ? "การ์ดอยู่ขวา" : "cards on the right");
        return choiceLabel(context, side) + " · " + where;
    }
}
