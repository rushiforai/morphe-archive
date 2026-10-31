package com.dhuadapter.sysprops;

import android.util.Log;

import com.dhuadapter.core.HookEnv;
import com.dhuadapter.core.SharedHooks;

/**
 * Categories 2+3 (shared) — SystemProperties spoof.
 *
 * Root props (ro.build.tags / ro.debuggable / ro.secure / …) are spoofed when
 * config.rootBypass; qemu / goldfish / ranchu / genymotion props when
 * config.emulatorBypass. This no longer hooks SystemProperties.get itself —
 * it registers a resolver into SharedHooks, which places the SINGLE guarded
 * hook (both get overloads, shared IN_SYSPROP_HOOK re-entrancy guard against the
 * Pine.log→ICU recursion / Telegram SIGSEGV). Gate-aware dispatch stays in the
 * pure, unit-tested PropSpoofTable.
 */
public final class SystemPropertiesSpoof {

    private static final String TAG = HookEnv.TAG;

    private SystemPropertiesSpoof() {}

    public static void install() {
        if (!HookEnv.config.rootBypass && !HookEnv.config.emulatorBypass) {
            return;
        }
        // Register a single resolver; SharedHooks installs the one guarded hook.
        SharedHooks.registerSysPropResolver(key -> PropSpoofTable.spoof(
                HookEnv.config.rootBypass, HookEnv.config.emulatorBypass, key));
        Log.i(TAG, "Registered: SystemProperties spoof resolver "
                + "(root=" + HookEnv.config.rootBypass
                + " emulator=" + HookEnv.config.emulatorBypass + ") via SharedHooks");
    }
}
