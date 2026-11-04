package app.wordfeudwordfinder.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.wordfeudwordfinder.patches.network.networkTapPatch
import app.wordfeudwordfinder.patches.platform.platformTapPatch
import app.wordfeudwordfinder.patches.platform.userAgentPatch
import app.wordfeudwordfinder.patches.shared.Constants.COMPATIBILITY_WORDFEUD

private const val OVERLAY_CONTROLLER = "Lapp/wordfeudwordfinder/extension/ui/OverlayController;"

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/hbwares/wordfeud/ui/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

@Suppress("unused")
val overlayPatch = bytecodePatch(
    name = "Word finder overlay",
    description = "Adds a floating button on the game screen that opens a list of all possible moves.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WORDFEUD)

    // The overlay needs the game data (network), the route/theme/banner state (platform) and the User-Agent.
    dependsOn(networkTapPatch, platformTapPatch, userAgentPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Injected at index 0, where p0 is guaranteed to hold `this` (at a later return the optimiser may have
        // reused p0). attach() only posts to the main looper, so the views are built after onCreate has
        // returned and the content view is in place. The /range form works for any register number.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, $OVERLAY_CONTROLLER->attach(Landroid/app/Activity;)V"
        )
    }
}
