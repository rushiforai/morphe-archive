package dev.utaa.linimal.patches.features.agenti

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.isSafeInjectionIndex
import dev.utaa.linimal.patches.util.unconditionalPathAliases
import dev.utaa.linimal.patches.util.branchTargetAddress
import dev.utaa.linimal.patches.util.instructionAddress

private const val VIEW = "Landroid/view/View;"
private const val VIEW_STUB = "Landroid/view/ViewStub;"
private const val COMPOSE_VIEW = "Landroidx/compose/ui/platform/ComposeView;"
private const val VIEW_BINDING = "Lte/a;"
private const val VIEW_BINDING_FIND_VIEW = "Leo8/m;"
private const val FRAGMENT_ACTIVITY = "Landroidx/fragment/app/b0;"
private const val DEBUG_METADATA = "Ldt8/f;"
private const val AI_TALK_CONTROLLER =
    "Lcom/linecorp/line/chat/ui/impl/message/input/aitalksuggestion/a;"
private const val MESSAGE_INPUT_SOURCE = "MessageInputViewControllerImpl.kt"
private const val OBSERVE_AI_TALK_SOURCE =
    "MessageInputViewControllerImpl\$observeViewModelForAiTalkSuggestionFeature\$2"
private const val AI_TALK_SUGGESTION_CHIP_BAR = 0x7f0b0649
private const val AI_TALK_INPUT_LAYOUT = 0x7f0e0119
private const val CONTROLLER_CHIP_BAR_PARAMETER_INDEX = 2

/** 入力欄の Agent i 入口は Compose の chip bar に統合され、supply gate の 1 箇所だけになりました。 */
private const val EXPECTED_TARGET_COUNT = 1
private const val AGENT_I_CHAT_COMPOSER_CHIP_BAR_HOOK =
    "Ldev/utaa/linimal/extension/features/agenti/AgentIChatComposerHooks;" +
        "->adjustAiTalkSuggestionChipBar(Ljava/lang/Object;)Ljava/lang/Object;"

private val aiTalkControllerConstructorParameters = listOf(
    FRAGMENT_ACTIVITY,
    VIEW_STUB,
    "Lzm1/a;",
    "Lkn1/b;",
    "Lmd1/b;",
    "Ljava/lang/String;",
    "Li81/c;",
)

/**
 * Message input binding の `chat_ui_ai_talk_suggestion_chip_bar` を resource literal から特定します。
 * `b12/y` などの難読化名には依存しません。
 */
