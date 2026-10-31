package com.sj010.gboardclipboard.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Single source for every name that more than one patch needs.
 *
 * The provider authority and the signature permission live in global namespaces, so the
 * reference build keeps the documented names and every other host package gets a scoped
 * variant derived from [RENAMED_PACKAGE_NAME].
 */
internal object Constants {
    const val GBOARD_PACKAGE_NAME = "com.google.android.inputmethod.latin"
    const val PIXELBOARD_PACKAGE_NAME = "com.akshaykadam.pixelboard"
    const val RENAMED_PACKAGE_NAME = "com.sj010.gboard"

    const val PATCH_VERSION = "0.0.6-alpha"

    const val CLIPBOARD_PROVIDER_AUTHORITY = "com.sj010.gboardclipboard.history"
    const val CLIPBOARD_PERMISSION_NAME =
        "com.sj010.gboardclipboard.permission.READ_CLIPBOARD_HISTORY"
    const val CLIPBOARD_PERMISSION_NAME_SUFFIX = ".permission.READ_CLIPBOARD_HISTORY"
    const val CLIPBOARD_PROVIDER_CLASS =
        "com.sj010.gboardclipboard.extension.GboardClipboardHistoryProvider"
    const val CLIPBOARD_ACTIVITY_CLASS =
        "com.sj010.gboardclipboard.extension.GboardClipboardHistoryActivity"

    /**
     * Authority of the clipboard history provider for a given host package.
     *
     * Two patched keyboards installed side by side would clash on the global authority
     * namespace, so every host package other than the reference build gets its own.
     */
    fun providerAuthorityFor(packageName: String): String =
        if (packageName.isBlank() || packageName == RENAMED_PACKAGE_NAME) {
            CLIPBOARD_PROVIDER_AUTHORITY
        } else {
            "$packageName.gboardclipboard.history"
        }

    /**
     * Signature permission of the clipboard history provider for a given host package.
     */
    fun permissionNameFor(packageName: String): String =
        if (packageName.isBlank() || packageName == RENAMED_PACKAGE_NAME) {
            CLIPBOARD_PERMISSION_NAME
        } else {
            "$packageName$CLIPBOARD_PERMISSION_NAME_SUFFIX"
        }

    val TARGET_VERSIONS = listOf(
        AppTarget(version = "18.4.1.985164140-release-arm64-v8a", isExperimental = false),
        AppTarget(version = "18.3.1.977415014-release-arm64-v8a", isExperimental = false),
        AppTarget(version = "18.3.1.977415014-beta-arm64-v8a", isExperimental = false),
        AppTarget(version = "18.0.3.954559732-release-arm64-v8a", isExperimental = false),
        AppTarget(version = "18.4.1", isExperimental = false),
        AppTarget(version = "18.3.1", isExperimental = false),
        AppTarget(version = "18.2.0", isExperimental = false),
        AppTarget(version = "18.1.0", isExperimental = false),
        AppTarget(version = "18.0.3", isExperimental = false),
        AppTarget(version = "18.0.0", isExperimental = false),
    )

    val COMPATIBILITY_GBOARD = Compatibility(
        name = "Gboard",
        packageName = GBOARD_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2979FF,
        signatures = setOf(
            "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053",
            "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83",
        ),
        targets = TARGET_VERSIONS,
    )

    val COMPATIBILITY_PIXELBOARD = Compatibility(
        name = "PixelBoard",
        packageName = PIXELBOARD_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2979FF,
        targets = TARGET_VERSIONS,
    )
}
