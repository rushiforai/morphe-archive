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
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import dev.utaa.linimal.patches.features.theme.amoledThemeResourcePatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.unsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.composeSkipReachesGroupEnd

private const val DEBUG_METADATA = "Ldt8/f;"
private const val COMPOSER = "Lj3/r;"
private const val COMPOSER_IMPL = "Lj3/d1;"
private const val END_RESTART_GROUP_RESULT = "Lj3/p3;"
private const val FEED_MODULE_STATE = "Lsg2/h;"
private const val HOME_FEATURED_COLLECTIONS_HOOK =
    "Ldev/utaa/linimal/extension/features/HomeFeaturedCollectionsHooks;->shouldSuppress()Z"

/**
 * ホームの特集枠を描く Compose file。見出し 1 行と、カードごとにメニューを持つ 2 列の動画グリッドは
 * この file の composable が描いています。
 */
private const val FEATURED_GRID_SOURCE = "Home26FeedShortFormGridKt"
private const val FEATURED_GRID_SOURCE_FILE = "Home26FeedShortFormGrid.kt"

/** 特集枠の module renderer は 1 件だけです。解決できなければ一切注入しません。 */
internal const val HOME_FEATURED_COLLECTIONS_TARGET_COUNT = 1

/**
 * 特集枠 module の view state 型を最低 2 つ組み立てることを、renderer の必須条件にします。
 * 見出しを含む grid 全体の state と、カード 1 枚ごとの state の両方がここで作られます。
 */
internal const val FEATURED_GRID_STATE_TYPE_MINIMUM = 2

/**
 * 特集枠の grid を描く composable の package を、coroutine の DebugMetadata から導きます。
 * source metadata は R8 後も残るため、難読化された class 名を anchor にせずに済みます。
 */
