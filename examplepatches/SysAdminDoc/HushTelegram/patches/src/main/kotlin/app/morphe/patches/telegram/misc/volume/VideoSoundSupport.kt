/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.names.addInstructions
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val VIDEO_SOUND = "$EXTENSION_PACKAGE/misc/VideoSound;"
internal const val SET_MUTE_HOOK = "$VIDEO_SOUND->setMute(Ljava/lang/Object;I)V"
internal const val SET_VOLUME_HOOK = "$VIDEO_SOUND->setVolume(Ljava/lang/Object;F)V"
internal const val VOLUME_KEY_HOOK = "$VIDEO_SOUND->volumeKey(Ljava/lang/Object;Landroid/view/KeyEvent;)V"
private const val OBJECT = "Ljava/lang/Object;"
private const val KEY_EVENT = "Landroid/view/KeyEvent;"
private const val REPEAT_COUNT = "$KEY_EVENT->getRepeatCount()I"
private const val VIEWER_KEYS = "dispatchKeyEvent($KEY_EVENT)Z"
private const val VOLUME_UP = 24
private const val VOLUME_DOWN = 25
/** How soon after reading the viewer's mute flag its player is told whether to be muted. */
private const val MUTE_REACH = 10

/**
 * The viewer's calls that mute its player or set its volume, the hooks they go to, and the
 * player's own two methods the stubs hand them back to. [missing] is why this build can't have
 * the switch.
 */
internal class SoundHooks(
    edits: List<UprightHooks.Edit>,
    val setMute: MethodReference?,
    val setVolume: MethodReference?,
    val missing: String?,
    val key: KeyHook? = null,
) {
    private val calls = UprightHooks(edits, missing)
    val edits get() = calls.edits

    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse(context: BytecodePatchContext) {
        calls.rehearse(context)
        key?.let { MutableMethod(ImmutableMethod.of(it.method(context))).addInstructions(0, it.smali) }
    }

    /** The stubs first, then each call: the player and its value go to the extension in the same registers. */
    fun apply(context: BytecodePatchContext) {
        val mute = setMute!!
        val volume = setVolume!!
        context.writeStub(VIDEO_SOUND, "stockSetMute", 2, """
            check-cast p0, ${mute.definingClass}
            invoke-virtual {p0, p1}, $mute
            return-void
        """)
        context.writeStub(VIDEO_SOUND, "stockSetVolume", 2, """
            check-cast p0, ${volume.definingClass}
            invoke-virtual {p0, p1}, $volume
            return-void
        """)
        // The calls go in by index first, then the key hook goes in ahead of them.
        calls.apply(context)
        key!!.let { it.method(context).addInstructions(0, it.smali) }
    }
}

/**
 * The viewer window's key dispatch gives its player full volume only for a video in the editor, so
 * a chat video the switch kept silent never got its sound back from a volume key (#61). Before
 * anything else, the dispatch hands the extension its viewer's player and the key: [viewer] read
 * from the window in [window], then [player] read from the viewer, through local [scratch].
 */
internal class KeyHook(
    val type: String,
    val signature: String,
    val viewer: FieldReference,
    val player: FieldReference,
    val scratch: Int,
    val window: Int,
    val event: Int,
) {
    val smali get() = """
        iget-object v$scratch, v$window, ${viewer.smali()}
        iget-object v$scratch, v$scratch, ${player.smali()}
        invoke-static {v$scratch, v$event}, $VOLUME_KEY_HOOK
    """

    fun method(context: BytecodePatchContext) = context.tgMutableClassDefBy(type).methods.single { it.toString() == signature }

    private fun FieldReference.smali() = "$definingClass->$name:$type"
}

/**
 * The video viewer's player plays with sound unless the viewer's mute flag, set only for a video
 * about to be sent without sound, says otherwise (#61). Every place the viewer tells its player
 * whether to be muted reads that flag first: when a video starts, buffers, shows its first frame,
 * or stops casting. Its window's volume keys give the player full volume unless that flag is set,
 * and the editor's tap and start set the volume too, after reading it.
 *
 * The window's key dispatch names all three: the flag is the viewer's first boolean it reads, and
 * full volume is the call on the player field it reads afterwards. The mute call is the player's
 * one method taking a boolean that follows a read of the flag. Every call of either in a method
 * that reads the flag is the viewer's, and goes to the extension.
 */
