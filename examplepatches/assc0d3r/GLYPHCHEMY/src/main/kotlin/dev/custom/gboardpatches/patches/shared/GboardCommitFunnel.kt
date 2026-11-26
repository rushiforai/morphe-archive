package dev.custom.gboardpatches.patches.shared

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val INPUT_CONNECTION_TYPE = "Landroid/view/inputmethod/InputConnection;"
internal const val COMMITTED_TEXT_TYPE = "Ljava/lang/CharSequence;"

/**
 * Obfuscated names of Gboard's `InputConnectionUtil`: `Laerl;` in 18.8.0, `Lowy;` in 18.6.3 and
 * 18.5.4. The class is not part of the generated bindings because the patches do not need a name:
 * every build keeps the same nine static wrappers over InputConnection, and only `f` — the
 * `commitText` one — is hooked.
 */
private val COMMIT_FUNNEL_CLASSES = listOf("Lowy;", "Laerl;")

/**
 * The build's single `commitText` wrapper: `f(InputConnection, CharSequence, int)V`, the funnel
 * every routed commit goes through.
 *
 * Candidates are tried by name and then checked by body, not trusted on the name alone: a build
 * that renumbers its classes must not silently hand back an unrelated `f` that happens to share the
 * signature, because the hook would then run on a path nothing commits through. The candidates also
 * differ in visibility (18.6.3 ships `f` public, 18.8.0 package-private), which is why nothing here
 * depends on the access flags — the registers are derived from the method's own signature by the
 * caller instead.
 */
internal fun commitFunnel(classDef: (String) -> MutableClass?): MutableMethod {
    val misses = mutableListOf<String>()
    for (descriptor in COMMIT_FUNNEL_CLASSES) {
        val klass = classDef(descriptor)
        if (klass == null) {
            misses += "$descriptor is not in this build"
            continue
        }
        val method = klass.methods.firstOrNull { candidate ->
            candidate.name == "f" && candidate.returnType == "V" &&
                candidate.parameterTypes == listOf(INPUT_CONNECTION_TYPE, COMMITTED_TEXT_TYPE, "I")
        }
        if (method == null) {
            misses += "$descriptor has no f(InputConnection, CharSequence, int)V"
            continue
        }
        if (!method.commitsText()) {
            misses += "$descriptor->f does not call InputConnection.commitText"
            continue
        }
        return method
    }
    error("Gboard commit funnel not found (" + misses.joinToString("; ") + ").")
}

private fun MutableMethod.commitsText(): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null &&
            reference.definingClass == INPUT_CONNECTION_TYPE &&
            reference.name == "commitText"
    } == true
