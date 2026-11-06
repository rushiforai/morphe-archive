package app.onlynazril.patches.tiktok.amoled

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.findMutableMethodOf
import app.onlynazril.patches.shared.Constants
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/**
 * Opaque dark surface colours that appear as constants in code rather than as resources.
 *
 * Compose colour schemes and a few hand-built views carry their surface as a literal. The values
 * are the same ones [AMOLED] maps in resources, restricted to opaque colours so a random integer
 * that happens to be small is not mistaken for one.
 */
private val DARK_LITERALS = setOf(
    0xFF121212L,
    0xFF161616L,
    0xFF161823L,
    0xFF1A1A1AL,
    0xFF1B1B1BL,
    0xFF1C1C1CL,
    0xFF1E1E1EL,
    0xFF202020L,
    0xFF212121L,
    0xFF222222L,
    0xFF252525L,
    0xFF262626L,
    0xFF282828L,
    0xFF2C2C2CL,
    0xFF2E2E2EL,
    0xFF303030L,
    0xFF333333L,
    0xFF3A3A3AL,
    0xFF404040L,
    0xFF454545L,
    0xFF545454L,
)

/** A 32-bit colour constant. */
private fun isDarkNarrow(instruction: Instruction): Boolean {
    val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral ?: return false
    return literal.toLong().and(0xFFFFFFFFL) in DARK_LITERALS
}

/**
 * A Compose `Color`, which is a long with the sRGB colour in the low 32 bits and a zero colour
 * space above it. Missing this is why the Notes bar stayed gray after the 32-bit pass.
 */
private fun isDarkWide(instruction: Instruction): Boolean {
    val literal = (instruction as? WideLiteralInstruction)?.wideLiteral ?: return false
    if (literal ushr 32 != 0L) return false
    return (literal and 0xFFFFFFFFL) in DARK_LITERALS
}

/**
 * Replaces those constants with black in every method that carries one.
 *
 * The resource patch reaches colours the app looks up by name. A Compose `Color(0xFF1E1E1E)`,
 * or a view that builds its background from a literal, never passes through the resource table,
 * which is why the Notes composer kept a gray bar after the resource pass. The register and the
 * instruction are reused; only the literal changes.
 */
@Suppress("unused")
val amoledCodePatch = bytecodePatch(
    name = "AMOLED code colours",
    description = "Replaces opaque dark surface colours held as constants in code with black. " +
        "Pulled in by AMOLED theme; does nothing for resources.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_TIKTOK)

    execute {
        var changed = 0
        classDefForEach { classDef ->
            // Only a class that actually carries one of the literals is made mutable. Converting
            // every class and method first was what made the pass crawl.
            val hits = classDef.methods.mapNotNull { method ->
                val instructions = method.implementation?.instructions ?: return@mapNotNull null
                val indices = instructions.withIndex().mapNotNull { (index, instruction) ->
                    if (isDarkNarrow(instruction) || isDarkWide(instruction)) index else null
                }
                if (indices.isEmpty()) null else method to indices
            }
            if (hits.isEmpty()) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef.type)
            hits.forEach { (method, indices) ->
                val mutable = mutableClass.findMutableMethodOf(method)
                indices.asReversed().forEach { index ->
                    val instruction = method.implementation!!.instructions.elementAt(index)
                    val register = (instruction as OneRegisterInstruction).registerA
                    val replacement = if (isDarkWide(instruction)) {
                        // Compose Color is a long: the colour is the low 32 bits.
                        "const-wide v$register, 0x0"
                    } else {
                        "const v$register, ${0xFF000000L.toInt()}"
                    }
                    mutable.replaceInstruction(index, replacement)
                    changed++
                }
            }
        }
        if (changed == 0) {
            throw PatchException("AMOLED: no dark colour constant was found in the dex files.")
        }
    }
}
