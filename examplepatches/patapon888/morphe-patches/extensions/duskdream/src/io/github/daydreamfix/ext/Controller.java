package io.github.daydreamfix.ext;

import android.content.ComponentName;
import android.os.IBinder;
import android.util.Log;

import java.lang.reflect.Method;

/** The controller service plumbing shared by vrcore and vr.home. */
public final class Controller {
    private Controller() {}

    private static final String HOME = "com.google.android.vr.home";

    /**
     * vr.home runs the controller client from vrcore's code (GVR loads it through a package
     * context), so a second copy of this class exists in that process with its own statics. The
     * state has to live where both copies see it: the system properties table is shared.
     */
    private static final java.util.Properties SHARED = System.getProperties();
    private static final String KEY_CALLBACKS = "duskdream.nativeCallbacks";
    private static final String KEY_DELIVERED = "duskdream.stateDelivered";
    private static final String KEY_ACTIVE = "duskdream.vrModeActive";

    private static boolean flag(String key) { return Boolean.TRUE.equals(SHARED.get(key)); }

    /** True only while the VR Launcher is on top of vr.home. */
    static boolean vrModeActive() { return flag(KEY_ACTIVE); }

    static void setVrModeActive(boolean active) { SHARED.put(KEY_ACTIVE, active); }

    private static boolean isHome(Object o) {
        // vrcore has its own copy of this class; its Application is the other package.
        return android.app.Application.getProcessName().startsWith(HOME);
    }

    /** @return true to drop the call: the JNI side blocks on a dead VR session while in 2D. */
    public static boolean onServiceConnected(Object nc, int i) {
        SHARED.put(KEY_CALLBACKS, nc);
        return isHome(nc) && !vrModeActive();
    }

    public static boolean onControllerStateChanged(Object nc, int index, int state) {
        if (isHome(nc) && !vrModeActive()) return true;
        SHARED.put(KEY_DELIVERED, true);
        return false;
    }

    private static void walkToConnected(Object nc) throws Exception {
        Method m = nc.getClass().getDeclaredMethod("onControllerStateChanged", int.class, int.class);
        m.setAccessible(true);
        m.invoke(nc, 0, 1); // SCANNING
        Thread.sleep(50);
        m.invoke(nc, 0, 2); // CONNECTING
        Thread.sleep(50);
        m.invoke(nc, 0, 3); // CONNECTED
    }

    /** Pausing drops CONNECTED, and GVR leaves the touchpad off until it is delivered again. */
    static void reinjectConnected() {
        new Thread(() -> {
            try {
                Thread.sleep(300);
                Object nc = SHARED.get(KEY_CALLBACKS);
                if (nc != null) walkToConnected(nc);
            } catch (Throwable t) {
                Log.w(Daydream.TAG, "re-inject failed", t);
            }
        }, "DaydreamReInject").start();
    }

    /**
     * After ControllerServiceBridge.onServiceConnected. If initialize() failed the bridge gave up,
     * so rebuild its service proxy from the binder and run the setup anyway.
     */
    public static void afterBridgeConnected(Object bridge, ComponentName name, IBinder binder) {
        boolean home = isHome(bridge);
        try {
            // The class's own build decides the obfuscated names, not the process it runs in.
            boolean vrcoreBuild = Reflect.field(bridge.getClass(), "d").getType() == boolean.class;
            if (Reflect.get(bridge, "j") == null && (!home || vrModeActive())) {
                Class<?> stub = bridge.getClass().getClassLoader().loadClass(vrcoreBuild ? "dul" : "ekz");
                Method asInterface = stub.getDeclaredMethod("a", IBinder.class);
                asInterface.setAccessible(true);
                Reflect.set(bridge, "j", asInterface.invoke(null, binder));
                Reflect.setBoolean(bridge, vrcoreBuild ? "d" : "e", true);
                Reflect.call(bridge, vrcoreBuild ? "c" : "b");
            }
            if (home && vrModeActive()) {
                SHARED.put(KEY_DELIVERED, false);
                new Thread(() -> {
                    try {
                        Thread.sleep(300);
                        Object nc = SHARED.get(KEY_CALLBACKS);
                        if (nc != null && !flag(KEY_DELIVERED)) walkToConnected(nc);
                    } catch (Throwable t) {
                        Log.w(Daydream.TAG, "state inject failed", t);
                    }
                }, "DaydreamStateInject").start();
            }
        } catch (Throwable t) {
            Log.w(Daydream.TAG, "bridge recovery failed", t);
        }
    }
}
