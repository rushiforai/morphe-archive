// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.enableultra

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.shared.isCallTo
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * `UltraHelper.isUltra()`, the check every Ultra feature calls, holds only a call to the purchase check, which nothing
 * else calls: a public static `()Z` of the same class.
 */
internal object IsUltraFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = declaredIn("UltraHelper.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) && purchaseCheckCalledBy(it) != null },
)

/** `UltraHelper`'s purchase check, [hasPurchase]. */
internal class PurchaseCheckFingerprint(hasPurchase: MethodReference) :
    Fingerprint(
        custom = declaredIn("UltraHelper.java") { isCallTo(hasPurchase, it) },
    )

/** The static `()Z` of the same class [method] calls when that is all it does (call, move-result, return), or null. */
internal fun purchaseCheckCalledBy(method: Method): MethodReference? {
    val code = method.implementation?.instructions?.toList() ?: return null
    if (code.map { it.opcode } != listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN)) return null
    val callee = code[0].getReference<MethodReference>() ?: return null
    return callee.takeIf {
        it.definingClass == method.definingClass && it.name != method.name && it.returnType == "Z" && it.parameterTypes.isEmpty()
    }
}

/** The `()Z` getter of a Firebase Remote Config flag, which reads the flag's [key] from the app's copy. */
internal class RemoteFlagFingerprint(key: String) :
    Fingerprint(
        returnType = "Z",
        parameters = listOf(),
        strings = listOf(key),
        custom = declaredIn("RemoteConfigHelper.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
    )
