package tradingview.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val holyLarpPatch = bytecodePatch(
    name = "Ultimate user badge",
    description = "Forces the Ultimate badge on the current user profile. Visual only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        GetUserBadgeTypeFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lcom/tradingview/tradingviewapp/feature/profile/model/user/UserBadgeType${'$'}ProUser;
                sget-object v1, Lcom/tradingview/tradingviewapp/feature/profile/model/user/ProBadgePlan;->ULTIMATE:Lcom/tradingview/tradingviewapp/feature/profile/model/user/ProBadgePlan;
                const/4 p0, 0x0
                invoke-direct { v0, v1, p0 }, Lcom/tradingview/tradingviewapp/feature/profile/model/user/UserBadgeType${'$'}ProUser;-><init>(Lcom/tradingview/tradingviewapp/feature/profile/model/user/ProBadgePlan;Z)V
                return-object v0
            """
        )
    }
}
