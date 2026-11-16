/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.Utils.printInfo
import app.morphe.util.findMutableMethodOf
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FALLBACK = "Lapp/morphe/extension/music/patches/downloads/PlayerFallback;"
private const val STRING = "Ljava/lang/String;"

/** Preparation and discarded-future prefetch are independent of the player-result futures. */
internal fun BytecodePatchContext.prepareOnesieGuards(producer: MethodReference, params: String): () -> Unit {
    val request = producer.parameterTypes[0].toString()
    val transport = producer.parameterTypes[4].toString()
    val prefetch = classDefBy(producer.definingClass).methods.single {
        it.returnType == "V" && it.parameterTypes ==
            listOf(request, STRING, "Ljava/util/concurrent/Executor;", params)
    }
    val preparation = Fingerprint(
        returnType = "V",
        parameters = listOf(request, params, STRING),
        custom = { method, _ ->
            method.implementation?.instructions?.any {
                it.getReference<MethodReference>()?.let { call ->
                    call.returnType == transport && "[B" in call.parameterTypes
                } == true
            } == true
        },
    ).matchSingle().method
    listOf(prefetch, preparation).forEach {
        check(it.implementation!!.registerCount > it.numberOfParameterRegisters) {
            "Onesie fallback: no entry scratch register in $it"
        }
    }

    return {
        installOnesieGuard(prefetch, "routeOffline")
        installOnesieGuard(preparation, "skipOnesiePreparation")
    }
}

private fun BytecodePatchContext.installOnesieGuard(original: Method, predicate: String) {
    val method = mutableClassDefBy(original.definingClass).findMutableMethodOf(original)
    val stock = ExternalLabel("rvx_onesie_stock", method.getInstruction<Instruction>(0))
    method.addInstructionsWithLabels(0, """
        invoke-static/range {p1 .. p1}, $FALLBACK->$predicate(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :rvx_onesie_stock
        return-void
    """, stock)
    printInfo("PlayerFallback: Onesie $predicate $original")
}
