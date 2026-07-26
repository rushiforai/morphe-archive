package dev.jason.gboardpatches.patches.gboard.features.webclipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.debug.LineNumber
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import java.nio.charset.StandardCharsets
import java.security.MessageDigest

private const val LATIN_IME_SERVICE_CLASS = "Loau;"
private const val INPUT_METHOD_SERVICE_CLASS =
    "Landroid/inputmethodservice/InputMethodService;"
private const val TARGET_METHOD_NAME = "onCreate"
private const val TARGET_RETURN_TYPE = "V"
private val TARGET_PARAMETER_TYPES = emptyList<String>()
private const val TARGET_DESCRIPTOR = "$LATIN_IME_SERVICE_CLASS->onCreate()V"
private const val SUPER_ON_CREATE_DESCRIPTOR =
    "$INPUT_METHOD_SERVICE_CLASS->onCreate()V"
private const val STOCK_REGISTER_COUNT = 12
private const val STOCK_RECEIVER_REGISTER = 11
private const val SAVED_RECEIVER_REGISTER = 4
private const val STOCK_FINGERPRINT =
    "5B70FD78E6734788230A744AC7FB24EB6515642960E91F85917BE0C4D0FE1E37"
private const val RAW_STOCK_FINGERPRINT =
    "42A12CEF65195B5D2B627E34D6F8CC0758462B141F33F897797CFA92C30275D1"
private const val PATCHED_FINGERPRINT =
    "7F9C8335D30C8C8498FD6A5A2EE02CA006A68C274DAB69EA2CAB702ADE000210"
private const val RAW_PATCHED_FINGERPRINT =
    "0A985A0A22B927121CB0615F79C1DAAFC1036009FA527FB150625E9BC092D62B"
private val TARGET_CLASS_ACCESS_FLAGS = AccessFlags.PUBLIC.value
private val TARGET_METHOD_ACCESS_FLAGS =
    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value

private const val CAPTURE_BOOTSTRAP_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/webclipboard/GboardWebClipboardCaptureBootstrap;"
private const val CAPTURE_BOOTSTRAP_RUNTIME_DESCRIPTOR =
    "$CAPTURE_BOOTSTRAP_RUNTIME_CLASS->afterLatinImeOnCreate(Ljava/lang/Object;)V"

internal val gboardWebClipboardCapturePatch = bytecodePatch(
    description = "在 oau.onCreate() 正常返回前掛上 Web Clipboard capture bootstrap。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val owner = mutableClass(LATIN_IME_SERVICE_CLASS)
        val target = selectWebClipboardCaptureOnCreate(owner, owner.methods.toList())
        target.applyWebClipboardCaptureBootstrap()
    }
}

internal fun selectWebClipboardCaptureOnCreate(
    owner: MutableClass,
    methods: List<MutableMethod>,
): MutableMethod {
    check(
        owner.type == LATIN_IME_SERVICE_CLASS &&
            owner.accessFlags == TARGET_CLASS_ACCESS_FLAGS &&
            owner.superclass == INPUT_METHOD_SERVICE_CLASS,
    ) {
        "Expected public $LATIN_IME_SERVICE_CLASS to directly extend " +
            INPUT_METHOD_SERVICE_CLASS
    }
    val matches = methods.filter { method ->
        method.definingClass == LATIN_IME_SERVICE_CLASS &&
            method.name == TARGET_METHOD_NAME &&
            method.parameterTypes == TARGET_PARAMETER_TYPES &&
            method.returnType == TARGET_RETURN_TYPE &&
            method.accessFlags == TARGET_METHOD_ACCESS_FLAGS
    }
    check(matches.size == 1) {
        "Expected exactly one public final instance void $TARGET_DESCRIPTOR target"
    }
    return matches.single()
}