private val chipBarBindingFingerprint = Fingerprint(
    returnType = null,
    parameters = listOf(VIEW),
    filters = listOf(
        literal(AI_TALK_SUGGESTION_CHIP_BAR),
        methodCall(
            definingClass = VIEW_BINDING_FIND_VIEW,
            name = "a",
            parameters = listOf(VIEW, "I"),
            returnType = VIEW,
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
    custom = { method, classDef ->
        method.returnType == classDef.type &&
            classDef.interfaces.contains(VIEW_BINDING) &&
            method.implementation != null
    },
)

/**
 * MessageInputViewControllerImpl の AI Talk observer coroutine。source metadata から親 controller を導き、
 * generic な message-input binding を AI Talk surface と取り違えないために使用します。
 */
private val messageInputAiTalkSourceFingerprint = Fingerprint(
    name = "invokeSuspend",
    returnType = OBJECT,
    parameters = listOf(OBJECT),
    custom = { _, classDef ->
        hasDebugMetadata(
            classDef,
            sourceFile = MESSAGE_INPUT_SOURCE,
            classNameContains = OBSERVE_AI_TALK_SOURCE,
        )
    },
)

/**
 * stable owner の ViewStub layout-resource → inflate sequence。ここでは注入せず、chip bar の供給先が
 * 同じ AI Talk input surface に確実に接続されていることを検証します。
 */
private val aiTalkInflationControllerFingerprint = Fingerprint(
    definingClass = AI_TALK_CONTROLLER,
    name = "<init>",
    returnType = VOID,
    filters = listOf(
        literal(AI_TALK_INPUT_LAYOUT),
        methodCall(
            definingClass = VIEW_STUB,
            name = "setLayoutResource",
            parameters = listOf("I"),
            returnType = VOID,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        methodCall(
            definingClass = VIEW_STUB,
            name = "inflate",
            parameters = emptyList(),
            returnType = VIEW,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
    custom = { method, _ ->
        method.parameterTypes.map(CharSequence::toString) == aiTalkControllerConstructorParameters
    },
)

/**
 * stable AI Talk controller を構築する MessageInputViewControllerImpl の path。observer coroutine が
 * field に保持する型へ限定し、source metadata / controller owner を一つの経路として確認します。
 */
private fun aiTalkControllerWiringFingerprint(sourceFieldTypes: Set<String>) = Fingerprint(
    returnType = VOID,
    filters = listOf(
        methodCall(
            definingClass = AI_TALK_CONTROLLER,
            name = "<init>",
            parameters = aiTalkControllerConstructorParameters,
            returnType = VOID,
            opcode = Opcode.INVOKE_DIRECT_RANGE,
        ),
    ),
    custom = { _, classDef -> classDef.type in sourceFieldTypes },
)

/**
 * chip bar view を保持する binding field を読み出す accessor。field 名は resource literal から逆引きするため、
 * `jb1/j` などの難読化名も accessor が属する interface 名も識別条件にしません。
 */
private fun aiTalkSuggestionChipBarAccessorFingerprint(bindingType: String, fieldName: String) = Fingerprint(
    returnType = COMPOSE_VIEW,
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = bindingType,
            name = fieldName,
            type = COMPOSE_VIEW,
            opcode = Opcode.IGET_OBJECT,
        ),
    ),
    custom = { method, _ -> method.implementation != null },
)

/**
 * 入力欄下の chip bar (`chat_ui_ai_talk_suggestion_chip_bar`) にだけ runtime gate を置きます。
 *
 * 独立した composer button は廃止され、Agent i の mention chip と候補 chip はこの ComposeView の中に
 * 描画されます。LINE 自身が chip bar なしの構成で使う null 供給と同じ分岐を通し、controller へ渡す前に
 * view を取り除きます。
 *
 * text input、gallery、camera、attach menu はこの経路の対象外であり、AI Talk の
 * subscription/backend/settings/network は変更しません。
 */
val agentIChatComposerPatch = bytecodePatch(
    name = "Agent i in message box",
    description = "チャット入力欄にある Agent i のボタンと候補チップを、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(agentISettingsPatch)

    execute {
        val bindingMatches = chipBarBindingFingerprint.matchAllOrNull().orEmpty()
        if (bindingMatches.size != 1) {
            recordUnappliedStatus(bindingMatches.size, "AgentIChatComposerBindingNotUnique")
            return@execute
        }
        val binding = bindingMatches.single()
        val bindingType = binding.originalClassDef.type

        val sourceMatches = messageInputAiTalkSourceFingerprint.matchAllOrNull().orEmpty()
        if (sourceMatches.size != 1) {
            recordUnappliedStatus(sourceMatches.size, "AgentIChatComposerSourceMetadataNotUnique")
            return@execute
        }
        val sourceFieldTypes = sourceMatches.single().originalClassDef.fields
            .map { it.type }
            .filter { it.startsWith("L") }
            .toSet()

        val wiringMatches = aiTalkControllerWiringFingerprint(sourceFieldTypes)
            .matchAllOrNull()
            .orEmpty()
        if (wiringMatches.size != 1) {
            recordUnappliedStatus(wiringMatches.size, "AgentIChatComposerWiringNotUnique")
            return@execute
        }
        val wiring = wiringMatches.single()

        val inflationMatches = aiTalkInflationControllerFingerprint.matchAllOrNull().orEmpty()
        if (inflationMatches.size != 1) {
            recordUnappliedStatus(inflationMatches.size, "AgentIChatComposerInflationControllerNotUnique")
            return@execute
        }

        // resource literal から binding field を逆引きし、その field を読む accessor と supply shape が
        // すべて一意なときにだけ gate を追加します。
        val chipBarField = aiTalkSuggestionChipBarField(binding.originalMethod, binding.originalClassDef)
        val chipBarAccessor = chipBarField
            ?.let { aiTalkSuggestionChipBarAccessorFingerprint(bindingType, it).matchAllOrNull().orEmpty() }
            ?.singleOrNull()
        val chipBarGateShape = chipBarAccessor?.let { accessor ->
            aiTalkSuggestionChipBarGateShape(
                wiring.method.implementation?.instructions?.toList().orEmpty(),
                accessor.originalMethod.name,
                accessor.originalClassDef.interfaces.toSet(),
            )
        }
        if (
            !aiTalkInflationShape(inflationMatches.single().method) ||
            chipBarGateShape == null ||
            !isSafeInjectionIndex(wiring.method.implementation, chipBarGateShape.insertionIndex)
        ) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.AGENT_I_CHAT_COMPOSER),
                expectedTargetCount = EXPECTED_TARGET_COUNT,
                actualTargetCount = EXPECTED_TARGET_COUNT,
                reason = "AgentIChatComposerInstructionShapeMismatch",
            )
            return@execute
        }

        wiring.method.addInstructions(
            chipBarGateShape.insertionIndex,
            """
                invoke-static/range { v${chipBarGateShape.chipBarRegister} .. v${chipBarGateShape.chipBarRegister} }, $AGENT_I_CHAT_COMPOSER_CHIP_BAR_HOOK
                move-result-object v${chipBarGateShape.chipBarRegister}
                check-cast v${chipBarGateShape.chipBarRegister}, $COMPOSE_VIEW
            """.trimIndent(),
        )
        patchStatusCollector.record(
            patchId = PatchId.AGENT_I_CHAT_COMPOSER,
            expectedTargetCount = EXPECTED_TARGET_COUNT,
            actualTargetCount = EXPECTED_TARGET_COUNT,
            reason = "AgentIChatComposerChipBarGuarded",
        )
    }
}

