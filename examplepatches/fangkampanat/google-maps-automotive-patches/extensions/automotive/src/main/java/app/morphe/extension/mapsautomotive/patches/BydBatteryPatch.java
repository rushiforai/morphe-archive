package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.res.AssetManager;
import android.content.res.ColorStateList;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
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
import android.widget.Switch;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Locale;

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
 * <li>a worker reads the battery from the BYD SDK every 10 s and Maps reads the encoded model
 * ({@link #openEnergyModel}). A reading is fresh for 30 s; then the model is withdrawn.</li>
 * </ul>
 * The model is built from one of BYD DiCarServer's energy-model files as DiCarServer
 * builds one ({@link BydVehicleEnergyFile}), with this car's battery and outside temperature. The file
 * is the table whose capacity is nearest the car's (420_1, 81_1 or 128_2), so other BYD cars
 * get a table of their size. The mass is the table's, which includes the driver, plus the people the
 * user picks in the dialog. With 420_1, the Dolphin Standard Range's table, on the Dolphin (model id
 * 186) the Dolphin's motor power and charging rate are sent too. If no file can be used, Maps gets a fallback model: the road load
 * scaled to the learned consumption. With a file the learned consumption is only shown, for comparison.
 * Read-only: no ADB, no shell, no raw binder calls, no vehicle writes. Maps does not upload the model
 * to the account (its upload workers need the car permission this app never holds).
 * <p>
 * On by default on the tested Dolphin (model id 186) with the BYD SDK, off elsewhere, with an
 * "untested" notice on other BYD models; the Settings row's choice is kept
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
    /** An older stored load above the car's 1,500 kg, driver included: read less the driver until a new choice. */
    private static final String KEY_OLD_LOAD = "load_kg";
    /** New Dolphin Standard Range (Rever Automotive's specification): 70 kW motor, 60 kW DC charging. */
    private static final int PEAK_MOTOR_POWER_W = 70000, MAX_CHARGING_RATE_W = 60000;
    // Protobuf wire types.
    private static final int VARINT = 0, LENGTH_DELIMITED = 2, FIXED32 = 5;

    private static volatile boolean active;
    private static volatile byte[] energyModel;
    private static volatile double lastSoc = Double.NaN;
    private static volatile long lastSampleAt, lastMapsReadAt;
    // The last reading, kept for the Settings dialog after it turns stale.
    private static volatile double sampleSoc;
    private static volatile int sampleEnergyWh, sampleCapacityWh;
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
    private static Context context;
    private static String authority;
    private static Uri modelUri;
    private static Handler worker;
    private static BydEnergyReader reader;
    private static String readerStatus;
    private static long lastRevision = -1;
    private static int lastLoggedSoc = -1, failures;
    private static String lastLoggedSelection;

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
            Class.forName(BYD_SDK_CLASS);
            context = base;
            loadKg = storedLoad(base);
            authority = base.getPackageName() + AUTHORITY_SUFFIX;
            modelUri = new Uri.Builder().scheme("content").authority(authority).path(MODEL_PATH).build();
            BydVehicleModel.initialize(base, NOMINAL_WH, ROLLING_N, LINEAR_N, DRAG_N);
            BydSpeedBands.initialize(base);
            reader = new BydEnergyReader();
            HandlerThread thread = new HandlerThread(TAG, Process.THREAD_PRIORITY_BACKGROUND);
            thread.start();
            worker = new Handler(thread.getLooper());
            active = true;
            // The BYD SDK needs the application context, which exists once the Application is created.
            worker.postDelayed(BydBatteryPatch::poll, START_DELAY_MS);
            ReportLog.i(TAG, "BYD battery on: " + modelUri);
        } catch (Throwable error) {
            active = false;
            ReportLog.w(TAG, "BYD battery not started", error);
        }
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

    /** Injection point: whether a listener read is for this app's energy model. */
    public static boolean ownsEnergyModel(Uri uri) {
        return active && modelUri.equals(uri);
    }

    /** Injection point: the energy model for Maps' listener, or null when there is no fresh reading. */
    public static InputStream openEnergyModel(Uri uri) {
        byte[] model = energyModel;
        if (model == null) return null;
        lastMapsReadAt = SystemClock.elapsedRealtime();
        return new ByteArrayInputStream(model);
    }

    // Worker thread only.
    private static void poll() {
        try {
            if (!reader.ready()) {
                String status = reader.init(context);
                if (!status.equals(readerStatus)) ReportLog.i(TAG, "BYD SDK " + status);
                readerStatus = status;
            }
            // After the reader, which usually creates the instrument device; one attempt per process.
            if (outsideTemperature == null && reader.ready()) {
                outsideTemperature = new BydOutsideTemperature();
                ReportLog.i(TAG, "outside temperature " + outsideTemperature.init(context));
            }
            BydEnergyReader.Sample sample = reader.read();
            if (sample == null) {
                BydVehicleModel.unavailable("sdk_unavailable");
                BydSpeedBands.unavailable();
            } else {
                publish(sample);
                failures = 0;
            }
        } catch (Throwable error) {
            BydVehicleModel.unavailable("sdk_error");
            BydSpeedBands.unavailable();
            if (failures++ % 30 == 0) ReportLog.w(TAG, "BYD read failed: " + BydEnergyReader.describe(error));
        }
        if (energyModel != null && SystemClock.elapsedRealtime() - lastSampleAt > FRESH_MS) {
            energyModel = null;
            lastSoc = Double.NaN;
            notifyModelChanged();
            ReportLog.i(TAG, "battery reading is stale, energy model withdrawn");
        }
        worker.postDelayed(BydBatteryPatch::poll, POLL_MS);
    }

    private static void publish(BydEnergyReader.Sample sample) {
        int current = (int) Math.round(sample.energy * 1000);
        BydVehicleModel.Model model = BydVehicleModel.activatePending();
        // BYD reports whole SOC percents and Maps floors percentages. Centring the pair inside its
        // percent makes Maps show the dashboard value (as in phone Maps).
        boolean centred = sample.soc >= 10 && sample.soc < 100 && sample.soc == Math.rint(sample.soc);
        double capacity = sample.soc >= 10 ? current * 100.0 / (centred ? sample.soc + 0.5 : sample.soc)
                : BydVehicleModel.lowSocCapacity(model);
        if (!(capacity >= 5000 && capacity <= 150000 && current <= capacity + 500)) {
            throw new IllegalArgumentException("inconsistent SOC " + sample.soc + " and energy " + current);
        }
        int capacityWh = Math.max(current, (int) Math.round(capacity));
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
        byte[] encoded = file != null ? encodeBydModel(file, current, capacityWh, outsideC) : null;
        if (encoded == null) {
            file = null;
            encoded = encodeEnergyModel(current, capacityWh, model);
        }
        boolean resumed = energyModel == null;
        energyModel = encoded;
        sampleSoc = sample.soc;
        sampleEnergyWh = current;
        sampleCapacityWh = capacityWh;
        sampleOutsideC = outsideC;
        lastSampleAt = SystemClock.elapsedRealtime();
        lastSoc = sample.soc;
        ReportBuilder.saveSnapshot(context, false);
        // A new read also restarts the model's age that Maps sends with each request.
        notifyModelChanged();
        String source = file == null ? "source=fallback;" + model.describe()
                : "source=byd_file:" + file.name + ";chosen_for_wh=" + energyFileCapacityWh + ";mass_kg=" + massKg(file)
                + ";power_w=" + (sendsDolphinPower(file) ? PEAK_MOTOR_POWER_W + "/" + MAX_CHARGING_RATE_W : "none")
                + ";outside_c=" + bydTemperature(file, outsideC)
                + ";temp_source=" + (outsideC != BydOutsideTemperature.UNAVAILABLE ? "sdk" : "file") + ";"
                + file.describeSelection(bydTemperature(file, outsideC)) + ";bytes=" + encoded.length;
        if (resumed || model.revision != lastRevision || (int) sample.soc != lastLoggedSoc || !source.equals(lastLoggedSelection)) {
            lastRevision = model.revision;
            lastLoggedSoc = (int) sample.soc;
            lastLoggedSelection = source;
            ReportLog.i(TAG, "energy model: soc=" + sample.soc + " energy_wh=" + current + " capacity_wh=" + capacityWh
                    + " capacity_basis=" + (sample.soc < 10 ? BydVehicleModel.lowSocCapacityBasis(model)
                    : centred ? "soc_midpoint" : "soc") + " " + source
                    + (file == null ? "" : ";measured_kwh_100km=" + model.consumption + ";model_revision=" + model.revision));
        }
        // Learning cannot invalidate the published reading.
        try {
            BydVehicleModel.observe(sample, current);
        } catch (Throwable error) {
            BydVehicleModel.unavailable("learning_error");
            ReportLog.w(TAG, "learning failed: " + BydEnergyReader.describe(error));
        }
        // Speed bands compare with BYD's table and only feed the dialog.
        try {
            if (file != null) BydSpeedBands.observe(sample, current, capacityWh, file, massKg(file), bydTemperature(file, outsideC));
            else BydSpeedBands.unavailable();
        } catch (Throwable error) {
            BydSpeedBands.unavailable();
            ReportLog.w(TAG, "speed bands failed: " + BydEnergyReader.describe(error));
        }
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

    // Settings row. The patch adds it to Maps' Settings list, before About & help.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "แบตเตอรี่รถ BYD (EV)" : "BYD battery (EV)";
    }

    /** Injection point: the row subtitle, the current state. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        if (!SafeMode.on(context, SafeMode.BYD_BATTERY)) {
            return thai ? "ปิดชั่วคราว · สวิตช์ใน Maps Car report" : "Off for now · switch in Maps Car report";
        }
        if (!isEnabled(context)) {
            if (untestedByd(context)) return thai ? "ปิด · ยังไม่ได้ทดสอบกับรถรุ่นนี้" : "Off · not tested on this car model";
            return thai ? "ปิด" : "Off";
        }
        if (!active) return thai ? "เปิด · ไม่พบระบบรถ BYD" : "On · no BYD vehicle system found";
        double soc = lastSoc;
        if (Double.isNaN(soc)) return thai ? "เปิด · รอข้อมูลแบตเตอรี่" : "On · waiting for battery data";
        // With BYD's table the load preset, which the user changes before a trip.
        if (energyFile != null) {
            return String.format(Locale.ROOT, thai ? "เปิด · แบตเตอรี่ %.0f%% · %s" : "On · battery %.0f%% · %s",
                    soc, loadName(loadKg, thai).toLowerCase(Locale.ROOT));
        }
        BydVehicleModel.Status status = BydVehicleModel.status();
        String learned = status.windows == 0 ? ""
                : thai ? " · เรียนรู้ " + status.windows + " ช่วง" : " · learned from " + status.windows + " segments";
        return String.format(Locale.ROOT, thai ? "เปิด · แบตเตอรี่ %.0f%% · %.1f kWh/100 km%s"
                : "On · battery %.0f%% · %.1f kWh/100 km%s", soc, status.consumption, learned);
    }

    /**
     * Injection point: the row's click action. The container view of the Settings screen, if the
     * patch found one, gives the activity when the given context is not one.
     */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> showDialog(context, container);
    }

    // The dialog: an on/off switch, the battery, the load presets, the consumption (measured
    // against BYD's table per speed band, or the value Maps uses with the fallback) and the details on
    // request. It is built once and refreshed in place while open.
    private static void showDialog(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the BYD battery dialog: " + context);
            return;
        }
        Activity host = activity;
        AlertDialog.Builder builder = new AlertDialog.Builder(host).setTitle(getSettingsTitle(host));
        // The builder's context carries the dialog theme, so the views match the dialog background.
        BatteryDialog views = new BatteryDialog(host, builder.getContext());
        builder.setView(views.root).setPositiveButton(views.thai ? "ปิดหน้าต่าง" : "Close", null);
        AlertDialog dialog = builder.create();
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

    /** The dialog's views. Colors come from the dialog theme; sizes are for a head unit at arm's length. */
    private static final class BatteryDialog {
        private static final float NAME_WEIGHT = 1.4f;
        final boolean thai;
        final ScrollView root;
        private final Activity host;
        private final Context themed;
        private final int primary, secondary, accent;
        private final LinearLayout content, battery, load, usage, bandTable, levelTable;
        private final Switch toggle;
        private final View batteryDivider, detailsDivider;
        private final TextView status, intro, percent, energy, batteryNote, loadCaption, usageHeader, usageLine,
                usageCaption, detailsToggle, details;
        private final TextView[] chips = new TextView[LOADS_KG.length];
        // The average over all speeds, then city, mixed, highway and above 90% SOC.
        private final Row[] rows = new Row[5];
        // Per 1% of SOC: above 90%, then 90% and below.
        private final Row[] levelRows = new Row[2];
        private int paintedLoad = -1;
        private boolean detailsOpen;

        private static final class Row {
            TextView sub, measured, table, difference, pending;
        }

        BatteryDialog(Activity host, Context themed) {
            this.host = host;
            this.themed = themed;
            thai = UiDensityPatch.isThai(host);
            primary = themeColor(android.R.attr.textColorPrimary, new TextView(themed).getCurrentTextColor());
            secondary = themeColor(android.R.attr.textColorSecondary, withAlpha(primary, 0xB3));
            accent = themeColor(android.R.attr.colorAccent, primary);

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
            toggle = new Switch(themed);
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

            batteryDivider = divider();
            content.addView(batteryDivider);

            // The battery: the percentage large, the energy and the distance per 1% beside it.
            battery = horizontal();
            battery.setPadding(px(24), px(12), px(24), px(4));
            percent = text(40, primary, true);
            percent.setIncludeFontPadding(false);
            battery.addView(percent, wrap());
            LinearLayout batteryText = vertical();
            batteryText.setPadding(px(16), 0, 0, 0);
            energy = text(17, primary, false);
            batteryNote = text(14, secondary, false);
            batteryText.addView(energy);
            batteryText.addView(batteryNote);
            battery.addView(batteryText, weight(1));
            content.addView(battery);

            // People and luggage, one tap per preset; Maps gets the mass with the next reading.
            load = section(thai ? "ผู้โดยสารและสัมภาระ" : "People and luggage");
            LinearLayout chipRow = horizontal();
            for (int i = 0; i < LOADS_KG.length; i++) {
                int preset = LOADS_KG[i];
                TextView chip = text(15, primary, false);
                chip.setGravity(Gravity.CENTER);
                chip.setMinHeight(px(48));
                chip.setPadding(px(6), px(4), px(6), px(4));
                chip.setText(chipName(preset, thai));
                chip.setOnClickListener(view -> selectLoad(preset));
                LinearLayout.LayoutParams params = weight(1);
                params.setMargins(i == 0 ? 0 : px(4), px(4), i == LOADS_KG.length - 1 ? 0 : px(4), px(4));
                chipRow.addView(chip, params);
                chips[i] = chip;
            }
            load.addView(chipRow);
            loadCaption = text(14, secondary, false);
            load.addView(loadCaption);

            // Consumption.
            usage = section("");
            usageHeader = (TextView) usage.getChildAt(0);
            usageLine = text(17, primary, false);
            usage.addView(usageLine);
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
            usage.addView(levelTable);
            LinearLayout footer = horizontal();
            footer.setGravity(Gravity.CENTER_VERTICAL);
            usageCaption = text(13, secondary, false);
            footer.addView(usageCaption, weight(1));
            Button reset = new Button(themed, null, android.R.attr.buttonBarButtonStyle);
            reset.setText(thai ? "ล้างค่า" : "Reset");
            reset.setOnClickListener(view -> confirmResetLearning(host, this::update));
            footer.addView(reset, wrap());
            usage.addView(footer);

            // The details, closed until asked for.
            detailsDivider = divider();
            content.addView(detailsDivider);
            detailsToggle = text(15, accent, true);
            detailsToggle.setMinHeight(px(48));
            detailsToggle.setGravity(Gravity.CENTER_VERTICAL);
            detailsToggle.setPadding(px(24), 0, px(24), 0);
            selectable(detailsToggle);
            detailsToggle.setOnClickListener(view -> {
                detailsOpen = !detailsOpen;
                update();
                if (detailsOpen) root.post(() -> root.smoothScrollTo(0, detailsToggle.getTop()));
            });
            content.addView(detailsToggle);
            details = text(14, primary, false);
            details.setLineSpacing(0, 1.2f);
            details.setPadding(px(24), 0, px(24), px(8));
            content.addView(details);
            update();
        }

        void update() {
            boolean enabled = isEnabled(host);
            if (toggle.isChecked() != enabled) toggle.setChecked(enabled);
            if (!enabled || !active) {
                boolean untested = !enabled && untestedByd(host);
                status.setText(!enabled ? (untested ? (thai ? "ปิด · ยังไม่ได้ทดสอบกับรถรุ่นนี้" : "Off · not tested on this car model")
                        : (thai ? "ปิด" : "Off"))
                        : (thai ? "เปิด · ไม่พบระบบรถ BYD (BYD SDK)" : "On · no BYD vehicle system (BYD SDK) found"));
                intro.setText(!enabled
                        ? (thai ? "เมื่อเปิด Maps Car จะอ่านแบตเตอรี่จากรถ BYD ทุก 10 วินาที แล้วให้ Maps ใช้คำนวณแบตที่เหลือเมื่อถึงปลายทาง"
                        + " เปลี่ยนแล้วแอปจะเริ่มใหม่"
                        : "When on, Maps Car reads the BYD car's battery every 10 s and gives it to Maps for the battery on"
                        + " arrival. The app restarts after a change.")
                        + (!untested ? "" : thai
                        ? "\n\nทดสอบแล้วเฉพาะ BYD Dolphin (DiLink 3) รถคันนี้ (" + modelText(host, true) + ") ยังไม่ได้ทดสอบ"
                        + " จึงปิดไว้ก่อน เปิดเองได้ แต่แบตที่เหลือเมื่อถึงปลายทางอาจคลาดเคลื่อน"
                        + " ไม่รองรับรถปลั๊กอินไฮบริด (DM-i)"
                        : "\n\nTested only on a BYD Dolphin (DiLink 3). This car (" + modelText(host, false) + ") is untested,"
                        + " so this starts off. You can turn it on, but the battery on arrival may be less accurate."
                        + " Plug-in hybrids (DM-i) are not supported.")
                        : (thai ? "Maps Car ไม่พบระบบรถ BYD จึงไม่ได้ส่งข้อมูลแบตให้ Maps ปิดได้ถ้าไม่ใช่รถ BYD"
                        : "Maps Car found no BYD vehicle system, so Maps gets no battery data. Turn this off on other cars."));
                show(intro, true);
                for (View view : new View[]{batteryDivider, battery, load, usage, detailsDivider, detailsToggle, details}) {
                    show(view, false);
                }
                return;
            }
            show(intro, false);
            long now = SystemClock.elapsedRealtime();
            boolean fresh = energyModel != null;
            long sampledAt = lastSampleAt, readAt = lastMapsReadAt;
            status.setText(fresh
                    ? readAt == 0 ? (thai ? "เปิด · รอ Maps อ่านข้อมูล" : "On · waiting for Maps to read")
                    : (thai ? "เปิด · Maps อ่านล่าสุด " : "On · Maps read it ") + ago(now - readAt, thai)
                    : sampledAt == 0 ? (thai ? "เปิด · รออ่านแบตเตอรี่จากรถ" : "On · waiting for the car's battery")
                    : (thai ? "เปิด · ไม่มีข้อมูลล่าสุด ถอนข้อมูลจาก Maps แล้ว" : "On · no recent reading, withdrawn from Maps"));
            BydVehicleModel.Status model = BydVehicleModel.status();
            BydVehicleEnergyFile file = energyFile;

            show(batteryDivider, true);
            show(battery, true);
            if (sampledAt == 0) {
                percent.setText("–");
                percent.setTextColor(secondary);
                energy.setText(thai ? "รออ่านแบตเตอรี่จากรถ" : "Waiting for the car's battery");
                show(batteryNote, false);
            } else {
                percent.setText(String.format(Locale.ROOT, "%.0f%%", sampleSoc));
                percent.setTextColor(fresh ? primary : secondary);
                // No-break spaces keep each number with its unit.
                energy.setText(String.format(Locale.ROOT, thai ? "%.1f จาก %.1f" + NBSP + "kWh" : "%.1f of %.1f" + NBSP + "kWh",
                        sampleEnergyWh / 1000.0, sampleCapacityWh / 1000.0));
                StringBuilder note = new StringBuilder();
                if (!fresh) note.append(thai ? "อ่านเมื่อ " : "read ").append(ago(now - sampledAt, thai));
                // The distance per 1% with the capacity Maps receives, the user's own rule of thumb.
                if (sampleCapacityWh > 0 && model.consumption > 0) {
                    join(note, String.format(Locale.ROOT, thai ? "≈ %.1f" + NBSP + "กม. ต่อ 1%%" : "≈ %.1f" + NBSP + "km per 1%%",
                            sampleCapacityWh / (model.consumption * 1000.0)));
                }
                if (sampleOutsideC != BydOutsideTemperature.UNAVAILABLE) {
                    join(note, String.format(Locale.ROOT, thai ? "นอกรถ %d" + NBSP + "°C" : "outside %d" + NBSP + "°C", sampleOutsideC));
                }
                batteryNote.setText(note);
                show(batteryNote, note.length() > 0);
            }

            show(load, file != null);
            if (file != null) {
                if (paintedLoad != loadKg) paintChips();
                String kg = thai ? NBSP + "กก." : NBSP + "kg";
                loadCaption.setText(loadKg == 0
                        ? (thai ? "น้ำหนักที่ Maps ใช้ " : "Maps uses ") + grouped(massKg(file)) + kg
                        + (thai ? " ตามตาราง BYD (รวมคนขับ)" : ", BYD's table (driver included)")
                        : (thai ? "น้ำหนักที่ Maps ใช้ " : "Maps uses ") + grouped(massKg(file)) + kg
                        + (thai ? " (ตาราง BYD " : " (BYD's table ") + grouped(file.fileMassKg) + " + " + loadKg + ")");
            }

            // The table is chosen with the first reading; until then nothing is known about the model.
            show(usage, energyFileChecked);
            if (file != null) {
                usageHeader.setText(thai ? "อัตรากินไฟที่วัดได้ · ใช้เทียบ" : "Measured consumption · for comparison");
                show(usageLine, false);
                show(bandTable, true);
                show(levelTable, true);
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
                usageCaption.setText(thai
                        ? "ตาราง BYD คิดบนทางราบ ค่าแยกตามความเร็วสะสมข้ามทริปทีละ 10 กม. ค่าต่อแบต 1% วัดทีละ 1% ที่ขับผ่านครบ"
                        + " ทั้งหมดไม่ได้ส่งให้ Maps"
                        : "BYD's table assumes a flat road. The speed bands pool across trips, 10 km at a time. Per 1% counts each"
                        + " whole percent driven through. None of this is sent to Maps.");
            } else {
                usageHeader.setText(thai ? "อัตรากินไฟที่ Maps ใช้" : "Consumption Maps uses");
                show(usageLine, true);
                show(bandTable, false);
                show(levelTable, false);
                usageLine.setText(String.format(Locale.ROOT, "%.1f" + NBSP + "kWh/100" + NBSP + "km · %s",
                        model.consumption, sourceText(model, thai)));
                // No-break spaces keep "5% per segment" on one line.
                usageCaption.setText(thai
                        ? "ปรับอัตโนมัติจากการขับต่อเนื่องช่วงละ 10 กม. และ 5 นาทีขึ้นไป ไม่เกิน" + NBSP + "5%" + NBSP + "ต่อช่วง"
                        : "Adjusted from continuous driving segments of 10 km and 5 minutes or more, at most 5%" + NBSP + "per" + NBSP + "segment.");
            }

            show(detailsDivider, true);
            show(detailsToggle, true);
            detailsToggle.setText((thai ? "รายละเอียด" : "Details") + (detailsOpen ? "  ▴" : "  ▾"));
            show(details, detailsOpen);
            if (detailsOpen) details.setText(detailsText(file, model, sampledAt, thai));
        }

        private void selectLoad(int preset) {
            BydVehicleEnergyFile file = energyFile;
            if (file == null || preset == loadKg) return;
            loadKg = preset;
            host.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit().putInt(KEY_LOAD, preset).apply();
            ReportLog.i(TAG, "load " + preset + " kg, mass " + massKg(file) + " kg from the next reading");
            update();
        }

        private void paintChips() {
            paintedLoad = loadKg;
            int ripple = withAlpha(primary, 0x29);
            for (int i = 0; i < chips.length; i++) {
                boolean selected = LOADS_KG[i] == loadKg;
                GradientDrawable shape = new GradientDrawable();
                shape.setCornerRadius(px(10));
                shape.setColor(selected ? withAlpha(accent, 0x38) : Color.TRANSPARENT);
                shape.setStroke(px(selected ? 2 : 1), selected ? accent : withAlpha(secondary, 0x80));
                // A transparent chip would mask the ripple to its outline, so the mask is solid.
                GradientDrawable mask = new GradientDrawable();
                mask.setCornerRadius(px(10));
                mask.setColor(Color.WHITE);
                chips[i].setBackground(new RippleDrawable(ColorStateList.valueOf(ripple), shape, mask));
                chips[i].setTypeface(selected ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
                chips[i].setSelected(selected);
            }
        }

        private CharSequence detailsText(BydVehicleEnergyFile file, BydVehicleModel.Status model, long sampledAt, boolean thai) {
            SpannableStringBuilder text = new SpannableStringBuilder();
            line(text, thai ? "รุ่นรถ BYD" : "BYD model", modelText(host, thai) + (testedModel(host)
                    ? (thai ? " · ทดสอบแล้ว (Dolphin)" : " · tested (Dolphin)") : (thai ? " · ยังไม่ได้ทดสอบ" : " · untested")));
            if (sampledAt != 0) {
                line(text, thai ? "ความจุแบตที่ส่งให้ Maps" : "Capacity sent to Maps", String.format(Locale.ROOT, "%.1f" + NBSP + "kWh",
                        sampleCapacityWh / 1000.0) + (Double.isNaN(model.measuredCapacity)
                        ? (thai ? " · ยังไม่ได้วัด (ต้องมี SOC 50% ขึ้นไป)" : " · not measured yet (needs 50% SOC or more)")
                        : String.format(Locale.ROOT, thai ? " · วัดได้ %.1f" + NBSP + "kWh (SOC 50%% ขึ้นไป)"
                        : " · measured %.1f" + NBSP + "kWh (50%% SOC or more)", model.measuredCapacity / 1000.0)));
            }
            if (energyFileChecked) {
                line(text, thai ? "แบบจำลองที่ Maps ใช้" : "Model Maps uses", file != null
                        ? String.format(Locale.ROOT, thai ? "ตาราง BYD %s (DiCarServer) · เลือกจากความจุ %.1f" + NBSP + "kWh"
                        : "BYD %s tables (DiCarServer) · chosen for %.1f" + NBSP + "kWh", file.table(), energyFileCapacityWh / 1000.0)
                        + (!sendsDolphinPower(file) ? "" : String.format(Locale.ROOT, thai
                        ? " · มอเตอร์ %d" + NBSP + "kW · ชาร์จ DC %d" + NBSP + "kW"
                        : " · motor %d" + NBSP + "kW · DC charging %d" + NBSP + "kW", PEAK_MOTOR_POWER_W / 1000, MAX_CHARGING_RATE_W / 1000))
                        : (thai ? "แบบสำรอง (ใช้ตาราง BYD ไม่ได้)" : "fallback (BYD's tables unavailable)"));
            }
            if (file != null && sampledAt != 0) {
                int outsideC = sampleOutsideC;
                Integer key = file.drainAtTimeKey(bydTemperature(file, outsideC));
                String tables = key == null ? "" : String.format(Locale.ROOT, thai ? " · ใช้ตารางชุด %d" + NBSP + "°C"
                        : " · %d" + NBSP + "°C tables", key);
                line(text, thai ? "อุณหภูมินอกรถ" : "Outside temperature", outsideC != BydOutsideTemperature.UNAVAILABLE
                        ? String.format(Locale.ROOT, "%d" + NBSP + "°C%s", outsideC, tables)
                        : String.format(Locale.ROOT, thai ? "อ่านไม่ได้ · ใช้ %d" + NBSP + "°C ของตาราง%s"
                        : "unavailable · the tables' %d" + NBSP + "°C%s", Math.round(file.fileExternalTemp), tables));
            }
            line(text, thai ? "การเรียนรู้" : "Learning", learningText(model.learning, thai));
            line(text, thai ? "ช่วงล่าสุดที่วัดได้" : "Last measured segment", Double.isNaN(model.lastWindow)
                    ? (thai ? "ยังไม่มี" : "none yet")
                    : String.format(Locale.ROOT, thai ? "%.1f kWh/100 km · %.1f" + NBSP + "กม. · %s" : "%.1f kWh/100 km · %.1f" + NBSP + "km · %s",
                    model.lastWindow, model.lastWindowMetres / 1000.0, model.lastWindowAccepted
                            ? (thai ? "นำมาเรียนรู้แล้ว" : "learned")
                            : (thai ? "ไม่ผ่านการตรวจ ไม่นำมาใช้" : "failed the checks, not used")));
            if (file != null) {
                BydSpeedBands.Status[] bands = BydSpeedBands.status();
                String[] names = thai ? new String[]{"ในเมือง", "ปานกลาง", "ทางหลวง", "แบต >90%"}
                        : new String[]{"city", "mixed", "highway", "above 90%"};
                StringBuilder done = new StringBuilder(), pooling = new StringBuilder();
                long rejected = 0;
                for (int i = 0; i < bands.length; i++) {
                    join(done, String.format(Locale.ROOT, thai ? "%s %d ช่วง %.0f" + NBSP + "กม." : "%s %d, %.0f" + NBSP + "km",
                            names[i], bands[i].pools, bands[i].totalKm));
                    join(pooling, String.format(Locale.ROOT, "%s %.1f", names[i], bands[i].poolKm));
                    rejected += bands[i].rejected;
                }
                if (rejected > 0) done.append(thai ? " · ไม่ผ่านการตรวจ " + rejected + " ช่วง" : " · " + rejected + " failed the checks");
                line(text, thai ? "ช่วงความเร็วที่วัดครบ" : "Speed-band pools", done.toString());
                line(text, thai ? "กำลังสะสม (จาก 10 กม.)" : "Pooling (of 10 km)", pooling.toString());
            }
            line(text, thai ? "ค่าเฉลี่ยจากรถ" : "Car's average", Double.isNaN(model.carTotal) && Double.isNaN(model.carRecent)
                    ? (thai ? "ไม่มีข้อมูล" : "unavailable")
                    : String.format(Locale.ROOT, thai ? "%s สะสม · %s ล่าสุด (kWh/100 km)" : "%s total · %s recent (kWh/100 km)",
                    number(model.carTotal), number(model.carRecent)));
            int start = text.length();
            if (file != null) {
                boolean dolphin = sendsDolphinPower(file);
                text.append(thai
                        ? "\nMaps คำนวณจากตาราง BYD ที่ความจุใกล้แบตของรถคันนี้ที่สุด (420_1, 81_1 หรือ 128_2) กับแบตเตอรี่"
                        + " อุณหภูมินอกรถและน้ำหนักที่เลือก" + (dolphin ? " รวมกำลังมอเตอร์และการชาร์จของ Dolphin" : "")
                        + " อัตรากินไฟที่วัดได้มาจากการขับต่อเนื่องช่วงละ 10 กม. และ 5 นาทีขึ้นไป ใช้เทียบเท่านั้น"
                        : "\nMaps computes from the BYD tables nearest this car's battery capacity (420_1, 81_1 or 128_2) with the"
                        + " battery, the outside temperature and the chosen load" + (dolphin ? ", and the Dolphin's motor power and"
                        + " charging rate" : "") + ". The measured consumption comes from continuous driving segments of 10 km"
                        + " and 5 minutes or more and is for comparison only.");
            } else {
                text.append(thai
                        ? "\nช่วงแรกๆ ปรับเร็ว จากนั้นปรับทีละน้อย ตรวจกับค่าเฉลี่ยของรถและความเร็วทุกช่วง"
                        : "\nQuick at first, then gradual; each segment is checked against the car's average and the speed.");
            }
            text.setSpan(new ForegroundColorSpan(secondary), start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
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

        private LinearLayout section(String title) {
            LinearLayout section = vertical();
            section.setPadding(px(24), px(16), px(24), 0);
            TextView header = text(14, accent, true);
            header.setText(title);
            header.setPadding(0, 0, 0, px(4));
            section.addView(header);
            content.addView(section);
            return section;
        }

        private View divider() {
            View divider = new View(themed);
            divider.setBackgroundColor(withAlpha(secondary, 0x40));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, Math.max(1, px(1)));
            params.setMargins(px(24), px(4), px(24), px(4));
            divider.setLayoutParams(params);
            return divider;
        }

        private TextView text(int sp, int color, boolean bold) {
            TextView view = new TextView(themed);
            view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
            view.setTextColor(color);
            if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
            return view;
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
            TypedValue ripple = new TypedValue();
            if (themed.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
                view.setBackgroundResource(ripple.resourceId);
            }
        }

        private int themeColor(int attribute, int fallback) {
            TypedValue value = new TypedValue();
            if (!themed.getTheme().resolveAttribute(attribute, value, true)) return fallback;
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT && value.type <= TypedValue.TYPE_LAST_COLOR_INT) return value.data;
            try {
                if (value.resourceId != 0) return themed.getColorStateList(value.resourceId).getDefaultColor();
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "Dialog color " + attribute + " unavailable", error);
            }
            return fallback;
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

        private static void show(View view, boolean visible) {
            int visibility = visible ? View.VISIBLE : View.GONE;
            if (view.getVisibility() != visibility) view.setVisibility(visibility);
        }

        private static void join(StringBuilder text, String part) {
            if (text.length() > 0) text.append(" · ");
            text.append(part);
        }

        private static int withAlpha(int color, int alpha) {
            return color & 0x00FFFFFF | alpha << 24;
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
        new AlertDialog.Builder(activity)
                .setTitle(comparison ? (thai ? "ล้างค่าที่วัดได้?" : "Reset the measured values?")
                        : (thai ? "ล้างค่าที่เรียนรู้?" : "Reset learning?"))
                .setMessage(comparison
                        ? (thai
                        ? "อัตรากินไฟที่วัดได้และค่าแยกตามความเร็วจะเริ่มใหม่จากค่าเฉลี่ยของรถ ความจุที่วัดได้ยังเก็บไว้ สิ่งที่ส่งให้ Maps ไม่เปลี่ยน"
                        : "The measured consumption and the speed bands start again from the car's average. The measured "
                        + "capacity is kept. What Maps receives does not change.")
                        : thai
                        ? "อัตรากินไฟที่เรียนรู้จะเริ่มใหม่จากค่าเฉลี่ยของรถ ความจุที่วัดได้ยังเก็บไว้ Maps จะได้ค่าใหม่ในการอ่านแบตครั้งถัดไป"
                        : "The learned consumption starts again from the car's average. The measured capacity is kept. "
                        + "Maps gets the new value with the next battery reading.")
                .setPositiveButton(thai ? "ล้างค่า" : "Reset", (dialog, which) -> {
                    try {
                        BydVehicleModel.resetLearning();
                        BydSpeedBands.reset();
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
        new AlertDialog.Builder(activity)
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
     * The stored choice; without one, on for the tested Dolphin (model id 186) with the BYD SDK and off
     * on other BYD models, which are untested.
     */
    private static boolean isEnabled(Context context) {
        boolean byDefault = isByd() && hasBydSdk() && testedModel(context);
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

    private static boolean isByd() {
        return startsByd(Build.MANUFACTURER) || startsByd(Build.BRAND) || startsByd(Build.MODEL);
    }

    private static boolean startsByd(String value) {
        return value != null && value.regionMatches(true, 0, "BYD", 0, 3);
    }

    /** A BYD with the BYD SDK that is not the tested Dolphin: the battery is off by default there. */
    private static boolean untestedByd(Context context) {
        return isByd() && hasBydSdk() && !testedModel(context);
    }

    private static boolean testedModel(Context context) {
        return modelId(context) == DOLPHIN_MODEL_ID;
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
        ReportLog.i(TAG, id == MODEL_UNKNOWN ? "BYD model id unknown, untested"
                : "BYD model id " + id + " (" + source + ")" + (id == DOLPHIN_MODEL_ID ? ", the tested Dolphin" : ", untested"));
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
            return "BYD, model id " + (id == MODEL_UNKNOWN ? "unknown" : Integer.toString(id))
                    + (id == DOLPHIN_MODEL_ID ? " (the tested Dolphin)" : " (untested)")
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
                .put("model_id", id == MODEL_UNKNOWN ? JSONObject.NULL : id)
                .put("model_id_source", bydModelSource)
                .put("tested_model", id == DOLPHIN_MODEL_ID)
                .put("vehicle_type", vehicleType == null || vehicleType.isEmpty() ? JSONObject.NULL : vehicleType)
                .put("firmware", firmware != null ? firmware : JSONObject.NULL);
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
                .put("soc", sampled ? sampleSoc : JSONObject.NULL)
                .put("energy_wh", sampled ? sampleEnergyWh : JSONObject.NULL)
                .put("capacity_wh", sampled ? sampleCapacityWh : JSONObject.NULL)
                .put("model_source", !on || !energyFileChecked ? "none" : file != null ? "byd_file" : "fallback")
                .put("table", file != null ? file.table() : JSONObject.NULL)
                .put("mass_kg", file != null ? massKg(file) : JSONObject.NULL)
                .put("load_kg", on ? loadKg : JSONObject.NULL)
                .put("peak_motor_power_w", dolphin ? PEAK_MOTOR_POWER_W : JSONObject.NULL)
                .put("max_charging_rate_w", dolphin ? MAX_CHARGING_RATE_W : JSONObject.NULL)
                .put("outside_c", sampled && outsideC != BydOutsideTemperature.UNAVAILABLE ? outsideC : JSONObject.NULL)
                .put("last_reading_age_s", sampled ? (now - sampledAt) / 1000 : JSONObject.NULL)
                .put("last_maps_read_age_s", on && readAt != 0 ? (now - readAt) / 1000 : JSONObject.NULL)
                .put("learned_kwh_100km", Double.isNaN(learned) ? JSONObject.NULL : learned);
    }
}
