/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.util.Utils.printInfo
import app.morphe.util.fingerprint.matchSingle
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val GUARD_SWAP = "Lapp/morphe/extension/music/patches/downloads/StreamSwap;"
private const val URI = "Landroid/net/Uri;"

/** The `DataSpec` class, identified by its `toString`. */
internal fun BytecodePatchContext.streamSwapDataSpec() = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("DataSpec["),
).matchSingle().classDef

/**
 * The stock offline data-source wrapper (9.40.51 `Laakm`, 9.15.51 `Laxjn`, 8.30.54 `Laufk`) opens its upstream only
 * after `isLoopback(uri)` is false; otherwise it throws an `IOException`. Every loopback request that misses the
 * offline cache therefore fails before a socket exists. Route that one predicate through the extension, which keeps the
 * stock answer for everything except issued tokens. Kept conservatively: the file route normally bypasses it,
 * but removing the exemption from the proven combination has not been device-tested on all three versions.
 */
internal fun BytecodePatchContext.prepareStreamSwapGuard(): () -> Unit {
        val dataSpecType = streamSwapDataSpec().type
        val predicate = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = "Z",
            parameters = listOf(URI),
            strings = listOf("127.0.0.1", "localhost"),
        ).matchSingle().method
        val guard = Fingerprint(
            returnType = "J",
            parameters = listOf(dataSpecType),
            custom = { method, _ -> method.loopbackCheckIndex(predicate) >= 0 },
        ).matchSingle().method
        val instructions = guard.implementation!!.instructions.toList()
        val index = guard.loopbackCheckIndex(predicate)
        val register = (instructions[index] as FiveRegisterInstruction).registerC
        val openIndex = instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_INTERFACE && it.getReference<MethodReference>()?.let { reference ->
                reference.returnType == "J" &&
                    reference.parameterTypes.map(CharSequence::toString) == listOf(dataSpecType)
            } == true
        }
        check(openIndex > index) { "no upstream open after the guard" }

        return {
        guard.replaceInstruction(index, "invoke-static {v$register}, $GUARD_SWAP->blocksLoopback($URI)Z")
        printInfo("StreamSwap: loopback guard hooked ${guard.definingClass}->${guard.name} replacing " +
            "${predicate.definingClass}->${predicate.name}")
    }
}

private fun Method.loopbackCheckIndex(predicate: Method): Int = implementation?.instructions?.indexOfFirst {
    it.opcode == Opcode.INVOKE_STATIC && it.getReference<MethodReference>()?.let { reference ->
        reference.definingClass == predicate.definingClass && reference.name == predicate.name &&
            reference.parameterTypes == predicate.parameterTypes
    } == true
} ?: -1
