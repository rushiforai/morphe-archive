/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-19.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.findMutableMethodOf
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOOKS = "Lapp/morphe/extension/music/patches/downloads/DownloadKeepAlive;"
private const val SERVICE = "Landroid/app/Service;"
private const val INTENT = "Landroid/content/Intent;"
internal const val PLAYLIST_SYNC = "Lapp/morphe/extension/music/patches/downloads/PlaylistSync;"

/** Keep the manifest and stock initialization intact. Install the complete lifecycle or do not claim the service. */
internal fun BytecodePatchContext.installDownloadKeepAlive() {
    try {
        val match = keepAliveCreateFingerprint.matchSingle()
        val owner = mutableClassDefBy(match.classDef.type)
        val create = owner.findMutableMethodOf(match.method)
        val createCode = create.implementation!!.instructions.toList()
        val createIndex = createCode.indices.single { createCode[it].keepAliveForegroundCall() != null }
        val foreground = createCode[createIndex].keepAliveForegroundCall()!!
        check(create.implementation!!.registerCount in 2..16 && createIndex > 0 &&
            createCode[createIndex - 1].let {
                it.opcode == Opcode.INVOKE_SUPER && it.getReference<MethodReference>()?.name == "onCreate"
            } && createCode[createIndex + 1].opcode == Opcode.RETURN_VOID
        ) { "stock foreground call does not follow service initialization" }

        fun lifecycle(name: String, parameters: List<String>, result: String) = owner.methods.singleOrNull {
            it.name == name && it.returnType == result && it.parameterTypes.map(CharSequence::toString) == parameters
        }
        val start = checkNotNull(lifecycle("onStartCommand", listOf(INTENT, "I", "I"), "I"))
        val bind = checkNotNull(lifecycle("onBind", listOf(INTENT), "Landroid/os/IBinder;"))
        val destroy = lifecycle("onDestroy", emptyList(), "V")
        val timeout = lifecycle("onTimeout", listOf("I", "I"), "V")
        val supported = mutableClassDefBy(HOOKS).methods.single { it.name == "supported" }

        // The start body only logs (older versions), runs the foreground helper and returns a constant.
        val startCode = start.implementation!!.instructions.toList()
        check(start.implementation!!.registerCount == 4 &&
            startCode.count { it.keepAliveForegroundCall() == foreground } == 1 &&
            startCode.all { instruction ->
                when (instruction.opcode) {
                    Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO, Opcode.CONST_4, Opcode.RETURN ->
                        (instruction as OneRegisterInstruction).registerA in 0..1
                    Opcode.INVOKE_STATIC, Opcode.INVOKE_DIRECT -> (instruction as FiveRegisterInstruction).let {
                        it.registerCount == 1 && it.registerC in 0..1
                    }
                    else -> false
                }
            }
        ) { "start command uses its flags register" }
        val bindCode = bind.implementation!!.instructions.toList()
        check(bind.implementation!!.registerCount == 2 &&
            bindCode.map { it.opcode } == listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT)
        ) { "stock bind is not the null binder" }
        check(destroy == null || destroy.implementation!!.registerCount in 2..16)
        check(timeout == null || timeout.implementation!!.registerCount in 4..16)

        create.runWhenClaimed(createIndex, "onCreate", "v0", "return-void")
        bind.runWhenClaimed(0, "onBind", "p1", "invoke-direct {p0}, $foreground")
        start.addInstructionsWithLabels(0, """
            invoke-static {p0, p1, p3}, $HOOKS->onStart(${SERVICE}${INTENT}I)Z
            move-result p2
            if-eqz p2, :stock
            const/4 p2, 0x2
            return p2
        """, ExternalLabel("stock", start.getInstruction(0)))

        if (destroy != null) {
            destroy.runWhenClaimed(0, "onDestroy", "v0", """
                invoke-super {p0}, $SERVICE->onDestroy()V
                return-void
            """)
        } else {
            owner.addDownloadsBridge("onDestroy", emptyList(), "V", 1, """
                invoke-static {p0}, $HOOKS->onDestroy($SERVICE)Z
                invoke-super {p0}, $SERVICE->onDestroy()V
                return-void
            """)
        }
        if (timeout != null) {
            timeout.runWhenClaimed(0, "onTimeout", "v0", "return-void")
        } else {
            // Newer Android still dispatches this callback when the stock APK predates Android 15.
            owner.addDownloadsBridge("onTimeout", listOf("I", "I"), "V", 4, """
                invoke-static {p0}, $HOOKS->onTimeout($SERVICE)Z
                move-result v0
                if-nez v0, :done
                invoke-super {p0, p1, p2}, $SERVICE->onTimeout(II)V
                :done
                return-void
            """)
        }
        supported.returnEarly(true)
        printInfo("Download keep-alive: stock create/bind/start; destroy=" +
            (if (destroy == null) "added" else "hooked") + ", timeout=" +
            (if (timeout == null) "added" else "hooked"))
    } catch (failure: Exception) {
        printWarn("Download keep-alive unavailable on Music ${packageMetadata.versionName}: " +
            "${failure.message}; downloads are unchanged.")
    }
}

private fun MutableMethod.runWhenClaimed(index: Int, hook: String, scratch: String, body: String) {
    addInstructionsWithLabels(index, """
        invoke-static {p0}, $HOOKS->$hook($SERVICE)Z
        move-result $scratch
        if-eqz $scratch, :stock
        $body
    """, ExternalLabel("stock", getInstruction(index)))
}
