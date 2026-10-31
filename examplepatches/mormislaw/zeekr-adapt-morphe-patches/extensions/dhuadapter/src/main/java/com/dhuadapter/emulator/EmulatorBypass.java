package com.dhuadapter.emulator;

import android.os.Build;
import android.util.Log;

import com.dhuadapter.core.BuildFields;
import com.dhuadapter.core.HookEnv;

/**
 * Category 3 — Emulator Detection Bypass. gate: config.emulatorBypass
 *
 * De-genericise Build.* so emulator / AOSP fingerprints look like a real
 * Pixel 5. Needed only when running on an emulator; on a real head unit it is
 * dead weight (and the shared SystemProperties spoof it pairs with is the
 * hottest hook), so it is OFF by default. The qemu/goldfish SystemProperties
 * spoofing is shared with root in com.dhuadapter.sysprops.SystemPropertiesSpoof.
 */
public final class EmulatorBypass {

    private static final String TAG = HookEnv.TAG;

    private EmulatorBypass() {}

    public static void install() {
        if (!HookEnv.config.emulatorBypass) {
            Log.i(TAG, "Emulator bypass disabled (config.emulatorBypass=false)");
            return;
        }

        String fp = Build.FINGERPRINT;
        if (fp == null || fp.contains("generic") || fp.contains("unknown")
                || fp.contains("test-keys") || fp.contains("vbox")
                || fp.contains("sdk_gphone") || fp.contains("emulator")
                || fp.contains("genymotion")) {
            BuildFields.setBuildField("FINGERPRINT",
                    "google/redfin/redfin:13/TQ3A.230805.001/10316531:user/release-keys");
        }
        // De-emulator identifying fields (Genymotion = vbox86 / Genymotion)
        String product = Build.PRODUCT;
        if (product == null || product.contains("sdk") || product.contains("vbox")
                || product.contains("genymotion") || product.contains("emulator")
                || product.contains("generic")) {
            BuildFields.setBuildField("PRODUCT", "redfin");
            BuildFields.setBuildField("DEVICE", "redfin");
            BuildFields.setBuildField("MODEL", "Pixel 5");
            BuildFields.setBuildField("MANUFACTURER", "Google");
            BuildFields.setBuildField("BRAND", "google");
            BuildFields.setBuildField("HARDWARE", "redfin");
            BuildFields.setBuildField("BOARD", "redfin");
        }
        Log.i(TAG, "Hook installed: Emulator detection bypass (Build.* de-genericised)");
    }
}
