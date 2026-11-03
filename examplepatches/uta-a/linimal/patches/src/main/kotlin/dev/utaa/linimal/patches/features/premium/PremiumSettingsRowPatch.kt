package dev.utaa.linimal.patches.features.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.features.home.homeFeedPostCardsPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.unsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.BOXED_BOOLEAN
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.boxedBooleanReturnGateShape

private const val PREMIUM_SETTINGS_ITEM_LAYOUT = 0x7f0e0546 // line_user_settings_premium_item
private const val LYP_PREMIUM_TITLE = 0x7f151fd3 // line_settings_category_lyppfornonsubscriber
private const val LINE_PREMIUM_TITLE = 0x7f151fd2 // line_settings_category_linepfornonsubscriber
private const val PREMIUM_SETTINGS_ROW_HOOK =
    "Ldev/utaa/linimal/extension/features/PremiumSettingsRowHooks;->adjustVisibility(Z)Z"
private const val BOOLEAN_UNBOX = "$BOXED_BOOLEAN->booleanValue()$BOOLEAN"
private const val BOOLEAN_BOX = "$BOXED_BOOLEAN->valueOf($BOOLEAN)$BOXED_BOOLEAN"

private val premiumItemConstructorParameters = listOf(
    "Ljava/lang/String;",
    "I",
    "Ljava/lang/Integer;",
    "Ljava/lang/Integer;",
    "I",
    "I",
    "Lnt8/p;",
    "Lnt8/l;",
    "Lec5/g1\$b;",
    "Lnt8/p;",
    "Lnt8/p;",
)

/**
 * Premium item model は layout resource と constructor signature で特定します。ここで得た type だけを
 * 次の catalog fingerprint に渡すため、難読化された model class 名を固定条件にしません。
 */
private val premiumSettingsItemModelFingerprint = Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = premiumItemConstructorParameters,
    filters = listOf(literal(PREMIUM_SETTINGS_ITEM_LAYOUT)),
)

/** Main Settings catalog は2種の Premium title resource と導出済み item constructor で特定します。 */
private fun premiumSettingsCatalogFingerprint(premiumItemType: String) = Fingerprint(
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    filters = listOf(
        literal(LYP_PREMIUM_TITLE),
        literal(LINE_PREMIUM_TITLE),
        methodCall(
            definingClass = premiumItemType,
            name = "<init>",
            parameters = premiumItemConstructorParameters,
            returnType = "V",
            opcode = Opcode.INVOKE_DIRECT_RANGE,
        ),
    ),
)

/**
 * 導出済み Premium item construction の最終引数は、行を list に採用する asynchronous visibility
 * predicate です。catalog から導出した class type に限定し、元の product 判定は先に実行させます。
 */
