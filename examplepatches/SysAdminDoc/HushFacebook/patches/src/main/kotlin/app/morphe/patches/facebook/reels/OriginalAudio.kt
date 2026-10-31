/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Keep the original audio (#148). Read from 582, 2026-10-14; the obfuscated names here are for
 * reviewers, the code never writes one down.
 *
 * FbVpsController (a class Redex keeps) reads HeroPlayerSetting.enableAudioDubbingSupport (a kept
 * field) as it starts, and when it's on puts three suppliers into static Function0 fields of one
 * holder (arm64 LX/3lb;, armv7 the same shape). The first one it stores answers the audio language:
 * a language picked in the player, else fb_shorts/audio_dubbing_selected_language, else the app's
 * or the phone's language. The holder's synchronized getter for it (arm64 A01) is what the DASH
 * manifest parser asks before its "device" check, keeping the one dubbed audio set in that language
 * and dropping the others, and what the track selector and the prefetch take their audio language
 * from. An empty answer makes the parser keep the main audio set instead.
 *
 * Read again from 585, 2026-10-30, for a reporter whose reels still played dubbed with the switch
 * on and who gets Facebook's in-player Languages menu. The parser (arm64 LX/0AD2;->A0G) reads three
 * HeroPlayerSetting fields in a row for a period with more than one audio set: audioTrackFilteringMode
 * (0 keeps every set), enableAudioDubbingSupport and enableInPlayAudioDubbingSwitch. With the menu's
 * switch on it keeps every dubbed set without asking the getter, and the track selector then
 * prefers the request's or the phone's language. With dubbing off it keeps the first set whose role
 * is main or none (a dub's role is 0x10), which is the original. So those three reads go through
 * the extension too, which answers filtering on and both dubbing switches off.
 */

internal const val VPS_CONTROLLER = "Lcom/facebook/video/exoserviceclient/FbVpsController;"

internal const val HERO_PLAYER_SETTING = "Lcom/facebook/video/heroplayer/setting/HeroPlayerSetting;"

internal const val DUBBING_SUPPORT = "enableAudioDubbingSupport"

private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

private const val STRING = "Ljava/lang/String;"

internal const val ORIGINAL_AUDIO = "$EXTENSION_PACKAGE/reels/OriginalAudio;->language(Ljava/lang/String;)Ljava/lang/String;"

internal const val AUDIO_FILTERING = "audioTrackFilteringMode"

internal const val IN_PLAY_DUBBING = "enableInPlayAudioDubbingSwitch"

internal const val ORIGINAL_AUDIO_DUBBING = "$EXTENSION_PACKAGE/reels/OriginalAudio;->dubbing(Z)Z"

internal const val ORIGINAL_AUDIO_FILTERING = "$EXTENSION_PACKAGE/reels/OriginalAudio;->filtering(I)I"

/** The DASH manifest parser, by its three reads in a row for a period with more than one audio set. */
internal object AudioTrackFilterFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(definingClass = HERO_PLAYER_SETTING, name = AUDIO_FILTERING, type = "I", opcode = Opcode.IGET),
        fieldAccess(definingClass = HERO_PLAYER_SETTING, name = DUBBING_SUPPORT, type = "Z", opcode = Opcode.IGET_BOOLEAN),
        fieldAccess(definingClass = HERO_PLAYER_SETTING, name = IN_PLAY_DUBBING, type = "Z", opcode = Opcode.IGET_BOOLEAN),
    ),
)

/**
 * The static Function0 field FbVpsController stores the audio language supplier in: in each of its
 * methods reading [DUBBING_SUPPORT], the first `sput-object` of a Function0 after the read. Null
 * unless every such method names the same field.
 */
internal fun audioLanguageSupplier(controller: ClassDef): FieldReference? {
    val fields = controller.methods.mapNotNull { method ->
        val code = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        val read = code.indexOfFirst { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IGET_BOOLEAN && field?.definingClass == HERO_PLAYER_SETTING && field.name == DUBBING_SUPPORT
        }
        if (read < 0) return@mapNotNull null
        code.drop(read + 1).firstNotNullOfOrNull { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            field?.takeIf { instruction.opcode == Opcode.SPUT_OBJECT && it.type == FUNCTION0 }
        } ?: return null
    }
    return fields.distinctBy { it.toString() }.singleOrNull()
}

/** The holder's getters for [supplier]: instance methods with no parameters answering a String that read it. */
internal fun audioLanguageGetters(holder: ClassDef, supplier: FieldReference): List<Method> = holder.methods.filter { method ->
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() && method.returnType == STRING &&
        method.implementation?.instructions?.any { instruction ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.SGET_OBJECT && field?.toString() == supplier.toString()
        } == true
}

/** Whether [method] already hands its answer to the extension. */
private fun handsAudioLanguage(method: Method): Boolean =
    method.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference)?.toString() == ORIGINAL_AUDIO } == true

