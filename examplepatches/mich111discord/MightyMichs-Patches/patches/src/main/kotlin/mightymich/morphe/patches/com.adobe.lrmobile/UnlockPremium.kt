package mightymich.morphe.patches.com.adobe.lrmobile

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Lightroom Premium",
    description = "Unlocks Adobe Lightroom Premium by forcing the subscription check to return true.",
    default = true
) {
    compatibleWith(LightroomCompatibility.LIGHTROOM)


    val subscriptionFingerprint = Fingerprint(
        definingClass = "Lr4/a;",
        name = "f",
        returnType = "Z"
    )

    execute {
        subscriptionFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find r4.a.f method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
