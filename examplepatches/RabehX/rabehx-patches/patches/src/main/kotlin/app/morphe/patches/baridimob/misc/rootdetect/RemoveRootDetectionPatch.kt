/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.baridimob.misc.rootdetect

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patches.baridimob.shared.BaridimobConstants
import app.morphe.patches.shared.returnEarlyAll

@Suppress("unused")
val removeRootDetectionPatch = patch(
    name = "Disable root detection",
    description = "Disables the rooted-device check so the app runs on rooted devices.",
    default = true,
) {
    category("Security")
    compatibleWith(BaridimobConstants.COMPATIBILITY_BARIDIMOB)

    execute {
        mutableClassDefByOrNull("Lru/bpc/mobilebank/android/di/RootCheckerFactory;")
            ?.methods?.firstOrNull { it.name == "getRootChecker" }
            ?.addInstructions(
                0,
                """
                    new-instance v0, Lru/bpc/mobilebanksdk/DI/impl/NoCheckRootChecker;
                    invoke-direct {v0}, Lru/bpc/mobilebanksdk/DI/impl/NoCheckRootChecker;-><init>()V
                    return-object v0
                """,
            )

        listOf(
            "Lru/bpc/mobilebanksdk/DI/impl/CommandSuRootChecker;",
            "Lru/bpc/mobilebanksdk/DI/impl/RootCheckerImpl;",
        ).forEach { cls ->
            mutableClassDefByOrNull(cls)?.returnEarlyAll(false) { it.name == "checkDeviceRooted" }
        }
    }
}
