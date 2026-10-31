package com.dhuadapter;

import android.app.Activity;
import android.app.AppComponentFactory;
import android.app.Application;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ContentProvider;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

import com.dhuadapter.automotive.AutomotiveHooks;
import com.dhuadapter.core.AssetLibLoader;
import com.dhuadapter.capture.CaptureHooks;
import com.dhuadapter.core.HookEnv;
import com.dhuadapter.display.DisplayHooks;
import com.dhuadapter.display.LifecycleHooks;
import com.dhuadapter.emulator.EmulatorBypass;
import com.dhuadapter.mediabridge.MediaSessionHooks;
import com.dhuadapter.network.NetworkBypass;
import com.dhuadapter.network.SimGate;
import com.dhuadapter.root.RootBypass;
import com.dhuadapter.signature.SignatureSpoof;
import com.dhuadapter.sysprops.SystemPropertiesSpoof;

import top.canyie.pine.Pine;
import top.canyie.pine.PineConfig;

/**
 * DHU Adapter — AppComponentFactory that hooks Android internals via Pine to
 * adapt phone apps for an Android 12 DHU (2560×1600 @ 160dpi → target 280dpi).
 *
 * No root, no Xposed, no native code — pure Java + Pine inline hooking.
 *
 * This class is a thin ORCHESTRATOR: it loads the embedded config, populates
 * {@link HookEnv}, then calls each feature category's installer. Every hook
 * lives in its own package (display / capture / automotive / root / emulator /
 * sysprops / network / mediabridge), gated by an explicit config flag. Only
 * Category 1 (Display/UI) is ON by default.
 *
 * Declare in AndroidManifest.xml:
 *   <application android:appComponentFactory="com.dhuadapter.DhuAdapterFactory" ...>
 *
 * Morphe build: the app's own factory (if it declared one) is stored by the
 * patch in the embedded config as "delegateAppComponentFactory"; every
 * instantiate* call is forwarded to it so the app keeps its own component
 * construction (e.g. androidx CoreComponentFactory or a DI factory).
 */
public class DhuAdapterFactory extends AppComponentFactory {

    private static final String TAG = "DhuAdapter";

    // APK path captured in instantiateClassLoader (fires before
    // instantiateApplication) so we can read the embedded config from the APK
    // zip directly — Application.getAssets() isn't usable that early.
    private static String apkSourceDir;
    private static String dataDir;

    // The app's original AppComponentFactory, resolved from the embedded config.
    private AppComponentFactory delegate;
    private boolean delegateResolved;

    // Added in API 29; the framework only calls it there.
    @android.annotation.TargetApi(29)
    @Override
    public ClassLoader instantiateClassLoader(ClassLoader cl,
            android.content.pm.ApplicationInfo aInfo) {
        try {
            if (aInfo != null && aInfo.sourceDir != null) {
                apkSourceDir = aInfo.sourceDir;
            }
            if (aInfo != null && aInfo.dataDir != null) {
                dataDir = aInfo.dataDir;
            }
        } catch (Throwable t) {
            // best-effort
        }
        AppComponentFactory d = delegate(cl);
        return d != null ? d.instantiateClassLoader(cl, aInfo)
                : super.instantiateClassLoader(cl, aInfo);
    }

    private AppComponentFactory delegate(ClassLoader cl) {
        if (delegateResolved) return delegate;
        delegateResolved = true;
        if (HookEnv.config == null) {
            if (HookEnv.config == null) {
            HookEnv.config = DhuConfig.loadFromApk(apkSourceDir);
        }
        }
        String name = HookEnv.config.delegateAppComponentFactory;
        if (name == null || name.isEmpty() || name.equals(getClass().getName())) return null;
        try {
            ClassLoader loader = cl != null ? cl : getClass().getClassLoader();
            delegate = (AppComponentFactory) Class.forName(name, true, loader)
                    .getDeclaredConstructor().newInstance();
            Log.i(TAG, "Delegating to original AppComponentFactory " + name);
        } catch (Throwable t) {
            Log.e(TAG, "Original AppComponentFactory " + name + " unavailable", t);
        }
        return delegate;
    }

