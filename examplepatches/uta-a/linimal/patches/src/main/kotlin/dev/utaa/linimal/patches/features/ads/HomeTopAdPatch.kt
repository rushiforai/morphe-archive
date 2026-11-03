package dev.utaa.linimal.patches.features.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import dev.utaa.linimal.patches.features.readreceipts.readReceiptExplicitMarkAsReadPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.status.unsafeFeatureStatus
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val DEBUG_METADATA = "Ldt8/f;"
private const val PERFORMANCE_AD_MODEL = "Llw2/c;"
private const val FLOW_COLLECTOR = "Luw8/j;"
private const val FLOW_CONTINUATION = "Lkotlin/coroutines/Continuation;"
private const val FLOW_EMIT = "emit"
private const val SINGLETON_LIST_OWNER = "Lws8/t;"
private const val SINGLETON_LIST_METHOD = "i"
private const val GCS_AD_LIST_METHOD = "g"
private const val LIST = "Ljava/util/List;"
private const val OBJECT_ARRAY = "[Ljava/lang/Object;"
private const val HOME_DEFAULT_MODULE_CATALOG_CONTEXT = "Lse2/b;"
private const val HOME_PERFORMANCE_AD_MIDDLE_ID =
    "home-content-server_home-performance-ad-middle"
private const val HOME_PERFORMANCE_AD_BOTTOM_ID =
    "home-content-server_home-performance-ad-bottom"
private const val HOME_PERFORMANCE_AD_MODULE_NAME = "home_performance_ad"
private const val HOME_LAN_BANNER_MODULE_ID = "home-content-server_home-lan-banner"
private const val HOME_RECENTLY_UPDATED_PROFILE_MODULE_ID =
    "home-content-server_home-recently-profile-update"
private const val HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT = 2
private const val HOME_PERFORMANCE_AD_LAYOUT = 0x7f0e03e1
private const val HOME_GCS_AD_LAYOUT = 0x7f0e0346
private const val CREATE_VIEW_DATA_FLOW_SOURCE =
    "GcsHomePerformanceAdModuleController\$createViewDataFlow\$\$inlined\$map\$1\$2"
private const val MODULE_CONTROLLER_SOURCE = "GcsHomePerformanceAdModuleController.kt"
private const val VIEW_DATA_TO_STRING = "GcsHomePerformanceAdViewData(advertise="
private const val GCS_AD_CREATE_VIEW_DATA_SOURCE =
    "com.linecorp.line.gcs.ad.GcsAdModuleController\$createViewDataFlow\$1"
private const val GCS_AD_MODULE_CONTROLLER_SOURCE = "GcsAdModuleController.kt"
private const val HOME_TOP_AD_HOOK =
    "Ldev/utaa/linimal/extension/features/HomeTopAdHooks;->filterPerformanceAdItems(Ljava/util/List;)Ljava/util/List;"
private const val HOME_PERFORMANCE_AD_CATALOG_HOOK =
    "Ldev/utaa/linimal/extension/features/HomeTopAdHooks;->filterHomePerformanceAdCatalogItems(Ljava/util/List;)Ljava/util/List;"

