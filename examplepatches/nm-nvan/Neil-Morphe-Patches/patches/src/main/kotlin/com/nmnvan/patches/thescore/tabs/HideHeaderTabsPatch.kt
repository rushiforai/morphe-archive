package com.nmnvan.patches.thescore.tabs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.nmnvan.patches.thescore.settings.settingsPatch
import com.nmnvan.patches.thescore.shared.Constants.COMPATIBILITY_THESCORE
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE
import com.nmnvan.patches.thescore.shared.addInstructionsAtControlFlowLabel
import com.nmnvan.patches.thescore.shared.filterReturnedObjects
import com.nmnvan.patches.thescore.shared.isFrom
import com.nmnvan.patches.thescore.shared.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/patches/HeaderTabsPatch;"

/**
 * MatchupTabsViewModelDelegate: builds the game screen tabs (team sports, MMA, auto racing, tennis).
 */
internal object GameTabsFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("L", "I", "Z"),
    strings = listOf("driver_records"),
    custom = { _, classDef -> classDef.isFrom("MatchupTabsViewModelDelegate.kt") }
)

/**
 * MatchupTabsViewModelDelegate: builds the golf tournament tabs (suspend function).
 * Its parameters differ between app versions, so they are not part of the fingerprint.
 */
internal object GolfTabsFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("/golf/leagues/1"),
    custom = { _, classDef -> classDef.isFrom("MatchupTabsViewModelDelegate.kt") }
)

/**
 * LeaguePageViewModelDelegate: coroutine that builds the league screen tabs from the league's
 * server-provided sections and emits them.
 */
internal object LeagueTabsFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("com.thescore.bracket_tab"),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            name = "emit",
            parameters = listOf("Ljava/lang/Object;", "L"),
            returnType = "Ljava/lang/Object;",
        ),
    ),
    custom = { _, classDef -> classDef.isFrom("LeaguePageViewModelDelegate.kt") }
)

@Suppress("unused")
val hideHeaderTabsPatch = bytecodePatch(
    name = "Hide game and league tabs",
    description = "Adds options in Morphe Settings to hide individual top tabs on game and league screens.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THESCORE)

    dependsOn(settingsPatch)

    execute {
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        val filterGameTabs = "$EXTENSION_CLASS->filterGameTabs(Ljava/lang/Object;)Ljava/lang/Object;"

        // Filter the finished tab lists, so the pager adapter and tab strip only ever see visible tabs.
        GameTabsFingerprint.method.filterReturnedObjects(filterGameTabs, castTo = "Ljava/util/List;")
        GolfTabsFingerprint.method.filterReturnedObjects(filterGameTabs)

        LeagueTabsFingerprint.let {
            it.method.apply {
                val emitIndex = it.instructionMatches.last().index
                // emit(value, continuation): register D is the tab list.
                val listRegister = getInstruction<FiveRegisterInstruction>(emitIndex).registerD

                addInstructionsAtControlFlowLabel(
                    emitIndex,
                    """
                        invoke-static/range { v$listRegister .. v$listRegister }, $EXTENSION_CLASS->filterLeagueTabs(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$listRegister
                    """
                )
            }
        }
    }
}
