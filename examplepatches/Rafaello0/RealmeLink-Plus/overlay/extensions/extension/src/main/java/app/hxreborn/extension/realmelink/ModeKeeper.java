/*
 * Copyright (C) 2026 realme Link mode-memory patch contributors.
 * SPDX-License-Identifier: GPL-3.0-only
 * Never writes firmware/OTA data. Works through the app's existing SettingsInfo contract.
 */
package app.hxreborn.extension.realmelink;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Fail-closed mode memory. Never guesses a SettingsInfo type, key or mode value.
 * On a manual UI write, learns the exact (type,key,value) tuple already sent by realme Link.
 * Upon a later connection, reads it back using the normal proxy callback and writes once
 * only if the actual value differs. An unknown/missing callback is NOT treated as success.
 */
public final class ModeKeeper {
    private static final String TAG = "RLM-Modes";
    private static final String STORE = "rlm_mode_memory_v1";
    private static final String SETTING = "com.realme.iot.headset.contract.bean.SettingsInfo";
    private static final String MANAGER = "com.realme.iot.headset.manager.HeadsetManager";
    private static final long UI_WINDOW_MS = 1600L;
    private static final long RECHECK_COOLDOWN_MS = 7000L;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadLocal<UiTag> ACTION = new ThreadLocal<>();
    private static final Map<String, Long> LAST_PROBE = new HashMap<>();
    private static final Map<String, Long> LAST_WRITE = new HashMap<>();
    private static volatile Context context;
    private static volatile boolean noiseEnabled;
    private static volatile boolean gameEnabled;
    private static volatile Object lastDevice;

    private ModeKeeper() { }

    public static void initialize(Object maybeApp) {
        if (maybeApp instanceof Context) {
            Context c = (Context) maybeApp;
            context = c.getApplicationContext() != null ? c.getApplicationContext() : c;
            log("runtime attached to realme Link");
        }
    }

    public static void enableNoiseControl() {
        noiseEnabled = true;
    }

    public static void enableGameMode() {
        gameEnabled = true;
    }

    private static final class UiTag {
        final String type;
        final long at;
        UiTag(String type, long at) { this.type = type; this.at = at; }
    }

    private static final class Desired {
        final String mode;
        final String mac;
        final int type;
        final int key;
        final int value;
        Desired(String mode, String mac, int type, int key, int value) {
            this.mode = mode; this.mac = mac;
            this.type = type; this.key = key; this.value = value;
        }
    }

    /** Only called by the UI event handlers from the exact verified APK version. */
    public static void markUiAction(Object activity, Object item) {
        if (!(activity instanceof Context) || item == null) return;
        String category = classifyItem((Context) activity, item);
        if (("anc".equals(category) && noiseEnabled) ||
                ("game".equals(category) && gameEnabled)) {
            ACTION.set(new UiTag(category, SystemClock.uptimeMillis()));
            log("user initiated " + category + " action");
        } else {
            ACTION.remove();
        }
    }

    /**
     * Called before HeadsetManagerProxy.J3. The original J3 is never suppressed.
     * Capture is allowed ONLY after a recognized, recent, same-thread user action.
     */
    public static void observeWrite(Object device, Object settings) {
        UiTag tag = ACTION.get();
        ACTION.remove();
        if (tag == null || SystemClock.uptimeMillis() - tag.at > UI_WINDOW_MS) return;
        if (!calledFromHeadsetUi()) return;
        String mac = mac(device);
        Context c = context;
        if (mac == null || c == null || settings == null) return;
        int type = intGetter(settings, "getSettingType", -1);
        int key = intGetter(settings, "getSettingKey", -1);
        int value = intGetter(settings, "getSettingValue", Integer.MIN_VALUE);
        if (type < 0 || key < 0 || value == Integer.MIN_VALUE) return;
        // These sanity limits are about setting payload size, not guessed wire meanings.
        if ("game".equals(tag.type) && value != 0 && value != 1) {
            log("skip non-boolean Game Mode value " + value); return;
        }
        String id = preferenceId(mac, tag.type);
        boolean stored = c.getSharedPreferences(STORE, Context.MODE_PRIVATE).edit()
            .putInt(id + ".type", type)
            .putInt(id + ".key", key)
            .putInt(id + ".value", value)
            .putBoolean(id + ".valid", true)
            .commit();
        if (stored) {
            lastDevice = device;
            log("remembered " + tag.type + " type=" + type + " key=" + key + " value=" + value);
        } else {
            Log.w(TAG, "Failed to persist manual selection");
        }
    }