internal data class ChipBarGateShape(
    val insertionIndex: Int,
    val chipBarRegister: Int,
)

private fun hasDebugMetadata(
    classDef: ClassDef,
    sourceFile: String,
    classNameContains: String? = null,
): Boolean = classDef.annotations.any { annotation ->
    if (annotation.type != DEBUG_METADATA) {
        false
    } else {
        val metadataSource = annotation.elements.firstOrNull { it.name == "f" }
            ?.value
            .let { it as? StringEncodedValue }
            ?.value
        val metadataClass = annotation.elements.firstOrNull { it.name == "c" }
            ?.value
            .let { it as? StringEncodedValue }
            ?.value
        metadataSource == sourceFile &&
            (classNameContains == null || metadataClass?.contains(classNameContains) == true)
    }
}

private fun aiTalkInflationShape(method: Method): Boolean {
    val instructions = method.implementation?.instructions?.toList() ?: return false
    val setLayoutIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let { reference ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                methodMatches(reference, VIEW_STUB, "setLayoutResource", listOf("I"), VOID)
        } == true
    }
    val inflateIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let { reference ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                methodMatches(reference, VIEW_STUB, "inflate", emptyList(), VIEW)
        } == true
    }
    val setLayout = instructions.getOrNull(setLayoutIndex) as? FiveRegisterInstruction ?: return false
    val inflate = instructions.getOrNull(inflateIndex) as? FiveRegisterInstruction ?: return false
    return setLayoutIndex >= 1 &&
        inflateIndex == setLayoutIndex + 1 &&
        setLayout.registerCount == 2 &&
        inflate.registerCount == 1 &&
        inflate.registerC == setLayout.registerC
}

/**
 * bind method 内の `chat_ui_ai_talk_suggestion_chip_bar` literal から、chip bar view を格納する binding field 名を
 * 逆引きします。literal → findChildViewById → check-cast → binding constructor argument → iput の連鎖を
 * すべて確認できたときだけ field 名を返します。
 */