/** Home Feed の汎用 AdModel を描く専用 GCS ad controller の coroutine。 */
private val homeGcsAdCreateViewDataFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(
            definingClass = SINGLETON_LIST_OWNER,
            name = GCS_AD_LIST_METHOD,
            parameters = listOf("Ljava/lang/Object;"),
            returnType = LIST,
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
    custom = { _, classDef ->
        classDef.annotations.any { annotation ->
            if (annotation.type != DEBUG_METADATA) {
                false
            } else {
                val sourceController = annotation.elements.firstOrNull { it.name == "c" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value == GCS_AD_CREATE_VIEW_DATA_SOURCE
                val sourceFile = annotation.elements.firstOrNull { it.name == "f" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value == GCS_AD_MODULE_CONTROLLER_SOURCE
                sourceController && sourceFile
            }
        }
    },
)

/**
 * View data の source metadata から `createViewDataFlow` の map continuation を特定します。
 * continuation の直上の nested class が、performance ad 専用 item を singleton list に変換して
 * module Flow へ emit する mapper です。
 */
private val createViewDataFlowSourceFingerprint = Fingerprint(
    custom = { _, classDef ->
        classDef.annotations.any { annotation ->
            if (annotation.type != DEBUG_METADATA) {
                false
            } else {
                val sourceController = annotation.elements.firstOrNull { it.name == "c" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value
                    ?.contains(CREATE_VIEW_DATA_FLOW_SOURCE) == true
                val sourceFile = annotation.elements.firstOrNull { it.name == "f" }
                    ?.value
                    .let { it as? StringEncodedValue }
                    ?.value == MODULE_CONTROLLER_SOURCE
                sourceController && sourceFile
            }
        }
    },
)

/** GcsHomePerformanceAdViewData の toString contract と ad model field を組み合わせた class anchor。 */
private val performanceAdViewDataFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string(VIEW_DATA_TO_STRING),
        fieldAccess(type = PERFORMANCE_AD_MODEL, opcode = Opcode.IGET_OBJECT),
    ),
    custom = { _, classDef -> classDef.interfaces.contains("Lsg2/l;") },
)

/**
 * Home default module catalog を、middle / bottom の stable server ID、共通 module name、前後の
 * Home module ID、List を返す factory signature で特定します。難読化された class / method 名は使いません。
 */
private val homePerformanceAdCatalogFingerprint = Fingerprint(
    returnType = LIST,
    parameters = listOf(HOME_DEFAULT_MODULE_CATALOG_CONTEXT),
    filters = listOf(
        // Fingerprint filters are matched in instruction order. The middle module reuses the
        // module-name register for the bottom module, so the shared name appears only once.
        string(HOME_LAN_BANNER_MODULE_ID),
        string(HOME_PERFORMANCE_AD_MIDDLE_ID),
        string(HOME_PERFORMANCE_AD_MODULE_NAME),
        string(HOME_RECENTLY_UPDATED_PROFILE_MODULE_ID),
        string(HOME_PERFORMANCE_AD_BOTTOM_ID),
    ),
)

/**
 * `GcsHomePerformanceAdModuleController` の row factory の layout inflation path。mapper と同じ outer owner に
 * 存在することを確認し、generic Home module や SmartChannel を対象から除外します。
 */
private fun moduleControllerFingerprint(controllerType: String) = Fingerprint(
    definingClass = controllerType,
    returnType = "Lsg2/m;",
    parameters = listOf("Landroid/view/ViewGroup;", "Ljava/lang/Enum;"),
    filters = listOf(
        literal(HOME_PERFORMANCE_AD_LAYOUT),
        methodCall(
            definingClass = "Landroid/view/LayoutInflater;",
            name = "inflate",
            parameters = listOf("I", "Landroid/view/ViewGroup;", "Z"),
            returnType = "Landroid/view/View;",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/** `GcsAdModuleController` の広告専用 row factory。 */
private fun homeGcsAdModuleControllerFingerprint(controllerType: String) = Fingerprint(
    definingClass = controllerType,
    returnType = "Lsg2/m;",
    parameters = listOf("Landroid/view/ViewGroup;", "Ljava/lang/Enum;"),
    filters = listOf(literal(HOME_GCS_AD_LAYOUT)),
)

/**
 * module Flow へ item list を渡す最後の mapper。view data cast → singleton list → Flow emit の順序を
 * 固定し、広告の request/response、expiration、mute/close、tracker には到達しません。
 */
private fun performanceAdListGateFingerprint(mapperType: String, viewDataType: String) = Fingerprint(
    definingClass = mapperType,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", FLOW_CONTINUATION),
    filters = listOf(
        checkCast(viewDataType),
        methodCall(
            definingClass = SINGLETON_LIST_OWNER,
            name = SINGLETON_LIST_METHOD,
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Ljava/util/List;",
            opcode = Opcode.INVOKE_STATIC,
        ),
        methodCall(
            definingClass = FLOW_COLLECTOR,
            name = FLOW_EMIT,
            parameters = listOf("Ljava/lang/Object;", FLOW_CONTINUATION),
            returnType = "Ljava/lang/Object;",
            opcode = Opcode.INVOKE_INTERFACE,
        ),
    ),
)

/**
 * Home GCS Performance Ad の item list が module Flow へ渡る直前に runtime gate を置きます。
 * OFF では hook が同じ List instance を返し、ON ではこの専用 mapper の item だけを空 list にします。
 */
val homeTopAdPatch = bytecodePatch(
    name = "ホーム内の広告",
    description = "ホーム画面内の Performance Ad とフィード広告を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readReceiptExplicitMarkAsReadPatch)

    execute {
        val catalogMatches = homePerformanceAdCatalogFingerprint.matchAllOrNull().orEmpty()
        if (catalogMatches.size != 1) {
            patchStatusCollector.record(
                homePerformanceAdCatalogUnappliedRecord(0, "HomePerformanceAdCatalogNotUnique"),
            )
            return@execute
        }
        val catalogGate = homePerformanceAdCatalogGate(catalogMatches.single())
        if (catalogGate == null) {
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.HOME_TOP_AD_CATALOG_GATE,
                    expectedTargetCount = HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT,
                    actualTargetCount = HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT,
                    reason = "HomePerformanceAdCatalogShapeMismatch",
                ),
            )
            return@execute
        }

        val sourceContinuationTypes = createViewDataFlowSourceFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        if (sourceContinuationTypes.size != 1) {
            recordCatalogBlockedByFlowFailure()
            recordUnappliedStatus(sourceContinuationTypes.size, "HomeTopAdSourceMetadataNotUnique")
            return@execute
        }

        val mapperType = directEnclosingType(sourceContinuationTypes.single())
        val controllerType = mapperType?.let(::outerOwnerType)
        if (mapperType == null || controllerType == null) {
            recordCatalogBlockedByFlowFailure()
            recordUnsafeFeatureStatus(
                listOf(PatchId.HOME_TOP_AD_MODULE_GATE),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "HomeTopAdSourceNestingInvalid",
            )
            return@execute
        }

        val viewDataTypes = performanceAdViewDataFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        if (viewDataTypes.size != 1) {
            recordCatalogBlockedByFlowFailure()
            recordUnappliedStatus(viewDataTypes.size, "HomeTopAdViewDataNotUnique")
            return@execute
        }

        val controllerMatches = moduleControllerFingerprint(controllerType).matchAllOrNull().orEmpty()
        if (controllerMatches.size != 1) {
            recordCatalogBlockedByFlowFailure()
            recordUnappliedStatus(controllerMatches.size, "HomeTopAdModuleControllerNotUnique")
            return@execute
        }

        val matches = performanceAdListGateFingerprint(mapperType, viewDataTypes.single())
            .matchAllOrNull()
            .orEmpty()
        if (matches.size != 1) {
            recordCatalogBlockedByFlowFailure()
            recordUnappliedStatus(matches.size, "HomeTopAdModuleGateNotUnique")
            return@execute
        }

        val flowGate = performanceAdListEmissionGate(matches.single(), viewDataTypes.single())
        if (flowGate == null) {
            recordCatalogBlockedByFlowFailure()
            recordUnsafeFeatureStatus(
                listOf(PatchId.HOME_TOP_AD_MODULE_GATE),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "HomeTopAdModuleGateInstructionShapeMismatch",
            )
            return@execute
        }

        val gcsAdMatches = homeGcsAdCreateViewDataFingerprint.matchAllOrNull().orEmpty()
        if (gcsAdMatches.size != 1) {
            patchStatusCollector.record(
                homeGcsAdModuleGateUnappliedRecord(
                    gcsAdMatches.size,
                    "HomeGcsAdCreateViewDataNotUnique",
                ),
            )
            return@execute
        }
        val gcsAdOwner = directEnclosingType(gcsAdMatches.single().originalClassDef.type)
        if (gcsAdOwner == null) {
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.HOME_GCS_AD_MODULE_GATE,
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "HomeGcsAdSourceNestingInvalid",
                ),
            )
            return@execute
        }
        val gcsAdControllerMatches = homeGcsAdModuleControllerFingerprint(gcsAdOwner)
            .matchAllOrNull()
            .orEmpty()
        if (gcsAdControllerMatches.size != 1) {
            patchStatusCollector.record(
                homeGcsAdModuleGateUnappliedRecord(
                    gcsAdControllerMatches.size,
                    "HomeGcsAdModuleControllerNotUnique",
                ),
            )
            return@execute
        }
        val gcsAdGate = homeGcsAdListGate(gcsAdMatches.single())
        if (gcsAdGate == null) {
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.HOME_GCS_AD_MODULE_GATE,
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "HomeGcsAdListShapeMismatch",
                ),
            )
            return@execute
        }

        // catalog、Performance Ad Flow、汎用 GCS Ad のすべてを変更前に検証する。
        // いずれかが不安全なら広告 surface を一部だけ抑制しないため、ここまで mutation は行わない。
        catalogGate.method.addInstructions(
            catalogGate.insertionIndex,
            """
                invoke-static/range { v${catalogGate.listRegister} .. v${catalogGate.listRegister} }, $HOME_PERFORMANCE_AD_CATALOG_HOOK
                move-result-object v${catalogGate.listRegister}
            """.trimIndent(),
        )
        flowGate.method.addInstructions(
            flowGate.insertionIndex,
            """
                invoke-static { v${flowGate.listRegister} }, $HOME_TOP_AD_HOOK
                move-result-object v${flowGate.listRegister}
            """.trimIndent(),
        )
        gcsAdGate.method.addInstructions(
            gcsAdGate.insertionIndex,
            """
                invoke-static { v${gcsAdGate.listRegister} }, $HOME_TOP_AD_HOOK
                move-result-object v${gcsAdGate.listRegister}
            """.trimIndent(),
        )

        patchStatusCollector.record(
            patchId = PatchId.HOME_TOP_AD_MODULE_GATE,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "HomeTopAdPerformanceItemFlowGuarded",
        )
        patchStatusCollector.record(
            patchId = PatchId.HOME_TOP_AD_CATALOG_GATE,
            expectedTargetCount = HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT,
            actualTargetCount = HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT,
            reason = "HomePerformanceAdCatalogEntriesGuarded",
        )
        patchStatusCollector.record(
            patchId = PatchId.HOME_GCS_AD_MODULE_GATE,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "HomeGcsAdItemsGuarded",
        )
    }
}

