package arpit.morphe.patches.cricfy.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.instruction.BuilderArrayPayload
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload

/**
 * Element widths dexlib2 can convert (`DexBackedArrayPayload.getArrayElements`).
 */
private val VALID_ARRAY_ELEMENT_WIDTHS = setOf(1, 2, 4, 8)

/**
 * Repairs the invalid `array-data` payloads the CRICFy 7.3 R8 build leaves in the
 * dead code after every method's final `return-*`.
 *
 * The app rewrites the payload headers with odd element widths (3, 5, …, 19). The
 * payloads are unreachable — no `fill-array-data` refers to them — but dexlib2
 * parses them whenever a method's implementation is materialized. Patcher's
 * `MutableMethod` conversion calls `DexBackedArrayPayload.getArrayElements()`, which
 * throws `Invalid element width: <n>`, so touching any method of an affected class
 * fails the patch.
 *
 * The patcher decodes the input DEX before patches run, so the file cannot be
 * sanitized up front. Instead, every affected method of the classes the patch touches
 * is swapped for a [MutableMethod] backed by [SanitizedMethod], whose implementation
 * replaces each invalid payload with a minimal valid one (width 1, one zero element).
 * Instruction indexes are preserved, so fingerprints and patch edits address the same
 * instructions; branch offsets, try blocks and debug items are remapped by dexlib2
 * when the method is converted. The replacement payload is never executed.
 *
 * Must be called before any fingerprint of the class is resolved: resolving one
 * materializes method implementations and would hit the invalid payload first.
 * The classes are made mutable by this call, which is also required for the patcher
 * to emit the patched copies.
 *
 * Calling this for a class that an earlier patch already repaired is a no-op: the
 * class is mutable, which means it went through this function (and therefore has no
 * invalid payloads left). Several patches touch `MainActivity` in 7.3/7.4.
 *
 * @return number of repaired methods across all [classTypes].
 */
internal fun BytecodePatchContext.repairInvalidArrayPayloads(vararg classTypes: String): Int {
    var repaired = 0

    for (classType in classTypes) {
        // Read the original (DexBacked) class before it is replaced by a MutableClass
        // wrapper; the wrapper does not expose its source class.
        val originalClass = classDefBy(classType)
        // Already made mutable (and repaired) by an earlier patch in this run.
        if (originalClass is MutableClass) continue

        val dirtyMethods = originalClass.methods.mapNotNull { method ->
            val implementation = method.implementation ?: return@mapNotNull null
            method.takeIf { implementation.hasInvalidArrayPayload() }
        }
        if (dirtyMethods.isEmpty()) continue

        val dirtyMethodsBySignature = dirtyMethods.associateBy { it.signatureKey() }
        val mutableClass = mutableClassDefBy(classType)

        // MutableClass.methods is the mutable backing set; direct/virtual method sets
        // are lazily derived from it and have not been created yet.
        @Suppress("UNCHECKED_CAST")
        val mutableMethods = (mutableClass as ClassDef).methods as MutableSet<MutableMethod>

        val replacements = mutableMethods
            .filter { it.signatureKey() in dirtyMethodsBySignature }
            .map { mutableMethod ->
                val originalMethod = dirtyMethodsBySignature.getValue(mutableMethod.signatureKey())
                val originalImplementation = originalMethod.implementation
                    ?: error("Method ${originalMethod.signatureKey()} lost its implementation.")
                MutableMethod(
                    SanitizedMethod(
                        original = originalMethod,
                        implementation = SanitizedMethodImplementation(originalImplementation),
                    ),
                )
            }
        check(replacements.size == dirtyMethodsBySignature.size) {
            "Repaired ${replacements.size} of ${dirtyMethodsBySignature.size} affected method(s) " +
                "of $classType; the class method table changed while patching."
        }

        mutableMethods.removeAll { it.signatureKey() in dirtyMethodsBySignature }
        mutableMethods.addAll(replacements)
        repaired += replacements.size
    }

    return repaired
}

private fun MethodImplementation.hasInvalidArrayPayload(): Boolean =
    instructions.any { instruction ->
        instruction is ArrayPayload && instruction.elementWidth !in VALID_ARRAY_ELEMENT_WIDTHS
    }

private data class MethodSignature(
    val name: String,
    val returnType: String,
    val parameterTypes: List<String>,
)

private fun Method.signatureKey(): MethodSignature = MethodSignature(
    name = name,
    returnType = returnType,
    parameterTypes = parameterTypes.map(CharSequence::toString),
)

/**
 * [Method] view used only to feed a repaired implementation into [MutableMethod].
 */
private class SanitizedMethod(
    private val original: Method,
    private val implementation: MethodImplementation,
) : Method by original {
    override fun getImplementation(): MethodImplementation = implementation
}

/**
 * [MethodImplementation] view whose invalid array-data payloads are replaced by a
 * minimal valid payload. Everything else is passed through unchanged so dexlib2 can
 * convert the method into a [com.android.tools.smali.dexlib2.builder.MutableMethodImplementation].
 */
private class SanitizedMethodImplementation(
    private val original: MethodImplementation,
) : MethodImplementation by original {
    override fun getInstructions(): Iterable<Instruction> =
        original.instructions.map { instruction ->
            if (instruction is ArrayPayload && instruction.elementWidth !in VALID_ARRAY_ELEMENT_WIDTHS) {
                // Width 1 with a single zero element; unreachable dead code.
                BuilderArrayPayload(1, listOf<Number>(0))
            } else {
                instruction
            }
        }
}
