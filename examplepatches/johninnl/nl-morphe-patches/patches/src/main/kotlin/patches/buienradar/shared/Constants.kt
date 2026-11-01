package patches.buienradar.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_BUIENRADAR = Compatibility(
        name = "Buienradar",
        packageName = "com.supportware.Buienradar",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x243C88,
        // Rotated signing lineage: the API 24-32 signer and the API 33+ signer.
        signatures = setOf(
            "4392d8f67eedd4d2c52370e69911df3ad465d6d6f7d7176cd5f2b4bdefcca9cc",
            "80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92",
        ),
        targets = listOf(
            AppTarget(
                version = "7.4.8",
                versionCode = 7897,
                minSdk = 28
            )
        )
    )
    val originalInput = patches.shared.originalInput(COMPATIBILITY_BUIENRADAR,
        additionalMinSdksByVersion = mapOf("7.4.8" to setOf(29, 32)))
}