private data class HomePerformanceAdCatalogGate(
    val method: MutableMethod,
    val insertionIndex: Int,
    val listRegister: Int,
)

private data class HomePerformanceAdFlowGate(
    val method: MutableMethod,
    val insertionIndex: Int,
    val listRegister: Int,
)

private data class HomeGcsAdListGate(
    val method: MutableMethod,
    val insertionIndex: Int,
    val listRegister: Int,
)

private fun performanceAdListEmissionGate(match: Match, viewDataType: String): HomePerformanceAdFlowGate? {
    val method = match.method
    val castIndex = match.instructionMatches[0].index
    val singletonListIndex = match.instructionMatches[1].index
    val emitIndex = match.instructionMatches[2].index
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()

    val cast = instructions.getOrNull(castIndex) as? OneRegisterInstruction ?: return null
    val castType = ((instructions.getOrNull(castIndex) as? ReferenceInstruction)
        ?.reference as? TypeReference) ?: return null
    val singletonList = instructions.getOrNull(singletonListIndex) as? FiveRegisterInstruction ?: return null
    val singletonListReference = ((instructions.getOrNull(singletonListIndex) as? ReferenceInstruction)
        ?.reference as? MethodReference) ?: return null
    val listResult = instructions.getOrNull(singletonListIndex + 1) as? OneRegisterInstruction ?: return null
    val stateWrite = instructions.getOrNull(singletonListIndex + 2) as? TwoRegisterInstruction ?: return null
    val stateField = ((instructions.getOrNull(singletonListIndex + 2) as? ReferenceInstruction)
        ?.reference as? FieldReference) ?: return null
    val collectorRead = instructions.getOrNull(emitIndex - 1) as? TwoRegisterInstruction ?: return null
    val collectorField = ((instructions.getOrNull(emitIndex - 1) as? ReferenceInstruction)
        ?.reference as? FieldReference) ?: return null
    val emit = instructions.getOrNull(emitIndex) as? FiveRegisterInstruction ?: return null
    val emitReference = ((instructions.getOrNull(emitIndex) as? ReferenceInstruction)
        ?.reference as? MethodReference) ?: return null

    // `move-result-object <list>` is immediately followed by coroutine state storage and collector emit.
    // The hook replaces only that list value, without changing the item object, upstream Flow, or lifecycle state.
    if (
        singletonListIndex != castIndex + 1 ||
        emitIndex != singletonListIndex + 4 ||
        instructions.getOrNull(castIndex)?.opcode != Opcode.CHECK_CAST ||
        castType.type != viewDataType ||
        singletonList.opcode != Opcode.INVOKE_STATIC ||
        singletonListReference.definingClass != SINGLETON_LIST_OWNER ||
        singletonListReference.name != SINGLETON_LIST_METHOD ||
        singletonListReference.parameterTypes != listOf("Ljava/lang/Object;") ||
        singletonListReference.returnType != "Ljava/util/List;" ||
        singletonList.registerCount != 1 ||
        singletonList.registerC != cast.registerA ||
        listResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
        listResult.registerA != cast.registerA ||
        listResult.registerA !in 0..15 ||
        stateWrite.opcode != Opcode.IPUT ||
        stateField.type != "I" ||
        collectorRead.opcode != Opcode.IGET_OBJECT ||
        collectorField.type != FLOW_COLLECTOR ||
        emit.opcode != Opcode.INVOKE_INTERFACE ||
        emitReference.definingClass != FLOW_COLLECTOR ||
        emitReference.name != FLOW_EMIT ||
        emitReference.parameterTypes != listOf("Ljava/lang/Object;", FLOW_CONTINUATION) ||
        emitReference.returnType != "Ljava/lang/Object;" ||
        emit.registerCount != 3 ||
        emit.registerC != collectorRead.registerA ||
        emit.registerD != listResult.registerA
    ) {
        return null
    }
    return HomePerformanceAdFlowGate(
        method = method,
        insertionIndex = singletonListIndex + 2,
        listRegister = listResult.registerA,
    )
}

