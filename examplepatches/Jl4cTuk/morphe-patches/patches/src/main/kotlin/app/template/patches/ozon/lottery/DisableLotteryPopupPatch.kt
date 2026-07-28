package app.template.patches.ozon.lottery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozon.shared.Constants.COMPATIBILITY_OZON_CURRENT

@Suppress("unused")
val disableLotteryPopupPatch = bytecodePatch(
    name = "Disable lottery and in-app pushes",
    description = "Disables lottery onboarding and the in-app push SDK used for reward popups.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        LotteryStartOnboardingFingerprint.method.addInstructions(0, "return-void")
        MorkovskStartOnboardingFingerprint.method.addInstructions(0, "return-void")
        InAppPushHostProviderFingerprint.method.addInstructions(
            0,
            """
                new-instance p0, Lru/ozon/app/android/inapppush/presentation/InAppPushHostDisabled;
                invoke-direct {p0}, Lru/ozon/app/android/inapppush/presentation/InAppPushHostDisabled;-><init>()V
                return-object p0
            """,
        )
    }
}
