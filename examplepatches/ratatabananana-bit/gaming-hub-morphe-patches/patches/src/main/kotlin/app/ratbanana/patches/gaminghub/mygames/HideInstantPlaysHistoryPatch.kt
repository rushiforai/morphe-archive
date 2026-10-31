package app.ratbanana.patches.gaminghub.mygames

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.ratbanana.patches.gaminghub.shared.Constants.COMPATIBILITY_GAMING_HUB
import app.ratbanana.patches.gaminghub.shared.Constants.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/MyGamesTopArea;"

@Suppress("unused")
val hideInstantPlaysHistoryPatch = bytecodePatch(
    name = "Hide Instant Plays history",
    description = "Removes the Instant Plays history section from the top of My games.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GAMING_HUB)

    extendWith("extensions/extension.mpe")

    execute {
        fun Fingerprint.setTopAreaVisibilityAfterTitle(extensionMethod: String) {
            val setTitleMatch = instructionMatches.last()
            val titleRegister = setTitleMatch.getInstruction<FiveRegisterInstruction>().registerC

            method.addInstruction(
                setTitleMatch.index + 1,
                "invoke-static { v$titleRegister }, $EXTENSION_CLASS->$extensionMethod(Landroid/view/View;)V",
            )
        }

        // The same section shows either Instant Plays history or recently played games,
        // so it is hidden in the first mode and shown again in the second.
        BindInstantPlaysHistoryFingerprint.setTopAreaVisibilityAfterTitle("hide")
        BindRecentGamesFingerprint.setTopAreaVisibilityAfterTitle("show")
    }
}
