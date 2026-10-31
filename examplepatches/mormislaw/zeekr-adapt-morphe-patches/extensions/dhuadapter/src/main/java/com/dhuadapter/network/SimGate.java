package com.dhuadapter.network;

import android.util.Log;

import java.lang.reflect.Method;

import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 5b — SIM-gate. gate: config.simReady
 *
 * Some apps (Apple Music) AND their connectivity gate with SIM state and the
 * "allow cellular data" pref, so a SIM-less head unit is treated as offline
 * even when Ethernet/VLAN is fully online. Report SIM READY and force
 * key_use_cellular_data=true. Kept in the same package as NetworkBypass but on
 * its OWN flag: faking a SIM is harmful to apps that behave differently with a
 * SIM present (e.g. phone-number registration flows).
 */
public final class SimGate {

    private static final String TAG = HookEnv.TAG;

    private SimGate() {}

    public static void install() {
        if (!HookEnv.config.simReady) {
            Log.i(TAG, "SIM-gate disabled (config.simReady=false)");
            return;
        }

        // TelephonyManager.getSimState() → 5 (SIM_STATE_READY).
        //    The app's connectivity gate treats SIM ABSENT(1)/UNKNOWN(0) as "no
        //    data allowed" and shows the offline UI. The DHU has no SIM, so
        //    getSimState() returns ABSENT and the gate fails even though
        //    Ethernet/VLAN is fully online — this left Home/New/Search offline
        //    while Library (not behind this gate) worked. Report READY so the
        //    SIM branch of the gate passes.
        try {
            Method getSimState = android.telephony.TelephonyManager.class
                    .getMethod("getSimState");
            Pine.hook(getSimState, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        callFrame.setResult(5); // SIM_STATE_READY
                        if (HookEnv.config.debug) {
                            Log.d(TAG, "SimGate: getSimState() → 5 (READY)");
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "getSimState hook error", e);
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook TelephonyManager.getSimState", e);
        }

        // SharedPreferencesImpl.getBoolean("key_use_cellular_data", def) → true.
        //    AM's user pref "allow cellular data" (setCellularDataEnabled →
        //    key_use_cellular_data). On the head unit the active link is classified
        //    cellular, so forcing this true lets AM stream/download online. Confirmed
        //    read via SharedPreferencesImpl at runtime (fires frequently through this hook).
        //    NB: key_automotive_charles_proxy_enabled is NOT a connectivity flag and
        //    is deliberately NOT overridden. Empirically, the app routes player HTTP
        //    through a developer debug proxy when this pref is true — a traffic-
        //    inspection toggle, nothing to do with NET_CAPABILITY_VALIDATED or any
        //    "AAOS bypass". Forcing it true would send audio to a nonexistent proxy
        //    on the head unit and break playback (connection refused). The app reads
        //    it once into a cached field at init, so it never fired through this hook
        //    — leaving it out is both correct and a no-op for current behavior.
        //    Hooking the concrete SharedPreferencesImpl covers every prefs instance
        //    the app reads; we override only this one key and defer to the real
        //    value for everything else.
        try {
            Class<?> spImpl = Class.forName("android.app.SharedPreferencesImpl");
            Method getBoolean = spImpl.getMethod("getBoolean", String.class, boolean.class);
            Pine.hook(getBoolean, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        Object k = callFrame.args[0];
                        if (k instanceof String
                                && "key_use_cellular_data".equals(k)) {
                            callFrame.setResult(true);
                            if (HookEnv.config.debug) {
                                Log.d(TAG, "SimGate: getBoolean(\"" + k + "\") → true");
                            }
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "getBoolean hook error", e);
                    }
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook SharedPreferencesImpl.getBoolean", t);
        }

        Log.i(TAG, "Hook installed: SIM-gate "
                + "(getSimState=READY + key_use_cellular_data=true)");
    }
}
