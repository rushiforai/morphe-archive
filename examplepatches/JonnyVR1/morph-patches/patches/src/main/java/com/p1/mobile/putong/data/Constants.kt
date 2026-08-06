package com.p1.mobile.putong.data

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

/**
 * Actual package name of the installed Tantan app, as reported in its
 * AndroidManifest.xml (`package="com.tantantribe.tribe"`).
 *
 * Note: decompilers (e.g. jadx) rename the real `com.p1` segment to `com.p335p1`
 * to avoid Java identifier collisions with generated code. The actual app package
 * name is `com.tantantribe.tribe`, but the internal dex class names remain
 * `com.p1.mobile.putong.data.*`, which is what must be used for class-name string
 * matching against the target APK's dex files.
 */
internal const val TANTAN_PACKAGE_NAME = "com.tantantribe.tribe"

/** Real dex class name of `Settings`, matching the actual APK bytecode (not the decompiler's renamed package). */
internal const val TANTAN_SETTINGS_CLASS = "Lcom/p1/mobile/putong/data/Settings;"

/** Real dex class name of `User`, matching the actual APK bytecode (not the decompiler's renamed package). */
internal const val TANTAN_USER_CLASS = "Lcom/p1/mobile/putong/data/User;"

/**
 * Shared compatibility declaration for all Tantan patches.
 *
 * Targets the specific Tantan version we're currently working with.
 */
internal val tantanCompatibility = Compatibility(
    name = "Tantan",
    packageName = TANTAN_PACKAGE_NAME,
    description = "Tantan - Global Dating App",
    apkFileType = ApkFileType.APK_REQUIRED,
    targets = listOf(
        AppTarget(
            version = "7.3.3",
            description = "Tested on 7.3.3",
        )
    )
)
