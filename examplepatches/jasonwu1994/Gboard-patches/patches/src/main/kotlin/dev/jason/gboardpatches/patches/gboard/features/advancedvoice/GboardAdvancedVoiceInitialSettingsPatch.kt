package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val INITIAL_SETTINGS_RUNTIME_DESCRIPTOR =
    "$ADVANCED_VOICE_RUNTIME_CLASS->afterInitialVoiceSettings(Landroid/content/Context;Ljava/lang/Object;)V"

internal val ADVANCED_VOICE_INITIAL_SETTINGS_DELEGATE = """
    invoke-static {p0, p1}, $INITIAL_SETTINGS_RUNTIME_DESCRIPTOR
""".trimIndent()

internal val gboardAdvancedVoiceInitialSettingsPatch = bytecodePatch(
    description = "在 17.7.7 official Voice settings 初始化後修復 NgaState INITIAL rows。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardAdvancedVoice1777Bindings.initialVoiceSettings,
        )
        val patchedMethod = method.applyAdvancedVoiceInitialSettingsDelegate()
        if (patchedMethod !== method) {
            val methods = mutableClass(
                GboardAdvancedVoice1777Bindings.initialVoiceSettings.classType,
            ).methods
            check(methods.remove(method) && methods.add(patchedMethod)) {
                "Could not replace expanded Advanced Voice initial settings method"
            }
        }
    }
}

internal fun MutableMethod.applyAdvancedVoiceInitialSettingsDelegate(): MutableMethod {
    val implementation = implementation ?: error(
        "Advanced Voice initial settings target has no implementation",
    )
    if (implementation.registerCount == INITIAL_SETTINGS_PATCHED_REGISTER_COUNT) {
        val actual = gboardStructuralFingerprint()
        check(actual == GboardAdvancedVoice1777Bindings.initialVoiceSettingsPatchedFingerprint) {
            "Malformed Advanced Voice initial settings state: $actual"
        }
        validateAdvancedVoiceInitialSettingsDelegate()
        return this
    }
    val stockFingerprint = gboardStructuralFingerprint()
    check(
        implementation.registerCount == INITIAL_SETTINGS_STOCK_REGISTER_COUNT &&
            stockFingerprint ==
            GboardAdvancedVoice1777Bindings.initialVoiceSettingsStockFingerprint,
    ) {
        "Stock body drift in " +
            "${GboardAdvancedVoice1777Bindings.initialVoiceSettings.descriptor()}: " +
            stockFingerprint
    }

    val expanded = expandAdvancedVoiceInitialSettingsRegisters()
    expanded.addInstructions(0, INITIAL_SETTINGS_ENTRY_PARAMETER_COPIES)
    expanded.injectAdvancedVoiceBeforeReturns(
        INITIAL_SETTINGS_RUNTIME_DESCRIPTOR,
        ADVANCED_VOICE_INITIAL_SETTINGS_DELEGATE,
    )
    val patchedFingerprint = expanded.gboardStructuralFingerprint()
    check(
        patchedFingerprint ==
            GboardAdvancedVoice1777Bindings.initialVoiceSettingsPatchedFingerprint,
    ) {
        "Unexpected Advanced Voice initial settings shape: $patchedFingerprint"
    }
    expanded.validateAdvancedVoiceInitialSettingsDelegate()
    return expanded
}

private fun MutableMethod.expandAdvancedVoiceInitialSettingsRegisters(): MutableMethod {
    val stock = implementation ?: error(
        "Advanced Voice initial settings target has no implementation",
    )
    return ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        ImmutableMethodImplementation(
            INITIAL_SETTINGS_PATCHED_REGISTER_COUNT,
            stock.instructions,
            stock.tryBlocks,
            stock.debugItems,
        ),
    ).toMutable()
}

private fun MutableMethod.validateAdvancedVoiceInitialSettingsDelegate() {
    val implementation = implementation ?: error(
        "Advanced Voice initial settings target has no implementation",
    )
    check(implementation.registerCount == INITIAL_SETTINGS_PATCHED_REGISTER_COUNT)
    val instructions = implementation.instructions
    check(
        instructions.getOrNull(0).isExactMoveObject(
            INITIAL_SETTINGS_LEGACY_P0_REGISTER,
            INITIAL_SETTINGS_PATCHED_P0_REGISTER,
        ) &&
            instructions.getOrNull(1).isExactMoveObject(
                INITIAL_SETTINGS_LEGACY_P1_REGISTER,
                INITIAL_SETTINGS_PATCHED_P1_REGISTER,
            ),
    ) {
        "Advanced Voice initial settings parameter copies are missing or malformed"
    }
    val returns = returnInstructionIndices().filter {
        instructions[it].opcode == Opcode.RETURN_VOID
    }
    check(returns.size == 1) {
        "Advanced Voice initial settings target must have one RETURN_VOID"
    }
    val runtimeInvoke = instructions.getOrNull(returns.single() - 1)
    check(
        runtimeInvoke is FiveRegisterInstruction &&
            runtimeInvoke.methodDescriptor() == INITIAL_SETTINGS_RUNTIME_DESCRIPTOR &&
            runtimeInvoke.registerCount == 2 &&
            runtimeInvoke.registerC == INITIAL_SETTINGS_PATCHED_P0_REGISTER &&
            runtimeInvoke.registerD == INITIAL_SETTINGS_PATCHED_P1_REGISTER,
    ) {
        "Advanced Voice initial settings return delegate is missing or malformed"
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactMoveObject(
    destination: Int,
    source: Int,
): Boolean =
    this is TwoRegisterInstruction &&
        opcode == Opcode.MOVE_OBJECT_FROM16 &&
        registerA == destination &&
        registerB == source

private val INITIAL_SETTINGS_ENTRY_PARAMETER_COPIES = """
    move-object/from16 v$INITIAL_SETTINGS_LEGACY_P0_REGISTER, p0
    move-object/from16 v$INITIAL_SETTINGS_LEGACY_P1_REGISTER, p1
""".trimIndent()

private const val INITIAL_SETTINGS_STOCK_REGISTER_COUNT = 11
private const val INITIAL_SETTINGS_PATCHED_REGISTER_COUNT = 13
private const val INITIAL_SETTINGS_LEGACY_P0_REGISTER = 9
private const val INITIAL_SETTINGS_LEGACY_P1_REGISTER = 10
private const val INITIAL_SETTINGS_PATCHED_P0_REGISTER = 11
private const val INITIAL_SETTINGS_PATCHED_P1_REGISTER = 12