    @Override
    public Activity instantiateActivity(ClassLoader cl, String className, Intent intent)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        AppComponentFactory d = delegate(cl);
        return d != null ? d.instantiateActivity(cl, className, intent)
                : super.instantiateActivity(cl, className, intent);
    }

    @Override
    public BroadcastReceiver instantiateReceiver(ClassLoader cl, String className, Intent intent)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        AppComponentFactory d = delegate(cl);
        return d != null ? d.instantiateReceiver(cl, className, intent)
                : super.instantiateReceiver(cl, className, intent);
    }

    @Override
    public Service instantiateService(ClassLoader cl, String className, Intent intent)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        AppComponentFactory d = delegate(cl);
        return d != null ? d.instantiateService(cl, className, intent)
                : super.instantiateService(cl, className, intent);
    }

    @Override
    public ContentProvider instantiateProvider(ClassLoader cl, String className)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        AppComponentFactory d = delegate(cl);
        return d != null ? d.instantiateProvider(cl, className)
                : super.instantiateProvider(cl, className);
    }

    // ────────────────────────────────────────────────────────────────
    //  Entry point — called BEFORE Application.onCreate()
    // ────────────────────────────────────────────────────────────────

    @Override
    public Application instantiateApplication(ClassLoader cl, String className)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {

        Log.i(TAG, "=== DHU Adapter initializing (pre-Application) ===");
        Log.i(TAG, "Build: " + Build.DISPLAY + ", SDK " + Build.VERSION.SDK_INT);

        // Create the real Application FIRST so we have a Context to read the
        // embedded assets/dhu-adapter-config.json. Application.onCreate has NOT
        // run yet (it fires after instantiateApplication returns), so installing
        // hooks after this point is still "pre-onCreate" — no behavior change,
        // but now config is the real embedded one, not defaults.
        AppComponentFactory d = delegate(cl);
        Application app = d != null ? d.instantiateApplication(cl, className)
                : super.instantiateApplication(cl, className);

        // Populate the shared hook environment (approach A: static holder).
        HookEnv.appContext = app;
        HookEnv.classLoader = getClass().getClassLoader();
        HookEnv.apkSourceDir = apkSourceDir;
        // Read the embedded config from the APK zip directly (apkSourceDir was
        // captured in instantiateClassLoader). Application.getAssets() isn't
        // usable this early, so we don't rely on it.
        if (HookEnv.config == null) {
            HookEnv.config = DhuConfig.loadFromApk(apkSourceDir);
        }
        // NOTE: runtime overrides from the settings panel are NOT loaded here —
        // the Application context isn't attached yet (attachBaseContext runs
        // later), so SharedPreferences can't be read at this point. They are
        // applied in DisplayHooks.installEarlyDensityPoints, at the earliest
        // hook where a working context exists, BEFORE pushMetrics.
        DhuConfig config = HookEnv.config;

        // Pine init — PineConfig.debug MUST stay false. It enables Pine's own
        // INTERNAL logging, which formats every bridged call via String.format;
        // that initialises the locale → TimeZone.getDefault() →
        // SystemProperties.get("persist.sys.timezone"), which we hook, so Pine.log
        // re-enters the hook → unbounded recursion → SIGSEGV (the Telegram crash).
        // false breaks the cycle; debuggable (hook/JIT mechanics only, no logging)
        // still tracks config.debug.
        PineConfig.debug = false;
        PineConfig.debuggable = config.debug;
        // Morphe build: libpine.so ships as an asset, not in lib/<abi>/.
        PineConfig.libLoader = new AssetLibLoader(apkSourceDir, dataDir);

        Log.i(TAG, "Density mode: metricsDpi=" + config.metricsDpi
                + " configDpi=" + config.configDpi);

        // Morphe build: initialise Pine up front. If libpine.so cannot be loaded
        // (e.g. an x86 device, the patch ships arm64-v8a / armeabi-v7a only) the
        // hooks are skipped instead of crashing the app on start.
        boolean pineReady;
        try {
            Pine.ensureInitialized();
            pineReady = true;
        } catch (Throwable t) {
            pineReady = false;
            Log.e(TAG, "Pine unavailable, framework hooks NOT installed", t);
        }

        if (pineReady) {
            installHooks(config);
            Log.i(TAG, "All hooks installed (two-DPI: render "
                    + config.metricsDpi + " / layout " + config.configDpi + ")");
        }

        // ── Category 1 (window chrome): fullscreen + rounded corners + back button ──
        if (config.display) {
            LifecycleHooks.register(app);
        }
        return app;
    }

    private static void installHooks(DhuConfig config) {
        // ── Category 1: Display / UI (default ON; --no-display to disable) ──
        if (config.display) {
            DisplayHooks.install();
        } else {
            Log.i(TAG, "Display/UI category disabled (config.display=false)");
        }
        // ── Category 7: Capture (gate: config.allowCapture) ──
        CaptureHooks.install();
        // ── Category 6: MediaCenter (gate: config.mediaBridge) ──
        MediaSessionHooks.install();
        // ── Category 4: Automotive (gate: config.automotiveFix) ──
        AutomotiveHooks.install();
        // ── Category 2: Root bypass (gate: config.rootBypass) ──
        RootBypass.install();
        // ── Category 3: Emulator bypass (gate: config.emulatorBypass) ──
        EmulatorBypass.install();
        // ── Categories 2+3 shared: SystemProperties spoof (root||emulator) ──
        SystemPropertiesSpoof.install();
        // ── Category 5a: Network systemic bypass (gate: config.networkBypass) ──
        NetworkBypass.install();
        // ── Category 5b: SIM-gate (gate: config.simReady) ──
        SimGate.install();
        // ── Category 9: Signature spoof (gate: config.copySign) ──
        SignatureSpoof.install();

        // Install shared framework hooks ONCE, after every category has registered
        // its transforms (e.g. Configuration.updateFrom: Cat.1 density + Cat.4 deCar).
        com.dhuadapter.core.SharedHooks.installAll();
    }
}
