package app.whatsapp.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Shared compatibility definitions for WhatsApp Clean Experience patches.
 *
 * WhatsApp Clean Experience is an independent community project.
 * Not affiliated with WhatsApp, Meta, or Morphe.
 */
object Constants {
    /**
     * WhatsApp compatibility declaration.
     *
     * Target version: 2.26.46.76 (confirmed APKM from APKMirror).
     * Other versions are marked experimental since fingerprints
     * may not resolve on untested builds.
     */
    val WHATSAPP_COMPATIBILITY = Compatibility(
        name = "WhatsApp",
        packageName = "com.whatsapp",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x24D464,
        targets = listOf(
            AppTarget(
                version = "2.26.46.76"
            ),
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Other versions may work but have not been tested."
            )
        )
    )

    /** Patch version identifier shown in the settings screen. */
    const val PATCH_VERSION = "1.1.0"

    /** Project display name. */
    const val PROJECT_NAME = "WhatsApp Clean Experience"

    /** Project description shown in settings. */
    const val PROJECT_DESCRIPTION = "Kustomisasi antarmuka WhatsApp melalui Morphe patches."
}
