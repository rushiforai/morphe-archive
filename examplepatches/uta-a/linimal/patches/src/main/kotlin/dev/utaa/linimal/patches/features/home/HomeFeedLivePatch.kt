package dev.utaa.linimal.patches.features.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.INT
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.composeSkipReachesGroupEnd
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val COMPOSER = "Lj3/r;"
private const val COMPOSER_IMPL = "Lj3/d1;"
private const val END_RESTART_GROUP_RESULT = "Lj3/p3;"
private const val FEED_MODULE_STATE = "Lsg2/h;"
private const val HOME_FEED_LIVE_HOOK =
    "Ldev/utaa/linimal/extension/features/HomeFeedLiveHooks;->shouldSuppress()Z"

/**
 * ライブ配信の module の view data（wrapper）が `toString()` に残す marker。wrapper の唯一の instance field が
 * カードの内容型で、描画関数はその内容型を第 1 引数に取ります。
 */
internal const val HOME_FEED_LIVE_MARKER = "GcsHomeFeedLiveSingle(item="

/**
 * カードの描画関数の候補。内容型を第 1 引数に、module の状態と composer を受け取り、
 * `shouldExecute`（`A(IZ)Z`）を呼ぶ restartable composable です。
 */
private fun liveRendererFingerprint(itemType: String) = Fingerprint(
    returnType = VOID,
    custom = { method, _ -> isHomeFeedLiveRendererSignature(method, itemType) },
    filters = listOf(
        methodCall(
            definingClass = COMPOSER_IMPL,
            name = "A",
            parameters = listOf(INT, BOOLEAN),
            returnType = BOOLEAN,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/** `(item, sg2.h, ..., Composer, $$changed)` の並び。間の引数（既定値付きの状態など）の数は問いません。 */
internal fun isHomeFeedLiveRendererSignature(method: Method, itemType: String): Boolean {
    val parameters = method.parameterTypes.map { it.toString() }
    return AccessFlags.STATIC.isSet(method.accessFlags) &&
        parameters.size >= 4 &&
        parameters[0] == itemType &&
        parameters[1] == FEED_MODULE_STATE &&
        parameters[parameters.size - 2] == COMPOSER &&
        parameters.last() == INT
}

internal data class HomeFeedLiveGate(
    val branchIndex: Int,
    val shouldExecuteRegister: Int,
)

/**
 * `shouldExecute` → `move-result` → `if-eqz :skip` の並びと、`:skip` から同じ composer の
 * `skipToGroupEnd`（`l()`）→ `endRestartGroup`（`Z()`）へ一本道で進むことを検証します。
 *
 * <p>この composable は既定値付きの引数を持つため、本体側にも `l()` があり、skip 側の呼び出しは
 * `invoke-virtual/range` です。そのため `l()` の候補ごとに skip 経路を確かめ、ちょうど 1 件だけ成り立つものを使います。</p>
 */
internal fun homeFeedLiveGateShape(instructions: List<Instruction>, hasTryBlocks: Boolean): HomeFeedLiveGate? {
    if (hasTryBlocks) {
        return null
    }
    val shouldExecuteIndex = composerCalls(instructions, "A", BOOLEAN).singleOrNull() ?: return null
    val endIndex = composerCalls(instructions, "Z", END_RESTART_GROUP_RESULT).singleOrNull() ?: return null
    val resultMove = instructions.getOrNull(shouldExecuteIndex + 1) as? OneRegisterInstruction ?: return null
    val branchIndex = shouldExecuteIndex + 2
    val branch = instructions.getOrNull(branchIndex) as? OneRegisterInstruction ?: return null
    if (
        instructions[shouldExecuteIndex + 1].opcode != Opcode.MOVE_RESULT ||
        instructions[branchIndex].opcode != Opcode.IF_EQZ ||
        branch.registerA != resultMove.registerA ||
        // 抑制と復元に使う const/4 は 4bit register しか取れません。
        resultMove.registerA !in 0..15
    ) {
        return null
    }
    val skips = composerCalls(instructions, "l", VOID).filter { skipIndex ->
        skipIndex < endIndex &&
            composeSkipReachesGroupEnd(instructions, shouldExecuteIndex, branchIndex, skipIndex, endIndex)
    }
    if (skips.size != 1) {
        return null
    }
    return HomeFeedLiveGate(branchIndex, resultMove.registerA)
}

/** composer の呼び出し。skip 側は `invoke-virtual/range` で呼ばれるため、両方の形を数えます。 */
private fun composerCalls(instructions: List<Instruction>, name: String, returnType: String): List<Int> =
    instructions.indices.filter { index ->
        val instruction = instructions[index]
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        (instruction.opcode == Opcode.INVOKE_VIRTUAL || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
            reference?.definingClass == COMPOSER_IMPL &&
            reference.name == name &&
            reference.returnType == returnType
    }

/**
 * ホームのフィードにあるライブ配信のカード（公式アカウントの LINE MUSIC など）を、LINE 自身の skip 経路へ倒して描かせません。
 *
 * <p>`Composer.shouldExecute` の結果だけを書き換えます。抑制時に通るのは、再 composition で本体を省くときと同じ
 * `skipToGroupEnd` と `endRestartGroup` の経路です。設定 OFF・未初期化・例外時は元の結果をそのまま使います。
 * ライブ配信の取得・再生・計測は変更しません。</p>
 */
val homeFeedLivePatch = bytecodePatch(
    name = "Home feed live streams",
    description = "ホームのフィードにあるライブ配信のカードを、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に premiumSettingsRowPatch が続きます。
    dependsOn(homeFeedPostCardsPatch)

    execute {
        val wrappers = Fingerprint(strings = listOf(HOME_FEED_LIVE_MARKER)).matchAllOrNull().orEmpty()
            .map { it.originalClassDef }
            .distinctBy { it.type }
        val itemType = wrappers.singleOrNull()?.fields
            ?.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith("L") }
            ?.singleOrNull()
            ?.type
        if (itemType == null) {
            patchStatusCollector.record(homeFeedLiveUnappliedRecord(wrappers.size, "HomeFeedLivePayloadTypeNotUnique"))
            return@execute
        }

        val renderers = liveRendererFingerprint(itemType).matchAllOrNull().orEmpty()
        val renderer = renderers.singleOrNull()
        if (renderer == null) {
            patchStatusCollector.record(homeFeedLiveUnappliedRecord(renderers.size, "HomeFeedLiveRendererNotUnique"))
            return@execute
        }
        val implementation = renderer.method.implementation
        val gate = implementation?.let {
            homeFeedLiveGateShape(it.instructions.toList(), it.tryBlocks.isNotEmpty())
        }
        if (gate == null || !isSafeInjectionIndex(implementation, gate.branchIndex)) {
            patchStatusCollector.record(
                PatchStatusRecord(
                    patchId = PatchId.HOME_FEED_LIVE,
                    status = PatchStatus.ERROR,
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "HomeFeedLiveGateShapeMismatch",
                ),
            )
            return@execute
        }

        val register = gate.shouldExecuteRegister
        // 元の判定が false のときは hook を読まず、true のときだけ抑制するかを決めます。
        renderer.method.addInstructionsWithLabels(
            gate.branchIndex,
            """
                if-eqz v$register, :linimalLiveKeep
                invoke-static { }, $HOME_FEED_LIVE_HOOK
                move-result v$register
                if-eqz v$register, :linimalLiveRestore
                const/4 v$register, 0x0
                goto :linimalLiveKeep
                :linimalLiveRestore
                const/4 v$register, 0x1
                :linimalLiveKeep
                nop
            """.trimIndent(),
        )
        patchStatusCollector.record(
            patchId = PatchId.HOME_FEED_LIVE,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "HomeFeedLiveRendererGuarded",
        )
    }
}

/** 0 件は TARGET_NOT_FOUND、複数件は意図した 1 件に絞り込めていないため ERROR として残します。 */
internal fun homeFeedLiveUnappliedRecord(resolvedCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.HOME_FEED_LIVE,
    status = if (resolvedCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = 1,
    actualTargetCount = resolvedCount,
    reason = reason,
)
