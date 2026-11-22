package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;

import app.morphe.extension.shared.Utils;

/**
 * BYD battery for Maps' EV routing.
 * <p>
 * The AAOS build gets a car's energy model from an OEM ContentProvider: its listener reads an
 * energy-model proto from content://google_maps_energy/model, converts it to the model it attaches
 * to route requests, and withdraws the model when the provider returns nothing. On the Dolphin
 * (DiLink 3, no automotive feature) Maps sees no EV and creates no listener. While this is on, Maps
 * Car acts as that OEM source:
 * <ul>
 * <li>Maps' demo EV vehicle reports a BEV with Type 2 and CCS2 connectors ({@link #connectorTypes});</li>
 * <li>the listener uses this app's authority and needs no car permission ({@link #energyAuthority},
 * {@link #energyPermission}); Maps accepts the in-app provider ({@link #resolveProvider});</li>
 * <li>a worker reads the battery every 10 s, from the BYD SDK on DiLink 3 or, on DiLink 5, which has
 * none, from the TS car adapter ({@link TsEnergyReader}), and Maps reads the encoded model
 * ({@link #openEnergyModel}). A reading is fresh for 30 s; then the model is withdrawn.</li>
 * </ul>
 * The model is built from one of BYD DiCarServer's energy-model files as DiCarServer
 * builds one ({@link BydVehicleEnergyFile}), with this car's battery and outside temperature. The file
 * is the table whose capacity is nearest the car's (420_1, 81_1 or 128_2), so other BYD cars
 * get a table of their size. The mass is the table's, which includes the driver, plus the people the
 * user picks in the dialog. With 420_1, the Dolphin Standard Range's table, on the Dolphin (model id
 * 186) the Dolphin's motor power and charging rate are sent too. If no file can be used, Maps gets a fallback model: the road load
 * scaled to the learned consumption. With a file the learned consumption is only shown, for comparison.
 * Read-only: no ADB, no shell, no raw binder calls, no vehicle writes. Maps' uploads of the battery
 * percentage and of the model to the account need the car permission this app never holds; both go
 * while the dialog's Battery on the phone switch is on, the default ({@link PhoneBattery}).
 * <p>
 * On by default with the BYD SDK (DiLink 3) on the tested Dolphin (model id 186), on the reported models and, from
 * 0.2.0, on other models where BYD's DiCarServer tables are installed, unless the car's own data was found too far
 * from its table ({@link #checkMismatch}); off on DiLink 5, with an "untested" notice; the Settings row's choice is kept
 * and wins. Active only in the main process of such a car. Otherwise
 * every injection point returns the original value. A new choice applies after the app restarts,
 * because Maps reads the vehicle type and creates its listeners when it starts.
 */
@SuppressWarnings("unused")
public final class BydBatteryPatch {
    private static final String TAG = "MorpheBydBattery";
    private static final String PREFERENCES = "morphe_byd_battery";
    private static final String KEY_ENABLED = "enabled";
    private static final String BYD_SDK_CLASS = "android.hardware.bydauto.statistic.BYDAutoStatisticDevice";
    /** Connector names Maps' demo EV vehicle parses: Type 2 AC and CCS2 DC of the Thai Dolphin. */
    private static final String CONNECTORS = "MENNEKES,COMBO_2";
    /** Must match the provider authority the patch adds to the manifest. */
    private static final String AUTHORITY_SUFFIX = ".morphe_byd_energy";
    private static final String MODEL_PATH = "model";
    private static final long START_DELAY_MS = 1000, POLL_MS = 10000, FRESH_MS = 30000, DIALOG_REFRESH_MS = 2000;
    /** The battery health and temperatures (dialog and report only): how often each is read. */
    private static final long HEALTH_EVERY_MS = 30 * 60 * 1000, TEMPERATURE_EVERY_MS = 60 * 1000;
    // Phone priors (fank-morphe-maps-patches 1.4.0): capacity below 10% SOC until one is measured, and
    // the road load that BydVehicleModel scales to the car's average and learned consumption.
    private static final float NOMINAL_WH = 50250f, ROLLING_N = 160f, LINEAR_N = 0f, DRAG_N = 0.35f;
    // The fallback model's vehicle values, those of Google's demo car that phone Maps sends: mass (kg),
    // peak motor power and maximum charging rate (W) (field meanings from DiCarServer's energy_model.proto).
    private static final int DEMO_MASS_KG = 2154, DEMO_PEAK_MOTOR_POWER_W = 170000, DEMO_MAX_CHARGING_RATE_W = 155000;
    // BYD's tables: BydVehicleEnergyFile.tableOrder picks the one nearest the car's
    // capacity. DiCarServer has no file for the Dolphin's model id 186, and other cars' ids are not known.
    private static final String DICAR_PACKAGE = "com.byd.car.server";
    /**
     * The Dolphin Standard Range's table (48.3–48.9 kWh measured): sent with its motor power and charging
     * rate when the car is the Dolphin (an Atto 3 with 49.92 kWh also gets this table).
     */
    private static final String DOLPHIN_TABLE = "420_1.bin";
    /** The tested car's BYD model id (car settings model_value and persist.sys.vehicle_40d_code). */
    private static final int DOLPHIN_MODEL_ID = 186, MODEL_UNKNOWN = -1, MODEL_NOT_READ = Integer.MIN_VALUE;
    /**
     * On by default, a stored choice aside: the tested Dolphin, and the models whose owners' reports (0.1.4–0.1.5) show
     * BYD battery on without a crash from it: 128 (capacity 45–49 or 58–60 kWh, tables 420_1 and 81_1) and 138 (about
     * 76 kWh, table 128_2). Only the Dolphin gets its motor power and charging rate ({@link #sendsDolphinPower}).
     */
    private static final int[] DEFAULT_ON_MODEL_IDS = {DOLPHIN_MODEL_ID, 128, 138};
    /**
     * Other models with the BYD SDK and DiCarServer's tables start on as well (from 0.2.0), unless their own data
     * is further from BYD's table than the learning can correct: the speed bands outside these ratios, or BYD's trip log
     * (which reads high in stop-and-go traffic) outside its own. That verdict is kept and turns the default off from the
     * next start, with a notice; the owner's choice still wins.
     */
    private static final double MISMATCH_BANDS_LOW = 0.6, MISMATCH_BANDS_HIGH = 2.0, MISMATCH_LOG_LOW = 0.5, MISMATCH_LOG_HIGH = 3.0;
    private static final String KEY_MISMATCH = "model_mismatch", KEY_MISMATCH_TEXT = "model_mismatch_text";
    /** The speed bands decide once they have this many finished pools (10 km each). */
    private static final int MISMATCH_POOLS = 2;
    /**
     * A capacity below this on a model outside {@link #DEFAULT_ON_MODEL_IDS}, without the owner's choice, is taken for a
     * plug-in hybrid (DM-i, 8–26.6 kWh on DiLink 3; BYD's smallest electric car, the Seagull, has about 29 usable): not
     * sent to Maps in that process, off by default from the next start. A DM-i with a larger battery is not caught.
     */
    private static final int MIN_BEV_WH = 26000;
    /** Hybrid-size readings in a row (10 s apart) before the verdict is stored: one stale reading at boot is not one. */
    private static final int HYBRID_READINGS = 6;
    /** BYD's trip log as last read: the table it was priced against, its summary and ratio (JSON). */
    private static final String KEY_TRIP_LOG = "trip_log";
    /**
     * The automatic read (at Maps' start, from the file or quietly through the car's ADB): at each start until one read
     * works, then at most this often; the owner's "Not now" on the dialog's card is kept.
     */
    private static final long TRIP_LOG_EVERY_MS = 20 * 3600 * 1000L;
    /**
     * The automatic read through the car's ADB waits this long after Maps' start. Quick Controls uses the car's loopback
     * ADB at boot (its watchdog, split screen with Maps) and could not connect while another ADB client was connected
     * (2026-11-18); the read itself takes a few seconds.
     */
    private static final long TRIP_LOG_ADB_DELAY_MS = 3 * 60 * 1000L;
    private static final String KEY_TRIP_LOG_DISMISSED = "trip_log_dismissed";
    /** A range's km per 1% (above 90%, or 90% and below) from its whole percents alone once this many are measured. */
    private static final int MIN_KM_LEVELS = 5;
    /** Accepted learning windows before the learned consumption gives the km per 1% (else the speed bands, else none). */
    private static final int MIN_KM_WINDOWS = 3;
    private static final String MODEL_PROPERTY = "persist.sys.vehicle_40d_code", CAR_SETTINGS_MODEL_KEY = "model_value";
    /** The head unit's software version on DiLink 3 ("dilink3.0_…" on the Dolphin); a report fact only. */
    private static final String FIRMWARE_PROPERTY = "persist.sys.gbClientVersion", VEHICLE_TYPE_PROPERTY = "ro.vehicle.type";
    private static final Uri CAR_SETTINGS = Uri.parse("content://carsettings/system_settings");
    // People and luggage above the table's mass, picked in the dialog. BYD's table masses are
    // the weight in the file name + 100 kg (81_1580/1620/1750: 1,680/1,720/1,850 kg), so they include
    // the driver. 75 kg per person: driver only (the default), 2 people, 2 people with luggage, 4-5
    // people with luggage.
    private static final int[] LOADS_KG = {0, 75, 125, 275};
    private static final int DEFAULT_LOAD_KG = 0, DRIVER_KG = 75;
    private static final String KEY_LOAD = "people_kg";
    /** The last whole-percent step of SOC ({@link BydSocFraction}): the percent entered, its energy, the direction. */
    private static final String KEY_STEP_SOC = "soc_step", KEY_STEP_WH = "soc_step_wh", KEY_STEP_DOWN = "soc_step_down";
    /** Two readings at most this far apart are consecutive (one poll and a late one), so a change between them is a step. */
    private static final long STEP_GAP_MS = 25000;
    /** Whole percents driven through before their mean energy replaces the reading's own average. */
    private static final int MIN_LEVELS = 3;
    /** An older stored load above the car's 1,500 kg, driver included: read less the driver until a new choice. */
    private static final String KEY_OLD_LOAD = "load_kg";
    /** New Dolphin Standard Range (Rever Automotive's specification): 70 kW motor, 60 kW DC charging. */
    private static final int PEAK_MOTOR_POWER_W = 70000, MAX_CHARGING_RATE_W = 60000;
    // Protobuf wire types.
    private static final int VARINT = 0, LENGTH_DELIMITED = 2, FIXED32 = 5;
    // The model Maps receives: BYD's table adjusted with values measured on this car (BydCalibration: the auxiliary power
    // while standing, a traction factor from Maps' own forecasts); BYD's table itself only until the calibration is ready
    // or when the adjusted model fails (no choice; an "energy_model" preference left by a test build is ignored).
    private static final String MODEL_ADJUSTED = "adjusted", MODEL_TABLE = "table", MODEL_FALLBACK = "fallback";
    private static final String CALIBRATION_FILE = "morphe_byd_calibration.txt";
    /** The calibration is saved at most this often, and at once after a route. */
    private static final long CALIBRATION_SAVE_MS = 60000;
    /** The newest drive-record files replayed into a new calibration. */
    private static final int SEED_FILES = 8;

    private static volatile boolean active;
    private static volatile byte[] energyModel;
    // What a published energyModel is ("adjusted;factor=…;aux_w=…", MODEL_TABLE or MODEL_FALLBACK), set with it under
    // MODEL_LOCK; and what the model Maps last read was ("none" before a read), for Battery on the phone.
    private static final Object MODEL_LOCK = new Object();
    private static String energyModelKind = "none";
    private static volatile String mapsReadKind = "none";
    private static volatile double lastSoc = Double.NaN;
    private static volatile long lastSampleAt, lastMapsReadAt;
    // The last reading, kept for the Settings dialog after it turns stale.
    private static volatile double sampleSoc;
    private static volatile int sampleEnergyWh, sampleCapacityWh;
    // Where that capacity comes from (BydCapacityText.FROM_*): the reading itself at 10% SOC or more; below that the
    // capacity measured earlier, a legacy manual one, or the default before any was measured.
    private static volatile int sampleCapacityFrom = BydCapacityText.FROM_CAR;
    // BYD's model file once loaded (null: not loaded or unusable, then the fallback model), the capacity
    // it was chosen for, and the outside temperature of the last reading.
    private static volatile BydVehicleEnergyFile energyFile;
    private static volatile boolean energyFileChecked;
    private static volatile int energyFileCapacityWh;
    // Worker thread only: chosen from the nominal capacity (a new install below 10% SOC), so chosen
    // again once a capacity is measured.
    private static boolean energyFileProvisional;
    private static volatile int sampleOutsideC = BydOutsideTemperature.UNAVAILABLE;
    private static volatile int loadKg = DEFAULT_LOAD_KG;
    private static volatile int bydModelId = MODEL_NOT_READ;
    private static volatile String bydModelSource = "unreadable";
    private static BydOutsideTemperature outsideTemperature;
    // The battery health and temperatures, DiLink 3's BYD SDK only; raw values, UNAVAILABLE before a read.
    private static volatile BydBatteryHealth health;
    private static volatile String healthStatus;
    private static volatile int sampleHealthRaw = BydBatteryHealth.UNAVAILABLE;
    private static volatile BydBatteryHealth.Raw sampleTemperatures;
    private static volatile long healthReadAt, temperatureReadAt;
    // Worker thread only.
    private static long nextHealthAt, nextTemperatureAt;
    private static boolean healthReadFailed;
    private static int loggedHealthRaw = BydBatteryHealth.UNAVAILABLE;
    private static Context context;
    private static String authority;
    private static Uri modelUri;
    private static Handler worker;
    private static BydBatterySource reader;
    private static String readerStatus;
    private static long lastRevision = -1;
    private static int lastLoggedSoc = -1, failures;
    // Worker thread only, restored before the worker starts.
    private static final BydSocFraction socFraction = new BydSocFraction();
    private static String lastLoggedSelection;
    // Maps' energy forecasts during guidance (BydForecast) and the guided drives they make; the drive records (BydDriveLog);
    // the optional signals (BydSignalProbe, DiLink 3 only). None of these changes what Maps receives.
    private static final String KEY_GUIDED = "guided_drives";
    private static volatile BydForecast.Tracker guided = new BydForecast.Tracker();
    private static final AtomicLong forecastCount = new AtomicLong();
    private static volatile long lastForecastAt;
    private static volatile String lastForecastText;
    private static volatile int lastForecastStops = -1;
    // Maps sends an empty forecast when its main process starts (MviControllerImpl.onCreate resets the listener). Until a
    // forecast with stops arrives in this process, empty ones do not end a guided drive restored from storage.
    private static volatile boolean forecastSeen;
    // Maps builds forecasts only when a system provider declares google_maps_energy (DiCarServer on the Dolphin);
    // checked once for the log and the report. Null: not checked yet.
    private static volatile Boolean forecastProvider;
    private static int forecastFailures;
    private static volatile BydSignalProbe signals;
    private static volatile String signalStatus, signalFirst;
    // Worker thread only.
    private static String savedGuided = "";
    private static int recordFailures, sampleCount;
    // The adjusted model (BydCalibration): the calibration once the table is loaded, and what went to Maps with the last
    // reading (the adjusted model, its traction factor and auxiliary power).
    private static volatile BydCalibration calibration;
    private static volatile boolean adjustedSent;
    // The last reading's adjusted model failed to build (BYD's table went out instead), for the dialog.
    private static volatile boolean adjustedFailed;
    private static volatile double sentFactor = 1;
    private static volatile int sentAuxW = -1;
    // The A/C state of the last reading (null: unknown), for the dialog.
    private static volatile Boolean sampleAcOn;
    // The dialog's reset while the calibration is still being built: applied once it exists.
    private static volatile boolean calibrationResetPending;
    // Worker thread only.
    // BYD's trip log: the last summary (this process or stored), why the last read failed, and the reads in progress.
    private static volatile BydTripLog.Summary tripLog;
    private static volatile String tripLogError, tripLogSource, tripLogQuiet;
    private static volatile long tripLogAt;
    private static volatile boolean tripLogReading, tripLogPermissionAsked, tripLogTried, tripLogAuto, tripLogFileFailed;
    // The stored verdict as it was when this process started (the default it decided); a hybrid-size battery seen now.
    private static volatile Boolean startMismatch;
    private static volatile int smallBatteryWh;
    // Worker thread only: hybrid-size readings in a row (hybridBattery).
    private static int smallReadings;
    // DiCarServer holds one of the tables BYD battery reads (hasEnergyTables), checked once per process; null before.
    private static volatile Boolean energyTables;
    private static boolean calibrationTried, calibrationDirty, calibrationFailureLogged, adjustedFailureLogged, calibrationSaveFailureLogged;
    private static long calibrationSavedAt;
    private static BydVehicleEnergyFile calibrationFile;

    private BydBatteryPatch() {
    }

    /**
     * Injection point: start of the Application's attachBaseContext. Maps' content providers and its
     * onCreate run later and may build the components that read the vehicle type, so the choice is
     * made here. The base context serves preferences and the content resolver.
     */
    public static void attachBaseContext(Context base) {
        try {
            if (active || base == null || !SafeMode.on(base, SafeMode.BYD_BATTERY) || !isEnabled(base) || !isByd()) return;
            if (!base.getPackageName().equals(Application.getProcessName())) return;
            // DiLink 3: the BYD SDK. DiLink 5 has none: the TS car adapter. Neither: not started.
            boolean sdk = hasBydSdk();
            if (!sdk) Class.forName(TsEnergyReader.ADAPTER_CLASS);
            context = base;
            loadKg = storedLoad(base);
            restoreSocStep(base);
            authority = base.getPackageName() + AUTHORITY_SUFFIX;
            modelUri = new Uri.Builder().scheme("content").authority(authority).path(MODEL_PATH).build();
            BydVehicleModel.initialize(base, NOMINAL_WH, ROLLING_N, LINEAR_N, DRAG_N);
            BydSpeedBands.initialize(base);
            savedGuided = base.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getString(KEY_GUIDED, "");
            guided = BydForecast.Tracker.load(savedGuided);
            reader = sdk ? new BydEnergyReader() : new TsEnergyReader();
            HandlerThread thread = new HandlerThread(TAG, Process.THREAD_PRIORITY_BACKGROUND);
            thread.start();
            worker = new Handler(thread.getLooper());
            active = true;
            worker.post(() -> BydDriveLog.initialize(base));
            // The BYD SDK needs the application context, which exists once the Application is created.
            worker.postDelayed(BydBatteryPatch::poll, START_DELAY_MS);
            ReportLog.i(TAG, "BYD battery on" + (sdk ? "" : " (TS car adapter)") + ": " + modelUri);
        } catch (Throwable error) {
            active = false;
            ReportLog.w(TAG, "BYD battery not started", error);
        }
    }

    /** Whether BYD battery feeds Maps in this process (on in Settings, its switch on, a BYD car, the main process). */
    static boolean isActive() {
        return active;
    }

    /** The dashboard percentage of the model Maps can read now, NaN while there is none (before a reading, or withdrawn). */
    /** Runs [task] on the BYD battery worker thread after [delayMs]; false when there is no worker (not active). */
    static boolean postToWorker(Runnable task, long delayMs) {
        Handler handler = worker;
        return handler != null && handler.postDelayed(task, delayMs);
    }

    static double modelSoc() {
        return energyModel != null ? sampleSoc : Double.NaN;
    }

    /** The outside temperature of the last reading (°C), {@link BydOutsideTemperature#UNAVAILABLE} without one. */
    static int outsideC() {
        return sampleOutsideC;
    }

    /** What the model Maps last read was: "adjusted;factor=…;aux_w=…", "table", "fallback", or "none" before a read. */
    static String mapsModel() {
        return mapsReadKind;
    }

    /** Injection point: each read of Maps' demo_ev_connector_types preference. */
    public static String connectorTypes(String original) {
        return active ? CONNECTORS : original;
    }

    /**
     * Injection point: whether Maps creates its energy-model listener. Maps creates it only for a BEV
     * outside the system user, because AAOS runs apps in a secondary user; DiLink runs them as user 0.
     */
    public static boolean energyListener(boolean original) {
        return active || original;
    }

    /** Injection point: the authority of Maps' energy-model listener (google_maps_energy). */
    public static String energyAuthority(String original) {
        return active ? authority : original;
    }

    /**
     * Injection point: the permission Maps checks before reading the energy model
     * (android.car.permission.CAR_ENERGY). DiLink does not define it; the source is this app.
     */
    public static String energyPermission(String original) {
        return active ? null : original;
    }

    /**
     * Injection point: the provider lookup when Maps connects its OEM listeners at start. Maps asks
     * for system providers only; this app's own energy provider is accepted as well.
     */
    public static ProviderInfo resolveProvider(PackageManager packageManager, String name, int flags) {
        if (active && authority.equals(name)) {
            return packageManager.resolveContentProvider(name, flags & ~PackageManager.MATCH_SYSTEM_ONLY);
        }
        return packageManager.resolveContentProvider(name, flags);
    }

    /**
     * Injection point: whether Maps creates its energy forecast sender and guidance listener. As for the energy model,
     * Maps creates them only for a BEV outside the system user; with BYD battery on they exist so that the forecasts
     * reach {@link #captureForecast}.
     */
    public static boolean forecastListener(boolean original) {
        return active || original;
    }

