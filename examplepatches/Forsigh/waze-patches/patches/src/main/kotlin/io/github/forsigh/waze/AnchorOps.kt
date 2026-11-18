package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc

/**
 * Multi-version anchor resolution.
 *
 * Waze re-letters obfuscated classes between releases. 5.25.90.900 moved the welcome state from
 * g/w to g/v, the privacy state from g/q to g/p, the privacy consent impl from bg/b to bi/b, the
 * ND4C consent impl from az/a to ba/a, the age-state factory from b/k to b/l, and renamed
 * MoodManager.canSetMood to t() and refreshMoodsList to r() (dropping the Java isBaby() entirely -
 * the native is now read inline in p()).
 *
 * Each affected patch therefore declares one fingerprint per known shape and asks for the method
 * through [resolveAnchor], which returns the first candidate that binds.
 *
 * Order the candidates oldest-first. The anchor that is precise on the older builds must be tried
 * first: a stray namesake on a newer build (g/v exists on every build as *some* state) must never
 * shadow an intended match. On a build where the old shape no longer exists its match throws, the
 * throw is swallowed here, and the next candidate is tried.
 */

/** The first candidate fingerprint that binds on this build, or null when none do. */
internal fun BytecodePatchContext.boundMethodOrNull(vararg candidates: Fingerprint): MutableMethod? =
    candidates.firstNotNullOfOrNull { fingerprint ->
        try {
            fingerprint.method
        } catch (_: PatchException) {
            null
        }
    }

/** Like [boundMethodOrNull], but fails the patch with [label] when no candidate binds. */
internal fun BytecodePatchContext.resolveAnchor(
    label: String,
    vararg candidates: Fingerprint,
): MutableMethod = boundMethodOrNull(*candidates)
    ?: throw PatchException("$label: none of the ${candidates.size} known anchor shapes matched this build")

/**
 * The register holding the first declared parameter of an invoke.
 *
 * The first explicit parameter sits one slot past the receiver in both invoke forms: index 1 of a
 * five-register list, or `start + 1` of a range. Reads it off the instruction instead of hardcoding a
 * register, because a method that keeps its signature can still be rebuilt with its arguments moved
 * (5.27.4.900 passed a flag in v1, 5.27.90.900 passes the same flag in v0).
 */
internal fun firstParameterRegister(instruction: Instruction): Int? = when (instruction) {
    // 35c names its slots C..G, C being the receiver: the first declared parameter is D.
    is Instruction35c -> if (instruction.registerCount >= 2) instruction.registerD else null
    // 3rc is contiguous from startRegister, so the parameter is one slot past the receiver.
    is Instruction3rc -> if (instruction.registerCount >= 2) instruction.startRegister + 1 else null
    else -> null
}
