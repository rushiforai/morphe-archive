// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.imageclient

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * `OkHttpHelper` builds the client Glide loads every image with (`YourAppGlideModule`). Its other client getters only
 * return clients built elsewhere.
 */
internal object ImageClientFingerprint : Fingerprint(
    returnType = "Lokhttp3/OkHttpClient;",
    parameters = listOf(),
    custom =
    declaredIn("OkHttpHelper.java") { method ->
        method.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) && method.implementation?.instructions?.any { it.isClientBuild() } == true
    },
)

internal fun Instruction.isClientBuild(): Boolean {
    val reference = getReference<MethodReference>() ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL &&
        reference.definingClass == "Lokhttp3/OkHttpClient\$Builder;" &&
        reference.name == "build" &&
        reference.parameterTypes.isEmpty() &&
        reference.returnType == "Lokhttp3/OkHttpClient;"
}
