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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RECALL_SETTINGS = "Lapp/template/extension/extension/NezumiSettings;"

// 26.11.01: the "msgActionUndo" log string is gone; the undo handler is now
// SpecialMessageProcessor.e(vv3), identified by the UNDO enum read plus its logger tag.
private object IncomingUndoFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "UNDO"),
        string("SpecialMessageProcessor"),
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
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(IncomingUndoFingerprint.matchAll(1..1).size == 1)
        check(IncomingDeleteControlFingerprint.matchAll(1..1).size == 1)
        val undo = IncomingUndoFingerprint.method
        val control = IncomingDeleteControlFingerprint.method
        check(undo.definingClass == control.definingClass)

        // Obfuscated app types: message, control payload, control event, bind style type.
        val message = "Lvv3;"
        val controlPayload = "Lnw3;"
        val controlEvent = "Lga7;"
        val rowStyle = "Lmu3;"
        check(undo.parameters.map { it.type } == listOf(message))
        check(control.parameters.map { it.type } == listOf(message, controlPayload, controlEvent))
        check(undo.implementation!!.registerCount == 13)
        check(control.implementation!!.registerCount == 15)

        listOf(undo, control).forEachIndexed { eventType, method ->
            val originalStart = method.implementation!!.instructions.first()
            val targetId = if (eventType == 0) """
                iget-object v0, p1, Lvv3;->H1:Lmgj;
                if-eqz v0, :nezumi_skip_marker
                iget-object v0, v0, Lmgj;->b:Ljava/lang/Object;
            """.trimIndent() else """
                iget-object v0, p3, Lga7;->b:Lcom/zing/zalo/data/entity/chat/message/MessageId;
            """.trimIndent()
            method.addInstructionsWithLabels(0, """
                iget-object v0, p1, $message->c:Ljava/lang/String;
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
        // 26.11.01: getCurrentTimeText reuses p0's register, so `this` is gone at its returns.
        // Wrap the private method's two call sites (dedup check and row bind) instead.
        var wrapped = 0
        row.methods.filter { it.implementation != null && it != timeText }.forEach { caller ->
            val list = caller.implementation!!.instructions.toList()
            list.indices.reversed().forEach { index ->
                val invoke = list[index] as? FiveRegisterInstruction ?: return@forEach
                val ref = (invoke as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEach
                if (ref.definingClass != "Lcom/zing/zalo/ui/chat/chatrow/ChatRow;" ||
                    ref.name != "getCurrentTimeText" || ref.parameterTypes.isNotEmpty()) return@forEach
                val result = list[index + 1]
                check(result.opcode == Opcode.MOVE_RESULT_OBJECT)
                val resultRegister = (result as OneRegisterInstruction).registerA
                check(invoke.registerCount == 1 && invoke.registerC != resultRegister)
                caller.addInstructions(index + 2, """
                    invoke-static {v${invoke.registerC}, v$resultRegister}, $RECALL_SETTINGS->formatRecallTime(Landroid/view/View;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$resultRegister
                """.trimIndent())
                wrapped++
            }
        }
        check(wrapped == 2) { "Expected two getCurrentTimeText call sites, found $wrapped" }

        val timeVisible = row.methods.single {
            it.name == "E" && it.parameterTypes == listOf(rowStyle) && it.returnType == "Z"
        }
        // 26.11.01: E has no spare registers (v0=this, v1=style). Its first two instructions are
        // `iget-boolean v1, v1, style.f` / `if-nez v1, :true`; after those v1 is dead, so the
        // recall check slots in there (equivalent: the original already returns true when f is set).
        check(timeVisible.implementation!!.registerCount == 2)
        val list = timeVisible.implementation!!.instructions.toList()
        check(list[0].opcode == Opcode.IGET_BOOLEAN && (list[0] as OneRegisterInstruction).registerA == 1)
        check(list[1].opcode == Opcode.IF_NEZ && (list[1] as OneRegisterInstruction).registerA == 1)
        timeVisible.addInstructionsWithLabels(2, """
            invoke-static {p0}, $RECALL_SETTINGS->hasRecallLabel(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :nezumi_original_time_visibility
            return v1
        """.trimIndent(), ExternalLabel("nezumi_original_time_visibility", list[2]))

        val bind = row.methods.single {
            it.name == "p2" && it.parameterTypes == listOf(message, rowStyle) && it.returnType == "V"
        }
        bind.addInstructions(0, "invoke-static {p0}, $RECALL_SETTINGS->trackRecallRow(Landroid/view/View;)V")

        attachNezumiSettings("attachRecalledMessages")
    }
}
