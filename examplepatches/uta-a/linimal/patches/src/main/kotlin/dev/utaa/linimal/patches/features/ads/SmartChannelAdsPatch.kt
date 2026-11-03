package dev.utaa.linimal.patches.features.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.features.home.homeTrendingPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatusCollector
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val SMART_CHANNEL_LAYOUT =
    "Lcom/linecorp/line/admolin/smartch/v2/view/SmartChannelViewLayout;"
private const val RENDERER = "Ldz2/a;"
private const val FLOW_CONTINUATION = "Lkotlin/coroutines/Continuation;"
private const val UNIT = "Lvs8/i0;"
private const val UNIT_INSTANCE = "a"
private const val SMART_CHANNEL_HOOK =
    "Ldev/utaa/linimal/extension/features/SmartChannelHooks;->shouldSuppressRenderer(Ljava/lang/Object;)Z"
private const val SMART_CHANNEL_REBIND_HOOK =
    "Ldev/utaa/linimal/extension/features/SmartChannelHooks;->rendererForBinding(Ljava/lang/Object;)Ljava/lang/Object;"
private const val SMART_CHANNEL_PLACEMENT_HOOK =
    "Ldev/utaa/linimal/extension/features/SmartChannelHooks;->shouldSuppressPlacement(Ljava/lang/Object;)Z"

/** ui state gate / initial bind / rebind の 3 件。1 件でも欠けると partial になります。 */
internal const val SMART_CHANNEL_TARGET_COUNT = 3

/**
 * Smart Channel の placement UI state handler。SmartChannelViewLayout の visibility 切替、
 * renderer の生成 / bind / cleanup をまとめて行う唯一の funnel で、Flow collector の emit として
 * 実装されています。枠（SmartChannelViewLayout）を表示状態へ戻す経路はこの method に限られるため、
 * ここを塞げば枠は layout XML の既定値 gone のまま維持されます。
 */
private val smartChannelUiStateFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", FLOW_CONTINUATION),
    filters = listOf(
        fieldAccess(type = SMART_CHANNEL_LAYOUT, opcode = Opcode.IGET_OBJECT),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setVisibility",
            parameters = listOf("I"),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        methodCall(
            definingClass = RENDERER,
            name = "onPause",
            parameters = emptyList(),
            returnType = "V",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
        methodCall(
            parameters = listOf("Lsx5/a;", "Ldy5/a;", "Ljava/lang/String;", "L"),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        methodCall(
            definingClass = "Ldy5/a;",
            name = "j",
            parameters = emptyList(),
            returnType = "V",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
    ),
)

/**
 * SmartChannelViewLayout の tag lookup → factory → addView → renderer bind sequence。
 * presentation の組立だけを対象にし、ad request / response / billing / payment の経路には触れません。
 */
private val smartChannelInitialBindFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lsx5/a;", "Ldy5/a;", "Ljava/lang/String;", "L"),
    filters = listOf(
        fieldAccess(type = SMART_CHANNEL_LAYOUT, opcode = Opcode.IGET_OBJECT),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "findViewWithTag",
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Landroid/view/View;",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        methodCall(
            parameters = listOf("Landroid/content/Context;", "Lk/d;"),
            returnType = "Landroid/view/View;",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
        methodCall(
            definingClass = "Landroid/view/ViewGroup;",
            name = "addView",
            parameters = listOf("Landroid/view/View;"),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        checkCast(RENDERER),
        methodCall(
            definingClass = RENDERER,
            name = "l",
            parameters = listOf("Llw2/c;"),
            returnType = "V",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
        methodCall(
            definingClass = "Ldy5/a;",
            name = "j",
            parameters = emptyList(),
            returnType = "V",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
    ),
)

/** orientation rebind callback: existing renderer lookup → renderer.l(model) → View.post. */
private val smartChannelRebindFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/Objects;",
            name = "toString",
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Ljava/lang/String;",
            opcode = Opcode.INVOKE_STATIC,
        ),
        methodCall(parameters = emptyList(), returnType = RENDERER, opcode = Opcode.INVOKE_VIRTUAL),
        methodCall(
            definingClass = RENDERER,
            name = "l",
            parameters = listOf("Llw2/c;"),
            returnType = "V",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "post",
            parameters = listOf("Ljava/lang/Runnable;"),
            returnType = "Z",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

val smartChannelAdsPatch = bytecodePatch(
    name = "Smart Channel の広告",
    description = "トーク一覧の Smart Channel にある広告を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(homeTrendingPatch)

    execute {
        val uiStateMatches = smartChannelUiStateFingerprint.matchAllOrNull().orEmpty()
        val initialMatches = smartChannelInitialBindFingerprint.matchAllOrNull().orEmpty()
        val rebindMatches = smartChannelRebindFingerprint.matchAllOrNull().orEmpty()
        val actualTargetCount = uiStateMatches.size + initialMatches.size + rebindMatches.size

        // expected target set は ui state gate / initial bind / rebind の 3 件です。
        // いずれかが複数一致した時点で注入位置を一意に決められないため、注入せず ERROR を残します。
        if (uiStateMatches.size > 1 || initialMatches.size > 1 || rebindMatches.size > 1) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.SMART_CHANNEL_ADS),
                expectedTargetCount = SMART_CHANNEL_TARGET_COUNT,
                actualTargetCount = actualTargetCount,
                reason = "SmartChannelTargetNotUnique",
            )
            return@execute
        }

        var unsafe = false
        if (uiStateMatches.size == 1) {
            unsafe = !guardPlacementUiState(uiStateMatches.single()) || unsafe
        }
        if (initialMatches.size == 1) {
            unsafe = !guardInitialBind(initialMatches.single()) || unsafe
        }
        if (rebindMatches.size == 1) {
            unsafe = !guardRebind(rebindMatches.single()) || unsafe
        }

        if (unsafe) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.SMART_CHANNEL_ADS),
                expectedTargetCount = SMART_CHANNEL_TARGET_COUNT,
                actualTargetCount = actualTargetCount,
                reason = "SmartChannelInstructionShapeMismatch",
            )
            return@execute
        }

        patchStatusCollector.record(
            smartChannelSuppressionRecord(actualTargetCount, uiStateMatches.size == 1),
        )
    }
}

