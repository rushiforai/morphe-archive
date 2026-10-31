package app.badfella.patches.ticktick.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.badfella.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK

@Suppress("unused")
val tickTickPremiumPatch = bytecodePatch(
    name = "TickTick Premium",
    description = "Enables client-side premium features and limits. Does not grant server-side AI access or a subscription."
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

        // SubscriptionInfo.getIsPro() → client billing DTO gate; server entitlement is unchanged.
        SubscriptionInfoIsProFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // SignUserInfo.isPro() → changes the client's interpretation of the sync response.
        SignUserInfoIsProFingerprint.method.addInstructions(0, """
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
