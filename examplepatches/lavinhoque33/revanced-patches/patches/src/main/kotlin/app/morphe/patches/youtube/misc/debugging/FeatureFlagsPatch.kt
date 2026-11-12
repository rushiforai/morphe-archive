/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * Modified by lavinhoque33, 2026-11-10.
 * https://github.com/MorpheApp/morphe-patches/pull/2638
 * https://github.com/MorpheApp/morphe-patches/pull/4416
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.youtube.misc.debugging

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.cloneParameters
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.youtube.utils.playservice.is_21_35_or_greater
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/EnableDebuggingPatch;"
private const val BOOLEAN_HOOK = "$EXTENSION_CLASS->isBooleanFeatureFlagEnabled(ZJ)Z"
private const val STRING_HOOK =
    "$EXTENSION_CLASS->isStringFeatureFlagEnabled(Ljava/lang/String;JLjava/lang/String;)Ljava/lang/String;"

private fun MutableMethod.firstLongParameterRegister(): Int {
    // Parameter types can be CharSequence objects that are not Strings.
    val types = parameterTypes.map { it.toString() }
    val longIndex = types.indexOf("J")
    check(longIndex >= 0) { "Method has no long parameter: $this" }

    return p0Register +
            (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) +
            types.take(longIndex).sumOf { if (it == "J" || it == "D") 2 else 1 }
}

context(_: BytecodePatchContext)
private fun overrideBooleanFeatureValue(fingerprint: Fingerprint) {
    fingerprint.method.cloneParameters().apply {
        val longParameter1 = firstLongParameterRegister()
        val longParameter2 = longParameter1 + 1

        findInstructionIndicesReversedOrThrow(Opcode.RETURN).forEach { index ->
            val register = getInstruction<OneRegisterInstruction>(index).registerA

            addInstructionsAtControlFlowLabel(
                index,
                """ 
                    invoke-static { v$register, v$longParameter1, v$longParameter2 }, $BOOLEAN_HOOK
                    move-result v$register
                """
            )
        }
    }
}

/**
 * @param hasDefaultParameter If the accessor has a default value parameter
 *                            after the flag. Accessors without one default to zero.
 */
context(_: BytecodePatchContext)
private fun overrideWideFeatureValue(
    fingerprint: Fingerprint,
    extensionMethod: String,
    hasDefaultParameter: Boolean = true
) {
    fingerprint.method.cloneParameters().apply {
        val longParameter = firstLongParameterRegister()
        val setDefaultValue = if (hasDefaultParameter) {
            "move-wide/from16 v4, v${longParameter + 2}"
        } else {
            "const-wide/16 v4, 0x0"
        }

        findInstructionIndicesReversedOrThrow(Opcode.RETURN_WIDE).forEach { index ->
            val register = getInstruction<OneRegisterInstruction>(index).registerA

            addInstructionsAtControlFlowLabel(
                index,
                """
                    move-wide/from16 v0, v$register
                    move-wide/from16 v2, v$longParameter
                    $setDefaultValue
                    invoke-static/range { v0 .. v5 }, $extensionMethod
                    move-result-wide v$register
                """
            )
        }
    }
}

/**
 * @param hasDefaultParameter If the accessor has a default value parameter
 *                            after the flag. Accessors without one default to an empty string.
 */
context(_: BytecodePatchContext)
private fun overrideStringFeatureValue(fingerprint: Fingerprint, hasDefaultParameter: Boolean = true) {
    fingerprint.method.cloneParameters().apply {
        val longParameter = firstLongParameterRegister()
        val setDefaultValue = if (hasDefaultParameter) {
            "move-object/from16 v3, v${longParameter + 2}"
        } else {
            "const-string v3, \"\""
        }

        findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
            val register = getInstruction<OneRegisterInstruction>(index).registerA

            addInstructionsAtControlFlowLabel(
                index,
                """
                    move-object/from16 v0, v$register
                    move-wide/from16 v1, v$longParameter
                    $setDefaultValue
                    invoke-static/range { v0 .. v3 }, $STRING_HOOK
                    move-result-object v$register
                """
            )
        }
    }
}

/** Missing accessors must not disable the existing debugging hooks. */
context(_: BytecodePatchContext)
private fun hookFlag(name: String, fingerprint: Fingerprint, hook: (Fingerprint) -> Unit): Boolean = try {
    // Resolve before changing the method, so a missing class or method is harmless.
    val method = fingerprint.method
    hook(fingerprint)
    printInfo("Feature flags: $name -> $method")
    true
} catch (exception: Exception) {
    printWarn("Feature flags: skipping $name: ${exception.message}")
    false
}

context(_: BytecodePatchContext)
internal fun hookFeatureFlags(): Boolean {
    val booleanHooked = hookFlag("boolean", ExperimentalBooleanFeatureFlagFingerprint) {
        overrideBooleanFeatureValue(it)
    }
    val doubleMethod = "$EXTENSION_CLASS->isDoubleFeatureFlagEnabled(DJD)D"
    val longMethod = "$EXTENSION_CLASS->isLongFeatureFlagEnabled(JJJ)J"

    hookFlag("double", ExperimentalDoubleFeatureFlagFingerprint) { overrideWideFeatureValue(it, doubleMethod) }
    hookFlag("long", ExperimentalLongFeatureFlagFingerprint) { overrideWideFeatureValue(it, longMethod) }
    hookFlag("string", ExperimentalStringFeatureFlagFingerprint) { overrideStringFeatureValue(it) }

    if (is_21_35_or_greater) {
        hookFlag("hot boolean", ExperimentalHotBooleanFeatureFlagFingerprint) { overrideBooleanFeatureValue(it) }
        hookFlag("hot double", ExperimentalHotDoubleFeatureFlagFingerprint) {
            overrideWideFeatureValue(it, doubleMethod, hasDefaultParameter = false)
        }
        hookFlag("hot long", ExperimentalHotLongFeatureFlagFingerprint) {
            overrideWideFeatureValue(it, longMethod, hasDefaultParameter = false)
        }
        hookFlag("hot string", ExperimentalHotStringFeatureFlagFingerprint) {
            overrideStringFeatureValue(it, hasDefaultParameter = false)
        }
    }

    hookFlag("bootstrap", BootstrapStoreReadFingerprint) { fingerprint ->
        fingerprint.method.cloneParameters().apply {
            val flagParameter = p0Register + 1
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_WIDE).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstructionsAtControlFlowLabel(
                    index,
                    """
                        move-wide/from16 v0, v$register
                        move/from16 v2, v$flagParameter
                        invoke-static/range { v0 .. v2 }, $EXTENSION_CLASS->isBootstrapFeatureFlagEnabled(JI)J
                        move-result-wide v$register
                    """
                )
            }
        }
    }

    return booleanHooked
}
