package dev.utaa.linimal.patches.features.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.unsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.INT
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val DEBUG_METADATA = "Ldt8/f;"
private const val COMPOSER = "Lj3/r;"
private const val COMPOSER_IMPL = "Lj3/d1;"
private const val END_RESTART_GROUP_RESULT = "Lj3/p3;"
private const val HOME_RECENT_HISTORY_HOOK =
    "Ldev/utaa/linimal/extension/features/HomeRecentHistoryHooks;->shouldSuppress()Z"

/**
 * ホーム上部に横並びで出る activity card を描く Compose file。「最近の履歴」も「サービス」も
 * この file の composable が 1 枚ずつ描いています。
 */
private const val ACTIVITY_CARD_SOURCE = "ActivityCardContentsKt"
private const val ACTIVITY_CARD_SOURCE_FILE = "ActivityCardContents.kt"

/**
 * 「最近の履歴」card の内容を表す data class が `toString()` に必ず残す marker。
 *
 * <p>card の種別（天気・スタンプ・誕生日・固定サービスなど）は同じ sealed 型の subclass で表され、
 * 型名は難読化されます。data class の `toString()` に残るこの marker だけが、「最近の履歴」を
 * 「サービス」（`FixedService`）から区別できる非難読化の手掛かりです。</p>
 */
internal const val RECENTLY_USED_SERVICE_MARKER = "RecentlyUsedService(id="

/**
 * 26.16.0 では GlobalHome の別 model も同じ `RecentlyUsedService(id=` を `toString()` に持ちます。
 * Home26 の model だけが持つ field 名を併せて確認し、GlobalHome 側の model を対象から外します。
 */
internal const val RECENTLY_USED_SERVICE_CONFIG_MARKER = ", config="

/** 「最近の履歴」card の renderer は 1 件だけです。解決できなければ一切注入しません。 */
internal const val HOME_RECENT_HISTORY_TARGET_COUNT = 1

/**
 * card renderer の引数の最小数。`(card, ..., Composer, $$changed)` の 3 つは version が変わっても
 * 並びが変わらないため、その間に挟まる引数の数は問いません。
 */
internal const val RECENT_HISTORY_CARD_MINIMUM_PARAMETER_COUNT = 3

/**
 * activity card を描く composable の package を、coroutine の DebugMetadata から導きます。
 * source metadata は R8 後も残るため、難読化された class 名を anchor にせずに済みます。
 */
