/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.reelspeed

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where Keep the reel speed hooks, found by kept names only (read from 577 and 580, 2026-09-29).
 * The obfuscated names in these comments are for reviewers; the code never writes one down.
 *
 * - The Reels menu's speed pickers: FbShortsInlinePlaybackSpeedUtil builds a dropdown and an
 *   attribute selector, and a pick in either sets the speed on the reel's FbGrootPlayer (found by
 *   the reel's PlayerOrigin and video id), then posts, 150 ms later, the speed toast: the one
 *   static (Context, float) method holding "InlinePlaybackSpeedAttributeSelector" (580
 *   LX/Txd;->A02, 577 LX/Het;->A02). Only the two pickers' runnables call it.
 * - The gear menu's speed sheet, which is where some accounts get Playback speed in a reel's More
 *   menu: its pick, the one method holding "gear_playback_speed_selection_tap" (580 LX/UO1;->Dy6),
 *   finds the reel's FbGrootPlayer by its PlayerOrigin and video id and sets the speed with the
 *   setter, once for each way the pick reads its speed, and shows no toast.
 * - FbGrootPlayer (580 LX/5BR;, 577 LX/4qS;), the class of the play holding "FbGrootPlayer.play":
 *   its speed setter, the one instance (F)V method that reads HeroPlayerSetting's
 *   enableLastPlaybackSpeedCacheUpdate, which it checks before remembering the speed for the video
 *   (580 A1V, 577 A1U; the pickers, the gear menu's speed sheet and Facebook's own hold-for-2x all
 *   set a speed through it); its PlayerOrigin getter, the one no-argument method answering a
 *   PlayerOrigin (580 Bs0, 577 BtY); maybeTrackVideoStart, a kept name, which the play's start
 *   path runs right after the Hero player starts, before it looks up the speed it remembers for
 *   the video; and its VideoPlayerParams getter, the one no-argument method answering them (580
 *   CM9, 577 CMy), null before the first bind. The params are built once for each video the
 *   player binds and never change, so a start with params the player hasn't started since a pick
 *   is a new video's. Facebook readies the next reel in advance and can start it before it's on
 *   screen, so the first start after a bind can come before a pick made on the reel before it.
 * - VideoPlayerParams' debug dump (580 EYb, 577 EVr) reports each field under its name: isFbShorts
 *   (580 A1e, 577 A1d), isSponsored (580 A1v, 577 A1u) and isLiveNow (580 A1m, 577 A1l) are public
 *   booleans. The Reels viewer
 *   plays ads and live videos between reels, and Facebook's own speed-up skips live videos too.
 * - A new reel's player starts at normal speed: the play only restores a speed Facebook remembered
 *   for that same video. PlayerOrigin.toString() writes the origin, then "::" and where in the
 *   viewer the video started when that's known. The Reels viewer's origin is "fb_shorts_viewer",
 *   but an account whose Reels live in the Video tab plays them under "video_home" (its immersive
 *   player config's surface is FB_SHORTS_IN_WATCH_TAB), beside the tab's other videos, and reels
 *   in the feed play under others (fb_shorts_native_in_feed_unit and more).
 * - The speeds the Reels menu's two pickers offer (read from 577, 580 and 581, 2026-10-07): each
 *   builds a Float[] of fixed speeds, 0.5x, 1x, 2x, 2.5x and 3x, or 0.5x, 1x, 1.5x and 2x behind a
 *   flag, then turns it into a List with Arrays.asList in one place both branches reach, and makes
 *   one item per speed, labelled by the toast class's (F)String formatter. The attribute selector
 *   is the toast class's static method answering FDSAttributeSelectorHScroll, a kept class (581
 *   LX/JsV;->A00); the dropdown is the method holding "fds_control_playback_speed" (581
 *   LX/TmY;->A08). Nothing branches to the instruction after either asList's move-result.
 * - The gear menu's speed sheet (read from 577, 580 and 581, 2026-10-07): its class holds
 *   "PlayerControlsPlaybackSpeedBottomSheet" (581 LX/TkP;, 580 LX/TzE;, 577 LX/UCw;), and its
 *   builder, A01 on all three, takes two booleans last and makes the gear pick's class. It gets
 *   its labels from a server list or a resource array, and its speeds from the same server list,
 *   from a resource array of floats, or, with the last boolean false, as zeros. Its paths meet,
 *   and it then walks the labels: array-length of the labels, then per label aget-object, if-eqz
 *   on the last boolean and aget of the speed. With the boolean false it parses each label with
 *   the locale's NumberFormat, which needn't read "0.5" as a half where a comma marks decimals,
 *   and makes items without a speed, which the pick parses the same way. With it true each item
 *   carries its float and the pick reads that. Every caller passes false but one, which passes a
 *   field.
 */

