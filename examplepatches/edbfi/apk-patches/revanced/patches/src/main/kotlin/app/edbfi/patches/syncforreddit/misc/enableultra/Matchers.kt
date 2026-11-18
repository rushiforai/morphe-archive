// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.enableultra

import app.edbfi.patches.shared.isCallTo
import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** `UltraHelper`'s two checks: [isUltra] asks [hasPurchase], which reads the stored purchase token. */
internal class UltraChecks(val isUltra: MutableMethod, val hasPurchase: MethodReference)

/**
 * `UltraHelper.isUltra()`, the check every Ultra feature calls, holds only a call to the purchase check, which nothing
 * else calls: a public static `()Z` of the same class.
 */
internal fun BytecodePatchContext.ultraChecks(): UltraChecks {
    val isUltra =
        uniqueMethod("UltraHelper's Ultra check") {
            accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
            returnType("Z")
            parameterTypes()
            custom { isDeclaredIn(this, "UltraHelper.java") && purchaseCheckCalledBy(this) != null }
        }
    val hasPurchase = purchaseCheckCalledBy(isUltra)!!
    val purchaseCheck =
        uniqueMethod("UltraHelper's purchase check") {
            custom { isDeclaredIn(this, "UltraHelper.java") && isCallTo(hasPurchase, this) }
        }
    val readsToken = purchaseCheck.implementation?.instructions?.any {
        val reference = it.methodReference
        reference?.definingClass == "Landroid/content/SharedPreferences;" && reference.name == "contains"
    } == true
    if (!readsToken) throw PatchException("UltraHelper's purchase check no longer reads the stored purchase")
    return UltraChecks(isUltra, hasPurchase)
}

/** The static `()Z` of the same class [method] calls when that is all it does (call, move-result, return), or null. */
private fun purchaseCheckCalledBy(method: Method): MethodReference? {
    val code = method.implementation?.instructions?.toList() ?: return null
    if (code.map { it.opcode } != listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN)) return null
    val callee = code[0].methodReference ?: return null
    return callee.takeIf {
        it.definingClass == method.definingClass && it.name != method.name && it.returnType == "Z" && it.parameterTypes.isEmpty()
    }
}

/** The `()Z` getter of a Firebase Remote Config flag, which reads the flag's [key] from the app's copy. */
internal fun BytecodePatchContext.remoteFlag(key: String) = uniqueMethod("the \"$key\" flag in RemoteConfigHelper", key) {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Z")
    parameterTypes()
    custom { isDeclaredIn(this, "RemoteConfigHelper.java") }
}

/** The one method of the class named [sourceFile] that holds every one of [strings]. */
internal fun BytecodePatchContext.methodIn(
    sourceFile: String,
    vararg strings: String,
) = uniqueMethod("the method holding ${strings.joinToString { "\"$it\"" }} in $sourceFile", *strings) {
    custom { isDeclaredIn(this, sourceFile) }
}
