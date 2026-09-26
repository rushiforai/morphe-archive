package app.plyrs1.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Compatibility definition for Struk POM (com.garnesapps.strukpom).
     */
    val COMPATIBILITY_STRUKPOM = Compatibility(
        name = "Struk POM",
        packageName = "com.garnesapps.strukpom",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget(version = "1.17.057"),
            AppTarget(version = null, isExperimental = true)
        )
    )

    /**
     * Compatibility definition for Cetak Struk Pom / SPBU (com.ogestudio.strukpertamini).
     */
    val COMPATIBILITY_STRUKPERTAMINI = Compatibility(
        name = "Struk Pom / SPBU",
        packageName = "com.ogestudio.strukpertamini",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00897B,
        targets = listOf(
            AppTarget(version = "1.2.7"),
            AppTarget(version = null, isExperimental = true)
        )
    )

    /**
     * Compatibility definition for Pertaminiku (com.pertaminiku).
     */
    val COMPATIBILITY_PERTAMINIKU = Compatibility(
        name = "Pertaminiku",
        packageName = "com.pertaminiku",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE53935,
        targets = listOf(
            AppTarget(version = "1.0.2"),
            AppTarget(version = null, isExperimental = true)
        )
    )

    /**
     * Compatibility definition for E-Ujian Browser (com.doovera.eujianbrowser).
     */
    val COMPATIBILITY_EUJIANBROWSER = Compatibility(
        name = "E-Ujian Browser",
        packageName = "com.doovera.eujianbrowser",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(
            AppTarget(version = "3.1.3"),
            AppTarget(version = null, isExperimental = true)
        )
    )

    /**
     * Generic example compatibility target.
     */
    val COMPATIBILITY_EXAMPLE = Compatibility(
        name = "Example App",
        packageName = "com.example.app",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(version = "1.0.0"),
            AppTarget(version = null, isExperimental = true)
        )
    )
}
