/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.patches.youtube.video.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.youtube.utils.extension.Constants.GENERAL_PATH
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val SURFACE = "Landroid/view/Surface;"
private const val HOLDER = "Landroid/view/SurfaceHolder;"
private const val HOLDER_CALLBACK = "Landroid/view/SurfaceHolder\$Callback;"
private const val ADD_HOLDER_CALLBACK = "$HOLDER->addCallback($HOLDER_CALLBACK)V"
private const val LOCAL_CALLBACK = "$GENERAL_PATH/offline/OfflineWatchSurfaceCallback;"

/** A framework watch view can already own a SurfaceHolder before we select the progressive adapter. */
context(context: BytecodePatchContext)
internal fun resolveOfflineWatchSurface(prepare: Method, localUri: FieldReference): () -> Unit {
    val adapter = context.mutableClassDefBy(prepare.definingClass)
    val adapterHolderSetter = adapter.methods.single { it.takes(HOLDER) }
    if (adapterHolderSetter.instructions.singleOrNull()?.opcode != Opcode.RETURN_VOID) return {}

    val adapterSurfaceSetter = adapter.methods.single { it.takes(SURFACE) }
    val playerField = adapterSurfaceSetter.instructions.single { it.opcode == Opcode.IGET_OBJECT }
        .getReference<FieldReference>()!!
    val playerType = prepare.instructions.filter { it.opcode == Opcode.CHECK_CAST }.mapNotNull {
        it.getReference<TypeReference>()?.type?.takeIf { type ->
            context.classDefByOrNull(type)?.interfaces?.contains(playerField.type) == true
        }
    }.distinct().single()
    val player = context.mutableClassDefBy(playerType)
    val setSurface = player.methods.single { it.takes(SURFACE) }
    val surfaceCalls = setSurface.instructions.mapNotNull { instruction ->
        instruction.getReference<MethodReference>()?.takeIf { it.definingClass == playerType }?.let {
            instruction to it
        }
    }
    check(surfaceCalls.all { (_, method) -> method.returnType == "V" } &&
        surfaceCalls.map { (_, method) -> method.parameterTypes.map(CharSequence::toString) } == listOf(
            emptyList(), emptyList(), listOf("Ljava/lang/Object;"), listOf("I", "I"),
        )) { "Stock video surface lifecycle changed" }
    val (verifyThread, clearCallbacks, setOutput, setSize) = surfaceCalls
    val clearMethod = player.methods.single { it == clearCallbacks.second }
    // The method is an instance no-arg setter. Its locals are still unused at entry.
    check(clearMethod.implementation!!.registerCount in 3..16)

    val holderCallbackSetup = player.methods.single { method ->
        method.takes(HOLDER) && method.instructions.any { instruction ->
            instruction.getReference<MethodReference>()?.toString() == ADD_HOLDER_CALLBACK
        }
    }.instructions
    val tracksHolderSurface = holderCallbackSetup.single { it.opcode == Opcode.IPUT_BOOLEAN }
        .getReference<FieldReference>()!!
    val holderField = holderCallbackSetup.single { it.opcode == Opcode.IPUT_OBJECT }
        .getReference<FieldReference>()!!
    val callbackField = holderCallbackSetup.filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { it.getReference<FieldReference>() }.distinct().single { it.type != HOLDER }
    check(holderField.type == HOLDER)
    val localCallback = ImmutableField(
        playerType, "patchOfflineWatchSurfaceCallback", LOCAL_CALLBACK, AccessFlags.PRIVATE.value, null, null, null,
    ).toMutable()

    // Reuse the same clear/output/size operations and callback as Media3's plain SurfaceView path.
    // Its remaining private holder helper is for special views and does not own the video surface.
    val bindHolder = ImmutableMethod(
        player.type, "patchBindOfflineWatchHolder", adapterHolderSetter.parameters, "V",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(5),
    ).toMutable().apply {
        addInstructions(0, """
            ${verifyThread.invoke("p0")}
            ${clearCallbacks.invoke("p0")}
            if-eqz p1, :no_surface
            const/4 v0, 0x1
            iput-boolean v0, p0, $tracksHolderSurface
            iput-object p1, p0, $holderField
            iget-object v1, p0, $callbackField
            new-instance v2, $LOCAL_CALLBACK
            invoke-direct {v2, p1, v1}, $LOCAL_CALLBACK-><init>($HOLDER$HOLDER_CALLBACK)V
            iput-object v2, p0, $localCallback
            invoke-interface {p1, v2}, $ADD_HOLDER_CALLBACK
            invoke-interface {p1}, $HOLDER->getSurface()$SURFACE
            move-result-object v1
            if-eqz v1, :no_surface
            invoke-virtual {v1}, $SURFACE->isValid()Z
            move-result v0
            if-eqz v0, :no_surface
            ${setOutput.invoke("p0, v1")}
            invoke-interface {p1}, $HOLDER->getSurfaceFrame()Landroid/graphics/Rect;
            move-result-object v0
            invoke-virtual {v0}, Landroid/graphics/Rect;->width()I
            move-result v1
            invoke-virtual {v0}, Landroid/graphics/Rect;->height()I
            move-result v2
            ${setSize.invoke("p0, v1, v2")}
            return-void
            :no_surface
            const/4 v0, 0x0
            ${setOutput.invoke("p0, v0")}
            ${setSize.invoke("p0, v0, v0")}
            return-void
        """.trimIndent())
    }

    val forwardHolder = ImmutableMethod(
        adapter.type, adapterHolderSetter.name, adapterHolderSetter.parameters, "V", adapterHolderSetter.accessFlags,
        adapterHolderSetter.annotations, adapterHolderSetter.hiddenApiRestrictions, MutableMethodImplementation(3),
    ).toMutable().apply {
        addInstructions(0, """
            iget-object v0, p0, $localUri
            if-eqz v0, :done
            iget-object v0, p0, $playerField
            check-cast v0, $playerType
            invoke-virtual {v0, p1}, $bindHolder
            :done
            return-void
        """.trimIndent())
    }

    return {
        player.fields.add(localCallback)
        // Detach the output before retiring the callback, which can unblock a SurfaceView destruction.
        val stockCleanup = clearMethod.instructions.first()
        clearMethod.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $localCallback
                if-eqz v0, :stock_cleanup
                const/4 v1, 0x0
                ${setOutput.invoke("p0, v1")}
                invoke-virtual {v0}, $LOCAL_CALLBACK->close()V
                iput-object v1, p0, $localCallback
                iput-object v1, p0, $holderField
            """.trimIndent(),
            ExternalLabel("stock_cleanup", stockCleanup),
        )

        player.methods.add(bindHolder)
        adapter.methods.remove(adapterHolderSetter)
        adapter.methods.add(forwardHolder)
    }
}

private fun Method.takes(type: String) = returnType == "V" && parameterTypes.singleOrNull() == type

private fun Pair<Instruction, MethodReference>.invoke(registers: String): String {
    val opcode = when (first.opcode) {
        Opcode.INVOKE_DIRECT -> "invoke-direct"
        Opcode.INVOKE_VIRTUAL -> "invoke-virtual"
        else -> error("Unexpected stock surface call: ${first.opcode}")
    }
    return "$opcode {$registers}, $second"
}
