/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.quality

import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * Where Default playback quality hooks, found by kept names only (read from 577 and 580, 2026-09-29).
 * The obfuscated names in these comments are for reviewers; the code never writes one down.
 *
 * - Facebook's quality menu ("Quality settings" in a reel's menu, the gear menu's quality sheet)
 *   calls the playing FbGrootPlayer's setter with the picked label, AUTO or one of the video's own
 *   labels such as 720p. It goes through the Hero player and HeroManager to the one method holding
 *   "HeroServicePlayer.setCustomQualityInternal" (580 LX/6l6;->A16, 577 LX/7sb;->A12), which hands
 *   it to its DASH format evaluator's custom-quality setter, the one (String)V call there (580
 *   LX/4UV;->A06, 577 LX/503;->A05). The evaluator's constructor takes an
 *   AbrContextAwareConfiguration, a kept name.
 * - The setter looks for the label among the evaluator's tracks, its one array field (580 A0J of
 *   LX/7sk;, 577 A0J of LX/7qV;), reading each track's label through the one static method taking a
 *   track (580 LX/7sj;->A00, 577 LX/7qU;->A00) and that answer's String field (A0A on both), and
 *   keeps the matching track's id, or none, which is what AUTO or a missing label comes to. The
 *   evaluator's choice of a track then plays that track while it has one, and chooses by bandwidth
 *   while it hasn't.
 * - The same choice, the first time it runs, hands the setter the evaluator's preselected label, the
 *   String field it reads right before calling it (A0K on both), then sets that field to null. The
 *   constructor fills it in from the play request's preselected label, which on both builds comes
 *   from VideoPlayerParams' preselectedVideoQualityLabel, and nothing in Facebook sets that. The
 *   menu's own pick is stored in FbSharedPreferences under
 *   quality_selector/user_selected_quality_label_key_new, but only the menu reads it back, to tick
 *   that row, so a pick stays with the video it was made on.
 * - Prefetching and offline saves use the evaluator's other choosers, which never read the
 *   preselected label, so only playback sees what the patch leaves there.
 * - Where a video plays (read from 577, 580 and 581, 2026-10-07): the evaluator keeps the
 *   AbrContextAwareConfiguration it's built with in its one field of that type (A06 on all three),
 *   stored by its constructor before the hook runs. That configuration's kept playbackPreferences
 *   (581 LX/5A5;, 580 LX/4UK;, 577 LX/4zu;) carries the player origin and sub-origin Facebook
 *   names each player with, and the configuration's own constructor reads both to decide isStory:
 *   the origin is the String it compares with "fb_stories" (A07 on 581 and 580, A06 on 577), the
 *   sub-origin the one it compares with "fb_shorts_viewer" and "fb_shorts_native_in_feed_unit"
 *   (A08 on 581 and 580, A07 on 577). The extension sorts reels and stories by those two names.
 */

internal const val QUALITY_CHOICE = "$EXTENSION_PACKAGE/media/QualityChoice;"
internal const val EVALUATOR_BUILT = "$QUALITY_CHOICE->evaluatorBuilt(Ljava/lang/Object;)V"
internal const val CUSTOM_QUALITY = "$QUALITY_CHOICE->customQuality(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;"
internal const val PRESELECTED_STUB = "preselectedLabel"
internal const val PRESELECT_STUB = "preselectLabel"
internal const val FORMATS_STUB = "trackFormats"
internal const val LABEL_STUB = "formatLabel"
internal const val ORIGIN_STUB = "playOrigin"
internal const val SUB_ORIGIN_STUB = "playSubOrigin"

internal const val SET_CUSTOM_QUALITY = "HeroServicePlayer.setCustomQualityInternal"
internal const val ABR_CONFIGURATION = "Lcom/facebook/exoplayer/formatevaluator/configuration/AbrContextAwareConfiguration;"
internal const val PLAYBACK_PREFERENCES = "playbackPreferences"

/** What the configuration compares the player origin with to call a video a story. */
internal const val STORIES_ORIGIN = "fb_stories"

/** What the configuration compares the player sub-origin with to call a video a reel. */
internal const val REELS_SUB_ORIGIN = "fb_shorts_viewer"
private const val STRING = "Ljava/lang/String;"

private val Instruction.call: MethodReference?
    get() = (this as? ReferenceInstruction)?.reference as? MethodReference

