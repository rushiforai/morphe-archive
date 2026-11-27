package app.noam.patches.chesscom.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.fieldReference
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.methodReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val HOME_TABS = "${Constants.EXTENSION_PACKAGE}/home/HomeTabs;"
private const val HOME_SCREEN = "Lcom/chess/home/ui/HomeScreen;"
private const val OPENINGS_PLACEMENT = "Lcom/chess/home/more/OpeningsPlacement;"

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
    description = "Choose the tabs between Home and More (Puzzles, Learn, Watch, Bots, Train, Openings) and " +
        "their order, in Noam's Patches → Bottom bar.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("customTabsPatched")

        // The bar's tabs, built by the state itself or where the bar is drawn: [Play, Puzzles] + the
        // state's middle tabs (its one List field) + More, two collection calls with a HomeScreen
        // constant between.
        val state = NavigationBarStateToStringFingerprint.originalClassDef
        val middleTabs = state.fields.single { it.type == "Ljava/util/List;" }
        val built = mutableListOf<Pair<String, Pair<String, Int>>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val code = method.implementation?.instructions?.toList() ?: return@forEach
                val read = code.indexOfFirst { instruction ->
                    instruction.opcode == Opcode.IGET_OBJECT && (instruction.fieldReference)?.let {
                        it.definingClass == state.type && it.name == middleTabs.name
                    } == true
                }
                if (read < 0) return@forEach
                val calls = (read + 1 until code.size).filter { index ->
                    code[index].opcode == Opcode.INVOKE_STATIC &&
                        code[index].methodReference?.returnType in setOf("Ljava/util/List;", "Ljava/util/ArrayList;")
                }.take(2)
                if (calls.size < 2 || code.getOrNull(calls[1] + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEach
                val more = (calls[0] until calls[1]).any { index ->
                    code[index].opcode == Opcode.SGET_OBJECT && code[index].fieldReference?.type == HOME_SCREEN
                }
                if (more) built += classDef.type to (method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType to calls[1] + 1)
            }
        }
        val (owner, at) = built.singleOrNull() ?: throw PatchException("Expected one bottom bar build, found ${built.size}")
        val (signature, index) = at
        mutableClassDefBy(owner).methods.single { it.name + it.parameterTypes.joinToString("", "(", ")") + it.returnType == signature }.apply {
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            val listType = getInstruction(index - 1).methodReference!!.returnType
            addInstructions(
                index + 1,
                """
                    invoke-static/range { v$register .. v$register }, $HOME_TABS->tabs(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                    check-cast v$register, $listType
                """,
            )
        }

        // Where Openings goes (nowhere, a tab or More): the resolver's check and the live flow behind
        // the bar both return one of the placement's constants straight after reading it.
        val placements = mutableListOf<Pair<String, Pair<String, List<Int>>>>()
        classDefForEach { classDef ->
            if (classDef.type == OPENINGS_PLACEMENT) return@classDefForEach
            classDef.methods.forEach { method ->
                val code = method.implementation?.instructions?.toList() ?: return@forEach
                val returns = code.indices.filter { index ->
                    index > 0 && code[index].opcode == Opcode.RETURN_OBJECT &&
                        code[index - 1].opcode == Opcode.SGET_OBJECT &&
                        code[index - 1].fieldReference?.type == OPENINGS_PLACEMENT &&
                        (code[index - 1] as OneRegisterInstruction).registerA == (code[index] as OneRegisterInstruction).registerA
                }
                if (returns.isNotEmpty()) {
                    placements += classDef.type to (method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType to returns)
                }
            }
        }
        if (placements.size != 2) throw PatchException("Expected two Openings placements, found ${placements.size}")
        placements.forEach { (owner, at) ->
            val (signature, returns) = at
            mutableClassDefBy(owner).methods.single { it.name + it.parameterTypes.joinToString("", "(", ")") + it.returnType == signature }.apply {
                returns.sortedDescending().forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $HOME_TABS->openings(Ljava/lang/Object;)Ljava/lang/Object;
                            move-result-object v$register
                            check-cast v$register, $OPENINGS_PLACEMENT
                        """,
                    )
                }
            }
        }
    }
}
