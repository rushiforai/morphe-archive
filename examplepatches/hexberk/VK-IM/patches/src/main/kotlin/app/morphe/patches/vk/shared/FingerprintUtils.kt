package app.morphe.patches.vk.shared

import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Whether the method body references every given fragment: a string constant, a type,
 * a field or a method (matched by substring of the reference). Lets fingerprints rely on
 * what the method does instead of obfuscated names that change between VK releases.
 */
internal fun Method.references(vararg fragments: String): Boolean {
    val refs = implementation?.instructions
        ?.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        ?: return false
    return fragments.all { fragment -> refs.any { it.contains(fragment) } }
}
