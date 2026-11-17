/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.sendToStandIn
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Custom save sound"

internal const val MEDIA_PLAYER = "Landroid/media/MediaPlayer;"

/** The resource name of the chime Pinterest plays when a pin is saved. */
internal const val SAVE_CHIME = "success_2"

/** What MediaPlayer.create takes for a raw resource. UiHooks.saveSound takes the same. */
internal val RAW_PLAYER_SHAPE = listOf("Landroid/content/Context;", "I")

internal const val SAVE_SOUND_HOOK = "$UI_HOOKS->saveSound(Landroid/content/Context;I)$MEDIA_PLAYER"

/** One player for the save chime: the [method] and where in it MediaPlayer.create is called. */
internal data class SaveChime(val method: Method, val index: Int)

@Suppress("unused")
val customSaveSoundPatch = bytecodePatch(
    name = PATCH,
    description = "Plays a sound file you pick on your phone when you save a pin, in place of Pinterest's chime. " +
        "Pinterest's other sounds stay. Starts off. Pick the sound with Pick a save sound in HushPinterest " +
        "settings > Interface, which turns the switch on for you.",
) {
    category("Theme")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("customSaveSound")
        requireStatusMethod("saveSound")
        requireSaveSoundHook()
        val chimes = saveChimes()
        if (chimes.isEmpty()) throw PatchException("$PATCH: this Pinterest build makes no player for its save chime")
        // Each player goes to the hook, which takes the same registers in the same order and answers
        // a player, so the move-result after it stays right. A method's later calls go first, so
        // the earlier indexes still point where they were found.
        chimes.groupBy { it.method }.forEach { (method, sites) ->
            val target = mutable(method)
            sites.sortedByDescending { it.index }.forEach { site ->
                target.instructions().getOrNull(site.index)?.takeIf { it.isRawPlayerCall() } ?: throw PatchException(
                    "$PATCH: ${method.definingClass}->${method.name} doesn't make its player where it was found",
                )
                target.sendToStandIn(site.index, SAVE_SOUND_HOOK)
            }
        }
        enableCapability("saveSound")
        enableStatus("customSaveSound")
    }
}

/** Throws unless UiHooks has a public static saveSound that takes what MediaPlayer.create does. */
private fun BytecodePatchContext.requireSaveSoundHook() {
    mutableClassDefBy(UI_HOOKS).methods.singleOrNull { method ->
        method.name == "saveSound" && method.parameterTypes.map(CharSequence::toString) == RAW_PLAYER_SHAPE &&
            method.returnType == MEDIA_PLAYER &&
            AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags)
    } ?: throw PatchException("$UI_HOOKS has no saveSound(${RAW_PLAYER_SHAPE.joinToString("")})")
}

/**
 * Every call in Pinterest that makes a player for the save chime: MediaPlayer.create on a raw
 * resource whose id was read from the chime's R field by the instruction right before it. The R
 * field keeps its resource name in every build, while the classes around it are renamed.
 */
internal fun BytecodePatchContext.saveChimes(): List<SaveChime> {
    val found = mutableListOf<SaveChime>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.forEach { method -> saveChimeIndexes(method).forEach { found += SaveChime(method, it) } }
    }
    return found
}

/** Where [method] makes a player for the save chime. */
internal fun saveChimeIndexes(method: Method): List<Int> {
    val body = method.instructions()
    return body.indices.filter { index ->
        index > 0 && body[index].isRawPlayerCall() && body[index - 1].readsSaveChimeInto((body[index] as FiveRegisterInstruction).registerD)
    }
}

/** True for an invoke-static of MediaPlayer.create(Context, int) on two plain registers. */
internal fun Instruction.isRawPlayerCall(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC || this !is FiveRegisterInstruction || registerCount != 2) return false
    val call = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return call.definingClass == MEDIA_PLAYER && call.name == "create" && call.returnType == MEDIA_PLAYER &&
        call.parameters() == RAW_PLAYER_SHAPE
}

/** True for an sget of the save chime's int R field into [register]. */
private fun Instruction.readsSaveChimeInto(register: Int): Boolean {
    if (opcode != Opcode.SGET) return false
    val field = (this as ReferenceInstruction).reference as? FieldReference ?: return false
    return field.name == SAVE_CHIME && field.type == "I" && (this as OneRegisterInstruction).registerA == register
}
