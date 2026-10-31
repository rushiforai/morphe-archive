package com.dhuadapter.capture;

import android.util.Log;

import java.lang.reflect.Method;

import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 7 — Capture / mirroring. gate: config.allowCapture
 *
 * Strips FLAG_SECURE (SurfaceView / SurfaceControl.setSecure, Window
 * add/setFlags) so the app's screen can be captured / mirrored where the app
 * marks its own window secure and would otherwise block it (blank frame).
 */
public final class CaptureHooks {

    private static final String TAG = HookEnv.TAG;
    private static final int FLAG_SECURE = 0x2000;

    private CaptureHooks() {}

    public static void install() {
        if (!HookEnv.config.allowCapture) {
            Log.i(TAG, "FLAG_SECURE strip disabled (config.allowCapture=false)");
            return;
        }

        // beforeCall hook that forces arg[0] boolean to FALSE (setSecure(false))
        MethodHook forceSecureFalse = new MethodHook() {
            @Override
            public void beforeCall(Pine.CallFrame callFrame) {
                try {
                    Object[] args = callFrame.args;
                    if (args != null && args.length > 0) {
                        args[0] = Boolean.FALSE;
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "setSecure hook error", t);
                }
            }
        };

        // 1. SurfaceView.setSecure(boolean) → false
        try {
            Method m = android.view.SurfaceView.class.getDeclaredMethod(
                    "setSecure", boolean.class);
            m.setAccessible(true);
            Pine.hook(m, forceSecureFalse);
            Log.i(TAG, "FlagSecureStrip: hooked SurfaceView.setSecure → false");
        } catch (Throwable t) {
            Log.w(TAG, "SurfaceView.setSecure not hookable: " + t);
        }

        // 2. SurfaceControl.setSecure(...) → false. Signature varies by API /
        //    vendor (hidden API), so hook ANY method named "setSecure" and force
        //    its last boolean arg to false.
        try {
            Class<?> sc = Class.forName("android.view.SurfaceControl");
            int hooked = 0;
            for (Method m : sc.getDeclaredMethods()) {
                if (!"setSecure".equals(m.getName())) {
                    continue;
                }
                m.setAccessible(true);
                Pine.hook(m, new MethodHook() {
                    @Override
                    public void beforeCall(Pine.CallFrame callFrame) {
                        try {
                            Object[] args = callFrame.args;
                            if (args != null) {
                                for (int i = args.length - 1; i >= 0; i--) {
                                    if (args[i] instanceof Boolean) {
                                        args[i] = Boolean.FALSE;
                                        break;
                                    }
                                }
                            }
                        } catch (Throwable t) {
                            Log.e(TAG, "SurfaceControl.setSecure hook error", t);
                        }
                    }
                });
                hooked++;
            }
            Log.i(TAG, "FlagSecureStrip: hooked SurfaceControl.setSecure x" + hooked);
        } catch (Throwable t) {
            Log.w(TAG, "SurfaceControl.setSecure not hookable: " + t);
        }

        // 2b. SurfaceControl.Transaction.setSecure(SurfaceControl, boolean) on
        //     newer APIs — same treatment, force the boolean arg to false.
        try {
            Class<?> tx = Class.forName("android.view.SurfaceControl$Transaction");
            int hooked = 0;
            for (Method m : tx.getDeclaredMethods()) {
                if (!"setSecure".equals(m.getName())) {
                    continue;
                }
                m.setAccessible(true);
                Pine.hook(m, new MethodHook() {
                    @Override
                    public void beforeCall(Pine.CallFrame callFrame) {
                        try {
                            Object[] args = callFrame.args;
                            if (args != null) {
                                for (int i = args.length - 1; i >= 0; i--) {
                                    if (args[i] instanceof Boolean) {
                                        args[i] = Boolean.FALSE;
                                        break;
                                    }
                                }
                            }
                        } catch (Throwable t) {
                            Log.e(TAG, "Transaction.setSecure hook error", t);
                        }
                    }
                });
                hooked++;
            }
            if (hooked > 0) {
                Log.i(TAG, "FlagSecureStrip: hooked Transaction.setSecure x" + hooked);
            }
        } catch (Throwable t) {
            // Transaction.setSecure absent on this API — fine.
        }

        // 3. Window.addFlags(int) → strip FLAG_SECURE
        try {
            Method m = android.view.Window.class.getMethod("addFlags", int.class);
            Pine.hook(m, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        int flags = (int) callFrame.args[0];
                        if ((flags & FLAG_SECURE) != 0) {
                            callFrame.args[0] = flags & ~FLAG_SECURE;
                        }
                    } catch (Throwable t) {
                        Log.e(TAG, "Window.addFlags hook error", t);
                    }
                }
            });
            Log.i(TAG, "FlagSecureStrip: hooked Window.addFlags (strip FLAG_SECURE)");
        } catch (Throwable t) {
            Log.w(TAG, "Window.addFlags not hookable: " + t);
        }

        // 4. Window.setFlags(int flags, int mask) → strip FLAG_SECURE from both
        try {
            Method m = android.view.Window.class.getMethod(
                    "setFlags", int.class, int.class);
            Pine.hook(m, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        int flags = (int) callFrame.args[0];
                        int mask = (int) callFrame.args[1];
                        callFrame.args[0] = flags & ~FLAG_SECURE;
                        callFrame.args[1] = mask & ~FLAG_SECURE;
                    } catch (Throwable t) {
                        Log.e(TAG, "Window.setFlags hook error", t);
                    }
                }
            });
            Log.i(TAG, "FlagSecureStrip: hooked Window.setFlags (strip FLAG_SECURE)");
        } catch (Throwable t) {
            Log.w(TAG, "Window.setFlags not hookable: " + t);
        }

        Log.i(TAG, "Hook installed: FLAG_SECURE strip "
                + "(SurfaceView/SurfaceControl/Window)");
    }
}