private val featuredGridSourceMetadataFingerprint = Fingerprint(
    custom = { _, classDef ->
        classDef.annotations.any { annotation ->
            if (annotation.type != DEBUG_METADATA) {
                false
            } else {
                val declaringSource = annotation.elements.firstOrNull { it.name == "c" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value
                    ?.contains(FEATURED_GRID_SOURCE) == true
                val sourceFile = annotation.elements.firstOrNull { it.name == "f" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value == FEATURED_GRID_SOURCE_FILE
                declaringSource && sourceFile
            }
        }
    },
)

/**
 * ホームの特集枠を、LINE 自身の skip 経路へ倒して描かせません。
 *
 * <p>composable が本体を実行するかどうかを決める `Composer.shouldExecute` の結果だけを書き換えます。
 * 抑制時に通るのは、LINE が再 composition で本体を省くときと同じ `skipToGroupEnd` と
 * `endRestartGroup` の経路です。設定 OFF・未初期化・例外時は元の結果をそのまま使います。</p>
 */
val homeFeaturedCollectionsPatch = bytecodePatch(
    name = "Home featured collections",
    description = "ホームの特集枠にある動画のグリッドを、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に noOpProbePatch が続きます。
    dependsOn(amoledThemeResourcePatch)

    execute {
        val gridPackages = featuredGridSourceMetadataFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
            .let(::featuredGridPackagePrefixes)
        if (gridPackages.size != 1) {
            patchStatusCollector.record(
                homeFeaturedCollectionsUnappliedRecord(
                    gridPackages.size,
                    "HomeFeaturedGridSourcePackageNotUnique",
                ),
            )
            return@execute
        }
        val gridPackage = gridPackages.single()

        /**
         * 特集枠の module renderer。難読化された class / method 名ではなく、module renderer の
         * 引数の並び、grid state を組み立てていること、composer lifecycle の呼出しで絞り込みます。
         */
        val rendererFingerprint = Fingerprint(
            returnType = VOID,
            custom = { method, _ ->
                isFeaturedCollectionsRendererSignature(method) &&
                    featuredGridStateTypes(method, gridPackage).size >= FEATURED_GRID_STATE_TYPE_MINIMUM
            },
            filters = listOf(
                methodCall(
                    definingClass = COMPOSER_IMPL,
                    name = "A",
                    parameters = listOf("I", BOOLEAN),
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
        if (renderers.size != HOME_FEATURED_COLLECTIONS_TARGET_COUNT) {
            patchStatusCollector.record(
                homeFeaturedCollectionsUnappliedRecord(
                    renderers.size,
                    "HomeFeaturedCollectionsRendererNotUnique",
                ),
            )
            return@execute
        }

        val method = renderers.single().method
        val gate = homeFeaturedCollectionsGate(method)
        if (gate == null) {
            // cardinality は揃っていても注入位置の shape が崩れている場合は、何も変更しません。
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.HOME_FEATURED_COLLECTIONS,
                    expectedTargetCount = HOME_FEATURED_COLLECTIONS_TARGET_COUNT,
                    actualTargetCount = renderers.size,
                    reason = "HomeFeaturedCollectionsShapeMismatch",
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
                invoke-static { }, $HOME_FEATURED_COLLECTIONS_HOOK
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
            patchId = PatchId.HOME_FEATURED_COLLECTIONS,
            expectedTargetCount = HOME_FEATURED_COLLECTIONS_TARGET_COUNT,
            actualTargetCount = HOME_FEATURED_COLLECTIONS_TARGET_COUNT,
            reason = "HomeFeaturedCollectionsSuppressionGuarded",
        )
    }
}

/**
 * 対象を見つけられなかった場合の記録。0 件は TARGET_NOT_FOUND、複数見つかった場合は
 * 意図した 1 件に絞り込めていないため ERROR として raw match count を残します。
 */
internal fun homeFeaturedCollectionsUnappliedRecord(resolvedCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.HOME_FEATURED_COLLECTIONS,
    status = if (resolvedCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = HOME_FEATURED_COLLECTIONS_TARGET_COUNT,
    actualTargetCount = resolvedCount,
    reason = reason,
)

/** DebugMetadata が指す class の package。source file が 1 つに収まらなければ何も注入しません。 */
internal fun featuredGridPackagePrefixes(sourceTypes: Set<String>): Set<String> = sourceTypes
    .mapNotNull { type ->
        val separator = type.lastIndexOf('/')
        if (separator > 0) type.substring(0, separator + 1) else null
    }
    .toSet()

/**
 * module renderer の引数の並び。view data の型だけが module ごとに変わるため、その位置は
 * 型を問わず、feed module state・composer・changed flag の並びだけを検証します。
 */
internal fun isFeaturedCollectionsRendererSignature(method: Method): Boolean {
    val parameters = method.parameterTypes.map { it.toString() }
    return parameters.size == 4 &&
        parameters[0].startsWith("L") &&
        parameters[1] == FEED_MODULE_STATE &&
        parameters[2] == COMPOSER &&
        parameters[3] == "I"
}

/** renderer が組み立てる、特集枠 grid の composable と同じ package の view state 型。 */
internal fun featuredGridStateTypes(method: Method, gridPackage: String): Set<String> =
    method.implementation?.instructions?.toList().orEmpty()
        .filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }
        .filter { it.startsWith(gridPackage) }
        .toSet()

internal data class HomeFeaturedCollectionsGate(
    val branchIndex: Int,
    val shouldExecuteRegister: Int,
)

private fun homeFeaturedCollectionsGate(method: Method): HomeFeaturedCollectionsGate? {
    val implementation = method.implementation ?: return null
    return homeFeaturedCollectionsGateShape(
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
internal fun homeFeaturedCollectionsGateShape(
    instructions: List<Instruction>,
    hasTryBlocks: Boolean,
): HomeFeaturedCollectionsGate? {
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

    // false 側が同じ composer の skipToGroupEnd → endRestartGroup へ一本道で進む形だけを受け入れます。
    if (
        !composeSkipReachesGroupEnd(
            instructions,
            shouldExecuteIndex,
            branchIndex,
            skipIndex = composerCallIndices(instructions, "l", VOID).single(),
            endIndex = composerCallIndices(instructions, "Z", END_RESTART_GROUP_RESULT).single(),
        )
    ) {
        return null
    }

    if (isDivertedInjectionIndex(instructions, branchIndex)) {
        return null
    }
    return HomeFeaturedCollectionsGate(branchIndex, resultMove.registerA)
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
