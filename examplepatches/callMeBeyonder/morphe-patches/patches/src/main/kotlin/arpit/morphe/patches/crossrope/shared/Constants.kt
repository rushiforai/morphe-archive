package arpit.morphe.patches.crossrope.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CROSSROPE = Compatibility(
        name = "Crossrope",
        packageName = "ca.awesome.travis.crossrope.crossrope",
        // APKPure distributes the app as an XAPK split container (base APK plus ABI,
        // density and locale splits); the base APK alone is not installable.
        apkFileType = ApkFileType.XAPK,
        // Mint green of the launcher icon artwork.
        appIconColor = 0x75C696,
        targets = listOf(
            AppTarget(
                // Version as reported by the XAPK manifest.json.
                version = "9.3.9"
            )
        )
    )
}