    public static void onConnection(Object device, boolean connected) {
        String mac = mac(device);
        if (mac == null) return;
        if (!connected) {
            synchronized (LAST_PROBE) {
                LAST_PROBE.remove(preferenceId(mac, "anc"));
                LAST_PROBE.remove(preferenceId(mac, "game"));
                LAST_WRITE.remove(preferenceId(mac, "anc"));
                LAST_WRITE.remove(preferenceId(mac, "game"));
            }
            return;
        }
        onDeviceReady(device);
    }

    /** Called on device initialization even if the device was connected before Link opened. */
    public static void onDeviceReady(Object device) {
        if (device == null || mac(device) == null) return;
        lastDevice = device;
        if (noiseEnabled) scheduleCheck(device, "anc", 1600);
        if (gameEnabled) scheduleCheck(device, "game", 2300);
    }

    private static void scheduleCheck(Object device, String mode, long delay) {
        String mac = mac(device);
        if (mac == null) return;
        Desired want = load(mac, mode);
        if (want == null) return;
        String id = preferenceId(mac, mode);
        long now = SystemClock.uptimeMillis();
        synchronized (LAST_PROBE) {
            Long prev = LAST_PROBE.get(id);
            if (prev != null && now - prev < RECHECK_COOLDOWN_MS) return;
            LAST_PROBE.put(id, now);
        }
        MAIN.postDelayed(() -> queryActual(device, want, false), delay);
    }

    private static Desired load(String mac, String mode) {
        Context c = context;
        if (c == null) return null;
        SharedPreferences p = c.getSharedPreferences(STORE, Context.MODE_PRIVATE);
        String id = preferenceId(mac, mode);
        if (!p.getBoolean(id + ".valid", false)) return null;
        return new Desired(mode, mac, p.getInt(id + ".type", -1),
            p.getInt(id + ".key", -1), p.getInt(id + ".value", Integer.MIN_VALUE));
    }

    private static void queryActual(Object device, Desired want, boolean verifyOnly) {
        if (device == null || !want.mac.equals(mac(device))) return;
        try {
            Object manager = getManager();
            if (manager == null || !isConnected(manager, device)) return;
            Method query = findMethod(manager.getClass(), "x", 4);
            if (query == null) { Log.w(TAG, "Settings query method unavailable"); return; }
            Class<?> cbInterface = query.getParameterTypes()[3];
            if (!cbInterface.isInterface()) { Log.w(TAG, "Settings callback is not an interface"); return; }
            Object cb = Proxy.newProxyInstance(cbInterface.getClassLoader(), new Class<?>[]{cbInterface},
                (proxy, method, args) -> handleReply(method, args, device, want, verifyOnly));
            query.invoke(manager, device, want.type, want.key, cb);
        } catch (Throwable ex) {
            Log.w(TAG, "Read failed, no blind write for " + want.mode, ex);
        }
    }

    private static Object handleReply(Method callback, Object[] args, Object device,
                                      Desired want, boolean verifyOnly) {
        String method = callback.getName();
        if ("toString".equals(method)) return "ModeKeeperCallback";
        if ("hashCode".equals(method)) return System.identityHashCode(want);
        if ("equals".equals(method)) return args != null && args.length == 1 && args[0] != null;
        if (args == null || args.length != 3 || !(args[1] instanceof Integer)) return null;
        int resultCode = (Integer) args[1];
        if (resultCode != 0) { log("query rejected code=" + resultCode); return null; }
        Object info = args[2];
        if (info instanceof Iterable<?>) {
            for (Object element : (Iterable<?>) info) handleInfo(device, want, element, verifyOnly);
        } else {
            handleInfo(device, want, info, verifyOnly);
        }
        return null;
    }

    private static void handleInfo(Object device, Desired want, Object info, boolean verifyOnly) {
        if (info == null) return;
        if (intGetter(info, "getSettingType", -1) != want.type ||
                intGetter(info, "getSettingKey", -1) != want.key) return;
        int current = intGetter(info, "getSettingValue", Integer.MIN_VALUE);
        if (current == Integer.MIN_VALUE) return;
        if (current == want.value) {
            log((verifyOnly ? "verified " : "already correct ") + want.mode + "=" + current);
            return;
        }
        if (verifyOnly) {
            Log.w(TAG, "Write not confirmed for " + want.mode + ": got " + current);
            return;
        }
        // User might have manually changed the selection during the delayed query.
        Desired latest = load(want.mac, want.mode);
        if (latest == null || latest.type != want.type || latest.key != want.key ||
                latest.value != want.value || !want.mac.equals(mac(device))) return;
        MAIN.post(() -> sendOnce(device, want));
    }

