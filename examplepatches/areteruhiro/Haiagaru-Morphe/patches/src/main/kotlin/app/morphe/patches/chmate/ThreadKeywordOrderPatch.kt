package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** 242 accidentally discards keyword grouping for the ordinary thread-order tab. */
internal fun BytecodePatchContext.patchThreadKeywordOrder(version: String) {
    if (version != "0.8.10.242 dev") return
    val candidates = mutableListOf<ClassDef>()
    boundClassForEach("ThreadKeywordOrderPatch:1") { definition ->
        if (definition.type.startsWith("Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel\$") &&
            definition.fields.map { it.name }.containsAll(listOf("I\$0", "I\$1", "L\$0", "label")) &&
            definition.methods.any { method -> method.name == "invokeSuspend" &&
                method.implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 200 } == true })
            candidates.add(definition)
    }
    check(candidates.size == 1) { "242 keyword/sort coroutine changed: ${candidates.map { it.type }}" }
    val method = mutableClassDefBy(candidates.single()).methods.single {
        it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;") && it.returnType == "Ljava/lang/Object;"
    }
    val body = method.implementation!!.instructions.toList()
    val constants = body.indices.filter { (body[it] as? NarrowLiteralInstruction)?.narrowLiteral == 200 }
    check(constants.size == 1)
    val index = constants.single()
    val register = (body[index] as OneRegisterInstruction).registerA
    val branch = body.getOrNull(index + 1)
    check(branch?.opcode == Opcode.IF_EQ && branch is TwoRegisterInstruction &&
        (branch.registerA == register || branch.registerB == register)) { "242 keyword sort guard changed" }
    // Leave empty-list handling and sortIndex >= 2 (reversed/alternate modes)
    // untouched. The native matcher/group builder still performs all grouping.
    method.replaceInstruction(index + 1, "nop")
    println("242 keyword grouping: enabled for thread-order ID 200 -> ${method.definingClass}")
}
