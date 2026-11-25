package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * #224: a sound for a message that comes into the chat you have open.
 *
 * Messenger hands each incoming message to one method that picks its sound (it logs "Play sound" under
 * "notif_processing"). In the open chat it plays one for likes and stickers only. For any other message there it asks
 * whether in-app sounds would play right now (the ringer, Messenger's own In-app sounds setting, the app in front) and
 * drops the answer. The hook hands that answer to the extension, and while Sound in the open chat is on it goes on to the
 * call Messenger makes for a message from another chat while the app is open, so that same sound plays, with whatever
 * Custom chat sounds put in its place.
 *
 *     invoke-virtual {vT, vS}, Sounds;->inAppSoundsOn(FbUserSession)Z      <- answer dropped
 *     return vR                                                            <- hook goes in here
 *     ...
 *     const/16 vN, 0x83f                                                   <- and jumps here
 *     invoke-static {vN}, Strings;->get(I)String
 *     move-result-object vN
 *     invoke-virtual {vP, vS, vN}, Player;->play(FbUserSession, String)V
 *
 * vS is the session parameter in both calls. vP takes the sound object over from vT for the jump, so it's also where the
 * extension's answer goes, and the two have to be different registers.
 */
internal const val OPEN_CHAT_SOUND = "open_chat_sound"
internal const val OPEN_CHAT_SOUND_CALL = "Lapp/hushmessenger/extension/OpenChatSound;->play(Z)Z"
internal const val SOUND_TRACE = "notif_processing"
internal const val SOUND_STEP = "Play sound"
private val SOUND_PARAMETERS = listOf(FB_USER_SESSION, MESSAGE, "Z", "Z")

/** The dropped check, the in-app sound call's first instruction, both calls' registers, and whether the hook is in. */
internal class OpenChatSite(val check: Int, val play: Int, val sounds: Int, val player: Int, val hooked: Boolean)

private fun Instruction.methodCall(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** `invoke-virtual {vX, vSession}` of a `(FbUserSession)Z` method. */
private fun Instruction.isSoundCheck(session: Int): Boolean {
    val call = methodCall() ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL && call.returnType == "Z" && call.parameterTypes.map { it.toString() } == listOf(FB_USER_SESSION) &&
        (this as FiveRegisterInstruction).registerCount == 2 && registerD == session
}

/** The message sound picker: an instance method `(FbUserSession, Message, Z, Z)Z` that logs both strings. */
internal fun Method.isMessageSoundPicker(): Boolean =
    !AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" && parameterTypes.map { it.toString() } == SOUND_PARAMETERS &&
        implementation != null && codeStrings().containsAll(listOf(SOUND_TRACE, SOUND_STEP))

private fun Method.codeStrings(): Set<String> = implementation?.instructions?.mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}?.toSet().orEmpty()

/** Where the hook goes in [this], or null when it isn't the picker's stock or hooked shape. */
internal fun Method.openChatSite(): OpenChatSite? {
    if (!isMessageSoundPicker()) return null
    val code = implementation!!.instructions.toList()
    val session = implementation!!.registerCount - 4
    // The in-app message sound: a name from Messenger's string table, played for the session.
    val play = code.indices.singleOrNull { i ->
        val call = code[i].methodCall()
        code[i].opcode == Opcode.INVOKE_VIRTUAL && call != null && call.returnType == "V" &&
            call.parameterTypes.map { it.toString() } == listOf(FB_USER_SESSION, "Ljava/lang/String;")
    } ?: return null
    if (play < 3) return null
    val playCall = code[play] as FiveRegisterInstruction
    if (playCall.registerCount != 3 || playCall.registerD != session) return null
    val name = playCall.registerE
    val start = code[play - 3]
    val lookup = code[play - 2]
    val result = code[play - 1]
    if (start.opcode !in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) || (start as OneRegisterInstruction).registerA != name) return null
    val lookupCall = lookup.methodCall()
    if (lookup.opcode != Opcode.INVOKE_STATIC || lookupCall?.returnType != "Ljava/lang/String;" ||
        lookupCall.parameterTypes.map { it.toString() } != listOf("I") || (lookup as FiveRegisterInstruction).registerC != name) return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT || (result as OneRegisterInstruction).registerA != name) return null
    // The open chat's other messages: the in-app sounds check whose answer goes nowhere, or the hook already on it.
    val dropped = code.indices.filter { code[it].isSoundCheck(session) && code.getOrNull(it + 1)?.opcode == Opcode.RETURN }
    val hooked = code.indices.filter {
        code[it].isSoundCheck(session) && code.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT &&
            code.getOrNull(it + 2)?.methodCall()?.toString() == OPEN_CHAT_SOUND_CALL
    }
    val check = when {
        dropped.size == 1 && hooked.isEmpty() -> dropped.single()
        dropped.isEmpty() && hooked.size == 1 -> hooked.single()
        else -> return null
    }
    val sounds = (code[check] as FiveRegisterInstruction).registerC
    if (sounds == playCall.registerC) return null
    return OpenChatSite(check, play - 3, sounds, playCall.registerC, hooked.isNotEmpty())
}

/** The pickers that log "Play sound": found by one string here, then held to the whole shape. */
internal val messageSoundPickers = MethodCheck(loadsString(SOUND_STEP))

internal fun findOpenChatSound(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(messageSoundPickers.methods(classes).filter { it.openChatSite() != null }.singleOrNull())

internal fun MutableMethod.validateOpenChatSound(): OpenChatSite = openChatSite()
    ?: throw PatchException("Messenger controls: the message sound picker ${hookId()} no longer matches the tested build")

/**
 * The dropped answer goes through the extension. A yes jumps to Messenger's in-app message sound with the sound object
 * in the register that call reads it from; a no returns as Messenger did.
 */
internal fun MutableMethod.injectOpenChatSound() {
    val site = validateOpenChatSound()
    if (site.hooked) return
    val after = site.check + 1
    val player = site.player
    addInstructionsWithLabels(after, """
        move-result v$player
        invoke-static/range {v$player .. v$player}, $OPEN_CHAT_SOUND_CALL
        move-result v$player
        if-eqz v$player, :stock_return
        move-object/from16 v$player, v${site.sounds}
        goto/16 :in_app_sound
    """.trimIndent(), ExternalLabel("stock_return", getInstruction(after)), ExternalLabel("in_app_sound", getInstruction(site.play)))
}
