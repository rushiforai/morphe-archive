package app.subenoeva.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    /**
     * Honda RoadSync, the companion app for Honda motorcycles.
     *
     * Distributed as a split bundle, so the preferred file type is APKM.
     */
    val COMPATIBILITY_ROADSYNC = Compatibility(
        name = "RoadSync",
        packageName = "com.honda.ms.dm.sab",
        apkFileType = ApkFileType.APKM,
        // Honda red.
        appIconColor = 0xE60012,
        targets = listOf(
            // Confirmed working.
            AppTarget(
                version = "26.4.10",
            ),
            // The patches match on unobfuscated class names and string literals of the bundled
            // Drivemode music SDK, so newer targets are expected to work as well.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