internal const val REEL_SPEED = "$EXTENSION_PACKAGE/media/ReelSpeed;"
internal const val SPEED_SET = "$REEL_SPEED->speedSet(Ljava/lang/Object;F)V"
internal const val PICKED = "$REEL_SPEED->picked(F)V"
internal const val GEAR_PICKED = "$REEL_SPEED->gearPicked(F)V"
internal const val STARTED = "$REEL_SPEED->started(Ljava/lang/Object;)V"
internal const val SPEED_CHOICES = "$REEL_SPEED->speedChoices(Ljava/util/List;)Ljava/util/List;"
internal const val SET_SPEED_STUB = "setPlayerSpeed"
internal const val ORIGIN_STUB = "playerOrigin"
internal const val REEL_PARAMS_STUB = "playerParams"

/** The VideoPlayerParams booleans the extension reads, by the name the params' debug dump reports each under, to the stub reading it. */
internal val REEL_PARAM_STUBS = linkedMapOf("isFbShorts" to "fbShorts", "isSponsored" to "sponsored", "isLiveNow" to "liveNow")

internal const val SPEED_TOAST = "InlinePlaybackSpeedAttributeSelector"

/** Kept literal. The gear menu's speed sheet logs its pick under it. */
internal const val GEAR_PICK = "gear_playback_speed_selection_tap"
internal const val PLAYER_ORIGIN = "Lcom/facebook/video/common/playerorigin/PlayerOrigin;"
internal const val SPEED_CACHE_SWITCH =
    "Lcom/facebook/video/heroplayer/setting/HeroPlayerSetting;->enableLastPlaybackSpeedCacheUpdate:Z"
private const val CONTEXT = "Landroid/content/Context;"

/** Kept literal. The Reels menu's speed dropdown names its control with it. */
internal const val SPEED_DROPDOWN = "fds_control_playback_speed"

/** Kept class the Reels menu's speed attribute selector answers. */
internal const val ATTRIBUTE_SELECTOR = "Lcom/facebook/fds/attributeselector/FDSAttributeSelectorHScroll;"
private const val AS_LIST = "Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;"
private const val FLOATS = "[Ljava/lang/Float;"

/** Kept literal. The gear menu's speed sheet's class holds it, and its pick logs under it. */
internal const val GEAR_SHEET = "PlayerControlsPlaybackSpeedBottomSheet"
internal const val GEAR_VALUES = "$REEL_SPEED->gearValues(Z)Z"
internal const val GEAR_SPEEDS = "$REEL_SPEED->gearSpeeds([F)[F"
internal const val GEAR_LABELS = "$REEL_SPEED->gearLabels([Ljava/lang/String;)[Ljava/lang/String;"
private const val LOCALE_NUMBERS = "Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;"

/**
 * Kept literal. HeroManager's setPlaybackSpeed logs it for a speed outside 0.25x to 4x, then keeps
 * the speed and the pitch in that range before the service player gets them (582 LX/8Cj;->A0G, 581
 * LX/7t3;->A0D, read on a phone 2026-10-07: a 0.1x pick played at 0.25x). The service player's audio
 * takes 0.1x to 8x.
 */
internal const val SPEED_RANGE_LOG = "Trying to set playback speed with invalid value"

/** HeroManager's slowest speed, and the slowest of the slower speeds, which replaces it. */
internal const val HERO_FLOOR = 0.25f
internal const val SLOWEST = 0.1f

/** The const/high16 instructions of [method] loading [HERO_FLOOR], by index. */
internal fun speedFloors(method: Method): List<Int> =
    method.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
        instruction.opcode == Opcode.CONST_HIGH16 &&
            (instruction as NarrowLiteralInstruction).narrowLiteral == HERO_FLOOR.toRawBits()
    }?.map { it.index }.orEmpty()

private const val FLOAT_MAX = "Ljava/lang/Math;->max(FF)F"

/**
 * Whether [method] keeps a float from going under a floor with Math.max: itself, or through a static
 * float helper [resolve] finds that does. 582 outlines setPlaybackSpeed's clamp into a static
 * `(FFF)F` (`LX/48Y;->A00`, Math.max of the floor and Math.min of the ceiling and the speed), which
 * it calls with the floor it loads.
 */
internal fun callsFloatMax(method: Method, resolve: (MethodReference) -> Method?): Boolean {
    fun keeps(body: Method) = body.implementation?.instructions?.any {
        (it as? ReferenceInstruction)?.reference?.toString() == FLOAT_MAX
    } == true
    if (keeps(method)) return true
    return method.implementation?.instructions?.any { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            call.returnType == "F" && resolve(call)?.let(::keeps) == true
    } == true
}

/**
 * Where the gear menu's speed sheet builder walks its labels: [index] is the array-length of
 * [labels], the walk reads each speed from [speeds], and [values] is the last parameter, the flag
 * for reading speeds from floats.
 */
internal class GearMeet(val index: Int, val labels: Int, val speeds: Int, val values: Int)

