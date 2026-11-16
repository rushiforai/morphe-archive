/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FALLBACK = "Lapp/morphe/extension/music/patches/downloads/PlayerFallback;"
private const val PLAY_SOURCE = $$"Lapp/morphe/extension/music/patches/downloads/PlayerFallback$PlaySource;"
private const val INTENT = "Landroid/content/Intent;"

private data class PlayAbi(
    val controller: String, val callback: String, val base: String, val wrapper: String,
    val play: String, val callbackPlay: String, val raw: String,
)

/** Play precedes native suppression/readiness guards; raw PLAY also precedes Android's action-mask filtering. */
internal fun BytecodePatchContext.preparePlayRecovery(
    playback: FieldReference, providerGet: MethodReference,
): () -> Unit {
    val abi = when (packageMetadata.versionName) {
        "9.45.51" -> PlayAbi("Lacfv;", "Lacfu;", "Ley;", "Lex;", "B", "e", "u")
        "9.40.51" -> PlayAbi("Labzl;", "Labzk;", "Lez;", "Ley;", "z", "e", "u")
        "9.15.51" -> PlayAbi("Lbaxf;", "Lbaxe;", "Lie;", "Lid;", "I", "f", "v")
        "8.30.54" -> PlayAbi("Laxqr;", "Laxqq;", "Lib;", "Lia;", "I", "f", "v")
        "8.28.54" -> PlayAbi("Laxgk;", "Laxgj;", "Lih;", "Lig;", "I", "f", "v")
        "8.12.54" -> PlayAbi("Lavde;", "Lavdd;", "Lie;", "Lid;", "I", "f", "v")
        else -> error("native Play recovery has no ABI for this version")
    }
    fun method(owner: String, name: String, parameters: List<String>, result: String) =
        classDefBy(owner).methods.single {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result
        }
    fun Method.calls(target: MethodReference) = implementation!!.instructions.any {
        it.getReference<MethodReference>()?.toString() == target.toString()
    }
    fun isSubtype(type: String, target: String): Boolean = type == target ||
        classDefByOrNull(type)?.let { candidate ->
            candidate.interfaces.any { isSubtype(it, target) } ||
                candidate.superclass?.let { isSubtype(it, target) } == true
        } == true
    val controller = classDefBy(abi.controller)
    val provider = controller.fields.single {
        it.name == (if (packageMetadata.versionName == "8.12.54") "f" else "i") &&
            it.type == providerGet.definingClass
    }
    val suppressed = controller.fields.single {
        it.name == (if (packageMetadata.versionName == "8.12.54") "d" else "g") && it.type == "Z"
    }
    val play = method(abi.controller, "d", emptyList(), "V")
    val playbackPlay = method(playback.type, abi.play, emptyList(), "V")
    val playTarget = play.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }.single {
        it.name == abi.play && it.parameterTypes.isEmpty() && it.returnType == "V"
    }
    check(isSubtype(playback.type, playTarget.definingClass))
    check(play.implementation!!.instructions.first().getReference<FieldReference>()?.toString() ==
        suppressed.toString())
    listOf(play, playbackPlay).forEach {
        check(!AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation!!.registerCount >= 2)
    }
    val callback = classDefBy(abi.callback)
    check(callback.superclass == abi.base)
    val controllerField = callback.fields.single { it.name == "e" && it.type == abi.controller }
    val callbackPlay = method(abi.callback, abi.callbackPlay, emptyList(), "V")
    check(callbackPlay.calls(play))
    val raw = method(abi.base, abi.raw, listOf(INTENT), "Z")
    check(raw.implementation != null && AccessFlags.PUBLIC.isSet(raw.accessFlags) &&
        !AccessFlags.FINAL.isSet(raw.accessFlags) && !AccessFlags.STATIC.isSet(raw.accessFlags))
    check(callback.methods.none { it.name == abi.raw && it.parameterTypes == listOf(INTENT) })
    val mediaButton = method(abi.wrapper, "onMediaButtonEvent", listOf(INTENT), "Z")
    check(mediaButton.calls(raw))
    check(mediaButton.implementation!!.instructions.any {
        it.opcode == Opcode.INVOKE_SUPER && it.getReference<MethodReference>()?.name == "onMediaButtonEvent"
    })
    val wrapperPlay = method(abi.wrapper, "onPlay", emptyList(), "V")
    check(wrapperPlay.implementation!!.instructions.any {
        val call = it.getReference<MethodReference>()
        call?.definingClass == abi.base && call.name == abi.callbackPlay && call.parameterTypes.isEmpty()
    })

    return {
        val mutableController = mutableClassDefBy(abi.controller)
        mutableController.interfaces.add(PLAY_SOURCE)
        mutableController.addDownloadsBridge("rvxPlayNavigator", emptyList(), "Ljava/lang/Object;", 2, """
            iget-object v0, p0, $provider
            invoke-interface {v0}, $providerGet
            move-result-object v0
            return-object v0
        """)
        val mutableCallback = mutableClassDefBy(abi.callback)
        mutableCallback.interfaces.add(PLAY_SOURCE)
        mutableCallback.addDownloadsBridge("rvxPlayNavigator", emptyList(), "Ljava/lang/Object;", 2, """
            iget-object v0, p0, $controllerField
            invoke-virtual {v0}, ${abi.controller}->rvxPlayNavigator()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
        listOf(play, playbackPlay).forEach { entry ->
            mutableClassDefBy(entry.definingClass).findMutableMethodOf(entry).addInstructionsWithLabels(0, """
                invoke-static/range {p0 .. p0}, $FALLBACK->recoverPlay(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :rvx_stock_play
                return-void
                :rvx_stock_play
                nop
            """)
        }
        mutableCallback.addDownloadsBridge(abi.raw, listOf(INTENT), "Z", 3, """
            invoke-static {p0, p1}, $FALLBACK->recoverMediaPlay(Ljava/lang/Object;Landroid/content/Intent;)Z
            move-result v0
            if-eqz v0, :stock
            return v0
            :stock
            invoke-super {p0, p1}, $raw
            move-result v0
            return v0
        """)
    }
}
