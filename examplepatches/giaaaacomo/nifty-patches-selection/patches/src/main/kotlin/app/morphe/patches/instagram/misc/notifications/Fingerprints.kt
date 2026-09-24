/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.instagram.misc.notifications

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val EXTENSION_CLASS =
    "Lapp/morphe/extension/instagram/patches/ForceNotificationGroupingPatch;"

internal object BuildDefaultGroupingModeFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "buildDefaultGroupingMode",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf()
)

internal object BuildDefaultStrictAllGroupingFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "buildDefaultStrictAllGrouping",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf()
)

internal object BuildDefaultDebugLoggingFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "buildDefaultDebugLogging",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf()
)
