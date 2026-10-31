package com.dhuadapter;

import android.util.Log;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;

/**
 * Configuration loader for DHU Adapter.
 * Config is baked into the APK at patch time (assets/dhu-adapter-config.json);
 * falls back to built-in defaults. No external/shared config files.
 */
public final class DhuConfig {

    private static final String TAG = "DhuAdapter";
    private static final String ASSETS_CONFIG = "dhu-adapter-config.json";

    // Display — two-DPI approach:
    //   metricsDpi drives RENDERING (getDisplayMetrics/getMetrics) — larger UI
    //   configDpi  drives LAYOUT (getConfiguration) — more dp width so elements fit
    // On 2560×1600: metricsDpi 280 (×1.75 render) + configDpi 240 (1707dp layout).
    public int metricsDpi = 280;
    public int configDpi = 280;

    // Legacy single-DPI field (migration default for metricsDpi on old configs)
    public int targetDpi = 280;

    // ── Category master flags ───────────────────────────────────────────────
    // Category 1 — Display/UI (density, orientation, fullscreen, corners, back
    // button, padding, font, WebView). The ONE category ON by default; every
    // other category is opt-in. Set false (--no-display) to ship a bare shell.
    public boolean display = true;

    // Category 2 — Root detection bypass (Build.TAGS, File.exists, Runtime.exec,
    // ProcessBuilder, PackageManager + root SystemProperties). Needed by apps
    // that refuse to run on rooted/userdebug head units (e.g. Apple Music).
    public boolean rootBypass = false;

    // Category 3 — Emulator detection bypass (Build.* de-genericising + qemu/
    // goldfish SystemProperties). Only relevant when running on an emulator; on
    // a real head unit it is dead weight, so OFF by default.
    public boolean emulatorBypass = false;

    // Category 4 — Automotive fixes (CommonUtils.isAutomotiveOS→false [Waze
    // white-screen] + androidx.car.app.connection query→NOT_CONNECTED [block
    // the Android Auto overlay]).
    public boolean automotiveFix = false;

    // Category 5b — SIM-gate (TelephonyManager.getSimState→READY +
    // key_use_cellular_data pref→true). Split out of networkBypass: faking a SIM
    // is harmful to apps that behave differently with a SIM present (phone-number
    // registration). Enable only for apps that gate connectivity on SIM state.
    public boolean simReady = false;

    // Category 9 — Signature spoof (--copy-sign). Feeds the app's GENUINE signing
    // certificate (preserved at patch time as assets/orig-cert.der, extracted from
    // the stock APK) to SigningInfo.getApkContentsSigners / getPackageInfo, so an
    // in-app "is my signature the real Play cert?" self-check passes even though
    // the APK is re-signed with a debug key. No cert bytes are hardcoded — the
    // genuine PKCS#7 block is read from the APK's own assets at runtime.
    public boolean copySign = false;

    // Category 1 (phone-UI width cap) — the ultrawide DHU (2560px) makes the
    // framework pick TABLET resource buckets (values-sw600dp/w640dp → is_tablet,
    // multiply_tablet_layout_enabled) and apps take widescreen layouts (oversized
    // album Play button, iPad-style bottom bar, bloated dialogs). We only fixed
    // densityDpi before, not screenWidthDp — so cap the width the framework uses
    // to SELECT resources back into phone range.
    public boolean phoneUi = false;         // master switch for the width cap (opt-in: --phone-ui)
    public int     widthDpCap = 411;        // cap screenWidthDp/smallestScreenWidthDp
                                            //  <600 → is_tablet=false, <640 → no tablet-multiply
                                            //  411 = Pixel-class; tune 411..599
    public boolean capMetricsWidth = true;  // also lower DisplayMetrics.widthPixels so
                                            //  widthPixels-based code (useWidescreenLayout)
                                            //  goes phone → fixes the Play button

    // Font scale multiplier (used by scaledDensity(), default 1.5 = 150% text)
    public float fontScale = 1.5f;

    // Orientation
    public boolean forceOrientation = true;

