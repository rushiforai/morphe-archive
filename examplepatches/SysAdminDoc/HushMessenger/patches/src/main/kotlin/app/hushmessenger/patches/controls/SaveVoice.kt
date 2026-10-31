package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Keeps a copy of each voice message you play where a file manager and other players can reach it (#90). */
internal const val SAVE_VOICE = "save_voice"

/** The name Messenger gives the fetch of a voice message that isn't on the phone yet. Only the voice download uses it. */
internal const val DOWNLOAD_AUDIO = "Download audio"

private const val URI = "Landroid/net/Uri;"
internal const val VOICE_PLAYED = "Lapp/hushmessenger/extension/VoiceMessages;->played($URI)V"

/**
 * The step that hands the voice message player its file: static, given the user session, its own class and the voice
 * message, it returns the cached copy when there is one and otherwise downloads it under [DOWNLOAD_AUDIO]. Both ways
 * meet at its one return, so the Uri there is the file the player is about to play.
 */
internal fun Method.isVoiceDownload(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != URI) return false
    val params = parameterTypes.map { it.toString() }
    if (params.size != 3 || params[0] != FB_USER_SESSION || params[1] != definingClass || !params[2].startsWith("L")) return false
    val code = implementation?.instructions?.toList() ?: return false
    return code.count { it.opcode == Opcode.RETURN_OBJECT } == 1 &&
        code.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == DOWNLOAD_AUDIO }
}

/** The one voice download, or none when more than one method looks like it. */
internal fun findSaveVoice(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isVoiceDownload() }.let { if (it.size == 1) it else emptyList() }

internal fun MutableMethod.validateSaveVoice(): Int {
    if (!isVoiceDownload()) throw PatchException("Messenger controls: ${hookId()} isn't the voice message download")
    val code = implementation!!.instructions.toList()
    val ret = code.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
    if ((code[ret] as OneRegisterInstruction).registerA >= implementation!!.registerCount) {
        throw PatchException("Messenger controls: the voice message download returns an invalid register")
    }
    return ret
}

/**
 * Hands the extension the voice message's Uri on its way back to the player. The return becomes the call, so every
 * jump that reached the return reaches the call first, and a new return follows it with the same register. The
 * extension reads the switch itself, copies on a worker of its own and catches its own failures, so playback never
 * waits on the copy or fails with it.
 */
internal fun MutableMethod.injectSaveVoice() {
    val ret = validateSaveVoice()
    val uri = (implementation!!.instructions.elementAt(ret) as OneRegisterInstruction).registerA
    replaceInstruction(ret, "invoke-static/range {v$uri .. v$uri}, $VOICE_PLAYED")
    addInstructions(ret + 1, "return-object v$uri")
}
