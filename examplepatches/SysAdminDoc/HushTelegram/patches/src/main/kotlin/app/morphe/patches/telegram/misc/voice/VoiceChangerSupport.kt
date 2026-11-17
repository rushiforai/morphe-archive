/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.settings.sendToStandIn
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VOICE_CHANGER = "$EXTENSION_PACKAGE/misc/VoiceChanger;"
internal const val AUDIO_RECORD = "Landroid/media/AudioRecord;"
/** The microphone read both voice recorders make, a chunk at a time into a direct buffer. */
internal const val AUDIO_READ = "$AUDIO_RECORD->read(Ljava/nio/ByteBuffer;I)I"
internal const val VOICE_CHANGER_READ = "$VOICE_CHANGER->read(${AUDIO_RECORD}Ljava/nio/ByteBuffer;I)I"
/** Telegram's newer voice recorder, which its server can turn on, keeps its microphone here. */
internal const val RECORDER_V2_PACKAGE = "Lorg/telegram/utils/recorder/audio/"

/** One recorder's microphone read: its class, its method, and which of the method's microphone reads it is. */
internal data class VoiceRead(val type: String, val method: String, val nth: Int)

/**
 * The voice changer's two reads, or [missing], why this build can't take it. Each is found again
 * on the mutable class, since the old recorder's loop is one case of a lambda class R8 merged.
 */
internal class VoiceChangerSites(val reads: List<VoiceRead>, val missing: String?) {
    fun rehearse(context: BytecodePatchContext) = reads.forEach { read ->
        swap(MutableMethod(ImmutableMethod.of(context.methodOf(read))), read.nth)
    }

    fun apply(context: BytecodePatchContext) = reads.forEach { read -> swap(context.methodOf(read), read.nth) }

    private fun BytecodePatchContext.methodOf(read: VoiceRead) =
        tgMutableClassDefBy(read.type).methods.single { key(it) == read.method }

    /** The read goes to the extension with the same registers, which reads and then changes the chunk. */
    private fun swap(method: MutableMethod, nth: Int) {
        val reads = method.implementation!!.instructions.withIndex().filter { it.value.readsMicrophone() }
        check(nth < reads.size) { "${method.definingClass}->${method.name}: the microphone read moved" }
        method.sendToStandIn(reads[nth].index, VOICE_CHANGER_READ)
    }

    companion object {
        fun missing(why: String) = VoiceChangerSites(emptyList(), why)
    }
}

private fun key(method: Method) = method.origString()

private fun Instruction.readsMicrophone() = opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) &&
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.origString() == AUDIO_READ

/**
 * Where the recorder that makes this read keeps its microphone: the field the AudioRecord was
 * read from just before, or null when it came from anywhere else (a local, a parameter, a branch).
 */
private fun recorderField(instructions: List<Instruction>, at: Int): FieldReference? {
    val read = instructions[at]
    val record = when (read) {
        is FiveRegisterInstruction -> read.registerC
        is RegisterRangeInstruction -> read.startRegister
        else -> return null
    }
    for (i in at - 1 downTo 0) {
        val instruction = instructions[i]
        if (instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA == record) {
            if (instruction.opcode != Opcode.IGET_OBJECT) return null
            return (instruction as ReferenceInstruction).reference as? FieldReference
        }
        // A branch target or a jump means the register could come from more than one place.
        if (instruction.opcode.canContinue().not() || instruction.opcode in BRANCHES) return null
    }
    return null
}

private val BRANCHES = setOf(
    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
    Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH,
)

/**
 * Telegram 13.2 records voice messages two ways. Its own recorder keeps the microphone on
 * MediaController and reads it in a loop on the recording thread. The newer one, which Telegram's
 * server can switch an account to, keeps its own in the recorder package. Both read 16-bit chunks
 * into a direct buffer, then draw the waveform from the chunk and encode it, so swapping the read
 * changes the message, its waveform and the uploaded file alike.
 *
 * The camera's round videos, calls and anything else reading a microphone keep their own reads.
 */
internal fun BytecodePatchContext.resolveVoiceChanger(): VoiceChangerSites {
    controlHook(VOICE_CHANGER, "read", listOf(AUDIO_RECORD, "Ljava/nio/ByteBuffer;", "I"), "I")
    val own = mutableListOf<VoiceRead>()
    val newer = mutableListOf<VoiceRead>()
    for (classDef in classDefsMentioning(Mention.reference(AUDIO_READ))) {
        for (method in classDef.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            var nth = -1
            instructions.forEachIndexed { index, instruction ->
                if (!instruction.readsMicrophone()) return@forEachIndexed
                nth++
                val field = recorderField(instructions, index) ?: return@forEachIndexed
                if (field.origType != AUDIO_RECORD) return@forEachIndexed
                val site = VoiceRead(classDef.origType, key(method), nth)
                when {
                    field.origDefiningClass == MEDIA_CONTROLLER -> own += site
                    field.origDefiningClass.startsWith(RECORDER_V2_PACKAGE) -> newer += site
                }
            }
        }
    }
    if (own.size != 1) return VoiceChangerSites.missing("Telegram's own voice recorder no longer has one microphone read (${own.size})")
    if (newer.size != 1) return VoiceChangerSites.missing("Telegram's newer voice recorder no longer has one microphone read (${newer.size})")
    return VoiceChangerSites(own + newer, null)
}
