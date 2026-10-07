package mightymich.morphe.patches.com.sofascore.results.skiplogin

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipLoginPatch = bytecodePatch(
    name = "Bypass Login Requirements",
    description = "Skips SofaScore login requirement by forcing isLoggedIn to true.",
    default = false
) {
    compatibleWith(SofaScoreLoginCompatibility.SOFASCORE_LOGIN)

    val isLoggedInFingerprint = Fingerprint(
        definingClass = "Lcom/sofascore/local_persistence/UserAccount;",
        name = "isLoggedIn",
        returnType = "Z"
    )

    execute {
        isLoggedInFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isLoggedIn method.")
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