private fun aiTalkSuggestionChipBarField(bindMethod: Method, bindingClass: ClassDef): String? {
    val instructions = bindMethod.implementation?.instructions?.toList() ?: return null
    val literalIndex = instructions
        .mapIndexedNotNull { index, instruction ->
            index.takeIf {
                (instruction as? WideLiteralInstruction)?.wideLiteral == AI_TALK_SUGGESTION_CHIP_BAR.toLong()
            }
        }
        .singleOrNull() ?: return null
    val literalRegister = (instructions[literalIndex] as? OneRegisterInstruction)?.registerA ?: return null

    val findViewCall = instructions.getOrNull(literalIndex + 1) as? FiveRegisterInstruction ?: return null
    val findViewReference = methodReference(instructions.getOrNull(literalIndex + 1)) ?: return null
    if (
        instructions[literalIndex + 1].opcode != Opcode.INVOKE_STATIC ||
        !methodMatches(findViewReference, VIEW_BINDING_FIND_VIEW, "a", listOf(VIEW, "I"), VIEW) ||
        findViewCall.registerCount != 2 ||
        findViewCall.registerD != literalRegister
    ) {
        return null
    }

    val resolved = instructions.getOrNull(literalIndex + 2) as? OneRegisterInstruction ?: return null
    if (instructions[literalIndex + 2].opcode != Opcode.MOVE_RESULT_OBJECT) return null

    // resolve 結果はそのまま、あるいは一度だけ別 register へ移してから check-cast されます。
    var castIndex = literalIndex + 3
    var chipBarRegister = resolved.registerA
    val relay = instructions.getOrNull(castIndex) as? TwoRegisterInstruction
    if (
        relay != null &&
        (
            instructions[castIndex].opcode == Opcode.MOVE_OBJECT ||
                instructions[castIndex].opcode == Opcode.MOVE_OBJECT_FROM16
            ) &&
        relay.registerB == chipBarRegister
    ) {
        chipBarRegister = relay.registerA
        castIndex += 1
    }
    val cast = instructions.getOrNull(castIndex) as? OneRegisterInstruction ?: return null
    val castType = (instructions[castIndex] as? ReferenceInstruction)?.reference as? TypeReference
    if (
        instructions[castIndex].opcode != Opcode.CHECK_CAST ||
        cast.registerA != chipBarRegister ||
        castType?.type != COMPOSE_VIEW
    ) {
        return null
    }

    val parameterIndex = bindingConstructorParameterIndex(instructions, bindingClass.type, chipBarRegister)
        ?: return null
    return bindingComposeViewFieldName(bindingClass, parameterIndex)
}

/** bind method 終端の binding constructor 呼び出しで、指定 register が渡される parameter index を返します。 */
private fun bindingConstructorParameterIndex(
    instructions: List<Instruction>,
    bindingType: String,
    valueRegister: Int,
): Int? {
    val constructorCall = instructions.firstOrNull { instruction ->
        methodReference(instruction)?.let { reference ->
            (
                instruction.opcode == Opcode.INVOKE_DIRECT_RANGE ||
                    instruction.opcode == Opcode.INVOKE_DIRECT
                ) &&
                reference.definingClass == bindingType &&
                reference.name == "<init>"
        } == true
    } ?: return null
    val constructorReference = methodReference(constructorCall) ?: return null
    val argumentRegisters = when (constructorCall) {
        is RegisterRangeInstruction ->
            (0 until constructorCall.registerCount).map { constructorCall.startRegister + it }
        is FiveRegisterInstruction -> listOf(
            constructorCall.registerC,
            constructorCall.registerD,
            constructorCall.registerE,
            constructorCall.registerF,
            constructorCall.registerG,
        ).take(constructorCall.registerCount)
        else -> return null
    }
    if (argumentRegisters.size != constructorReference.parameterTypes.size + 1) return null
    return argumentRegisters.drop(1)
        .mapIndexedNotNull { index, register -> index.takeIf { register == valueRegister } }
        .singleOrNull()
}

