package arpit.morphe.patches.healthifyme.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HEALTHIFYME = Compatibility(
        name = "HealthifyMe",
        packageName = "com.healthifyme.basic",
        // Uptodown / APKPure both serve the app as an XAPK split container
        // (APKMirror does not host this package).
        apkFileType = ApkFileType.XAPK,
        // Deep teal of the app icon.
        appIconColor = 0x21695C,
        targets = listOf(
            AppTarget(
                // The real versionName carries a leading "v" (AndroidManifest.xml
                // and XAPK manifest.json both say "v31.5").
                version = "v31.5"
            ),
            AppTarget(
                version = "v31.6"
            )
        )
    )
}
