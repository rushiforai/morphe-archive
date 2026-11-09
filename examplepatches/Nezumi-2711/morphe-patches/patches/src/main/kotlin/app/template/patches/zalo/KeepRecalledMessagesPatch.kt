package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val RECALL_SETTINGS = "Lapp/template/extension/extension/NezumiSettings;"

private object IncomingUndoFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("msgActionUndo"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "UNDO"),
    ),
)

private object IncomingDeleteControlFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "DFE"),
        string("CLIENT_CONTROL_NOTIF_DELETE_MSG"),
    ),
)

@Suppress("unused")
val keepRecalledMessagesPatch = bytecodePatch(
    name = "Keep recalled messages",
    description = "Keep received messages and locally available photos after another user recalls them, when enabled in Nezumi Settings.",
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
        check(IncomingUndoFingerprint.matchAll(1..1).size == 1)
        check(IncomingDeleteControlFingerprint.matchAll(1..1).size == 1)
        val undo = IncomingUndoFingerprint.method
        val control = IncomingDeleteControlFingerprint.method
        check(undo.definingClass == control.definingClass)
        check(undo.parameters.map { it.type } == listOf("Lj20/q;"))
        check(control.parameters.map { it.type } == listOf("Lj20/q;", "Ld30/a;", "Ld30/e;"))
        check(undo.implementation!!.registerCount == 14)
        check(control.implementation!!.registerCount == 15)

        listOf(undo, control).forEachIndexed { eventType, method ->
            val originalStart = method.implementation!!.instructions.first()
            val targetId = if (eventType == 0) """
                iget-object v0, p1, Lj20/q;->Q1:Lcom/zing/zalo/webview/g;
                if-eqz v0, :nezumi_skip_marker
                iget-object v0, v0, Lcom/zing/zalo/webview/g;->b:Ljava/lang/Object;
            """.trimIndent() else """
                iget-object v0, p3, Ld30/e;->b:Lcom/zing/zalo/data/entity/chat/message/MessageId;
            """.trimIndent()
            method.addInstructionsWithLabels(0, """
                iget-object v0, p1, Lj20/q;->c:Ljava/lang/String;
                const/4 v1, $eventType
                invoke-static {v0, v1}, $RECALL_SETTINGS->shouldKeepIncomingRecall(Ljava/lang/String;I)Z
                move-result v0
                if-eqz v0, :nezumi_original_recall
                $targetId
                invoke-static {v0}, $RECALL_SETTINGS->markIncomingRecall(Ljava/lang/Object;)V
                :nezumi_skip_marker
                return-void
            """.trimIndent(), ExternalLabel("nezumi_original_recall", originalStart))
        }

        val row = mutableClassDefBy("Lcom/zing/zalo/ui/chat/chatrow/ChatRow;")
        val timeText = row.methods.single {
            it.name == "getCurrentTimeText" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/lang/String;"
        }
        check(timeText.implementation!!.registerCount == 3)
        val timeInstructions = timeText.implementation!!.instructions.toList()
        val returns = timeInstructions.indices.filter { timeInstructions[it].opcode == Opcode.RETURN_OBJECT }
        check(returns.size == 2)
        returns.reversed().forEach { index ->
            check((timeInstructions[index] as OneRegisterInstruction).registerA == 0)
            timeText.replaceInstruction(index,
                "invoke-static {p0, v0}, $RECALL_SETTINGS->formatRecallTime(Landroid/view/View;Ljava/lang/String;)Ljava/lang/String;")
            timeText.addInstructions(index + 1, "move-result-object v0\nreturn-object v0")
        }

        val timeVisible = row.methods.single {
            it.name == "E" && it.parameterTypes == listOf("Lzg1/a;") && it.returnType == "Z"
        }
        check(timeVisible.implementation!!.registerCount == 3)
        val visibleStart = timeVisible.implementation!!.instructions.first()
        timeVisible.addInstructionsWithLabels(0, """
            invoke-static {p0}, $RECALL_SETTINGS->hasRecallLabel(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :nezumi_original_time_visibility
            return v0
        """.trimIndent(), ExternalLabel("nezumi_original_time_visibility", visibleStart))

        val bind = row.methods.single {
            it.name == "p2" && it.parameterTypes == listOf("Lj20/q;", "Lzg1/a;") && it.returnType == "V"
        }
        bind.addInstructions(0, "invoke-static {p0}, $RECALL_SETTINGS->trackRecallRow(Landroid/view/View;)V")

        attachNezumiSettings("attachRecalledMessages")
    }
}