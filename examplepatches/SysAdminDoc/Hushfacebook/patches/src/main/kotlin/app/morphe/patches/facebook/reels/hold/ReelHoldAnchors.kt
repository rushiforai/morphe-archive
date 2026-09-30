/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.hold

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.taptoplay.FB_USER_SESSION
import app.morphe.patches.facebook.media.taptoplay.MOTION_EVENT
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Where Hold a reel for 2x hooks, found by kept names only (read from 577 and 580, 2026-09-29). The
 * obfuscated names in these comments are for reviewers; the code never writes one down.
 *
 * Facebook's Reels controls (FbShortsVideoControlComponent, 580 LX/83J;, 577 LX/7mG;, and
 * FbShortsViewerOverlayComponent, 580 LX/83D;, 577 LX/7H5;) already speed a reel up while it's held,
 * behind server flags most accounts don't get:
 *
 * - The long-press handlers: Kotlin lambdas keeping their captured names, among them
 *   $shouldDispatchLongPressEventDirectly and $immersiveFeedPlayerConfig, and holding the log
 *   string "speed_up" (580 LX/88x; and LX/UoS;, 577 LX/9bg; and LX/V0J;). Each asks the immersive
 *   player config (580 LX/Cv5;, 577 LX/Cpk;) one flag with no arguments (580 AgW, 577 Aiu), the
 *   speed-up flag. Yes, and a press on a reel that isn't an ad goes to the speed-up when it landed
 *   within the config's edge width of the reel's left or right side; otherwise it opens the
 *   long-press menu. Each loads "speed_up" once, for the log call it makes only on its way to the
 *   speed-up, past those checks (580 88x index 125, UoS 117; 577 9bg 131, V0J 107). The speed-up
 *   (580 LX/83J;->A0H, 577 LX/7mG;->A0H) remembers the reel's speed and sets the config's
 *   long-press speed, 2x unless the server says otherwise, through FbGrootPlayer's speed setter.
 * - The edge check: the one method of the build taking (MotionEvent, View, FbUserSession, the
 *   config, boolean) and answering a boolean (580 LX/88V;->A06, 577 LX/9bD;->A06). One long-press
 *   handler calls it itself, the other through a lazy value.
 * - The release listeners: lambdas keeping $isInLongPress2xPlaybackSpeed and
 *   $immersiveFeedPlayerConfig (580 LX/88y; and LX/UoP;, 577 LX/9bh; and LX/V0G;), a reel's touch
 *   listener. Each asks a second flag with no arguments (580 AgX, 577 Aiv) and, straight after its
 *   branch, the speed-up flag; with both yes, on the finger's lift or a cancel it puts back the
 *   speed the speed-up remembered, whenever the player's speed differs from it. It hears every
 *   touch on the reel, not only a hold's. It captures whether a hold is on and the speed to put
 *   back when the reel is drawn, and the speed-up has the reel drawn again, so a lift before that
 *   reaches a listener holding the old values. Its own check of the hold flag is behind a third
 *   config answer (580 AhA, 577 AjY) that every implementation on both builds answers no, so on
 *   these builds every listener asks both flags on every touch.
 * - The hold speed: the speed-ups in FbShortsVideoControlComponent (580 LX/83J;->A0H) and
 *   UddPlayerControlComponent (580 LX/T9a;->A05) set FbGrootPlayer's speed to a double they read
 *   from the object the config's no-argument CIr() answers (580 LX/4Xa;->A0R), made a float. The
 *   same read gives the speed the helper that remembers the pre-hold speed compares with, and a
 *   2x label. Outside the Video tab it answers a fixed 2.0; where an account's Reels live in the
 *   Video tab (the object's surface is FB_SHORTS_IN_WATCH_TAB) it answers MobileConfig double
 *   0x104003303ee0017, whose default no code sets.
 * - The speed to put back: the speed-up asks a helper (580 LX/B1k;->A00) for it, which answers the
 *   player's speed through its getter (580 Brl, 577 BtK) but normal speed when that already is the
 *   hold speed and MobileConfig 0x101055200213585 says so, and keeps it in the component's state, from
 *   which the listener is drawn with it. So a reel Keep the reel speed started at 2x comes back at
 *   normal speed, and so does a reel whose listener was drawn before a speed was picked. The release
 *   listeners each read the getter to compare with it, the one no-argument float method of the
 *   player they call; the extension reads the player's speed through it when a hold speeds a reel up.
 * - The overlay component's render (580 LX/83D;->A1F, 577 LX/7H5;->A1N) gives a reel its release
 *   listener only when the speed-up flag says yes. The control component gives it one regardless.
 *   Three other places read the speed-up flag (a Watch fragment's setup and an auto-advance guard);
 *   they don't touch the hold and are left alone.
 */

internal const val REEL_HOLD = "$EXTENSION_PACKAGE/reels/ReelHold;"
internal const val TOUCH = "$REEL_HOLD->touch(Landroid/view/MotionEvent;)V"
internal const val LONG_PRESS = "$REEL_HOLD->longPress(Z)Z"
internal const val ANYWHERE = "$REEL_HOLD->anywhere(Z)Z"
internal const val SPEED_UP = "$REEL_HOLD->speedUp(Z)Z"
internal const val RELEASE = "$REEL_HOLD->release(Z)Z"
internal const val HELD = "$REEL_HOLD->held()V"
internal const val HOLD_SPEED = "$REEL_HOLD->holdSpeed(D)D"
internal const val SPEED_SET = "$REEL_HOLD->speedSet(Ljava/lang/Object;F)F"
internal const val PLAYER_SPEED_STUB = "playerSpeed"

internal const val SPEED_UP_LOG = "speed_up"
internal const val CONFIG_FIELD = "\$immersiveFeedPlayerConfig"
internal const val DISPATCH_DIRECTLY_FIELD = "\$shouldDispatchLongPressEventDirectly"
internal const val IN_LONG_PRESS_FIELD = "\$isInLongPress2xPlaybackSpeed"
internal val CONTROL_COMPONENTS = listOf("FbShortsVideoControlComponent", "FbShortsViewerOverlayComponent")
internal val SPEED_UP_COMPONENTS = listOf("FbShortsVideoControlComponent", "UddPlayerControlComponent")

private const val VIEW = "Landroid/view/View;"

private fun Method.parameters() = parameterTypes.map(CharSequence::toString)

private val Method.code get() = implementation?.instructions?.toList().orEmpty()

/** The type of [classDef]'s captured immersive player config, or null when it captures none. */
internal fun configType(classDef: ClassDef): String? =
    classDef.fields.singleOrNull { it.name == CONFIG_FIELD && !AccessFlags.STATIC.isSet(it.accessFlags) }?.type

private fun ClassDef.hasBooleanField(name: String) =
    fields.any { it.name == name && it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) }

/** Whether [classDef] is a long-press handler: its captured names, and a method logging "speed_up". */
internal fun isLongPressHandler(classDef: ClassDef): Boolean =
    classDef.hasBooleanField(DISPATCH_DIRECTLY_FIELD) && configType(classDef) != null &&
        classDef.methods.any { holdsString(it, SPEED_UP_LOG) }

/** Whether [classDef] is a release listener: it captures whether a hold is on and the config. */
internal fun isReleaseListener(classDef: ClassDef): Boolean =
    classDef.hasBooleanField(IN_LONG_PRESS_FIELD) && configType(classDef) != null

/** The call in [method] at each index, when it asks [config] a flag: no arguments, a boolean answer. */
internal fun flagCalls(method: Method, config: String): Map<Int, String> =
    method.code.withIndex().mapNotNull { (index, instruction) ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        if (instruction.opcode != Opcode.INVOKE_INTERFACE && instruction.opcode != Opcode.INVOKE_INTERFACE_RANGE) {
            return@mapNotNull null
        }
        if (call.definingClass != config || call.returnType != "Z" || call.parameterTypes.isNotEmpty()) return@mapNotNull null
        index to call.name
    }.toMap()

/**
 * The flags [method] asks right before [speedUp]: a flag call, its move-result, one branch on it,
 * and then the [speedUp] call, which is how each release listener asks its second flag.
 */
internal fun flagsBefore(method: Method, config: String, speedUp: String): Set<String> {
    val code = method.code
    val calls = flagCalls(method, config)
    return calls.filter { (index, name) ->
        name != speedUp && calls[index + 3] == speedUp && code.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT &&
            code.getOrNull(index + 2)?.opcode?.name?.startsWith("if-") == true
    }.values.toSet()
}

/** Whether [method] makes an instance of one of [types]. */
internal fun makesOneOf(method: Method, types: Set<String>): Boolean = method.code.any {
    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type in types
}

/** Whether [parameters] and [returnType] are the edge check's: (MotionEvent, View, FbUserSession, [config], Z)Z. */
internal fun isEdgeCheckShape(parameters: List<String>, returnType: String, config: String): Boolean =
    returnType == "Z" && parameters == listOf(MOTION_EVENT, VIEW, FB_USER_SESSION, config, "Z")

/** The methods of the edge check's shape that [method] calls, as references. */
internal fun edgeChecksCalled(method: Method, config: String): List<MethodReference> = method.code.mapNotNull {
    val call = (it as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
    call.takeIf { isEdgeCheckShape(call.parameterTypes.map(CharSequence::toString), call.returnType, config) }
}

/** Whether [method] is the edge check a call to [reference] names, with a body. */
internal fun isMethod(method: Method, reference: MethodReference): Boolean =
    method.definingClass == reference.definingClass && method.name == reference.name &&
        method.returnType == reference.returnType && method.parameters() == reference.parameterTypes.map(CharSequence::toString) &&
        method.implementation != null

/** The indices in [method] of the instructions loading the long-press handlers' "speed_up" log name. */
internal fun speedUpLoads(method: Method): List<Int> = method.code.withIndex().filter { (_, instruction) ->
    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == SPEED_UP_LOG
}.map { it.index }

private fun Instruction.registers(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/**
 * The hold speed reads in [method]: a no-argument double method of one of [configAnswers], whose
 * answer the next instructions take, make a float and hand to [setter] ("class->name(F)V") as its
 * speed.
 */
internal fun holdSpeedReads(method: Method, setter: String, configAnswers: Set<String>): List<MethodReference> {
    val code = method.code
    return code.indices.mapNotNull { index ->
        val call = (code[index] as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        if ("${call.definingClass}->${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}" != setter) {
            return@mapNotNull null
        }
        val speed = code[index].registers().getOrNull(1) ?: return@mapNotNull null
        val convert = code.getOrNull(index - 1)?.takeIf { it.opcode == Opcode.DOUBLE_TO_FLOAT } as? TwoRegisterInstruction
        if (convert == null || convert.registerA != speed) return@mapNotNull null
        val taken = code.getOrNull(index - 2)?.takeIf { it.opcode == Opcode.MOVE_RESULT_WIDE } as? OneRegisterInstruction
        if (taken == null || taken.registerA != convert.registerB) return@mapNotNull null
        val read = (code.getOrNull(index - 3) as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        read.takeIf { it.returnType == "D" && it.parameterTypes.isEmpty() && it.definingClass in configAnswers }
    }
}

/** The no-argument float methods of [player] that [method] calls, as references: in a release listener, the speed getter. */
internal fun speedGettersCalled(method: Method, player: String): List<MethodReference> = method.code.mapNotNull {
    val call = (it as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
    call.takeIf { call.definingClass == player && call.returnType == "F" && call.parameterTypes.isEmpty() }
}

/** Whether the instruction after the call at [index] in [method] takes its boolean answer. */
internal fun answerTakenAt(method: Method, index: Int): Int? =
    (method.code.getOrNull(index + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction)?.registerA
