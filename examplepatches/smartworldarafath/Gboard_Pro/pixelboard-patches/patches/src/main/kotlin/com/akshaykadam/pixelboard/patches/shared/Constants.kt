package com.akshaykadam.pixelboard.patches.shared

import com.akshaykadam.pixelboard.patches.gboard.shared.generated.GboardTargetAdmission

internal object Constants {
    const val GBOARD_PACKAGE_NAME = "com.google.android.inputmethod.latin"
    const val GBOARD_PATCHED_PACKAGE_NAME = "com.gboardpro.app"
    const val GBOARD_PATCH_AUTHOR = "Arafath"
    const val GBOARD_PATCH_AUTHOR_URL = "https://github.com/smartworldarafath"
    const val GBOARD_PATCH_REPOSITORY_URL = "https://github.com/smartworldarafath/Gboard_Pro"
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
        },
    )
}