/**
 * 枠の gate が入らない構成では renderer を外しても SmartChannelViewLayout の minHeight が残るため、
 * partial であることを reason でも区別できるようにします。
 */
internal fun smartChannelSuppressionRecord(
    actualTargetCount: Int,
    frameGateApplied: Boolean,
) = PatchStatusRecord(
    patchId = PatchId.SMART_CHANNEL_ADS,
    status = PatchStatusCollector.statusFor(SMART_CHANNEL_TARGET_COUNT, actualTargetCount),
    expectedTargetCount = SMART_CHANNEL_TARGET_COUNT,
    actualTargetCount = actualTargetCount,
    reason = when {
        actualTargetCount == SMART_CHANNEL_TARGET_COUNT -> "SmartChannelFrameAndBindGuarded"
        !frameGateApplied -> "SmartChannelFrameGateMissing"
        else -> "SmartChannelTargetPartial"
    },
)

/**
 * `iget-object <frame>, <handler>, SmartChannelViewLayout` の直後に runtime gate を置きます。
 * OFF は hook が false を返して LINE の元の UI state 処理へそのまま進み、ON は枠を GONE にしてから
 * この method 唯一の `Unit.INSTANCE` return へ合流します。ad request / response には到達しません。
 */
private fun guardPlacementUiState(match: Match): Boolean {
    val method = match.method
    val implementation = method.implementation ?: return false
    val instructions = implementation.instructions.toList()
    val frameIndex = match.instructionMatches[0].index

    val frameRead = instructions.getOrNull(frameIndex) as? TwoRegisterInstruction
    val frameField = (instructions.getOrNull(frameIndex) as? ReferenceInstruction)
        ?.reference as? FieldReference
    val classProbe = instructions.getOrNull(frameIndex + 1) as? ReferenceInstruction
    val classProbeReference = classProbe?.reference as? MethodReference
    val scratchWrite = instructions.getOrNull(frameIndex + 2) as? TwoRegisterInstruction

    // handler field の読み出し 3 連 → getClass() null check → 次の field 読み出し、という shape を固定します。
    // 注入は getClass() の後なので、scratch register は直後の iget-object が必ず上書きします。
    if (
        instructions.getOrNull(frameIndex)?.opcode != Opcode.IGET_OBJECT ||
        frameRead == null ||
        frameField?.type != SMART_CHANNEL_LAYOUT ||
        frameRead.registerA !in 0..15 ||
        instructions.getOrNull(frameIndex + 1)?.opcode != Opcode.INVOKE_VIRTUAL ||
        classProbeReference?.definingClass != "Ljava/lang/Object;" ||
        classProbeReference.name != "getClass" ||
        classProbeReference.parameterTypes.isNotEmpty() ||
        classProbeReference.returnType != "Ljava/lang/Class;" ||
        instructions.getOrNull(frameIndex + 2)?.opcode != Opcode.IGET_OBJECT ||
        scratchWrite == null ||
        scratchWrite.registerA !in 0..15 ||
        scratchWrite.registerA == frameRead.registerA
    ) {
        return false
    }

    val unitReturnIndex = unitReturnIndexOrNull(instructions) ?: return false
    if (unitReturnIndex <= frameIndex + 2) {
        return false
    }

    method.addInstructionsWithLabels(
        frameIndex + 2,
        """
            invoke-static { v${frameRead.registerA} }, $SMART_CHANNEL_PLACEMENT_HOOK
            move-result v${scratchWrite.registerA}
            if-eqz v${scratchWrite.registerA}, :original
            goto :suppressed
            :original
            nop
        """.trimIndent(),
        ExternalLabel("suppressed", instructions[unitReturnIndex]),
    )
    return true
}

