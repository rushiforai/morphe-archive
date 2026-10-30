package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val REQUEST_PACKET = "Lcom/zing/zalocore/connection/socket/RequestPacket;"
private const val SETTINGS = "Lapp/template/extension/extension/NezumiSettings;"

private object DirectTextTypingFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("I", "I", "Z", "Ljava/lang/String;"),
    filters = listOf(
        literal(10306),
        literal(106),
        fieldAccess(opcode = Opcode.IPUT_SHORT, definingClass = REQUEST_PACKET, name = "g"),
        literal(31),
        fieldAccess(opcode = Opcode.IPUT_BYTE, definingClass = REQUEST_PACKET, name = "h"),
    ),
)

private object GroupTextTypingFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"),
    filters = listOf(
        methodCall(definingClass = REQUEST_PACKET, name = "<init>"),
        literal(206),
        fieldAccess(opcode = Opcode.IPUT_SHORT, definingClass = REQUEST_PACKET, name = "g"),
        literal(31),
        fieldAccess(opcode = Opcode.IPUT_BYTE, definingClass = REQUEST_PACKET, name = "h"),
    ),
)

private fun suppressTextTyping(method: MutableMethod, statusParameter: String) {
    val first = method.implementation!!.instructions.first()
    check(method.implementation!!.registerCount >= 11)
    method.addInstructionsWithLabels(0, """
        if-nez $statusParameter, :nezumi_send_typing
        invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
        move-result-object v0
        invoke-static {v0}, $SETTINGS->isTypingHidden(Landroid/content/Context;)Z
        move-result v0
        if-eqz v0, :nezumi_send_typing
        return-void
    """.trimIndent(), ExternalLabel("nezumi_send_typing", first))
}

@Suppress("unused")
val hideTextTypingPatch = bytecodePatch(
    name = "Hide text typing",
    description = "Hide outgoing text typing in direct and group chats when enabled in Nezumi Settings.",
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
        check(DirectTextTypingFingerprint.matchAll(1..1).size == 1)
        check(GroupTextTypingFingerprint.matchAll(1..1).size == 1)
        suppressTextTyping(DirectTextTypingFingerprint.method, "p1")
        suppressTextTyping(GroupTextTypingFingerprint.method, "p2")
        attachNezumiSettings()
    }
}