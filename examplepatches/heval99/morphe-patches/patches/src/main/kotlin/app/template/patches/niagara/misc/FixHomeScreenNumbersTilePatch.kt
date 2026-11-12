package app.template.patches.niagara.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NIAGARA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Niagara's Channels feature registers a diagnostic tip whose message is a fingerprint of the
 * channel widgets' concatenated `hashCode()` integers: hundreds of digits that the launcher shows
 * as a giant numbers tile on the home screen (seen in 1.16.35, also for Pro users).
 *
 * The tip type has a `canHandle(Tip)Z` handler that answers `true`, so the tile is always
 * accepted. The patch makes that handler answer `false`, so the tip is never shown. The handler
 * and the fingerprint builder that produces the message live in the same manager class, and
 * neither name is stable across R8 releases, so both are found by shape:
 *
 * - the builder is the only method that builds a `StringBuilder`, appends at least two `int`s and
 *   calls `Math.abs(int)` at least twice (it appends the widgets' hash codes);
 * - the handler is a two-instruction `const/4 1; return` Boolean method whose single parameter is
 *   the builder's first parameter (the tip type).
 *
 * Exactly one class must hold both; anything else fails the patch instead of hiding an unrelated
 * tip. Verified 2026-11-05 against 1.16.35 (versionCode 1641), where the manager is
 * `b/SW2hvp9pUKPwwbUGc7p`, the builder `qy3WTYmS4Jdr8PX6cXmVN` and the handler
 * `ebDxmR22bhI68maS9WEy4N9l(Tip)Z`.
 */
@Suppress("unused")
val fixHomeScreenNumbersTilePatch = bytecodePatch(
    name = "Fix home screen numbers tile",
    description = "Hides the Channels diagnostic tip that shows up as a tile of giant numbers.",
) {
    compatibleWith(COMPATIBILITY_NIAGARA)

    execute {
        val candidates = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            val builder = classDef.methods.firstOrNull { it.buildsHashCodeFingerprint() }
                ?: return@classDefForEach
            val handler = classDef.methods.firstOrNull {
                it.isConstantTrueReturn() && it.parameterTypes.singleOrNull() == builder.parameterTypes.firstOrNull()
            } ?: return@classDefForEach
            candidates.add(classDef to handler)
        }

        val (manager, handler) = candidates.singleOrNull() ?: throw PatchException(
            "expected one Channels tip manager with a hashCode fingerprint builder and a " +
                "constant-true Tip handler, found ${candidates.size}: " +
                candidates.joinToString { (classDef, method) -> "${classDef.type}->${method.name}" },
        )

        val mutableHandler = mutableClassDefBy(manager).methods.singleOrNull {
            it.name == handler.name && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == handler.parameterTypes.map(CharSequence::toString)
        } ?: throw PatchException("could not find ${manager.type}->${handler.name} in the mutable class")

        mutableHandler.returnEarly(false)
    }
}

/**
 * True for the method that builds the diagnostic message: an empty `StringBuilder`, at least two
 * `append(int)` calls and at least two `Math.abs(int)` calls (the hash codes are made
 * non-negative before they are appended).
 */
private fun Method.buildsHashCodeFingerprint(): Boolean {
    if (implementation == null) return false
    var emptyBuilders = 0
    var intAppends = 0
    var absCalls = 0
    for (instruction in implementation!!.instructions) {
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        when {
            reference.definingClass == "Ljava/lang/StringBuilder;" && reference.name == "<init>" &&
                reference.parameterTypes.isEmpty() -> emptyBuilders++

            reference.definingClass == "Ljava/lang/StringBuilder;" && reference.name == "append" &&
                reference.parameterTypes.singleOrNull() == "I" -> intAppends++

            reference.definingClass == "Ljava/lang/Math;" && reference.name == "abs" &&
                reference.parameterTypes.singleOrNull() == "I" -> absCalls++
        }
    }
    return emptyBuilders >= 1 && intAppends >= 2 && absCalls >= 2
}

/** True for a Boolean method whose whole body is `const/4 v0, 1; return v0`. */
private fun Method.isConstantTrueReturn(): Boolean {
    if (returnType != "Z") return false
    val instructions = implementation?.instructions?.toList() ?: return false
    if (instructions.size != 2) return false
    if (instructions[0].opcode != Opcode.CONST_4 || instructions[1].opcode != Opcode.RETURN) return false
    return (instructions[0] as NarrowLiteralInstruction).narrowLiteral == 1
}
