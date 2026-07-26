package dev.jason.gboardpatches.patches.gboard.features.settingshomepage

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.debug.DebugItem
import com.android.tools.smali.dexlib2.iface.debug.LineNumber
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.nio.charset.StandardCharsets
import java.security.MessageDigest

private const val SETTINGS_ACTIVITY_CLASS =
    "Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;"
private const val SETTINGS_HOMEPAGE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/settingshomepage/GboardSettingsHomepageRuntime;"
private const val SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR =
    "$SETTINGS_HOMEPAGE_RUNTIME_CLASS->applySettingsHomepagePolicy(Ljava/lang/Object;)V"
private const val TARGET_METHOD_NAME = "onCreate"
private val TARGET_PARAMETER_TYPES = listOf("Landroid/os/Bundle;")
private const val TARGET_RETURN_TYPE = "V"
private const val TARGET_DESCRIPTOR =
    "$SETTINGS_ACTIVITY_CLASS->onCreate(Landroid/os/Bundle;)V"
private const val STOCK_REGISTER_COUNT = 7
private const val STOCK_RECEIVER_REGISTER = 5
private const val DELEGATE_CODE_UNITS = 3
private const val STOCK_FINGERPRINT =
    "8CB27C26236FD0F440ED441C10E743B704DE3014019293D4D07F3FE895D84BF2"
private val TARGET_ACCESS_FLAGS = AccessFlags.PROTECTED.value or AccessFlags.FINAL.value

internal val gboardSettingsHomepageBytecodePatch = bytecodePatch(
    description = "允許覆蓋 Gboard 設定頁新舊版樣式選擇"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val target = selectSettingsActivityOnCreate(
            mutableClass(SETTINGS_ACTIVITY_CLASS).methods.toList(),
        )
        target.applySettingsHomepageOverride()
    }
}

internal fun selectSettingsActivityOnCreate(methods: List<MutableMethod>): MutableMethod {
    val matches = methods.filter { method ->
        method.definingClass == SETTINGS_ACTIVITY_CLASS &&
            method.name == TARGET_METHOD_NAME &&
            method.parameterTypes == TARGET_PARAMETER_TYPES &&
            method.returnType == TARGET_RETURN_TYPE &&
            method.accessFlags == TARGET_ACCESS_FLAGS
    }
    check(matches.size == 1) {
        "Expected exactly one protected final instance void $TARGET_DESCRIPTOR target"
    }
    return matches.single()
}

internal fun MutableMethod.applySettingsHomepageOverride(): MutableMethod {
    requireExactTarget()
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    val instructions = implementation.instructions
    val runtimeReferences = instructions.filter { instruction ->
        instruction.methodDescriptor()?.startsWith("$SETTINGS_HOMEPAGE_RUNTIME_CLASS->") == true
    }
    if (runtimeReferences.isNotEmpty()) {
        check(runtimeReferences.size == 1 &&
            runtimeReferences.single().methodDescriptor() == SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR
        ) {
            "$TARGET_DESCRIPTOR contains an orphan or duplicate Settings Homepage delegate"
        }
        validateCompletedPatch()
        return this
    }

    validateStockBody()
    addInstructions(0, "invoke-static {p0}, $SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR")
    validateCompletedPatch()
    return this
}

private fun MutableMethod.requireExactTarget() {
    check(
        definingClass == SETTINGS_ACTIVITY_CLASS &&
            name == TARGET_METHOD_NAME &&
            parameterTypes == TARGET_PARAMETER_TYPES &&
            returnType == TARGET_RETURN_TYPE &&
            accessFlags == TARGET_ACCESS_FLAGS,
    ) {
        "Refusing non-target Settings Homepage method " +
            definingClass + "->" + name + "(" + parameterTypes.joinToString("") + ")" +
            returnType
    }
}

private fun MutableMethod.validateStockBody() {
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    check(implementation.registerCount == STOCK_REGISTER_COUNT) {
        "Unexpected register count in $TARGET_DESCRIPTOR: ${implementation.registerCount}"
    }
    check(implementation.tryBlocks.isEmpty()) {
        "Unexpected try blocks in exact $TARGET_DESCRIPTOR"
    }
    val instructions = implementation.instructions
    check(instructions.none { instruction ->
        instruction.methodDescriptor()?.startsWith("$SETTINGS_HOMEPAGE_RUNTIME_CLASS->") == true
    }) {
        "$TARGET_DESCRIPTOR contains an orphan Settings Homepage delegate"
    }
    validateControlFlow(instructions)
    requireStockFingerprint(instructions, implementation.debugItems, addressShift = 0)
}

