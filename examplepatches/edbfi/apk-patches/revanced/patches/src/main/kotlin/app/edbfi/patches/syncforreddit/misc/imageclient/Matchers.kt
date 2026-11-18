// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.imageclient

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

/**
 * `OkHttpHelper` builds the client Glide loads every image with (`YourAppGlideModule`). Its other client getters only
 * return clients built elsewhere.
 */
internal fun BytecodePatchContext.imageClientMethod() = uniqueMethod("the image client in OkHttpHelper") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Lokhttp3/OkHttpClient;")
    parameterTypes()
    custom { isDeclaredIn(this, "OkHttpHelper.java") && buildsClient(this) }
}

internal fun Instruction.isClientBuild(): Boolean {
    val reference = methodReference ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL &&
        reference.definingClass == "Lokhttp3/OkHttpClient\$Builder;" &&
        reference.name == "build" &&
        reference.parameterTypes.isEmpty() &&
        reference.returnType == "Lokhttp3/OkHttpClient;"
}

private fun buildsClient(method: Method) = method.implementation?.instructions?.any { it.isClientBuild() } == true