private fun homeGcsAdListGate(match: Match): HomeGcsAdListGate? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val shape = homeGcsAdListGateShape(
        instructions = implementation.instructions.toList(),
        listFactoryIndex = match.instructionMatches.single().index,
        hasTryBlocks = implementation.tryBlocks.isNotEmpty(),
    ) ?: return null
    return HomeGcsAdListGate(method, shape.insertionIndex, shape.listRegister)
}

internal data class HomeGcsAdListGateShape(
    val insertionIndex: Int,
    val listRegister: Int,
)

/** 専用 AdModel renderer が作った singleton List の直後だけを許可します。 */
internal fun homeGcsAdListGateShape(
    instructions: List<Instruction>,
    listFactoryIndex: Int,
    hasTryBlocks: Boolean,
): HomeGcsAdListGateShape? {
    if (hasTryBlocks) return null
    val factory = instructions.getOrNull(listFactoryIndex) as? FiveRegisterInstruction ?: return null
    val reference = ((instructions.getOrNull(listFactoryIndex) as? ReferenceInstruction)
        ?.reference as? MethodReference) ?: return null
    val listResult = instructions.getOrNull(listFactoryIndex + 1) as? OneRegisterInstruction ?: return null
    val returnInstruction = instructions.getOrNull(listFactoryIndex + 2) as? OneRegisterInstruction ?: return null
    if (
        instructions[listFactoryIndex].opcode != Opcode.INVOKE_STATIC ||
        reference.definingClass != SINGLETON_LIST_OWNER ||
        reference.name != GCS_AD_LIST_METHOD ||
        reference.parameterTypes != listOf("Ljava/lang/Object;") ||
        reference.returnType != LIST ||
        factory.registerCount != 1 ||
        listResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
        listResult.registerA !in 0..15 ||
        returnInstruction.opcode != Opcode.RETURN_OBJECT ||
        returnInstruction.registerA != listResult.registerA
    ) {
        return null
    }
    if (isDivertedInjectionIndex(instructions, listFactoryIndex + 2)) {
        return null
    }
    return HomeGcsAdListGateShape(listFactoryIndex + 2, listResult.registerA)
}