    /**
     * Injection point: start of the forecast sender. True hands the forecast to {@link #captureForecast} and skips
     * the sender, which would write it to google_maps_energy (BYD's DiCarServer declares that authority): with BYD
     * battery on, nothing is sent to the car.
     */
    public static boolean forecastIntercept() {
        return active;
    }

    /**
     * Injection point: Maps' energy forecast (VehicleEnergyForecast bytes) on the sender's thread. Kept on the car:
     * the guided drives (Maps' battery on arrival against the battery on arrival) and the drive records. Never throws.
     */
    public static void captureForecast(byte[] proto) {
        try {
            if (!active || proto == null) return;
            BydForecast.Forecast forecast = BydForecast.parse(proto);
            long wall = System.currentTimeMillis(), now = SystemClock.elapsedRealtime();
            boolean fresh = lastSampleAt != 0 && now - lastSampleAt <= FRESH_MS;
            int batteryWh = fresh ? sampleEnergyWh : -1;
            if (!forecast.isEmpty()) forecastSeen = true;
            // The start-up reset is recorded below but does not close a drive restored after a restart.
            if (forecastSeen) {
                // The percentage Maps shows for the arrival (above 90% on the car's curve), so the dialog prints the same.
                int shown = fresh ? BydDisplayCurve.shown(forecast.finalArrivalWh(), sampleCapacityWh) : -1;
                guided.onForecast(wall, now, forecast, batteryWh, fresh ? sampleSoc : Double.NaN, fresh ? sampleCapacityWh : -1,
                        shown);
            }
            // The calibration's traction factor compares Maps' forecasts with the battery used.
            BydCalibration calibrating = calibration;
            if (calibrating != null) {
                int arrival = forecast.finalArrivalWh();
                calibrating.onForecast(wall, forecast.isEmpty(), forecast.stops.size(),
                        arrival == BydForecast.NO_ENERGY ? BydCalibration.UNKNOWN : arrival, forecast.totalDistanceM(),
                        forecast.totalTimeS(), batteryWh);
            }
            // File writes stay on the worker thread, in order with the readings.
            String line = BydForecast.eventLine(wall, forecast, batteryWh);
            worker.post(() -> BydDriveLog.event(wall, line));
            long count = forecastCount.incrementAndGet();
            String text = forecast.describe();
            int stops = forecast.isEmpty() ? 0 : forecast.stops.size();
            // The first forecast, the end of guidance and changes in the stops; every forecast is in the drive records.
            if (count == 1 || stops != lastForecastStops) {
                ReportLog.i(TAG, "energy forecast " + count + ": " + text + (fresh ? " battery_wh=" + batteryWh : " battery=stale"));
            }
            lastForecastStops = stops;
            lastForecastText = text;
            lastForecastAt = now;
        } catch (Throwable error) {
            if (forecastFailures++ % 50 == 0) ReportLog.w(TAG, "energy forecast not read: " + BydEnergyReader.describe(error));
        }
    }

    /** Injection point: whether a listener read is for this app's energy model. */
    public static boolean ownsEnergyModel(Uri uri) {
        return active && modelUri.equals(uri);
    }

    /** Injection point: the energy model for Maps' listener, or null when there is no fresh reading. */
    public static InputStream openEnergyModel(Uri uri) {
        byte[] model;
        String kind;
        synchronized (MODEL_LOCK) {
            model = energyModel;
            kind = energyModelKind;
        }
        if (model == null) return null;
        lastMapsReadAt = SystemClock.elapsedRealtime();
        mapsReadKind = kind;
        // Battery on the phone: a lower whole percent in Maps' model makes Maps upload it soon (never throws).
        PhoneBattery.modelRead(sampleSoc);
        return new ByteArrayInputStream(model);
    }

    // Worker thread only.
    private static void poll() {
        try {
            if (!reader.ready()) {
                String status = reader.init(context);
                if (!status.equals(readerStatus)) ReportLog.i(TAG, (reader instanceof BydEnergyReader ? "BYD SDK " : "") + status);
                readerStatus = status;
            }
            // After the reader, which usually creates the instrument device; one attempt per process. DiLink 3 only.
            if (outsideTemperature == null && reader instanceof BydEnergyReader && reader.ready()) {
                outsideTemperature = new BydOutsideTemperature();
                ReportLog.i(TAG, "outside temperature " + outsideTemperature.init(context));
            }
            // The same for the battery health and temperatures (dialog and report only).
            if (health == null && reader instanceof BydEnergyReader && reader.ready()) {
                BydBatteryHealth created = new BydBatteryHealth();
                healthStatus = created.init(context);
                health = created;
                ReportLog.i(TAG, "battery health " + healthStatus);
            }
            if (forecastProvider == null) {
                boolean found;
                try {
                    found = context.getPackageManager().resolveContentProvider("google_maps_energy",
                            PackageManager.MATCH_SYSTEM_ONLY) != null;
                } catch (RuntimeException error) {
                    found = false;
                }
                forecastProvider = found;
                ReportLog.i(TAG, "energy forecast " + (found ? "on: a system provider declares google_maps_energy (nothing is written to it)"
                        : "off: no system provider declares google_maps_energy, so Maps builds no forecast"));
            }
            // The optional signals for the drive records (battery current, A/C, the car's energy split); read-only.
            if (signals == null && reader instanceof BydEnergyReader && reader.ready()) {
                BydSignalProbe created = new BydSignalProbe();
                signalStatus = created.init(context);
                signals = created;
                ReportLog.i(TAG, "signals " + signalStatus);
            }
            BydEnergyReader.Sample sample = reader.read();
            if (sample == null) {
                BydVehicleModel.unavailable("sdk_unavailable");
                BydSpeedBands.unavailable();
                // The TS adapter's raw values reach the report even when no reading passes.
                if (reader instanceof TsEnergyReader) ReportBuilder.saveSnapshot(context, false);
            } else {
                publish(sample);
                failures = 0;
                // BYD's trip log, once a day after the table is chosen: the file with the storage permission (DiLink 3)
                // at once, else the car's ADB without asking, TRIP_LOG_ADB_DELAY_MS later (quietTripLog). Neither: the
                // dialog's card asks the owner once.
                if (!tripLogTried && !tripLogReading && energyFile != null) {
                    // tripLogAuto first: the card stays hidden until the automatic attempt is over (no flash while the
                    // stored summary is restored).
                    tripLogAuto = true;
                    tripLogTried = true;
                    restoreTripLog(energyFile);
                    if (!tripLogDue()) {
                        tripLogAuto = false;
                    } else if (BydTripLogReader.storageRoute() && BydTripLogReader.permitted(context)) {
                        readTripLog(BydTripLogReader.FILE);
                    } else if (!postToWorker(BydBatteryPatch::quietTripLog, TRIP_LOG_ADB_DELAY_MS)) {
                        tripLogAuto = false;
                    }
                }
            }
        } catch (Throwable error) {
            BydVehicleModel.unavailable("sdk_error");
            BydSpeedBands.unavailable();
            if (failures++ % 30 == 0) ReportLog.w(TAG, "BYD read failed: " + BydEnergyReader.describe(error));
        }
        readHealth();
        if (energyModel != null && SystemClock.elapsedRealtime() - lastSampleAt > FRESH_MS) {
            energyModel = null;
            adjustedSent = false;
            lastSoc = Double.NaN;
            BydDisplayCurve.clear();
            notifyModelChanged();
            ReportLog.i(TAG, "battery reading is stale, energy model withdrawn");
        }
        worker.postDelayed(BydBatteryPatch::poll, POLL_MS);
    }

    private static void publish(BydEnergyReader.Sample sample) {
        int current = (int) Math.round(sample.energy * 1000);
        BydVehicleModel.Model model = BydVehicleModel.activatePending();
        // BYD reports whole SOC percents and Maps floors percentages. Placing the pair inside its
        // percent makes Maps show the dashboard value (as in phone Maps); where inside follows the energy
        // used since the last step (BydSocFraction), the midpoint until a step is seen.
        boolean inPercent = sample.soc >= 10 && sample.soc < 100 && sample.soc == Math.rint(sample.soc);
        boolean consecutive = lastSampleAt != 0 && SystemClock.elapsedRealtime() - lastSampleAt <= STEP_GAP_MS;
        boolean stepped = socFraction.observe(consecutive ? lastSoc : Double.NaN, sample.soc, current);
        double fraction = inPercent ? socFraction.fraction(sample.soc, current, whPerPercent(sample.soc, current)) : Double.NaN;
        boolean located = !Double.isNaN(fraction);
        if (inPercent && !located) fraction = BydSocFraction.MIDPOINT;
        double capacity = sample.soc >= 10 ? current * 100.0 / (inPercent ? sample.soc + fraction : sample.soc)
                : BydVehicleModel.lowSocCapacity(model);
        if (!(capacity >= 5000 && capacity <= 150000 && current <= capacity + 500)) {
            throw new IllegalArgumentException("inconsistent SOC " + sample.soc + " and energy " + current);
        }
        if (stepped) saveSocStep();
        int capacityWh = Math.max(current, (int) Math.round(capacity));
        if (sample.soc >= 10 && capacityWh < MIN_BEV_WH && !userChose(context) && !defaultOnModel(modelId(context))) {
            hybridBattery(capacityWh);
            return;
        }
        // Published from here (the hybrid notice goes); a full-size reading also undoes the hybrid count and its verdict.
        if (smallReadings > 0 || smallBatteryWh > 0) fullSizeBattery(sample.soc >= 10 && capacityWh >= MIN_BEV_WH ? capacityWh : 0);
        int outsideC = outsideTemperature != null ? outsideTemperature.read() : BydOutsideTemperature.UNAVAILABLE;
        // The table is chosen once, from the first measured capacity.
        boolean nominal = sample.soc < 10 && "nominal_fallback".equals(BydVehicleModel.lowSocCapacityBasis(model));
        if (!energyFileChecked || energyFileProvisional && !nominal) {
            energyFile = loadEnergyFile(capacityWh);
            energyFileCapacityWh = capacityWh;
            energyFileProvisional = nominal;
            energyFileChecked = true;
        }
        BydVehicleEnergyFile file = energyFile;
        // The optional signals, read once per reading for the drive record and the calibration (battery current, A/C).
        String signalText = readSignals();
        Boolean acOn = BydCalibration.acState(signalValue(signalText, "acstate"));
        sampleAcOn = acOn;
        if (file != null) observeCalibration(file, sample, current, outsideC, signalText, acOn);
        else adjustedSent = false;
        byte[] encoded = file != null ? encodeModel(file, current, capacityWh, outsideC, acOn, sample.wall) : null;
        if (encoded == null) {
            file = null;
            encoded = encodeEnergyModel(current, capacityWh, model);
        }
        boolean resumed = energyModel == null;
        String kind = file == null ? MODEL_FALLBACK : !adjustedSent ? MODEL_TABLE
                : String.format(Locale.ROOT, "%s;factor=%.3f;aux_w=%d", MODEL_ADJUSTED, sentFactor, sentAuxW);
        synchronized (MODEL_LOCK) {
            energyModelKind = kind;
            energyModel = encoded;
        }
        sampleSoc = sample.soc;
        sampleEnergyWh = current;
        sampleCapacityWh = capacityWh;
        sampleCapacityFrom = sample.soc >= 10 ? BydCapacityText.FROM_CAR
                : BydCapacityText.from(BydVehicleModel.lowSocCapacityBasis(model));
        sampleOutsideC = outsideC;
        lastSampleAt = SystemClock.elapsedRealtime();
        lastSoc = sample.soc;
        // Maps' percentages on this car's curve (more energy per percent above 90%).
        BydSpeedBands.LevelStatus high = BydSpeedBands.levelStatus()[0];
        BydDisplayCurve.set(current, capacityWh, high.count, high.kwhPerPercent * 1000);
        // The first reading at once: the start's first snapshot, taken before it, would hold the report for 60 s.
        // A new model too (a learning reset or a learned value), so the report shows its consumption.
        ReportBuilder.saveSnapshot(context, resumed || model.revision != lastRevision);
        // A new read also restarts the model's age that Maps sends with each request.
        notifyModelChanged();
        String source = file == null ? "source=fallback;" + model.describe()
                : "source=byd_file:" + file.name + ";chosen_for_wh=" + energyFileCapacityWh + ";mass_kg=" + massKg(file)
                + ";power_w=" + (sendsDolphinPower(file) ? PEAK_MOTOR_POWER_W + "/" + MAX_CHARGING_RATE_W : "none")
                + ";outside_c=" + bydTemperature(file, outsideC)
                + ";temp_source=" + (outsideC != BydOutsideTemperature.UNAVAILABLE ? "sdk" : "file") + ";"
                + file.describeSelection(bydTemperature(file, outsideC)) + sentModelText() + ";bytes=" + encoded.length;
        if (resumed || model.revision != lastRevision || (int) sample.soc != lastLoggedSoc || !source.equals(lastLoggedSelection)) {
            lastRevision = model.revision;
            lastLoggedSoc = (int) sample.soc;
            lastLoggedSelection = source;
            ReportLog.i(TAG, "energy model: soc=" + sample.soc + " energy_wh=" + current + " capacity_wh=" + capacityWh
                    + " capacity_basis=" + (sample.soc < 10 ? BydVehicleModel.lowSocCapacityBasis(model)
                    : !inPercent ? "soc" : located ? String.format(Locale.ROOT, "soc_step_%s;soc_fraction=%.2f",
                    socFraction.fromAbove() ? "down" : "up", fraction) : "soc_midpoint") + " " + source
                    + (file == null ? "" : ";measured_kwh_100km=" + model.consumption + ";model_revision=" + model.revision));
        }
        record(sample, current, capacityWh, outsideC, file, signalText);
        // Learning cannot invalidate the published reading.
        try {
            BydVehicleModel.observe(sample, current);
        } catch (Throwable error) {
            BydVehicleModel.unavailable("learning_error");
            ReportLog.w(TAG, "learning failed: " + BydEnergyReader.describe(error));
        }
        // Speed bands compare with BYD's table (the dialog, the factor's wider bounds); the whole percents count also
        // without a table (the km per 1%, the battery's place inside its percent, Maps' percentages above 90%).
        try {
            BydSpeedBands.observe(sample, current, capacityWh, file, file != null ? massKg(file) : 0,
                    file != null ? bydTemperature(file, outsideC) : outsideC);
            if (file != null) checkMismatch(BydSpeedBands.speedRatio(), false);
        } catch (Throwable error) {
            BydSpeedBands.unavailable();
            ReportLog.w(TAG, "speed bands failed: " + BydEnergyReader.describe(error));
        }
    }

    // Worker thread only. The guided drives and the drive records for this reading; a failure never touches the reading.
    private static void record(BydEnergyReader.Sample sample, int currentWh, int capacityWh, int outsideC, BydVehicleEnergyFile file,
                               String signalText) {
        try {
            BydForecast.Tracker tracker = guided;
            tracker.onSample(sample.wall, sample.elapsed, currentWh, sample.soc, capacityWh, sample.mileage);
            List<String> notes = tracker.drainNotes();
            for (String note : notes) ReportLog.i(TAG, note);
            // A drive that opened or closed is saved at once (written before the next reading); other changes about once a minute.
            boolean event = !notes.isEmpty();
            if ((event || ++sampleCount % 6 == 0) && tracker.takeChanged()) {
                String text = tracker.save();
                if (!text.equals(savedGuided)) {
                    SharedPreferences.Editor editor = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit()
                            .putString(KEY_GUIDED, text);
                    if (event) editor.commit();
                    else editor.apply();
                    savedGuided = text;
                }
            }
            BydDriveLog.Sample record = new BydDriveLog.Sample();
            record.wall = sample.wall;
            record.elapsed = sample.elapsed;
            record.energyWh = currentWh;
            record.soc = sample.soc;
            record.mileage01km = sample.mileage;
            record.speedKmh = sample.speedKmh;
            if (outsideC != BydOutsideTemperature.UNAVAILABLE) record.outsideC = outsideC;
            BydBatteryHealth.Raw temperatures = sampleTemperatures;
            if (temperatures != null && temperatures.average != BydBatteryHealth.UNAVAILABLE) record.batteryTempRaw = temperatures.average;
            record.altitudeM = BydAltitude.read(context);
            BydSignalProbe probe = signals;
            if (probe != null) {
                record.signals = signalText;
                if (signalFirst == null) {
                    signalFirst = probe.firstReport();
                    ReportLog.i(TAG, "signals first read: " + signalFirst);
                }
            }
            // The table, its drain at time and the mass Maps got (the table's + people), so a replay can rebuild the model;
            // with the adjusted model also its traction factor and auxiliary power (":A1.046/868").
            record.model = file == null ? "fallback" : file.name + ":" + file.drainAtTimeText(bydTemperature(file, outsideC))
                    + ":m" + massKg(file) + (adjustedSent ? String.format(Locale.ROOT, ":A%.3f/%d", sentFactor, sentAuxW) : "");
            BydDriveLog.sample(record);
        } catch (Throwable error) {
            if (recordFailures++ % 30 == 0) ReportLog.w(TAG, "drive records failed: " + BydEnergyReader.describe(error));
        }
    }

    // Worker thread only. The battery health every 30 minutes (every minute until it gives a value) and the
    // temperatures every minute; a failure never touches the battery reading.
    private static void readHealth() {
        BydBatteryHealth source = health;
        if (source == null || !source.ready()) return;
        try {
            long now = SystemClock.elapsedRealtime();
            boolean first = false;
            if (healthReadAt == 0 || now >= nextHealthAt) {
                int raw = source.readHealth();
                boolean valid = BydBatteryHealth.healthPercent(raw) != BydBatteryHealth.UNAVAILABLE;
                if (healthReadAt == 0 || raw != loggedHealthRaw) {
                    ReportLog.i(TAG, "battery health raw " + (raw == BydBatteryHealth.UNAVAILABLE ? "unavailable" : raw)
                            + (valid ? "" : " (no reading)"));
                    loggedHealthRaw = raw;
                }
                first = healthReadAt == 0;
                // A failed re-read keeps the last value (and its time); the next try is in a minute.
                if (valid || BydBatteryHealth.healthPercent(sampleHealthRaw) == BydBatteryHealth.UNAVAILABLE) {
                    sampleHealthRaw = raw;
                    healthReadAt = now;
                }
                nextHealthAt = now + (valid ? HEALTH_EVERY_MS : TEMPERATURE_EVERY_MS);
            }
            if (temperatureReadAt == 0 || now >= nextTemperatureAt) {
                BydBatteryHealth.Raw raw = source.readTemperatures(new BydBatteryHealth.Raw());
                if (temperatureReadAt == 0) {
                    ReportLog.i(TAG, "battery temperatures raw average " + rawText(raw.average) + ", highest " + rawText(raw.highest)
                            + ", lowest " + rawText(raw.lowest));
                    first = true;
                }
                sampleTemperatures = raw;
                temperatureReadAt = now;
                nextTemperatureAt = now + TEMPERATURE_EVERY_MS;
            }
            // The report screen reads the main process's snapshot, saved before these reads at the first battery reading.
            if (first) ReportBuilder.saveSnapshot(context, true);
        } catch (Throwable error) {
            if (!healthReadFailed) ReportLog.w(TAG, "battery health read failed: " + BydEnergyReader.describe(error));
            healthReadFailed = true;
        }
    }

    private static String rawText(int raw) {
        return raw == BydBatteryHealth.UNAVAILABLE ? "unavailable" : String.valueOf(raw);
    }

