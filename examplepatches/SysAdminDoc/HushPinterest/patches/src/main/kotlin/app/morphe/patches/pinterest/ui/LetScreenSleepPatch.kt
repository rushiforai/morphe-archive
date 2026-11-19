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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Let the screen sleep"

/** The call that holds the screen on for as long as its view is on the screen. */
internal const val KEEP_SCREEN_ON = "Landroid/view/View;->setKeepScreenOn(Z)V"

/** The calls that can put a window's own screen hold on: its flags added, or set under a mask. */
internal const val ADD_WINDOW_FLAGS = "Landroid/view/Window;->addFlags(I)V"
internal const val SET_WINDOW_FLAGS = "Landroid/view/Window;->setFlags(II)V"

internal const val SCREEN_SLEEP_HOOK = "$UI_HOOKS->keepScreenOn(Landroid/view/View;Z)V"
internal const val ADD_WINDOW_FLAGS_HOOK = "$UI_HOOKS->addWindowFlags(Landroid/view/Window;I)V"
internal const val SET_WINDOW_FLAGS_HOOK = "$UI_HOOKS->setWindowFlags(Landroid/view/Window;II)V"

/** Each call that can hold the screen on, with the UiHooks stand-in that takes it over on the same registers. */
internal val SCREEN_HOLD_HOOKS = linkedMapOf(
    KEEP_SCREEN_ON to SCREEN_SLEEP_HOOK,
    ADD_WINDOW_FLAGS to ADD_WINDOW_FLAGS_HOOK,
    SET_WINDOW_FLAGS to SET_WINDOW_FLAGS_HOOK,
)

/** One call in Pinterest that can ask to hold the screen on: the [method], where in it, and which [call]. */
internal data class ScreenHold(val method: Method, val index: Int, val call: String)

@Suppress("unused")
val letScreenSleepPatch = bytecodePatch(
    name = PATCH,
    description = "Lets the screen turn off after your phone's usual timeout while a pin is open. Pinterest keeps " +
        "it on while a video is on the screen, playing or not. Starts off. Turn it on in HushPinterest settings > " +
        "Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("letScreenSleep")
        requireStatusMethod("screenSleep")
        requireScreenSleepHooks()
        val holds = screenHolds()
        if (holds.isEmpty()) throw PatchException("$PATCH: this Pinterest build never asks to hold the screen on")
        // Each hook takes the call's own registers and answers nothing, as the call it stands in for
        // does. A pin page with a video holds its whole window on through addFlags (#47), so every
        // window flag call goes through, and the hook drops only the screen hold. A method's later
        // calls go first, so earlier indexes still hold.
        holds.groupBy { it.method }.forEach { (method, sites) ->
            val target = mutable(method)
            sites.sortedByDescending { it.index }.forEach { site ->
                target.instructions().getOrNull(site.index)?.takeIf { it.screenHoldCall() == site.call } ?: throw PatchException(
                    "$PATCH: ${method.definingClass}->${method.name} doesn't hold the screen where it was found",
                )
                target.sendToStandIn(site.index, SCREEN_HOLD_HOOKS.getValue(site.call))
            }
        }
        enableCapability("screenSleep")
        enableStatus("letScreenSleep")
    }
}

/** Throws unless UiHooks has each of [SCREEN_HOLD_HOOKS] as a public static method answering nothing. */
private fun BytecodePatchContext.requireScreenSleepHooks() {
    val methods = mutableClassDefBy(UI_HOOKS).methods
    for (hook in SCREEN_HOLD_HOOKS.values) {
        val signature = hook.substringAfter("->")
        methods.singleOrNull { method ->
            method.name == signature.substringBefore('(') &&
                method.parameterTypes.joinToString("") { it.toString() } == signature.substringAfter('(').substringBefore(')') &&
                method.returnType == "V" &&
                AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags)
        } ?: throw PatchException("$UI_HOOKS has no $signature")
    }
}

/** Every call in Pinterest's own code that can hold the screen on, the extension's left out. */
internal fun BytecodePatchContext.screenHolds(): List<ScreenHold> {
    val found = mutableListOf<ScreenHold>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.forEach { method ->
            val body = method.implementation?.instructions?.toList() ?: return@forEach
            screenHoldIndexes(method).forEach { found += ScreenHold(method, it, body[it].screenHoldCall()!!) }
        }
    }
    return found
}

/** Where [method] makes one of the calls in [SCREEN_HOLD_HOOKS]. */
internal fun screenHoldIndexes(method: Method): List<Int> {
    val body = method.implementation?.instructions?.toList() ?: return emptyList()
    return body.indices.filter { body[it].screenHoldCall() != null }
}

/** The [SCREEN_HOLD_HOOKS] call an invoke-virtual makes, or null when it makes none of them. */
internal fun Instruction.screenHoldCall(): String? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val call = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString() ?: return null
    return call.takeIf { it in SCREEN_HOLD_HOOKS }
}
