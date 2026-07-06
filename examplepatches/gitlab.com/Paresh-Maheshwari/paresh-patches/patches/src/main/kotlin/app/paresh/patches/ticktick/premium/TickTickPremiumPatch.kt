package app.paresh.patches.ticktick.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK

@Suppress("unused")
val tickTickPremiumPatch = bytecodePatch(
    name = "TickTick Premium",
    description = "Unlocks premium features, removes limits, and enables AI tools."
) {
    compatibleWith(COMPATIBILITY_TICKTICK)

    execute {
        // User.isPro() → always true (primary gate for all 45+ premium features)
        UserIsProFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // ProHelper.isPro(User) → always true (static wrapper, catches null-safe paths)
        ProHelperIsProFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // LimitHelper.getLimits(ZZ) → always return pro limits
        GetLimitsFingerprint.method.addInstructions(0, """
            invoke-virtual {p0}, Lcom/ticktick/task/helper/LimitHelper;->getLimitsPro()Lcom/ticktick/task/data/Limits;
            move-result-object v0
            return-object v0
        """)

        // SubscriptionInfo.getIsPro() → always true (server verification bypass)
        SubscriptionInfoIsProFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // SignUserInfo.isPro() → always true (prevents server sync from resetting proType to 0)
        SignUserInfoIsProFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // ABTestManager.isAiEnable() → always true (unlock AI voice/recording)
        AiEnableFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Install time check → always false (prevents app from exiting after 24h)
        InstallTimeCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // getProTypeForFake() → return 1 (pro) to match isPro()=true, bypasses anti-tamper
        GetProTypeForFakeFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
