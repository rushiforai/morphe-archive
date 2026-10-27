package app.template.patches.expertplayer.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EXPERTPLAYER
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Experimental: unlocks premium features. Server features stay locked.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_EXPERTPLAYER)

    execute {
        // EntitlementInfo has a single constructor, (String identifier, Z isActive, Z willRenew, ...).
        // Fails loudly if the toString anchor or that constructor shape changes.
        val constructors = EntitlementInfoToStringFingerprint.classDef.methods.filter {
            val parameters = it.parameterTypes.map { type -> type.toString() }
            it.name == "<init>" && it.implementation != null && parameters.size > 2 &&
                parameters[0] == "Ljava/lang/String;" && parameters[1] == "Z"
        }
        val constructor = constructors.singleOrNull()
            ?: throw PatchException("expected one EntitlementInfo(String, Z, ...) constructor, found ${constructors.size}")

        // Writes isActive = true before the original field store, so the value stored is always true.
        constructor.addInstructionsChecked(0, "const/4 p2, 0x1")
    }
}
