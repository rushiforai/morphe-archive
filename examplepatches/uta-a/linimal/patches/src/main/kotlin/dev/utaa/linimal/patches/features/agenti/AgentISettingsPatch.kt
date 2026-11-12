package dev.utaa.linimal.patches.features.agenti

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.BOXED_BOOLEAN
import dev.utaa.linimal.patches.util.boxedBooleanReturnGateShape

private const val SETTINGS_AGENT_I_TITLE = 0x7f152018
private const val SETTINGS_LINE_AI_SERVICES_TITLE = 0x7f15201b
private const val SETTINGS_ITEM = "Lec5/b0;"
private const val SETTINGS_TARGET = "Lac5/s0;"
private const val SETTINGS_TARGET_LINE_AI_SERVICE = "TARGET_LINE_AI_SERVICE"
private const val DEBUG_METADATA = "Ldt8/f;"
private const val MAIN_SETTINGS_CATEGORY_SOURCE = "LineUserMainSettingsCategory.kt"
private const val SETTINGS_HOOK =
    "Ldev/utaa/linimal/extension/features/agenti/AgentISettingsHooks;->adjustVisibility(Z)Z"
private const val BOOLEAN_UNBOX = "$BOXED_BOOLEAN->booleanValue()$BOOLEAN"
private const val BOOLEAN_BOX = "$BOXED_BOOLEAN->valueOf($BOOLEAN)$BOXED_BOOLEAN"

/**
 * Main Settings static catalog の 2 variant entry。title resource と catalog item constructor を合わせ、
 * owner の難読化名は識別条件にしません。
 */
private val settingsCatalogFingerprint = Fingerprint(
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    filters = listOf(
        literal(SETTINGS_AGENT_I_TITLE),
        literal(SETTINGS_LINE_AI_SERVICES_TITLE),
        methodCall(
            definingClass = SETTINGS_ITEM,
            name = "<init>",
            returnType = "V",
            opcode = Opcode.INVOKE_DIRECT_RANGE,
        ),
    ),
)

/** Both catalog click actions share the stable TARGET_LINE_AI_SERVICE telemetry target. */
private val settingsAgentActionFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(
            definingClass = SETTINGS_TARGET,
            name = SETTINGS_TARGET_LINE_AI_SERVICE,
            type = SETTINGS_TARGET,
            opcode = Opcode.SGET_OBJECT,
        ),
        methodCall(
            definingClass = "Lcom/linecorp/line/settings/main/LineUserMainSettingsFragment;",
            name = "m4",
            parameters = listOf("Lti8/c;"),
            returnType = "V",
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
    custom = { _, classDef -> classDef.interfaces.contains("Lnt8/l;") },
)

/**
 * The two async predicates execute normal product visibility logic first. Debug metadata confirms they are
 * source-generated predicate continuations, then the catalog association below selects only the two entries.
 */
private val settingsVisibilityPredicateFingerprint = Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(
            definingClass = "Lao0/f;",
            name = "isEnabled",
            returnType = "Z",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
        methodCall(
            definingClass = "Lfo0/s;",
            name = "a",
            parameters = listOf("Lya5/t2;"),
            returnType = "Z",
            opcode = Opcode.INVOKE_STATIC,
        ),
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "valueOf",
            parameters = listOf("Z"),
            returnType = "Ljava/lang/Boolean;",
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
    custom = { _, classDef -> isMainSettingsCategoryContinuation(classDef) },
)

/**
 * Main Settings static catalog から Agent i / LINE AI Services の両 visible predicate を導出し、
 * each predicate's boxed result at the single return site を runtime setting で調整します。
 * Navigator, destination, remote predicate sources, and subscription state still execute unchanged.
 */
