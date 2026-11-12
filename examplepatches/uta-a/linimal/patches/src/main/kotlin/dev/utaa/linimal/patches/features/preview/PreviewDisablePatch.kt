package dev.utaa.linimal.patches.features.preview

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Annotation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val TARGET_COUNT = 1
private const val DEBUG_METADATA = "Ldt8/f;"
private const val AVAILABILITY_CLASS = "com.linecorp.line.chattab.ChatScrollPreviewAvailability"
private const val RESOLVE_PLAN = "resolvePlan"
private const val HOOK = "Ldev/utaa/linimal/extension/features/PreviewDisableHooks;->shouldDisablePreview()Z"

/**
 * `ChatScrollPreviewAvailability.resolvePlan` の suspend continuation。R8 後も DebugMetadata に
 * 元の class 名と method 名が残るため、これを起点に可否判定の class を辿ります。
 */
private val resolvePlanContinuationFingerprint = Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { _, classDef -> isResolvePlanMetadata(classDef.annotations) },
)

/**
 * トーク一覧の長押しでプレビューを開くかどうかの判定（`ChatScrollPreviewAvailability.a()`）を、
 * 設定 ON のときだけ false にして従来の長押しメニューへ戻します。
 *
 * <p>判定はトークタブと Square のスレッドホームの長押し、`resolvePlan`、プレビューの案内表示、
 * 長押しのログが共有しています。この 1 か所だけを変えるので、それぞれが従来メニュー側でそろいます。
 * プレビュー画面の中を書き換える既存パッチ（スクロール、Premium の案内、既読をつけずに読む行）とは
 * 対象の method が重なりません。</p>
 */
val previewDisablePatch = bytecodePatch(
    name = "Disable chat preview",
    description = "トーク一覧の長押しで、プレビューではなく従来の長押しメニューを開けるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(previewScrollPatch)

    execute {
        val ids = listOf(PatchId.PREVIEW_DISABLE)
        val continuations = resolvePlanContinuationFingerprint.matchAllOrNull().orEmpty()
        if (continuations.size != TARGET_COUNT) {
            recordUnappliedFeatureStatus(ids, TARGET_COUNT, continuations.size, "PreviewDisableResolvePlanNotUnique")
            return@execute
        }
        val resolvePlan = resolvePlanCall(continuations.single().originalMethod.implementation?.instructions?.toList().orEmpty())
        val ownerClass = resolvePlan?.let { classDefByOrNull(it.definingClass) }
        val resolvePlanMethod = ownerClass?.methods?.singleOrNull { method ->
            method.name == resolvePlan.name &&
                method.returnType == resolvePlan.returnType &&
                method.parameterTypes.map { it.toString() } == resolvePlan.parameterTypes.map { it.toString() }
        }
        val availabilityName = resolvePlanMethod?.implementation?.let { implementation ->
            availabilityCallName(implementation.instructions.toList(), ownerClass.type)
        }
        if (availabilityName == null) {
            recordUnsafeFeatureStatus(ids, TARGET_COUNT, TARGET_COUNT, "PreviewDisableAvailabilityNotFound")
            return@execute
        }

        val mutableOwner = mutableClassDefByOrNull(ownerClass.type)
        val target = mutableOwner?.methods?.singleOrNull { method ->
            method.name == availabilityName && method.returnType == "Z" && method.parameterTypes.isEmpty()
        }
        val implementation = target?.implementation
        val register = implementation?.let {
            availabilityInjectionRegister(it.instructions.toList(), it.registerCount, insCount = 1)
        }
        if (target == null || register == null || !isSafeInjectionIndex(implementation, 0)) {
            recordUnsafeFeatureStatus(ids, TARGET_COUNT, TARGET_COUNT, "PreviewDisableAvailabilityShapeMismatch")
            return@execute
        }

        injectPreviewDisable(target, register)
        patchStatusCollector.record(
            patchId = PatchId.PREVIEW_DISABLE,
            expectedTargetCount = TARGET_COUNT,
            actualTargetCount = TARGET_COUNT,
            reason = "PreviewDisableGuarded",
        )
    }
}

/**
 * 可否判定の先頭に、hook が true なら false を返す早期 return を入れます。false のときは元の先頭命令へ
 * 分岐し、公式の判定をそのまま実行します。
 */
internal fun injectPreviewDisable(method: MutableMethod, register: Int) {
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $HOOK
            move-result v$register
            if-eqz v$register, :linimal_preview_official
            const/4 v$register, 0x0
            return v$register
        """.trimIndent(),
        ExternalLabel("linimal_preview_official", method.getInstruction(0)),
    )
}

/** DebugMetadata が `ChatScrollPreviewAvailability.resolvePlan` を指しているかどうか。 */
internal fun isResolvePlanMetadata(annotations: Iterable<Annotation>): Boolean =
    annotations.any { annotation ->
        annotation.type == DEBUG_METADATA &&
            annotation.stringElement("c") == AVAILABILITY_CLASS &&
            annotation.stringElement("m") == RESOLVE_PLAN
    }

private fun Annotation.stringElement(name: String): String? =
    (elements.firstOrNull { it.name == name }?.value as? StringEncodedValue)?.value

/** continuation が呼ぶ `resolvePlan(Continuation)Enum`。候補が 1 つでなければ null。 */
internal fun resolvePlanCall(instructions: List<Instruction>): MethodReference? =
    instructions.mapNotNull { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.takeIf {
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                it.returnType == "Ljava/lang/Enum;" &&
                it.parameterTypes.size == 1
        }
    }.singleOrNull()

/**
 * `resolvePlan` の中で、同じ class の引数なし boolean method を呼ぶ箇所が 1 つだけなら、その名前。
 * これがプレビューの可否判定です。
 */
internal fun availabilityCallName(instructions: List<Instruction>, ownerType: String): String? =
    instructions.mapNotNull { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.takeIf {
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                it.definingClass == ownerType &&
                it.returnType == "Z" &&
                it.parameterTypes.isEmpty()
        }?.name
    }.singleOrNull()

/**
 * 先頭へ早期 return を挿入するときに使える register。
 *
 * <p>先頭命令が `p0` の field を読んで local register に書く `iget-object` である場合だけ、その書き込み先を
 * 返します。元の処理はこの register を最初に上書きするので、hook の結果を一時的に置いても壊れません。
 * `const/4` と `if-eqz` の encoding に収まらない register や、引数 register は拒否します。</p>
 */
internal fun availabilityInjectionRegister(
    instructions: List<Instruction>,
    registerCount: Int,
    insCount: Int,
): Int? {
    val first = instructions.firstOrNull() as? TwoRegisterInstruction ?: return null
    if (first.opcode != Opcode.IGET_OBJECT) return null
    val thisRegister = registerCount - insCount
    val register = first.registerA
    if (first.registerB != thisRegister || register == thisRegister) return null
    if (register !in 0 until minOf(16, thisRegister)) return null
    return register
}
