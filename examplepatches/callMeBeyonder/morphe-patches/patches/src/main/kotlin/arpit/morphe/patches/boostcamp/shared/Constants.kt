package arpit.morphe.patches.boostcamp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BOOSTCAMP = Compatibility(
        name = "Boostcamp",
        packageName = "com.bpmhealth.boostcamp",
        // APKPure distributes the app as an XAPK split container (base APK plus ABI,
        // density and locale splits); the base APK alone is not installable.
        apkFileType = ApkFileType.XAPK,
        // Dark aubergine of the launcher icon background.
        appIconColor = 0x2A2132,
        targets = listOf(
            AppTarget(
                // Version as reported by the XAPK manifest.json.
                version = "267"
            )
        )
    )
}
