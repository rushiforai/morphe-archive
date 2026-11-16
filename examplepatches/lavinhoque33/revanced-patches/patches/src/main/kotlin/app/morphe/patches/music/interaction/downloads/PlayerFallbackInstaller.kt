/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.util.Utils.printInfo
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FALLBACK = "Lapp/morphe/extension/music/patches/downloads/PlayerFallback;"
private const val REQUEST = $$"Lapp/morphe/extension/music/patches/downloads/PlayerFallback$Request;"
private const val REPLAY = "Lapp/morphe/extension/music/patches/downloads/OfflineReplayHooks;"
private const val FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"

/** Keep stock paired/packed assembly and alternate routing; replace only its per-request offline decision. */
internal fun BytecodePatchContext.preparePlayerFallback(
    requestType: String,
    offlineOnly: MethodReference,
    videoId: MethodReference,
    wrapper: ClassDef,
    factory: Method,
): () -> Unit {
    val selector = Fingerprint(
        returnType = FUTURE,
        parameters = listOf(requestType, STRING, "I", "L", "L"),
        custom = { method, _ ->
            AccessFlags.PUBLIC.isSet(method.accessFlags) && method.implementation?.instructions?.any {
                it.getReference<MethodReference>()?.toString() == offlineOnly.toString()
            } == true
        },
    ).matchSingle().classDef
    val sites = selector.methods.mapNotNull { method ->
        val calls = method.implementation?.instructions?.toList()?.withIndex()?.filter {
            it.value.getReference<MethodReference>()?.toString() == offlineOnly.toString()
        }.orEmpty()
        if (calls.isEmpty()) null else method to calls
    }
    val getterCalls = sites.sumOf { it.second.size }
    check(getterCalls == 13) { "player fallback: incomplete selector coverage ($getterCalls/13)" }
    val installTransport = preparePlayerTransport(selector, requestType)
    val installNavigation = prepareNavigationFallback(requestType)
    val installIdentity = preparePlaybackRequestIdentity(requestType)

    return {
        installIdentity?.invoke()
        val request = mutableClassDefBy(requestType)
        request.interfaces.add(REQUEST)
        request.addDownloadsBridge("rvxVideoId", emptyList(), STRING, 2, """
            invoke-virtual {p0}, $videoId
            move-result-object v0
            return-object v0
        """)
        request.addDownloadsBridge("rvxReplayOffline", emptyList(), "Z", 2, """
            invoke-virtual {p0}, $offlineOnly
            move-result v0
            if-nez v0, :done
            invoke-static {p0}, $FALLBACK->routeOffline($OBJECT)Z
            move-result v0
            :done
            return v0
        """)
        request.addDownloadsBridge("rvxPlayerResponse", listOf("[B"), OBJECT, 6, """
            invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
            move-result-wide v0
            invoke-static {p1, v0, v1}, ${wrapper.type}->${factory.name}([BJ)${factory.returnType}
            move-result-object v2
            invoke-virtual {p0}, $videoId
            move-result-object v3
            invoke-static {v2, v3}, $REPLAY->finishPlayer($OBJECT$STRING)$OBJECT
            move-result-object v2
            return-object v2
        """)
        val owner = mutableClassDefBy(selector.type)
        sites.forEach { (original, calls) ->
            val method = owner.findMutableMethodOf(original)
            calls.forEach { (index, instruction) ->
                val register = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerC
                    is RegisterRangeInstruction -> instruction.startRegister
                    else -> error("player fallback: unsupported offline getter invocation")
                }
                method.replaceInstruction(index,
                    "invoke-virtual/range {v$register .. v$register}, $requestType->rvxReplayOffline()Z")
            }
            printInfo("PlayerFallback: selector ${method.definingClass}->${method.name}" +
                "(${method.parameterTypes.joinToString("")})${method.returnType}")
        }
        installTransport()
        installNavigation()
    }
}
