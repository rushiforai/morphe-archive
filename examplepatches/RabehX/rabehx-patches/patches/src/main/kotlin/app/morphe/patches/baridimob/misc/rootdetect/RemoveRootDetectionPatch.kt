/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.baridimob.misc.rootdetect

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.baridimob.shared.BaridimobConstants

/**
 * Disables the rooted-device check so the app runs on rooted devices.
 * Three seams:
 *  1. RootCheckerFactory.getRootChecker → returns NoCheckRootChecker
 *     (the SDK's built-in no-op checker).
 *  2. CommandSuRootChecker.checkDeviceRooted → false.
 *  3. RootCheckerImpl.checkDeviceRooted → false.
 */
@Suppress("unused")
val removeRootDetectionPatch = bytecodePatch(
    name = "Disable root detection",
    description = "Disables the rooted-device check so the app runs on rooted devices.",
    default = true,
) {
    compatibleWith(BaridimobConstants.COMPATIBILITY_BARIDIMOB)

    execute {
        val rootCheckerFactoryFingerprint = object : Fingerprint(
            definingClass = "Lru/bpc/mobilebank/android/di/RootCheckerFactory;",
            name = "getRootChecker",
            returnType = "Lru/bpc/mobilebanksdk/DI/RootChecker;",
            parameters = listOf(),
        ) {}

        runCatching { rootCheckerFactoryFingerprint.method }.getOrNull()?.let { method ->
            method.addInstructions(
                0,
                """
                    new-instance v0, Lru/bpc/mobilebanksdk/DI/impl/NoCheckRootChecker;
                    invoke-direct {v0}, Lru/bpc/mobilebanksdk/DI/impl/NoCheckRootChecker;-><init>()V
                    return-object v0
                """,
            )
        }

        listOf(
            object : Fingerprint(
                definingClass = "Lru/bpc/mobilebanksdk/DI/impl/CommandSuRootChecker;",
                name = "checkDeviceRooted",
                returnType = "Z",
                parameters = listOf(),
            ) {},
            object : Fingerprint(
                definingClass = "Lru/bpc/mobilebanksdk/DI/impl/RootCheckerImpl;",
                name = "checkDeviceRooted",
                returnType = "Z",
                parameters = listOf(),
            ) {},
        ).forEach { fingerprint ->
            runCatching { fingerprint.method }.getOrNull()?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )
            }
        }
    }
}
