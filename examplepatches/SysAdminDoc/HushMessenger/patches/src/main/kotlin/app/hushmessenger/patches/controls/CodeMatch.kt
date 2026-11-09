package app.hushmessenger.patches.controls

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.dexbacked.reference.DexBackedFieldReference
import com.android.tools.smali.dexlib2.dexbacked.reference.DexBackedMethodReference
import com.android.tools.smali.dexlib2.dexbacked.reference.DexBackedStringReference
import com.android.tools.smali.dexlib2.dexbacked.reference.DexBackedTypeReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.IdentityHashMap

/*
 * Whole-app scans compare millions of instruction references with one id. Reading each reference's strings, and
 * formatting method and field references into ids, was most of what kept Find runtime controls going for ten minutes
 * and more on a phone (#148, #150). These matchers look the id up once in each dex file's string and type tables, which
 * the format keeps sorted by UTF-16 code unit (ART refuses a dex file that isn't), and then compare table indexes. A
 * dex file whose tables don't have the id can't reference it, so its instructions are ruled out without a string read.
 * Classes a patch already rebuilt hold plain references, and those are compared by value.
 *
 * A matcher keeps every dex file it has looked at, so it lives for one scan, never in a top-level val: a top-level one
 * kept each APK the patcher or a test loaded alive until the heap ran out.
 */

private fun DexBackedDexFile.stringIndex(value: String) = stringSection.binarySearch(value).coerceAtLeast(-1)
private fun DexBackedDexFile.typeIndex(value: String) = typeSection.binarySearch(value).coerceAtLeast(-1)

/** One string constant: what `(ref as? StringReference)?.string == value` answers. */
internal class StringMatch(val value: String) {
    private val indexes = IdentityHashMap<DexBackedDexFile, Int>()

    fun matches(ref: Reference?): Boolean = when (ref) {
        is DexBackedStringReference -> ref.stringIndex == indexes.getOrPut(ref.dexFile) { ref.dexFile.stringIndex(value) }
        is StringReference -> ref.string == value
        else -> false
    }
}

/** One type: what `(ref as? TypeReference)?.type == value` answers. */
internal class TypeMatch(val value: String) {
    private val indexes = IdentityHashMap<DexBackedDexFile, Int>()

    fun matches(ref: Reference?): Boolean = when (ref) {
        is DexBackedTypeReference -> ref.typeIndex == indexes.getOrPut(ref.dexFile) { ref.dexFile.typeIndex(value) }
        is TypeReference -> ref.type == value
        else -> false
    }
}

/**
 * One method or field id (`Lcls;->name(params)ret` or `Lcls;->name:type`): what `ref.toString() == id` answers for a
 * method or field reference. A dex file references it only if its tables hold both the class and the name, and in one
 * that does, the name is compared before the whole id is built.
 */
internal class MemberMatch(val id: String) {
    private val owner = id.substringBefore("->")
    private val name = id.substringAfter("->").substringBefore('(').substringBefore(':')
    private val named = IdentityHashMap<DexBackedDexFile, Boolean>()

    fun matches(ref: Reference?): Boolean {
        val file = when (ref) {
            is DexBackedMethodReference -> ref.dexFile
            is DexBackedFieldReference -> ref.dexFile
            is MethodReference, is FieldReference -> null
            else -> return false
        }
        if (file != null && !named.getOrPut(file) { file.typeIndex(owner) >= 0 && file.stringIndex(name) >= 0 }) return false
        val refName = if (ref is MethodReference) ref.name else (ref as FieldReference).name
        return refName == name && ref.toString() == id
    }
}
