package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object BusinessBoxListFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        literal(3),
        literal(4),
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "BizBox"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add"),
    ),
)

@Suppress("unused")
val hideBusinessBoxPatch = bytecodePatch(
    name = "Hide Business Box in Messages",
    description = "Hide the Business Box row in Messages when enabled in Nezumi Settings.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.10.02")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(BusinessBoxListFingerprint.matchAll(1..1).size == 1)
        val method = BusinessBoxListFingerprint.method
        check(method.implementation!!.registerCount == 16)
        check(method.parameters.size == 6)
        check(method.parameters.map { it.type }.take(5) == listOf(
            "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
            "Ljava/util/ArrayList;", "I", "Z", "I",
        ))
        val instructions = method.implementation!!.instructions.toList()
        val bizBoxIndex = instructions.indexOfFirst {
            it.opcode == Opcode.SGET_OBJECT &&
                (it as ReferenceInstruction).reference.toString().contains("->BizBox:")
        }
        val constructors = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            index > bizBoxIndex && instructions[index].opcode == Opcode.INVOKE_DIRECT &&
                reference?.name == "<init>" && reference.parameterTypes == listOf(
                    "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;", "Ljava/lang/String;",
                )
        }
        check(bizBoxIndex > 0 && constructors.size == 1)
        val constructorIndex = constructors.single()
        val rowType = ((instructions[constructorIndex] as ReferenceInstruction).reference as MethodReference)
            .definingClass
        val rowIndex = (bizBoxIndex until constructorIndex).single { index ->
            instructions[index].opcode == Opcode.NEW_INSTANCE &&
                (instructions[index] as ReferenceInstruction).reference.toString() == rowType
        }
        val guardIndex = rowIndex - 3
        check(guardIndex > bizBoxIndex)
        check(instructions[guardIndex].opcode == Opcode.INVOKE_VIRTUAL)
        check(instructions[guardIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        check(instructions[guardIndex + 2].opcode == Opcode.IF_NEZ)
        val cacheCall = (instructions[guardIndex] as ReferenceInstruction).reference as MethodReference
        check(cacheCall.definingClass == method.parameters.last().type && cacheCall.parameterTypes.isEmpty())
        check((instructions[guardIndex] as FiveRegisterInstruction).registerC == 15)
        check(instructions[constructorIndex + 2].opcode == Opcode.INVOKE_VIRTUAL &&
            (instructions[constructorIndex + 2] as ReferenceInstruction).reference.toString() ==
                "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z")
        val returnIndex = (constructorIndex + 3 until instructions.size).first {
            instructions[it].opcode == Opcode.RETURN_VOID
        }
        method.replaceInstruction(guardIndex,
            "invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;")
        method.addInstructionsWithLabels(guardIndex + 1, """
            move-result-object v0
            invoke-static {v0}, Lapp/template/extension/extension/NezumiSettings;->isBusinessBoxHidden(Landroid/content/Context;)Z
            move-result v0
            if-nez v0, :nezumi_hide_business_box
            invoke-virtual {p6}, $cacheCall
        """.trimIndent(), ExternalLabel("nezumi_hide_business_box", instructions[returnIndex]))

        attachNezumiSettings("attachBusinessBox")
    }
}