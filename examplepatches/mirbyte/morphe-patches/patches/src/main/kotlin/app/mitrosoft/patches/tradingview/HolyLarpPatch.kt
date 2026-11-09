package app.mitrosoft.patches.tradingview

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW

@Suppress("unused")
val holyLarpPatch = bytecodePatch(
    name = "Holy larp",
    description = "Forces the Ultimate badge on the current user. Visual only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        GetUserBadgeTypeFingerprint.method.apply {
            val registers = getFreeRegisterProvider(0, 2)
            val badgeRegister = registers.getFreeRegister4Bit()
            val planRegister = registers.getFreeRegister4Bit()

            // p0 is reused as the isTrial flag: the original body is unreachable after the injected return.
            addInstructions(
                0,
                """
                    new-instance v$badgeRegister, Lcom/tradingview/tradingviewapp/feature/profile/model/user/UserBadgeType${'$'}ProUser;
                    sget-object v$planRegister, Lcom/tradingview/tradingviewapp/feature/profile/model/user/ProBadgePlan;->ULTIMATE:Lcom/tradingview/tradingviewapp/feature/profile/model/user/ProBadgePlan;
                    const/4 p0, 0x0
                    invoke-direct { v$badgeRegister, v$planRegister, p0 }, Lcom/tradingview/tradingviewapp/feature/profile/model/user/UserBadgeType${'$'}ProUser;-><init>(Lcom/tradingview/tradingviewapp/feature/profile/model/user/ProBadgePlan;Z)V
                    return-object v$badgeRegister
                """
            )
        }
    }
}
