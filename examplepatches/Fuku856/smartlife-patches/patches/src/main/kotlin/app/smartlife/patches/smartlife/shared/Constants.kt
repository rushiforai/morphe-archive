package app.smartlife.patches.smartlife.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    const val PACKAGE_NAME_SMARTLIFE = "com.tuya.smartlife"

    val COMPATIBILITY_SMARTLIFE = Compatibility(
        name = "SmartLife",
        packageName = PACKAGE_NAME_SMARTLIFE,
        // SmartLife on APKMirror is distributed as an APKM (split) bundle.
        apkFileType = ApkFileType.APKM,
        // Icon accent color (info.json accent_color = 207cff).
        appIconColor = 0x207CFF,
        // SHA-256 of the original signing certificate (CN=www.tuya.com).
        // Used by the "Spoof signature" patch to keep the original signature.
        signatures = setOf(
            "0fc361999cc0c35ba8aca57daa5593a20cf55727702ea85ad7b3228949f888fe"
        ),
        targets = listOf(
            // Latest target, allowed experimentally. Kept so newer releases still
            // offer the resource-level patches without a code change.
            AppTarget(
                version = null,
                minSdk = 24,
                isExperimental = true
            ),
            // Version used to develop and confirm these patches.
            AppTarget(
                version = "7.12.0",
                minSdk = 24
            )
        )
    )
}
