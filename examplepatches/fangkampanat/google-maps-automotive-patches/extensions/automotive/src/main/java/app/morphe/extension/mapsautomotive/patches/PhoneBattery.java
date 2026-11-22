package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;

import org.json.JSONException;
import org.json.JSONObject;

import app.morphe.extension.shared.Utils;

/**
 * Battery on the phone, one switch in the BYD battery dialog (patch "BYD battery (EV)"), on by default. It covers two of
 * Maps' uploads to the Google account, which Google Maps on a phone signed in to the same account reads for this vehicle.
 * Both carry car values only when the app holds the car energy permission (CAR_ENERGY), which DiLink never grants.
 * <p>
 * <b>The percentage.</b> While Maps runs, its live vehicle info task writes a small record about every 2 minutes: the
 * vehicle's key, the time and, only with the permission, the battery percentage. The patch passes that task's one
 * permission check through {@link #share}: true while the switch is on and BYD battery feeds Maps. Maps then adds the
 * whole percent of the energy model BYD battery sends (the dashboard's). Without a model Maps writes nothing and tries
 * again later, as on a car that holds the permission. A change applies at Maps' next upload, without a restart.
 * <p>
 * <b>Sooner on a drop.</b> Maps schedules that task on a 2-minute timer; the patch keeps the timer's task
 * ({@link #liveTask}). When Maps reads a model whose whole percent is below the one in its last upload
 * ({@link #modelRead}), the task runs once 3 seconds later, at most once a minute, so the last drop before the car is
 * turned off reaches the phone too. A rising percent (charging) waits for the timer.
 * <p>
 * <b>The energy model.</b> Maps' energy-model task writes the car's model 5 seconds after each start and then every
 * 2 hours (a server value). It checks the permission three times. Once when Maps expects the car's model and has none
 * yet ({@link #modelPending}): with the permission it returns success without writing. And twice before it adds the
 * model's two parts ({@link #shareModel}), each with the battery level and a few other live values cleared by Maps.
 * While the switch is on and BYD battery feeds Maps, the two checks return true; the first one throws, so Maps' own
 * catch returns Retry and WorkManager runs the task again 2 minutes later instead of waiting 2 hours. Otherwise each
 * returns Maps' value. Switched off, the next run writes the record without the model.
 * <p>
 * <b>The outside temperature.</b> Maps also clears the outside temperature in both parts. While the model goes up, both
 * parts keep the temperature BYD battery put in the model ({@link #keepModelTemperature}), so Google's side gets the
 * model as the car plans with it, the A/C draw by temperature included.
 * <p>
 * <b>Which model.</b> The upload carries the model Maps read last. BYD battery loads its saved calibration before its
 * first model, so the upload after a start carries the adjusted model (this car's consumption), not BYD's table: with
 * the table, phone Maps showed 3 to 6 points more on arrival than the car on routes of about 200 km. The report keeps
 * which one the last upload carried.
 * <p>
 * One switch for both: in a car test phone Maps showed the battery only once both went up, and its battery on
 * arrival then matched the car's. Nothing else leaves the car; both go in Maps' own uploads.
 */
@SuppressWarnings("unused")
public final class PhoneBattery {
    private static final String TAG = "MorphePhoneBattery";
    private static final String PREFERENCES = "morphe_phone_battery";
    private static final String KEY_ON = "on";

    /** The switch, null until read, and whether the user set it (false: the default). */
    private static volatile Boolean chosen;
    private static volatile boolean userChoice;
    /** Maps' last percentage check in this process (elapsed realtime, 0 before one), the answer and the battery then. */
    private static volatile long lastCheckAt;
    private static volatile boolean lastShared;
    private static volatile double lastSoc = Double.NaN;
    private static volatile int checks, shares, withLevel;
    private static volatile String loggedState;
    private static volatile boolean failureLogged;
    /** Maps' energy-model checks in this process: the last one (elapsed realtime) and its kind and answer. */
    private static volatile long lastModelAt;
    private static volatile boolean lastModelPending, lastModelShared;
    private static volatile int modelChecks, modelShares, modelRetries;
    /** The model Maps had read before its last upload with the model (BydBatteryPatch.mapsModel), null before one. */
    private static volatile String lastUploadModel;
    private static volatile String loggedModelState;
    private static volatile boolean modelFailureLogged;
    /** The parts of Maps' model uploads in this process that kept the outside temperature (two per upload), the last. */
    private static volatile int temperatureKeeps;
    private static volatile long lastTemperatureKeepAt;
    private static volatile int lastKeptOutsideC = BydOutsideTemperature.UNAVAILABLE;
    private static volatile boolean temperatureLogged, temperatureFailureLogged;
    /** After Maps reads a changed percent, the wait for it to take the model in, and the least time between such runs. */
    private static final long CHANGE_DELAY_MS = 3000, MIN_CHANGE_INTERVAL_MS = 60000;
    /** Maps' live vehicle info timer task (null before Maps schedules it). */
    private static volatile Runnable liveTask;
    /** The whole percent in the model Maps last read, and in Maps' last upload with a level; -1 before one. */
    private static volatile int servedWhole = -1, uploadedWhole = -1;
    /** Runs of the task after a change: the last one (elapsed realtime), one pending, how many. */
    private static volatile long lastChangeRunAt;
    private static volatile boolean changeRunPending;
    private static volatile int changeRuns;
    private static volatile boolean taskLogged, changeLogged, changeFailureLogged;

