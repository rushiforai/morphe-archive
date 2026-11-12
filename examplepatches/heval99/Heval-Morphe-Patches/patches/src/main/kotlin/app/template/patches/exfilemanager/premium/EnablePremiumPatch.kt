package app.template.patches.exfilemanager.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EXFILEMANAGER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The premium store's cached entitlement flag (SharedPreferences key). */
private const val ENTITLEMENT_KEY = "key_p_entitlement_active_v2"

private fun Method.holdsString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

private fun Method.calls(target: Pair<String, String>) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
        ref.definingClass == target.first && ref.name == target.second && ref.returnType == "Z" && ref.parameterTypes.isEmpty()
    } == true
} == true

/**
 * EX File Manager keeps premium in its premium store (R8-renamed, a37 in 1.6.2): an instance ()Z
 * that answers true while a purchase is stored and the cached "key_p_entitlement_active_v2" flag
 * is not false. The developer's server verifies purchases and only writes that cache. The app asks
 * through one static ()Z wrapper (gx7.e in 1.6.2) everywhere a feature or an ad depends on premium
 * (17 callers); the wrapper now answers true. The store, the billing client and the verification
 * worker are untouched, so a real purchase still works and is still verified.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the premium features.",
) {
    compatibleWith(COMPATIBILITY_EXFILEMANAGER)

    execute {
        // 1. The store's cached-flag reader: the only no-arg instance boolean holding the key.
        val readers = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.filter {
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    it.holdsString(ENTITLEMENT_KEY)
            }.forEach { readers += classDef.type to it.name }
        }
        val reader = readers.singleOrNull()
            ?: throw PatchException("Expected one \"$ENTITLEMENT_KEY\" reader, found $readers")

        // 2. The app-wide check: a short static ()Z that calls the reader.
        val wrappers = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.filter {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    (it.implementation?.instructions?.count() ?: 99) <= 6 && it.calls(reader)
            }.forEach { wrappers += classDef.type to it.name }
        }
        val (owner, name) = wrappers.singleOrNull()
            ?: throw PatchException("Expected one static premium check calling ${reader.first}->${reader.second}, found $wrappers")
        mutableClassDefBy(owner).methods.single {
            it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }.returnEarly(true)
    }
}
