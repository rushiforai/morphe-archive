package app.jackblk.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val SLEEPA_COMPATIBILITY = Compatibility(
        name = "Sleepa", // App name as it appears in the Android launcher.
        packageName = "net.relaxio.sleepo",
        apkFileType = ApkFileType.XAPK, // Distributed as an XAPK (split APKs).
        appIconColor = 0x2549A6, // Approx brand blue from the in-app gradient; adjust to match the launcher icon.
        targets = listOf(
            // versionName is literally "4.3.0(135)" (includes the build number).
            AppTarget(
                version = "4.3.0(135)",
            ),
        ),
    )
}
