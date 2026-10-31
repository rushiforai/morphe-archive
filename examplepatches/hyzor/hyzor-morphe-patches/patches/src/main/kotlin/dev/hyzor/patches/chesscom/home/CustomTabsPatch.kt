package dev.hyzor.patches.chesscom.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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

        val stateClass = mutableClassDefBy(NavigationBarStateToStringFingerprint.originalClassDef)

        // 4.10.18: NavigationBarState.tabs() returns [Play, middle tabs..., More].
        val tabsMethod = stateClass.methods.singleOrNull {
            it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty()
        }
        if (tabsMethod != null) {
            tabsMethod.apply {
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
        } else {
            // 4.10.23: the state keeps only the middle tabs; the app adds Play and More.
            stateClass.methods.single {
                it.name == "<init>" &&
                    it.parameterTypes.map { type -> type.toString() } ==
                    listOf("I", "I", "Ljava/util/List;", "Z")
            }.apply {
                addInstructions(
                    0,
                    """
                        invoke-static/range { p3 .. p3 }, $HOME_TABS->middleTabs(Ljava/util/List;)Ljava/util/List;
                        move-result-object p3
                    """,
                )
            }
            // The bar composable prepends Play and Puzzles itself; drop Puzzles when it is off.
            val homeScreen = "Lcom/chess/home/ui/HomeScreen;"
            var tabListHooks = 0
            classDefForEach { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    val implementation = method.implementation ?: return@forEach
                    val instructions = implementation.instructions.toList()
                    val touchesScreens = instructions.any { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == homeScreen
                    }
                    if (!touchesScreens) return@forEach
                    val inserts = instructions.indices.filter { index ->
                        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                        reference?.definingClass == "Lcom/google/android/vl0;" && reference.name == "q0" &&
                            instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                    }
                    inserts.sortedDescending().forEach { index ->
                        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                        if (reference?.returnType !in setOf("Ljava/util/ArrayList;", "Ljava/util/List;")) {
                            throw PatchException("The bottom bar list builder does not return a list")
                        }
                        val register = (instructions[index + 1] as OneRegisterInstruction).registerA
                        method.addInstructions(
                            index + 2,
                            """
                                invoke-static/range { v$register .. v$register }, $HOME_TABS->finalTabs(Ljava/util/List;)Ljava/util/List;
                                move-result-object v$register
                            """,
                        )
                        tabListHooks++
                    }
                }
            }
            if (tabListHooks == 0) throw PatchException("The bottom bar tab list was not found")
        }
    }
}
