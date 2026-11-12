/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CONTINUATION_REWRITE =
    "Lapp/morphe/extension/music/patches/downloads/NativeDownloads;" +
            "->libraryContinuation(Ljava/lang/String;)Ljava/lang/String;"

/** Downloads is a Library continuation, not a dispatched BrowseEndpoint. Keep native routing on that surface. */
internal fun BytecodePatchContext.installDeviceLibraryChips() {
    try {
        val local = Fingerprint(name = "<clinit>", strings = listOf(
            "com/google/android/apps/youtube/music/sideloaded/service/SideloadedBrowsePageGenerationService",
        )).classDef.type
        val offline = Fingerprint(name = "<clinit>", strings = listOf(
            "com/google/android/apps/youtube/music/offline/service/OfflineBrowsePageGenerationService",
        )).classDef.type
        Fingerprint(strings = listOf(
            "SIDELOADED_LIBRARY_RELOAD_CONTINUATION_TOKEN_TRACKS",
            "SIDELOADED_LIBRARY_RELOAD_CONTINUATION_TOKEN_PLAYLISTS",
            "SIDELOADED_LIBRARY_RELOAD_CONTINUATION_TOKEN_ALBUMS",
        )).classDef

        val factory = mutableClassDefBy(local).methods.single { method ->
            method.parameterTypes.size == 1 && method.returnType.startsWith("L") &&
                    method.implementation?.instructions?.any { instruction ->
                        instruction.opcode == Opcode.INVOKE_INTERFACE &&
                                instruction.getReference<MethodReference>()?.let {
                                    it.definingClass == method.parameterTypes[0].toString() &&
                                            it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
                                } == true
                    } == true
        }
        val getter = factory.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }
            .single { it.definingClass == factory.parameterTypes[0].toString() &&
                    it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" }
        val selector = Fingerprint(
            parameters = factory.parameterTypes.map { it.toString() },
            returnType = factory.returnType,
            custom = { method, owner ->
                owner.fields.any { it.type == local } && owner.fields.any { it.type == offline } &&
                        method.implementation?.instructions?.any {
                            it.getReference<MethodReference>()?.toString() == getter.toString()
                        } == true
            },
        ).method
        val hooks = listOf(selector, factory).map { method ->
            val instructions = method.implementation!!.instructions.toList()
            val read = instructions.indices.single {
                instructions[it].getReference<MethodReference>()?.toString() == getter.toString()
            }
            check(instructions[read + 1].opcode == Opcode.MOVE_RESULT_OBJECT) { "missing continuation result" }
            Triple(method, read + 2, method.getInstruction<OneRegisterInstruction>(read + 1).registerA)
        }

        // Both reads must agree: choosing a different service but passing its old token would fail native parsing.
        hooks.forEach { (method, index, register) ->
            method.addInstructions(index, """
                invoke-static/range {v$register .. v$register}, $CONTINUATION_REWRITE
                move-result-object v$register
            """)
        }
        printInfo("Device files Downloads chip: selector $selector, factory $factory")
    } catch (ex: Exception) {
        printWarn("Device files Downloads chip routing is unavailable on this Music version: ${ex.message}")
    }
}
