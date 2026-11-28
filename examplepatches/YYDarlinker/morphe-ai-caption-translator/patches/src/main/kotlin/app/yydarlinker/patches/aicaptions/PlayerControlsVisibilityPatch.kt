package app.yydarlinker.patches.aicaptions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val HOOK = "${EXTENSION}host/AiCaptionHook;"

internal val playerControlsVisibilityPatch = patch {
    execute {
        val visibility = classDefByStrings("PLAYER_CONTROLS_VISIBILITY_HIDDEN")
            .filter { it.superclass == "Ljava/lang/Enum;" }
            .unique("player controls visibility enum")
        // The same native getter used by Morphe's PlayerControlsOverlayVisibilityPatch.
        val getter = Fingerprint(
            name = "getPlayerControlsVisibility",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = visibility.type,
            parameters = emptyList(),
            filters = listOf(opcode(Opcode.IGET), opcode(Opcode.INVOKE_STATIC)),
        ).matchAllOrNull().orEmpty().unique("player controls visibility getter").method
        val constructor = mutableClassDefBy(getter.definingClass).methods
            .filter { it.name == "<init>" }
            .unique("player controls visibility constructor")
        val index = constructor.code().mapIndexedNotNull { i, instruction ->
            i.takeIf { instruction.opcode == Opcode.RETURN_VOID }
        }.unique("player controls visibility constructor return")
        // Only v0, dead at the void return, is overwritten. The official callback after IPUT_OBJECT
        // keeps its original input and control flow regardless of patch execution order.
        constructor.replaceInstruction(index, "invoke-virtual/range {p0 .. p0}, ${getter.id()}")
        constructor.addInstructions(index + 1, """
            move-result-object v0
            invoke-static {v0}, $HOOK->onPlayerControlsVisibility(Ljava/lang/Enum;)V
            return-void
        """.trimIndent())
    }
}