internal fun MutableMethod.applyWebClipboardCaptureBootstrap(): MutableMethod {
    requireExactTarget()
    val instructions = implementation?.instructions
        ?: error("No instructions in $TARGET_DESCRIPTOR")
    val runtimeReferences = instructions.filter { instruction ->
        instruction.methodDescriptor()
            ?.startsWith("$CAPTURE_BOOTSTRAP_RUNTIME_CLASS->") == true
    }
    if (runtimeReferences.isNotEmpty()) {
        check(
            runtimeReferences.size == 1 &&
                runtimeReferences.single().methodDescriptor() ==
                    CAPTURE_BOOTSTRAP_RUNTIME_DESCRIPTOR,
        ) {
            "$TARGET_DESCRIPTOR contains an orphan or duplicate Web Clipboard delegate"
        }
        validateCompletedPatch()
        return this
    }

    validateStockBody()
    val receiverSaveIndex = receiverSaveInsertionIndex(instructions)
    addInstructions(receiverSaveIndex, RECEIVER_SAVE)
    val returnIndex = singleNormalReturnIndex(
        implementation?.instructions ?: error("No instructions in $TARGET_DESCRIPTOR"),
    )
    addInstructions(returnIndex, CAPTURE_BOOTSTRAP_DELEGATE)
    validateCompletedPatch()
    return this
}

private fun MutableMethod.requireExactTarget() {
    check(
        definingClass == LATIN_IME_SERVICE_CLASS &&
            name == TARGET_METHOD_NAME &&
            parameterTypes == TARGET_PARAMETER_TYPES &&
            returnType == TARGET_RETURN_TYPE &&
            accessFlags == TARGET_METHOD_ACCESS_FLAGS,
    ) {
        "Refusing non-target Web Clipboard method " +
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    }
}

private fun MutableMethod.validateStockBody() {
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    check(implementation.registerCount == STOCK_REGISTER_COUNT) {
        "Unexpected register count in $TARGET_DESCRIPTOR: ${implementation.registerCount}"
    }
    check(implementation.instructions.none { instruction ->
        instruction.methodDescriptor()
            ?.startsWith("$CAPTURE_BOOTSTRAP_RUNTIME_CLASS->") == true
    }) {
        "$TARGET_DESCRIPTOR contains an orphan Web Clipboard runtime reference"
    }
    receiverSaveInsertionIndex(implementation.instructions)
    validateStockControlFlow()
    requireStockCaptureFingerprint()
}

private fun MutableMethod.validateCompletedPatch() {
    requireExactTarget()
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    check(implementation.registerCount == STOCK_REGISTER_COUNT)
    val instructions = implementation.instructions
    val returnIndex = singleNormalReturnIndex(instructions)
    val saveIndices = instructions.indices.filter { index ->
        instructions[index].isExactReceiverSave()
    }
    check(saveIndices.size == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one receiver save"
    }
    val saveIndex = saveIndices.single()
    check(instructions.getOrNull(saveIndex - 1).isExactLastSavedLocalUse()) {
        "$TARGET_DESCRIPTOR receiver save is missing or misplaced"
    }
    check(instructions.getOrNull(returnIndex - 1).isExactCaptureDelegate()) {
        "$TARGET_DESCRIPTOR delegate is missing, misplaced, or malformed"
    }
    val delegateIndex = returnIndex - 1
    check(saveIndex < delegateIndex) {
        "$TARGET_DESCRIPTOR receiver save must precede the delegate"
    }
    check(instructions.subList(saveIndex + 1, delegateIndex).none { instruction ->
        SAVED_RECEIVER_REGISTER in instruction.mentionedRegisters()
    }) {
        "$TARGET_DESCRIPTOR saved receiver local is redefined or consumed before delegate"
    }
    val firstP0Clobber = instructions.indices.firstOrNull { index ->
        instructions[index].definesRegister(STOCK_RECEIVER_REGISTER)
    } ?: error("$TARGET_DESCRIPTOR must retain its p0 clobber")
    check(saveIndex < firstP0Clobber && firstP0Clobber < delegateIndex) {
        "$TARGET_DESCRIPTOR must save the receiver before p0 is clobbered"
    }
    check(instructions.count { instruction ->
        instruction.methodDescriptor() == CAPTURE_BOOTSTRAP_RUNTIME_DESCRIPTOR
    } == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one Web Clipboard delegate"
    }
    check(instructions.count { instruction ->
        instruction.methodDescriptor()
            ?.startsWith("$CAPTURE_BOOTSTRAP_RUNTIME_CLASS->") == true
    } == 1) {
        "$TARGET_DESCRIPTOR contains an orphan Web Clipboard runtime reference"
    }
    validateStockControlFlow()
    val saveAddress = instructions.codeAddressOf(saveIndex)
    val delegateAddress = instructions.codeAddressOf(returnIndex - 1)
    val tryBlock = implementation.tryBlocks.single()
    check(saveAddress in tryBlock.startCodeAddress until
        (tryBlock.startCodeAddress + tryBlock.codeUnitCount)
    ) {
        "$TARGET_DESCRIPTOR receiver save must remain inside the stock try region"
    }
    check(delegateAddress !in tryBlock.startCodeAddress until
        (tryBlock.startCodeAddress + tryBlock.codeUnitCount)
    ) {
        "$TARGET_DESCRIPTOR delegate must not run on the exceptional exit"
    }
    requireCompletedCaptureFingerprint()
}

