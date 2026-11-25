package app.stayfree.patches.login

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE

@Suppress("unused")
val removeDrawerSignInPatch = bytecodePatch(
    name = "Remove drawer sign-in",
    description = "Removes the \"Sign into StayFree\" account row from the bottom of the side " +
        "menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        // Return before the composable starts its restart group: it then emits nothing, which
        // keeps the drawer's Compose groups balanced (the caller opens and closes its own).
        DrawerAccountFooterFingerprint.method.addInstruction(0, "return-void")
    }
}
