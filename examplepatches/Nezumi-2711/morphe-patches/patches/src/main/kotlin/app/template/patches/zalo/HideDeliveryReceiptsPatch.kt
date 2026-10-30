package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val DELIVERY_REQUEST_PACKET = "Lcom/zing/zalocore/connection/socket/RequestPacket;"
private const val DELIVERY_SETTINGS = "Lapp/template/extension/extension/NezumiSettings;"

private object DeliveryAckFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("ackMsgList"),
        string("seen"),
        string("data"),
        fieldAccess(opcode = Opcode.IPUT_SHORT, definingClass = DELIVERY_REQUEST_PACKET, name = "g"),
        fieldAccess(opcode = Opcode.IPUT_BYTE, definingClass = DELIVERY_REQUEST_PACKET, name = "h"),
    ),
)

@Suppress("unused")
val hideDeliveryReceiptsPatch = bytecodePatch(
    name = "Hide delivery receipts",
    description = "Suppress outgoing message delivery ACKs when enabled in Nezumi Settings.",
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
        check(DeliveryAckFingerprint.matchAll(1..1).size == 1)
        val sender = DeliveryAckFingerprint.method
        check(sender.parameters.map { it.type }.take(4) == listOf("Ljava/util/List;", "Z", "I", "I"))
        check(sender.parameters.size == 5)
        check(sender.implementation!!.registerCount >= 14)
        val originalStart = sender.implementation!!.instructions.first()
        sender.addInstructionsWithLabels(0, """
            const/16 v0, 0x66
            if-eq p3, v0, :nezumi_individual_delivery
            const/16 v0, 0xca
            if-eq p3, v0, :nezumi_individual_delivery
            const/16 v0, 0x2781
            if-eq p3, v0, :nezumi_group_delivery
            const/16 v0, 0x27e5
            if-ne p3, v0, :nezumi_original_delivery
            :nezumi_group_delivery
            if-nez p4, :nezumi_original_delivery
            goto :nezumi_check_delivery_setting
            :nezumi_individual_delivery
            const/4 v0, 0x3
            if-ne p4, v0, :nezumi_original_delivery
            :nezumi_check_delivery_setting
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, $DELIVERY_SETTINGS->isDeliveryReceiptsHidden(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :nezumi_original_delivery
            return-void
        """.trimIndent(), ExternalLabel("nezumi_original_delivery", originalStart))

        attachNezumiSettings()
    }
}