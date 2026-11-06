package app.xfeedcleanup.patches.x

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val FILTER_CLASS = "Lapp/xfeedcleanup/extension/x/RecommendationFilter;"

private object CachedTimelineItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "Ljava/util/LinkedHashMap;", "Ljava/util/LinkedHashMap;", "L"),
    custom = { method, _ ->
        method.returnType.startsWith("Lcom/x/models/timelines/items/") &&
            method.parameterTypes.first().startsWith("Lcom/x/database/")
    },
)

private object StoreTimelineItemFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
        parameters.size == 9 &&
            parameters.first().startsWith("Lcom/x/models/timelines/items/") &&
            parameters.takeLast(6).all { it == "Ljava/util/ArrayList;" }
    },
)

internal val recommendationFilterPatch = bytecodePatch(
    description = "Injects the standalone recommendation filter.",
) {
    extendWith("extensions/feedcleanup-x.mpe")

    execute {
        StoreTimelineItemFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static/range { p1 .. p1 }, $FILTER_CLASS->hide(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :store
                return-void
                """,
                ExternalLabel("store", getInstruction(0)),
            )
        }

        CachedTimelineItemFingerprint.method.apply {
            instructions
                .filter { it.opcode == Opcode.RETURN_OBJECT }
                .map { it.location.index }
                .sortedDescending()
                .forEach { index ->
                    val item = getInstruction<OneRegisterInstruction>(index).registerA

                    addInstructionsAtControlFlowLabel(
                        index,
                        """
                        invoke-static/range { v$item .. v$item }, $FILTER_CLASS->filter(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$item
                        check-cast v$item, $returnType
                        """,
                    )
                }
        }
    }
}
