/*
 * Expert RAW patches for Morphe.
 * Licensed under the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file of this repository.
 */

package app.morphe.patches.expertraw.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val APP = "Lcom/samsung/android/app/galaxyraw"
    const val EXTENSION = "Lapp/morphe/extension/expertraw"

    val COMPATIBILITY_EXPERT_RAW = Compatibility(
        name = "Expert RAW",
        packageName = "com.samsung.android.app.galaxyraw",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A1A1A,
        signatures = setOf(
            // Samsung release key (v3 signer certificate SHA-256).
            "34df0e7a9f1cf1892e45c056b4973cd81ccf148a4050d11aea4ac5a65f900a42"
        ),
        targets = listOf(
            AppTarget(
                version = "6.0.02.8",
                minSdk = 37
            )
        )
    )
}
