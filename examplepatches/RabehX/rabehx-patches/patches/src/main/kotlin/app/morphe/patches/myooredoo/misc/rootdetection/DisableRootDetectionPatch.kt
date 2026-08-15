/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.rootdetection

import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Disables root / jailbreak / emulator / frida detection:
 *  - Rttx.r() orchestrator (com.android.sec.utils)
 *  - BinaryProtections checks (com.example.ooredoo_selfcare_algeria)
 *  - safe_device RootedCheck / ExternalStorageCheck / EmulatorCheck
 *  - rjsniffer Emulate.isEmulator / isEmulator2
 *  - RootCheckerPlus root checker
 *
 * Every dedicated boolean check method is rewritten to `return false`,
 * so no channel ever reports a "detected" state.
 */
@Suppress("unused")
val disableRootDetectionPatch = bytecodePatch(
    name = "Disable root & emulator detection",
    description = "Forces every root, jailbreak, emulator and frida check in the app to report " +
            "a clean device, so no blocking dialog is shown on modified/rooted environments.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        val forceFalseMethods = listOf(
            // Rttx orchestrator
            object : Fingerprint(
                definingClass = "Lcom/android/sec/utils/Rttx;",
                name = "r",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            // BinaryProtections individual checks
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "checkSUBinaries",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "checkKnownRootedAPK",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "checkOTACerts",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "checkTestKeys",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "detectKnownRootCloakingPackages",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "detectPotentiallyDangerousApps",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "runSuCommand",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/example/ooredoo_selfcare_algeria/BinaryProtections;",
                name = "isXposedActive",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            // safe_device backing checks
            object : Fingerprint(
                definingClass = "Lcom/xamdesign/safe_device/Rooted/RootedCheck;",
                name = "isJailBroken",
                returnType = "Z",
                parameters = listOf("Landroid/content/Context;"),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/xamdesign/safe_device/ExternalStorage/ExternalStorageCheck;",
                name = "isOnExternalStorage",
                returnType = "Z",
                parameters = listOf("Landroid/content/Context;"),
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/xamdesign/safe_device/Emulator/EmulatorCheck;",
                name = "isEmulator",
                parameters = listOf(),
                returnType = "Z",
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/emrys/rjsniffer/rjsniffer/Emulate;",
                name = "isEmulator2",
                parameters = listOf(),
                returnType = "Z",
            ) {},
            object : Fingerprint(
                definingClass = "Lcom/emrys/rjsniffer/rjsniffer/Emulate;",
                name = "isEmulator",
                parameters = listOf(),
                returnType = "Z",
            ) {},
        )

        forceFalseMethods.forEach { fingerprint ->
            runCatching { fingerprint.method }.getOrNull()?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """
                )
            }
        }

        // RootCheckerPlus exposes this result through Flutter's void
        // onMethodCall callback. Returning an integer from a void method
        // produces invalid dex; report false through Result.success instead.
        val rootCheckerPlusFingerprint = object : Fingerprint(
            definingClass = "Lcom/example/root_checker_plus/RootCheckerPlusPlugin;",
            name = "onMethodCall",
            returnType = "V",
            parameters = listOf(
                "Lio/flutter/plugin/common/MethodCall;",
                "Lio/flutter/plugin/common/MethodChannel\$Result;",
            ),
            strings = listOf("isRootChecker"),
        ) {}

        runCatching { rootCheckerPlusFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """
            )
        }

        // Rjsniffer's runprog root check is a separate Flutter channel from
        // RootCheckerPlus. Keep this patch complete when the developer-options
        // patch is not selected.
        val rjsnifferRootFingerprint = object : Fingerprint(
            definingClass = "Lcom/emrys/rjsniffer/rjsniffer/RjsnifferPlugin;",
            name = "onMethodCall",
            returnType = "V",
            parameters = listOf(
                "Lio/flutter/plugin/common/MethodCall;",
                "Lio/flutter/plugin/common/MethodChannel\$Result;",
            ),
            strings = listOf("runprog"),
        ) {}

        runCatching { rjsnifferRootFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """
            )
        }
    }
}
