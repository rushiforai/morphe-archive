package patches.myspoti

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Locate the shared permission checks without relying on R8 method names. */
internal object BrowserDiscovery {
    private const val STRING = "Ljava/lang/String;"
    private const val UID_LOOKUP = "Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;"
    private const val APPLICATION_INFO =
        "Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;"
    private const val SET_CONTAINS = "Ljava/util/Set;->contains(Ljava/lang/Object;)Z"

    private fun Method.calls() = implementation?.instructions?.toList().orEmpty().mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
    }

    private fun <T> List<T>.one(label: String): T = singleOrNull()
        ?: error("Unsupported Myspoti browser: expected one $label, found $size")

    private fun browseMethods(service: ClassDef) = service.methods.filter {
        it.implementation != null && !AccessFlags.STATIC.isSet(it.accessFlags)
    }

    /** The audited library admission body: a package allowlist plus the system-app flag. */
    private fun Method.isBrowsePredicate() = returnType == "Z" &&
        parameterTypes.map(CharSequence::toString) == listOf(STRING) &&
        APPLICATION_INFO in calls() && SET_CONTAINS in calls()

    private fun root(methods: List<Method>) = methods.filter { method ->
        method.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "media browser: empty root for "
        } && UID_LOOKUP in method.calls() && method.returnType.startsWith("L")
    }.one("UID-checked browser root")

    private fun caller(methods: List<Method>) = methods.filter { method ->
        method.returnType == "Z" && method.parameterTypes.isEmpty() && UID_LOOKUP in method.calls()
    }.one("UID-checked children/search caller")

    /**
     * The `boolean(String)` library check called by the browser root and by the children/search
     * caller. Prefer the audited body, so admission code another patch prepended is not the
     * target. Fall back to the shared callee: another host patch may have replaced that body,
     * but the call graph is unchanged.
     */
    private fun predicate(methods: List<Method>, root: Method, caller: Method): Method {
        val audited = methods.filter { it.isBrowsePredicate() }
        check(audited.size <= 1) {
            "Unsupported Myspoti browser: expected one browse permission predicate, found ${audited.size}"
        }
        if (audited.size == 1) return audited.single()
        return methods.filter { method ->
            method.returnType == "Z" &&
                method.parameterTypes.map(CharSequence::toString) == listOf(STRING) &&
                method.toString() in root.calls() && method.toString() in caller.calls()
        }.one("shared browse permission predicate")
    }

    /**
     * The shared library permission predicate, for a patch that changes it. Unlike [discover],
     * this accepts a predicate whose body a host patch already changed.
     */
    @JvmStatic
    fun permissionPredicate(service: ClassDef): Method {
        val methods = browseMethods(service)
        return predicate(methods, root(methods), caller(methods))
    }

    @JvmStatic
    @JvmOverloads
    fun discover(service: ClassDef, dispatchMethods: List<Method> = emptyList()): Method {
        val methods = browseMethods(service)
        val browseRoot = root(methods)
        val browseCaller = caller(methods)
        val browsePredicate = predicate(methods, browseRoot, browseCaller)
        val callbacks = (methods + dispatchMethods).filter {
            it.returnType == "V" && browseCaller.toString() in it.calls()
        }
        check(callbacks.any { it.parameterTypes.size == 2 && it.parameterTypes[0] == STRING } &&
            callbacks.any { method ->
                (method.parameterTypes.size == 3 && method.parameterTypes[0] == STRING &&
                    method.parameterTypes[1] == "Landroid/os/Bundle;") ||
                    method.implementation!!.instructions.any {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith(
                            "onSearch must call detach() or sendResult() before returning for query=") == true
                    }
            }) {
            "Unsupported Myspoti browser: children and search no longer share the UID-checked caller"
        }
        return browsePredicate
    }
}
