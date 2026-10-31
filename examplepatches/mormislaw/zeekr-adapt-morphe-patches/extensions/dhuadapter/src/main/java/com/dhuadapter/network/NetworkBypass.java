package com.dhuadapter.network;

import android.util.Log;

import java.lang.reflect.Method;

import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 5a — Network connectivity bypass (systemic). gate: config.networkBypass
 *
 * DHU devices often get internet through Ethernet/VPN from the TBOX telematics
 * module; some apps check NetworkCapabilities and see no VALIDATED/INTERNET
 * capability, refusing to load. Every gate method in the stack reduces to three
 * pure android.net calls — NetworkCapabilities.hasCapability, hasTransport, and
 * NetworkInfo.isConnected — so we force those three to report "connected". This
 * reproduces the working reference patch with ZERO obfuscated app class names,
 * so it is version-proof and cannot desync the app from the real routing
 * network. The SIM branch of the gate is handled separately by SimGate.
 */
public final class NetworkBypass {

    private static final String TAG = HookEnv.TAG;

    private NetworkBypass() {}

    public static void install() {
        if (!HookEnv.config.networkBypass) {
            Log.i(TAG, "Network bypass disabled (config.networkBypass=false)");
            return;
        }

        // 1. NetworkCapabilities.hasCapability(cap) → true for the caps every
        //    gate ANDs together (VALIDATED 16, INTERNET 12, NOT_CONGESTED 19,
        //    plus NOT_RESTRICTED 13 / NOT_VPN 15 for good measure).
        try {
            Method hasCap = android.net.NetworkCapabilities.class.getMethod(
                    "hasCapability", int.class);
            Pine.hook(hasCap, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        int cap = (int) callFrame.args[0];
                        // 12=INTERNET 13=NOT_RESTRICTED 15=NOT_VPN
                        // 16=VALIDATED 18=NOT_ROAMING 19=NOT_CONGESTED
                        if (cap == 12 || cap == 13 || cap == 15
                                || cap == 16 || cap == 18 || cap == 19) {
                            callFrame.setResult(true);
                            if (HookEnv.config.debug) {
                                Log.d(TAG, "NetBypass: hasCapability("
                                        + cap + ") → true");
                            }
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "hasCapability hook error", e);
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook NetworkCapabilities.hasCapability", e);
        }

        // 2. NetworkCapabilities.hasTransport(t) → true. On the DHU the transport
        //    is ETHERNET and the app's checks may not accept it, so report every
        //    queried transport as present.
        try {
            Method hasTransport = android.net.NetworkCapabilities.class.getMethod(
                    "hasTransport", int.class);
            Pine.hook(hasTransport, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        callFrame.setResult(true);
                        if (HookEnv.config.debug) {
                            Log.d(TAG, "NetBypass: hasTransport("
                                    + callFrame.args[0] + ") → true");
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "hasTransport hook error", e);
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook NetworkCapabilities.hasTransport", e);
        }

        // 3. NetworkInfo.isConnected() → true. Legacy path
        //    (getActiveNetworkInfo().isConnected()).
        try {
            Method isConnected = android.net.NetworkInfo.class.getMethod("isConnected");
            Pine.hook(isConnected, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        callFrame.setResult(true);
                    } catch (Exception e) {
                        Log.e(TAG, "NetworkInfo.isConnected hook error", e);
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook NetworkInfo.isConnected", e);
        }

        Log.i(TAG, "Hook installed: Network connectivity bypass "
                + "(systemic: hasCapability + hasTransport + isConnected)");
    }
}
