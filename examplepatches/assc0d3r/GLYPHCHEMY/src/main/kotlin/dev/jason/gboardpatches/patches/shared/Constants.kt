package dev.jason.gboardpatches.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_18_8_TARGETS
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission

internal object Constants {
    const val GBOARD_PACKAGE_NAME = "com.google.android.inputmethod.latin"
    const val GBOARD_PATCHED_PACKAGE_NAME = "dev.jason.com.google.android.inputmethod.latin"
    const val GBOARD_PATCH_AUTHOR = "assc0d3r"
    const val GBOARD_PATCH_AUTHOR_URL = "https://github.com/assc0d3r"
    const val GBOARD_PATCH_REPOSITORY_URL = "https://github.com/assc0d3r/GLYPHCHEMY"
    val GBOARD_PATCH_VERSION = PatchBuildInfo.VERSION

    val COMPATIBILITY_GBOARD = Compatibility(
        name = "Gboard",
        packageName = GboardTargetAdmission.packageName,
        apkFileType = GboardTargetAdmission.apkFileType,
        appIconColor = 0x1A73E8,
        signatures = GboardTargetAdmission.signatures,
        targets = GboardTargetAdmission.versionNames.map { versionName ->
            AppTarget(
                version = versionName,
                isExperimental = false,
            )
        } + GBOARD_18_8_TARGETS.map { versionName ->
            AppTarget(
                version = versionName,
                isExperimental = false,
            )
        },
    )
}
