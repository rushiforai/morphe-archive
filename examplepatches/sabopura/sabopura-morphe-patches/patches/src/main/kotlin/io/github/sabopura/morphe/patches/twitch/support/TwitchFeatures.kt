package io.github.sabopura.morphe.patches.twitch.support

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.PATCHES_VERSION
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED

internal const val TWITCH_EXTENSION = "extensions/twitch.mpe"
private const val FEATURES = "Lio/github/sabopura/morphe/extension/twitch/ui/Features;"
private const val FEATURE_ENUM = "Lio/github/sabopura/morphe/extension/twitch/ui/Feature;"

/** Adds [feature] to the list the shared settings and menu read. An unknown name fails the patch. */
internal fun BytecodePatchContext.enableTwitchFeature(feature: String) {
    val known = classDefBy(FEATURE_ENUM).fields.filter { AccessFlags.ENUM.isSet(it.accessFlags) }.map { it.name }
    if (feature !in known) throw PatchException("Unknown Twitch feature: $feature")
    Fingerprint(definingClass = FEATURES, name = "appliedNames").method.apply {
        val index = implementation!!.instructions.toList().indexOfFirst { it.opcode == Opcode.CONST_STRING }
        check(index >= 0) { "Twitch feature list constant missing" }
        val current = (getInstruction<ReferenceInstruction>(index).reference as StringReference).string
        val names = (current.split(",").filter { it.isNotEmpty() } + feature).distinct().joinToString(",")
        replaceInstruction(index, "const-string v${getInstruction<OneRegisterInstruction>(index).registerA}, \"$names\"")
    }
    stampPatchVersion()
}

/** Writes this bundle's version into the extension, for the About page and the diagnostics text. */
private fun BytecodePatchContext.stampPatchVersion() {
    Fingerprint(definingClass = FEATURES, name = "patchVersion").method.apply {
        val index = implementation!!.instructions.toList().indexOfFirst { it.opcode == Opcode.CONST_STRING }
        check(index >= 0) { "Twitch patch version constant missing" }
        replaceInstruction(
            index,
            "const-string v${getInstruction<OneRegisterInstruction>(index).registerA}, \"$PATCHES_VERSION\"",
        )
    }
}

/** A patch the user can select. It marks [feature] as applied so its settings appear. */
internal fun twitchFeaturePatch(
    name: String,
    description: String,
    feature: String,
    vararg dependencies: Patch<*>,
    default: Boolean = true,
    compatibility: Compatibility = TWITCH_SUPPORTED,
    block: BytecodePatchBuilder.() -> Unit = {},
) = bytecodePatch(name = name, description = description, default = default) {
    compatibleWith(compatibility)
    dependsOn(*dependencies)
    extendWith(TWITCH_EXTENSION)
    block()
    finalize { enableTwitchFeature(feature) }
}

/** A bridge body returning [field] of the object passed in. */
internal fun fieldBridge(field: FieldReference) = """
    check-cast p0, ${field.definingClass}
    iget-object p0, p0, $field
    return-object p0
"""

/** Replaces an extension stub method with code generated from this APK. */
internal fun BytecodePatchContext.replaceBridge(bridgeClass: String, method: String, smali: String) {
    mutableClassDefBy(bridgeClass).methods.single { it.name == method }.apply {
        removeInstructions(0, implementation!!.instructions.count())
        addInstructions(0, smali)
    }
}

/** Extension code can only read public fields of Twitch's classes. */
internal fun BytecodePatchContext.requirePublicField(reference: FieldReference, label: String) {
    val field = classDefBy(reference.definingClass).fields.filter { it.name == reference.name && it.type == reference.type }
        .uniqueContract("$label field ${reference.name}")
    if (!AccessFlags.PUBLIC.isSet(field.accessFlags)) throw PatchException("$label: inaccessible field ${reference.name}")
}

/**
 * Runs a hook that only adds convenience. If Twitch moved its target the rest of the patch still
 * applies, and the log line lets release validation fail on it.
 */
internal fun softHook(label: String, hook: () -> Unit) {
    try {
        hook()
    } catch (failure: PatchException) {
        // Standard error reaches the patcher's log file, which release validation scans.
        System.err.println("OPTIONAL HOOK FAILED: $label: ${failure.message}")
    }
}

/**
 * Inserts code before the instruction at [index] so that branches into that instruction run the
 * new code too: the instruction is copied after the new code and the original removed, which
 * moves its labels onto the first inserted instruction. (Same technique as bakwudo/uyu.)
 */
internal fun MutableMethod.insertBeforeKeepingLabels(index: Int, smali: String, vararg externalLabels: ExternalLabel) {
    addInstruction(index + 1, getInstruction(index))
    addInstructionsWithLabels(index + 1, smali, *externalLabels)
    removeInstruction(index)
}
