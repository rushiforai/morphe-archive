package app.template.patches.textra.premium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TEXTRA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Textra stores its purchase state in a single integer preference (key "lc", -1 unknown,
 * 0 free, 1 licensed), owned by a dedicated int-preference subclass. The app is R8-obfuscated
 * and its class and method names rotate (4.87: com.mplus.lib.sq.q, getters k()Z and l()Z), so
 * nothing here uses them:
 * 1. The class is the one the preference registry instantiates for the "lc" key: the
 *    `new-instance` right before `const-string "lc"`, whose constructor call takes
 *    (String key, int default, SharedPreferences). The key is persisted user state, so it is
 *    stable; exactly one such class must exist.
 * 2. Its two concrete `()Z` getters are told apart by the state they test: `intValue() == 1`
 *    (licensed) and `intValue() == 0` (free). Each must be found exactly once.
 *
 * Gates read the licensed getter (true = licensed) and the free getter (true = state 0).
 * Forcing them to true and false emulates the purchased state (1) for every call site: ad
 * placement checks, settings visibility and the upgrade prompts.
 */
private const val LICENSE_KEY = "lc"
private val PREFERENCE_CONSTRUCTOR = listOf("Ljava/lang/String;", "I", "Landroid/content/SharedPreferences;")

private fun BytecodePatchContext.licenseClass(): MutableClass {
    val types = mutableSetOf<String>()
    classDefForEach { classDef ->
        for (method in classDef.methods) {
            val insns = method.implementation?.instructions?.toList() ?: continue
            insns.forEachIndexed { index, insn ->
                val key = ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (insn.opcode != Opcode.CONST_STRING || key != LICENSE_KEY) return@forEachIndexed
                // The object being built: the closest new-instance before the key.
                val created = (index - 1 downTo maxOf(0, index - 3)).firstOrNull { insns[it].opcode == Opcode.NEW_INSTANCE }
                    ?.let { ((insns[it] as ReferenceInstruction).reference as TypeReference).type }
                    ?: return@forEachIndexed
                // ...passed to an int-preference constructor right after the key and the default.
                val constructor = insns.drop(index + 1).take(3).firstNotNullOfOrNull {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref -> ref.name == "<init>" }
                }
                if (constructor?.parameterTypes?.map(CharSequence::toString) == PREFERENCE_CONSTRUCTOR) types += created
            }
        }
    }
    val type = types.singleOrNull()
        ?: throw PatchException("Expected one class for the \"$LICENSE_KEY\" license preference, found $types")
    return mutableClassDefBy(type)
}

/**
 * The value a `()Z` getter compares `intValue()` with: 0 for `if-nez` (true when 0), the literal
 * for `const/4` + `if-ne` (true when equal), null for any other shape.
 */
private fun Method.testedState(): Int? {
    val insns = implementation?.instructions?.toList() ?: return null
    val intValue = insns.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
            ref.definingClass == "Ljava/lang/Integer;" && ref.name == "intValue"
        } == true
    }
    if (intValue < 0 || insns.getOrNull(intValue + 1)?.opcode != Opcode.MOVE_RESULT) return null
    val next = insns.getOrNull(intValue + 2) ?: return null
    return when (next.opcode) {
        Opcode.IF_NEZ -> 0
        Opcode.CONST_4 -> (next as NarrowLiteralInstruction).narrowLiteral
            .takeIf { insns.getOrNull(intValue + 3)?.opcode == Opcode.IF_NE }
        else -> null
    }
}

private fun MutableClass.getterTesting(state: Int): MutableMethod {
    val getters = methods.filter {
        it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null && it.testedState() == state
    }
    return getters.singleOrNull()
        ?: throw PatchException("$type: expected one ()Z testing state $state, found ${getters.map { it.name }}")
}

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks Pro features and removes ads."
) {
    compatibleWith(COMPATIBILITY_TEXTRA)

    execute {
        val license = licenseClass()
        val licensed = license.getterTesting(1)
        val free = license.getterTesting(0)
        licensed.returnEarly(true)
        free.returnEarly(false)
    }
}