/**
 * `sget-object <reg>, Unit.INSTANCE` → `return-object <same reg>` の唯一の正常終了 tail を返します。
 * 複数あると合流先を一意に決められないため null を返して注入を見送ります。
 */
private fun unitReturnIndexOrNull(
    instructions: List<Instruction>,
): Int? {
    val candidates = instructions.indices.filter { index ->
        val load = instructions[index]
        val loadRegister = (load as? OneRegisterInstruction)?.registerA
        val field = (load as? ReferenceInstruction)?.reference as? FieldReference
        val returnInstruction = instructions.getOrNull(index + 1)
        val returnRegister = (returnInstruction as? OneRegisterInstruction)?.registerA

        load.opcode == Opcode.SGET_OBJECT &&
            field?.definingClass == UNIT &&
            field.name == UNIT_INSTANCE &&
            field.type == UNIT &&
            returnInstruction?.opcode == Opcode.RETURN_OBJECT &&
            loadRegister != null &&
            loadRegister == returnRegister
    }
    return candidates.singleOrNull()
}

private fun guardInitialBind(match: Match): Boolean {
    val method = match.method
    val findViewIndex = match.instructionMatches[1].index
    val finishIndex = match.instructionMatches[6].index
    val instructions = method.implementation?.instructions?.toList().orEmpty()
    val findView = instructions.getOrNull(findViewIndex) as? ReferenceInstruction
    val findViewReference = findView?.reference as? MethodReference
    val viewResult = instructions.getOrNull(findViewIndex + 1) as? OneRegisterInstruction
    val scratch = instructions.getOrNull(findViewIndex + 2) as? OneRegisterInstruction
    val scratchLiteral = instructions.getOrNull(findViewIndex + 2) as? NarrowLiteralInstruction

    // `move-result-object <tag view>` の直後は const/4 v2, 0。OFF はその const をそのまま通し、
    // ON は final dy5/a.j() へ進めて request/lifecycle completion を残します。
    if (
        findView?.opcode != Opcode.INVOKE_VIRTUAL ||
        findViewReference?.definingClass != "Landroid/view/View;" ||
        findViewReference.name != "findViewWithTag" ||
        viewResult?.opcode != Opcode.MOVE_RESULT_OBJECT ||
        viewResult.registerA !in 0..15 ||
        scratch?.opcode != Opcode.CONST_4 ||
        scratchLiteral?.narrowLiteral != 0 ||
        scratch.registerA !in 0..15 ||
        finishIndex <= findViewIndex + 2 ||
        method.implementation == null
    ) {
        return false
    }

    method.addInstructionsWithLabels(
        findViewIndex + 2,
        """
            invoke-static { v${viewResult.registerA} }, $SMART_CHANNEL_HOOK
            move-result v${scratch.registerA}
            if-eqz v${scratch.registerA}, :original
            goto :finish
            :original
            nop
        """.trimIndent(),
        ExternalLabel("finish", instructions[finishIndex]),
    )
    return true
}

private fun guardRebind(match: Match): Boolean {
    val method = match.method
    val bindIndex = match.instructionMatches[2].index
    val instructions = method.implementation?.instructions?.toList().orEmpty()
    val bind = instructions.getOrNull(bindIndex) as? FiveRegisterInstruction
    val bindReference = (instructions.getOrNull(bindIndex) as? ReferenceInstruction)
        ?.reference as? MethodReference
    val next = instructions.getOrNull(bindIndex + 1)
    val rendererRegister = bind?.registerC
    val modelRegister = bind?.registerD

    // renderer を同じ object register 上で null または元instanceへ変換します。boolean scratchを使わないため、
    // bindのmodel引数と後続命令のlive registerを上書きしません。nullなら次のRunnable allocationへ進みます。
    if (
        bind?.opcode != Opcode.INVOKE_INTERFACE ||
        bind.registerCount != 2 ||
        bindReference?.definingClass != RENDERER ||
        bindReference.name != "l" ||
        bindReference.parameterTypes != listOf("Llw2/c;") ||
        rendererRegister == null ||
        rendererRegister !in 0..15 ||
        modelRegister == null ||
        modelRegister !in 0..15 ||
        rendererRegister == modelRegister ||
        next?.opcode != Opcode.NEW_INSTANCE ||
        method.implementation == null
    ) {
        return false
    }

    method.addInstructionsWithLabels(
        bindIndex,
        """
            invoke-static { v$rendererRegister }, $SMART_CHANNEL_REBIND_HOOK
            move-result-object v$rendererRegister
            if-eqz v$rendererRegister, :afterBind
        """.trimIndent(),
        ExternalLabel("afterBind", next),
    )
    return true
}