/** binding constructor の parameter index を、同じ値を保存する ComposeView field 名へ写します。 */
private fun bindingComposeViewFieldName(bindingClass: ClassDef, parameterIndex: Int): String? {
    val initMethod = bindingClass.directMethods.singleOrNull { it.name == "<init>" } ?: return null
    val implementation = initMethod.implementation ?: return null
    val instanceRegister = implementation.registerCount - (initMethod.parameterTypes.size + 1)
    if (instanceRegister < 0) return null
    val parameterRegister = instanceRegister + 1 + parameterIndex
    return implementation.instructions
        .mapNotNull { instruction ->
            val store = instruction as? TwoRegisterInstruction ?: return@mapNotNull null
            val reference = fieldReference(instruction) ?: return@mapNotNull null
            reference.name.takeIf {
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    store.registerA == parameterRegister &&
                    store.registerB == instanceRegister &&
                    reference.definingClass == bindingClass.type &&
                    reference.type == COMPOSE_VIEW
            }
        }
        .singleOrNull()
}

/**
 * controller-construction path で chip bar view が null 判定へ渡される直前の位置を返します。
 *
 * accessor 呼び出し → null 判定 → holder 生成 → controller argument への move と、null 側の
 * `const/4 argument, 0` という LINE 自身の shape をすべて確認します。hook が null を返しても
 * LINE 自身の null 分岐を通るだけで、未知の状態を作りません。
 */
internal fun aiTalkSuggestionChipBarGateShape(
    instructions: List<Instruction>,
    accessorName: String,
    accessorInterfaces: Set<String>,
): ChipBarGateShape? {
    val controllerCallIndex = instructions.indexOfFirst { instruction ->
        methodReference(instruction)?.let { reference ->
            instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
                methodMatches(
                    reference,
                    AI_TALK_CONTROLLER,
                    "<init>",
                    aiTalkControllerConstructorParameters,
                    VOID,
                )
        } == true
    }
    val controllerCall = instructions.getOrNull(controllerCallIndex) as? RegisterRangeInstruction ?: return null
    if (controllerCall.registerCount != aiTalkControllerConstructorParameters.size + 1) return null

    val chipBarHolderType = aiTalkControllerConstructorParameters[CONTROLLER_CHIP_BAR_PARAMETER_INDEX]
    val chipBarArgumentRegister = controllerCall.startRegister + CONTROLLER_CHIP_BAR_PARAMETER_INDEX + 1

    val candidates = instructions.indices.filter { index ->
        index < controllerCallIndex &&
            isChipBarSupply(
                instructions,
                index,
                controllerCallIndex,
                accessorName,
                accessorInterfaces,
                chipBarHolderType,
                chipBarArgumentRegister,
            )
    }
    val index = candidates.singleOrNull() ?: return null
    val chipBarRegister = (instructions[index + 1] as OneRegisterInstruction).registerA
    return ChipBarGateShape(insertionIndex = index + 2, chipBarRegister = chipBarRegister)
}

