package app.ahmedyarub.patches.harness

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.io.File

/**
 * Finds references in patched code to methods, fields and classes that do not exist.
 *
 * Nothing else catches these. The patcher writes whatever smali it is given, the verifier treats
 * an unresolved reference as a soft failure, and the app only throws NoSuchMethodError or
 * NoSuchFieldError when it reaches the reference, which may be deep in a feature nobody tried.
 * A hook that names an extension method wrongly, or reads an app field under the wrong type,
 * looks exactly like working code until then.
 *
 * Only the classes the patcher rewrote are checked: it writes them, with the merged extension,
 * to the first dex of the patched APK. A reference is reported only when the class it names and
 * that class's whole hierarchy are in the APK, since members inherited from the framework cannot
 * be looked up here.
 */
internal object ExtensionReferences {
    private const val PATCHED_DEX = "classes.dex"

    private val OBJECT_METHODS =
        setOf("<init>", "getClass", "hashCode", "equals", "clone", "toString", "notify", "notifyAll", "wait", "finalize")

    /** Each unresolvable reference, with the method that makes it. */
    fun unresolved(apk: File): List<String> {
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        val classes = HashMap<String, ClassDef>()
        container.dexEntryNames.forEach { entry ->
            container.getEntry(entry)!!.dexFile.classes.forEach { classes.putIfAbsent(it.type, it) }
        }

        /** The class, its superclasses and interfaces, or null when any of them is not in the APK. */
        fun hierarchy(type: String): List<ClassDef>? {
            val seen = LinkedHashMap<String, ClassDef>()
            val pending = ArrayDeque(listOf(type))
            while (pending.isNotEmpty()) {
                val current = pending.removeFirst()
                if (current == "Ljava/lang/Object;" || current in seen) continue
                val classDef = classes[current] ?: return null
                seen[current] = classDef
                classDef.superclass?.let(pending::add)
                pending.addAll(classDef.interfaces)
            }
            return seen.values.toList()
        }

        fun resolves(reference: MethodReference): Boolean {
            // Every hierarchy ends in Object, which is the framework's and so not in the APK.
            if (reference.name in OBJECT_METHODS) return true
            val parameters = reference.parameterTypes.map { it.toString() }
            return hierarchy(reference.definingClass)?.any { classDef ->
                classDef.methods.any { method ->
                    method.name == reference.name &&
                        method.returnType == reference.returnType &&
                        method.parameterTypes.map { it.toString() } == parameters
                }
            } ?: true
        }

        fun resolves(reference: FieldReference) =
            hierarchy(reference.definingClass)?.any { classDef ->
                classDef.fields.any { it.name == reference.name && it.type == reference.type }
            } ?: true

        fun isExtension(type: String) = type.startsWith("Lapp/")

        val unresolved = sortedSetOf<String>()
        container.getEntry(PATCHED_DEX)!!.dexFile.classes.forEach { classDef ->
            classDef.methods.forEach { method ->
                method.implementation?.instructions?.forEach { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    val ok =
                        when (reference) {
                            is MethodReference -> resolves(reference)
                            is FieldReference -> resolves(reference)
                            // An extension class the patches name but did not merge.
                            is TypeReference -> !isExtension(reference.type.trimStart('[')) || reference.type.trimStart('[') in classes
                            else -> true
                        }
                    if (!ok) unresolved += "$reference from ${classDef.type}->${method.name}"
                }
            }
        }
        return unresolved.toList()
    }
}
