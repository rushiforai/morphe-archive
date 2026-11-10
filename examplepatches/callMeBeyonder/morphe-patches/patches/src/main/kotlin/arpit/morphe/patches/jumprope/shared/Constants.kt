package arpit.morphe.patches.jumprope.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_JUMPROPE = Compatibility(
        name = "Jump Rope Challenge",
        packageName = "com.muzudre.jump.rope.training.challenges.jumprope",
        // APKPure distributes the app as an XAPK split container (base APK plus ABI,
        // density and locale splits); the base APK alone is not installable.
        apkFileType = ApkFileType.XAPK,
        // Sampled average non-white launcher icon color (icon.png 512x512).
        appIconColor = 0x2A39FF,
        targets = listOf(
            AppTarget(
                // Version as reported by the XAPK manifest.json.
                version = "1.8.1"
            )
        )
    )
}