private fun premiumSettingsVisibilityPredicateFingerprint(predicateType: String) = Fingerprint(
    definingClass = predicateType,
    name = "invokeSuspend",
    returnType = OBJECT,
    parameters = listOf(OBJECT),
    filters = listOf(
        methodCall(
            definingClass = BOXED_BOOLEAN,
            name = "valueOf",
            parameters = listOf(BOOLEAN),
            returnType = BOXED_BOOLEAN,
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
)

/**
 * LYP Premium / LINE Premium の地域 variant を、対応する item construction の title resource と
 * 最終 visibility predicate 引数から解決します。両方を解決できない場合は一切注入しません。
 */
val premiumSettingsRowPatch = bytecodePatch(
    name = "設定の Premium",
    description = "LINE の設定画面にある LINE Premium の行を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch が末端で noOpProbePatch に接続されます。
    dependsOn(homeFeedPostCardsPatch)

    execute {
        val itemModelMatches = premiumSettingsItemModelFingerprint.matchAllOrNull().orEmpty()
        if (itemModelMatches.size != 1) {
            patchStatusCollector.record(
                premiumSettingsRowUnappliedRecord(0, "PremiumSettingsItemModelNotUnique"),
            )
            return@execute
        }
        val premiumItemType = itemModelMatches.single().originalClassDef.type

        val catalogMatches = premiumSettingsCatalogFingerprint(premiumItemType).matchAllOrNull().orEmpty()
        if (catalogMatches.size != 1) {
            patchStatusCollector.record(
                premiumSettingsRowUnappliedRecord(0, "PremiumSettingsCatalogNotUnique"),
            )
            return@execute
        }

        val variants = resolvePremiumSettingsVariants(catalogMatches.single(), premiumItemType)
        if (variants == null) {
            patchStatusCollector.record(
                premiumSettingsRowUnappliedRecord(0, "PremiumSettingsVariantsUnresolved"),
            )
            return@execute
        }
        val predicateTypes = variants.map { it.visibilityPredicateType }
        if (predicateTypes.toSet().size != PREMIUM_SETTINGS_ROW_TARGET_COUNT) {
            patchStatusCollector.record(
                premiumSettingsRowUnappliedRecord(
                    predicateTypes.toSet().size,
                    "PremiumSettingsPredicateNotDistinct",
                ),
            )
            return@execute
        }

        val predicateMatches = predicateTypes.map { predicateType ->
            premiumSettingsVisibilityPredicateFingerprint(predicateType).matchAllOrNull().orEmpty()
        }
        if (predicateMatches.any { it.size != 1 }) {
            patchStatusCollector.record(
                premiumSettingsRowUnappliedRecord(
                    predicateMatches.count { it.size == 1 },
                    "PremiumSettingsPredicateNotUnique",
                ),
            )
            return@execute
        }

        val gates = predicateMatches.flatten().map(::premiumSettingsVisibilityGate)
        if (gates.any { it == null }) {
            // cardinality は揃っていても注入位置の shape が崩れている場合は、片方も変更せず ERROR を残します。
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.PREMIUM_SETTINGS_ROW,
                    expectedTargetCount = PREMIUM_SETTINGS_ROW_TARGET_COUNT,
                    actualTargetCount = PREMIUM_SETTINGS_ROW_TARGET_COUNT,
                    reason = "PremiumSettingsGateShapeMismatch",
                ),
            )
            return@execute
        }

        // 全 variant の injection plan を検証してから変更するため、片方だけが消えることはありません。
        gates.filterNotNull().forEach { gate ->
            gate.match.method.addInstructions(
                gate.insertionIndex,
                """
                    invoke-virtual { v${gate.booleanRegister} }, $BOOLEAN_UNBOX
                    move-result v${gate.booleanRegister}
                    invoke-static { v${gate.booleanRegister} }, $PREMIUM_SETTINGS_ROW_HOOK
                    move-result v${gate.booleanRegister}
                    invoke-static { v${gate.booleanRegister} }, $BOOLEAN_BOX
                    move-result-object v${gate.booleanRegister}
                """.trimIndent(),
            )
        }

        patchStatusCollector.record(
            patchId = PatchId.PREMIUM_SETTINGS_ROW,
            expectedTargetCount = PREMIUM_SETTINGS_ROW_TARGET_COUNT,
            actualTargetCount = PREMIUM_SETTINGS_ROW_TARGET_COUNT,
            reason = "PremiumSettingsRowVisibilityAdjusted",
        )
    }
}

internal const val PREMIUM_SETTINGS_ROW_TARGET_COUNT = 2

/**
 * 注入まで到達できなかった場合の記録。resolvedTargetCount は「安全に解決できた variant 数」で、
 * 0 件は TARGET_NOT_FOUND、1 件は PARTIAL、期待数に達したのに注入できない場合は ERROR です。
 */
internal fun premiumSettingsRowUnappliedRecord(
    resolvedTargetCount: Int,
    reason: String,
): PatchStatusRecord = PatchStatusRecord(
    patchId = PatchId.PREMIUM_SETTINGS_ROW,
    status = when {
        resolvedTargetCount == 0 -> PatchStatus.TARGET_NOT_FOUND
        resolvedTargetCount < PREMIUM_SETTINGS_ROW_TARGET_COUNT -> PatchStatus.PARTIAL
        else -> PatchStatus.ERROR
    },
    expectedTargetCount = PREMIUM_SETTINGS_ROW_TARGET_COUNT,
    actualTargetCount = resolvedTargetCount,
    reason = reason,
)

private data class PremiumSettingsVariant(
    val titleResource: Int,
    val visibilityPredicateType: String,
)

private data class PremiumSettingsVisibilityGate(
    val match: Match,
    val insertionIndex: Int,
    val booleanRegister: Int,
)

