package dev.utaa.linimal.patches.features.readwithoutreceipt

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.utaa.linimal.patches.features.readreceipts.outboundGateFingerprint
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val STRING = "Ljava/lang/String;"
internal const val MANUAL_READ = "linimalMarkReadManually"

/** 公式 executor へ「すべて既読にする」の入口を追加します。通信と既存メソッドの本文は変更しません。 */
val readWithoutReceiptManualReadPatch = bytecodePatch(
    name = "既読なし閲覧中の手動既読入口",
    description = "現在のトーク全体を、公式の既読処理へ渡す入口を追加します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(readWithoutReceiptSendPatch)
    execute {
        val ids = listOf(PatchId.READ_WITHOUT_RECEIPT_MANUAL_READ,
            PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_MANUAL_READ)
        val outbounds = outboundGateFingerprint.matchAllOrNull().orEmpty()
        if (outbounds.size != 1) {
            recordUnappliedFeatureStatus(ids, 2, outbounds.size, "ManualReadExecutorNotUnique")
            return@execute
        }
        val outbound = outbounds.single()
        // 難読化名ではなく、既存 outbound と同じ owner 内の検索契約を使います。
        val getters = Fingerprint(
            definingClass = outbound.originalClassDef.type,
            parameters = listOf(STRING), returnType = "J",
            custom = { method, _ -> isManualReadPointGetter(method) },
        ).matchAllOrNull().orEmpty()
        val actual = 1 + getters.size
        if (getters.size != 1) {
            recordUnappliedFeatureStatus(ids, 2, actual, "ManualReadGetterNotUnique")
            return@execute
        }
        if (!AccessFlags.PUBLIC.isSet(outbound.originalMethod.accessFlags) ||
            AccessFlags.STATIC.isSet(outbound.originalMethod.accessFlags) ||
            outbound.originalClassDef.methods.any { it.name == MANUAL_READ }) {
            recordUnsafeFeatureStatus(ids, 2, actual, "ManualReadBridgeShapeMismatch")
            return@execute
        }
        // 全条件を確認してから変更します。実行時の許可は worker と session token に限定されます。
        val bridge = manualReadBridge(outbound.originalMethod, getters.single().originalMethod)
        outbound.classDef.methods.add(bridge)
        outbound.classDef.virtualMethods.add(bridge)
        recordFeatureStatus(ids, 2, 2, "ManualReadBridgeInjected")
    }
}

/** parseLong → chat/profile ごとの List 検索 → 空判定 → 先頭の long という公式 getter の契約。 */
internal fun isManualReadPointGetter(method: Method): Boolean {
    if (method.parameterTypes != listOf(STRING) || method.returnType != "J" ||
        !AccessFlags.PUBLIC.isSet(method.accessFlags) || !AccessFlags.FINAL.isSet(method.accessFlags) ||
        AccessFlags.STATIC.isSet(method.accessFlags)) return false
    val instructions = method.implementation?.instructions?.toList() ?: return false
    val calls = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
    fun has(owner: String, name: String, parameters: List<String>, result: String) = calls.any {
        it.definingClass == owner && it.name == name && it.parameterTypes == parameters && it.returnType == result
    }
    return has("Ljava/lang/Long;", "parseLong", listOf(STRING), "J") &&
        has("Ljava/util/List;", "isEmpty", emptyList(), "Z") &&
        has("Ljava/util/List;", "get", listOf("I"), "Ljava/lang/Object;") &&
        calls.count { it.parameterTypes == listOf("J", STRING, STRING) && it.returnType == "Ljava/util/List;" } == 1 &&
        calls.count { it.parameterTypes.isEmpty() && it.returnType == "J" } == 1 &&
        instructions.count { it.opcode == Opcode.RETURN_WIDE } == 2
}

/**
 * 公式 getter と観測済みの位置の大きい方を、未読解除付きで公式 d へ渡します。
 * v0:v1 は検索結果、v2 は比較と未読解除の flag。parameter は v3..v6 に置き、元の register は変更しません。
 */
internal fun manualReadBridge(outbound: Method, getter: Method): MutableMethod {
    val implementation = MutableMethodImplementation(7)
    implementation.addInstruction(BuilderInstruction11x(Opcode.RETURN_WIDE, 0))
    val method = MutableMethod(ImmutableMethod(outbound.definingClass, MANUAL_READ,
        listOf("J", STRING).map { ImmutableMethodParameter(it, null, null) }, "J",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, implementation))
    method.addInstructions(0, """
        if-eqz p3, :none
        invoke-virtual {p0, p3}, $getter
        move-result-wide v0
        cmp-long v2, v0, p1
        if-lez v2, :selected
        move-wide p1, v0
        :selected
        const-wide/16 v0, 0x0
        cmp-long v2, p1, v0
        if-lez v2, :none
        const/4 v2, 0x1
        invoke-virtual {p0, p1, p2, p3, v2}, $outbound
        return-wide p1
        :none
        const-wide/16 v0, 0x0
    """.trimIndent())
    val body = checkNotNull(method.implementation)
    val handler = body.instructions.size
    method.addInstructions(handler, """
        move-exception v0
        const-wide/16 v0, 0x0
        return-wide v0
    """.trimIndent())
    body.addCatch(body.newLabelForIndex(0),
        body.newLabelForIndex(handler), body.newLabelForIndex(handler))
    return method
}
