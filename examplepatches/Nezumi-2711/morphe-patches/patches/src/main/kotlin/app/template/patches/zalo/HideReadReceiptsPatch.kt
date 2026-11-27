package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val REQUEST_PACKET_CLASS = "Lcom/zing/zalocore/connection/socket/RequestPacket;"

private object SeenAckFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("seen"),
        string("data"),
        fieldAccess(opcode = Opcode.IPUT_SHORT, definingClass = REQUEST_PACKET_CLASS, name = "g"),
        fieldAccess(opcode = Opcode.IPUT_BYTE, definingClass = REQUEST_PACKET_CLASS, name = "h"),
    ),
)

private object ChatDrawerButtonFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/ChatView;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET, name = "zds_ic_list_1_line_24"),
        methodCall(definingClass = "Landroid/view/View;", name = "bringToFront"),
    ),
)

@Suppress("unused")
val hideReadReceiptsPatch = bytecodePatch(
    name = "Hide read receipts",
    description = "Keep outgoing read receipts private while retaining delivery ACKs when enabled in Nezumi Settings. " +
        "Adds a Mark as read button to the chat toolbar for sending a read receipt on demand.",
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
        registerApplied(PatchId.HIDE_READ_RECEIPTS)
        check(SeenAckFingerprint.matchAll(1..1).size == 1)

        val seenAck = SeenAckFingerprint.method
        check(seenAck.parameters.size == 5 && seenAck.parameters.map { it.type }.take(4) ==
            listOf("Ljava/util/List;", "Z", "I", "I"))
        val callbackType = seenAck.parameters.last().type
        val callback = mutableClassDefBy(callbackType).methods.single {
            it.parameterTypes == listOf("Ljava/lang/Object;") && it.returnType == "V" &&
                it.accessFlags and AccessFlags.PUBLIC.value != 0
        }
        check(seenAck.implementation!!.registerCount >= 8)
        val ackStart = seenAck.implementation!!.instructions.first()
        seenAck.addInstructionsWithLabels(0, """
            if-eqz p2, :nezumi_original_ack
            invoke-static {}, $MARK_AS_READ->isSeenBypass()Z
            move-result v0
            if-nez v0, :nezumi_original_ack
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, $CHAT_OPTIONS->isReadReceiptsHidden(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :nezumi_original_ack
            const/16 v0, 0x6b
            if-eq p3, v0, :nezumi_finish_seen
            const/16 v0, 0xcb
            if-ne p3, v0, :nezumi_delivery_ack
            :nezumi_finish_seen
            if-eqz p5, :nezumi_seen_done
            new-instance v0, Lorg/json/JSONObject;
            invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
            invoke-virtual {p5, v0}, $callbackType->${callback.name}(Ljava/lang/Object;)V
            :nezumi_seen_done
            return-void
            :nezumi_delivery_ack
            const/16 p2, 0x0
        """.trimIndent(), ExternalLabel("nezumi_original_ack", ackStart))

        attachNezumiSettings("attachReadReceipts")

        check(ChatDrawerButtonFingerprint.matchAll(1..1).size == 1)
        val drawerRefresh = ChatDrawerButtonFingerprint.method
        check(drawerRefresh.implementation!!.registerCount >= 1)
        val returns = drawerRefresh.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(returns.isNotEmpty())
        returns.asReversed().forEach { index ->
            drawerRefresh.addInstructions(index, "invoke-static {p0}, $MARK_AS_READ->attach(Ljava/lang/Object;)V")
        }
        registerHooks(PatchId.HIDE_READ_RECEIPTS, seenAck, drawerRefresh)
    }
}