/** Candidate item constructions are associated by title and the predicate passed as their final argument. */
private fun resolvePremiumSettingsVariants(
    catalogMatch: Match,
    premiumItemType: String,
): List<PremiumSettingsVariant>? {
    val instructions = catalogMatch.method.implementation?.instructions?.toList() ?: return null
    val constructorIndices = instructions.mapIndexedNotNull { index, instruction ->
        index.takeIf { isPremiumItemConstructor(instruction, premiumItemType) }
    }

    val variants = constructorIndices.mapNotNull { constructorIndex ->
        val itemStart = (constructorIndex - 1 downTo 0).firstOrNull { index ->
            newInstanceType(instructions[index]) == premiumItemType
        } ?: return@mapNotNull null
        val titleResources = instructions.subList(itemStart, constructorIndex + 1)
            .mapNotNull { instruction ->
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral
                    ?.takeIf { it == LYP_PREMIUM_TITLE || it == LINE_PREMIUM_TITLE }
            }
            .distinct()
        val predicateType = finalVisibilityPredicateType(
            instructions,
            itemStart,
            constructorIndex,
            premiumItemType,
        ) ?: return@mapNotNull null

        if (titleResources.size != 1) {
            return@mapNotNull null
        }
        PremiumSettingsVariant(titleResources.single(), predicateType)
    }

    return variants.takeIf { resolved ->
        resolved.size == PREMIUM_SETTINGS_ROW_TARGET_COUNT &&
            resolved.map { it.titleResource }.toSet() == setOf(LYP_PREMIUM_TITLE, LINE_PREMIUM_TITLE)
    }
}

/** Reads the final item constructor argument back to its local lambda allocation. */
private fun finalVisibilityPredicateType(
    instructions: List<Instruction>,
    itemStart: Int,
    constructorIndex: Int,
    premiumItemType: String,
): String? {
    val constructor = instructions.getOrNull(constructorIndex) as? RegisterRangeInstruction ?: return null
    if (constructor.registerCount != premiumItemConstructorParameters.size + 1) {
        return null
    }
    val finalArgumentRegister = constructor.startRegister + constructor.registerCount - 1
    val finalArgumentCopyIndex = (constructorIndex - 1 downTo itemStart).firstOrNull { index ->
        (instructions[index] as? OneRegisterInstruction)?.registerA == finalArgumentRegister
    } ?: return null
    val finalArgumentCopy = instructions[finalArgumentCopyIndex] as? TwoRegisterInstruction ?: return null
    if (finalArgumentCopy.opcode !in OBJECT_MOVE_OPCODES) {
        return null
    }

    val predicateAllocation = (finalArgumentCopyIndex - 1 downTo itemStart).firstOrNull { index ->
        val allocation = instructions[index] as? OneRegisterInstruction
        allocation?.opcode == Opcode.NEW_INSTANCE && allocation.registerA == finalArgumentCopy.registerB
    } ?: return null
    return newInstanceType(instructions[predicateAllocation])?.takeIf { it != premiumItemType }
}

private val OBJECT_MOVE_OPCODES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

private fun isPremiumItemConstructor(instruction: Instruction, premiumItemType: String): Boolean {
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
        reference.definingClass == premiumItemType &&
        reference.name == "<init>" &&
        reference.parameterTypes == premiumItemConstructorParameters &&
        reference.returnType == "V"
}

private fun newInstanceType(instruction: Instruction): String? {
    val reference = (instruction as? ReferenceInstruction)?.reference as? TypeReference ?: return null
    return reference.type.takeIf { instruction.opcode == Opcode.NEW_INSTANCE }
}

/** The hook must be placed at the single boxed return, after every original visibility branch has converged. */
private fun premiumSettingsVisibilityGate(match: Match): PremiumSettingsVisibilityGate? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val shape = boxedBooleanReturnGateShape(
        instructions = implementation.instructions.toList(),
        parameterTypes = method.parameterTypes.map { it.toString() },
        registerCount = implementation.registerCount,
        hasTryBlocks = implementation.tryBlocks.isNotEmpty(),
    ) ?: return null
    return PremiumSettingsVisibilityGate(match, shape.insertionIndex, shape.booleanRegister)
}