private val activityCardSourceMetadataFingerprint = Fingerprint(
    custom = { _, classDef ->
        classDef.annotations.any { annotation ->
            if (annotation.type != DEBUG_METADATA) {
                false
            } else {
                val declaringSource = annotation.elements.firstOrNull { it.name == "c" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value
                    ?.contains(ACTIVITY_CARD_SOURCE) == true
                val sourceFile = annotation.elements.firstOrNull { it.name == "f" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value == ACTIVITY_CARD_SOURCE_FILE
                declaringSource && sourceFile
            }
        }
    },
)

/** 「最近の履歴」card の内容を表す data class。`toString()` の marker だけを anchor にします。 */
private val recentlyUsedServiceCardFingerprint = Fingerprint(
    strings = listOf(RECENTLY_USED_SERVICE_MARKER, RECENTLY_USED_SERVICE_CONFIG_MARKER),
)

/**
 * ホーム上部の「最近の履歴」card を、LINE 自身の skip 経路へ倒して描かせません。
 *
 * <h2>対象の特定</h2>
 * <p>まず activity card を描く composable の package を DebugMetadata から求めます。次に
 * `RecentlyUsedService(id=` という非難読化の `toString()` marker から「最近の履歴」card の
 * 内容型を求め、その型を第 1 引数に取る composable を先の package から 1 件だけ選びます。
 * 隣に並ぶ「サービス」card は別の内容型（`FixedService`）を取る別の composable のため、
 * この絞り込みには入りません。</p>
 *
 * <h2>抑制の方法</h2>
 * <p>composable が本体を実行するかどうかを決める `Composer.shouldExecute` の結果だけを書き換えます。
 * 抑制時に通るのは、LINE が再 composition で本体を省くときと同じ `skipToGroupEnd` と
 * `endRestartGroup` の経路です。設定 OFF・未初期化・例外時は元の結果をそのまま使います。</p>
 */
val homeRecentHistoryPatch = bytecodePatch(
    name = "ホームの最近の履歴",
    description = "ホーム上部にある最近使用したサービスの枠を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に homeFeedLoadingIndicatorPatch が続きます。
    dependsOn(homeFeaturedCollectionsPatch)

    execute {
        val activityCardPackages = activityCardSourceMetadataFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
            .let(::activityCardPackagePrefixes)
        if (activityCardPackages.size != 1) {
            patchStatusCollector.record(
                homeRecentHistoryUnappliedRecord(
                    activityCardPackages.size,
                    "HomeRecentHistorySourcePackageNotUnique",
                ),
            )
            return@execute
        }
        val activityCardPackage = activityCardPackages.single()

        val cardContentTypes = recentlyUsedServiceCardFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        if (cardContentTypes.size != HOME_RECENT_HISTORY_TARGET_COUNT) {
            patchStatusCollector.record(
                homeRecentHistoryUnappliedRecord(
                    cardContentTypes.size,
                    "HomeRecentHistoryCardContentTypeNotUnique",
                ),
            )
            return@execute
        }
        val cardContentType = cardContentTypes.single()

        /**
         * 「最近の履歴」card の renderer。難読化された class / method 名ではなく、card の内容型を
         * 第 1 引数に取ること、composer lifecycle の呼出し、そして activity card の package で
         * 絞り込みます。
         */
        val rendererFingerprint = Fingerprint(
            returnType = VOID,
            custom = { method, classDef ->
                classDef.type.startsWith(activityCardPackage) &&
                    isRecentHistoryCardRendererSignature(method, cardContentType)
            },
            filters = listOf(
                methodCall(
                    definingClass = COMPOSER_IMPL,
                    name = "A",
                    parameters = listOf(INT, BOOLEAN),
                    returnType = BOOLEAN,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                methodCall(
                    definingClass = COMPOSER_IMPL,
                    name = "l",
                    parameters = emptyList(),
                    returnType = VOID,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
                methodCall(
                    definingClass = COMPOSER_IMPL,
                    name = "Z",
                    parameters = emptyList(),
                    returnType = END_RESTART_GROUP_RESULT,
                    opcode = Opcode.INVOKE_VIRTUAL,
                ),
            ),
        )
        val renderers = rendererFingerprint.matchAllOrNull().orEmpty()
        if (renderers.size != HOME_RECENT_HISTORY_TARGET_COUNT) {
            patchStatusCollector.record(
                homeRecentHistoryUnappliedRecord(renderers.size, "HomeRecentHistoryRendererNotUnique"),
            )
            return@execute
        }

        val method = renderers.single().method
        val gate = homeRecentHistoryGate(method)
        if (gate == null) {
            // cardinality は揃っていても注入位置の shape が崩れている場合は、何も変更しません。
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.HOME_RECENT_HISTORY,
                    expectedTargetCount = HOME_RECENT_HISTORY_TARGET_COUNT,
                    actualTargetCount = renderers.size,
                    reason = "HomeRecentHistoryShapeMismatch",
                ),
            )
            return@execute
        }

        // 元の結果が false のときは何もしません。true のときだけ hook を読み、
        // 抑制時は 0、非抑制時は shouldExecute が返すのと同じ 1 に戻します。
        method.addInstructionsWithLabels(
            gate.branchIndex,
            """
                if-eqz v${gate.shouldExecuteRegister}, :linimalKeep
                invoke-static { }, $HOME_RECENT_HISTORY_HOOK
                move-result v${gate.shouldExecuteRegister}
                if-eqz v${gate.shouldExecuteRegister}, :linimalRestore
                const/4 v${gate.shouldExecuteRegister}, 0x0
                goto :linimalKeep
                :linimalRestore
                const/4 v${gate.shouldExecuteRegister}, 0x1
                :linimalKeep
                nop
            """.trimIndent(),
        )

        patchStatusCollector.record(
            patchId = PatchId.HOME_RECENT_HISTORY,
            expectedTargetCount = HOME_RECENT_HISTORY_TARGET_COUNT,
            actualTargetCount = HOME_RECENT_HISTORY_TARGET_COUNT,
            reason = "HomeRecentHistorySuppressionGuarded",
        )
    }
}

/**
 * 対象を見つけられなかった場合の記録。0 件は TARGET_NOT_FOUND、複数見つかった場合は
 * 意図した 1 件に絞り込めていないため ERROR として raw match count を残します。
 */
internal fun homeRecentHistoryUnappliedRecord(resolvedCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.HOME_RECENT_HISTORY,
    status = if (resolvedCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = HOME_RECENT_HISTORY_TARGET_COUNT,
    actualTargetCount = resolvedCount,
    reason = reason,
)

/** DebugMetadata が指す class の package。source file が 1 つに収まらなければ何も注入しません。 */
internal fun activityCardPackagePrefixes(sourceTypes: Set<String>): Set<String> = sourceTypes
    .mapNotNull { type ->
        val separator = type.lastIndexOf('/')
        if (separator > 0) type.substring(0, separator + 1) else null
    }
    .toSet()

/**
 * card renderer の引数の並び。card ごとに中間の引数（表示位置・log 情報・callback）が変わるため、
 * 先頭の内容型と末尾の composer・`$$changed` の位置だけを検証します。
 */
internal fun isRecentHistoryCardRendererSignature(method: Method, cardContentType: String): Boolean {
    val parameters = method.parameterTypes.map { it.toString() }
    return parameters.size >= RECENT_HISTORY_CARD_MINIMUM_PARAMETER_COUNT &&
        parameters.first() == cardContentType &&
        parameters[parameters.size - 2] == COMPOSER &&
        parameters.last() == INT
}

internal data class HomeRecentHistoryGate(
    val branchIndex: Int,
    val shouldExecuteRegister: Int,
)

private fun homeRecentHistoryGate(method: Method): HomeRecentHistoryGate? {
    val implementation = method.implementation ?: return null
    return homeRecentHistoryGateShape(
        instructions = implementation.instructions.toList(),
        hasTryBlocks = implementation.tryBlocks.isNotEmpty(),
    )
}

/**
 * `shouldExecute` → `move-result` → `if-eqz` の並びを検証します。
 *
 * <p>`shouldExecute` の戻り値は `Z` なので元の値は 0 か 1 に限られ、注入後に 1 へ戻しても
 * 情報は失われません。分岐先が `if-eqz` と一致する場合は注入が飛び越される可能性があるため、
 * その shape は意図的に拒否します。</p>
 */
internal fun homeRecentHistoryGateShape(
    instructions: List<Instruction>,
    hasTryBlocks: Boolean,
): HomeRecentHistoryGate? {
    if (hasTryBlocks) {
        return null
    }
    if (composerCallIndices(instructions, "l", VOID).size != 1) {
        return null
    }
    if (composerCallIndices(instructions, "Z", END_RESTART_GROUP_RESULT).size != 1) {
        return null
    }

    val shouldExecuteIndex = composerCallIndices(instructions, "A", BOOLEAN).singleOrNull() ?: return null
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

    if (isDivertedInjectionIndex(instructions, branchIndex)) {
        return null
    }
    return HomeRecentHistoryGate(branchIndex, resultMove.registerA)
}

private fun composerCallIndices(
    instructions: List<Instruction>,
    name: String,
    returnType: String,
): List<Int> = instructions.indices.filter { index ->
    val instruction = instructions[index]
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) {
        false
    } else {
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == COMPOSER_IMPL &&
            reference.name == name &&
            reference.returnType == returnType
    }
}