private fun homePerformanceAdCatalogGate(match: Match): HomePerformanceAdCatalogGate? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val shape = homePerformanceAdCatalogGateShape(
        instructions = implementation.instructions.toList(),
        hasTryBlocks = implementation.tryBlocks.isNotEmpty(),
    ) ?: return null
    return HomePerformanceAdCatalogGate(
        method = method,
        insertionIndex = shape.insertionIndex,
        listRegister = shape.listRegister,
    )
}

internal data class HomePerformanceAdCatalogGateShape(
    val insertionIndex: Int,
    val listRegister: Int,
)

/**
 * `filled-new-array/range` で作られた7件の default module を List factory が受け、その同じ List を
 * 即座に return する catalog だけを許可します。分岐・try がある場合は label の挿入位置を誤認しうるため
 * 拒否します。
 */
internal fun homePerformanceAdCatalogGateShape(
    instructions: List<Instruction>,
    hasTryBlocks: Boolean,
): HomePerformanceAdCatalogGateShape? {
    if (hasTryBlocks || instructions.any { it is com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction }) {
        return null
    }

    val filledArrayIndex = instructions.indices.singleOrNull { index ->
        instructions[index].opcode == Opcode.FILLED_NEW_ARRAY_RANGE
    } ?: return null
    val filledArray = instructions[filledArrayIndex] as? RegisterRangeInstruction ?: return null
    val filledArrayType = ((instructions[filledArrayIndex] as? ReferenceInstruction)
        ?.reference as? TypeReference) ?: return null
    val arrayResult = instructions.getOrNull(filledArrayIndex + 1) as? OneRegisterInstruction ?: return null
    val factoryIndex = filledArrayIndex + 2
    val factory = instructions.getOrNull(factoryIndex) as? ReferenceInstruction ?: return null
    val factoryReference = factory.reference as? MethodReference ?: return null
    val factoryInput = singleInvokeArgumentRegister(instructions[factoryIndex]) ?: return null
    val listResult = instructions.getOrNull(factoryIndex + 1) as? OneRegisterInstruction ?: return null
    val returnInstruction = instructions.getOrNull(factoryIndex + 2) as? OneRegisterInstruction ?: return null

    if (
        filledArray.registerCount != HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT + 5 ||
        !filledArrayType.type.startsWith("[L") ||
        arrayResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
        instructions[factoryIndex].opcode != Opcode.INVOKE_STATIC ||
        factoryReference.parameterTypes != listOf(OBJECT_ARRAY) ||
        factoryReference.returnType != LIST ||
        factoryInput != arrayResult.registerA ||
        listResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
        returnInstruction.opcode != Opcode.RETURN_OBJECT ||
        returnInstruction.registerA != listResult.registerA
    ) {
        return null
    }
    return HomePerformanceAdCatalogGateShape(
        insertionIndex = factoryIndex + 2,
        listRegister = listResult.registerA,
    )
}

