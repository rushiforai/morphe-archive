package app.plyrs1.patches.com_pertaminiku

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_PERTAMINIKU

/** Shows the patch credit once when MainActivity is first constructed. */
@Suppress("unused")
val firstLaunchCreditPatch = bytecodePatch(
    name = "First Launch Credit",
    description = "Shows a one-time 'Patched with ❤️ by Plyrs' notification on first launch.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PERTAMINIKU)
    extendWith("extensions/extension.mpe")

    execute {
        MainActivityConstructorFingerprint.method.addInstructions(
            1,
            """
                invoke-static {p0}, Lapp/plyrs1/extension/FirstLaunchCredit;->showOnce(Landroid/content/Context;)V
            """
        )
    }
}
