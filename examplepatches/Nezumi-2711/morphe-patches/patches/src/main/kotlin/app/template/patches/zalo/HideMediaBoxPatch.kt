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
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(MediaBoxListFingerprint.matchAll(1..1).size == 1)
        val method = MediaBoxListFingerprint.method
        check(method.implementation!!.registerCount == 16)
        val instructions = method.implementation!!.instructions.toList()
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
            invoke-static {p5}, $MESSAGES_TAB->isMediaBoxHidden(Landroid/content/Context;)Z
            move-result p5
            if-nez p5, :nezumi_hide_media_box
            invoke-virtual {p6}, $originalCall
        """.trimIndent(), ExternalLabel("nezumi_hide_media_box", instructions[startIndex - 1]))

        attachNezumiSettings("attachMediaBox")
    }
}