val agentISettingsPatch = bytecodePatch(
    name = "Agent i in settings",
    description = "LINE の設定画面にある Agent i と LINE AI Services の入口を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(agentIWalletHeaderPatch)

    execute {
        val catalogMatches = settingsCatalogFingerprint.matchAllOrNull().orEmpty()
        if (catalogMatches.size != 1) {
            recordSettingsUnapplied(catalogMatches.size, "AgentISettingsCatalogNotUnique")
            return@execute
        }

        val actionMatches = settingsAgentActionFingerprint.matchAllOrNull().orEmpty()
        if (actionMatches.size != 2) {
            recordSettingsUnapplied(actionMatches.size, "AgentISettingsActionsNotResolved")
            return@execute
        }

        val predicateMatches = settingsVisibilityPredicateFingerprint.matchAllOrNull().orEmpty()
        if (predicateMatches.isEmpty()) {
            recordSettingsUnapplied(0, "AgentISettingsPredicatesNotResolved")
            return@execute
        }

        val variants = resolveSettingsVariants(
            catalogMatches.single(),
            actionMatches,
            predicateMatches,
        )
        if (variants == null || variants.size != 2) {
            patchStatusCollector.record(
                agentISettingsShapeMismatchRecord(
                    rawPredicateCount = predicateMatches.size,
                    reason = "AgentISettingsCatalogShapeMismatch",
                ),
            )
            return@execute
        }

        val predicateTargets = variants.map { it.predicateMatch }
        if (predicateTargets.distinctBy { it.originalClassDef.type }.size != 2) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.AGENT_I_SETTINGS),
                expectedTargetCount = 2,
                actualTargetCount = predicateTargets.distinctBy { it.originalClassDef.type }.size,
                reason = "AgentISettingsPredicateVariantMismatch",
            )
            return@execute
        }

        // Build every injection plan before changing either variant; a malformed one leaves both untouched.
        val gates = predicateTargets.map(::visibilityGate)
        if (gates.any { it == null }) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.AGENT_I_SETTINGS),
                expectedTargetCount = 2,
                actualTargetCount = predicateTargets.size,
                reason = "AgentISettingsPredicateShapeMismatch",
            )
            return@execute
        }

        // 分岐合流点である boxing 命令の手前ではなく、単一の return 直前で box 済みの値を通します。
        gates.filterNotNull().forEach { gate ->
            gate.match.method.addInstructions(
                gate.insertionIndex,
                """
                    invoke-virtual { v${gate.booleanRegister} }, $BOOLEAN_UNBOX
                    move-result v${gate.booleanRegister}
                    invoke-static/range { v${gate.booleanRegister} .. v${gate.booleanRegister} }, $SETTINGS_HOOK
                    move-result v${gate.booleanRegister}
                    invoke-static/range { v${gate.booleanRegister} .. v${gate.booleanRegister} }, $BOOLEAN_BOX
                    move-result-object v${gate.booleanRegister}
                """.trimIndent(),
            )
        }
        patchStatusCollector.record(
            patchId = PatchId.AGENT_I_SETTINGS,
            expectedTargetCount = 2,
            actualTargetCount = 2,
            reason = "AgentISettingsVariantPredicatesAdjusted",
        )
    }
}

private data class SettingsVariant(
    val titleResource: Int,
    val actionType: String,
    val predicateMatch: Match,
)

private data class VisibilityGate(
    val match: Match,
    val insertionIndex: Int,
    val booleanRegister: Int,
)

