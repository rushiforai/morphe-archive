package app.mitrosoft.patches.tradingview

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getFreeRegisterProvider
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_TRADINGVIEW

@Suppress("unused")
val forceLocalProPlanPatch = bytecodePatch(
    name = "Force local Pro plan",
    description = "Forces the local plan lookup and plan state to report Pro. Also hides the profile upsell banner.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        ProPlanDefineFingerprint.method.apply {
            val register = findFreeRegister(0)

            addInstructions(
                0,
                """
                    sget-object v$register, Lcom/tradingview/tradingviewapp/feature/profile/api/plan/ProPlan;->ULTIMATE:Lcom/tradingview/tradingviewapp/feature/profile/api/plan/ProPlan;
                    return-object v$register
                """
            )
        }

        ToPlanStateFingerprint.method.apply {
            val registers = getFreeRegisterProvider(0, 2)
            val planRegister = registers.getFreeRegister4Bit()
            val stateRegister = registers.getFreeRegister4Bit()

            addInstructions(
                0,
                """
                    if-eqz p0, :no_plan
                    invoke-virtual { p0 }, Lcom/tradingview/tradingviewapp/feature/profile/api/user/CurrentUser;->getPlan()Lcom/tradingview/tradingviewapp/feature/profile/api/plan/UserPlan;
                    move-result-object v$planRegister
                    if-eqz v$planRegister, :no_plan
                    goto :wrap_plan
                    :no_plan
                    new-instance v$planRegister, Lcom/tradingview/tradingviewapp/feature/profile/api/plan/UserPlan;
                    invoke-direct { v$planRegister }, Lcom/tradingview/tradingviewapp/feature/profile/api/plan/UserPlan;-><init>()V
                    :wrap_plan
                    new-instance v$stateRegister, Lcom/tradingview/tradingviewapp/feature/profile/api/plan/UserPlanState${'$'}Pro;
                    invoke-direct { v$stateRegister, v$planRegister }, Lcom/tradingview/tradingviewapp/feature/profile/api/plan/UserPlanState${'$'}Pro;-><init>(Lcom/tradingview/tradingviewapp/feature/profile/api/plan/UserPlan;)V
                    return-object v$stateRegister
                """
            )
        }
    }
}