    private static void sendOnce(Object device, Desired want) {
        // A late query must never overwrite a newer manual selection.
        Desired latest = load(want.mac, want.mode);
        if (latest == null || latest.type != want.type || latest.key != want.key ||
                latest.value != want.value || !want.mac.equals(mac(device))) return;
        String id = preferenceId(want.mac, want.mode);
        long now = SystemClock.uptimeMillis();
        synchronized (LAST_PROBE) {
            Long last = LAST_WRITE.get(id);
            if (last != null && now - last < RECHECK_COOLDOWN_MS) return;
            LAST_WRITE.put(id, now);
        }
        try {
            Object manager = getManager();
            if (manager == null || !isConnected(manager, device)) return;
            Method send = findMethod(manager.getClass(), "J3", 3);
            if (send == null) return;
            Class<?> infoClass = Class.forName(SETTING, false, manager.getClass().getClassLoader());
            Constructor<?> ctor = infoClass.getConstructor(int.class, int.class, int.class);
            Object info = ctor.newInstance(want.type, want.key, want.value);
            // No UI marker and no change to other settings. Do not retry on failure.
            send.invoke(manager, device, info, null);
            log("restore sent " + want.mode + "=" + want.value);
            MAIN.postDelayed(() -> queryActual(device, want, true), 1600L);
        } catch (Throwable ex) {
            Log.w(TAG, "Failed to restore " + want.mode, ex);
        }
    }

    private static boolean isConnected(Object manager, Object device) {
        try {
            Method check = findMethod(manager.getClass(), "isDeviceConnected", 1);
            return check != null && Boolean.TRUE.equals(check.invoke(manager, device));
        } catch (Throwable ex) { return false; }
    }

    private static Object getManager() throws ReflectiveOperationException {
        Context c = context;
        if (c == null) return null;
        Class<?> type = Class.forName(MANAGER, false, c.getClassLoader());
        return type.getMethod("getInstance").invoke(null);
    }

    private static Method findMethod(Class<?> cls, String name, int argCount) {
        for (Method method : cls.getMethods()) {
            if (method.getName().equals(name) && method.getParameterCount() == argCount) {
                return method;
            }
        }
        return null;
    }

    private static int intGetter(Object object, String method, int fallback) {
        if (object == null) return fallback;
        try {
            Object val = object.getClass().getMethod(method).invoke(object);
            return val instanceof Integer ? (Integer) val : fallback;
        } catch (Throwable ex) { return fallback; }
    }

    private static String mac(Object device) {
        if (device == null) return null;
        try {
            Object m = device.getClass().getMethod("getMac").invoke(device);
            if (!(m instanceof String) || ((String) m).isEmpty()) return null;
            return ((String) m).replace(":", "").replace("-", "").toUpperCase(Locale.ROOT);
        } catch (Throwable ex) { return null; }
    }

    private static String preferenceId(String mac, String mode) { return mac + "." + mode; }

    private static boolean calledFromHeadsetUi() {
        for (StackTraceElement element : Thread.currentThread().getStackTrace()) {
            if (element.getClassName().startsWith("com.realme.iot.headset.activity.device.HeadsetDeviceActivity")) {
                return true;
            }
        }
        return false;
    }

    /** The resource entry name is locale-independent. Unknown settings are never saved. */
    private static String classifyItem(Context ui, Object item) {
        StringBuilder evidence = new StringBuilder();
        appendValue(evidence, invokeNoArg(item, "getViewItem"), "getItemType");
        appendResource(evidence, ui, invokeNoArg(item, "getTitleRes"));
        Object array = invokeNoArg(item, "getRadioTitleRes");
        if (array instanceof int[]) {
            for (int id : (int[]) array) appendResource(evidence, ui, id);
        }
        String data = evidence.toString().toLowerCase(Locale.ROOT);
        boolean game = data.contains("game_mode") || data.contains("game mode") ||
            data.contains("gamemode");
        boolean noise = data.contains("noise_reduction") || data.contains("noise_control") ||
            data.contains("noise_mode") || data.contains("noise_reduc") || data.contains("anc_mode") ||
            data.contains("norse_control") || data.contains("norsecontrol") ||
            data.contains("noise reduction");
        if (game && !noise) return "game";
        if (noise && !game) return "anc";
        return "";
    }

    private static void appendValue(StringBuilder b, Object target, String method) {
        Object obj = invokeNoArg(target, method);
        if (obj != null) b.append(' ').append(obj);
    }

    private static Object invokeNoArg(Object target, String name) {
        if (target == null) return null;
        try { return target.getClass().getMethod(name).invoke(target); }
        catch (Throwable ex) { return null; }
    }

    private static void appendResource(StringBuilder b, Context ctx, Object rawId) {
        if (!(rawId instanceof Integer)) return;
        int id = (Integer) rawId;
        if (id == 0) return;
        try { b.append(' ').append(ctx.getResources().getResourceEntryName(id)); }
        catch (Exception ignored) { /* Resource not present in this package */ }
    }

    private static void log(String message) { Log.d(TAG, message); }
}