/** Associates each title-bearing item construction segment with one action and one generated predicate. */
private fun resolveSettingsVariants(
    catalogMatch: Match,
    actionMatches: List<Match>,
    predicateMatches: List<Match>,
): List<SettingsVariant>? {
    val instructions = catalogMatch.method.implementation?.instructions?.toList() ?: return null
    val actionTypes = actionMatches.map { it.originalClassDef.type }.toSet()
    val predicatesByType = predicateMatches.groupBy { it.originalClassDef.type }
    val itemConstructorIndices = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        index.takeIf {
            instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
                reference?.definingClass == SETTINGS_ITEM &&
                reference.name == "<init>" &&
                reference.returnType == "V"
        }
    }

    val variants = itemConstructorIndices.mapNotNull { constructorIndex ->
        val itemStart = (constructorIndex - 1 downTo 0).firstOrNull { index ->
            instructions[index].opcode == Opcode.NEW_INSTANCE &&
                ((instructions[index] as? ReferenceInstruction)?.reference as? TypeReference)?.type == SETTINGS_ITEM
        } ?: return@mapNotNull null
        val segment = instructions.subList(itemStart, constructorIndex + 1)
        val titles = segment.mapNotNull { instruction ->
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral
                ?.takeIf { it == SETTINGS_AGENT_I_TITLE || it == SETTINGS_LINE_AI_SERVICES_TITLE }
        }.distinct()
        val createdTypes = segment.mapNotNull { instruction ->
            if (instruction.opcode != Opcode.NEW_INSTANCE) {
                null
            } else {
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
            }
        }.toSet()
        val actions = createdTypes.intersect(actionTypes)
        val predicates = createdTypes.intersect(predicatesByType.keys)

        if (titles.size != 1 || actions.size != 1 || predicates.size != 1) {
            return@mapNotNull null
        }
        val predicateMatch = predicatesByType.getValue(predicates.single()).singleOrNull() ?: return@mapNotNull null
        SettingsVariant(titles.single(), actions.single(), predicateMatch)
    }.filter { variant ->
        variant.titleResource == SETTINGS_AGENT_I_TITLE || variant.titleResource == SETTINGS_LINE_AI_SERVICES_TITLE
    }

    return variants.takeIf { resolved ->
        resolved.size == 2 &&
            resolved.map { it.titleResource }.toSet() == setOf(
                SETTINGS_AGENT_I_TITLE,
                SETTINGS_LINE_AI_SERVICES_TITLE,
            ) &&
            resolved.map { it.actionType }.toSet() == actionTypes &&
            resolved.map { it.predicateMatch.originalClassDef.type }.toSet().size == 2
    }
}

/** The hook is inserted after original remote/product visibility evaluation, at the predicate's single return site. */
private fun visibilityGate(match: Match): VisibilityGate? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val shape = boxedBooleanReturnGateShape(
        instructions = implementation.instructions.toList(),
        parameterTypes = method.parameterTypes.map { it.toString() },
        registerCount = implementation.registerCount,
        hasTryBlocks = implementation.tryBlocks.isNotEmpty(),
    ) ?: return null
    return VisibilityGate(match, shape.insertionIndex, shape.booleanRegister)
}

private fun isMainSettingsCategoryContinuation(classDef: ClassDef): Boolean = classDef.annotations.any { annotation ->
    annotation.type == DEBUG_METADATA &&
        (annotation.elements.firstOrNull { it.name == "f" }?.value as? StringEncodedValue)?.value ==
            MAIN_SETTINGS_CATEGORY_SOURCE
}

private fun recordSettingsUnapplied(matchCount: Int, reason: String) {
    patchStatusCollector.record(agentISettingsUnappliedRecord(matchCount, reason))
}

/**
 * Catalog association failed after predicate anchors were found. Keep the raw non-zero candidate count so the
 * runtime parser can distinguish an unsafe shape from a target that did not exist at all.
 */
internal fun agentISettingsShapeMismatchRecord(
    rawPredicateCount: Int,
    reason: String,
): PatchStatusRecord {
    require(rawPredicateCount > 0) { "shape mismatch requires at least one raw predicate" }
    return PatchStatusRecord(
        patchId = PatchId.AGENT_I_SETTINGS,
        status = PatchStatus.ERROR,
        expectedTargetCount = 2,
        actualTargetCount = rawPredicateCount,
        reason = reason,
    )
}

/** A dual-variant feature cannot safely accept one resolved predicate, so partial is always an ERROR. */
internal fun agentISettingsUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.AGENT_I_SETTINGS,
    status = if (matchCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = 2,
    actualTargetCount = matchCount,
    reason = reason,
)
