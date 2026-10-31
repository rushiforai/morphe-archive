package com.nmnvan.patches.thescore.game

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.nmnvan.patches.thescore.settings.settingsPatch
import com.nmnvan.patches.thescore.shared.Constants.COMPATIBILITY_THESCORE
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE
import com.nmnvan.patches.thescore.shared.addInstructionsAtControlFlowLabel
import com.nmnvan.patches.thescore.shared.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/patches/GameScreenPatch;"

/**
 * Navigation to a game screen checks remote flag "com.thescore.new_matchup_page"
 * to decide between the classic tabbed page and the redesigned page.
 */
internal object NewGameScreenFlagFingerprint : Fingerprint(
    filters = listOf(
        string("com.thescore.new_matchup_page"),
        methodCall(
            returnType = "Z",
            parameters = listOf("Ljava/lang/String;"),
            location = MatchAfterImmediately()
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    )
)

@Suppress("unused")
val keepClassicGameScreenPatch = bytecodePatch(
    name = "Keep classic game screen",
    description = "Adds an option in Morphe Settings (on by default) to keep the classic game screen if theScore " +
        "turns on its redesigned one, so the game tab and Scorecast patches keep working.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THESCORE)

    dependsOn(settingsPatch)

    execute {
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        NewGameScreenFlagFingerprint.let {
            it.method.apply {
                val moveResultIndex = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

                addInstructionsAtControlFlowLabel(
                    moveResultIndex + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->useNewGameScreen(Z)Z
                        move-result v$register
                    """
                )
            }
        }
    }
}
