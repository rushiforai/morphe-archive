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
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private object MediaBoxListFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        literal(3),
        literal(4),
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "MediaBox"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add"),
    ),
)

@Suppress("unused")
val hideMediaBoxPatch = bytecodePatch(
    name = "Hide Media Box in Messages",
    description = "Hide the Media Box row in Messages when enabled in Nezumi Settings.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.08.01"), AppTarget(version = "26.10.02")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(MediaBoxListFingerprint.matchAll(1..1).size == 1)
        val method = MediaBoxListFingerprint.method
        check(method.implementation!!.registerCount == 16)
        val instructions = method.implementation!!.instructions.toList()
        if (packageMetadata.versionName == "26.10.02") {
            check(method.parameters.map { it.type }.take(5) == listOf(
                "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
                "Ljava/util/ArrayList;", "I", "Z", "I",
            ))
            check(method.parameters.size == 6)
            val mediaIndex = instructions.indexOfFirst {
                it.opcode == Opcode.SGET_OBJECT &&
                    (it as ReferenceInstruction).reference.toString().contains("->MediaBox:")
            }
            check(mediaIndex > 0)
            val startIndex = (0 until mediaIndex).last { instructions[it].opcode == Opcode.RETURN_VOID } + 1
            check(instructions[startIndex].opcode == Opcode.INVOKE_VIRTUAL)
            check((instructions[startIndex] as ReferenceInstruction).reference.toString().endsWith("()I"))
            check(instructions[startIndex + 1].opcode == Opcode.MOVE_RESULT)
            val originalCall = (instructions[startIndex] as ReferenceInstruction).reference
            method.replaceInstruction(startIndex,
                "invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;")
            method.addInstructionsWithLabels(startIndex + 1, """
                move-result-object p5
                invoke-static {p5}, Lapp/template/extension/extension/NezumiSettings;->isMediaBoxHidden(Landroid/content/Context;)Z
                move-result p5
                if-nez p5, :nezumi_hide_media_box
                invoke-virtual {p6}, $originalCall
            """.trimIndent(), ExternalLabel("nezumi_hide_media_box", instructions[startIndex - 1]))
        } else {
        check(method.parameters.map { it.type } == listOf(
            "Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;",
            "Ljava/util/ArrayList;", "I", "Z", "I", "Lje0/p;",
        ))
        val rowIndices = instructions.indices.filter { index ->
            instructions[index].opcode == Opcode.NEW_INSTANCE &&
                (instructions[index] as ReferenceInstruction).reference.toString() == "Lq00/v;"
        }
        check(rowIndices.size == 1)
        val rowIndex = rowIndices.single()
        check(rowIndex >= 2 && rowIndex + 2 < instructions.size)
        check(instructions[rowIndex - 1].opcode == Opcode.INVOKE_VIRTUAL &&
            (instructions[rowIndex - 1] as ReferenceInstruction).reference.toString() == "Lje0/p;->s()V")
        check(instructions[rowIndex + 1].opcode == Opcode.INVOKE_DIRECT &&
            (instructions[rowIndex + 1] as ReferenceInstruction).reference.toString() ==
                "Lq00/v;-><init>(Lcom/zing/zalo/data/chat/model/tabmessage/Conversation;)V")
        check(instructions[rowIndex + 2].opcode == Opcode.INVOKE_VIRTUAL &&
            (instructions[rowIndex + 2] as ReferenceInstruction).reference.toString() ==
                "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z")
        method.addInstructionsWithLabels(rowIndex, """
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, Lapp/template/extension/extension/NezumiSettings;->isMediaBoxHidden(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :nezumi_show_media_box
            return-void
        """.trimIndent(), ExternalLabel("nezumi_show_media_box", instructions[rowIndex]))
        }

        attachNezumiSettings()
    }
}