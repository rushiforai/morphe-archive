package io.github.daydreamfix.ext;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseArray;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/** Hook bodies for vrcore's own classes. */
public final class VrCore {
    private VrCore() {}

    /**
     * GVR draws straight onto the buffer being scanned out, which shows as flickering green squares
     * in the eyes on some displays. Queue finished frames instead. Also runs inside client apps,
     * because GVR apps load their layout from vrcore.
     */
    public static int swapMode(int mode) {
        return 0;
    }

    /** Accepts any headset: rejects only the "daydream_internal" check, not a missing one. */
    public static boolean isDaydreamViewer(Object params) {
        return params != null;
    }

    // ── Recenter: the phone has no controller orientation to wait for ───────

    public static void driRun(Object dri) {
        try {
            Reflect.call(dri, "run$orig");
        } catch (NullPointerException e) {
            Log.w(Daydream.TAG, "dri.run NPE suppressed");
        }
        if (Reflect.getInt(dri, "j") != 5) return;
        new Thread(() -> {
            try {
                Thread.sleep(30);
                Class<?> dtkClass = dri.getClass().getClassLoader().loadClass("dtk");
                Object dtk = dtkClass.getDeclaredConstructor().newInstance();
                Reflect.field(dtkClass, "f").setFloat(dtk, 1.0f);
                Reflect.field(dtkClass, "d").setLong(dtk, System.nanoTime());
                Reflect.call(dri, "a", new Class<?>[] {dtkClass}, dtk);
            } catch (Throwable t) {
                Log.w(Daydream.TAG, "fake dtk failed", t);
            }
        }).start();
    }

    // ── Controller listeners stay active without the system's VR state ──────

    public static void afterControllerService(Object service) {
        Reflect.setBoolean(service, "k", true);
    }

    public static void afterControllerService(Object service, android.content.Intent intent) {
        afterControllerService(service);
    }

    @SuppressWarnings("unchecked")
    /**
     * dff.b(): the VR activity vrcore thinks is on top. Null until the first one reports, and a
     * listener only counts as foreground if its package matches, so assume vr.home then.
     */
    public static android.content.ComponentName vrActivity(Object dff) {
        Object current = Reflect.get(dff, "d");
        return current != null ? (android.content.ComponentName) current
                : new android.content.ComponentName("com.google.android.vr.home",
                        "com.google.vr.app.Launcher.Launcher");
    }

    /**
     * ebx.e(): "vr.home is already the VR app on top". It reads dff.b(), whose vr.home fallback
     * above made a headset NFC tap think Home was open when it wasn't, so this reads the real one.
     */
    public static boolean homeOnTop(Object ebx) {
        Object current = Reflect.get(Reflect.get(ebx, "a"), "d");
        return current instanceof android.content.ComponentName
                && "com.google.android.vr.home".equals(((android.content.ComponentName) current).getPackageName());
    }

