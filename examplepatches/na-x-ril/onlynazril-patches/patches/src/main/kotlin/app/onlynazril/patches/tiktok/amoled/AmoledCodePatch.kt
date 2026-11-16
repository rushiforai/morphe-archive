package app.onlynazril.patches.tiktok.amoled

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.findMutableMethodOf
import app.onlynazril.patches.shared.Constants
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/**
 * Opaque dark surface colors that appear as constants in code rather than as resources.
 *
 * Compose color schemes and a few hand-built views carry their surface as a literal. The values
 * are the same ones [AMOLED] maps in resources, restricted to opaque colors so a random integer
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
    return literal ushr 32 == 0L && (literal and 0xFFFFFFFFL) in DARK_LITERALS
}

/**
 * The methods that hold one of the dark colours above.
 *
 * A 32-bit colour reaches dex in one of two encodings: a narrow `const` sign-extends it to 64
 * bits, while a Compose `Color` uses a wide `const-wide` with the 32-bit value itself. Both
 * encodings of every colour are declared, so the patcher's literal index names the handful of
 * methods to inspect instead of the pass walking every class and every method in the bundle.
 */
private val DarkLiteralFingerprint = Fingerprint(
    filters = listOf(
        anyInstruction(
            *DARK_LITERALS.flatMap { colour ->
                listOf(literal(colour), literal(colour.toInt().toLong()))
            }.toTypedArray(),
        ),
    ),
)

/**
 * Replaces those constants with black in every method that carries one.
 *
 * The resource pass reaches colours the app looks up by name. A Compose `Color(0xFF1E1E1E)`,
 * or a view that builds its background from a literal, never passes through the resource table,
 * which is why the Notes composer kept a gray bar after the resource pass. The register and the
 * instruction are reused; only the literal changes.
 *
 * The patch has no name, so the patcher's loader does not list it: `AMOLED theme` is the one patch
 * a user sees, and this pass runs as its dependency.
 */
@Suppress("unused")
val amoledCodePatch = bytecodePatch(
    name = null,
    description = "The code-constant pass behind AMOLED theme: replaces opaque dark surface " +
        "colours held as constants in code with black.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_TIKTOK)

    execute {
        var changed = 0

        // Only methods that carry one of the indexed literals are visited, and only those
        // classes are made mutable. Converting every class and method first was what made the
        // pass crawl; the fingerprint narrows the work before anything is touched.
        val matches = DarkLiteralFingerprint.matchAllOrNull().orEmpty()
        for ((type, methods) in matches.groupBy { it.originalClassDef.type }) {
            val mutableClass = mutableClassDefBy(type)
            for (match in methods) {
                val method = match.originalMethod
                val instructions = method.implementation?.instructions ?: continue
                val indices = instructions.withIndex().mapNotNull { (index, instruction) ->
                    if (isDarkNarrow(instruction) || isDarkWide(instruction)) index else null
                }
                if (indices.isEmpty()) continue

                val mutable = mutableClass.findMutableMethodOf(method)
                indices.asReversed().forEach { index ->
                    val instruction = instructions.elementAt(index)
                    val register = (instruction as OneRegisterInstruction).registerA
                    val replacement = if (isDarkWide(instruction)) {
                        // Compose Color is a long: the colour is the low 32 bits. The `L`
                        // suffix makes the assembler parse a 64-bit literal; without it the
                        // 32-bit value is sign-extended through the high half.
                        val literal = AMOLED_BLACK.toString(16).padStart(16, '0')
                        "const-wide v$register, 0x${literal}L"
                    } else {
                        "const v$register, ${AMOLED_BLACK.toInt()}"
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
