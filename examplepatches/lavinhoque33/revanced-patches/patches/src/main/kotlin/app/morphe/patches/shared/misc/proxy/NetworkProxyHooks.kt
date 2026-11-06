/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1823
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.shared.misc.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Hooks the Cronet engines so the extension can add the proxy and reuse the engines.
 *
 * @return False if this app version has no Cronet proxy API. Nothing is changed in that case.
 */
context(_: BytecodePatchContext)
internal fun hookCronetProxy(): Boolean {
    val usesProxyListInt = when {
        FromProxyListFingerprint.methodOrNull != null -> true
        FromProxyListLegacyFingerprint.methodOrNull != null -> false
        else -> return false
    }

    val hasProxyApi = SetProxyOptionsFingerprint.methodOrNull != null &&
            CreateHttpProxyFingerprint.methodOrNull != null
    if (!hasProxyApi) return false

    ExtensionUseProxyListIntFingerprint.method.returnEarly(usesProxyListInt)

    hookEngineBuilder()
    hookMainEngine()

    return true
}

/**
 * Adds the proxy before an engine is built, and registers every engine that is built.
 */
context(_: BytecodePatchContext)
private fun hookEngineBuilder() = BuildExperimentalFingerprint.method.apply {
    addInstruction(
        0,
        "invoke-static { p0 }, $EXTENSION_CLASS->applyProxyOptions($CRONET_BUILDER_CLASS)V"
    )

    addCallBeforeEachReturn("recordCronetEngine")
}

/**
 * Registers the engine the app uses for most of its own requests.
 */
context(_: BytecodePatchContext)
private fun hookMainEngine() = MainCronetEngineFingerprint.method.addCallBeforeEachReturn("setMainCronetEngine")

/**
 * Calls the extension with the returned engine. The call takes over the label of the return,
 * so branches that jump straight to the return also run it.
 */
private fun MutableMethod.addCallBeforeEachReturn(extensionMethodName: String) {
    findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA

        addInstructionsAtControlFlowLabel(
            index,
            "invoke-static/range { v$register .. v$register }, " +
                    "$EXTENSION_CLASS->$extensionMethodName($CRONET_ENGINE_CLASS)V"
        )
    }
}