private fun MutableMethod.validateStockControlFlow() {
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    val instructions = implementation.instructions
    val returnIndex = singleNormalReturnIndex(instructions)
    val throwIndices = instructions.indices.filter { index ->
        instructions[index].normalizedOpcode() == "THROW"
    }
    check(throwIndices.size == 1) {
        "$TARGET_DESCRIPTOR must retain exactly one catchall THROW"
    }
    val throwIndex = throwIndices.single()
    check(throwIndex == instructions.lastIndex && returnIndex < throwIndex) {
        "$TARGET_DESCRIPTOR must retain its normal return before the final catchall throw"
    }
    check(
        (instructions[throwIndex] as? OneRegisterInstruction)?.registerA ==
            STOCK_RECEIVER_REGISTER,
    ) {
        "$TARGET_DESCRIPTOR catchall must throw the original p0 register"
    }
    check(
        instructions.getOrNull(throwIndex - 2)?.normalizedOpcode() == "MOVE_EXCEPTION" &&
            (instructions[throwIndex - 2] as? OneRegisterInstruction)?.registerA ==
                STOCK_RECEIVER_REGISTER,
    ) {
        "$TARGET_DESCRIPTOR catchall handler must retain move-exception p0"
    }

    val superCalls = instructions.indices.filter { index ->
        instructions[index].methodDescriptor() == SUPER_ON_CREATE_DESCRIPTOR
    }
    check(superCalls.size == 1 && superCalls.single() < returnIndex) {
        "$TARGET_DESCRIPTOR must call InputMethodService.onCreate() before normal return"
    }

    val tryBlocks = implementation.tryBlocks
    check(tryBlocks.size == 1) {
        "$TARGET_DESCRIPTOR must retain exactly one catchall try block"
    }
    val handlers = tryBlocks.single().exceptionHandlers
    check(
        handlers.size == 1 &&
            handlers.single().exceptionType == null &&
            handlers.single().handlerCodeAddress ==
                instructions.codeAddressOf(throwIndex - 2),
    ) {
        "$TARGET_DESCRIPTOR must retain its exact catchall handler"
    }
}

private fun MutableMethod.singleNormalReturnIndex(instructions: List<Instruction>): Int {
    val returns = instructions.indices.filter { index ->
        instructions[index].normalizedOpcode() == "RETURN_VOID"
    }
    check(returns.size == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one normal RETURN_VOID"
    }
    return returns.single()
}

private fun receiverSaveInsertionIndex(instructions: List<Instruction>): Int {
    val savedRegisterAccesses = instructions.indices.filter { index ->
        SAVED_RECEIVER_REGISTER in instructions[index].mentionedRegisters()
    }
    check(savedRegisterAccesses.isNotEmpty()) {
        "$TARGET_DESCRIPTOR must use v$SAVED_RECEIVER_REGISTER before receiver save"
    }
    val lastAccess = savedRegisterAccesses.last()
    check(instructions[lastAccess].isExactLastSavedLocalUse()) {
        "$TARGET_DESCRIPTOR v$SAVED_RECEIVER_REGISTER liveness anchor drifted"
    }
    val insertionIndex = lastAccess + 1
    val firstP0Clobber = instructions.indices.firstOrNull { index ->
        instructions[index].definesRegister(STOCK_RECEIVER_REGISTER)
    } ?: error("$TARGET_DESCRIPTOR must retain its p0 clobber")
    check(insertionIndex < firstP0Clobber) {
        "$TARGET_DESCRIPTOR has no proven-dead local before p0 clobber"
    }
    return insertionIndex
}