    public static void afterReconcile(Object dqo) {
        try {
            Map<?, ?> all = (Map<?, ?>) Reflect.get(dqo, "a");
            Set<Object> active = (Set<Object>) Reflect.get(dqo, "b");
            synchronized (all) {
                for (Object value : all.values()) {
                    SparseArray<?> listeners = (SparseArray<?>) value;
                    for (int i = 0; i < listeners.size(); i++) {
                        Object listener = listeners.valueAt(i);
                        // vrcore just told a listener it disabled "disconnected"; one we keep
                        // active (an OpenXR runtime in the background) needs the real state.
                        if (listener != null && active.add(listener)) {
                            sendControllerState(dqo, listener, listeners.keyAt(i));
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(Daydream.TAG, "dqo reconcile failed", t);
        }
    }

    /** dqq.d.a(controllerId, state), with the state vrcore keeps per controller in dqo.e. */
    private static void sendControllerState(Object dqo, Object dqq, int controllerId) {
        try {
            Map<?, ?> states = (Map<?, ?>) Reflect.get(dqo, "e");
            Object state = states.get(Reflect.get(dqq, "a"));
            int value = state instanceof Integer ? (Integer) state : 0;
            Object binder = Reflect.get(dqq, "d");
            for (java.lang.reflect.Method m : binder.getClass().getMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (m.getName().equals("a") && p.length == 2 && p[0] == int.class && p[1] == int.class) {
                    m.invoke(binder, controllerId, value);
                    Log.i(Daydream.TAG, "controller state " + value + " sent to background listener");
                    return;
                }
            }
        } catch (Throwable t) {
            Log.w(Daydream.TAG, "controller state resend failed", t);
        }
    }

    // ── Pairing survives the system's bond popup ────────────────────────────

    private static final int STATE_BONDING = 3;
    private static final long BOND_DIALOG_TIMEOUT_MS = 60000L;
    private static final long BOND_RECHECK_MS = 5000L;
    private static final Map<Object, List<Object>> SAVED_PAIRING =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Long> BOND_DEADLINE =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Boolean> IN_ON_PAUSE = new ThreadLocal<>();

    public static void pairingOnPause(Object activity) {
        IN_ON_PAUSE.set(Boolean.TRUE);
        try {
            Reflect.call(activity, "onPause$orig");
        } finally {
            IN_ON_PAUSE.remove();
        }
    }

    /** @return true to skip dmw.a(): paused because of the popup, not because the user left. */
    public static boolean helperStop(Object helper) {
        return IN_ON_PAUSE.get() != null && Reflect.getInt(helper, "d") == STATE_BONDING;
    }

    /**
     * onResume() calls q(), which unbonds the saved controller, deleting the bond the popup just
     * made. q() also clears h; left full, onResume() finishes the activity and a new instance
     * unbonds instead, so h stays empty until onResume() returns.
     */
    @SuppressWarnings("unchecked")
    public static boolean pairingForget(Object activity) {
        Object helper = Reflect.get(activity, "i");
        if (helper == null || Reflect.getInt(helper, "d") == 0) return false;
        List<Object> pairing = (List<Object>) Reflect.get(activity, "h");
        SAVED_PAIRING.put(activity, new ArrayList<>(pairing));
        pairing.clear();
        return true;
    }

    @SuppressWarnings("unchecked")
    public static void afterPairingResume(Object activity) {
        List<Object> saved = SAVED_PAIRING.remove(activity);
        if (saved != null) ((List<Object>) Reflect.get(activity, "h")).addAll(saved);
        Object helper = Reflect.get(activity, "i");
        if (helper == null || Reflect.getInt(helper, "d") == 0
                || ((Activity) activity).isFinishing()) {
            return;
        }
        ((Handler) Reflect.get(activity, "m")).removeCallbacksAndMessages(null);
        Reflect.call(activity, "a", new Class<?>[] {boolean.class}, Boolean.TRUE);
    }

    /** Leaving the screen for real still has to stop the helper that onPause() kept running. */
    public static void afterActivityStop(Object activity) {
        if (!activity.getClass().getName()
                .equals("com.google.vr.vrcore.daydream.PairingActivity")) return;
        Object helper = Reflect.get(activity, "i");
        if (helper != null) Reflect.call(helper, "a");
    }

    /** @return true to skip dnb.run(): the 10 s timeout leaves no time to answer the popup. */
    public static boolean bondTimeout(Object timeout) {
        Object helper = Reflect.get(timeout, "a");
        if (Reflect.getInt(helper, "d") != STATE_BONDING) return false;
        Object target = Reflect.get(helper, "k");
        if (target == null) return false;
        BluetoothAdapter adapter = (BluetoothAdapter) Reflect.get(helper, "c");
        BluetoothDevice device = adapter.getRemoteDevice((String) Reflect.get(target, "b"));
        int bondState = device.getBondState();
        if (bondState == BluetoothDevice.BOND_BONDED) {
            Reflect.call(helper, "a", new Class<?>[] {BluetoothDevice.class}, device);
            return true;
        }
        if (bondState != BluetoothDevice.BOND_BONDING) return false;
        long now = SystemClock.elapsedRealtime();
        Long deadline = BOND_DEADLINE.get(timeout);
        if (deadline == null) {
            deadline = now + BOND_DIALOG_TIMEOUT_MS;
            BOND_DEADLINE.put(timeout, deadline);
        }
        if (now >= deadline) return false;
        ((Handler) Reflect.get(helper, "e")).postDelayed((Runnable) timeout, BOND_RECHECK_MS);
        return true;
    }

    /** Replaces eyd.a(Context,int), the check behind "update Google VR settings". */
    public static boolean specialPermission(android.content.Context c, int type) {
        switch (type) {
            case 0:
                return android.provider.Settings.canDrawOverlays(c);
            case 1:
                return true;
            case 2:
                return c.getSystemService(android.app.NotificationManager.class).isNotificationPolicyAccessGranted();
            case 3:
                String s = android.provider.Settings.Secure.getString(c.getContentResolver(), "enabled_notification_listeners");
                return s != null && s.contains(c.getPackageName());
            default:
                return false;
        }
    }
}