    // Back button
    public boolean backButtonEnabled = true;
    public int backButtonSize = 48;    // dp
    public float backButtonAlpha = 0.5f;
    // Circle color of the floating button (ARGB). Default: Material Green 500.
    public int backButtonColor = 0xFF4CAF50;
    // onlySettings=true: the button carries NO "back" functionality — tap (or
    // long-press) opens the settings menu; it renders the current metricsDpi
    // as digits instead of the arrow. Default false (tap = back).
    public boolean backButtonOnlySettings = false;

    // Rounded corners
    public boolean roundedCornersEnabled = true;
    public int roundedCornersRadius = 16; // dp

    // Fullscreen
    public boolean fullscreen = false;

    // Font override (asset path relative to assets/fonts/, null = no override)
    public String fontOverride = null;

    // WebView User-Agent override — fixes a blank map on DHU where some map/tile
    // servers reject the default WebView UA. null = leave default.
    public String userAgentOverride =
            "Mozilla/5.0 (Linux; Android 13; Pixel 5) AppleWebKit/537.36 "
            + "(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36";

    // Debug logging
    public boolean debug = false;

    // Network connectivity bypass — force apps to see the network as connected.
    // Needed on some DHUs where the app misdetects Ethernet/TBOX connectivity
    // as offline. HARMFUL on DHUs that ARE online (the app shows an
    // "offline" state / album art fails) because the forced Java-layer values
    // desync from the native network stack. Default OFF; enable only for apps
    // that genuinely misdetect connectivity.
    public boolean networkBypass = false;

    // Allow screen capture — strips FLAG_SECURE (SurfaceView/SurfaceControl
    // setSecure, Window add/setFlags) so the app's screen can be captured /
    // mirrored where the app itself marks its window secure and would otherwise
    // block it (blank frame).
    public boolean allowCapture = false;

    // Media bridge — register the app's MediaSession with Zeekr MediaCenter
    // (steering-wheel track control, cover art, metadata). Default OFF: only
    // enable for actual media/music apps, never for
    // navigation/utilities. Even if enabled, the bridge only binds once the app
    // publishes an active MediaSession.
    public boolean mediaBridge = false;

    // Morphe build: the app's own android:appComponentFactory, replaced by
    // DhuAdapterFactory in the manifest; DhuAdapterFactory forwards to it.
    public String delegateAppComponentFactory = null;

    // Computed helpers
    public float density() {
        return metricsDpi / 160f;
    }

    public float scaledDensity() {
        return density();
    }

    private DhuConfig() {}

    /**
     * Load the embedded config directly from the APK zip (assets/…). Usable in
     * AppComponentFactory.instantiateApplication where Application.getAssets()
     * isn't ready yet. apkPath comes from ApplicationInfo.sourceDir.
     */
    public static DhuConfig loadFromApk(String apkPath) {
        if (apkPath == null) {
            Log.i(TAG, "No apkPath — using defaults");
            return new DhuConfig();
        }
        String jsonStr = null;
        try (java.util.zip.ZipFile zf = new java.util.zip.ZipFile(apkPath)) {
            java.util.zip.ZipEntry e = zf.getEntry("assets/" + ASSETS_CONFIG);
            if (e != null) {
                java.io.InputStream is = zf.getInputStream(e);
                java.io.ByteArrayOutputStream bos = new java.io.ByteArrayOutputStream();
                byte[] tmp = new byte[4096];
                int n;
                while ((n = is.read(tmp)) > 0) {
                    bos.write(tmp, 0, n);
                }
                is.close();
                jsonStr = new String(bos.toByteArray(), StandardCharsets.UTF_8);
                Log.i(TAG, "Config loaded from APK assets/" + ASSETS_CONFIG);
            }
        } catch (Exception ex) {
            Log.w(TAG, "loadFromApk failed: " + ex);
        }
        return parseOrDefault(jsonStr);
    }

    /**
     * Load config. Assets-only: the config is baked into the APK at patch time
     * (assets/dhu-adapter-config.json), so each patched app carries its own
     * flags. No external paths — nothing shared across apps, nothing to push.
     */
    public static DhuConfig load() {
        return load(null);
    }

