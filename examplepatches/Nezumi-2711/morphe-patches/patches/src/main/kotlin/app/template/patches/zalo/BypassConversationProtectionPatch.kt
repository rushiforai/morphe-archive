package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val BLOCK_SHARING_STATE = "Lcom/zing/zalo/comm/privacy/data/model/BlockSharingState;"

private object ConversationProtectedFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/concurrent/ConcurrentHashMap;", name = "get"),
        methodCall(definingClass = "Lkotlinx/coroutines/flow/MutableStateFlow;", name = "getValue"),
        fieldAccess(definingClass = BLOCK_SHARING_STATE, name = "a"),
    ),
)

private object ConversationProtectedFlowFingerprint : Fingerprint(
    returnType = "Lkotlinx/coroutines/flow/Flow;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Ljava/lang/Boolean;", name = "FALSE"),
        methodCall(definingClass = "Ljava/util/concurrent/ConcurrentHashMap;", name = "computeIfAbsent"),
        methodCall(definingClass = "Lkotlinx/coroutines/flow/FlowKt;", name = "o"),
    ),
)

@Suppress("unused")
val bypassConversationProtectionPatch = bytecodePatch(
    name = "Bypass conversation protection",
    description = "Unblock screenshots, screen recording, forwarding, copying and saving media in protected conversations when enabled in Nezumi Settings.",
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
        registerApplied(PatchId.BYPASS_CONVERSATION_PROTECTION)
        check(ConversationProtectedFingerprint.matchAll(1..1).size == 1)
        check(ConversationProtectedFlowFingerprint.matchAll(1..1).size == 1)

        val protectedMethod = ConversationProtectedFingerprint.method
        check(protectedMethod.implementation!!.registerCount >= 1)
        val protectedFirst = protectedMethod.implementation!!.instructions.first()
        protectedMethod.addInstructionsWithLabels(0, """
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, $CHAT_OPTIONS->isConversationProtectionBypassed(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :nezumi_original_protection
            const/4 v0, 0x0
            return v0
        """.trimIndent(), ExternalLabel("nezumi_original_protection", protectedFirst))

        val flowMethod = ConversationProtectedFlowFingerprint.method
        check(flowMethod.implementation!!.registerCount >= 2)
        val flowFirst = flowMethod.implementation!!.instructions.first()
        flowMethod.addInstructionsWithLabels(0, """
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, $CHAT_OPTIONS->isConversationProtectionBypassed(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :nezumi_original_protection_flow
            new-instance v0, Lkotlinx/coroutines/flow/FlowKt__BuildersKt${'$'}flowOf${'$'}${'$'}inlined${'$'}unsafeFlow${'$'}2;
            sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            invoke-direct {v0, v1}, Lkotlinx/coroutines/flow/FlowKt__BuildersKt${'$'}flowOf${'$'}${'$'}inlined${'$'}unsafeFlow${'$'}2;-><init>(Ljava/lang/Object;)V
            return-object v0
        """.trimIndent(), ExternalLabel("nezumi_original_protection_flow", flowFirst))

        registerHooks(PatchId.BYPASS_CONVERSATION_PROTECTION, protectedMethod, flowMethod)
        attachNezumiSettings("attachConversationProtection")
    }
}
