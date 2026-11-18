// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.shared

import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.MutablePredicateList
import app.revanced.patcher.firstImmutableMethodDeclarativelyOrNull
import app.revanced.patcher.firstMethod
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.predicate
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The one method matching [build], made mutable. Throws [PatchException] when no method or more than one
 * matches, so a changed app fails at patch time instead of being patched in the wrong place.
 *
 * [strings] are complete string literals the method must hold; the patcher looks them up in its string index.
 */
internal fun BytecodePatchContext.uniqueMethod(
    what: String,
    vararg strings: String,
    build: MutablePredicateList<Method>.() -> Unit,
): MutableMethod {
    val first =
        firstImmutableMethodDeclarativelyOrNull(*strings) { build() }
            ?: throw PatchException("Could not find $what")
    val second =
        firstImmutableMethodDeclarativelyOrNull(*strings) {
            build()
            predicate { this != first }
        }
    if (second != null) throw PatchException("Found more than one $what: $first and $second")
    return firstMethod(first)
}

/** Whether a class named [sourceFile] in its SourceFile attribute declares [method]. */
internal fun BytecodePatchContext.isDeclaredIn(
    method: Method,
    sourceFile: String,
): Boolean = classDefs[method.definingClass]?.sourceFile == sourceFile

/** Whether [reference] names [method]: same class, name, parameter types and return type. */
internal fun isCallTo(
    reference: MethodReference?,
    method: MethodReference,
) = reference != null && reference.definingClass == method.definingClass && reference.name == method.name &&
    reference.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() } && reference.returnType == method.returnType