    /**
     * Load config with Application context for assets read.
     * Priority: assets/dhu-adapter-config.json > built-in defaults.
     */
    public static DhuConfig load(android.content.Context context) {
        DhuConfig cfg = new DhuConfig();
        String jsonStr = null;

        // Embedded config only — baked in at patch time. Per-app, no external
        // /sdcard or /data/local/tmp overrides (those were global and leaked
        // one app's flags onto every patched app).
        if (context != null) {
            try {
                java.io.InputStream is = context.getAssets().open(ASSETS_CONFIG);
                byte[] buf = new byte[is.available()];
                is.read(buf);
                is.close();
                jsonStr = new String(buf, StandardCharsets.UTF_8);
                Log.i(TAG, "Config loaded from assets/" + ASSETS_CONFIG);
            } catch (Exception e) {
                Log.i(TAG, "No config in assets, using defaults");
            }
        }

        return parseOrDefault(jsonStr);
    }

    /**
     * Apply the user-tuned runtime overrides persisted by the in-app settings
     * panel (BackButtonOverlay) on top of the embedded config. Called once from
     * the early display hooks (attachBaseContext / callApplicationOnCreate) —
     * at instantiateApplication time the Application context is NOT yet
     * attached, so SharedPreferences can't be read there. Retried on every
     * early hook invocation until one succeeds (once = flag below); values
     * changed in the settings menu thus survive app restarts. Only keys the
     * user actually changed are applied; everything is clamped to a safe range.
     */
    public void applyRuntimeOverrides(android.content.Context ctx) {
        if (ctx == null || runtimeOverridesLoaded) return;
        try {
            android.content.SharedPreferences p = ctx.getSharedPreferences(
                    BackButtonOverlay.PREFS_NAME, android.content.Context.MODE_PRIVATE);
            if (p.contains(BackButtonOverlay.KEY_METRICS_DPI)) {
                metricsDpi = clamp(p.getInt(BackButtonOverlay.KEY_METRICS_DPI, metricsDpi), 160, 640);
            }
            if (p.contains(BackButtonOverlay.KEY_CONFIG_DPI)) {
                configDpi = clamp(p.getInt(BackButtonOverlay.KEY_CONFIG_DPI, configDpi), 160, 640);
            }
            if (p.contains(BackButtonOverlay.KEY_SIZE_DP)) {
                backButtonSize = clamp(p.getInt(BackButtonOverlay.KEY_SIZE_DP, backButtonSize), 24, 128);
            }
            if (p.contains(BackButtonOverlay.KEY_ALPHA)) {
                backButtonAlpha = clamp(p.getFloat(BackButtonOverlay.KEY_ALPHA, backButtonAlpha), 0.05f, 1.0f);
            }
            if (p.contains(BackButtonOverlay.KEY_COLOR)) {
                backButtonColor = p.getInt(BackButtonOverlay.KEY_COLOR, backButtonColor);
            }
            // Mark loaded ONLY on success — if the context wasn't attached yet
            // (getSharedPreferences threw), a later early hook retries.
            runtimeOverridesLoaded = true;
            Log.i(TAG, "Runtime overrides applied: metricsDpi=" + metricsDpi
                    + " configDpi=" + configDpi
                    + " sizeDp=" + backButtonSize
                    + " alpha=" + backButtonAlpha);
        } catch (Exception e) {
            Log.w(TAG, "applyRuntimeOverrides failed (will retry): " + e);
        }
    }

    /** Set once applyRuntimeOverrides has successfully read the prefs. */
    private boolean runtimeOverridesLoaded = false;

    private static int clamp(int v, int min, int max) {
        return v < min ? min : (v > max ? max : v);
    }

    private static float clamp(float v, float min, float max) {
        return v < min ? min : (v > max ? max : v);
    }