    private PhoneBattery() {
    }

    /** Injection point: Maps' live vehicle info timer task, as Maps schedules it (every start or account change). */
    public static void liveTask(Runnable task) {
        liveTask = task;
        if (!taskLogged && task != null) {
            taskLogged = true;
            ReportLog.i(TAG, "Battery on the phone: Maps' upload task found, a lower percent goes up soon after it drops");
        }
    }

    /** From BYD battery each time Maps reads its model: runs Maps' upload task soon when the whole percent changed. */
    static void modelRead(double soc) {
        try {
            if (Double.isNaN(soc)) return;
            int whole = (int) soc;
            servedWhole = whole;
            int uploaded = uploadedWhole;
            // Drops only: while charging the percent rises often, and Maps' 2-minute timer is enough.
            if (uploaded < 0 || whole >= uploaded || changeRunPending || liveTask == null) return;
            if (!Utils.isContextSet() || !isOn(Utils.getContext())) return;
            long delay = Math.max(CHANGE_DELAY_MS, lastChangeRunAt + MIN_CHANGE_INTERVAL_MS - SystemClock.elapsedRealtime());
            changeRunPending = true;
            if (!BydBatteryPatch.postToWorker(PhoneBattery::runAfterChange, delay)) changeRunPending = false;
        } catch (Throwable error) {
            if (!changeFailureLogged) {
                changeFailureLogged = true;
                ReportLog.w(TAG, "Battery on the phone: the change check failed", error);
            }
        }
    }

    // BYD battery's worker thread.
    private static void runAfterChange() {
        changeRunPending = false;
        try {
            Runnable task = liveTask;
            int served = servedWhole, uploaded = uploadedWhole;
            // Maps' timer may have uploaded the new percent meanwhile.
            if (task == null || served >= uploaded || !BydBatteryPatch.isActive()) return;
            if (!Utils.isContextSet() || !isOn(Utils.getContext())) return;
            lastChangeRunAt = SystemClock.elapsedRealtime();
            changeRuns++;
            if (!changeLogged) {
                changeLogged = true;
                ReportLog.i(TAG, "Battery on the phone: " + uploaded + "% to " + served + "%, Maps uploads it now");
            }
            task.run();
        } catch (Throwable error) {
            if (!changeFailureLogged) {
                changeFailureLogged = true;
                ReportLog.w(TAG, "Battery on the phone: the upload after a change failed", error);
            }
        }
    }

    /**
     * Injection point: the live vehicle info task's check of the car energy permission (Maps' answer, false on DiLink).
     * True lets Maps add the battery percentage to its upload. Never throws.
     */
    public static boolean share(boolean original) {
        if (original) return true;
        try {
            boolean active = BydBatteryPatch.isActive();
            boolean share = active && Utils.isContextSet() && isOn(Utils.getContext());
            double soc = share ? BydBatteryPatch.modelSoc() : Double.NaN;
            lastCheckAt = SystemClock.elapsedRealtime();
            lastShared = share;
            lastSoc = soc;
            checks++;
            if (share) shares++;
            if (!Double.isNaN(soc)) {
                withLevel++;
                // Maps uploads the percent of the model it last read.
                int served = servedWhole;
                uploadedWhole = served >= 0 ? served : (int) soc;
            }
            String state = !active ? "off (BYD battery not active)" : !share ? "off"
                    : Double.isNaN(soc) ? "on, Maps has no battery level yet and tries again later"
                    : "on, Maps' upload carries the battery";
            if (!state.equals(loggedState)) {
                loggedState = state;
                ReportLog.i(TAG, "Battery on the phone " + state + (Double.isNaN(soc) ? "" : " (" + (int) soc + "%)"));
            }
            return share;
        } catch (Throwable error) {
            if (!failureLogged) {
                failureLogged = true;
                ReportLog.w(TAG, "Battery on the phone check failed", error);
            }
            return false;
        }
    }