private fun singleInvokeArgumentRegister(instruction: Instruction): Int? = when (instruction) {
    is FiveRegisterInstruction -> if (instruction.registerCount == 1) instruction.registerC else null
    is RegisterRangeInstruction -> if (instruction.registerCount == 1) instruction.startRegister else null
    else -> null
}

private fun recordCatalogBlockedByFlowFailure() {
    patchStatusCollector.record(
        unsafeFeatureStatus(
            patchId = PatchId.HOME_TOP_AD_CATALOG_GATE,
            expectedTargetCount = HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT,
            actualTargetCount = HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT,
            reason = "HomePerformanceAdCatalogBlockedByFlowGate",
        ),
    )
}

private fun directEnclosingType(type: String): String? {
    val separator = type.lastIndexOf('$')
    return if (separator > 1 && type.endsWith(';')) type.substring(0, separator) + ";" else null
}

private fun outerOwnerType(type: String): String? {
    val separator = type.indexOf('$')
    return if (separator > 1 && type.endsWith(';')) type.substring(0, separator) + ";" else type
}

private fun recordUnappliedStatus(matchCount: Int, reason: String) {
    patchStatusCollector.record(homeTopAdModuleGateUnappliedRecord(matchCount, reason))
}

/** catalog match が一意でない場合も、実際に見つかった候補数を status に残す。 */
internal fun homePerformanceAdCatalogUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.HOME_TOP_AD_CATALOG_GATE,
    status = if (matchCount > 1) PatchStatus.ERROR else PatchStatus.TARGET_NOT_FOUND,
    expectedTargetCount = HOME_PERFORMANCE_AD_CATALOG_TARGET_COUNT,
    actualTargetCount = matchCount,
    reason = reason,
)

internal fun homeGcsAdModuleGateUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.HOME_GCS_AD_MODULE_GATE,
    status = if (matchCount > 1) PatchStatus.ERROR else PatchStatus.TARGET_NOT_FOUND,
    expectedTargetCount = 1,
    actualTargetCount = matchCount,
    reason = reason,
)

/** A non-unique candidate is unsafe; missing candidates leave the optional feature unavailable. */
internal fun homeTopAdModuleGateUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.HOME_TOP_AD_MODULE_GATE,
    status = if (matchCount > 1) PatchStatus.ERROR else PatchStatus.TARGET_NOT_FOUND,
    expectedTargetCount = 1,
    actualTargetCount = matchCount,
    reason = reason,
)
