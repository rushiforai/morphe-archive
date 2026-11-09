/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val VIDEO_TURN = "$EXTENSION_PACKAGE/misc/VideoTurn;"
internal const val FULL_SCREEN = "$VIDEO_TURN->fullScreen(Landroid/app/Activity;I)V"
internal const val PHOTO_VIEWER = "Lorg/telegram/ui/PhotoViewer;"
internal const val GET_ROTATION = "Landroid/view/Display;->getRotation()I"
internal const val SET_ORIENTATION = "Landroid/app/Activity;->setRequestedOrientation(I)V"

/** How far after reading the screen's rotation the button turns it, in instructions. */
private const val TURN_WINDOW = 10

/**
 * The video viewer's full screen button where it turns the screen to one landscape side, or
 * [missing], why this build can't have the switch. [calls] are the two turns in [method].
 */
internal class FullScreenTurn(val method: MutableMethod?, val calls: List<Int>, val missing: String?) {
    /** The same edit on a copy, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        if (method != null) swap(MutableMethod(ImmutableMethod.of(method)))
    }

    fun apply() {
        if (method != null) swap(method)
    }

    /** The activity and the side Telegram picked go to the extension, in the same registers. */
    private fun swap(target: MutableMethod) {
        for (index in calls) {
            val (activity, side) = target.getInstruction(index).namedRegisters()
            target.replaceInstruction(index, "invoke-static {v$activity, v$side}, $FULL_SCREEN")
        }
    }
}

/**
 * The full screen button reads which way the screen faces and turns it to reverse landscape when
 * it faces 270 degrees, to landscape otherwise. Both are fixed sides that ignore the sensor until
 * full screen ends. That pair of turns, right after the one rotation read in a method working on
 * the video viewer, is the only one in the app.
 */
internal fun BytecodePatchContext.resolveFullScreenTurn(): FullScreenTurn {
    controlHook(VIDEO_TURN, "fullScreen", listOf("Landroid/app/Activity;", "I"), "V")
    requireStatusMethod("videoEitherLandscape")
    fun missing(why: String) = FullScreenTurn(null, emptyList(), why)

    val found = mutableListOf<Triple<String, String, List<Int>>>()
    forEachClassMentioning(Mention.allReferences(listOf(GET_ROTATION, SET_ORIENTATION)) and Mention.type(PHOTO_VIEWER)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            val body = m.controlBody()
            if (body.none { it.controlRef()?.startsWith("$PHOTO_VIEWER->") == true }) continue
            for (read in body.indices.filter { body[it].controlRef() == GET_ROTATION }) {
                val turns = (read + 1 until minOf(body.size, read + TURN_WINDOW)).filter { body[it].controlRef() == SET_ORIENTATION }
                if (turns.size == 2) found += Triple(cls.type, m.toString(), turns)
            }
        }
    }
    if (found.size != 1) return missing("the video viewer no longer turns full screen in one place (${found.size})")
    val (type, signature, turns) = found.single()
    val method = tgMutableClassDefBy(type).methods.single { it.toString() == signature }
    val body = method.controlBody()
    if (turns.any { body[it].opcode != Opcode.INVOKE_VIRTUAL || body[it].namedRegisters().size != 2 }) {
        return missing("the full screen button no longer turns the screen with a plain call")
    }
    return FullScreenTurn(method, turns, null)
}
