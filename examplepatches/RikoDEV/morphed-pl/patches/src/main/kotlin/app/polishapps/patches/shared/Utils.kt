package app.polishapps.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Builds a [Fingerprint] from a pinned declaration. */
internal fun methodFingerprint(
    definingClass: String,
    name: String,
    parameters: List<String> = emptyList(),
    returnType: String? = null,
) = Fingerprint(
    definingClass = definingClass,
    name = name,
    parameters = parameters,
    returnType = returnType,
)

/** A method declaration, used to pin targets whose obfuscated names differ per app version. */
internal data class MethodTarget(
    val definingClass: String,
    val name: String,
    val parameters: List<String> = emptyList(),
    val returnType: String? = null,
) {
    fun fingerprint() = methodFingerprint(definingClass, name, parameters, returnType)
}

/**
 * Picks the targets for the Yanosik version being patched.
 *
 * Obfuscated class and method names change on every release, so each patch keeps one set of targets
 * per supported version, keyed by version name. Fails clearly instead of matching a wrong class that
 * happens to reuse an old obfuscated name.
 */
internal fun <T> BytecodePatchContext.targetsFor(targetsByVersion: Map<String, T>): T {
    val version = packageMetadata.versionName
    return targetsByVersion[version] ?: throw PatchException(
        "Yanosik $version is not supported. Supported versions: ${targetsByVersion.keys.joinToString()}",
    )
}

/** Replaces the whole body of a method with [smali]. */
internal fun MutableMethod.replaceBody(smali: String) {
    removeInstructions(instructions.size)
    addInstructions(0, smali)
}

/**
 * Prepends [smali], which must end in a return, leaving the original code in place but unreachable.
 *
 * Use this instead of [replaceBody] for methods with `try` blocks or `synchronized` sections, because
 * removing every instruction would leave those blocks with empty ranges. [smali] may only use registers
 * the method already declares, and `invoke` forms need registers up to v15.
 */
internal fun MutableMethod.prependReturn(smali: String) {
    addInstructions(0, smali)
}

/**
 * Replaces every `instance-of vX, vY, <type>` with `const/4 vX, 0x1`,
 * mirroring the `force_premium` transform used by the manual smali patch.
 *
 * [MutableMethod.instructions] is a lazy view (`MutableMethodImplementation.getInstructions()`)
 * that re-runs `fixInstructions()` on every read after a mutation, which can change the method's
 * instruction count. Reading it again while replacing therefore invalidates the cached indices and
 * throws `IndexOutOfBoundsException`, so the list is snapshotted once and the replacements are
 * built directly (no smali compilation, so nothing triggers a fix-up mid-loop).
 */
internal fun MutableMethod.forceInstanceOfTrue(type: String) {
    val snapshot = instructions.toList()

    val targets = snapshot.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode != Opcode.INSTANCE_OF) return@mapIndexedNotNull null
        val typed = instruction as? BuilderInstruction22c ?: return@mapIndexedNotNull null
        val reference = typed.reference as? TypeReference ?: return@mapIndexedNotNull null
        if (reference.type != type) return@mapIndexedNotNull null
        index to typed.registerA
    }

    if (targets.isEmpty()) {
        throw PatchException("No `instance-of $type` found in $definingClass->$name")
    }

    targets.forEach { (index, register) ->
        replaceInstruction(index, BuilderInstruction11n(Opcode.CONST_4, register, 1))
    }
}