/**
 * Whether [method] is the gear menu's speed sheet builder: it answers nothing, takes a boolean
 * last, makes [pick], the sheet's pick class, and parses with the locale's NumberFormat.
 */
internal fun isGearSheet(method: Method, pick: String): Boolean {
    if (method.returnType != "V" || method.parameters().lastOrNull() != "Z") return false
    val code = method.implementation?.instructions ?: return false
    return code.any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == pick } &&
        code.any { (it as? ReferenceInstruction)?.reference?.toString() == LOCALE_NUMBERS }
}

/**
 * Where [method] walks its labels and reads each one's speed: an array-length of the labels, then
 * within a few instructions an aget-object from them, an if-eqz on the last parameter and an aget
 * of the speed. The last parameter is one register wide, a boolean, so it's the method's last.
 * None when anything in [method] writes that register, since the flag is forced at its start.
 */
internal fun gearMeets(method: Method): List<GearMeet> {
    val implementation = method.implementation ?: return emptyList()
    val code = implementation.instructions.toList()
    val values = implementation.registerCount - 1
    val rewritten = code.any {
        val written = (it as? OneRegisterInstruction)?.registerA
        it.opcode.setsRegister() && written != null &&
            (written == values || it.opcode.setsWideRegister() && written + 1 == values)
    }
    if (rewritten) return emptyList()
    return code.withIndex().mapNotNull { (index, instruction) ->
        if (instruction.opcode != Opcode.ARRAY_LENGTH) return@mapNotNull null
        val labels = (instruction as TwoRegisterInstruction).registerB
        val ahead = code.subList(index + 1, minOf(code.size, index + 8))
        val label = ahead.indexOfFirst { it.opcode == Opcode.AGET_OBJECT && (it as ThreeRegisterInstruction).registerB == labels }
        if (label < 0) return@mapNotNull null
        val check = ahead.getOrNull(label + 1)
        val speed = ahead.getOrNull(label + 2)
        if (check?.opcode != Opcode.IF_EQZ || (check as OneRegisterInstruction).registerA != values) return@mapNotNull null
        if (speed?.opcode != Opcode.AGET) return@mapNotNull null
        GearMeet(index, labels, (speed as ThreeRegisterInstruction).registerB, values)
    }
}

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.parameters() = parameterTypes.map(CharSequence::toString)

/** Whether [method] is the Reels menu's speed toast: static, (Context, float), holding its selector's name. */
internal fun isSpeedToast(method: Method): Boolean =
    method.isStatic() && method.returnType == "V" && method.parameters() == listOf(CONTEXT, "F") &&
        holdsString(method, SPEED_TOAST)

/** [owner]'s speed setters: instance (F)V methods reading HeroPlayerSetting's speed cache switch. */
internal fun speedSetters(owner: ClassDef): List<Method> = owner.methods.filter { method ->
    !method.isStatic() && method.returnType == "V" && method.parameters() == listOf("F") &&
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.toString() == SPEED_CACHE_SWITCH
        } == true
}

/**
 * Where [method] calls [owner]'s speed [setter]: each call's index, with the register it hands over
 * as the speed, the call's last.
 */
internal fun setterCalls(method: Method, owner: String, setter: Method): List<Pair<Int, Int>> =
    method.implementation?.instructions?.withIndex()?.mapNotNull { (index, instruction) ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        if (call.definingClass != owner || call.name != setter.name || call.returnType != "V" ||
            call.parameterTypes.map(CharSequence::toString) != listOf("F")
        ) return@mapNotNull null
        when (instruction) {
            is FiveRegisterInstruction -> index to instruction.registerD
            is RegisterRangeInstruction -> index to instruction.startRegister + 1
            else -> null
        }
    }.orEmpty()

/**
 * Where [method], which fills a Float[], turns an array into its list of speeds: the index of each
 * Arrays.asList's move-result-object, with the register it writes. Empty when it fills no Float[].
 */
internal fun speedLists(method: Method): List<Pair<Int, Int>> {
    val code = method.implementation?.instructions?.toList() ?: return emptyList()
    if (code.none { it.opcode == Opcode.FILLED_NEW_ARRAY && (it as ReferenceInstruction).reference.toString() == FLOATS }) {
        return emptyList()
    }
    return code.withIndex().mapNotNull { (index, instruction) ->
        if ((instruction as? ReferenceInstruction)?.reference?.toString() != AS_LIST) return@mapNotNull null
        val result = code.getOrNull(index + 1)
        if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
        index + 1 to (result as OneRegisterInstruction).registerA
    }
}

/** [owner]'s PlayerOrigin getters: instance methods with a body, taking nothing and answering one. */
internal fun originGetters(owner: ClassDef): List<Method> = owner.methods.filter {
    !it.isStatic() && it.parameterTypes.isEmpty() && it.returnType == PLAYER_ORIGIN && it.implementation != null
}
