package app.jofslash.patches.listonic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.l"

    /** SHA-1 of Listonic's original signing certificate (CN=Listonic, Lodz). Kept for reference. */
    const val SIGNATURE = "fa8bd448727988fc5aaf96d8dc6be8c07fd216fc"

    /** Listonic's own ad layer keeps its class and method names. */
    const val AD_COMPANION = "Lcom/listonic/adcompanion/core"

    val COMPATIBILITY_LISTONIC = Compatibility(
        name = "Listonic",
        packageName = PACKAGE_NAME,
        // APKPure ships Listonic as an XAPK bundle (base + ABI, language and density splits).
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x3AB02A,
        targets = listOf(
            AppTarget(version = "9.25.1"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
