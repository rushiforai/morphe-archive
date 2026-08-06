package spooky.morphe.patches.beeline.unlockplus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

import spooky.morphe.patches.shared.Constants.COMPATIBILITY_BEELINE

/**
    This patch needs the following additional patches to function properly:
        - Fix Firebase after re-signing
        - Provide Original app certificate
        - Spoof app signature
        - Spoof install source

    Credit to https://github.com/rushiranpise/morphe-patches for his universal patches.
 */
@Suppress("unused")
val unlockBeelinePlusPatch = bytecodePatch(
    name = "Unlock Beeline Plus features",
    description = """Unlocks Beeline plus features such as round-trip generation, live traffic and premium map types.
    The following patches are also needed for this patch to work:
        - Fix Firebase after re-signing (rushiranpise/morphe-patches)
        - Provide Original app certificate (rushiranpise/morphe-patches)
        - Spoof app signature (rushiranpise/morphe-patches)
        - Spoof install source (rushiranpise/morphe-patches)""",
    default = true
) {
    compatibleWith(COMPATIBILITY_BEELINE)

    execute {
        PremiumMapTypesFingerprint.method.returnEarly(false)
        MainViewModelisPlusActiveFingerprint.method.returnEarly(true)
        PlanRouteAutoRouteUiStateisBeelinePlusActiveFingerprint.method.returnEarly(true)
        OptionsDialogUiStateisPlusActiveFingerprint.method.returnEarly(true)
        OptionsDialogUiStateisPlusAvailableOrActiveFingerprint.method.returnEarly(true)
        SettingsViewModelgetShowPlusSignUpScreenFingerprint.method.returnEarly(false)
        isPlusAvailableInLocaleFingerprint.method.returnEarly(true)
    }
}
