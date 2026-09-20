/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2470
 */

package app.morphe.extension.shared.patches;

import android.content.pm.PackageInfo;
import android.os.Build;

import androidx.annotation.RequiresApi;

@SuppressWarnings("unused")
public class DisablePlayStoreUpdatesPatch {

    private static int originalVersionCode() {
        return 0; // Return value is changed during patching.
    }

    /**
     * Injection point.
     */
    @SuppressWarnings("deprecation")
    public static int getVersionCode(PackageInfo info) {
        final int versionCode = info.versionCode;

        if (versionCode == Integer.MAX_VALUE) {
            return originalVersionCode();
        }
        return versionCode;
    }

    /**
     * Injection point.
     */
    @RequiresApi(api = Build.VERSION_CODES.P)
    public static long getVersionCodeLong(PackageInfo info) {
        final long versionCode = info.getLongVersionCode();

        final long lowerBitMask = 0x00000000FFFFFFFFL;
        if ((versionCode & lowerBitMask) == Integer.MAX_VALUE) {
            // Keep the upper 32 bits (versionCodeMajor) untouched,
            // swap in the original version code for the lower 32 bits.
            return (versionCode & 0xFFFFFFFF00000000L)
                    | (originalVersionCode() & lowerBitMask);
        }
        return versionCode;
    }
}
