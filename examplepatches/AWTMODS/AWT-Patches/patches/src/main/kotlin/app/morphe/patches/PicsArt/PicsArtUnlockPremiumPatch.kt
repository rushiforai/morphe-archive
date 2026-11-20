package app.morphe.patches.picsart

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val picsartUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks premium features in Picsart.",
    default = true,
) {
    dependsOn(picsartBypassSignatureCheckPatch)
    compatibleWith(COMPATIBILITY_PICSART)

    execute {
        val ctor = mutableClassDefBy(ActiveSubscriptionInfoToStringFingerprint.classDef)
            .methods
            .first { it.name == "<init>" }

        // p0 = this, p1 = isUserSubscribed (first constructor argument).
        ctor.addInstructions(
            0,
            "const/4 p1, 0x1"
        )
    }
}