private fun isChipBarSupply(
    instructions: List<Instruction>,
    index: Int,
    controllerCallIndex: Int,
    accessorName: String,
    accessorInterfaces: Set<String>,
    chipBarHolderType: String,
    chipBarArgumentRegister: Int,
): Boolean {
    val accessorCall = instructions[index] as? FiveRegisterInstruction ?: return false
    val accessorReference = methodReference(instructions[index]) ?: return false
    if (
        instructions[index].opcode != Opcode.INVOKE_INTERFACE ||
        accessorCall.registerCount != 1 ||
        accessorReference.definingClass !in accessorInterfaces ||
        accessorReference.name != accessorName ||
        accessorReference.parameterTypes.isNotEmpty() ||
        accessorReference.returnType != COMPOSE_VIEW
    ) {
        return false
    }

    val resolved = instructions.getOrNull(index + 1) as? OneRegisterInstruction ?: return false
    if (instructions[index + 1].opcode != Opcode.MOVE_RESULT_OBJECT || resolved.registerA !in 0..15) return false

    val nullCheck = instructions.getOrNull(index + 2) as? OneRegisterInstruction ?: return false
    if (instructions[index + 2].opcode != Opcode.IF_EQZ || nullCheck.registerA != resolved.registerA) return false

    val holderType = (instructions.getOrNull(index + 3) as? ReferenceInstruction)?.reference as? TypeReference
    if (instructions[index + 3].opcode != Opcode.NEW_INSTANCE || holderType?.type != chipBarHolderType) return false
    val holderRegister = (instructions[index + 3] as? OneRegisterInstruction)?.registerA ?: return false

    // holder constructor の第 1 引数が、null 判定した chip bar view そのものであることを確認します。
    val holderInitIndex = (index + 4 until controllerCallIndex).singleOrNull { candidate ->
        methodReference(instructions[candidate])?.let { reference ->
            instructions[candidate].opcode == Opcode.INVOKE_DIRECT &&
                reference.definingClass == chipBarHolderType &&
                reference.name == "<init>"
        } == true
    } ?: return false
    val holderInit = instructions[holderInitIndex] as? FiveRegisterInstruction ?: return false
    val holderInitReference = methodReference(instructions[holderInitIndex]) ?: return false
    if (
        holderInitReference.returnType != VOID ||
        holderInitReference.parameterTypes.map(CharSequence::toString).firstOrNull() != COMPOSE_VIEW ||
        holderInit.registerCount < 2 ||
        holderInit.registerD != resolved.registerA ||
        (index + 3 until holderInitIndex).any { writesRegister(instructions[it], resolved.registerA) }
    ) {
        return false
    }
    // constructor の receiver が、ここで生成した holder そのもの（move-object の写しを含む）であることを確認します。
    val holderAliases = unconditionalPathAliases(
        instructions,
        index + 4,
        holderInitIndex,
        setOf(holderRegister),
        allowInvokes = true,
    ) ?: return false
    if (holderInit.registerC !in holderAliases) return false

    // non-null 側は holder を、null 側は 0 を、それぞれ controller の chip bar argument へ入れます。
    val supply = instructions.getOrNull(holderInitIndex + 1) as? TwoRegisterInstruction ?: return false
    val supplyOpcode = instructions[holderInitIndex + 1].opcode
    if (
        (supplyOpcode != Opcode.MOVE_OBJECT && supplyOpcode != Opcode.MOVE_OBJECT_FROM16) ||
        supply.registerA != chipBarArgumentRegister ||
        supply.registerB != holderInit.registerC
    ) {
        return false
    }
    // null 側は if-eqz の分岐先から一本道で `const/4 argument, 0` に着く必要があります。hook が null を返した
    // ときに、LINE 自身の「chip bar なし」の引数供給へ確実に合流させるためです。
    val nullTargetAddress = branchTargetAddress(instructions, index + 2) ?: return false
    val nullTarget = instructions.indices.firstOrNull { instructionAddress(instructions, it) == nullTargetAddress }
        ?: return false
    return (holderInitIndex + 2 until controllerCallIndex).any { candidate ->
        val instruction = instructions[candidate]
        instruction.opcode == Opcode.CONST_4 &&
            (instruction as? OneRegisterInstruction)?.registerA == chipBarArgumentRegister &&
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
            unconditionalPathAliases(instructions, nullTarget, candidate, emptySet()) != null
    }
}

private fun writesRegister(instruction: Instruction, register: Int): Boolean =
    instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA == register

private fun methodReference(instruction: Instruction?): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

private fun fieldReference(instruction: Instruction?): FieldReference? =
    (instruction as? ReferenceInstruction)?.reference as? FieldReference

private fun methodMatches(
    reference: MethodReference,
    definingClass: String,
    name: String,
    parameters: List<String>,
    returnType: String,
): Boolean = reference.definingClass == definingClass &&
    reference.name == name &&
    reference.parameterTypes.map(CharSequence::toString) == parameters &&
    reference.returnType == returnType

private fun recordUnappliedStatus(matchCount: Int, reason: String) {
    patchStatusCollector.record(agentIChatComposerUnappliedRecord(matchCount, reason))
}

/** 0 件は target 未発見、複数件は安全に注入できない ERROR として扱います。 */
internal fun agentIChatComposerUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.AGENT_I_CHAT_COMPOSER,
    status = if (matchCount > 1) PatchStatus.ERROR else PatchStatus.TARGET_NOT_FOUND,
    expectedTargetCount = EXPECTED_TARGET_COUNT,
    actualTargetCount = matchCount,
    reason = reason,
)
