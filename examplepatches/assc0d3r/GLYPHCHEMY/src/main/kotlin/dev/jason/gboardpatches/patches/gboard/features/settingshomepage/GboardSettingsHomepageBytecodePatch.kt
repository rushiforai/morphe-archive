package dev.jason.gboardpatches.patches.gboard.features.settingshomepage

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.gboardCompatibility18_8
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReferenceInClass
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val SETTINGS_HOMEPAGE_RUNTIME_CALL =
    RuntimeCallId.SETTINGS_HOMEPAGE_RUNTIME_APPLY_SETTINGS_HOMEPAGE_POLICY
private val SETTINGS_HOMEPAGE_RUNTIME_ABI = RuntimeAbiCatalog.abi(SETTINGS_HOMEPAGE_RUNTIME_CALL)
private val SETTINGS_HOMEPAGE_RUNTIME_CLASS = SETTINGS_HOMEPAGE_RUNTIME_ABI.owner
private val SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR = SETTINGS_HOMEPAGE_RUNTIME_ABI.reference
private const val TARGET_METHOD_NAME = "onCreate"
private const val STOCK_REGISTER_COUNT = 7
private const val STOCK_RECEIVER_REGISTER = 5

internal val gboardSettingsHomepageBytecodePatch = bytecodePatch(
    description = "允許覆蓋 Gboard 設定頁新舊版樣式選擇"
) {
    compatibleWith(gboardCompatibility18_8())

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val targets = settingsHomepageTargets(this)
        val target = selectSettingsActivityOnCreate(
            mutableClass(targets.activity.ownerDescriptor).methods.toList(),
            targets,
        )
        target.applySettingsHomepageOverride(targets)
    }
}

internal fun selectSettingsActivityOnCreate(
    methods: List<MutableMethod>,
    targets: SettingsHomepageTargets,
): MutableMethod {
    val matches = methods.filter { method ->
        targets.activity.matches(method) &&
            method.accessFlags == targets.accessFlags
    }
    check(matches.size == 1) {
        "Expected exactly one ${targets.activity.reference} target with access flags " +
            "0x${Integer.toHexString(targets.accessFlags)}"
    }
    return matches.single()
}

internal fun MutableMethod.applySettingsHomepageOverride(
    targets: SettingsHomepageTargets,
): MutableMethod {
    requireExactTarget(targets)
    return applyVerified(
        VerifiedTransformationPlan(
            targetName = targets.activity.reference,
            classify = { method -> method.classifySettingsHomepageOverride(targets) },
            mutate = { method ->
                method.addInstructions(
                    0,
                    RuntimeCallEmitter.invoke(SETTINGS_HOMEPAGE_RUNTIME_CALL, "p0"),
                )
                method
            },
        ),
    )
}

private fun MutableMethod.classifySettingsHomepageOverride(
    targets: SettingsHomepageTargets,
): VerifiedTransformationState {
    val instructions = implementation?.instructions
        ?: error("No instructions in ${targets.activity.reference}")
    val runtimeReferences = instructions.filter { instruction ->
        instruction.isMethodReferenceInClass(SETTINGS_HOMEPAGE_RUNTIME_CLASS)
    }
    return when {
        runtimeReferences.isEmpty() -> {
            validateStockBody(targets)
            VerifiedTransformationState.STOCK
        }
        runtimeReferences.size == 1 &&
            runtimeReferences.single().isMethodReference(
                SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR,
            ) -> {
            validateCompletedPatch(targets)
            VerifiedTransformationState.PATCHED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private fun MutableMethod.requireExactTarget(targets: SettingsHomepageTargets) {
    check(
        definingClass == targets.activity.ownerDescriptor &&
            name == targets.activity.name &&
            parameterTypes.map(CharSequence::toString) == targets.activity.parameterTypes &&
            returnType == targets.activity.returnType &&
            accessFlags == targets.accessFlags,
    ) {
        "Refusing non-target Settings Homepage method " +
            definingClass + "->" + name + "(" + parameterTypes.joinToString("") + ")" +
            returnType + " flags=0x" + Integer.toHexString(accessFlags)
    }
}

private fun MutableMethod.validateStockBody(targets: SettingsHomepageTargets) {
    val implementation = implementation
        ?: error("No instructions in ${targets.activity.reference}")
    check(implementation.registerCount == STOCK_REGISTER_COUNT) {
        "Unexpected register count in ${targets.activity.reference}: " +
            "${implementation.registerCount}"
    }
    check(implementation.tryBlocks.isEmpty()) {
        "Unexpected try blocks in exact ${targets.activity.reference}"
    }
    val instructions = implementation.instructions
    check(instructions.none { instruction ->
        instruction.isMethodReferenceInClass(SETTINGS_HOMEPAGE_RUNTIME_CLASS)
    }) {
        "${targets.activity.reference} contains an orphan Settings Homepage delegate"
    }
    validateControlFlow(instructions, targets)
}

private fun MutableMethod.validateCompletedPatch(targets: SettingsHomepageTargets) {
    requireExactTarget(targets)
    val implementation = implementation
        ?: error("No instructions in ${targets.activity.reference}")
    check(implementation.registerCount == STOCK_REGISTER_COUNT)
    check(implementation.tryBlocks.isEmpty())
    val instructions = implementation.instructions
    check(instructions.firstOrNull().isExactEntryDelegate()) {
        "${targets.activity.reference} entry delegate is missing, misplaced, or malformed"
    }
    check(instructions.count { instruction ->
        instruction.isMethodReference(SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR)
    } == 1) {
        "${targets.activity.reference} must contain exactly one Settings Homepage delegate"
    }
    check(instructions.count { instruction ->
        instruction.isMethodReferenceInClass(SETTINGS_HOMEPAGE_RUNTIME_CLASS)
    } == 1) {
        "${targets.activity.reference} contains an orphan Settings Homepage runtime reference"
    }

    val stockInstructions = instructions.drop(1)
    validateControlFlow(stockInstructions, targets)
}

private fun validateControlFlow(
    instructions: List<Instruction>,
    targets: SettingsHomepageTargets,
) {
    check(instructions.firstOrNull()?.isMethodReference(
        "${targets.activity.ownerDescriptor}->getIntent()Landroid/content/Intent;",
    ) == true) {
        "${targets.activity.reference} must retain getIntent as its first stock instruction"
    }
    // The superclass (and therefore its obfuscated name) changes between Gboard builds, so the
    // stock shape is pinned as "exactly one super.onCreate(Bundle) call" instead of one class name.
    check(instructions.count { instruction -> instruction.isSuperOnCreateCall() } == 1) {
        "${targets.activity.reference} must retain its exact super onCreate call"
    }
    val returns = instructions.indices.filter { index ->
        instructions[index].isOpcode("RETURN_VOID")
    }
    check(returns == listOf(instructions.lastIndex)) {
        "${targets.activity.reference} must retain its single final RETURN_VOID"
    }
}

private fun Instruction?.isExactEntryDelegate(): Boolean =
    this?.isInvoke(
        "INVOKE_STATIC",
        SETTINGS_HOMEPAGE_RUNTIME_DESCRIPTOR,
        STOCK_RECEIVER_REGISTER,
    ) == true

private fun Instruction.isSuperOnCreateCall(): Boolean {
    if (!opcode.name.replace('-', '_').uppercase().startsWith("INVOKE_SUPER")) return false
    val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return method.name == "onCreate" &&
        method.returnType.toString() == "V" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
}