private fun MutableMethod.validateCompletedPatch() {
    requireExactTarget()
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    check(implementation.registerCount == STOCK_REGISTER_COUNT)
    check(implementation.tryBlocks.isEmpty())
    val instructions = implementation.instructions
    check(instructions.firstOrNull().isExactEntryDelegate()) {
        "$TARGET_DESCRIPTOR entry delegate is missing, misplaced, or malformed"
    }
    check(instructions.count { instruction ->
        instruction.methodDescriptor() == SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR
    } == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one Settings Homepage delegate"
    }
    check(instructions.count { instruction ->
        instruction.methodDescriptor()?.startsWith("$SETTINGS_HOMEPAGE_RUNTIME_CLASS->") == true
    } == 1) {
        "$TARGET_DESCRIPTOR contains an orphan Settings Homepage runtime reference"
    }

    val stockInstructions = instructions.drop(1)
    validateControlFlow(stockInstructions)
    requireStockFingerprint(
        stockInstructions,
        implementation.debugItems,
        addressShift = DELEGATE_CODE_UNITS,
    )
}

private fun validateControlFlow(instructions: List<Instruction>) {
    check(instructions.firstOrNull()?.methodDescriptor() ==
        "$SETTINGS_ACTIVITY_CLASS->getIntent()Landroid/content/Intent;"
    ) {
        "$TARGET_DESCRIPTOR must retain getIntent as its first stock instruction"
    }
    check(instructions.count { instruction ->
        instruction.methodDescriptor() == "Lepu;->onCreate(Landroid/os/Bundle;)V"
    } == 1) {
        "$TARGET_DESCRIPTOR must retain its exact super onCreate call"
    }
    val returns = instructions.indices.filter { index ->
        instructions[index].normalizedOpcode() == "RETURN_VOID"
    }
    check(returns == listOf(instructions.lastIndex)) {
        "$TARGET_DESCRIPTOR must retain its single final RETURN_VOID"
    }
}

private fun requireStockFingerprint(
    instructions: List<Instruction>,
    debugItems: Iterable<DebugItem>,
    addressShift: Int,
) {
    val fingerprint = stockFingerprint(instructions, debugItems, addressShift)
    check(fingerprint == STOCK_FINGERPRINT) {
        "Stock body drift in $TARGET_DESCRIPTOR: $fingerprint"
    }
}

private fun stockFingerprint(
    instructions: List<Instruction>,
    debugItems: Iterable<DebugItem>,
    addressShift: Int,
): String {
    val canonical = buildString {
        instructions.forEach { instruction ->
            append(instruction.semanticShape()).append('\n')
        }
        append("--debug--\n")
        debugItems.forEach { item ->
            check(item is LineNumber) {
                "Unexpected debug item type ${item.javaClass.name} in $TARGET_DESCRIPTOR"
            }
            append(item.codeAddress - addressShift)
                .append(':')
                .append(item.lineNumber)
                .append('\n')
        }
    }
    return MessageDigest.getInstance("SHA-256")
        .digest(canonical.toByteArray(StandardCharsets.UTF_8))
        .joinToString("") { value -> "%02X".format(value) }
}

private fun Instruction.semanticShape(): String = buildString {
    append(normalizedOpcode())
    when (this@semanticShape) {
        is FiveRegisterInstruction -> append("|5=")
            .append(registerCount).append(',').append(registerC).append(',')
            .append(registerD).append(',').append(registerE).append(',')
            .append(registerF).append(',').append(registerG)
        is RegisterRangeInstruction -> append("|range=")
            .append(startRegister).append(',').append(registerCount)
        is ThreeRegisterInstruction -> append("|3=")
            .append(registerA).append(',').append(registerB).append(',').append(registerC)
        is TwoRegisterInstruction -> append("|2=")
            .append(registerA).append(',').append(registerB)
        is OneRegisterInstruction -> append("|1=").append(registerA)
    }
    if (this@semanticShape is ReferenceInstruction) {
        append("|ref=").append(reference)
    }
    if (this@semanticShape is WideLiteralInstruction) {
        append("|wide=").append(wideLiteral)
    } else if (this@semanticShape is NarrowLiteralInstruction) {
        append("|narrow=").append(narrowLiteral)
    }
    if (this@semanticShape is OffsetInstruction) {
        append("|offset=").append(codeOffset)
    }
}

private fun Instruction?.isExactEntryDelegate(): Boolean =
    this?.normalizedOpcode() == "INVOKE_STATIC" &&
        this.methodDescriptor() == SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR &&
        this is FiveRegisterInstruction &&
        registerCount == 1 &&
        registerC == STOCK_RECEIVER_REGISTER

private fun Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

private fun Instruction.normalizedOpcode(): String =
    opcode.name.uppercase().replace('-', '_').replace('/', '_')