    /** Parse a config JSON string into a DhuConfig, or defaults if null/invalid. */
    private static DhuConfig parseOrDefault(String jsonStr) {
        DhuConfig cfg = new DhuConfig();
        if (jsonStr == null) {
            Log.i(TAG, "Using default config (metricsDpi=" + cfg.metricsDpi + ")");
            return cfg;
        }

        try {
            JSONObject json = new JSONObject(jsonStr);

            cfg.targetDpi = json.optInt("targetDpi", cfg.targetDpi);
            // Two-DPI: default metricsDpi to targetDpi for old configs
            cfg.metricsDpi = json.optInt("metricsDpi", cfg.targetDpi);
            cfg.configDpi = json.optInt("configDpi", cfg.configDpi);
            cfg.fontScale = (float) json.optDouble("fontScale", cfg.fontScale);
            cfg.forceOrientation = json.optBoolean("forceOrientation", cfg.forceOrientation);
            cfg.fullscreen = json.optBoolean("fullscreen", cfg.fullscreen);
            cfg.debug = json.optBoolean("debug", cfg.debug);
            cfg.mediaBridge = json.optBoolean("mediaBridge", cfg.mediaBridge);
            cfg.networkBypass = json.optBoolean("networkBypass", cfg.networkBypass);
            cfg.allowCapture = json.optBoolean("allowCapture", cfg.allowCapture);
            cfg.display = json.optBoolean("display", cfg.display);
            cfg.rootBypass = json.optBoolean("rootBypass", cfg.rootBypass);
            cfg.emulatorBypass = json.optBoolean("emulatorBypass", cfg.emulatorBypass);
            cfg.automotiveFix = json.optBoolean("automotiveFix", cfg.automotiveFix);
            cfg.simReady = json.optBoolean("simReady", cfg.simReady);
            cfg.copySign = json.optBoolean("copySign", cfg.copySign);
            cfg.phoneUi = json.optBoolean("phoneUi", cfg.phoneUi);
            cfg.widthDpCap = json.optInt("widthDpCap", cfg.widthDpCap);
            cfg.capMetricsWidth = json.optBoolean("capMetricsWidth", cfg.capMetricsWidth);

            if (!json.isNull("delegateAppComponentFactory")) {
                cfg.delegateAppComponentFactory = json.optString("delegateAppComponentFactory", null);
            }
            if (!json.isNull("fontOverride")) {
                cfg.fontOverride = json.optString("fontOverride", null);
            }
            if (json.has("userAgentOverride")) {
                if (json.isNull("userAgentOverride")) {
                    cfg.userAgentOverride = null;
                } else {
                    cfg.userAgentOverride = json.optString("userAgentOverride", cfg.userAgentOverride);
                }
            }

            JSONObject bb = json.optJSONObject("backButton");
            if (bb != null) {
                cfg.backButtonEnabled = bb.optBoolean("enabled", cfg.backButtonEnabled);
                cfg.backButtonSize = bb.optInt("sizeDp", bb.optInt("size", cfg.backButtonSize));
                cfg.backButtonAlpha = (float) bb.optDouble("alpha", cfg.backButtonAlpha);
                if (!bb.isNull("color")) {
                    String col = bb.optString("color", null);
                    if (col != null && !col.isEmpty()) {
                        try {
                            String hex = col.startsWith("#") ? col.substring(1) : col;
                            cfg.backButtonColor = (int) (0xFF000000L | Long.parseLong(hex, 16));
                        } catch (Exception ignore) { /* keep default color */ }
                    }
                }
                cfg.backButtonOnlySettings = bb.optBoolean("onlySettings", cfg.backButtonOnlySettings);
            }

            JSONObject rc = json.optJSONObject("roundedCorners");
            if (rc != null) {
                cfg.roundedCornersEnabled = rc.optBoolean("enabled", cfg.roundedCornersEnabled);
                cfg.roundedCornersRadius = rc.optInt("radiusDp", rc.optInt("radius", cfg.roundedCornersRadius));
            }

            Log.i(TAG, "Config loaded: targetDpi=" + cfg.targetDpi
                    + " forceOrientation=" + cfg.forceOrientation
                    + " fullscreen=" + cfg.fullscreen
                    + " debug=" + cfg.debug);
        } catch (Exception e) {
            Log.e(TAG, "Failed to parse config, using defaults", e);
        }
        return cfg;
    }
}
