package app.noam.patches.chesscom.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val HOME_TABS = "${Constants.EXTENSION_PACKAGE}/home/HomeTabs;"

/** toString() of the bottom bar's state. */
internal object NavigationBarStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("NavigationBarState(playTabBadge="),
)

@Suppress("unused")
val customTabsPatch = bytecodePatch(
    name = "Customize bottom bar",
    description = "Choose the tabs between Home and More (Puzzles, Learn, Watch, Bots, Train) and " +
        "their order, in Noam's Patches → Bottom bar.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("customTabsPatched")

        // NavigationBarState.tabs(): [Play, Puzzles] + middle tabs + [More].
        val state = NavigationBarStateToStringFingerprint.originalClassDef
        mutableClassDefBy(state).methods.single {
            it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty()
        }.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static/range { v$register .. v$register }, $HOME_TABS->tabs(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """,
            )
        }
    }
}
