package app.template.patches.callblacklist

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.callblacklist.Fingerprints.PremiumGatekeeperFingerprint
import app.template.patches.callblacklist.Fingerprints.PlaypassCheckFingerprint
import app.template.patches.callblacklist.Fingerprints.PurchaseVerifierFingerprint
import app.template.patches.shared.Constants.COMPATIBILITY_CALL_BLACKLIST 

@Suppress("unused")
val callBlacklistUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features.",
    default = true
) { 
    compatibleWith(COMPATIBILITY_CALL_BLACKLIST)

    execute {
        // 1. Force z.d(Context) to return true — the main premium gatekeeper
        val gatekeeperClass = classDefBy(PremiumGatekeeperFingerprint.definingClass!!)
        val dMatch = PremiumGatekeeperFingerprint.match(gatekeeperClass)
        dMatch.method.apply {
            implementation?.let { impl ->
                removeInstructions(0, impl.instructions.count())
                addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }
 
        // 2. Force z.e(Context) to return true — playpass/subscription check
        val eMatch = PlaypassCheckFingerprint.match(gatekeeperClass)
        eMatch.method.apply {
            implementation?.let { impl ->
                removeInstructions(0, impl.instructions.count())
                addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }
    }
}

@Suppress("unused")
val callBlacklistRemoveAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Disables all ad purchase checks to hide ads globally.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CALL_BLACKLIST)

    execute {
        // Force u2.b.f(), u2.b.g(), u2.b.h() to return true
        // BaseAdsActivity calls these directly to decide whether to show ads
        val verifierClass = classDefBy(PurchaseVerifierFingerprint.definingClass!!)
        val mutableClass = PurchaseVerifierFingerprint.match(verifierClass).classDef

        val methodNames = listOf("f", "g", "h")
        for (method in mutableClass.methods) {
            if (method.name in methodNames && method.returnType == "Z") {
                if (method.implementation == null) continue
                method.removeInstructions(0, method.instructions.count())
                method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }
    }
}