private fun MutableMethod.requireCompletedCaptureFingerprint() {
    val actual = captureFingerprint()
    check(actual == PATCHED_FINGERPRINT || actual == RAW_PATCHED_FINGERPRINT) {
        "Stock body drift in $TARGET_DESCRIPTOR: $actual"
    }
}

private fun MutableMethod.requireStockCaptureFingerprint() {
    val actual = captureFingerprint()
    check(actual == STOCK_FINGERPRINT || actual == RAW_STOCK_FINGERPRINT) {
        "Stock body drift in $TARGET_DESCRIPTOR: $actual"
    }
}

private fun MutableMethod.captureFingerprint(): String {
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    val canonical = buildString {
        append(gboardStructuralFingerprint())
        append("\n--debug--\n")
        implementation.debugItems.forEach { item ->
            check(item is LineNumber) {
                "Unexpected debug item type ${item.javaClass.name} in $TARGET_DESCRIPTOR"
            }
            append(item.codeAddress).append(':').append(item.lineNumber).append('\n')
        }
    }
    return MessageDigest.getInstance("SHA-256")
        .digest(canonical.toByteArray(StandardCharsets.UTF_8))
        .joinToString("") { value -> "%02X".format(value) }
}

private fun List<Instruction>.codeAddressOf(index: Int): Int {
    check(index in indices)
    var address = 0
    for (current in 0 until index) {
        address += this[current].codeUnits
    }
    return address
}

private fun Instruction?.isExactCaptureDelegate(): Boolean =
    this?.normalizedOpcode() == "INVOKE_STATIC_RANGE" &&
        this.methodDescriptor() == CAPTURE_BOOTSTRAP_RUNTIME_DESCRIPTOR &&
        this is RegisterRangeInstruction &&
        startRegister == SAVED_RECEIVER_REGISTER &&
        registerCount == 1

private fun Instruction?.isExactReceiverSave(): Boolean =
    this?.normalizedOpcode() == "MOVE_OBJECT" &&
        this is TwoRegisterInstruction &&
        registerA == SAVED_RECEIVER_REGISTER &&
        registerB == STOCK_RECEIVER_REGISTER

private fun Instruction?.isExactLastSavedLocalUse(): Boolean =
    this?.normalizedOpcode() == "APUT_OBJECT" &&
        this is ThreeRegisterInstruction &&
        registerA == SAVED_RECEIVER_REGISTER &&
        registerB == 2 &&
        registerC == 6

private fun Instruction.mentionedRegisters(): Set<Int> = when (this) {
    is RegisterRangeInstruction ->
        (startRegister until startRegister + registerCount).toSet()
    is FiveRegisterInstruction -> listOf(
        registerC,
        registerD,
        registerE,
        registerF,
        registerG,
    ).take(registerCount).toSet()
    is ThreeRegisterInstruction -> setOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> setOf(registerA, registerB)
    is OneRegisterInstruction -> setOf(registerA)
    else -> emptySet()
}

private fun Instruction.definesRegister(register: Int): Boolean {
    val opcode = normalizedOpcode()
    return when (this) {
        is TwoRegisterInstruction ->
            registerA == register && (
                opcode.startsWith("MOVE_") ||
                    opcode.startsWith("MOVE_WIDE") ||
                    opcode.startsWith("MOVE_OBJECT")
                )
        is OneRegisterInstruction ->
            registerA == register && DESTINATION_REGISTER_PREFIXES.any(opcode::startsWith)
        else -> false
    }
}

private fun Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

private fun Instruction.normalizedOpcode(): String =
    opcode.name.uppercase().replace('-', '_').replace('/', '_')

private const val RECEIVER_SAVE = "move-object v4, p0"
private const val CAPTURE_BOOTSTRAP_DELEGATE =
    "invoke-static/range {v4 .. v4}, $CAPTURE_BOOTSTRAP_RUNTIME_DESCRIPTOR"

private val DESTINATION_REGISTER_PREFIXES = listOf(
    "CONST",
    "IGET",
    "MOVE_EXCEPTION",
    "MOVE_RESULT",
    "NEW_INSTANCE",
    "SGET",
)
