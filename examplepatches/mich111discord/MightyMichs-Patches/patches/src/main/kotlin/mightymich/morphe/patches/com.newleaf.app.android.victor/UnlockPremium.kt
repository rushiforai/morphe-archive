package mightymich.morphe.patches.reelshort

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features (Experimental)",
    description = "Unlocks ReelShort premium by forcing isVipFreeAdvUnlock and isVipRenew to return true. WARNING: May cause crashes.",
    default = true
) {
    compatibleWith(ReelShortCompatibility.REELSHORT)

    // 1. Fingerprint for isVipFreeAdvUnlock() in EpisodeEntity.
    val episodeVipFingerprint = Fingerprint(
        definingClass = "Lcom/newleaf/app/android/victor/player/bean/EpisodeEntity;",
        name = "isVipFreeAdvUnlock",
        returnType = "I"
    )

    // 2. Fingerprint for isVipFreeAdvUnlock() in InteractEntity.
    val interactVipFingerprint = Fingerprint(
        definingClass = "Lcom/newleaf/app/android/victor/interackPlayer/bean/InteractEntity;",
        name = "isVipFreeAdvUnlock",
        returnType = "I"
    )

    // 3. Fingerprint for isVipRenew() in VipSubCfg.
    val vipRenewFingerprint = Fingerprint(
        definingClass = "Lcom/newleaf/app/android/victor/library/bean/VipSubCfg;",
        name = "isVipRenew",
        returnType = "I"
    )

    execute {
        // Patch EpisodeEntity.isVipFreeAdvUnlock() -> return 1.
        episodeVipFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find EpisodeEntity.isVipFreeAdvUnlock method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // Patch InteractEntity.isVipFreeAdvUnlock() -> return 1.
        interactVipFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find InteractEntity.isVipFreeAdvUnlock method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // Patch VipSubCfg.isVipRenew() -> return 1.
        vipRenewFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find VipSubCfg.isVipRenew method.")
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
