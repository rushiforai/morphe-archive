package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FAVORITES = "Lapp/morphe/extension/chmate/FavoriteThreads;"

internal fun BytecodePatchContext.patchFavoriteThreads(version: String) {
    val modern = version == "0.8.10.242 dev"
    val owner = when (version) {
        "0.8.10.191 dev" -> "Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;"
        "0.8.10.226 dev" -> "Ljp/syoboi/a2chMate/fragment/HomeFragment;"
        else -> "Lo/ModuleInstallRequestBuilder;"
    }
    val klass = mutableClassDefBy(owner)
    val method = klass.methods.single {
        if (modern) it.name == "d" && it.parameterTypes.size == 6 && it.parameterTypes.take(2) == listOf("I", "I")
        else it.name == "haiagaruNativeHistorySort" && it.parameterTypes == listOf("I", "Z")
    }
    // Track the actual HOME mode before mapping only this sorting invocation.
    // The flow/persisted tab stays 108 (favorites) or 109 (refresh targets),
    // independent of the native 102 snapshot used to build either list.
    val body = method.implementation!!.instructions.toList()
    if (!modern) {
        val rowList = if (version.contains("191")) "Lo/onAdDisplayed\$setBackgroundResource;" else "Lo/Yy2\$CheckResult;"
        val listRead = body.indices.first { i ->
            body[i].opcode == Opcode.CHECK_CAST &&
                (body[i] as? ReferenceInstruction)?.reference.toString() == rowList
        }
        val register = (body[listRead] as OneRegisterInstruction).registerA
        val receiver = if (version.contains("191")) 1 else 0
        method.addInstructions(listRead + 1, """
            invoke-static {v$receiver, v$register}, $FAVORITES->legacyRows(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $rowList
        """.trimIndent())
    } else {
        // Input is the complete native HOME thread snapshot; filter before native grouping/sorting.
        method.addInstructions(0, """
            move-object/from16 v0, p0
            move-object/from16 v1, p5
            invoke-static {v0, v1}, $FAVORITES->filterFor(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
            move-result-object v1
            move-object/16 p5, v1
        """.trimIndent())
    }
    // Only the title emitted by this HOME sorter is changed, never global string resources.
    val current = method.implementation!!.instructions.toList()
    val titleCalls = current.indices.filter { i ->
        val ref = (current[i] as? ReferenceInstruction)?.reference as? MethodReference
        ref != null && ((!modern && ref.name == "getString" && ref.parameterTypes == listOf("I")) ||
            (modern && ref.definingClass == "Ljava/lang/Integer;" && ref.name == "valueOf" &&
                i + 2 < current.size &&
                ((current[i + 2] as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == "Lo/getPackageResourcePath;"))
    }
    check(titleCalls.isNotEmpty())
    titleCalls.asReversed().forEach { index ->
        val call = current[index] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        val reg = if (modern) call.registerC else call.registerD
        val receiver = if (modern) 7 else if (version.contains("191")) 1 else 0
        method.addInstructions(index, """
            invoke-static {v$receiver, v$reg}, $FAVORITES->titleResource(Ljava/lang/Object;I)I
            move-result v$reg
        """.trimIndent())
    }
    // 242's first Int is the HOME ID; the second is its native sort index.
    method.addInstructions(0, """
        invoke-static/range {p0 .. p1}, $FAVORITES->selected(Ljava/lang/Object;I)V
        invoke-static/range {p1 .. p1}, $FAVORITES->nativeMode(I)I
        move-result v0
        move/16 p1, v0
    """.trimIndent())
}
