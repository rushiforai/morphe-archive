/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2470
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file.
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * Section 7b: Notice Preservation
 * -------------------------------
 * This entire comment block must be preserved in all copies,
 * distributions, and derivative works of this file, in both
 * original and modified source forms.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package io.github.hiosdra.patches.extension.f1tv.versioncode;

import android.content.pm.PackageInfo;

/**
 * F1 TV adaptation of Morphe's version-code helper.
 *
 * Source attribution:
 * https://github.com/MorpheApp/morphe-patches/blob/main/extensions/all/change-version-code/src/main/java/app/morphe/extension/all/versioncode/DisablePlayStoreUpdatesPatch.java
 * Source revision used: 38c13fa35e05e4df87d28445428e1fadf1bc5ea9
 */
public class F1TvDisablePlayStoreUpdatesPatch {

    private static int originalVersionCode() {
        return 0; // Return value is changed during patching.
    }

    /** Injection point. */
    public static int getVersionCode(PackageInfo info) {
        final int versionCode = info.versionCode;

        if (versionCode == Integer.MAX_VALUE) {
            return originalVersionCode();
        }
        return versionCode;
    }

    /** Injection point. */
    public static long getVersionCodeLong(PackageInfo info) {
        final long versionCode = info.getLongVersionCode();

        final long lowerBitMask = 0x00000000FFFFFFFFL;
        if ((versionCode & lowerBitMask) == Integer.MAX_VALUE) {
            // Keep versionCodeMajor untouched and restore the original lower bits.
            return (versionCode & 0xFFFFFFFF00000000L)
                    | (originalVersionCode() & lowerBitMask);
        }
        return versionCode;
    }
}
