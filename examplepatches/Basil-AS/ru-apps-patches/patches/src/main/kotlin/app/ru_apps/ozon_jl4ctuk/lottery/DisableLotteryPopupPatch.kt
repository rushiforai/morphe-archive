// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/lottery/DisableLotteryPopupPatch.kt.
package app.ru_apps.ozon_jl4ctuk.lottery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ru_apps.ozon_jl4ctuk.shared.Constants.COMPATIBILITY_OZON_CURRENT

@Suppress("unused")
val disableLotteryPopupPatch = bytecodePatch(
    name = "Disable lottery and in-app pushes",
    description = "Disables lottery onboarding and the in-app push SDK used for reward popups.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        LotteryStartOnboardingFingerprint.method.addInstructions(0, "return-void")
        // MorkovskOnboardingManager (MorkovskStartOnboardingFingerprint's old target) no longer
        // exists as of a 2026-10 Ozon build — confirmed via live decompile: the standalone
        // "second onboarding path" class is gone, and its dialog, MorkovskHintDialog, now has
        // exactly one caller in the whole app (MorkovskHintDialog.Companion.newInstance(), called
        // only from LotteryOnboardingManager). The two onboarding paths were consolidated into
        // one, already fully covered by LotteryStartOnboardingFingerprint above.
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
