package arpit.morphe.patches.bestronger.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BESTRONGER = Compatibility(
        name = "Home workouts BeStronger",
        packageName = "com.shvagerfm.bestronger",
        // APKPure ships the app as an XAPK v2 split container (base APK plus ABI,
        // density and locale splits). The base APK carries no native libraries and
        // declares `requiredSplitTypes="base__abi,base__density"`, so it is not
        // installable on its own; the whole container is the patch input.
        apkFileType = ApkFileType.XAPK,
        // Brand red of the launcher icon artwork.
        appIconColor = 0xFF4134,
        targets = listOf(
            AppTarget(
                // Version and versionCode as reported by the XAPK manifest.json.
                version = "7.6.9",
                versionCode = 670,
            )
        )
    )
}