/**
 * Hands the player's audio language to the extension before its getter returns it, so the switch
 * can leave the player with no language asked for. Refuses unless FbVpsController names one
 * supplier field and its holder has one getter for it.
 */
internal fun BytecodePatchContext.hookOriginalAudio() {
    val controller = classDefByOrNull(VPS_CONTROLLER)
        ?: throw PatchException("This Facebook build has no $VPS_CONTROLLER")
    val supplier = audioLanguageSupplier(controller)
        ?: throw PatchException("$VPS_CONTROLLER stores no one audio language supplier after reading $DUBBING_SUPPORT")
    val holder = classDefByOrNull(supplier.definingClass)
        ?: throw PatchException("This Facebook build has no ${supplier.definingClass}")
    val getters = audioLanguageGetters(holder, supplier)
    val getter = getters.singleOrNull()
        ?: throw PatchException("${holder.type} has ${getters.size} getters for its audio language, expected one")
    val method = mutableClassDefBy(holder.type).methods.single { it.name == getter.name && it.parameterTypes.isEmpty() }
    if (handsAudioLanguage(method)) return
    val cast = supplierAnswer(method, supplier)
        ?: throw PatchException("${holder.type}->${getter.name} doesn't cast its supplier's answer to a String once")
    method.keepOriginalAudio(cast)
}

/**
 * The index of the one `check-cast` to String in [getter] after it reads [supplier]: where the
 * supplier's answer becomes the language. The getter is synchronized and returns after its
 * `monitor-exit`, so the hook goes in here, with the lock still held, rather than in front of the
 * return, where it would land inside the try block whose handler exits the lock again.
 */
internal fun supplierAnswer(getter: Method, supplier: FieldReference): Int? {
    val code = getter.implementation?.instructions?.toList() ?: return null
    val read = code.indexOfFirst { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SGET_OBJECT && field?.toString() == supplier.toString()
    }
    if (read < 0) return null
    val casts = code.withIndex().filter { (index, instruction) ->
        index > read && instruction.opcode == Opcode.CHECK_CAST &&
            ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == STRING
    }
    return casts.singleOrNull()?.index
}

/** [hookOriginalAudio] for the getter itself: the extension right after the cast at [cast], on its register. */
internal fun MutableMethod.keepOriginalAudio(cast: Int) {
    val register = (implementation!!.instructions[cast] as OneRegisterInstruction).registerA
    addInstructions(
        cast + 1,
        """
            invoke-static/range { v$register .. v$register }, $ORIGINAL_AUDIO
            move-result-object v$register
        """,
    )
}

/** The parser's reads of the filtering mode and the two dubbing switches, as (index, field name). */
internal fun audioTrackReads(parser: Method): List<Pair<Int, String>> =
    parser.implementation?.instructions?.withIndex()?.mapNotNull { (index, instruction) ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        val read = (instruction.opcode == Opcode.IGET && field?.name == AUDIO_FILTERING) ||
            (instruction.opcode == Opcode.IGET_BOOLEAN && (field?.name == DUBBING_SUPPORT || field?.name == IN_PLAY_DUBBING))
        if (read && field?.definingClass == HERO_PLAYER_SETTING) index to field.name else null
    }.orEmpty()

/** Hands the manifest parser's audio reads to the extension, so the switch can keep a video's original audio set alone. */
internal fun BytecodePatchContext.hookOriginalAudioTracks() = AudioTrackFilterFingerprint.method.keepOriginalAudioTracks()

/**
 * [hookOriginalAudioTracks] for the parser itself: the extension right after each read, on its
 * register, last read first so the indices hold. A read already handed over is left alone. Refuses
 * a parser without both the mode and the dubbing switch.
 */
internal fun MutableMethod.keepOriginalAudioTracks() {
    val reads = audioTrackReads(this)
    if (reads.none { it.second == AUDIO_FILTERING } || reads.none { it.second == DUBBING_SUPPORT }) {
        throw PatchException("$definingClass->$name doesn't read both $AUDIO_FILTERING and $DUBBING_SUPPORT")
    }
    for ((index, field) in reads.asReversed()) {
        val hook = if (field == AUDIO_FILTERING) ORIGINAL_AUDIO_FILTERING else ORIGINAL_AUDIO_DUBBING
        val next = implementation!!.instructions.getOrNull(index + 1)
        if (((next as? ReferenceInstruction)?.reference)?.toString() == hook) continue
        val register = (implementation!!.instructions[index] as TwoRegisterInstruction).registerA
        addInstructions(
            index + 1,
            """
                invoke-static { v$register }, $hook
                move-result v$register
            """,
        )
    }
}

/** True when [method] calls [getter]. */
internal fun callsGetter(method: Method, getter: Method): Boolean = method.implementation?.instructions?.any { instruction ->
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
    call?.definingClass == getter.definingClass && call.name == getter.name && call.parameterTypes.isEmpty()
} == true
