package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * #224: the send, sent and in-app message sounds, picked in settings instead of at patch time.
 *
 * Messenger plays all three through one static method of its sound player, `(Player, F, I, I, Z)Z`, whose third
 * parameter is the sound's raw resource id. Unless the resource is a zip, it opens it as a file descriptor, hands the
 * descriptor's file, offset and length to a MediaPlayer and closes it:
 *
 *     invoke-virtual {vR, vId}, Resources;->openRawResourceFd(I)AssetFileDescriptor      <- the hook replaces this
 *     move-result-object vD
 *     ...
 *     invoke-virtual {vD}, AssetFileDescriptor;->getFileDescriptor()FileDescriptor
 *     invoke-virtual {vD}, AssetFileDescriptor;->getStartOffset()J
 *     invoke-virtual {vD}, AssetFileDescriptor;->getLength()J
 *     invoke-virtual/range {...}, MediaPlayer;->setDataSource(FileDescriptor, J, J)V
 *     ...
 *     invoke-virtual {vD}, AssetFileDescriptor;->close()V
 *
 * The open becomes an extension call on the same two registers. It answers with a descriptor of the file picked for that
 * sound, or with Messenger's own openRawResourceFd when there's none, so everything after it runs as it did. A thread's
 * new-message sound goes out through a Uri on another path, which this leaves alone.
 */
internal const val OWN_CHAT_SOUNDS = "own_chat_sounds"
internal const val OWN_CHAT_SOUNDS_CALL =
    "Lapp/hushmessenger/extension/OwnChatSounds;->rawSound(Landroid/content/res/Resources;I)Landroid/content/res/AssetFileDescriptor;"
private const val RAW_SOUND_OPEN = "Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;"
private const val RAW_SOUND_SOURCE = "Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V"
private val RAW_SOUND_READS = listOf("getFileDescriptor()Ljava/io/FileDescriptor;", "getStartOffset()J", "getLength()J", "close()V")
    .map { "Landroid/content/res/AssetFileDescriptor;->$it" }

/** The open call's index, its resources and id registers, and whether the hook is in. */
internal class RawSoundSite(val call: Int, val resources: Int, val id: Int, val hooked: Boolean)

private fun Instruction.rawSoundCall(): String? = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

/** The player's sound method by its outline alone: static `(Player, F, I, I, Z)Z` on the player's own class. */
internal fun Method.isRawSoundPlayer(): Boolean =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" && implementation != null &&
        parameterTypes.map { it.toString() } == listOf(definingClass, "F", "I", "I", "Z")

/** Where the hook goes in [this], or null when it isn't the sound method's stock or hooked shape. */
internal fun Method.rawSoundSite(): RawSoundSite? {
    if (!isRawSoundPlayer()) return null
    val code = implementation!!.instructions.toList()
    val id = implementation!!.registerCount - 3
    val stock = code.indices.filter { code[it].opcode == Opcode.INVOKE_VIRTUAL && code[it].rawSoundCall() == RAW_SOUND_OPEN }
    val hooked = code.indices.filter { code[it].opcode == Opcode.INVOKE_STATIC && code[it].rawSoundCall() == OWN_CHAT_SOUNDS_CALL }
    val call = when {
        stock.size == 1 && hooked.isEmpty() -> stock.single()
        stock.isEmpty() && hooked.size == 1 -> hooked.single()
        else -> return null
    }
    val open = code[call] as FiveRegisterInstruction
    if (open.registerCount != 2 || open.registerD != id) return null
    val result = code.getOrNull(call + 1)
    if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    // The descriptor goes to the player as its file, offset and length, and is closed after.
    val descriptor = (result as OneRegisterInstruction).registerA
    val reads = code.filter { it.opcode == Opcode.INVOKE_VIRTUAL && (it as FiveRegisterInstruction).registerCount == 1 && it.registerC == descriptor }
        .mapNotNull { it.rawSoundCall() }.toSet()
    if (!reads.containsAll(RAW_SOUND_READS) || code.count { it.rawSoundCall() == RAW_SOUND_SOURCE } != 1) return null
    return RawSoundSite(call, open.registerC, id, hooked.isNotEmpty())
}

/** The methods with the sound method's outline, held to its whole shape by the finder. */
internal val rawSoundPlayers = methodCheck { _, method -> method.isRawSoundPlayer() }

internal fun findOwnChatSounds(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(rawSoundPlayers.methods(classes).filter { it.rawSoundSite() != null }.singleOrNull())

internal fun MutableMethod.validateOwnChatSounds(): RawSoundSite = rawSoundSite()
    ?: throw PatchException("Messenger controls: the chat sound player ${hookId()} no longer matches the tested build")

/** Messenger's open of the raw sound goes through the extension, which reads the same resources and id. */
internal fun MutableMethod.injectOwnChatSounds() {
    val site = validateOwnChatSounds()
    if (site.hooked) return
    replaceInstruction(site.call, "invoke-static {v${site.resources}, v${site.id}}, $OWN_CHAT_SOUNDS_CALL")
}
