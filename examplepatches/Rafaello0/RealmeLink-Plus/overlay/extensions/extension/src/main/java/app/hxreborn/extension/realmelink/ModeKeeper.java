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
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeSet;

/**
 * Fail-closed mode memory. Never guesses a SettingsInfo type, key or mode value.
 * On a manual UI write, learns the exact (type,key,value) tuple already sent by realme Link.
 * On each connection, perform bounded read/compare/restore/verify rounds.
 * Unknown state is never treated as a mismatch; user selections cancel stale checks.
 */
public final class ModeKeeper {
    private static final String TAG = "RLM-Modes";
    private static final String STORE = "rlm_mode_memory_v1";
    private static final String SETTING = "com.realme.iot.headset.contract.bean.SettingsInfo";
    private static final String MANAGER = "com.realme.iot.headset.manager.HeadsetManager";
    private static final long UI_WINDOW_MS = 1600L;
    private static final long[] CHECK_DELAYS_MS = { 1700L, 4000L, 8000L };
    private static final long QUERY_TIMEOUT_MS = 2600L;
    private static final String[] MODES = {"anc", "game"};
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ThreadLocal<UiTag> ACTION = new ThreadLocal<>();
    private static final Map<String, Check> CHECKS = new HashMap<>();
    private static final Map<String, WeakReference<Object>> DEVICES = new HashMap<>();
    private static final Map<String, Long> LAST_ACL = new HashMap<>();
    private static volatile Context context;
    private static volatile boolean noiseEnabled;
    private static volatile boolean gameEnabled;

    private ModeKeeper() { }

