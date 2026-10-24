/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.shared.redexOriginalName
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/*
 * "This is taking a while. Try checking your network connection." (#222). Read from 584,
 * 2026-10-23, arm64; the obfuscated names here are for reviewers, the code never writes one down.
 *
 * - The message is string 0x7f14099f, and the one method that loads it is the run() of
 *   WeakSignalToastManager's showToastRunnable (LX/8rW;). The manager (LX/8rV;) builds that
 *   runnable once, in its constructor.
 * - The manager's player state subscriber (LX/AFx;) posts the runnable with a delay when the video
 *   starts buffering, and takes it back off the queue when the video leaves that state. A server
 *   flag decides whether the subscriber posts it at all.
 * - run() returns on its own when the video started playing in the meantime, before it builds the
 *   message. The hook returns there too, so the manager's state is what Facebook's own early
 *   return leaves: the next stall posts the runnable again once the video leaves buffering.
 */

internal const val HIDE_SLOW_CONNECTION_MESSAGE = "$EXTENSION_PACKAGE/reels/ReelDeclutter;->hideSlowConnectionMessage()Z"

/** What Redex calls the runnable that shows the message, a name it keeps on every build. */
internal const val SLOW_CONNECTION_RUNNABLE = "WeakSignalToastManager\$showToastRunnable\$1"

private const val PATCH = "Clean up Reels"
private const val RUNNABLE = "Ljava/lang/Runnable;"

/** The run() of [classDef] when it's the slow connection message's runnable, else null. */
internal fun slowConnectionRun(classDef: ClassDef): Method? {
    if (redexOriginalName(classDef) != SLOW_CONNECTION_RUNNABLE) return null
    if (classDef.interfaces.none { it.toString() == RUNNABLE }) return null
    return classDef.methods.singleOrNull {
        it.name == "run" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
    }
}

/** The message's runnable asks the extension first thing and returns before it builds the message. */
internal fun BytecodePatchContext.hideSlowConnectionMessage() {
    val owners = mutableListOf<String>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith(EXTENSION_PACKAGE) && slowConnectionRun(classDef) != null) owners += classDef.type
    }
    val owner = owners.singleOrNull()
        ?: throw PatchException("$PATCH: expected one Runnable named $SLOW_CONNECTION_RUNNABLE with a run(), found ${owners.size}")
    mutableClassDefBy(owner).methods.single {
        it.name == "run" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
    }.returnVoidWhen(HIDE_SLOW_CONNECTION_MESSAGE)
}
