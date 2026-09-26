package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces CapCut 9.0 VIP gates to true (VipSubscribeManager, " +
        "SubscribeImpl, UserVipInfo, benefits). Cloud-gated assets may still fail.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        fun forceTrue(fp: app.morphe.patcher.Fingerprint) {
            fp.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // Single source of truth for VIP status in 9.0.
        forceTrue(VipSubscribeManagerIsVipFingerprint)
        forceTrue(VipStatusGetterImplFingerprint)

        // Subscribe / editor proxies that read the manager (or login+manager).
        forceTrue(SubscribeImplIsVipFingerprint)
        forceTrue(SubscribeImplIsSubscribeFingerprint)
        forceTrue(BusinessImplIsVipUserFingerprint)

        // DTOs / benefit flags.
        forceTrue(UserVipInfoIsVipUserFingerprint)
        forceTrue(UserVipInfoGetFlagFingerprint)
        forceTrue(BenefitGetFlagFingerprint)
    }
}
