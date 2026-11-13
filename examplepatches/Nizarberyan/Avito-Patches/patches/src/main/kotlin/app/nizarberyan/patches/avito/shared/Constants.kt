package app.nizarberyan.patches.avito.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_AVITO = Compatibility(
        name = "Avito",
        packageName = "se.scmv.morocco",
        // Avito is distributed as split APKs (base + native library split).
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2B5BEA,
        targets = listOf(
            // Version the patches were developed and verified against.
            AppTarget(version = "10.8.1"),
            // Fingerprints do not rely on obfuscated names, so other versions may work.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}