    /**
     * Injection point: the energy-model task's check of the car energy permission, reached only when Maps expects the
     * car's model and has none yet (with the permission Maps then returns success without writing). While the switch is
     * on and BYD battery is active this throws: the task is inside Maps' catch of everything, which returns Retry, so
     * WorkManager runs it again in 2 minutes. Otherwise it returns Maps' value (false on DiLink), and Maps writes the
     * record without a model, as it does without the patch.
     */
    public static boolean modelPending(boolean original) {
        if (original) return true;
        if (!modelCheck(true)) return false;
        throw new IllegalStateException("Energy model on the phone: Maps has no model yet, so its upload task retries");
    }

    /**
     * Injection point: the energy-model task's two checks of the car energy permission before it adds the car's model
     * (Maps' answer, false on DiLink). True lets Maps add it. Never throws.
     */
    public static boolean shareModel(boolean original) {
        if (original) return true;
        return modelCheck(false);
    }

    /**
     * Injection point: where the energy-model task clears the outside temperature (field 7 of the vehicle info) in each of
     * the two parts it uploads, a copy of BYD battery's model and Maps' own model made from it. True skips the clear, so
     * the part keeps the temperature BYD battery put in the model. True while the switch is on and BYD battery is active;
     * otherwise false, Maps' own behaviour. Never throws.
     */
    public static boolean keepModelTemperature() {
        try {
            boolean keep = BydBatteryPatch.isActive() && Utils.isContextSet() && isOn(Utils.getContext());
            if (!keep) return false;
            int outsideC = BydBatteryPatch.outsideC();
            temperatureKeeps++;
            lastTemperatureKeepAt = SystemClock.elapsedRealtime();
            lastKeptOutsideC = outsideC;
            if (!temperatureLogged) {
                temperatureLogged = true;
                ReportLog.i(TAG, "Energy model on the phone: Maps' upload keeps the outside temperature"
                        + (outsideC == BydOutsideTemperature.UNAVAILABLE ? " (the model's own)" : " (" + outsideC + " °C)"));
            }
            return true;
        } catch (Throwable error) {
            if (!temperatureFailureLogged) {
                temperatureFailureLogged = true;
                ReportLog.w(TAG, "Energy model on the phone: the outside temperature check failed", error);
            }
            return false;
        }
    }

    /** Whether the model goes in Maps' upload now; records the check. Never throws. */
    private static boolean modelCheck(boolean pending) {
        try {
            boolean active = BydBatteryPatch.isActive();
            boolean share = active && Utils.isContextSet() && isOn(Utils.getContext());
            lastModelAt = SystemClock.elapsedRealtime();
            lastModelPending = pending;
            lastModelShared = share;
            modelChecks++;
            if (share && pending) modelRetries++;
            String model = null;
            if (share && !pending) {
                modelShares++;
                model = BydBatteryPatch.mapsModel();
                lastUploadModel = model;
            }
            String state = !active ? "off (BYD battery not active)" : !share ? "off"
                    : pending ? "on, Maps has no model yet and retries in 2 minutes"
                    : "on, Maps' upload carries the model (" + model + ")";
            if (!state.equals(loggedModelState)) {
                loggedModelState = state;
                ReportLog.i(TAG, "Energy model on the phone " + state);
            }
            return share;
        } catch (Throwable error) {
            if (!modelFailureLogged) {
                modelFailureLogged = true;
                ReportLog.w(TAG, "Energy model on the phone check failed", error);
            }
            return false;
        }
    }

    /** The switch: the stored choice, on when none. Remembered for later reads. */
    static boolean isOn(Context context) {
        Boolean value = chosen;
        return value != null ? value : load(context);
    }