    public static void initialize(Object maybeApp) {
        if (maybeApp instanceof Context) {
            Context c = (Context) maybeApp;
            context = c.getApplicationContext() != null ? c.getApplicationContext() : c;
            ModeSettingsUi.install(context);
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
        final WeakReference<Context> ui;
        UiTag(String type, long at, Context ui) { this.type = type; this.at = at; this.ui = new WeakReference<>(ui); }
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
        ACTION.remove();
        if (!(activity instanceof Context) || item == null) return;
        if (context == null) return;
        String category = classifyItem((Context) activity, item);
        if (("anc".equals(category) && noiseEnabled) ||
                ("game".equals(category) && gameEnabled)) {
            ACTION.set(new UiTag(category, SystemClock.uptimeMillis(), (Context) activity));
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
        // Learn the exact mode encoding from the verified UI write, not a guessed boolean.
        if (value < 0) return;
        String id = preferenceId(mac, tag.type);
        rememberDevice(device);
        cancel(id);
        c.getSharedPreferences(STORE, Context.MODE_PRIVATE).edit()
            .putInt(id + ".type", type)
            .putInt(id + ".key", key)
            .putInt(id + ".value", value)
            .putBoolean(id + ".valid", true)
            .apply();
        MAIN.post(() -> {
            Context ui = tag.ui.get();
            if (ui != null) ModeSettingsUi.attach(ui, device);
        });
        log("remembered " + tag.type + " type=" + type + " key=" + key + " value=" + value);
    }

    /** Only the captured device identity is used; two identical models never share preferences. */
    public static boolean hasSelection(Object device, String mode) {
        String address = mac(device);
        return hasSelectionFor(address, mode);
    }

    public static boolean hasSelectionFor(String address, String mode) {
        return normalize(address) != null && isModeEnabled(mode) && load(normalize(address), mode) != null;
    }

    public static boolean isMaintained(Object device, String mode) {
        return isMaintainedFor(mac(device), mode);
    }

    public static boolean isMaintainedFor(String address, String mode) {
        address = normalize(address);
        if (address == null || context == null || !isModeEnabled(mode)) return false;
        try {
            return context.getSharedPreferences(STORE, Context.MODE_PRIVATE)
                .getBoolean(preferenceId(address, mode) + ".maintain", true);
        } catch (ClassCastException ex) {
            Log.w(TAG, "Invalid maintenance preference", ex);
            return false;
        }
    }

    public static boolean setMaintained(Object device, String mode, boolean enabled) {
        rememberDevice(device);
        return setMaintainedFor(mac(device), mode, enabled);
    }

    public static boolean setMaintainedFor(String address, String mode, boolean enabled) {
        address = normalize(address);
        Context c = context;
        if (address == null || c == null || !hasSelectionFor(address, mode)) return false;
        String id = preferenceId(address, mode);
        cancel(id);
        c.getSharedPreferences(STORE, Context.MODE_PRIVATE).edit()
            .putBoolean(id + ".maintain", enabled).apply();
        Object device = knownDevice(address);
        if (enabled && device != null) scheduleCheck(device, mode);
        return true;
    }

    public static String deviceIdentity(Object device) {
        String address = mac(device);
        return address == null ? "" : address;
    }

    /** User-facing name cached from a verified realme device; address is never displayed. */
    public static String savedProfileName(String rawAddress) {
        String address = normalize(rawAddress);
        if (address == null) return null;
        String live = HeadsetProfileNames.vendorName(knownDevice(address));
        if (live != null) return live;
        Context c = context;
        if (c == null) return null;
        try {
            return HeadsetProfileNames.safeName(c.getSharedPreferences(STORE, Context.MODE_PRIVATE)
                .getString(address + ".display_name", null));
        } catch (RuntimeException e) {
            return null;
        }
    }

    public static String[] savedProfiles() {
        Context c = context;
        if (c == null) return new String[0];
        TreeSet<String> ids = new TreeSet<>();
        for (String key : c.getSharedPreferences(STORE, Context.MODE_PRIVATE).getAll().keySet()) {
            if (key.endsWith(".anc.valid") || key.endsWith(".game.valid")) {
                String address = normalize(key.substring(0, key.indexOf('.')));
                if (address != null && (hasSelectionFor(address, "anc") || hasSelectionFor(address, "game")))
                    ids.add(address);
            }
        }
        return ids.toArray(new String[0]);
    }

    public static boolean modeAvailable(String mode) { return isModeEnabled(mode); }

    public static boolean activeProfile(String raw) {
        String address = normalize(raw);
        return address != null && ((hasSelectionFor(address, "anc") && isMaintainedFor(address, "anc"))
            || (hasSelectionFor(address, "game") && isMaintainedFor(address, "game")));
    }

    /** Global callback dispatcher in the verified app DEX, independent of presenter lifetime. */
    public static void onVendorStatus(Object device, Object status) {
        if (!(status instanceof Enum<?>) || mac(device) == null) return;
        String name = ((Enum<?>)status).name();
        // Exact enum constants in the target DEX; transport-only A2DP/SPP
        // events do not prove that the vendor settings channel is ready.
        switch (name) {
            case "CONNECTED": case "TWS_CONNECTED": case "HEADSET_CONNECTED":
            case "DATA_SYNCING": case "PAIR_SUCCESS":
                MAIN.post(() -> onConnection(device, true)); break;
            case "DISCONNECTED": case "TWS_DISCONNECTED": case "HEADSET_DISCONNECTED":
            case "CONNECT_FAIL": case "CONNECT_TIME_OUT": case "DEVICE_POWER_OFF":
            case "DEVICE_UNBIND": case "BREAK":
                MAIN.post(() -> onConnection(device, false)); break;
            default: break;
        }
    }

    /** Worker-thread lookup using realme Link's own account/device database, not a fabricated device. */
    public static Object resolveSavedDevice(String raw) {
        String address = normalize(raw);
        Context c = context;
        if (c == null || !activeProfile(address)) return null;
        Object known = knownDevice(address);
        if (known != null) return known;
        try {
            ClassLoader loader = c.getClassLoader();
            Class<?> helper = Class.forName("com.realme.iot.common.db.data.devicedomain.DeviceDomainDataSourceHelper", false, loader);
            Class<?> domain = Class.forName("com.realme.iot.common.domain.DeviceDomain", false, loader);
            Class<?> util = Class.forName("com.realme.iot.common.utils.Util", false, loader);
            String formatted = address.replaceAll("(?<=\\G..)(?!$)", ":");
            Object db = helper.getMethod("S").invoke(null);
            if (db == null) return null;
            Object record = helper.getMethod("R", String.class).invoke(db, formatted);
            if (record == null) return null;
            Object device = util.getMethod("s", domain).invoke(null, record);
            if (!address.equals(mac(device))) return null;
            Object kind = device.getClass().getMethod("getDeviceType").invoke(device);
            if (!(kind instanceof Enum<?>) || !"HEADSET".equals(((Enum<?>)kind).name())) return null;
            return device;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            Log.w(TAG, "Cannot resolve saved headset", e);
            return null;
        }
    }

    /** Called on main after a fresh OS connection event and exact database lookup. */
    public static void resumeSavedDevice(Object device) {
        String address = mac(device);
        if (!activeProfile(address)) return;
        rememberDevice(device);
        // Ask vendor API for its control connection, only for an opted-in known headset.
        try {
            Object manager = getManager();
            if (manager != null && !isConnected(manager, device)) {
                Class<?> dev = Class.forName("com.realme.iot.common.devices.Device", false, manager.getClass().getClassLoader());
                if (dev.isInstance(device)) manager.getClass().getMethod("connectDevice", dev).invoke(manager, device);
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            Log.w(TAG, "Control connection not ready", e);
        }
        // Do not lose the DB-resolved device if the live ACL hint was deduplicated.
        onDeviceReady(device);
    }

    public static boolean hasPendingChecks(String raw) {
        String address = normalize(raw);
        if (address == null) return false;
        synchronized (CHECKS) {
            for (String mode : MODES) {
                Check check = CHECKS.get(preferenceId(address, mode));
                if (check != null && !check.done) return true;
            }
        }
        return false;
    }

    public static void cancelPendingChecks(String raw) {
        String address = normalize(raw);
        if (address == null) return;
        for (String mode : MODES) cancel(preferenceId(address, mode));
    }

    private static void rememberDevice(Object device) {
        String address = mac(device);
        if (address == null) return;
        synchronized (DEVICES) {
            DEVICES.entrySet().removeIf(entry -> entry.getValue().get() == null);
            DEVICES.put(address, new WeakReference<>(device));
            LAST_ACL.keySet().retainAll(DEVICES.keySet());
        }
        String name = HeadsetProfileNames.vendorName(device);
        Context c = context;
        if (c != null && name != null) {
            c.getSharedPreferences(STORE, Context.MODE_PRIVATE).edit()
                .putString(address + ".display_name", name).apply();
        }
    }

    private static Object knownDevice(String address) {
        synchronized (DEVICES) {
            WeakReference<Object> ref = DEVICES.get(address);
            return ref == null ? null : ref.get();
        }
    }

    /** OS events are hints only. All writes still require a real vendor device and read-back. */
    public static void onBluetoothEvent(String rawAddress, boolean connected) {
        String address = normalize(rawAddress);
        if (address == null) return;
        MAIN.post(() -> {
            Object device = knownDevice(address);
            if (device == null) return;
            if (!connected) {
                // ACL transport and vendor control connection need not disconnect together.
                try {
                    Object manager = getManager();
                    if (manager != null && isConnected(manager, device)) return;
                } catch (ReflectiveOperationException | RuntimeException ignored) { return; }
                onConnection(device, false);
                synchronized (DEVICES) { LAST_ACL.remove(address); }
                return;
            }
            synchronized (DEVICES) {
                long now = SystemClock.uptimeMillis();
                Long last = LAST_ACL.get(address);
                if (last != null && now - last < 2500L) return;
                LAST_ACL.put(address, now);
            }
            synchronized (CHECKS) {
                for (String mode : new String[]{"anc", "game"}) {
                    String id = preferenceId(address, mode);
                    Check previous = CHECKS.get(id);
                    if (previous != null && previous.done) CHECKS.remove(id);
                }
            }
            onDeviceReady(device);
        });
    }

    private static boolean isModeEnabled(String mode) {
        return ("anc".equals(mode) && noiseEnabled) || ("game".equals(mode) && gameEnabled);
    }

    private static final class Check {
        Object device;
        final Desired want;
        final String id;
        int round, ticket;
        boolean waiting, wrote;
        volatile Object callback;
        volatile boolean done;
        long finishedAt;
        Check(Object device, Desired want) {
            this.device = device; this.want = want;
            this.id = preferenceId(want.mac, want.mode);
        }
    }

    private static void cancel(String id) {
        synchronized (CHECKS) {
            Check previous = CHECKS.remove(id);
            if (previous != null) previous.callback = null;
        }
    }

    public static void onConnection(Object device, boolean connected) {
        String address = mac(device);
        if (address == null) return;
        rememberDevice(device);
        if (!connected) {
            cancelPendingChecks(address);
            synchronized (DEVICES) { LAST_ACL.remove(address); }
        } else {
            onDeviceReady(device);
        }
    }

    public static void onDeviceReady(Object device) {
        if (device == null || mac(device) == null) return;
        rememberDevice(device);
        if (noiseEnabled) scheduleCheck(device, "anc");
        if (gameEnabled) scheduleCheck(device, "game");
    }

    private static void scheduleCheck(Object device, String mode) {
        String address = mac(device);
        if (address == null || !isMaintained(device, mode)) return;
        Desired want = load(address, mode);
        if (want == null) return;
        Check check = new Check(device, want);
        synchronized (CHECKS) {
            // Release completed session markers and allow a later readiness event
            // to recover even if the vendor omitted a disconnect callback.
            long now = SystemClock.uptimeMillis();
            CHECKS.values().removeIf(previous -> previous.done && now - previous.finishedAt >= 30000L);
            if (CHECKS.containsKey(check.id)) return;
            CHECKS.put(check.id, check);
        }
        MAIN.postDelayed(() -> startRound(check), CHECK_DELAYS_MS[0]);
    }

    private static Desired load(String mac, String mode) {
        Context c = context;
        if (c == null) return null;
        SharedPreferences p = c.getSharedPreferences(STORE, Context.MODE_PRIVATE);
        String id = preferenceId(mac, mode);
        try {
            if (!p.getBoolean(id + ".valid", false)) return null;
            int type = p.getInt(id + ".type", -1);
            int key = p.getInt(id + ".key", -1);
            int value = p.getInt(id + ".value", -1);
            return type < 0 || key < 0 || value < 0 ? null : new Desired(mode, mac, type, key, value);
        } catch (ClassCastException ex) {
            Log.w(TAG, "Invalid stored mode", ex);
            return null;
        }
    }

    private static boolean current(Check check) {
        synchronized (CHECKS) {
            if (CHECKS.get(check.id) != check || check.done) return false;
        }
        Desired latest = load(check.want.mac, check.want.mode);
        boolean valid = isMaintained(check.device, check.want.mode) &&
            latest != null && latest.type == check.want.type && latest.key == check.want.key &&
            latest.value == check.want.value && check.want.mac.equals(mac(check.device));
        if (!valid) {
            synchronized (CHECKS) {
                if (CHECKS.get(check.id) == check) CHECKS.remove(check.id);
                check.callback = null;
            }
        }
        return valid;
    }

    private static void startRound(Check check) {
        if (!current(check)) return;
        check.wrote = false;
        queryActual(check, false);
    }

    private static void finishRound(Check check) {
        if (!current(check)) return;
        check.waiting = false;
        check.callback = null;
        if (++check.round >= CHECK_DELAYS_MS.length) {
            check.device = null; // A completed check must not retain the vendor Device.
            check.finishedAt = SystemClock.uptimeMillis();
            check.done = true;
            return;
        }
        MAIN.postDelayed(() -> startRound(check), CHECK_DELAYS_MS[check.round]);
    }

    private static void queryActual(Check check, boolean verifyOnly) {
        if (!current(check)) return;
        final int ticket = ++check.ticket;
        check.waiting = true;
        try {
            Object manager = getManager();
            if (manager == null || !isConnected(manager, check.device)) {
                finishRound(check); return;
            }
            Method query = contractMethod(manager, "x", check.device, true);
            if (query == null || !query.getParameterTypes()[3].isInterface()) {
                finishRound(check); return;
            }
            Class<?> cbInterface = query.getParameterTypes()[3];
            Object cb = Proxy.newProxyInstance(cbInterface.getClassLoader(), new Class<?>[]{cbInterface},
                (proxy, method, args) -> {
                    String name = method.getName();
                    if ("toString".equals(name)) return "ModeKeeperCallback";
                    if ("hashCode".equals(name)) return System.identityHashCode(proxy);
                    if ("equals".equals(name)) return args != null && args.length == 1 && proxy == args[0];
                    if (args != null && args.length == 3 && args[1] instanceof Integer &&
                            check.want.mac.equals(mac(args[0]))) {
                        int code = (Integer) args[1];
                        // Snapshot the vendor reply before posting; never retain a mutable
                        // SettingsInfo/list from the vendor callback thread.
                        int value = replyValue(check.want, args[2]);
                        MAIN.post(() -> handleReply(check, ticket, verifyOnly, code, value));
                    }
                    return null;
                });
            // Vendor proxy stores a WeakReference; keep this request alive until completion.
            synchronized (CHECKS) {
                if (CHECKS.get(check.id) != check) return;
                check.callback = cb;
            }
            query.invoke(manager, check.device, check.want.type, check.want.key, cb);
            MAIN.postDelayed(() -> {
                if (current(check) && check.waiting && check.ticket == ticket) finishRound(check);
            }, QUERY_TIMEOUT_MS);
        } catch (Throwable ex) {
            Log.w(TAG, "Read failed for " + check.want.mode, ex);
            if (current(check) && check.waiting && check.ticket == ticket) finishRound(check);
        }
    }

    private static int replyValue(Desired want, Object info) {
        try {
            if (!(info instanceof Iterable<?>)) return readValue(want, info);
            int found = -1;
            for (Object element : (Iterable<?>) info) {
                int value = readValue(want, element);
                if (value < 0) continue;
                if (found >= 0 && value != found) return -1; // conflicting reply
                found = value;
            }
            return found;
        } catch (RuntimeException e) {
            return -1;
        }
    }

    private static void handleReply(Check check, int ticket, boolean verifyOnly, int code, int value) {
        if (!current(check) || !check.waiting || ticket != check.ticket) return;
        if (code != 0) { finishRound(check); return; }
        if (value < 0) return; // Wait for a valid response; never write from an unknown state.
        check.waiting = false;
        check.callback = null;
        if (value == check.want.value) {
            log((verifyOnly ? "verified " : "already correct ") + check.want.mode + "=" + value);
            finishRound(check);
        } else if (verifyOnly || check.wrote) {
            Log.w(TAG, "Mode not yet confirmed: " + check.want.mode);
            finishRound(check);
        } else {
            sendOnce(check);
        }
    }

    private static int readValue(Desired want, Object info) {
        if (info == null || intGetter(info, "getSettingType", -1) != want.type ||
                intGetter(info, "getSettingKey", -1) != want.key) return -1;
        return intGetter(info, "getSettingValue", -1);
    }

    private static void sendOnce(Check check) {
        if (!current(check) || check.wrote) return;
        Desired want = check.want;
        try {
            Object manager = getManager();
            if (manager == null || !isConnected(manager, check.device)) { finishRound(check); return; }
            Method send = contractMethod(manager, "J3", check.device, false);
            if (send == null) { finishRound(check); return; }
            Class<?> infoClass = Class.forName(SETTING, false, manager.getClass().getClassLoader());
            Constructor<?> ctor = infoClass.getConstructor(int.class, int.class, int.class);
            Object info = ctor.newInstance(want.type, want.key, want.value);
            check.wrote = true;
            synchronized (CHECKS) {
                if (!current(check)) return;
                send.invoke(manager, check.device, info, null);
            }
            log("restore sent " + want.mode + "=" + want.value);
            MAIN.postDelayed(() -> queryActual(check, true), 1600L);
        } catch (Throwable ex) {
            Log.w(TAG, "Failed to restore " + want.mode, ex);
            finishRound(check);
        }
    }

    private static boolean isConnected(Object manager, Object device) {
        try {
            Class<?> dev = Class.forName("com.realme.iot.common.devices.Device", false,
                manager.getClass().getClassLoader());
            return dev.isInstance(device) && Boolean.TRUE.equals(
                manager.getClass().getMethod("isDeviceConnected", dev).invoke(manager, device));
        } catch (Throwable ex) { return false; }
    }

    private static Object getManager() throws ReflectiveOperationException {
        Context c = context;
        if (c == null) return null;
        Class<?> type = Class.forName(MANAGER, false, c.getClassLoader());
        return type.getMethod("getInstance").invoke(null);
    }

    private static Method contractMethod(Object manager, String name, Object device, boolean query)
            throws ReflectiveOperationException {
        ClassLoader loader = manager.getClass().getClassLoader();
        Class<?> dev = Class.forName("com.realme.iot.common.devices.Device", false, loader);
        Class<?> cb = Class.forName("com.realme.iot.headset.contract.callback.ISettingsCallback", false, loader);
        if (!dev.isInstance(device)) return null;
        return query ? manager.getClass().getMethod(name, dev, int.class, int.class, cb)
            : manager.getClass().getMethod(name, dev, Class.forName(SETTING, false, loader), cb);
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
            return normalize((String)m);
        } catch (Throwable ex) { return null; }
    }

    private static String normalize(String raw) {
        if (raw == null || !raw.matches("(?i)([0-9a-f]{12}|[0-9a-f]{2}(:[0-9a-f]{2}){5}|[0-9a-f]{2}(-[0-9a-f]{2}){5})")) return null;
        String address = raw.replace(":", "").replace("-", "").toUpperCase(Locale.ROOT);
        return !address.equals("000000000000") && !address.equals("FFFFFFFFFFFF")
            && !address.equals("020000000000") ? address : null;
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