internal fun BytecodePatchContext.resolveVideoSound(): SoundHooks {
    controlHook(VIDEO_SOUND, "setMute", listOf(OBJECT, "I"), "V")
    controlHook(VIDEO_SOUND, "setVolume", listOf(OBJECT, "F"), "V")
    controlHook(VIDEO_SOUND, "stockSetMute", listOf(OBJECT, "Z"), "V")
    controlHook(VIDEO_SOUND, "stockSetVolume", listOf(OBJECT, "F"), "V")
    controlHook(VIDEO_SOUND, "volumeKey", listOf(OBJECT, KEY_EVENT), "V")
    requireStatusMethod("videoStartsSilent")
    fun missing(why: String) = SoundHooks(emptyList(), null, null, why)

    class Keys(val flag: String, val volume: MethodReference, val key: KeyHook?)
    val keys = mutableListOf<Keys>()
    val mention = Mention.type(PHOTO_VIEWER) and Mention.reference(REPEAT_COUNT) and Mention.literal(VOLUME_UP) and Mention.literal(VOLUME_DOWN)
    forEachClassMentioning(mention) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            if ("${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}" != VIEWER_KEYS) continue
            val body = m.controlBody()
            if (body.none { it.controlRef() == REPEAT_COUNT }) continue
            val read = body.indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef()?.startsWith("$PHOTO_VIEWER->") == true }
            if (read < 0 || body.getOrNull(read + 1)?.opcode != Opcode.IF_NEZ) continue
            for (i in read + 1 until body.size) {
                val call = body[i].method() ?: continue
                if (body[i].opcode != Opcode.INVOKE_VIRTUAL || call.parameterTypes.map { it.toString() } != listOf("F") || call.returnType != "V") continue
                if (playerField(body, i)?.type == call.definingClass) keys += Keys(body[read].controlRef()!!, call, keyHook(cls.type, m, body, read, i))
            }
        }
    }
    if (keys.size != 1) return missing("the video viewer's volume keys no longer give its player full volume in one place (${keys.size})")
    val key = keys.single().key ?: return missing("the video viewer's window no longer reads its player where a volume key can reach it")
    val flag = keys.single().flag
    val volume = keys.single().volume
    val player = volume.definingClass

    class Readers(val type: String, val signature: String, val body: List<Instruction>)
    val readers = mutableListOf<Readers>()
    forEachClassMentioning(Mention.reference(flag)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            val body = m.controlBody()
            if (body.any { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == flag }) readers += Readers(cls.type, m.toString(), body)
        }
    }
    // The player's boolean call soonest after each read of the flag.
    val mutes = readers.flatMap { r ->
        r.body.indices.filter { r.body[it].opcode == Opcode.IGET_BOOLEAN && r.body[it].controlRef() == flag }.mapNotNull { read ->
            (read + 1..minOf(read + MUTE_REACH, r.body.size - 1)).firstNotNullOfOrNull { i ->
                r.body[i].method()?.takeIf { r.body[i].opcode == Opcode.INVOKE_VIRTUAL && it.definingClass == player &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("Z") && it.returnType == "V" }
            }
        }
    }.distinctBy { it.toString() }
    if (mutes.size != 1) return missing("the video viewer no longer mutes its player in one way (${mutes.size})")
    val mute = mutes.single()
    // A player the extension can't call leaves this switch out, never the rest of the patch.
    try {
        requireReachable(mute.toString(), false)
        requireReachable(volume.toString(), false)
    } catch (unreachable: PatchException) {
        return missing("the video viewer's player can't be called from the extension")
    }

    val edits = readers.flatMap { r ->
        r.body.indices.mapNotNull { i ->
            val call = r.body[i].method()?.toString() ?: return@mapNotNull null
            val hook = when (call) {
                mute.toString() -> SET_MUTE_HOOK
                volume.toString() -> SET_VOLUME_HOOK
                else -> return@mapNotNull null
            }
            if (r.body[i].opcode != Opcode.INVOKE_VIRTUAL || r.body[i].namedRegisters().size != 2) {
                return missing("the video viewer no longer calls $call with a plain call")
            }
            UprightHooks.Edit(r.type, r.signature, i, hook)
        }
    }
    val muteCalls = edits.count { it.hook == SET_MUTE_HOOK }
    if (muteCalls < 2) return missing("the video viewer mutes its player in too few places ($muteCalls)")
    return SoundHooks(edits, mute, volume, null, key)
}

/**
 * Where the window's dispatch [method] in [type] can hand its player to the extension: the viewer
 * field the flag read at [read] got its viewer from, read from the window itself, and the player
 * field the volume call at [call] reads. Null when the window and key registers don't fit a plain
 * call, there's no local to read into, or something branches back to the start.
 */
private fun keyHook(type: String, method: Method, body: List<Instruction>, read: Int, call: Int): KeyHook? {
    val registers = method.implementation?.registerCount ?: return null
    val window = registers - 2
    val event = registers - 1
    if (window < 1 || event > 15) return null
    val viewerRegister = body[read].namedRegisters().getOrNull(1) ?: return null
    val viewer = (read - 1 downTo 0).map { body[it] }
        .firstOrNull { it.namedRegisters().firstOrNull() == viewerRegister && it.opcode != Opcode.IF_EQZ && it.opcode != Opcode.IF_NEZ }
        ?.takeIf { it.opcode == Opcode.IGET_OBJECT && it.namedRegisters().getOrNull(1) == window }
        ?.controlField()?.takeIf { it.definingClass == type } ?: return null
    val player = playerField(body, call) ?: return null
    val flow = ControlFlow.of(method)
    if (flow.normal.any { 0 in it } || flow.exceptional.any { 0 in it }) return null
    return KeyHook(type, method.toString(), viewer, player, 0, window, event)
}

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The viewer field the call at [at] got its player from: the last read into that register before it. */
private fun playerField(body: List<Instruction>, at: Int) = body[at].namedRegisters().firstOrNull()?.let { player ->
    (at - 1 downTo 0).map { body[it] }.firstOrNull { it.namedRegisters().firstOrNull() == player && it.opcode != Opcode.IF_EQZ && it.opcode != Opcode.IF_NEZ }
        ?.takeIf { it.opcode == Opcode.IGET_OBJECT && it.controlRef()?.startsWith("$PHOTO_VIEWER->") == true }?.controlField()
}