    private static synchronized boolean load(Context context) {
        // A choice from the dialog may have come in meanwhile.
        Boolean cached = chosen;
        if (cached != null) return cached;
        boolean value = true;
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            userChoice = preferences.contains(KEY_ON);
            value = preferences.getBoolean(KEY_ON, true);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the battery on the phone switch", error);
        }
        chosen = value;
        return value;
    }

    /** From the dialog: stores the switch; Maps' next uploads follow it. */
    static void choose(Context context, boolean on) {
        // Under the lock, so a first read in load() cannot put the previous choice back.
        synchronized (PhoneBattery.class) {
            chosen = on;
            userChoice = true;
            try {
                context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putBoolean(KEY_ON, on).apply();
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "Could not store the battery on the phone switch", error);
            }
        }
        ReportLog.i(TAG, "Battery on the phone switched " + (on ? "on" : "off") + " (percentage and energy model)");
        // A report opened right after the change reads the main process's snapshot.
        ReportBuilder.saveSnapshot(context.getApplicationContext(), true);
    }

    private static String ago(long at, boolean thai) {
        long seconds = Math.max(0, (SystemClock.elapsedRealtime() - at) / 1000);
        return seconds < 120 ? (thai ? seconds + " วินาทีก่อน" : seconds + " s ago")
                : (thai ? seconds / 60 + " นาทีก่อน" : seconds / 60 + " min ago");
    }

    /** The dialog's status under the switch: the percentage, then the energy model on a second line. */
    static String status(Context context, boolean thai) {
        if (!isOn(context)) return thai ? "ปิด" : "Off";
        return percentStatus(thai) + "\n" + modelStatus(thai);
    }

    private static String percentStatus(boolean thai) {
        long at = lastCheckAt;
        if (at == 0 || !lastShared) return thai ? "เปิด · รอ Maps ส่งข้อมูลรถรอบถัดไป" : "On · waiting for Maps' next upload";
        double soc = lastSoc;
        String ago = ago(at, thai);
        if (Double.isNaN(soc)) {
            return thai ? "เปิด · รอบล่าสุด Maps ยังไม่มีระดับแบต จะลองใหม่ (" + ago + ")"
                    : "On · Maps had no battery level at its last upload and tries again (" + ago + ")";
        }
        return thai ? "เปิด · ใส่ " + (int) soc + "% ในข้อมูลรถรอบล่าสุดของ Maps (" + ago + ")"
                : "On · " + (int) soc + "% in Maps' last upload (" + ago + ")";
    }

    private static String modelStatus(boolean thai) {
        long at = lastModelAt;
        if (at == 0 || !lastModelShared) {
            return thai ? "โมเดลพลังงาน: Maps จะส่งตอนเปิดแอปครั้งถัดไป หรือภายใน 2 ชั่วโมง"
                    : "Energy model: Maps sends it at its next start, or within 2 hours";
        }
        String ago = ago(at, thai);
        if (lastModelPending) {
            return thai ? "โมเดลพลังงาน: Maps ยังไม่มีโมเดล จะลองใหม่ใน 2 นาที (" + ago + ")"
                    : "Energy model: Maps had none yet and tries again in 2 minutes (" + ago + ")";
        }
        return thai ? "โมเดลพลังงาน: อยู่ในข้อมูลที่ Maps ส่งรอบล่าสุด (" + ago + ")"
                : "Energy model: in Maps' last upload (" + ago + ")";
    }

    /** For the problem report (main process): the switch and Maps' checks in this process. */
    static JSONObject report(Context context) throws JSONException {
        boolean on = isOn(context);
        long at = lastCheckAt;
        double soc = lastSoc;
        long modelAt = lastModelAt;
        return new JSONObject()
                .put("on", on)
                .put("on_source", userChoice ? "user" : "default")
                .put("checks", checks)
                .put("shared", shares)
                .put("with_level", withLevel)
                .put("last_check_age_s", at == 0 ? JSONObject.NULL : (SystemClock.elapsedRealtime() - at) / 1000)
                .put("last_shared", at == 0 ? JSONObject.NULL : lastShared)
                .put("last_soc", at == 0 || Double.isNaN(soc) ? JSONObject.NULL : (int) soc)
                .put("task_found", liveTask != null)
                .put("change_uploads", changeRuns)
                .put("last_change_upload_age_s", lastChangeRunAt == 0 ? JSONObject.NULL
                        : (SystemClock.elapsedRealtime() - lastChangeRunAt) / 1000)
                .put("model", new JSONObject()
                        .put("on", on)
                        .put("checks", modelChecks)
                        .put("shared", modelShares)
                        .put("retries", modelRetries)
                        .put("last_check_age_s", modelAt == 0 ? JSONObject.NULL : (SystemClock.elapsedRealtime() - modelAt) / 1000)
                        .put("last_check", modelAt == 0 ? JSONObject.NULL
                                : !lastModelShared ? "not_shared" : lastModelPending ? "retry" : "shared")
                        .put("last_upload_model", lastUploadModel == null ? JSONObject.NULL : lastUploadModel)
                        .put("temperature_kept", temperatureKeeps)
                        .put("last_temperature_keep_age_s", lastTemperatureKeepAt == 0 ? JSONObject.NULL
                                : (SystemClock.elapsedRealtime() - lastTemperatureKeepAt) / 1000)
                        .put("last_kept_outside_c", lastTemperatureKeepAt == 0
                                || lastKeptOutsideC == BydOutsideTemperature.UNAVAILABLE ? JSONObject.NULL : lastKeptOutsideC));
    }
}
