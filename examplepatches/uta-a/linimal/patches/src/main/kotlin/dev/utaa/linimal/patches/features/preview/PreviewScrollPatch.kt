package dev.utaa.linimal.patches.features.preview

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.features.premium.CHAT_HISTORY_PREVIEW_ACTIVITY_PREFIX
import dev.utaa.linimal.patches.features.premium.premiumPreviewPromotionPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.fallsThrough
import dev.utaa.linimal.patches.util.instructionWritesRegister
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val TARGET_COUNT = 1
private const val HOOK = "Ldev/utaa/linimal/extension/features/PreviewScrollHooks;->allowScroll(Z)Z"

// プレビュー Activity の openFullChat / countVerticalScroll callback を組み立てる箇所。
private val previewScrollFingerprint = Fingerprint(
    name = "invoke",
    returnType = OBJECT,
    parameters = emptyList(),
    strings = listOf("openFullChat()V", "countVerticalScroll()V"),
)

val previewScrollPatch = bytecodePatch(
    name = "プレビューのスクロール",
    description = "トークのプレビュー画面をスクロールできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(premiumPreviewPromotionPatch)

    execute {
        val matches = previewScrollFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != TARGET_COUNT) {
            recordUnappliedFeatureStatus(listOf(PatchId.PREVIEW_SCROLL), TARGET_COUNT, matches.size, "PreviewScrollConsumerNotUnique")
            return@execute
        }
        val match = matches.single()
        val implementation = match.originalMethod.implementation
        val shape = implementation?.let {
            previewScrollInjection(it.instructions.toList(), exceptionHandlerAddresses(it))
        }
        if (shape == null) {
            recordUnsafeFeatureStatus(listOf(PatchId.PREVIEW_SCROLL), TARGET_COUNT, TARGET_COUNT, "PreviewScrollConsumerShapeMismatch")
            return@execute
        }
        match.method.addInstructions(shape.index, """
            invoke-static/range { v${shape.register} .. v${shape.register} }, $HOOK
            move-result v${shape.register}
        """.trimIndent())
        patchStatusCollector.record(
            patchId = PatchId.PREVIEW_SCROLL,
            expectedTargetCount = TARGET_COUNT,
            actualTargetCount = TARGET_COUNT,
            reason = "PreviewScrollGuarded",
        )
    }
}

internal data class PreviewScrollInjection(val index: Int, val register: Int)

/** 元の policy の boolean がプレビュー画面 model の唯一の boolean 引数に届く経路だけを書き換えます。 */
internal fun previewScrollInjection(
    instructions: List<Instruction>,
    handlerAddresses: Set<Int> = emptySet(),
): PreviewScrollInjection? {
    val constructors = instructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        val params = ref?.parameterTypes?.map { it.toString() }
        instruction.opcode == Opcode.INVOKE_DIRECT_RANGE && ref?.name == "<init>" &&
            ref.returnType == "V" && params != null && params.size == 10 &&
            params[2] == "Ljava/lang/String;" && params[3] == "Z" && params.count { it == "Z" } == 1 &&
            params.takeLast(3).all { it.startsWith(CHAT_HISTORY_PREVIEW_ACTIVITY_PREFIX) }
    }
    val constructor = constructors.singleOrNull() ?: return null
    val range = constructor.value as? RegisterRangeInstruction ?: return null
    if (range.registerCount != 11) return null
    val scrollRegister = range.startRegister + 4
    if (scrollRegister > 255) return null

    val calls = instructions.withIndex().filter { (index, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        val cast = instructions.getOrNull(index - 1) as? ReferenceInstruction
        val castType = cast?.reference as? TypeReference
        instruction.opcode == Opcode.INVOKE_INTERFACE && ref?.returnType == "Z" &&
            ref.parameterTypes.isEmpty() && cast?.opcode == Opcode.CHECK_CAST && castType?.type == ref.definingClass &&
            (instruction as? FiveRegisterInstruction)?.let { invoke ->
                invoke.registerCount == 1 && invoke.registerC == (cast as? OneRegisterInstruction)?.registerA
            } == true
    }
    val call = calls.singleOrNull() ?: return null
    val resultIndex = call.index + 1
    val result = instructions.getOrNull(resultIndex) as? OneRegisterInstruction ?: return null
    if (result.opcode != Opcode.MOVE_RESULT || result.registerA != scrollRegister || resultIndex + 1 >= constructor.index) return null
    // 分岐・handler が途中へ入る経路、boolean の上書き、別経路への分岐はいずれも拒否します。
    for (index in resultIndex + 1..constructor.index) {
        if (isDivertedInjectionIndex(instructions, index, handlerAddresses)) return null
        if (index < constructor.index && (instructions[index] is OffsetInstruction ||
                    !fallsThrough(instructions[index]) || instructionWritesRegister(instructions[index], scrollRegister))) return null
    }
    return PreviewScrollInjection(resultIndex + 1, scrollRegister)
}
