/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.util.Utils.printInfo
import app.morphe.util.cloneMutable
import app.morphe.util.findMutableMethodOf
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val OBJECT = "Ljava/lang/Object;"
private const val IDENTITY = "Lapp/morphe/extension/music/patches/downloads/PlaybackRequestIdentity;"
private const val REQUEST = $$"Lapp/morphe/extension/music/patches/downloads/PlaybackRequestIdentity$Request;"

/** Carry the original occurrence through 9.45's effective-request rebuilding, not across unrelated requests. */
internal fun BytecodePatchContext.preparePlaybackRequestIdentity(requestType: String): (() -> Unit)? {
    if (packageMetadata.versionName != "9.45.51") return null

    val factory = classDefBy("Lacst;")
    val copies = listOf(
        "d" to listOf("Lwgw;", requestType, "Lvyx;"),
        "e" to listOf(requestType, "Lwjt;"),
        "f" to listOf(requestType, "Lwjt;"),
    ).map { (name, parameters) ->
        factory.methods.single {
            it.name == name && it.parameterTypes == parameters && it.returnType == requestType
        }.also { check(it.implementation != null) }
    }

    return {
        val request = mutableClassDefBy(requestType)
        request.interfaces.add(REQUEST)
        request.instanceFields.add(ImmutableField(requestType, "rvxRequestOrigin", OBJECT,
            AccessFlags.PRIVATE.value, null, emptySet(), emptySet()).toMutable())
        request.addDownloadsBridge("rvxRequestOrigin", emptyList(), OBJECT, 2, """
            iget-object v0, p0, $requestType->rvxRequestOrigin:$OBJECT
            return-object v0
        """)
        request.addDownloadsBridge("rvxRequestOrigin", listOf(OBJECT), "V", 2, """
            iput-object p1, p0, $requestType->rvxRequestOrigin:$OBJECT
            return-void
        """)
        val owner = mutableClassDefBy(factory.type)
        copies.forEach { installCopyIdentity(owner, it, requestType) }
    }
}

private fun installCopyIdentity(owner: MutableClass, original: Method, requestType: String) {
    val method = owner.findMutableMethodOf(original)
    val stock = method.cloneMutable(name = "rvxCopy_${original.name}")
    val wrapper = method.cloneMutable(registerCount = method.numberOfParameterRegisters + 1, clearImplementation = true)
    val last = method.numberOfParameterRegisters - 1
    val receiver = if (AccessFlags.STATIC.isSet(original.accessFlags)) 0 else 1
    val source = original.parameterTypes.indexOf(requestType) + receiver
    val invoke = when {
        AccessFlags.STATIC.isSet(original.accessFlags) -> "invoke-static"
        AccessFlags.PRIVATE.isSet(original.accessFlags) -> "invoke-direct"
        else -> "invoke-virtual"
    }
    wrapper.addInstructions(0, """
        $invoke/range {p0 .. p$last}, $stock
        move-result-object v0
        invoke-static {v0, p$source}, $IDENTITY->inherit($OBJECT$OBJECT)$OBJECT
        move-result-object v0
        check-cast v0, $requestType
        return-object v0
    """)
    owner.methods.remove(method)
    owner.methods.add(stock)
    owner.methods.add(wrapper)
    printInfo("PlayerFallback: request identity copy $original")
}