    private static void notifyModelChanged() {
        try {
            context.getContentResolver().notifyChange(modelUri, null);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "energy model change not delivered", error);
        }
    }

    /**
     * Opens the BYD table nearest the car's capacity in DiCarServer's APK, or the next nearest if a file
     * is missing or unusable; null, and the fallback model, if none can be used.
     */
    private static BydVehicleEnergyFile loadEnergyFile(int capacityWh) {
        AssetManager assets;
        try {
            assets = context.createPackageContext(DICAR_PACKAGE, 0).getAssets();
        } catch (Throwable error) {
            ReportLog.w(TAG, "BYD energy-model files unavailable, using the fallback model: " + BydEnergyReader.describe(error));
            return null;
        }
        for (String name : BydVehicleEnergyFile.tableOrder(capacityWh)) {
            try (InputStream in = assets.open(name)) {
                BydVehicleEnergyFile file = BydVehicleEnergyFile.read(in, name);
                ReportLog.i(TAG, "BYD energy-model file for " + capacityWh + " Wh: " + file.describe());
                return file;
            } catch (Throwable error) {
                ReportLog.w(TAG, "BYD energy-model file " + name + " unusable: " + BydEnergyReader.describe(error));
            }
        }
        ReportLog.w(TAG, "No BYD energy-model file usable, using the fallback model");
        return null;
    }

    /** The Dolphin's motor power and charging rate go with its table on the Dolphin only. */
    private static boolean sendsDolphinPower(BydVehicleEnergyFile file) {
        return DOLPHIN_TABLE.equals(file.name) && testedModel(context);
    }

    /** The table's mass, which includes the driver, plus the people and luggage picked in the dialog. */
    private static int massKg(BydVehicleEnergyFile file) {
        return file.fileMassKg + loadKg;
    }

    /** The stored preset, or an older stored load less the driver; without one (or an unknown value) the driver only. */
    private static int storedLoad(Context context) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            int load = preferences.contains(KEY_LOAD) ? preferences.getInt(KEY_LOAD, DEFAULT_LOAD_KG)
                    : Math.max(0, preferences.getInt(KEY_OLD_LOAD, DEFAULT_LOAD_KG) - DRIVER_KG);
            for (int preset : LOADS_KG) if (preset == load) return load;
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the load", error);
        }
        return DEFAULT_LOAD_KG;
    }

    private static void restoreSocStep(Context context) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            socFraction.restore(preferences.getInt(KEY_STEP_SOC, -1), preferences.getInt(KEY_STEP_WH, 0),
                    preferences.getBoolean(KEY_STEP_DOWN, true));
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Could not read the SOC step", error);
        }
    }

    // Worker thread only. The step outlives the process, so a drive after parking starts placed in its percent.
    private static void saveSocStep() {
        try {
            context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putInt(KEY_STEP_SOC, socFraction.soc())
                    .putInt(KEY_STEP_WH, socFraction.entryWh()).putBoolean(KEY_STEP_DOWN, socFraction.fromAbove()).apply();
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "SOC step not saved: " + BydEnergyReader.describe(error));
        }
    }

    /**
     * The energy of one percent: the mean of the whole percents driven through in that SOC range
     * (above 90% the BMS holds more per percent), otherwise the reading's own average.
     */
    private static double whPerPercent(double soc, int currentWh) {
        BydSpeedBands.LevelStatus level = BydSpeedBands.levelStatus()[soc > BydSpeedBands.HIGH_SOC ? 0 : 1];
        return level.count >= MIN_LEVELS ? level.kwhPerPercent * 1000 : currentWh / (soc + BydSocFraction.MIDPOINT);
    }

    /** The outside temperature, or the file's own (23 °C) when the car does not report it. */
    private static int bydTemperature(BydVehicleEnergyFile file, int outsideC) {
        return outsideC != BydOutsideTemperature.UNAVAILABLE ? outsideC : Math.round(file.fileExternalTemp);
    }

    /** BYD's model for this reading; null after a failure, which also turns the file off for this process. */
    private static byte[] encodeBydModel(BydVehicleEnergyFile file, int currentWh, int capacityWh, int outsideC) {
        try {
            boolean dolphin = sendsDolphinPower(file);
            return file.encode(massKg(file), currentWh, capacityWh, bydTemperature(file, outsideC),
                    dolphin ? PEAK_MOTOR_POWER_W : 0, dolphin ? MAX_CHARGING_RATE_W : 0);
        } catch (Throwable error) {
            energyFile = null;
            ReportLog.w(TAG, "BYD energy model failed, using the fallback model: " + BydEnergyReader.describe(error));
            return null;
        }
    }

    /**
     * BYD's table with the values measured on this car ({@link BydCalibration#model}, frozen during a route); BYD's table
     * itself before the calibration is ready and when the adjusted model fails.
     */
    private static byte[] encodeModel(BydVehicleEnergyFile file, int currentWh, int capacityWh, int outsideC, Boolean acOn, long wall) {
        BydCalibration c = calibration;
        adjustedSent = false;
        if (c != null) {
            try {
                int temp = bydTemperature(file, outsideC);
                BydModelParts.Sent sent = c.model(true, massKg(file), temp, acOn, wall);
                if (!sent.isTable()) {
                    boolean dolphin = sendsDolphinPower(file);
                    byte[] bytes = file.encodeLearned(massKg(file), currentWh, capacityWh, temp, dolphin ? PEAK_MOTOR_POWER_W : 0,
                            dolphin ? MAX_CHARGING_RATE_W : 0, sent);
                    sentFactor = sent.rolling;
                    sentAuxW = sent.drainAtTime[1][0];
                    adjustedSent = true;
                    adjustedFailed = false;
                    return bytes;
                }
            } catch (Throwable error) {
                adjustedFailed = true;
                c.modelFailed(massKg(file), wall);
                if (!adjustedFailureLogged) {
                    adjustedFailureLogged = true;
                    ReportLog.w(TAG, "adjusted model failed, BYD's table sent: " + BydEnergyReader.describe(error));
                }
            }
        }
        return encodeBydModel(file, currentWh, capacityWh, outsideC);
    }

    // For the "energy model:" log line; the auxiliary power rounded so standing readings do not log every 10 s.
    private static String sentModelText() {
        return adjustedSent ? String.format(Locale.ROOT, ";model=adjusted;factor=%.3f;aux_w=%d", sentFactor, sentAuxW / 50 * 50)
                : ";model=table";
    }

    // Worker thread only. Feeds the calibration (built once the table is loaded) and saves it; a failure never touches the reading.
    private static void observeCalibration(BydVehicleEnergyFile file, BydEnergyReader.Sample sample, int currentWh, int outsideC,
                                           String signalText, Boolean acOn) {
        try {
            BydCalibration c = calibration;
            if (c != null && calibrationFile != file) {
                // Another table (chosen again once a capacity was measured): the factor is relative to its traction.
                saveCalibration(c);
                calibration = null;
                calibrationTried = false;
                c = null;
            }
            if (c == null) {
                if (!calibrationTried) {
                    calibrationTried = true;
                    BydCalibration loaded = loadCalibration(file);
                    // A saved one starts now, so this reading's model, the first Maps reads, is the adjusted one: Maps
                    // uploads the model for phone Maps 5 seconds after it starts, then every 2 hours. One that needs the
                    // drive records replayed starts after this reading, so the first model goes to Maps before the replay.
                    if (loaded != null && loaded.seeded()) startCalibration(file, loaded);
                    else if (loaded != null) worker.post(() -> startCalibration(file, loaded));
                }
                return;
            }
            BydCalibration.Reading r = new BydCalibration.Reading();
            r.wall = sample.wall;
            r.elapsed = sample.elapsed;
            r.energyWh = currentWh;
            r.soc = sample.soc;
            r.mileage01km = sample.mileage;
            r.speedKmh = sample.speedKmh;
            r.outsideC = outsideC != BydOutsideTemperature.UNAVAILABLE ? outsideC : BydCalibration.UNKNOWN;
            r.currentRaw = signalInt(signalText, "current");
            r.vmaxMv = signalInt(signalText, "vmax");
            r.vminMv = signalInt(signalText, "vmin");
            r.acOn = acOn;
            r.massKg = massKg(file);
            c.setSpeedRatio(BydSpeedBands.speedRatio());
            c.observe(r);
            boolean routeEnded = false;
            for (String note : c.drainNotes()) {
                ReportLog.i(TAG, note);
                if (note.startsWith("calib_route") || note.startsWith("calib_reset")) routeEnded = true;
            }
            if (c.takeChanged()) calibrationDirty = true;
            if (calibrationDirty && (routeEnded || SystemClock.elapsedRealtime() - calibrationSavedAt >= CALIBRATION_SAVE_MS)) {
                saveCalibration(c);
            }
        } catch (Throwable error) {
            if (!calibrationFailureLogged) {
                calibrationFailureLogged = true;
                ReportLog.w(TAG, "calibration failed: " + BydEnergyReader.describe(error));
            }
        }
    }

    // Worker thread only. The saved calibration (a new one when none is saved or it does not load), with the stored trip
    // log's ratio; null when it cannot be built.
    private static BydCalibration loadCalibration(BydVehicleEnergyFile file) {
        try {
            BydVehicleEnergyFile.Predictor predictor = file.predictor();
            BydModelParts.Params prior = BydModelParts.Params.table(predictor);
            File stored = new File(context.getFilesDir(), CALIBRATION_FILE);
            BydCalibration loaded = BydCalibration.load(stored.isFile() ? readText(stored) : null, prior, predictor.identity());
            loaded.setTripLogRatio(restoreTripLog(file));
            return loaded;
        } catch (Throwable error) {
            ReportLog.w(TAG, "calibration not started: " + BydEnergyReader.describe(error));
            return null;
        }
    }

    // Worker thread only. Uses the loaded calibration, first replaying the drive records already on the car into it when
    // it has not been seeded.
    private static void startCalibration(BydVehicleEnergyFile file, BydCalibration created) {
        try {
            if (!created.seeded()) seedCalibration(created);
            if (calibrationResetPending) {
                calibrationResetPending = false;
                created.reset();
            }
            for (String note : created.drainNotes()) ReportLog.i(TAG, note);
            // As each reading sets it before the calibration observes it, so a model built before the next reading has it too.
            created.setSpeedRatio(BydSpeedBands.speedRatio());
            calibrationFile = file;
            calibration = created;
            saveCalibration(created);
            ReportLog.i(TAG, "calibration: " + created.status().describe);
        } catch (Throwable error) {
            ReportLog.w(TAG, "calibration not started: " + BydEnergyReader.describe(error));
        }
    }

    // The newest drive-record files, oldest first, line by line (only S and F lines matter).
    private static void seedCalibration(BydCalibration created) throws IOException {
        File[] files = new File(context.getFilesDir(), BydDriveLog.DIR).listFiles((dir, name) -> name.startsWith("records-")
                && name.endsWith(".csv"));
        if (files != null) {
            Arrays.sort(files, (a, b) -> a.getName().compareTo(b.getName()));
            for (int i = Math.max(0, files.length - SEED_FILES); i < files.length; i++) {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(files[i]), StandardCharsets.UTF_8))) {
                    for (String line; (line = in.readLine()) != null; ) {
                        if (line.startsWith("S,") || line.startsWith("F,")) created.seedLine(line);
                    }
                }
            }
        }
        created.finishSeed();
    }

    // Worker thread only. Written to a temporary file and renamed over the old one.
    private static void saveCalibration(BydCalibration c) {
        calibrationSavedAt = SystemClock.elapsedRealtime();
        calibrationDirty = false;
        File target = new File(context.getFilesDir(), CALIBRATION_FILE), temp = new File(context.getFilesDir(), CALIBRATION_FILE + ".tmp");
        try {
            try (FileOutputStream out = new FileOutputStream(temp)) {
                out.write(c.save().getBytes(StandardCharsets.UTF_8));
                out.flush();
                out.getFD().sync();
            }
            if (!temp.renameTo(target)) throw new IOException("rename failed");
        } catch (Throwable error) {
            if (!calibrationSaveFailureLogged) {
                calibrationSaveFailureLogged = true;
                ReportLog.w(TAG, "calibration not saved: " + BydEnergyReader.describe(error));
            }
        }
    }

    private static String readText(File file) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            for (int n; (n = in.read(buffer)) > 0; ) out.write(buffer, 0, n);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    // Worker thread only. BydSignalProbe's key=value list for this reading, "" without the probe; never throws.
    private static String readSignals() {
        BydSignalProbe probe = signals;
        if (probe == null) return "";
        try {
            String text = probe.read();
            return text == null ? "" : text;
        } catch (Throwable error) {
            return "";
        }
    }

    /** One value of BydSignalProbe's "key=value|key=value" text; null when missing. */
    private static String signalValue(String text, String key) {
        if (text == null || text.isEmpty()) return null;
        int from = 0;
        while (from <= text.length()) {
            int end = text.indexOf('|', from);
            if (end < 0) end = text.length();
            if (end - from > key.length() && text.startsWith(key, from) && text.charAt(from + key.length()) == '=') {
                return text.substring(from + key.length() + 1, end);
            }
            from = end + 1;
        }
        return null;
    }

    /** A signal as an int, BydCalibration.UNKNOWN when missing or not a number ("unavailable"). */
    private static int signalInt(String text, String key) {
        String value = signalValue(text, key);
        return value == null ? BydCalibration.UNKNOWN : BydCalibration.integer(value);
    }

    /**
     * The fallback model in Maps' OEM energy-model proto: 1 vehicle info {2 mass,
     * 3 battery level, 4 capacity: {1 mean}; 9 peak motor power, 10 maximum charging rate}, 2 road load
     * {1 rolling N, 2 linear N/(m/s), 3 drag N/(m/s)^2: {1 float}}.
     */
    static byte[] encodeEnergyModel(int currentWh, int capacityWh, BydVehicleModel.Model model) {
        ByteArrayOutputStream battery = new ByteArrayOutputStream();
        writeMessage(battery, 2, energy(DEMO_MASS_KG));
        writeMessage(battery, 3, energy(currentWh));
        writeMessage(battery, 4, energy(capacityWh));
        writeVarintField(battery, 9, DEMO_PEAK_MOTOR_POWER_W);
        writeVarintField(battery, 10, DEMO_MAX_CHARGING_RATE_W);
        ByteArrayOutputStream roadLoad = new ByteArrayOutputStream();
        writeMessage(roadLoad, 1, force(model.a));
        writeMessage(roadLoad, 2, force(model.b));
        writeMessage(roadLoad, 3, force(model.c));
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        writeMessage(out, 1, battery.toByteArray());
        writeMessage(out, 2, roadLoad.toByteArray());
        return out.toByteArray();
    }

    private static byte[] energy(int wattHours) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        writeVarintField(out, 1, wattHours);
        return out.toByteArray();
    }

    private static byte[] force(float value) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        writeVarint(out, 1 << 3 | FIXED32);
        int bits = Float.floatToIntBits(value);
        for (int shift = 0; shift < 32; shift += 8) out.write(bits >>> shift);
        return out.toByteArray();
    }

    private static void writeMessage(ByteArrayOutputStream out, int field, byte[] message) {
        writeVarint(out, field << 3 | LENGTH_DELIMITED);
        writeVarint(out, message.length);
        out.write(message, 0, message.length);
    }

    private static void writeVarintField(ByteArrayOutputStream out, int field, int value) {
        writeVarint(out, field << 3 | VARINT);
        writeVarint(out, value);
    }

    private static void writeVarint(ByteArrayOutputStream out, int value) {
        while ((value & ~0x7F) != 0) {
            out.write(value & 0x7F | 0x80);
            value >>>= 7;
        }
        out.write(value);
    }

    // BYD's trip log (BydTripLog): read by itself at Maps' start (poll), or from the dialog's card on the owner's tap.

    // Worker thread: the automatic read through the car's ADB, TRIP_LOG_ADB_DELAY_MS after the table was chosen at
    // Maps' start; not when BYD battery went off meanwhile or a read already gave a summary.
    private static void quietTripLog() {
        if (tripLogReading || !active || energyFile == null || !tripLogDue()) {
            tripLogAuto = false;
            return;
        }
        readTripLog(BydTripLogReader.ADB_QUIET);
    }

    // Worker thread only. No summary priced against this table (restoreTripLog), or the last one is older than
    // TRIP_LOG_EVERY_MS.
    private static boolean tripLogDue() {
        BydTripLog.Summary s = tripLog;
        long at = tripLogAt, now = System.currentTimeMillis();
        return s == null || at <= 0 || at > now || now - at >= TRIP_LOG_EVERY_MS;
    }

    /** The card: no summary yet, the automatic attempt over, and no "Not now". */
    private static boolean tripLogCardWanted(Context context) {
        if (!active || energyFile == null || tripLog != null || !tripLogTried || tripLogAuto) return false;
        try {
            return !context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean(KEY_TRIP_LOG_DISMISSED, false);
        } catch (RuntimeException error) {
            return false;
        }
    }

    private static void dismissTripLogCard(Context context) {
        context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putBoolean(KEY_TRIP_LOG_DISMISSED, true).apply();
        ReportLog.i(TAG, "BYD trip log card: not now");
    }

    /** From the card's Allow: the storage permission first where it works (DiLink 3), else the car's ADB. Main thread. */
    private static void requestTripLog(Activity activity) {
        if (tripLogReading || !active) return;
        boolean storage = BydTripLogReader.storageRoute();
        if (storage && !BydTripLogReader.permitted(activity) && !tripLogPermissionAsked) {
            // Android's own dialog; the battery dialog reads the log once the answer is Allow.
            tripLogPermissionAsked = true;
            try {
                BydTripLogReader.requestPermission(activity);
                return;
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "storage permission not requested", error);
            }
        }
        // A file that could not be read (or no storage route): the car's ADB.
        readTripLog(storage && BydTripLogReader.permitted(activity) && !tripLogFileFailed ? BydTripLogReader.FILE
                : BydTripLogReader.ADB_ASK);
    }

    // The file on the worker; the car's ADB on a background thread (asking, it may wait up to a minute for Allow), then
    // the worker.
    private static void readTripLog(int route) {
        tripLogReading = true;
        tripLogTried = true;
        boolean adb = route != BydTripLogReader.FILE;
        Runnable read = () -> {
            List<BydTripLog.Trip> trips = null;
            String error = null;
            try {
                trips = BydTripLogReader.read(context, route);
            } catch (Throwable failure) {
                error = BydEnergyReader.describe(failure);
            }
            List<BydTripLog.Trip> result = trips;
            String failure = error;
            if (!postToWorker(() -> tripLogDone(result, failure, route), 0)) tripLogReading = false;
        };
        if (adb) Utils.runOnBackgroundThread(read);
        else if (!postToWorker(read, 0)) tripLogReading = false;
    }

    // Worker thread only. Prices the trips against the table Maps gets, keeps the summary and gives the calibration its ratio.
    private static void tripLogDone(List<BydTripLog.Trip> trips, String error, int route) {
        try {
            tripLogDoneLocked(trips, error, route);
        } finally {
            // Last, so the dialog never sees the read over without its result.
            tripLogAuto = false;
            tripLogReading = false;
        }
    }

    private static void tripLogDoneLocked(List<BydTripLog.Trip> trips, String error, int route) {
        String source = BydTripLogReader.ROUTES[route];
        if (trips == null) {
            // The last good summary keeps its own time and source. A quiet attempt that could not read is no error to
            // show: the card asks instead (and the next start tries again).
            if (route == BydTripLogReader.ADB_QUIET) tripLogQuiet = error;
            else tripLogError = error;
            if (route == BydTripLogReader.FILE) tripLogFileFailed = true;
            ReportLog.i(TAG, "BYD trip log not read (" + source + "): " + error);
            return;
        }
        long now = System.currentTimeMillis();
        try {
            BydVehicleEnergyFile file = energyFile;
            BydTripLog.Summary summary = BydTripLog.summarize(trips, file != null ? file.predictor() : null,
                    file != null ? massKg(file) : 0, file != null ? bydTemperature(file, sampleOutsideC) : 0, sampleEnergyWh,
                    sampleCapacityWh, now);
            if (summary.clockBehind()) {
                // Every trip later than now: the head unit's clock is behind (before its time is set). The last good summary
                // and the factor's centre stay; the next start reads again.
                String behind = "the head unit's clock is behind (" + summary.future + " trips dated after today)";
                if (route == BydTripLogReader.ADB_QUIET) tripLogQuiet = behind;
                else tripLogError = behind;
                ReportLog.i(TAG, "BYD trip log not used (" + source + "): " + behind);
                return;
            }
            tripLogAt = now;
            tripLogSource = source;
            tripLog = summary;
            tripLogError = null;
            ReportLog.i(TAG, "BYD trip log (" + tripLogSource + "): " + summary.describe() + (file != null ? ";table=" + file.name : ""));
            BydCalibration c = calibration;
            if (c != null && file != null && calibrationFile == file) c.setTripLogRatio(summary.ratio);
            if (file != null) {
                JSONObject stored = new JSONObject().put("table", file.name).put("source", tripLogSource).put("at", tripLogAt)
                        .put("trips", summary.trips).put("km", summary.km).put("kwh", summary.kwh).put("used", summary.used)
                        .put("used_km", summary.usedKm).put("used_kwh", summary.usedKwh).put("table_kwh", summary.tableKwh)
                        .put("newest", summary.newestMs);
                if (!Double.isNaN(summary.ratio)) stored.put("ratio", summary.ratio);
                context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putString(KEY_TRIP_LOG, stored.toString()).apply();
                checkMismatch(summary.ratio, true);
            }
        } catch (Throwable failure) {
            tripLogError = BydEnergyReader.describe(failure);
            ReportLog.w(TAG, "BYD trip log not used: " + tripLogError);
        }
    }

    // Worker thread only. The stored summary when it was priced against [file]'s table: shown in the dialog, its ratio returned.
    private static double restoreTripLog(BydVehicleEnergyFile file) {
        try {
            String text = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getString(KEY_TRIP_LOG, null);
            if (text == null) return Double.NaN;
            JSONObject stored = new JSONObject(text);
            if (!file.name.equals(stored.optString("table"))) return Double.NaN;
            BydTripLog.Summary summary = new BydTripLog.Summary();
            summary.trips = stored.optInt("trips");
            summary.km = stored.optDouble("km", 0);
            summary.kwh = stored.optDouble("kwh", 0);
            summary.used = stored.optInt("used");
            summary.usedKm = stored.optDouble("used_km", 0);
            summary.usedKwh = stored.optDouble("used_kwh", 0);
            summary.tableKwh = stored.optDouble("table_kwh", 0);
            summary.newestMs = stored.optLong("newest");
            summary.ratio = stored.optDouble("ratio", Double.NaN);
            if (tripLog == null) {
                tripLog = summary;
                tripLogAt = stored.optLong("at");
                tripLogSource = stored.optString("source", "file");
            }
            return summary.ratio;
        } catch (Throwable error) {
            ReportLog.w(TAG, "stored BYD trip log not read: " + BydEnergyReader.describe(error));
            return Double.NaN;
        }
    }

    // Worker thread only. Models outside DEFAULT_ON_MODEL_IDS: a ratio (the speed bands', else the trip log's) further from
    // BYD's table than the learning covers keeps the default off from the next start; a ratio within keeps it on.
    private static void checkMismatch(double ratio, boolean tripLogRatio) {
        if (Double.isNaN(ratio) || defaultOnModel(modelId(context))) return;
        // The speed bands decide once they have MISMATCH_POOLS pools; the trip log only before.
        boolean bands = BydSpeedBands.speedPools() >= MISMATCH_POOLS;
        if (tripLogRatio ? bands : !bands) return;
        boolean far = tripLogRatio ? ratio < MISMATCH_LOG_LOW || ratio > MISMATCH_LOG_HIGH
                : ratio < MISMATCH_BANDS_LOW || ratio > MISMATCH_BANDS_HIGH;
        SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        if (preferences.getBoolean(KEY_MISMATCH, false) == far) return;
        String text = String.format(Locale.ROOT, "%s ×%.2f", tripLogRatio ? "trip_log" : "speed_bands", ratio);
        preferences.edit().putBoolean(KEY_MISMATCH, far).putString(KEY_MISMATCH_TEXT, text).apply();
        ReportLog.i(TAG, "model check: " + text + (far ? ", far from BYD's table: off by default from the next start"
                : ", within what the learning covers: on by default"));
    }

    // Worker thread only. A hybrid-size battery (MIN_BEV_WH): Maps gets no model while the readings say so (withdrawn if it
    // had one); HYBRID_READINGS in a row store the verdict, which keeps the default off from the next start.
    private static void hybridBattery(int capacityWh) {
        if (++smallReadings == HYBRID_READINGS) {
            String text = String.format(Locale.ROOT, "battery_kwh %.1f", capacityWh / 1000.0);
            context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putBoolean(KEY_MISMATCH, true)
                    .putString(KEY_MISMATCH_TEXT, text).apply();
            ReportLog.i(TAG, "model check: " + text + ", a plug-in hybrid's size in " + HYBRID_READINGS
                    + " readings: not sent to Maps, off by default from the next start");
        }
        smallBatteryWh = capacityWh;
        BydDisplayCurve.clear();
        if (energyModel != null) {
            energyModel = null;
            adjustedSent = false;
            notifyModelChanged();
        }
    }

    // Worker thread only. A reading published after hybrid-size ones: the dialog's hybrid notice goes. A full-size one
    // ([capacityWh] above 0: SOC 10% or more, at least MIN_BEV_WH) shows those were not this car's battery: the count starts
    // again and a verdict they stored in this process is withdrawn. 0: published for another reason (the owner's choice,
    // SOC below 10%), the count stays.
    private static void fullSizeBattery(int capacityWh) {
        smallBatteryWh = 0;
        if (capacityWh <= 0) return;
        boolean stored = smallReadings >= HYBRID_READINGS;
        smallReadings = 0;
        String text = String.format(Locale.ROOT, "full_size_kwh %.1f", capacityWh / 1000.0);
        if (stored && mismatchText(context).startsWith("battery_kwh ")) {
            context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putBoolean(KEY_MISMATCH, false)
                    .putString(KEY_MISMATCH_TEXT, text).apply();
        }
        ReportLog.i(TAG, "model check: " + text + " after hybrid-size readings" + (stored ? ", verdict withdrawn" : ""));
    }

    /** The owner turned BYD battery on or off in the dialog (the stored choice wins over every default). */
    private static boolean userChose(Context context) {
        try {
            return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).contains(KEY_ENABLED);
        } catch (RuntimeException error) {
            return false;
        }
    }

    /**
     * The stored verdict (see {@link #checkMismatch}) as this process read it first: it decides the default at the start
     * and keeps deciding it until the next start, so a verdict found while running turns nothing off mid-drive.
     */
    private static boolean mismatch(Context context) {
        Boolean value = startMismatch;
        if (value != null) return value;
        try {
            value = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean(KEY_MISMATCH, false);
        } catch (RuntimeException error) {
            value = false;
        }
        startMismatch = value;
        return value;
    }

    // The dialog's line: the summary, the read in progress, why it failed, or how to read it.
    private static String tripLogText(boolean thai) {
        if (tripLogReading) return thai ? "กำลังอ่าน…" : "Reading…";
        BydTripLog.Summary s = tripLog;
        String error = tripLogError;
        StringBuilder text = new StringBuilder();
        if (s != null && s.km > 0) {
            text.append(String.format(Locale.ROOT, thai ? "%.1f" + NBSP + "kWh/100" + NBSP + "km จาก %d ทริป %.0f" + NBSP + "กม. ใน 120 วัน"
                    : "%.1f" + NBSP + "kWh/100" + NBSP + "km over %d trips, %.0f" + NBSP + "km in 120 days", s.consumption(), s.trips, s.km));
            if (!Double.isNaN(s.ratio)) {
                text.append(String.format(Locale.ROOT, thai ? "\nทริปเฉลี่ย 20" + NBSP + "กม./ชม. ขึ้นไป ใช้ไฟ ×%.2f ของตาราง BYD"
                        : "\nTrips averaging 20" + NBSP + "km/h or more used ×%.2f of BYD's table", s.ratio));
            }
        } else if (s != null) {
            text.append(thai ? "ไม่มีทริปใน 120 วัน" : "No trips in 120 days");
        }
        if (error != null) {
            if (text.length() > 0) text.append('\n');
            text.append(thai ? "อ่านไม่ได้: " : "Not read: ").append(error);
        }
        if (text.length() > 0) return text.toString();
        return thai ? "ยังไม่ได้อ่าน" : "Not read yet";
    }

    // The card's text: what Allow does on this car, or why the last tap did not read it.
    private static String tripLogCardText(boolean thai) {
        if (tripLogReading) return thai ? "กำลังอ่านบันทึกทริปของรถ…" : "Reading the car's trip log…";
        StringBuilder text = new StringBuilder(thai ? "ให้ Maps อ่านบันทึกทริปของรถ เพื่อให้แบตแม่นตั้งแต่วันแรก"
                : "Let Maps read the car's trip log, so the battery is accurate from day one.");
        boolean storage = BydTripLogReader.storageRoute() && !BydTripLogReader.permitted(context) && !tripLogPermissionAsked;
        if (!storage) {
            text.append(thai ? " Maps อ่านผ่าน ADB ของรถ ถ้า Android ถามเรื่องการแก้ไขข้อบกพร่องผ่าน USB ให้กด อนุญาต"
                    : " Maps reads it through the car's ADB. If Android asks \"Allow USB debugging?\", tap Allow.");
        }
        String error = tripLogError;
        if (error != null) text.append(thai ? "\nอ่านไม่ได้: " : "\nNot read: ").append(error);
        return text.toString();
    }

    /** The battery's share above 90% (91 to 100%), for the km per 1% of the whole battery. */
    private static final double HIGH_SHARE = (100 - BydSpeedBands.HIGH_SOC) / 100.0;

    /**
     * The dialog's km per 1%, one value for the whole battery, so it no longer changes when the battery passes 90% (Details
     * keeps the two ranges): each range weighted by its share of the battery, 10% above 90% and
     * 90% below, so where the owner drove (a charge to 100%) does not pull it up. A range's value: its whole percents once
     * {@link #MIN_KM_LEVELS}; else its energy per percent (its percents once {@link #MIN_LEVELS}; below 90% else the
     * reading's own average) over the speed bands' measured consumption, or the learned one after {@link #MIN_KM_WINDOWS}
     * windows. Without a value for 90% and below: NaN (learning); without one above 90%: the value below alone. The
     * learner's starting value alone gave 4.5 where one car did 3.2.
     */
    static double kmPerPercent(double soc, int energyWh, BydVehicleModel.Status model) {
        BydSpeedBands.LevelStatus[] levels = BydSpeedBands.levelStatus();
        double consumption = BydSpeedBands.speedConsumption();
        if (!(consumption > 0) && model.windows >= MIN_KM_WINDOWS) consumption = model.consumption;
        double below = rangeKm(levels[1], consumption, energyWh / (soc + BydSocFraction.MIDPOINT));
        if (Double.isNaN(below)) return Double.NaN;
        double above = rangeKm(levels[0], consumption, Double.NaN);
        return Double.isNaN(above) ? below : HIGH_SHARE * above + (1 - HIGH_SHARE) * below;
    }

    // One range's km per 1%: measured, else its energy per percent ([fallbackWh] with too few percents) over
    // [consumption] (kWh/100 km); NaN without either.
    private static double rangeKm(BydSpeedBands.LevelStatus level, double consumption, double fallbackWh) {
        if (level.count >= MIN_KM_LEVELS && level.kmPerPercent > 0) return level.kmPerPercent;
        double wh = level.count >= MIN_LEVELS ? level.kwhPerPercent * 1000 : fallbackWh;
        return consumption > 0 && wh > 0 ? wh / (consumption * 10) : Double.NaN;
    }

    /** The whole battery's kWh per 1% for Details, weighted as {@link #kmPerPercent}; NaN before 3 percents at 90% and below. */
    static double kwhPerPercent() {
        BydSpeedBands.LevelStatus[] levels = BydSpeedBands.levelStatus();
        if (levels[1].count < MIN_LEVELS) return Double.NaN;
        if (levels[0].count < MIN_LEVELS) return levels[1].kwhPerPercent;
        return HIGH_SHARE * levels[0].kwhPerPercent + (1 - HIGH_SHARE) * levels[1].kwhPerPercent;
    }

    // Settings row. The patch adds it to Maps' Settings list, before About & help.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "แบตเตอรี่ BYD" : "BYD battery";
    }

    /** Injection point: the row subtitle, the current state. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        if (!SafeMode.on(context, SafeMode.BYD_BATTERY)) {
            return (thai ? "ปิดชั่วคราว (เปิดคืนใน " : "Off for now (back on in ") + ReportPatch.reportPlace(context, thai) + ")";
        }
        if (!isEnabled(context)) {
            if (untestedByd(context) && mismatch(context)) return thai ? "ปิด · ข้อมูลรถไม่เข้ากัน" : "Off · car data does not fit";
            if (untestedByd(context)) return thai ? "ปิด · ยังไม่ได้ทดสอบรุ่นนี้" : "Off · model not tested";
            return thai ? "ปิด" : "Off";
        }
        if (!active) return thai ? "เปิด · ไม่พบระบบรถ BYD" : "On · no BYD system found";
        if (smallBatteryWh > 0) return thai ? "เปิด · แบตขนาดไฮบริด ไม่ส่งให้ Maps" : "On · hybrid-size battery, not sent to Maps";
        double soc = lastSoc;
        if (Double.isNaN(soc)) return thai ? "เปิด · รอแบตเตอรี่" : "On · waiting for the battery";
        // With BYD's table the load preset, which the user changes before a trip.
        if (energyFile != null) {
            return String.format(Locale.ROOT, thai ? "เปิด · %.0f%% · %s" : "On · %.0f%% · %s", soc,
                    loadName(loadKg, thai).toLowerCase(Locale.ROOT));
        }
        BydVehicleModel.Status status = BydVehicleModel.status();
        return String.format(Locale.ROOT, "%s · %.0f%% · %.1f kWh/100 km", thai ? "เปิด" : "On", soc, status.consumption);
    }

    /**
     * Injection point: the row's click action. The container view of the Settings screen, if the
     * patch found one, gives the activity when the given context is not one.
     */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> showDialog(context, container);
    }

    // The dialog: an on/off switch, the battery, the choices made before a trip (the load presets, the battery on
    // arrival), the battery on the phone and the last guided drive; then, on request, the details: the earlier drives, the model Maps gets, the
    // consumption measured against BYD's table per speed band, and the car's values. It is built once and refreshed in
    // place while open.
    private static void showDialog(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the BYD battery dialog: " + context);
            return;
        }
        Activity host = activity;
        M3.Builder builder = new M3.Builder(host).setTitle(getSettingsTitle(host));
        // The builder's context and colors (Maps' night or day), so the views match the dialog.
        BatteryDialog views = new BatteryDialog(host, builder.getContext(), builder.colors());
        builder.setView(views.root).setPositiveButton(views.thai ? "ปิดหน้าต่าง" : "Close", null);
        M3.Dialog dialog = builder.create();
        Handler main = new Handler(Looper.getMainLooper());
        Runnable refresh = new Runnable() {
            @Override
            public void run() {
                if (!dialog.isShowing()) return;
                views.update();
                main.postDelayed(this, DIALOG_REFRESH_MS);
            }
        };
        dialog.setOnShowListener(shown -> main.postDelayed(refresh, DIALOG_REFRESH_MS));
        dialog.setOnDismissListener(dismissed -> main.removeCallbacks(refresh));
        dialog.show();
    }

    /**
     * The dialog's views, in Material 3 (M3): Maps' night or day colors; sizes are for a head unit at arm's
     * length. [primary] and [secondary] are the text colors, [accent] the scheme's primary.
     */
    private static final class BatteryDialog {
        private static final float NAME_WEIGHT = 1.4f;
        final boolean thai;
        final ScrollView root;
        private final Activity host;
        private final Context themed;
        private final M3.Colors colors;
        private final int primary, secondary, accent;
        private final LinearLayout content, battery, tripLogCard, load, arrival, phone, phoneDetails, lastSection, guidedSection, modelSection,
                tripLogSection, usage, carSection, bandTable, levelTable;
        private final M3.Switch toggle, phoneToggle;
        private final M3.LevelBar levelBar;
        private final View tripLogButtons;
        private final View batteryDivider, detailsDivider;
        private final TextView status, intro, percent, energy, batteryNote, healthNote, fallbackUsage, modelNotice, loadCaption,
                arrivalCaption, phoneStatus, phoneCaption, lastText, guidedText, guidedCaption, modelCaption, tripLogCaption, tripLogCardText,
                usageHeader, usageCaption, detailsToggle, details;
        // The last export's result, shown under the guided drives until the dialog closes.
        private String exportStatus;
        private final TextView[] chips = new TextView[LOADS_KG.length];
        private final TextView[] chargingStopChips = new TextView[ArrivalBattery.CHARGING_STOP_CHOICES.length];
        private final TextView[] destinationChips = new TextView[ArrivalBattery.DESTINATION_CHOICES.length];
        private int paintedChargingStop = -1, paintedDestination = -1;
        // The average over all speeds, then city, mixed, highway and above 90% SOC.
        private final Row[] rows = new Row[5];
        // Per 1% of SOC: above 90%, 90% and below, then the whole battery (the main view's km per 1%).
        private final Row[] levelRows = new Row[3];
        private int paintedLoad = -1;
        private boolean detailsOpen;

        private static final class Row {
            TextView sub, measured, table, difference, pending;
        }

        BatteryDialog(Activity host, Context themed, M3.Colors colors) {
            this.host = host;
            this.themed = themed;
            this.colors = colors;
            thai = UiDensityPatch.isThai(host);
            primary = colors.onSurface;
            secondary = colors.onSurfaceVariant;
            accent = colors.primary;

            content = vertical();
            content.setPadding(0, px(4), 0, px(8));
            root = new ScrollView(themed);
            root.addView(content);

            // On/off. The whole row is the touch target; the switch shows the stored choice, which
            // changes only after the restart is confirmed.
            LinearLayout switchRow = horizontal();
            switchRow.setMinimumHeight(px(64));
            switchRow.setPadding(px(24), px(8), px(16), px(8));
            selectable(switchRow);
            LinearLayout switchText = vertical();
            TextView switchTitle = text(18, primary, false);
            switchTitle.setText(thai ? "ใช้แบตเตอรี่รถใน Maps" : "Use the car's battery in Maps");
            status = text(14, secondary, false);
            switchText.addView(switchTitle);
            switchText.addView(status);
            switchRow.addView(switchText, weight(1));
            toggle = new M3.Switch(themed, colors);
            toggle.setClickable(false);
            toggle.setFocusable(false);
            toggle.setChecked(isEnabled(host));
            switchRow.addView(toggle, wrap());
            switchRow.setOnClickListener(view -> confirmRestart(host, !isEnabled(host)));
            content.addView(switchRow);

            // Off, or no BYD system: what the switch does.
            intro = text(15, secondary, false);
            intro.setLineSpacing(0, 1.2f);
            intro.setPadding(px(24), px(4), px(24), px(8));
            content.addView(intro);

            // Space above the battery card (shown with it).
            batteryDivider = new View(themed);
            content.addView(batteryDivider, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, px(4)));

            // The battery in a card: the percentage large with the energy beside it (on one baseline), the level bar, then
            // the distance per 1% and the outside temperature, and the battery's health when the car reports it.
            battery = vertical();
            M3.card(battery, colors);
            battery.setPadding(px(20), px(16), px(20), px(16));
            LinearLayout batteryTop = horizontal();
            batteryTop.setGravity(Gravity.TOP);
            percent = text(44, primary, true);
            percent.setIncludeFontPadding(false);
            batteryTop.addView(percent, wrap());
            energy = text(17, primary, false);
            energy.setPadding(px(12), 0, 0, 0);
            batteryTop.addView(energy, weight(1));
            battery.addView(batteryTop);
            levelBar = new M3.LevelBar(themed, colors);
            LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT);
            barParams.setMargins(0, px(14), 0, px(10));
            battery.addView(levelBar, barParams);
            batteryNote = text(14, secondary, false);
            battery.addView(batteryNote);
            healthNote = text(14, secondary, false);
            battery.addView(healthNote);
            content.addView(battery, cardParams(8));
            // BYD's trip log, once: only when Maps could not read it by itself (tripLogCardWanted).
            tripLogCard = vertical();
            M3.card(tripLogCard, colors);
            tripLogCard.setPadding(px(20), px(16), px(20), px(16));
            tripLogCardText = text(15, primary, false);
            tripLogCardText.setLineSpacing(0, 1.2f);
            tripLogCard.addView(tripLogCardText);
            LinearLayout cardButtons = horizontal();
            cardButtons.setGravity(Gravity.END);
            cardButtons.setPadding(0, px(12), 0, 0);
            Button notNow = M3.button(themed, colors, thai ? "ไม่ต้อง" : "Not now", M3.GRAY);
            notNow.setOnClickListener(view -> {
                dismissTripLogCard(host);
                update();
            });
            cardButtons.addView(notNow, wrap());
            Button allow = M3.button(themed, colors, thai ? "อนุญาต" : "Allow", M3.FILLED);
            allow.setOnClickListener(view -> {
                requestTripLog(host);
                update();
            });
            cardButtons.addView(allow, after());
            tripLogCard.addView(cardButtons);
            tripLogButtons = cardButtons;
            content.addView(tripLogCard, cardParams(12));

            // Without BYD's table: the consumption Maps plans with, which is the whole model there.
            fallbackUsage = text(15, primary, false);
            fallbackUsage.setPadding(px(24), px(8), px(24), 0);
            content.addView(fallbackUsage);
            // The model, only while Maps does not get the adjusted one; its values are in the details.
            modelNotice = text(14, secondary, false);
            modelNotice.setLineSpacing(0, 1.2f);
            modelNotice.setPadding(px(24), px(8), px(24), 0);
            content.addView(modelNotice);

            // People and luggage, one tap per preset; Maps gets the mass with the next reading.
            load = section(thai ? "ผู้โดยสารและสัมภาระ" : "People and luggage");
            // A segmented button: the segments share their borders (each after the first overlaps the one before by the
            // stroke) and take the height of the tallest label.
            LinearLayout chipRow = horizontal();
            for (int i = 0; i < LOADS_KG.length; i++) {
                int preset = LOADS_KG[i];
                TextView chip = text(15, primary, false);
                chip.setGravity(Gravity.CENTER);
                chip.setMinHeight(px(48));
                chip.setPadding(px(8), px(4), px(8), px(4));
                chip.setText(chipName(preset, thai));
                chip.setOnClickListener(view -> selectLoad(preset));
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.MATCH_PARENT, 1);
                // The stroke's own width (M3.segment rounds; px() here truncates).
                params.setMargins(i == 0 ? 0 : -Math.max(1, M3.px(themed, 1)), px(4), 0, px(4));
                chipRow.addView(chip, params);
                chips[i] = chip;
            }
            load.addView(chipRow);
            loadCaption = text(14, secondary, false);
            load.addView(loadCaption);

            // Battery on arrival: the levels Maps plans its charging stops for, one tap per choice.
            arrival = section(thai ? "แบตเมื่อไปถึง" : "Battery on arrival");
            arrivalChips(ArrivalBattery.CHARGING_STOP, chargingStopChips, thai ? "ที่จุดชาร์จ อย่างน้อย" : "At charging stops, at least");
            arrivalChips(ArrivalBattery.DESTINATION, destinationChips, thai ? "ที่ปลายทาง อย่างน้อย" : "At the destination, at least");
            arrivalCaption = text(14, secondary, false);
            arrival.addView(arrivalCaption);

            // Battery on the phone (PhoneBattery), one switch, on by default: Maps' uploads to the Google account carry the
            // battery percentage and the car's energy model while it is on. A change applies at Maps' next upload of each.
            phone = section(thai ? "แบตบนมือถือ" : "Battery on the phone");
            phoneStatus = text(14, secondary, false);
            phoneStatus.setLineSpacing(0, 1.2f);
            phoneToggle = new M3.Switch(themed, colors);
            phoneToggle.setChecked(PhoneBattery.isOn(host));
            phone.addView(phoneSwitch(thai ? "แสดงแบตใน Google Maps บนมือถือ" : "Show the battery in Google Maps on the phone",
                    phoneStatus, phoneToggle, () -> PhoneBattery.choose(host, !PhoneBattery.isOn(host))));
            phoneCaption = text(14, secondary, false);
            phoneCaption.setLineSpacing(0, 1.2f);
            phoneCaption.setText(thai
                    ? "ขณะแอปทำงาน Maps ส่ง % แบตเข้าบัญชี Google ทุก 2 นาทีและทุกครั้งที่ % ลดลง และส่งโมเดลพลังงานของรถตอนเปิดแอปและทุก 2 ชั่วโมง"
                    + " ไม่ส่งขณะจอรถดับ โมเดลมีความจุ น้ำหนัก กำลังสูงสุด อัตราสิ้นเปลือง และกราฟการชาร์จ"
                    + " ไม่มีระดับแบตหรืออุณหภูมิภายนอก Google Maps บนมือถือที่ลงชื่อบัญชีเดียวกันจึงแสดงแบตของรถคันนี้"
                    + " และแบตเมื่อถึงปลายทางได้"
                    : "While it runs, Maps sends the battery percentage to your Google account every 2 minutes and again when the"
                    + " percentage drops, and this car's energy model when it starts and every 2 hours. Maps sends nothing while the car's screen is off. The model holds"
                    + " capacity, weight, power limits, consumption and charging curves, without the battery level or the outside"
                    + " temperature. Google Maps on a phone signed in to the same account can then show this car's battery and"
                    + " the battery on arrival.");
            // The explanation goes under Details (phoneDetails, below the toggle).


            // The details, closed until asked for.
            detailsDivider = divider();
            content.addView(detailsDivider);
            // A list row: the word, and a chevron at the end (down closed, up open; update()).
            detailsToggle = text(16, primary, false);
            detailsToggle.setMinHeight(px(56));
            detailsToggle.setGravity(Gravity.CENTER_VERTICAL);
            detailsToggle.setPadding(px(24), 0, px(20), 0);
            selectable(detailsToggle);
            detailsToggle.setOnClickListener(view -> {
                detailsOpen = !detailsOpen;
                update();
                if (detailsOpen) root.post(() -> root.smoothScrollTo(0, detailsToggle.getTop()));
            });
            content.addView(detailsToggle);

            // Details (the main view keeps what is set before a trip): the last guided drive, Maps' battery on arrival at
            // its start against the battery on arrival.
            lastSection = section(thai ? "ทริปนำทางล่าสุด" : "Last guided drive");
            lastText = text(15, primary, false);
            lastText.setLineSpacing(0, 1.2f);
            lastSection.addView(lastText);

            // Details: what the phone gets while its switch is on.
            phoneDetails = section(thai ? "แบตบนมือถือ" : "Battery on the phone");
            phoneDetails.addView(phoneCaption);

            // Details: the guided drives before the last one (kept on the car), and the export of the drive records.
            guidedSection = section(thai ? "ทริปก่อนหน้า" : "Earlier drives");
            guidedText = text(15, primary, false);
            guidedText.setLineSpacing(0, 1.2f);
            guidedSection.addView(guidedText);
            LinearLayout guidedFooter = horizontal();
            guidedFooter.setGravity(Gravity.CENTER_VERTICAL);
            guidedCaption = text(13, secondary, false);
            guidedFooter.addView(guidedCaption, weight(1));
            Button export = M3.button(themed, colors, thai ? "ส่งออกบันทึก" : "Export records", M3.OUTLINED);
            export.setOnClickListener(view -> exportRecords());
            guidedFooter.addView(export, after());
            guidedSection.addView(guidedFooter);

            // Details: the model Maps receives, BYD's table adjusted with the values learned on this car.
            modelSection = section(thai ? "โมเดลที่ส่งให้ Maps" : "Model sent to Maps");
            modelCaption = text(14, secondary, false);
            modelCaption.setLineSpacing(0, 1.2f);
            modelSection.addView(modelCaption);

            // Details: what BYD's own trip log says (read by itself, or after the card's Allow).
            tripLogSection = section(thai ? "บันทึกทริปของ BYD" : "BYD's trip log");
            tripLogCaption = text(14, secondary, false);
            tripLogCaption.setLineSpacing(0, 1.2f);
            tripLogSection.addView(tripLogCaption);

            // Details: the consumption.
            usage = section("");
            usageHeader = (TextView) usage.getChildAt(0);
            bandTable = vertical();
            LinearLayout heading = horizontal();
            heading.addView(cell("kWh/100 km", Gravity.START), weight(NAME_WEIGHT));
            heading.addView(cell(thai ? "วัดได้" : "Measured", Gravity.END), weight(1));
            heading.addView(cell(thai ? "ตาราง BYD" : "BYD table", Gravity.END), weight(1));
            heading.addView(cell(thai ? "ต่างกัน" : "Difference", Gravity.END), weight(1));
            bandTable.addView(heading);
            rows[0] = row(bandTable, thai ? "ทุกความเร็ว" : "All speeds", "");
            rows[1] = row(bandTable, thai ? "ในเมือง" : "City", thai ? "ต่ำกว่า 60 กม./ชม." : "below 60 km/h");
            rows[2] = row(bandTable, thai ? "ปานกลาง" : "Mixed", thai ? "60–80 กม./ชม." : "60–80 km/h");
            rows[3] = row(bandTable, thai ? "ทางหลวง" : "Highway", thai ? "80 กม./ชม. ขึ้นไป" : "80 km/h and above");
            rows[4] = row(bandTable, thai ? "แบตมากกว่า 90%" : "Battery above 90%",
                    thai ? "ทุกความเร็ว แยกจากแถวบน" : "any speed, kept out of the rows above");
            usage.addView(bandTable);
            // Distance and energy per 1% of the battery, the user's own measure.
            levelTable = vertical();
            levelTable.setPadding(0, px(12), 0, 0);
            LinearLayout levelHeading = horizontal();
            levelHeading.addView(cell(thai ? "ต่อแบต 1%" : "Per 1% of battery", Gravity.START), weight(NAME_WEIGHT));
            levelHeading.addView(cell(thai ? "กม." : "km", Gravity.END), weight(1));
            levelHeading.addView(cell("kWh", Gravity.END), weight(1));
            levelHeading.addView(cell(thai ? "วัดแล้ว" : "Measured", Gravity.END), weight(1));
            levelTable.addView(levelHeading);
            levelRows[0] = row(levelTable, thai ? "แบตมากกว่า 90%" : "Above 90%", null);
            levelRows[1] = row(levelTable, thai ? "แบต 90% ลงมา" : "90% and below", null);
            levelRows[2] = row(levelTable, thai ? "เฉลี่ยทั้งแบต" : "Whole battery",
                    thai ? "90% ลงมา 9 ส่วน เกิน 90% 1 ส่วน" : "nine parts at 90% and below, one above");
            usage.addView(levelTable);
            LinearLayout footer = horizontal();
            footer.setGravity(Gravity.CENTER_VERTICAL);
            usageCaption = text(13, secondary, false);
            footer.addView(usageCaption, weight(1));
            Button reset = M3.button(themed, colors, thai ? "ล้างค่า" : "Reset", M3.OUTLINED);
            reset.setOnClickListener(view -> confirmResetLearning(host, this::update));
            footer.addView(reset, after());
            usage.addView(footer);

            // Details: the car and its battery.
            carSection = section(thai ? "รถและแบต" : "Car and battery");
            details = text(14, primary, false);
            details.setLineSpacing(0, 1.2f);
            carSection.addView(details);
            carSection.setPadding(px(24), px(16), px(24), px(8));
            update();
        }

        void update() {
            boolean enabled = isEnabled(host);
            if (toggle.isChecked() != enabled) toggle.setChecked(enabled);
            if (!enabled || !active) {
                boolean untested = !enabled && untestedByd(host), far = untested && mismatch(host);
                status.setText(!enabled ? (far ? (thai ? "ปิด · ข้อมูลรถไม่เข้ากัน" : "Off · the car's data does not fit")
                        : untested ? (thai ? "ปิด · ยังไม่ได้ทดสอบกับรถรุ่นนี้" : "Off · not tested on this car model")
                        : (thai ? "ปิด" : "Off"))
                        : (thai ? "เปิด · ไม่พบระบบรถ BYD (BYD SDK)" : "On · no BYD vehicle system (BYD SDK) found"));
                intro.setText(!enabled
                        ? (thai ? "เปิดเพื่อให้ Maps รู้ระดับแบต แสดงแบตเมื่อถึงปลายทาง และวางจุดแวะชาร์จ"
                        + " เปลี่ยนแล้วแอปจะเริ่มใหม่"
                        : "Turn on so Maps knows the battery level, shows the battery on arrival and plans charging stops."
                        + " The app restarts after a change.")
                        + (!far ? "" : thai
                        ? "\n\nข้อมูลที่วัดจากรถคันนี้ไม่เข้ากับ BYD battery (" + mismatchShown(host, true)
                        + ") จึงปิดไว้ เปิดเองได้ แต่แบตเมื่อถึงปลายทางอาจคลาดเคลื่อนมาก"
                        : "\n\nThis car's own data does not fit BYD battery (" + mismatchShown(host, false)
                        + "), so this starts off. You can turn it on, but the battery on arrival may be far off.")
                        + (!untested || far ? "" : thai
                        ? "\n\nรถรุ่นนี้ (" + modelText(host, true) + ") ยังไม่มีผลทดสอบ จึงปิดไว้ก่อน เปิดเองได้"
                        + " แต่แบตเมื่อถึงปลายทางอาจคลาดเคลื่อน ไม่รองรับปลั๊กอินไฮบริด (DM-i)"
                        : "\n\nThis car model (" + modelText(host, false) + ") has no test results yet, so this starts off."
                        + " You can turn it on, but the battery on arrival may be less accurate."
                        + " Plug-in hybrids (DM-i) are not supported.")
                        : (thai ? "ไม่พบระบบรถ BYD จึงไม่ได้ส่งข้อมูลแบตให้ Maps ปิดได้ถ้าไม่ใช่รถ BYD"
                        : "No BYD vehicle system found, so Maps gets no battery data. Turn this off on other cars."));
                show(intro, true);
                for (View view : new View[]{batteryDivider, battery, tripLogCard, fallbackUsage, modelNotice, load, arrival, phone,
                        lastSection, phoneDetails, detailsDivider, detailsToggle, guidedSection, modelSection, tripLogSection, usage,
                        carSection}) {
                    show(view, false);
                }
                return;
            }
            show(intro, false);
            long now = SystemClock.elapsedRealtime();
            boolean fresh = energyModel != null;
            long sampledAt = lastSampleAt, readAt = lastMapsReadAt;
            status.setText(smallBatteryWh > 0
                    ? (thai ? "เปิด · แบตขนาดไฮบริด (DM-i) ไม่ส่งให้ Maps จะปิดตั้งแต่เปิดแอปครั้งถัดไป"
                    : "On · a hybrid-size battery (DM-i), not sent to Maps; off from the next start")
                    : fresh
                    ? readAt == 0 ? (thai ? "เปิด · รอ Maps อ่านข้อมูล" : "On · waiting for Maps to read")
                    : (thai ? "เปิด · ส่งให้ Maps แล้ว" : "On · sent to Maps")
                    : sampledAt == 0 ? (thai ? "เปิด · รออ่านแบตเตอรี่จากรถ" : "On · waiting for the car's battery")
                    : (thai ? "เปิด · ไม่มีข้อมูลล่าสุด ถอนข้อมูลจาก Maps แล้ว" : "On · no recent reading, withdrawn from Maps"));
            BydVehicleModel.Status model = BydVehicleModel.status();
            BydVehicleEnergyFile file = energyFile;

            show(batteryDivider, true);
            show(battery, true);
            if (sampledAt == 0) {
                percent.setText("–");
                percent.setTextColor(secondary);
                levelBar.setLevel(Float.NaN, colors);
                energy.setText(thai ? "รออ่านแบตเตอรี่จากรถ" : "Waiting for the car's battery");
                show(batteryNote, false);
            } else {
                percent.setText(String.format(Locale.ROOT, "%.0f%%", sampleSoc));
                percent.setTextColor(fresh ? primary : secondary);
                levelBar.setLevel((float) (sampleSoc / 100), colors);
                energy.setText(BydCapacityText.energyLine(sampleEnergyWh, sampleCapacityWh, sampleCapacityFrom, thai));
                StringBuilder note = new StringBuilder();
                if (!fresh) note.append(thai ? "อ่านเมื่อ " : "read ").append(ago(now - sampledAt, thai));
                // The distance per 1%, the user's own rule of thumb: measured on this car (kmPerPercent), "learning" before.
                double km = kmPerPercent(sampleSoc, sampleEnergyWh, model);
                join(note, Double.isNaN(km) ? (thai ? "กม. ต่อ 1%: กำลังเรียนรู้" : "km per 1%: learning")
                        : String.format(Locale.ROOT, thai ? "≈ %.1f" + NBSP + "กม. ต่อ 1%%" : "≈ %.1f" + NBSP + "km per 1%%", km));
                if (sampleOutsideC != BydOutsideTemperature.UNAVAILABLE) {
                    join(note, String.format(Locale.ROOT, thai ? "นอกรถ %d" + NBSP + "°C" : "outside %d" + NBSP + "°C", sampleOutsideC));
                }
                batteryNote.setText(note);
                show(batteryNote, note.length() > 0);
            }
            String healthText = healthText(thai);
            healthNote.setText(healthText);
            show(healthNote, healthText != null);

            show(load, file != null);
            if (file != null) {
                if (paintedLoad != loadKg) paintChips();
                String kg = thai ? NBSP + "กก." : NBSP + "kg";
                loadCaption.setText((thai ? "Maps คิดน้ำหนักรถ " : "Maps plans with ") + grouped(massKg(file)) + kg
                        + (loadKg == 0 ? (thai ? " (รวมคนขับ)" : " (driver included)")
                        : " (" + grouped(file.fileMassKg) + " + " + loadKg + ")"));
            }

            // The table is chosen with the first reading; until then nothing is known about the model.
            boolean fallback = energyFileChecked && file == null;
            show(fallbackUsage, fallback);
            if (fallback) {
                fallbackUsage.setText(String.format(Locale.ROOT, (thai ? "อัตรากินไฟที่ Maps ใช้ " : "Consumption Maps uses: ")
                        + "%.1f" + NBSP + "kWh/100" + NBSP + "km · %s", model.consumption, sourceText(model, thai)));
            }
            String notice = file != null ? modelNotice(thai) : null;
            modelNotice.setText(notice);
            show(modelNotice, notice != null);

            show(arrival, true);
            int chargingStop = ArrivalBattery.stored(host, ArrivalBattery.CHARGING_STOP);
            int destination = ArrivalBattery.stored(host, ArrivalBattery.DESTINATION);
            if (paintedChargingStop != chargingStop) {
                paintedChargingStop = chargingStop;
                paintChoices(chargingStopChips, ArrivalBattery.CHARGING_STOP_CHOICES, chargingStop);
            }
            if (paintedDestination != destination) {
                paintedDestination = destination;
                paintChoices(destinationChips, ArrivalBattery.DESTINATION_CHOICES, destination);
            }
            arrivalCaption.setText(arrivalCaption(thai));

            show(phone, true);
            boolean phoneOn = PhoneBattery.isOn(host);
            if (phoneToggle.isChecked() != phoneOn) phoneToggle.setChecked(phoneOn);
            phoneStatus.setText(PhoneBattery.status(host, thai));
            // What the phone gets, in the details: the switch and its state are enough on the main view.
            show(phoneDetails, detailsOpen);

            show(lastSection, detailsOpen);
            lastText.setText(lastDriveText(thai));

            show(detailsDivider, true);
            show(detailsToggle, true);
            detailsToggle.setText(thai ? "รายละเอียด" : "Details");
            detailsToggle.setCompoundDrawablesRelativeWithIntrinsicBounds(null, null,
                    new M3.Chevron(px(24), secondary, detailsOpen), null);

            show(guidedSection, detailsOpen);
            guidedText.setText(earlierDrivesText(thai));
            guidedCaption.setText(exportStatus != null ? exportStatus : "");

            show(modelSection, detailsOpen && file != null);
            if (detailsOpen && file != null) modelCaption.setText(modelDetails(file, thai));

            // After Android's Allow for the storage permission, read the log once.
            if (tripLogPermissionAsked && !tripLogReading && BydTripLogReader.permitted(host)) {
                tripLogPermissionAsked = false;
                readTripLog(BydTripLogReader.FILE);
            }
            boolean card = tripLogCardWanted(host);
            show(tripLogCard, card);
            if (card) {
                tripLogCardText.setText(tripLogCardText(thai));
                show(tripLogButtons, !tripLogReading);
            }
            show(tripLogSection, detailsOpen && file != null);
            if (detailsOpen) tripLogCaption.setText(tripLogText(thai));

            show(usage, detailsOpen && energyFileChecked);
            if (file != null) {
                usageHeader.setText(thai ? "อัตรากินไฟที่วัดได้ (ใช้เทียบ ไม่ได้ส่งให้ Maps)"
                        : "Measured consumption (for comparison, not sent to Maps)");
                show(bandTable, true);
                rows[0].sub.setText(sourceText(model, thai));
                values(rows[0], number(model.consumption), "", "");
                BydSpeedBands.Status[] bands = BydSpeedBands.status();
                for (int i = 0; i < bands.length; i++) {
                    BydSpeedBands.Status band = bands[i];
                    if (band.pools > 0) {
                        double ratio = band.ratio();
                        values(rows[i + 1], number(band.measured), number(band.predicted), Double.isNaN(ratio) ? ""
                                : String.format(Locale.ROOT, "%+.0f%%", (ratio - 1) * 100));
                    } else {
                        pending(rows[i + 1], band.poolKm > 0
                                ? String.format(Locale.ROOT, thai ? "สะสม %.1f / 10" + NBSP + "กม." : "%.1f of 10" + NBSP + "km", band.poolKm)
                                : (thai ? "ยังไม่มีข้อมูล" : "no data yet"));
                    }
                }
                usageCaption.setText("");
            } else {
                // The value itself is on the main view; here how it is learned, and the reset.
                usageHeader.setText(thai ? "อัตรากินไฟที่ Maps ใช้" : "Consumption Maps uses");
                show(bandTable, false);
                // No-break spaces keep "5% per segment" on one line.
                usageCaption.setText(thai
                        ? "ปรับอัตโนมัติจากการขับต่อเนื่องช่วงละ 10 กม. และ 5 นาทีขึ้นไป ไม่เกิน" + NBSP + "5%" + NBSP + "ต่อช่วง"
                        + " หรือ 25% เมื่อสองช่วงติดกันต่างไปทางเดียวกันเกิน 15%"
                        : "Adjusted from continuous driving segments of 10 km and 5 minutes or more, at most 5%" + NBSP + "per" + NBSP
                        + "segment, or 25% when two segments in a row differ by more than 15% the same way.");
            }
            // The whole percents need no table (DiLink 5 too).
            show(levelTable, true);
            BydSpeedBands.LevelStatus[] levels = BydSpeedBands.levelStatus();
            for (int i = 0; i < levels.length; i++) {
                BydSpeedBands.LevelStatus level = levels[i];
                if (level.count > 0) {
                    values(levelRows[i], String.format(Locale.ROOT, "%.1f", level.kmPerPercent),
                            String.format(Locale.ROOT, "%.2f", level.kwhPerPercent),
                            thai ? level.count + " ครั้ง" : level.count + "×");
                } else {
                    pending(levelRows[i], thai ? "ยังไม่มีข้อมูล" : "no data yet");
                }
            }
            // The whole battery: the main view's value (the two ranges weighted 1 to 9), so the two always agree.
            double wholeKm = kmPerPercent(sampleSoc, sampleEnergyWh, model), wholeKwh = kwhPerPercent();
            long counted = levels[0].count + levels[1].count;
            if (Double.isNaN(wholeKm)) {
                pending(levelRows[2], thai ? "ยังไม่มีข้อมูล" : "no data yet");
            } else {
                values(levelRows[2], String.format(Locale.ROOT, "%.1f", wholeKm),
                        Double.isNaN(wholeKwh) ? "–" : String.format(Locale.ROOT, "%.2f", wholeKwh),
                        thai ? counted + " ครั้ง" : counted + "×");
            }

            show(carSection, detailsOpen);
            if (detailsOpen) details.setText(detailsText(file, model, sampledAt, thai));
        }

        /** The main view: the newest guided drive in two short lines, or why there is none. */
        private String lastDriveText(boolean thai) {
            List<BydForecast.Guided> drives = guided.recent(1);
            if (drives.isEmpty() && Boolean.FALSE.equals(forecastProvider)) {
                return thai ? "Maps ไม่ทำนายแบตบนรถคันนี้ (ระบบรถไม่มี google_maps_energy)"
                        : "Maps makes no battery forecast on this car (no system google_maps_energy provider).";
            }
            if (drives.isEmpty()) return thai ? "ยังไม่มี · ผลจะขึ้นเมื่อจบการนำทาง" : "None yet · shows when guidance ends";
            return driveText(drives.get(0), thai, true);
        }

        /** The details: the two guided drives before the newest, newest first, with the energies. */
        private String earlierDrivesText(boolean thai) {
            List<BydForecast.Guided> drives = guided.recent(3);
            StringBuilder out = new StringBuilder();
            for (int i = 1; i < drives.size(); i++) {
                if (out.length() > 0) out.append("\n\n");
                out.append(driveText(drives.get(i), thai, false));
            }
            return out.length() > 0 ? out.toString() : thai ? "ยังไม่มี" : "None yet";
        }

        /**
         * A guided drive: start and end with how it ended and its distance; then Maps' battery on arrival at the start
         * against the battery on arrival (or, while guiding, Maps' latest). Brief: percentages and the difference only.
         */
        private String driveText(BydForecast.Guided drive, boolean thai, boolean brief) {
            StringBuilder out = new StringBuilder();
            boolean open = "open".equals(drive.endReason);
            out.append(clock(drive.startWall)).append(open ? (thai ? " · กำลังนำทาง" : " · guiding")
                    : " – " + clock(drive.endWall) + " · " + endReasonText(drive.endReason, thai));
            double km = drive.km();
            if (km > 0) out.append(String.format(Locale.ROOT, " · %.0f" + NBSP + (thai ? "กม." : "km"), km));
            out.append('\n').append(brief ? (thai ? "Maps ทำนาย " : "Maps forecast ") : (thai ? "Maps ทำนายตอนออก " : "Maps at the start "))
                    .append(levelText(drive.firstArrivalWh, drive.firstShownPercent, drive.capacityWh, brief));
            if (open) {
                out.append(thai ? " · ล่าสุด " : " · latest ")
                        .append(levelText(drive.lastArrivalWh, drive.lastShownPercent, drive.capacityWh, brief));
                if (!brief) out.append(String.format(Locale.ROOT, thai ? " · อัปเดต %d ครั้ง" : " · %d updates", drive.updates));
            } else if (drive.endBatteryWh >= 0) {
                boolean arrived = BydForecast.ARRIVED.equals(drive.endReason);
                // The dashboard's whole percent when known, else the energy floored as Maps shows it.
                String end = !Double.isNaN(drive.endSoc) && drive.endSoc >= 0
                        ? brief ? String.format(Locale.ROOT, "%.0f%%", Math.floor(drive.endSoc))
                        : String.format(Locale.ROOT, "%.0f%% (%.1f" + NBSP + "kWh)", Math.floor(drive.endSoc), drive.endBatteryWh / 1000.0)
                        : levelText(drive.endBatteryWh, -1, drive.capacityWh, brief);
                out.append(arrived ? (thai ? " · ถึงจริง " : " · arrived with ") : (thai ? " · แบตตอนจบ " : " · battery at the end "))
                        .append(end);
                int error = drive.errorWh();
                if (arrived && error != BydForecast.NO_ENERGY) {
                    long tenths = Math.round(error / 100.0);
                    out.append(" (").append(tenths == 0 ? "0.0" : String.format(Locale.ROOT, "%+.1f", tenths / 10.0))
                            .append(NBSP + "kWh)");
                }
            }
            return out.toString();
        }

        // "41% (20.1 kWh)"; brief: "41%" (kWh alone without a capacity, as in the full text). The percentage Maps showed
        // when it is known (above 90% each percent holds more, BydDisplayCurve), else energy × 100 / capacity.
        private String levelText(int wattHours, int shownPercent, int capacityWh, boolean brief) {
            if (shownPercent >= 0 && wattHours != Integer.MIN_VALUE) {
                return brief ? shownPercent + "%"
                        : String.format(Locale.ROOT, "%d%% (%.1f" + NBSP + "kWh)", shownPercent, wattHours / 1000.0);
            }
            if (!brief || wattHours == Integer.MIN_VALUE || capacityWh <= 0) return energyText(wattHours, capacityWh);
            return String.format(Locale.ROOT, "%.0f%%", Math.floor(wattHours * 100.0 / capacityWh));
        }

        private String endReasonText(String reason, boolean thai) {
            switch (reason == null ? "" : reason) {
                case "arrived": return thai ? "ถึงปลายทาง" : "arrived";
                case "changed": return thai ? "เปลี่ยนปลายทาง" : "destination changed";
                case "no_forecast": return thai ? "ไม่มีค่าทำนายต่อ" : "forecast stopped";
                case "restarted": return thai ? "Maps เริ่มใหม่ระหว่างนำทาง" : "Maps restarted during guidance";
                default: return thai ? "หยุดนำทางก่อนถึง" : "guidance stopped early";
            }
        }

        private void exportRecords() {
            Handler main = new Handler(Looper.getMainLooper());
            Context application = host.getApplicationContext();
            exportStatus = thai ? "กำลังส่งออก…" : "Exporting…";
            update();
            Runnable job = () -> {
                String result;
                try {
                    result = (thai ? "ส่งออกแล้วที่ " : "Exported to ") + BydDriveLog.export(application);
                } catch (Throwable error) {
                    ReportLog.w(TAG, "drive records export failed: " + BydEnergyReader.describe(error));
                    result = (thai ? "ส่งออกไม่ได้: " : "Export failed: ") + BydEnergyReader.describe(error);
                }
                ReportLog.i(TAG, "drive records export: " + result);
                String text = result;
                main.post(() -> {
                    exportStatus = text;
                    update();
                });
            };
            // On the worker, after any write of the drive records in progress.
            Handler work = worker;
            if (work != null) work.post(job);
            else new Thread(job, TAG + "-export").start();
        }

        private void selectLoad(int preset) {
            BydVehicleEnergyFile file = energyFile;
            if (file == null || preset == loadKg) return;
            loadKg = preset;
            host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putInt(KEY_LOAD, preset).apply();
            ReportLog.i(TAG, "load " + preset + " kg, mass " + massKg(file) + " kg from the next reading");
            update();
            // A report opened right after the choice reads the main process's snapshot.
            ReportBuilder.saveSnapshot(host.getApplicationContext(), true);
        }

        // The main view, only while Maps does not get the adjusted model: its values are not ready, or building it failed.
        private String modelNotice(boolean thai) {
            if (calibration == null) {
                return thai ? "ค่าที่วัดจากรถคันนี้ยังไม่พร้อม Maps ได้ตาราง BYD" : "The values measured on this car are not ready yet; Maps gets BYD's table.";
            }
            // Only a real failure: right after the calibration starts, the last reading may still have sent the table.
            if (adjustedFailed && !adjustedSent && energyModel != null) {
                return thai ? "Maps ได้ตาราง BYD เพราะสร้างโมเดลที่ปรับไม่ได้" : "Maps gets BYD's table because the adjusted model failed.";
            }
            return null;
        }

        // The details, what Maps gets: the auxiliary power measured while standing (estimated from the measured
        // temperatures where this one is not measured yet), the traction factor from Maps' forecasts, and from when new
        // values apply.
        private CharSequence modelDetails(BydVehicleEnergyFile file, boolean thai) {
            String notice = modelNotice(thai);
            BydCalibration c = calibration;
            if (c == null) return notice;
            SpannableStringBuilder text = new SpannableStringBuilder();
            if (notice != null) text.append(notice).append('\n');
            BydCalibration.Status s = c.status();
            int temp = bydTemperature(file, sampleOutsideC);
            Boolean acOn = sampleAcOn;
            // Measured here: the A/C-off power when the A/C is off and that was measured, else the knots around this temperature.
            double[] weights = BydModelParts.knotWeights(temp);
            double measuredShare = 0, minutes = 0, tooHigh = 0;
            for (int i = 0; i < weights.length; i++) {
                if (weights[i] == 0) continue;
                if (s.auxLearned[i]) measuredShare += weights[i];
                // A mean above the plausible limit is not used (BydCalibration.PLAUSIBLE_AUX_W): said, so the reason
                // shows, and its standing minutes are not counted as measured.
                if (s.auxMeasuredW[i] > BydCalibration.PLAUSIBLE_AUX_W) tooHigh = Math.max(tooHigh, s.auxMeasuredW[i]);
                else minutes += s.auxMinutes[i];
            }
            // With the A/C off, an A/C-off mean above the limit, which is not used either.
            if (Boolean.FALSE.equals(acOn) && s.auxOffMeasuredW > BydCalibration.PLAUSIBLE_AUX_W) {
                tooHigh = Math.max(tooHigh, s.auxOffMeasuredW);
            }
            boolean off = Boolean.FALSE.equals(acOn) && !Double.isNaN(s.auxOffW);
            boolean measured = off || measuredShare >= 0.5, anyMeasured = false;
            for (boolean learned : s.auxLearned) anyMeasured |= learned;
            if (off) minutes = s.auxOffMinutes;
            line(text, thai ? "แอร์และอุปกรณ์" : "A/C and electronics", String.format(Locale.ROOT,
                    thai ? "%d" + NBSP + "W ที่ %d" + NBSP + "°C" : "%d" + NBSP + "W at %d" + NBSP + "°C", Math.round(c.auxWatts(temp, acOn)), temp)
                    + (off ? (thai ? " แอร์ปิด" : ", A/C off") : "")
                    + (measured ? String.format(Locale.ROOT, thai ? " (วัดตอนจอด %.0f" + NBSP + "นาที)" : " (measured standing, %.0f" + NBSP + "min)", minutes)
                    : anyMeasured ? (thai ? " (ประมาณจากที่วัดได้ที่อุณหภูมิอื่น)" : " (estimated from the measured temperatures)")
                    : (thai ? " (ค่าตาราง BYD ยังไม่ได้วัด)" : " (BYD's value, not measured yet)"))
                    + (off || !(tooHigh > 0) ? "" : String.format(Locale.ROOT, thai ? " · วัดได้ %d" + NBSP + "W เกินเกณฑ์ %d" + NBSP + "W ไม่นำมาใช้"
                    : " · measured %d" + NBSP + "W, above the %d" + NBSP + "W limit, not used", Math.round(tooHigh),
                    Math.round(BydCalibration.PLAUSIBLE_AUX_W))));
            line(text, thai ? "แรงต้านและการสูญเสีย" : "Road load and losses", (s.tractionWh > 0
                    ? String.format(Locale.ROOT, thai ? "×%.2f จากค่าทำนายของ Maps %.0f" + NBSP + "กม. %d เส้นทาง"
                    : "×%.2f from Maps' forecasts over %.0f" + NBSP + "km, %d routes", s.factor, s.km, s.routes)
                    : s.center != 1 ? String.format(Locale.ROOT, thai ? "×%.2f จากบันทึกทริปของ BYD (ยังไม่มีค่าทำนายของ Maps ให้เทียบ)"
                    : "×%.2f from BYD's trip log (no Maps forecast to compare yet)", s.factor)
                    : (thai ? "×1.00 (ยังไม่มีค่าทำนายของ Maps ให้เทียบ)" : "×1.00 (no Maps forecast to compare yet)"))
                    // With routes the factor moves from its centre, which BYD's trip log may have set.
                    + (s.tractionWh > 0 && s.center != 1 ? String.format(Locale.ROOT, thai ? " · เริ่มที่ ×%.2f จากบันทึกทริปของ BYD"
                    : " · started at ×%.2f from BYD's trip log", s.center) : "")
                    + (s.learning ? (thai ? " · ยังเรียนรู้" : " · still learning") : "")
                    + wideText(s.wideBy, thai));
            // After a failure Maps has the table, so nothing "applies" yet.
            if (notice == null) {
                text.append(s.route ? String.format(Locale.ROOT, thai ? "เส้นทางนี้ใช้ค่าที่ล็อกไว้ตอนเริ่ม (×%.2f)"
                        : "This route keeps the values from its start (×%.2f)", s.sentFactor)
                        : (thai ? "ค่าใหม่ใช้ตั้งแต่เส้นทางถัดไป" : "New values apply from the next route"));
            } else if (text.length() > 0 && text.charAt(text.length() - 1) == '\n') {
                text.delete(text.length() - 1, text.length());
            }
            return text;
        }

        // The load presets: one segmented button.
        private void paintChips() {
            paintedLoad = loadKg;
            for (int i = 0; i < chips.length; i++) {
                M3.segment(chips[i], colors, LOADS_KG[i] == loadKg, i == 0, i == chips.length - 1);
            }
        }

        // A switch row of Battery on the phone: the title and [statusText] on the left, [toggle] on the right. The whole
        // row is the touch target; [flip] stores the new choice, then the dialog refreshes.
        private LinearLayout phoneSwitch(String title, TextView statusText, M3.Switch toggle, Runnable flip) {
            LinearLayout row = horizontal();
            row.setMinimumHeight(px(56));
            row.setPadding(0, px(4), 0, px(4));
            selectable(row);
            LinearLayout texts = vertical();
            TextView titleText = text(16, primary, false);
            titleText.setText(title);
            texts.addView(titleText);
            texts.addView(statusText);
            row.addView(texts, weight(1));
            toggle.setClickable(false);
            toggle.setFocusable(false);
            row.addView(toggle, wrap());
            row.setOnClickListener(view -> {
                flip.run();
                update();
            });
            return row;
        }

        // A label and one chip per choice of [level] (Auto, then the percentages), added to the arrival section.
        private void arrivalChips(String level, TextView[] levelChips, String label) {
            TextView caption = text(14, secondary, false);
            caption.setText(label);
            caption.setPadding(0, px(8), 0, 0);
            arrival.addView(caption);
            int[] choices = ArrivalBattery.choices(level);
            // Filter chips, as tall as the tallest of the row.
            LinearLayout chipRow = horizontal();
            for (int i = 0; i < choices.length; i++) {
                int choice = choices[i];
                TextView chip = text(15, primary, false);
                chip.setGravity(Gravity.CENTER);
                chip.setMinHeight(px(48));
                chip.setPadding(px(6), px(4), px(6), px(4));
                chip.setText(choice == ArrivalBattery.AUTO ? (thai ? "อัตโนมัติ" : "Auto") : choice + "%");
                chip.setOnClickListener(view -> selectArrival(level, choice));
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.MATCH_PARENT,
                        choice == ArrivalBattery.AUTO ? 1.6f : 1);
                params.setMargins(i == 0 ? 0 : px(4), px(4), i == choices.length - 1 ? 0 : px(4), px(4));
                chipRow.addView(chip, params);
                levelChips[i] = chip;
            }
            arrival.addView(chipRow);
        }

        private void selectArrival(String level, int choice) {
            if (ArrivalBattery.stored(host, level) == choice) return;
            ArrivalBattery.choose(host, level, choice);
            update();
        }

        private void paintChoices(TextView[] levelChips, int[] choices, int selected) {
            for (int i = 0; i < levelChips.length; i++) M3.chip(levelChips[i], colors, choices[i] == selected);
        }

        // What Auto is, and Google's levels once Maps used them (the labels above the chips say what the choices do).
        private String arrivalCaption(boolean thai) {
            int chargingStop = ArrivalBattery.googleDefault(ArrivalBattery.CHARGING_STOP);
            int destination = ArrivalBattery.googleDefault(ArrivalBattery.DESTINATION);
            String google = chargingStop < 0 && destination < 0 ? ""
                    : (thai ? " (จุดชาร์จ " : " (charging stops ") + (chargingStop < 0 ? "–" : chargingStop + "%")
                    + (thai ? " · ปลายทาง " : ", destination ") + (destination < 0 ? "–" : destination + "%") + ")";
            return (thai ? "อัตโนมัติ = ค่าของ Google" : "Auto = Google's level") + google;
        }

        // "Battery health 98% · battery temperature 31 °C (30–33)", or null when the car reported neither.
        private String healthText(boolean thai) {
            StringBuilder text = new StringBuilder();
            int soh = BydBatteryHealth.healthPercent(sampleHealthRaw);
            if (soh != BydBatteryHealth.UNAVAILABLE) text.append(thai ? "สุขภาพแบต " : "Battery health ").append(soh).append('%');
            String temperatures = temperatureRange();
            if (temperatures != null) {
                if (text.length() > 0) text.append(" · ").append(thai ? "อุณหภูมิแบต " : "battery temperature ");
                else text.append(thai ? "อุณหภูมิแบต " : "Battery temperature ");
                text.append(temperatures);
            }
            return text.length() > 0 ? text.toString() : null;
        }

        // "31 °C (30–33)" with the average, "30–33 °C" without it, null with neither.
        private String temperatureRange() {
            BydBatteryHealth.Raw raw = sampleTemperatures;
            if (raw == null) return null;
            int average = BydBatteryHealth.celsius(raw.average), highest = BydBatteryHealth.celsius(raw.highest),
                    lowest = BydBatteryHealth.celsius(raw.lowest);
            boolean range = highest != BydBatteryHealth.UNAVAILABLE && lowest != BydBatteryHealth.UNAVAILABLE && lowest <= highest;
            if (average != BydBatteryHealth.UNAVAILABLE) {
                return average + NBSP + "°C" + (range && lowest != highest ? " (" + lowest + "–" + highest + ")" : "");
            }
            return range ? lowest + "–" + highest + NBSP + "°C" : null;
        }

        private String healthDetails(boolean thai) {
            if (health == null || !health.ready()) return thai ? "ไม่มีข้อมูลบนรถคันนี้" : "not available on this car";
            if (healthReadAt == 0) return thai ? "ยังไม่ได้อ่าน" : "not read yet";
            int raw = sampleHealthRaw, soh = BydBatteryHealth.healthPercent(raw);
            String age = ago(SystemClock.elapsedRealtime() - healthReadAt, thai);
            if (soh != BydBatteryHealth.UNAVAILABLE) {
                return soh + "% · " + (thai ? "จาก BMS ของรถ · อ่านเมื่อ " : "from the car's BMS · read ") + age;
            }
            return (thai ? "รถไม่ได้ส่งค่า" : "not reported by the car")
                    + (raw == BydBatteryHealth.UNAVAILABLE ? "" : (thai ? " (ค่าดิบ " : " (raw ") + raw + ")");
        }

        private String temperatureDetails(boolean thai) {
            if (health == null || !health.ready()) return thai ? "ไม่มีข้อมูลบนรถคันนี้" : "not available on this car";
            BydBatteryHealth.Raw raw = sampleTemperatures;
            if (raw == null) return thai ? "ยังไม่ได้อ่าน" : "not read yet";
            int average = BydBatteryHealth.celsius(raw.average), highest = BydBatteryHealth.celsius(raw.highest),
                    lowest = BydBatteryHealth.celsius(raw.lowest);
            if (average == BydBatteryHealth.UNAVAILABLE && highest == BydBatteryHealth.UNAVAILABLE
                    && lowest == BydBatteryHealth.UNAVAILABLE) {
                return thai ? "รถไม่ได้ส่งค่า" : "not reported by the car";
            }
            return String.format(Locale.ROOT, thai ? "เฉลี่ย %s · สูงสุด %s · ต่ำสุด %s" + NBSP + "°C" : "average %s, highest %s, lowest %s" + NBSP + "°C",
                    celsiusText(average), celsiusText(highest), celsiusText(lowest));
        }

        private String celsiusText(int celsius) {
            return celsius == BydBatteryHealth.UNAVAILABLE ? "–" : String.valueOf(celsius);
        }

        // The car's values, one labelled line each. With BYD's table the learner's own lines are left to the report: the
        // consumption table above shows what it measured.
        private CharSequence detailsText(BydVehicleEnergyFile file, BydVehicleModel.Status model, long sampledAt, boolean thai) {
            SpannableStringBuilder text = new SpannableStringBuilder();
            String support = modelSupport(modelId(host));
            line(text, thai ? "รุ่นรถ BYD" : "BYD model", modelText(host, thai) + ("tested".equals(support)
                    ? (thai ? " · ทดสอบแล้ว (Dolphin)" : " · tested (Dolphin)") : "reported".equals(support)
                    ? (thai ? " · มีรายงานว่าใช้ได้" : " · reported working") : (thai ? " · ยังไม่ได้ทดสอบ" : " · untested")));
            if (sampledAt != 0) {
                // The capacity Maps gets. The measured one shows here only while it is used (below 10% SOC); the report
                // always has it.
                int from = sampleCapacityFrom;
                line(text, BydCapacityText.label(from, thai), BydCapacityText.usable(sampleCapacityWh, from, thai));
            }
            if (energyFileChecked) {
                line(text, thai ? "แบบจำลองที่ Maps ใช้" : "Model Maps uses", file != null
                        ? String.format(Locale.ROOT, thai ? "ตาราง BYD %s (DiCarServer) · เลือกจากความจุ %.1f" + NBSP + "kWh"
                        : "BYD %s tables (DiCarServer) · chosen for %.1f" + NBSP + "kWh", file.table(), energyFileCapacityWh / 1000.0)
                        + (!file.lossesReordered ? "" : thai ? " · เรียงค่าตารางที่สลับกลับแล้ว" : " · transposed values put back")
                        + (!sendsDolphinPower(file) ? "" : String.format(Locale.ROOT, thai
                        ? " · มอเตอร์ %d" + NBSP + "kW · ชาร์จ DC %d" + NBSP + "kW"
                        : " · motor %d" + NBSP + "kW · DC charging %d" + NBSP + "kW", PEAK_MOTOR_POWER_W / 1000, MAX_CHARGING_RATE_W / 1000))
                        : (thai ? "แบบสำรอง (ใช้ตาราง BYD ไม่ได้)" : "fallback (BYD's tables unavailable)"));
            }
            if (file != null && sampledAt != 0) {
                int outsideC = sampleOutsideC;
                // The drain at time between BYD's two nearest temperature sets ("23/35@0.25"), or one set.
                String drain = file.drainAtTimeText(bydTemperature(file, outsideC));
                String tables = "";
                if (drain != null) {
                    int at = drain.indexOf('@');
                    tables = at < 0
                            ? String.format(Locale.ROOT, thai ? " · ใช้ตารางชุด %s" + NBSP + "°C" : " · %s" + NBSP + "°C tables", drain)
                            : String.format(Locale.ROOT, thai ? " · ไฟแอร์ระหว่างชุด %s" + NBSP + "°C (%.0f%%)"
                            : " · A/C drain between the %s" + NBSP + "°C sets (%.0f%%)",
                            drain.substring(0, at).replace('/', '–'), Double.parseDouble(drain.substring(at + 1)) * 100);
                }
                line(text, thai ? "อุณหภูมินอกรถ" : "Outside temperature", outsideC != BydOutsideTemperature.UNAVAILABLE
                        ? String.format(Locale.ROOT, "%d" + NBSP + "°C%s", outsideC, tables)
                        : String.format(Locale.ROOT, thai ? "อ่านไม่ได้ · ใช้ %d" + NBSP + "°C ของตาราง%s"
                        : "unavailable · the tables' %d" + NBSP + "°C%s", Math.round(file.fileExternalTemp), tables));
            }
            line(text, thai ? "สุขภาพแบต (SOH)" : "Battery health (SOH)", healthDetails(thai));
            line(text, thai ? "อุณหภูมิแบต" : "Battery temperature", temperatureDetails(thai));
            line(text, thai ? "ค่าเฉลี่ยจากรถ" : "Car's average", Double.isNaN(model.carTotal) && Double.isNaN(model.carRecent)
                    ? (thai ? "ไม่มีข้อมูล" : "unavailable")
                    : String.format(Locale.ROOT, thai ? "%s สะสม · %s ล่าสุด (kWh/100 km)" : "%s total · %s recent (kWh/100 km)",
                    number(model.carTotal), number(model.carRecent)));
            long readAt = lastMapsReadAt;
            line(text, thai ? "Maps อ่านล่าสุด" : "Maps last read", readAt == 0 ? (thai ? "ยังไม่ได้อ่าน" : "not read yet")
                    : ago(SystemClock.elapsedRealtime() - readAt, thai));
            if (file == null) {
                // The fallback model is this learner, so its state stays in view.
                line(text, thai ? "การเรียนรู้" : "Learning", learningText(model.learning, thai));
                line(text, thai ? "ช่วงล่าสุดที่วัดได้" : "Last measured segment", Double.isNaN(model.lastWindow)
                        ? (thai ? "ยังไม่มี" : "none yet")
                        : String.format(Locale.ROOT, thai ? "%.1f kWh/100 km · %.1f" + NBSP + "กม. · %s" : "%.1f kWh/100 km · %.1f" + NBSP + "km · %s",
                        model.lastWindow, model.lastWindowMetres / 1000.0, model.lastWindowAccepted
                                ? (thai ? "นำมาเรียนรู้แล้ว" : "learned")
                                : (thai ? "ไม่ผ่านการตรวจ ไม่นำมาใช้" : "failed the checks, not used")));
            }
            if (text.length() > 0 && text.charAt(text.length() - 1) == '\n') text.delete(text.length() - 1, text.length());
            return text;
        }

        // A row of the given table; without a sub line when sub is null.
        private Row row(LinearLayout table, String name, String sub) {
            Row row = new Row();
            LinearLayout line = horizontal();
            line.setGravity(Gravity.CENTER_VERTICAL);
            line.setMinimumHeight(px(44));
            LinearLayout names = vertical();
            TextView title = text(16, primary, false);
            title.setText(name);
            row.sub = text(13, secondary, false);
            row.sub.setText(sub);
            if (sub == null) row.sub.setVisibility(View.GONE);
            names.addView(title);
            names.addView(row.sub);
            line.addView(names, weight(NAME_WEIGHT));
            row.measured = text(17, primary, true);
            row.table = text(16, primary, false);
            row.difference = text(16, secondary, false);
            row.pending = text(14, secondary, false);
            for (TextView cell : new TextView[]{row.measured, row.table, row.difference, row.pending}) cell.setGravity(Gravity.END);
            line.addView(row.measured, weight(1));
            line.addView(row.table, weight(1));
            line.addView(row.difference, weight(1));
            line.addView(row.pending, weight(3));
            table.addView(line);
            return row;
        }

        private void values(Row row, String measured, String table, String difference) {
            row.measured.setText(measured);
            row.table.setText(table);
            row.difference.setText(difference);
            for (TextView cell : new TextView[]{row.measured, row.table, row.difference}) show(cell, true);
            show(row.pending, false);
        }

        private void pending(Row row, String text) {
            row.pending.setText(text);
            for (TextView cell : new TextView[]{row.measured, row.table, row.difference}) show(cell, false);
            show(row.pending, true);
        }

        private TextView cell(String value, int gravity) {
            TextView cell = text(13, secondary, false);
            cell.setText(value);
            cell.setGravity(gravity);
            return cell;
        }

        // A section: its label (M3: primary, medium), then what the caller adds.
        private LinearLayout section(String title) {
            LinearLayout section = vertical();
            section.setPadding(px(24), px(20), px(24), 0);
            TextView header = M3.label(themed, colors, title);
            header.setPadding(0, 0, 0, px(8));
            section.addView(header);
            content.addView(section);
            return section;
        }

        private View divider() {
            View divider = M3.divider(themed, colors);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, Math.max(1, px(1)));
            params.setMargins(0, px(16), 0, 0);
            divider.setLayoutParams(params);
            return divider;
        }

        // A card's place in the content: the dialog's side margins, [top] dp above.
        private LinearLayout.LayoutParams cardParams(int top) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT);
            params.setMargins(px(24), px(top), px(24), 0);
            return params;
        }

        // [medium] is M3's medium weight (the old bold).
        private TextView text(int sp, int color, boolean medium) {
            return M3.text(themed, sp, color, medium);
        }

        private LinearLayout vertical() {
            LinearLayout layout = new LinearLayout(themed);
            layout.setOrientation(LinearLayout.VERTICAL);
            return layout;
        }

        private LinearLayout horizontal() {
            LinearLayout layout = new LinearLayout(themed);
            layout.setOrientation(LinearLayout.HORIZONTAL);
            layout.setGravity(Gravity.CENTER_VERTICAL);
            return layout;
        }

        private void selectable(View view) {
            M3.selectable(view, colors);
        }

        private int px(int dp) {
            return dp(themed, dp);
        }

        private static LinearLayout.LayoutParams weight(float weight) {
            return new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, weight);
        }

        private static LinearLayout.LayoutParams wrap() {
            return new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        }

        // A button after a caption or another button: 8 dp apart.
        private LinearLayout.LayoutParams after() {
            LinearLayout.LayoutParams params = wrap();
            params.setMarginStart(px(8));
            return params;
        }

        private static void show(View view, boolean visible) {
            int visibility = visible ? View.VISIBLE : View.GONE;
            if (view.getVisibility() != visibility) view.setVisibility(visibility);
        }

        private static void join(StringBuilder text, String part) {
            if (text.length() > 0) text.append(" · ");
            text.append(part);
        }
    }

    private static String loadName(int load, boolean thai) {
        switch (load) {
            case 0: return thai ? "คนขับคนเดียว" : "Driver only";
            case 75: return thai ? "2 คน" : "2 people";
            case 125: return thai ? "2 คน + ของ" : "2 people + luggage";
            default: return thai ? "4–5 คน + ของ" : "4–5 people + luggage";
        }
    }

    /** The preset's short name for its chip. */
    private static String chipName(int load, boolean thai) {
        if (thai) return loadName(load, true);
        switch (load) {
            case 0: return "Driver";
            case 75: return "2 people";
            case 125: return "2 + luggage";
            default: return "4–5 + luggage";
        }
    }

    // Where the consumption comes from: learned segments, else the car's own average or the start value.
    private static String sourceText(BydVehicleModel.Status status, boolean thai) {
        return status.windows > 0
                ? (thai ? "เรียนรู้จากการขับ " + status.windows + " ช่วง" : "learned from " + status.windows + " segments")
                : "car_recent".equals(status.seedSource) ? (thai ? "ค่าเฉลี่ยล่าสุดของรถ" : "the car's recent average")
                : "car_total".equals(status.seedSource) ? (thai ? "ค่าเฉลี่ยสะสมของรถ" : "the car's total average")
                : (thai ? "ค่าตั้งต้น (ยังไม่มีค่าเฉลี่ยจากรถ)" : "starting value (no car average yet)");
    }

    /** Thousands separators in both languages ("1,650"). */
    private static String grouped(int value) {
        return String.format(Locale.US, "%,d", value);
    }

    private static final String NBSP = " ";

    private static void line(SpannableStringBuilder text, String label, String value) {
        int start = text.length();
        text.append(label).append(": ");
        text.setSpan(new StyleSpan(Typeface.BOLD), start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.append(value).append('\n');
    }

    /** Local time of day, HH:mm. */
    private static String clock(long wall) {
        if (wall <= 0) return "–";
        java.util.Calendar calendar = java.util.Calendar.getInstance();
        calendar.setTimeInMillis(wall);
        return String.format(Locale.ROOT, "%02d:%02d", calendar.get(java.util.Calendar.HOUR_OF_DAY), calendar.get(java.util.Calendar.MINUTE));
    }

    /** "41% (20.1 kWh)", or kWh alone without a capacity. */
    // Why the factor's wider range applies: what agreed with the routes (BydCalibration.Status.wideBy); "" when it does not.
    private static String wideText(String by, boolean thai) {
        if (by == null) return "";
        switch (by) {
            case "speed_bands":
                return thai ? " · ขยายช่วงแล้ว (เส้นทางกับช่วงความเร็วตรงกัน)" : " · wider range (routes and speed records agree)";
            case "trip_log":
                return thai ? " · ขยายช่วงแล้ว (เส้นทางกับบันทึกทริปของ BYD ตรงกัน)" : " · wider range (routes and BYD's trip log agree)";
            default:
                // BydCalibration.WIDE_ALONE_WH: no speed records or trip log to compare, enough routes alone.
                String kwh = String.format(Locale.ROOT, "%.0f", BydCalibration.WIDE_ALONE_WH / 1000);
                return thai ? " · ขยายช่วงแล้ว (เส้นทางรวม " + kwh + NBSP + "kWh)" : " · wider range (" + kwh + NBSP + "kWh of routes)";
        }
    }

    private static String energyText(int wattHours, int capacityWh) {
        if (wattHours == Integer.MIN_VALUE) return "–";
        String kwh = String.format(Locale.ROOT, "%.1f" + NBSP + "kWh", wattHours / 1000.0);
        return capacityWh > 0 ? String.format(Locale.ROOT, "%.0f%% (%s)", Math.floor(wattHours * 100.0 / capacityWh), kwh) : kwh;
    }

    private static String ago(long millis, boolean thai) {
        long seconds = Math.max(0, millis / 1000);
        if (seconds < 120) return thai ? seconds + " วินาทีก่อน" : seconds + " s ago";
        return thai ? seconds / 60 + " นาทีก่อน" : seconds / 60 + " min ago";
    }

    private static String number(double value) {
        return Double.isNaN(value) ? "–" : String.format(Locale.ROOT, "%.1f", value);
    }

    // BydVehicleModel keeps the phone's English states.
    private static String learningText(String state, boolean thai) {
        if (!thai || state == null) return state;
        switch (state) {
            case "Waiting for trip data": return "รอข้อมูลการขับ";
            case "Waiting for the car's distance unit": return "รอหน่วยระยะทางจากรถ";
            case "Waiting for continuous data": return "รอข้อมูลต่อเนื่อง (หยุดระหว่างชาร์จหรือเมื่อข้อมูลขาด)";
            case "Waiting for a new trip segment": return "รอเริ่มช่วงการขับใหม่";
            case "Kept current value, waiting for more data": return "คงค่าเดิม รอข้อมูลเพิ่ม";
            case "Updated from measured energy and distance": return "อัปเดตจากพลังงานและระยะทางที่วัดได้";
            case "Started from the car's average; learning from trips": return "ตั้งต้นจากค่าเฉลี่ยของรถ กำลังเรียนรู้จากการขับ";
            default: return state;
        }
    }

    private static void confirmResetLearning(Activity activity, Runnable done) {
        boolean thai = UiDensityPatch.isThai(activity);
        boolean comparison = energyFile != null;
        new M3.Builder(activity)
                .setDestructive()
                .setTitle(comparison ? (thai ? "ล้างค่าที่วัดได้?" : "Reset the measured values?")
                        : (thai ? "ล้างค่าที่เรียนรู้?" : "Reset learning?"))
                .setMessage(comparison
                        ? (thai
                        ? "ค่าที่วัดจากรถคันนี้ทั้งหมด (อัตรากินไฟ แอร์และอุปกรณ์ ตัวคูณ) จะเริ่มวัดใหม่ ความจุที่ใช้ได้ไม่เปลี่ยน"
                        : "Everything measured on this car (consumption, A/C and electronics, the factor) starts again."
                        + " The usable capacity is not affected.")
                        : thai
                        ? "อัตรากินไฟที่เรียนรู้จะเริ่มใหม่จากค่าเฉลี่ยของรถ ความจุที่ใช้ได้ไม่เปลี่ยน Maps จะได้ค่าใหม่ในการอ่านแบตครั้งถัดไป"
                        : "The learned consumption starts again from the car's average. The usable capacity is not affected. "
                        + "Maps gets the new value with the next battery reading.")
                .setPositiveButton(thai ? "ล้างค่า" : "Reset", (dialog, which) -> {
                    try {
                        BydVehicleModel.resetLearning();
                        BydSpeedBands.reset();
                        BydCalibration calibrating = calibration;
                        if (calibrating != null) calibrating.reset();
                        else calibrationResetPending = true;
                    } catch (RuntimeException error) {
                        ReportLog.w(TAG, "learning reset failed", error);
                    }
                    done.run();
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics());
    }

    // Maps reads the vehicle type and creates its listeners at start, so the app restarts. The battery
    // dialog stays open behind this one, so Cancel returns to it unchanged.
    private static void confirmRestart(Activity activity, boolean enable) {
        boolean thai = UiDensityPatch.isThai(activity);
        new M3.Builder(activity)
                .setTitle(enable ? (thai ? "เปิดใช้แบตเตอรี่รถใน Maps?" : "Use the car's battery in Maps?")
                        : (thai ? "เลิกใช้แบตเตอรี่รถใน Maps?" : "Stop using the car's battery in Maps?"))
                .setMessage(thai
                        ? "Maps จะเริ่มใหม่ การนำทางที่กำลังทำงานจะหยุด" + (enable ? "" : " หลังจากนี้ Maps จะไม่รู้ระดับแบตของรถ")
                        : "Maps restarts. Active navigation stops." + (enable ? "" : " Maps will no longer know the car's battery level."))
                .setPositiveButton(thai ? (enable ? "เปิดและเริ่มใหม่" : "ปิดและเริ่มใหม่")
                        : (enable ? "Turn on and restart" : "Turn off and restart"), (dialog, which) -> {
                    // commit, not apply: the process exits right after.
                    boolean saved = activity.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                            .edit().putBoolean(KEY_ENABLED, enable).commit();
                    ReportLog.i(TAG, "BYD battery " + (enable ? "on" : "off") + " (saved " + saved + "), restarting");
                    Utils.restartApp(activity);
                })
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    /**
     * The stored choice; without one, on for the default-on models (the tested Dolphin and the models
     * reported working) with the BYD SDK and off on other BYD models, which are untested.
     */
    private static boolean isEnabled(Context context) {
        boolean byDefault = isByd() && defaultOn(context);
        try {
            return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean(KEY_ENABLED, byDefault);
        } catch (RuntimeException exception) {
            ReportLog.w(TAG, "Could not read the BYD battery choice", exception);
            return byDefault;
        }
    }

    private static boolean hasBydSdk() {
        try {
            Class.forName(BYD_SDK_CLASS);
            return true;
        } catch (Throwable error) {
            return false;
        }
    }

    public static boolean isByd() {
        return startsByd(Build.MANUFACTURER) || startsByd(Build.BRAND) || startsByd(Build.MODEL);
    }

    private static boolean startsByd(String value) {
        return value != null && value.regionMatches(true, 0, "BYD", 0, 3);
    }

    /**
     * A BYD with the BYD SDK or the TS car adapter where the battery is off by default: with the BYD SDK the models
     * outside {@link #DEFAULT_ON_MODEL_IDS}; with the TS car adapter alone (DiLink 5) every model.
     */
    private static boolean untestedByd(Context context) {
        return isByd() && (hasBydSdk() || hasTsAdapter()) && !defaultOn(context);
    }

    private static boolean hasTsAdapter() {
        try {
            Class.forName(TsEnergyReader.ADAPTER_CLASS);
            return true;
        } catch (Throwable error) {
            return false;
        }
    }

    /** DiLink 5 as on the Sealion 7: a BYD with the TS car adapter and without the BYD SDK. */
    static boolean tsAdapterCar() {
        return isByd() && !hasBydSdk() && hasTsAdapter();
    }

    /**
     * The Dolphin, the only model tested on the car: its motor power and charging rate, with the Dolphin's own BYD
     * table. The texts say "tested" from {@link #modelSupport}, which also needs the BYD SDK.
     */
    private static boolean testedModel(Context context) {
        return modelId(context) == DOLPHIN_MODEL_ID;
    }

    /**
     * Whether BYD battery starts on without a stored choice, with the BYD SDK (the DiLink 3 platform it was tested and
     * reported on): a model in {@link #DEFAULT_ON_MODEL_IDS}, or another one with DiCarServer's tables and no mismatch
     * verdict ({@link #checkMismatch}). Wider than {@link #testedModel}, never used for it.
     */
    private static boolean defaultOn(Context context) {
        if (!hasBydSdk()) return false;
        return defaultOnModel(modelId(context)) || hasEnergyTables(context) && !mismatch(context);
    }

    /**
     * BYD's DiCarServer is installed and holds at least one of the energy tables BYD battery reads
     * ({@link BydVehicleEnergyFile#tableOrder}); checked once per process. DiCarServer without them would run on the
     * fallback model, whose demo-car values no check here can turn off.
     */
    private static boolean hasEnergyTables(Context context) {
        Boolean known = energyTables;
        if (known != null) return known;
        boolean found = false;
        String detail;
        try {
            AssetManager assets = context.createPackageContext(DICAR_PACKAGE, 0).getAssets();
            detail = "none of " + BydVehicleEnergyFile.tableOrder(0);
            for (String name : BydVehicleEnergyFile.tableOrder(0)) {
                try (InputStream in = assets.open(name)) {
                    found = true;
                    detail = name;
                    break;
                } catch (IOException missing) {
                    // The next table.
                }
            }
        } catch (Throwable error) {
            detail = BydEnergyReader.describe(error);
        }
        energyTables = found;
        ReportLog.i(TAG, "BYD energy tables in " + DICAR_PACKAGE + ": " + (found ? "found (" + detail + ")" : "not found (" + detail + ")"));
        return found;
    }

    private static boolean defaultOnModel(int id) {
        for (int known : DEFAULT_ON_MODEL_IDS) if (known == id) return true;
        return false;
    }

    /**
     * For the log, the report and the texts: "tested" (the Dolphin), "reported" (on by default from owners' reports)
     * or "untested". Both were on DiLink 3, so without the BYD SDK (the TS car adapter of DiLink 5) every model is untested.
     */
    private static String modelSupport(int id) {
        if (!hasBydSdk()) return "untested";
        return id == DOLPHIN_MODEL_ID ? "tested" : defaultOnModel(id) ? "reported" : "untested";
    }

    /**
     * The car's BYD model id, read once: the system property, else BYD's car settings provider (both
     * 186 on the Dolphin). MODEL_UNKNOWN when neither can be read; the car then counts as untested.
     */
    private static int modelId(Context context) {
        int id = bydModelId;
        if (id != MODEL_NOT_READ) return id;
        String source = "property";
        id = parseModelId(systemProperty(MODEL_PROPERTY));
        if (id == MODEL_UNKNOWN && context != null) {
            source = "car settings";
            id = carSettingsModelId(context);
        }
        bydModelSource = id == MODEL_UNKNOWN ? "unreadable" : source.equals("property") ? "property" : "car_settings";
        bydModelId = id;
        String support = modelSupport(id);
        ReportLog.i(TAG, id == MODEL_UNKNOWN ? "BYD model id unknown, untested"
                : "BYD model id " + id + " (" + source + ")" + ("tested".equals(support) ? ", the tested Dolphin"
                : "reported".equals(support) ? ", reported working, on by default"
                : defaultOnModel(id) ? ", untested without the BYD SDK" : ", untested"));
        return id;
    }

    private static String systemProperty(String name) {
        try {
            return (String) Class.forName("android.os.SystemProperties").getMethod("get", String.class).invoke(null, name);
        } catch (Throwable error) {
            ReportLog.w(TAG, "Could not read " + name + ": " + BydEnergyReader.describe(error));
            return null;
        }
    }

    // Without a log line, for the crash handler. Null when unreadable or empty.
    private static String quietProperty(String name) {
        try {
            String value = (String) Class.forName("android.os.SystemProperties").getMethod("get", String.class).invoke(null, name);
            return value == null || value.isEmpty() ? null : value;
        } catch (Throwable error) {
            return null;
        }
    }

    /**
     * For crash files, from any process and the crashing thread: the BYD model id (the property, never
     * BYD's provider), the firmware and the vehicle type. Build.MODEL names only the DiLink platform.
     */
    static String describeCar() {
        try {
            if (!isByd()) return "not a BYD";
            int id = bydModelId != MODEL_NOT_READ ? bydModelId : parseModelId(quietProperty(MODEL_PROPERTY));
            String firmware = quietProperty(FIRMWARE_PROPERTY), type = quietProperty(VEHICLE_TYPE_PROPERTY);
            String support = modelSupport(id);
            return "BYD, model id " + (id == MODEL_UNKNOWN ? "unknown" : Integer.toString(id))
                    + ("tested".equals(support) ? " (the tested Dolphin)" : "reported".equals(support) ? " (reported working)" : " (untested)")
                    + ", firmware " + (firmware != null ? firmware : "unknown")
                    + ", vehicle type " + (type != null ? type : "unknown");
        } catch (RuntimeException error) {
            return "unknown";
        }
    }

    private static int carSettingsModelId(Context context) {
        try (Cursor cursor = context.getContentResolver().query(CAR_SETTINGS, null, null, null, null)) {
            if (cursor == null) return MODEL_UNKNOWN;
            int key = cursor.getColumnIndex("key"), value = cursor.getColumnIndex("value");
            if (key < 0 || value < 0) return MODEL_UNKNOWN;
            while (cursor.moveToNext()) {
                if (CAR_SETTINGS_MODEL_KEY.equals(cursor.getString(key))) return parseModelId(cursor.getString(value));
            }
        } catch (Throwable error) {
            ReportLog.w(TAG, "Could not read BYD's car settings: " + BydEnergyReader.describe(error));
        }
        return MODEL_UNKNOWN;
    }

    private static int parseModelId(String value) {
        if (value == null) return MODEL_UNKNOWN;
        try {
            int id = Integer.parseInt(value.trim());
            return id > 0 ? id : MODEL_UNKNOWN;
        } catch (NumberFormatException error) {
            return MODEL_UNKNOWN;
        }
    }

    /** The stored mismatch verdict as it is now (mismatch() keeps the one this process started with). */
    private static boolean storedMismatch(Context context) {
        try {
            return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getBoolean(KEY_MISMATCH, false);
        } catch (RuntimeException error) {
            return false;
        }
    }

    /** The stored mismatch verdict's numbers ("speed_bands ×2.31"), for the notice. */
    private static String mismatchText(Context context) {
        try {
            return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getString(KEY_MISMATCH_TEXT, "");
        } catch (RuntimeException error) {
            return "";
        }
    }

    /** The verdict for the notice: "speed records ×2.31 the table" ("ช่วงความเร็ว ×2.31 ของตาราง"). */
    private static String mismatchShown(Context context, boolean thai) {
        String text = mismatchText(context);
        int at = text.indexOf(' ');
        if (at < 0) return text;
        String source = text.substring(0, at), value = text.substring(at + 1);
        if (source.equals("battery_kwh")) {
            return thai ? "แบต " + value + " kWh ขนาดของปลั๊กอินไฮบริด (DM-i)" : "battery " + value + " kWh, a plug-in hybrid's size (DM-i)";
        }
        boolean log = source.equals("trip_log");
        return thai ? (log ? "บันทึกทริปของ BYD " : "ช่วงความเร็ว ") + value + " ของตาราง"
                : (log ? "BYD's trip log " : "speed records ") + value + " the table";
    }

    /** "รหัสรุ่น 123" for the untested notices, or that the id could not be read. */
    private static String modelText(Context context, boolean thai) {
        int id = modelId(context);
        if (id == MODEL_UNKNOWN) return thai ? "อ่านรหัสรุ่นไม่ได้" : "model id unreadable";
        return (thai ? "รหัสรุ่น " : "model id ") + id;
    }

    // Problem report (ReportBuilder): the state as it is, without reading the car again.

    /** The car's BYD model, or null on a car that is not a BYD, whose model id is then never read. */
    static JSONObject reportByd(Context context) throws JSONException {
        if (!isByd()) return null;
        int id = modelId(context);
        String vehicleType = systemProperty(VEHICLE_TYPE_PROPERTY);
        String firmware = quietProperty(FIRMWARE_PROPERTY);
        return new JSONObject()
                .put("is_byd", true)
                .put("sdk_present", hasBydSdk())
                .put("ts_adapter_present", hasTsAdapter())
                .put("model_id", id == MODEL_UNKNOWN ? JSONObject.NULL : id)
                .put("model_id_source", bydModelSource)
                .put("tested_model", id == DOLPHIN_MODEL_ID)
                .put("model_support", modelSupport(id))
                .put("vehicle_type", vehicleType == null || vehicleType.isEmpty() ? JSONObject.NULL : vehicleType)
                .put("firmware", firmware != null ? firmware : JSONObject.NULL);
    }

    /**
     * The battery health and temperatures as read (raw) and as shown; null before the reader started (it starts
     * with the BYD SDK's battery reader, so never on DiLink 5).
     */
    private static Object healthReport(long now) throws JSONException {
        String status = healthStatus;
        if (status == null) return JSONObject.NULL;
        int raw = sampleHealthRaw, soh = BydBatteryHealth.healthPercent(raw);
        long healthAt = healthReadAt, temperatureAt = temperatureReadAt;
        BydBatteryHealth.Raw temperatures = sampleTemperatures;
        JSONObject json = new JSONObject()
                .put("status", status)
                .put("soh_raw", healthAt != 0 && raw != BydBatteryHealth.UNAVAILABLE ? raw : JSONObject.NULL)
                .put("soh_percent", soh != BydBatteryHealth.UNAVAILABLE ? soh : JSONObject.NULL)
                .put("soh_read_age_s", healthAt != 0 ? (now - healthAt) / 1000 : JSONObject.NULL)
                .put("temp_read_age_s", temperatureAt != 0 ? (now - temperatureAt) / 1000 : JSONObject.NULL);
        if (temperatures == null) return json.put("temp_raw", JSONObject.NULL).put("temp_c", JSONObject.NULL);
        return json.put("temp_raw", new JSONObject()
                        .put("average", rawOrNull(temperatures.average))
                        .put("highest", rawOrNull(temperatures.highest))
                        .put("lowest", rawOrNull(temperatures.lowest)))
                .put("temp_c", new JSONObject()
                        .put("average", rawOrNull(BydBatteryHealth.celsius(temperatures.average)))
                        .put("highest", rawOrNull(BydBatteryHealth.celsius(temperatures.highest)))
                        .put("lowest", rawOrNull(BydBatteryHealth.celsius(temperatures.lowest))));
    }

    private static Object rawOrNull(int value) {
        return value == BydBatteryHealth.UNAVAILABLE ? JSONObject.NULL : value;
    }

    /** BYD battery's choice and its last reading; null fields when it is off or has not read yet. */
    static JSONObject reportBattery(Context context) throws JSONException {
        boolean stored;
        try {
            stored = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).contains(KEY_ENABLED);
        } catch (RuntimeException error) {
            stored = false;
        }
        long now = SystemClock.elapsedRealtime(), sampledAt = lastSampleAt, readAt = lastMapsReadAt;
        boolean on = active, sampled = on && sampledAt != 0;
        BydVehicleEnergyFile file = on ? energyFile : null;
        boolean dolphin = file != null && sendsDolphinPower(file);
        BydBatterySource source = on ? reader : null;
        JSONObject tsRaw = source instanceof TsEnergyReader ? ((TsEnergyReader) source).reportRaw() : null;
        int outsideC = sampleOutsideC;
        double learned = Double.NaN;
        if (on) {
            try {
                learned = BydVehicleModel.status().consumption;
            } catch (RuntimeException ignored) {
                // Not initialized.
            }
        }
        return new JSONObject()
                .put("enabled", isEnabled(context))
                .put("enabled_source", stored ? "stored" : "default")
                .put("active", on)
                .put("source", source == null ? JSONObject.NULL : source instanceof TsEnergyReader ? "ts_car_adapter" : "byd_sdk")
                .put("ts_raw", tsRaw != null ? tsRaw : JSONObject.NULL)
                .put("soc", sampled ? sampleSoc : JSONObject.NULL)
                .put("energy_wh", sampled ? sampleEnergyWh : JSONObject.NULL)
                .put("capacity_wh", sampled ? sampleCapacityWh : JSONObject.NULL)
                .put("measured_capacity_wh", on ? measuredCapacityWh() : JSONObject.NULL)
                .put("model_source", !on || !energyFileChecked ? "none" : file != null ? "byd_file" : "fallback")
                .put("table", file != null ? file.table() : JSONObject.NULL)
                .put("table_losses", file != null ? (file.lossesReordered ? "reordered" : "as_stored") : JSONObject.NULL)
                .put("mass_kg", file != null ? massKg(file) : JSONObject.NULL)
                .put("load_kg", on ? loadKg : JSONObject.NULL)
                .put("peak_motor_power_w", dolphin ? PEAK_MOTOR_POWER_W : JSONObject.NULL)
                .put("max_charging_rate_w", dolphin ? MAX_CHARGING_RATE_W : JSONObject.NULL)
                .put("outside_c", sampled && outsideC != BydOutsideTemperature.UNAVAILABLE ? outsideC : JSONObject.NULL)
                .put("health", on ? healthReport(now) : JSONObject.NULL)
                .put("last_reading_age_s", sampled ? (now - sampledAt) / 1000 : JSONObject.NULL)
                .put("last_maps_read_age_s", on && readAt != 0 ? (now - readAt) / 1000 : JSONObject.NULL)
                .put("learned_kwh_100km", Double.isNaN(learned) ? JSONObject.NULL : learned)
                .put("learner", on ? learnerReport() : JSONObject.NULL)
                .put("speed_bands", on ? speedBandsReport() : JSONObject.NULL)
                .put("arrival", ArrivalBattery.report(context))
                .put("phone", PhoneBattery.report(context))
                .put("forecasts", on ? forecastReport(now) : JSONObject.NULL)
                .put("guided_drives", on ? guidedReport() : JSONObject.NULL)
                .put("drives", on ? drivesReport() : JSONObject.NULL)
                .put("calibration", on ? calibrationReport() : JSONObject.NULL)
                .put("trip_log", on ? tripLogReport() : JSONObject.NULL)
                .put("display_curve", on ? BydDisplayCurve.status() : JSONObject.NULL)
                .put("km_per_percent", on && sampled ? finiteOrNull(kmPerPercent(sampleSoc, sampleEnergyWh, BydVehicleModel.status()))
                        : JSONObject.NULL)
                .put("model_mismatch", mismatch(context) ? mismatchText(context) : JSONObject.NULL)
                // The stored verdict now (found or withdrawn while running), which decides the next start.
                .put("model_mismatch_stored", storedMismatch(context) ? mismatchText(context) : JSONObject.NULL)
                .put("model_check_text", mismatchText(context).isEmpty() ? JSONObject.NULL : mismatchText(context))
                .put("small_battery_wh", smallBatteryWh > 0 ? smallBatteryWh : JSONObject.NULL)
                .put("energy_tables", energyTables != null ? energyTables : JSONObject.NULL)
                .put("drive_log", on ? BydDriveLog.status() : JSONObject.NULL)
                .put("signals", on && signalStatus != null ? new JSONObject().put("status", signalStatus)
                        .put("first", signalFirst != null ? keyValues(signalFirst) : JSONObject.NULL) : JSONObject.NULL);
    }

    /** The capacity measured at 50% SOC or more (used below 10% SOC), rounded to Wh; null before one or uninitialized. */
    private static Object measuredCapacityWh() {
        try {
            double measured = BydVehicleModel.status().measuredCapacity;
            return Double.isNaN(measured) ? JSONObject.NULL : (Object) Math.round(measured);
        } catch (RuntimeException notInitialized) {
            return JSONObject.NULL;
        }
    }

    /**
     * The learner (BydVehicleModel), which the dialog shows only with the fallback model: its state, the windows it
     * learned from, what it started from, and the last finished window. Null before it is initialized.
     */
    private static Object learnerReport() throws JSONException {
        BydVehicleModel.Status model;
        try {
            model = BydVehicleModel.status();
        } catch (RuntimeException notInitialized) {
            return JSONObject.NULL;
        }
        boolean window = !Double.isNaN(model.lastWindow);
        return new JSONObject()
                .put("learning", model.learning != null ? model.learning : JSONObject.NULL)
                .put("windows", model.windows)
                .put("seed_source", model.seedSource != null ? model.seedSource : JSONObject.NULL)
                .put("last_window_kwh_100km", finiteOrNull(model.lastWindow))
                .put("last_window_km", window ? (Object) (Math.round(model.lastWindowMetres / 100.0) / 10.0) : JSONObject.NULL)
                .put("last_window_accepted", window ? (Object) model.lastWindowAccepted : JSONObject.NULL);
    }

    /**
     * Consumption per speed band against BYD's table (BydSpeedBands), which the dialog's table shows only in part:
     * per band the finished pools and their totals, the pools that failed the checks and the pool being filled; per
     * whole percent of SOC above 90% and at 90% and below, the count and the distance and energy of one percent.
     */
    private static JSONObject speedBandsReport() throws JSONException {
        String[] names = {"city", "mixed", "highway", "above_90"}, groups = {"above_90", "90_and_below"};
        JSONArray bands = new JSONArray(), levels = new JSONArray();
        BydSpeedBands.Status[] status = BydSpeedBands.status();
        for (int i = 0; i < status.length && i < names.length; i++) {
            BydSpeedBands.Status band = status[i];
            bands.put(new JSONObject()
                    .put("band", names[i])
                    .put("pools", band.pools)
                    .put("rejected", band.rejected)
                    .put("total_km", Math.round(band.totalKm * 10) / 10.0)
                    .put("measured_kwh_100km", finiteOrNull(band.measured))
                    .put("predicted_kwh_100km", finiteOrNull(band.predicted))
                    .put("pool_km", Math.round(band.poolKm * 10) / 10.0));
        }
        BydSpeedBands.LevelStatus[] percents = BydSpeedBands.levelStatus();
        for (int i = 0; i < percents.length && i < groups.length; i++) {
            levels.put(new JSONObject()
                    .put("group", groups[i])
                    .put("count", percents[i].count)
                    .put("km_per_percent", finiteOrNull(percents[i].kmPerPercent))
                    .put("kwh_per_percent", finiteOrNull(percents[i].kwhPerPercent)));
        }
        return new JSONObject().put("bands", bands).put("soc_levels", levels);
    }

    /** The adjusted model: what Maps got last, and the values measured on this car. */
    private static JSONObject calibrationReport() throws JSONException {
        JSONObject out = new JSONObject().put("model_now", energyModel == null ? "none" : adjustedSent ? MODEL_ADJUSTED : MODEL_TABLE)
                .put("sent_factor", adjustedSent ? (Object) sentFactor : JSONObject.NULL)
                .put("sent_aux_w", adjustedSent ? (Object) sentAuxW : JSONObject.NULL);
        BydCalibration c = calibration;
        if (c == null) return out.put("status", "not_started");
        BydCalibration.Status s = c.status();
        JSONArray knots = new JSONArray(), aux = new JSONArray(), minutes = new JSONArray(), learned = new JSONArray(),
                measured = new JSONArray();
        for (int i = 0; i < s.auxW.length; i++) {
            knots.put(BydModelParts.AUX_KNOTS_C[i]);
            aux.put(Math.round(s.auxW[i]));
            minutes.put(Math.round(s.auxMinutes[i] * 10) / 10.0);
            learned.put(s.auxLearned[i]);
            // As measured, also a mean above the plausible limit, which is not used (aux_learned false).
            measured.put(Double.isNaN(s.auxMeasuredW[i]) || Double.isInfinite(s.auxMeasuredW[i]) ? JSONObject.NULL
                    : (Object) Math.round(s.auxMeasuredW[i]));
        }
        return out.put("status", "on")
                .put("pack_factor", finiteOrNull(s.packFactor))
                .put("pack_wh", Math.round(s.packWh))
                .put("aux_knots_c", knots).put("aux_w", aux).put("aux_minutes", minutes).put("aux_learned", learned)
                .put("aux_measured_w", measured).put("aux_plausible_max_w", Math.round(BydCalibration.PLAUSIBLE_AUX_W))
                .put("aux_off_w", finiteOrNull(s.auxOffW)).put("aux_off_minutes", Math.round(s.auxOffMinutes * 10) / 10.0)
                .put("aux_off_measured_w", finiteOrNull(s.auxOffMeasuredW))
                .put("factor", s.factor)
                .put("factor_raw", finiteOrNull(s.factorRaw))
                .put("maps_traction_wh", Math.round(s.tractionWh))
                .put("km", Math.round(s.km * 10) / 10.0)
                .put("routes", s.routes)
                .put("last_route_ratio", finiteOrNull(s.lastRouteRatio))
                .put("route_active", s.route)
                .put("seeded", s.seeded)
                .put("factor_center", s.center)
                .put("trip_log_ratio", finiteOrNull(s.tripLogRatio))
                .put("speed_ratio", finiteOrNull(s.speedRatio))
                .put("factor_wide", s.wide)
                .put("factor_wide_by", s.wideBy != null ? s.wideBy : JSONObject.NULL)
                .put("factor_learning", s.learning);
    }

    private static JSONObject tripLogReport() throws JSONException {
        BydTripLog.Summary s = tripLog;
        JSONObject out = new JSONObject().put("storage_permission", BydTripLogReader.permitted(context))
                .put("source", tripLogSource != null ? tripLogSource : JSONObject.NULL)
                .put("read_at", tripLogAt != 0 ? (Object) tripLogAt : JSONObject.NULL)
                .put("error", tripLogError != null ? tripLogError : JSONObject.NULL)
                .put("quiet_adb", tripLogQuiet != null ? tripLogQuiet : JSONObject.NULL);
        if (s == null) return out;
        return out.put("trips", s.trips).put("km", Math.round(s.km)).put("kwh", Math.round(s.kwh * 10) / 10.0)
                .put("kwh_100km", finiteOrNull(s.consumption())).put("used", s.used).put("used_km", Math.round(s.usedKm))
                .put("used_kwh", Math.round(s.usedKwh * 10) / 10.0).put("table_kwh", Math.round(s.tableKwh * 10) / 10.0)
                .put("ratio", finiteOrNull(s.ratio));
    }

    private static Object finiteOrNull(double value) {
        return Double.isNaN(value) || Double.isInfinite(value) ? JSONObject.NULL : (Object) (Math.round(value * 1000) / 1000.0);
    }

    /** "a=1|b=unavailable" as an object, so no report field holds the whole line. */
    private static JSONObject keyValues(String text) throws JSONException {
        JSONObject out = new JSONObject();
        for (String part : text.split("\\|")) {
            int at = part.indexOf('=');
            if (at > 0) out.put(part.substring(0, at), part.substring(at + 1));
        }
        return out;
    }

    private static JSONObject forecastReport(long now) throws JSONException {
        long at = lastForecastAt;
        return new JSONObject()
                .put("provider", forecastProvider != null ? forecastProvider : JSONObject.NULL)
                .put("count", forecastCount.get())
                .put("last", lastForecastText != null ? lastForecastText : JSONObject.NULL)
                .put("last_age_s", at != 0 ? (now - at) / 1000 : JSONObject.NULL);
    }

    /** The last 20 drive summaries (no altitude profile), the drive in progress first when there is one. */
    private static JSONArray drivesReport() throws JSONException {
        JSONArray out = new JSONArray();
        BydDriveLog.Drive open = BydDriveLog.current();
        if (open != null) out.put(open.json());
        for (BydDriveLog.Drive drive : BydDriveLog.recent(20)) out.put(drive.json());
        return out;
    }

    private static Object energyOrNull(int wattHours) {
        return wattHours == BydForecast.NO_ENERGY ? JSONObject.NULL : wattHours;
    }

    /** The last 10 guided drives: Maps' battery on arrival at the start and later, and the battery when guidance ended. */
    private static JSONArray guidedReport() throws JSONException {
        JSONArray out = new JSONArray();
        for (BydForecast.Guided drive : guided.recent(10)) {
            out.put(new JSONObject()
                    .put("start", drive.startWall)
                    .put("end", drive.endWall > 0 ? drive.endWall : JSONObject.NULL)
                    .put("end_reason", drive.endReason)
                    .put("capacity_wh", drive.capacityWh >= 0 ? drive.capacityWh : JSONObject.NULL)
                    .put("start_wh", drive.startBatteryWh >= 0 ? drive.startBatteryWh : JSONObject.NULL)
                    .put("start_soc", Double.isNaN(drive.startSoc) ? JSONObject.NULL : drive.startSoc)
                    .put("first_arrival_wh", energyOrNull(drive.firstArrivalWh))
                    .put("first_arrival_shown_percent", drive.firstShownPercent >= 0 ? drive.firstShownPercent : JSONObject.NULL)
                    .put("first_distance_m", drive.firstDistanceM)
                    .put("first_time_s", drive.firstTimeS)
                    .put("first_stops", drive.firstStops)
                    .put("first_quality", drive.firstQuality)
                    .put("last_arrival_wh", energyOrNull(drive.lastArrivalWh))
                    .put("last_arrival_shown_percent", drive.lastShownPercent >= 0 ? drive.lastShownPercent : JSONObject.NULL)
                    .put("last_distance_m", drive.lastDistanceM)
                    .put("last_time_s", drive.lastTimeS)
                    .put("last_forecast_battery_wh", drive.lastForecastBatteryWh >= 0 ? drive.lastForecastBatteryWh : JSONObject.NULL)
                    .put("updates", drive.updates)
                    .put("min_arrival_wh", energyOrNull(drive.minArrivalWh))
                    .put("max_arrival_wh", energyOrNull(drive.maxArrivalWh))
                    .put("end_wh", drive.endBatteryWh >= 0 ? drive.endBatteryWh : JSONObject.NULL)
                    .put("end_soc", Double.isNaN(drive.endSoc) ? JSONObject.NULL : drive.endSoc)
                    .put("km", Double.isNaN(drive.km()) ? JSONObject.NULL : drive.km())
                    .put("error_wh", BydForecast.ARRIVED.equals(drive.endReason) && drive.errorWh() != BydForecast.NO_ENERGY
                            ? drive.errorWh() : JSONObject.NULL));
        }
        return out;
    }
}