private val Instruction.field: FieldReference?
    get() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun MethodReference.parameters() = parameterTypes.map(CharSequence::toString)

/** The instance calls in [method] of a (String)V method, the shape of the evaluator's custom-quality setter. */
internal fun customQualityCalls(method: Method): List<MethodReference> = method.code()
    .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
    .mapNotNull { it.call }
    .filter { it.returnType == "V" && it.parameters() == listOf(STRING) }

/** Whether [evaluator]'s constructor takes an AbrContextAwareConfiguration. */
internal fun takesAbrConfiguration(evaluator: ClassDef): Boolean = evaluator.methods.any { method ->
    method.name == "<init>" && method.parameterTypes.any { it.toString() == ABR_CONFIGURATION }
}

/** [setter]'s reads of an array field of its own class: the tracks it looks among. */
internal fun formatsFields(setter: Method): List<FieldReference> = setter.code()
    .filter { it.opcode == Opcode.IGET_OBJECT }
    .mapNotNull { it.field }
    .filter { it.definingClass == setter.definingClass && it.type.startsWith("[L") }
    .distinctBy { it.toString() }

/**
 * How [setter] reads a track's label: a static call taking one [format], then a String field of
 * what it answers. One pair per place it does.
 */
internal fun labelReads(setter: Method, format: String): List<Pair<MethodReference, FieldReference>> {
    val code = setter.code()
    return code.indices.mapNotNull { index ->
        val call = code[index].call?.takeIf {
            code[index].opcode == Opcode.INVOKE_STATIC && it.parameters() == listOf(format) && it.returnType.startsWith("L")
        } ?: return@mapNotNull null
        val read = code.drop(index + 1).take(3).firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.field
            ?.takeIf { it.definingClass == call.returnType && it.type == STRING } ?: return@mapNotNull null
        call to read
    }
}

/**
 * The String fields of [evaluator] its own methods read and hand straight to [setter] on the same
 * evaluator: the preselected label its first choice applies.
 */
internal fun preselectedReads(evaluator: ClassDef, setter: Method): List<FieldReference> =
    evaluator.methods.flatMap { method ->
        val code = method.code()
        code.indices.mapNotNull { index ->
            val call = code[index].call ?: return@mapNotNull null
            if (code[index].opcode != Opcode.INVOKE_VIRTUAL || call.definingClass != evaluator.type ||
                call.name != setter.name || call.parameters() != listOf(STRING)
            ) return@mapNotNull null
            val read = code.getOrNull(index - 1)?.takeIf { it.opcode == Opcode.IGET_OBJECT } ?: return@mapNotNull null
            val field = read.field?.takeIf { it.definingClass == evaluator.type && it.type == STRING } ?: return@mapNotNull null
            val registers = (code[index] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) }
            val fieldRead = read as TwoRegisterInstruction
            // The label read goes in as the argument, and the call and the read are on one evaluator.
            if (registers != listOf(fieldRead.registerB, fieldRead.registerA)) return@mapNotNull null
            field
        }
    }.distinctBy { it.toString() }

/**
 * The String fields of [preferences] that [configuration]'s constructors read and compare, ignoring
 * case, with [literal]: the player origin for "fb_stories", the sub-origin for "fb_shorts_viewer".
 * The field is the last read into the register the comparison takes besides the literal's.
 */
internal fun originReads(configuration: ClassDef, preferences: String, literal: String): List<FieldReference> =
    configuration.methods.filter { it.name == "<init>" }.flatMap { method ->
        val code = method.code()
        code.indices.mapNotNull { index ->
            val string = ((code[index] as? ReferenceInstruction)?.reference as? StringReference)?.string
            if (string != literal) return@mapNotNull null
            val literalRegister = (code[index] as OneRegisterInstruction).registerA
            val compare = code.drop(index + 1).take(3).firstOrNull {
                it.call?.let { call -> call.definingClass == STRING && call.name == "equalsIgnoreCase" } == true
            } as? FiveRegisterInstruction ?: return@mapNotNull null
            val other = listOf(compare.registerC, compare.registerD).filter { it != literalRegister }.singleOrNull()
                ?: return@mapNotNull null
            val read = code.subList(0, index).lastOrNull {
                it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == other
            }?.takeIf { it.opcode == Opcode.IGET_OBJECT } ?: return@mapNotNull null
            read.field?.takeIf { it.definingClass == preferences && it.type == STRING }
        }
    }.distinctBy { it.toString() }
