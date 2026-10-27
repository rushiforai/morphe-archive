/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VIDEO_UPRIGHT = "$EXTENSION_PACKAGE/misc/VideoUpright;"
internal const val LISTENER_ON_HOOK = "$VIDEO_UPRIGHT->listenerOn(Landroid/view/OrientationEventListener;)V"
internal const val LISTENER_OFF_HOOK = "$VIDEO_UPRIGHT->listenerOff(Landroid/view/OrientationEventListener;)V"
internal const val REQUESTED_HOOK = "$VIDEO_UPRIGHT->requested(Landroid/app/Activity;)I"
internal const val RESTORE_HOOK = "$VIDEO_UPRIGHT->restore(Landroid/app/Activity;I)V"
internal const val GET_ORIENTATION = "Landroid/app/Activity;->getRequestedOrientation()I"
internal const val LISTENER = "Landroid/view/OrientationEventListener;"
internal const val LISTENER_ON = "$LISTENER->enable()V"
internal const val LISTENER_OFF = "$LISTENER->disable()V"
private const val ACTIVITY = "Landroid/app/Activity;"

/**
 * Where the video viewer touches the app's orientation, and what each of those places becomes.
 * [missing] is why this build can't have the switch.
 */
internal class UprightHooks(val edits: List<Edit>, val missing: String?) {
    /** One call in [signature] of [type] at [index], and the hook it goes to. */
    class Edit(val type: String, val signature: String, val index: Int, val hook: String)

    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse(context: BytecodePatchContext) {
        for ((method, calls) in grouped(context)) swap(MutableMethod(ImmutableMethod.of(method)), calls)
    }

    fun apply(context: BytecodePatchContext) {
        for ((method, calls) in grouped(context)) swap(method, calls)
    }

    private fun grouped(context: BytecodePatchContext) = edits.groupBy { it.type to it.signature }.map { (key, calls) ->
        context.mutableClassDefBy(key.first).methods.single { it.toString() == key.second } to calls
    }

    /** Each call keeps its registers: the activity, the listener or the side, and any result goes where it did. */
    private fun swap(target: MutableMethod, calls: List<Edit>) {
        for (call in calls) {
            val registers = target.getInstruction(call.index).namedRegisters().joinToString { "v$it" }
            target.replaceInstruction(call.index, "invoke-static {$registers}, ${call.hook}")
        }
    }
}

/**
 * The video viewer never turns the screen on its own. Its full screen button asks for a landscape
 * side, the exit button and the sensor listener ask for the orientation it saved, and closing the
 * viewer asks for it too. The app's orientation is read in the two buttons to save it. Everything
 * else is the activity following the sensor. Reading, restoring, and the listener's switching on
 * and off while a video plays, are the places to hold the screen upright and to give it back.
 *
 * The two landscape turns are [turn]'s, left to it. A build where it isn't found has no switch,
 * since a restore hook that took a landscape turn for a restore would hold it upright.
 */
internal fun BytecodePatchContext.resolveVideoUpright(turn: FullScreenTurn): UprightHooks {
    controlHook(VIDEO_UPRIGHT, "listenerOn", listOf(LISTENER), "V")
    controlHook(VIDEO_UPRIGHT, "listenerOff", listOf(LISTENER), "V")
    controlHook(VIDEO_UPRIGHT, "requested", listOf(ACTIVITY), "I")
    controlHook(VIDEO_UPRIGHT, "restore", listOf(ACTIVITY, "I"), "V")
    requireStatusMethod("videoOnlyFromButton")
    fun missing(why: String) = UprightHooks(emptyList(), why)
    if (turn.method == null) return missing("the full screen button wasn't found")

    val turnSignature = turn.method.toString()
    val turned = turn.calls.toSet()
    val edits = mutableListOf<UprightHooks.Edit>()
    val listenerTypes = mutableSetOf<String>()
    val switches = mutableListOf<Pair<UprightHooks.Edit, String?>>()
    var activityFields = 0
    val wanted = listOf(SET_ORIENTATION, GET_ORIENTATION, LISTENER_ON, LISTENER_OFF)
    forEachClassMentioning(Mention.type(PHOTO_VIEWER) and Mention.anyReference(wanted)) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.type == PHOTO_VIEWER) activityFields += cls.fields.count { it.type == ACTIVITY }
        if (cls.superclass == LISTENER && cls.fields.count { it.type == PHOTO_VIEWER } == 1) listenerTypes += cls.type
        for (m in cls.methods) {
            val body = m.controlBody()
            if (body.none { it.controlRef()?.startsWith("$PHOTO_VIEWER->") == true }) continue
            for (i in body.indices) {
                val hook = when (body[i].controlRef()) {
                    SET_ORIENTATION -> if (m.toString() == turnSignature && i in turned) null else RESTORE_HOOK
                    GET_ORIENTATION -> REQUESTED_HOOK
                    LISTENER_ON -> LISTENER_ON_HOOK
                    LISTENER_OFF -> LISTENER_OFF_HOOK
                    else -> null
                } ?: continue
                val registers = if (body[i].opcode == Opcode.INVOKE_VIRTUAL) body[i].namedRegisters().size else -1
                val expected = if (hook == RESTORE_HOOK) 2 else 1
                if (registers != expected) return missing("the video viewer no longer calls ${body[i].controlRef()} with a plain call")
                val edit = UprightHooks.Edit(cls.type, m.toString(), i, hook)
                if (hook == LISTENER_ON_HOOK || hook == LISTENER_OFF_HOOK) {
                    // Another player in the app has a sensor listener of its own, so a switch counts only when the listener is the viewer's.
                    switches += edit to listenerRead(body, i)
                } else {
                    edits += edit
                }
            }
        }
    }
    val listeners = listenerTypes.size
    edits += switches.filter { it.second in listenerTypes }.map { it.first }
    fun count(hook: String) = edits.count { it.hook == hook }
    if (count(LISTENER_ON_HOOK) != 1) return missing("the video viewer no longer starts its sensor listener in one place (${count(LISTENER_ON_HOOK)})")
    if (count(LISTENER_OFF_HOOK) == 0) return missing("the video viewer no longer stops its sensor listener")
    if (count(REQUESTED_HOOK) == 0 || count(RESTORE_HOOK) < 3) return missing("the video viewer no longer saves and puts back the orientation")
    if (listeners != 1) return missing("the video viewer's sensor listener wasn't found ($listeners)")
    if (activityFields != 1) return missing("the video viewer no longer holds its activity in one place ($activityFields)")
    return UprightHooks(edits, null)
}

/**
 * The type of the field a listener switch at [at] got its listener from, or null. The viewer's
 * release checks the listener for null between the read and the switch, so null checks on the
 * listener's register are passed over.
 */
private fun listenerRead(body: List<Instruction>, at: Int): String? {
    val listener = body[at].namedRegisters().firstOrNull() ?: return null
    var read = at - 1
    while (read >= 0 && body[read].opcode in NULL_CHECKS && body[read].namedRegisters() == listOf(listener)) read--
    return body.getOrNull(read)?.takeIf { it.opcode == Opcode.IGET_OBJECT && it.namedRegisters().first() == listener }?.controlField()?.type
}

private val NULL_CHECKS = setOf(Opcode.IF_EQZ, Opcode.IF_NEZ)
