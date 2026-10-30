package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val REQUEST_PACKET_CLASS = "Lcom/zing/zalocore/connection/socket/RequestPacket;"
private const val READ_SETTINGS = "Lapp/template/extension/extension/NezumiSettings;"

private object SeenAckFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("ackMsgList"),
        string("seen"),
        string("data"),
        fieldAccess(opcode = Opcode.IPUT_SHORT, definingClass = REQUEST_PACKET_CLASS, name = "g"),
        fieldAccess(opcode = Opcode.IPUT_BYTE, definingClass = REQUEST_PACKET_CLASS, name = "h"),
    ),
)

private object ReadMarkerFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        literal(10309),
        literal(205),
        literal(10305),
        literal(118),
    ),
)

@Suppress("unused")
val hideReadReceiptsPatch = bytecodePatch(
    name = "Hide read receipts",
    description = "Keep outgoing read receipts private while retaining delivery ACKs when enabled in Nezumi Settings.",
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
        check(SeenAckFingerprint.matchAll(1..1).size == 1)
        check(ReadMarkerFingerprint.matchAll(1..1).size == 1)

        val seenAck = SeenAckFingerprint.method
        check(seenAck.parameters.size == 5 && seenAck.parameters.map { it.type }.take(4) ==
            listOf("Ljava/util/List;", "Z", "I", "I"))
        val callbackType = seenAck.parameters.last().type
        val callback = mutableClassDefBy(callbackType).methods.single {
            it.parameterTypes == listOf("Ljava/lang/Object;") && it.returnType == "V" &&
                it.accessFlags and AccessFlags.PUBLIC.value != 0
        }
        check(seenAck.implementation!!.registerCount >= 14)
        val ackStart = seenAck.implementation!!.instructions.first()
        seenAck.addInstructionsWithLabels(0, """
            if-eqz p2, :nezumi_original_ack
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, $READ_SETTINGS->isReadReceiptsHidden(Landroid/content/Context;)Z
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

        val readMarker = ReadMarkerFingerprint.method
        check(readMarker.parameters.size == 6 && readMarker.parameters.map { it.type }.take(4) ==
            listOf("Ljava/util/List;", "Z", "Z", "Z"))
        check(readMarker.implementation!!.registerCount >= 16)
        val markerStart = readMarker.implementation!!.instructions.first()
        readMarker.addInstructionsWithLabels(0, """
            if-eqz p2, :nezumi_original_marker
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, $READ_SETTINGS->isReadReceiptsHidden(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :nezumi_original_marker
            const/16 p2, 0x0
        """.trimIndent(), ExternalLabel("nezumi_original_marker", markerStart))

        attachNezumiSettings()
    }
}