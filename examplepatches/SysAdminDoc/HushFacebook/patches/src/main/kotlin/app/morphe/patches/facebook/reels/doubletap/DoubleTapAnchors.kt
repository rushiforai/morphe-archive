/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.doubletap

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.taptoplay.FB_USER_SESSION
import app.morphe.patches.facebook.media.taptoplay.MOTION_EVENT
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where a double tap likes a reel or a video, found by kept names only (read from 577 and 580,
 * 2026-09-28). The obfuscated names in these comments are for reviewers; the code never writes one
 * down.
 *
 * - The reel like helper, FbShortsMutationUtil. Its like is the one method in either build holding
 *   "FbShortsMutationUtil.mutateViewerLikeReaction" (581 LX/Awi;->A01, 580 LX/AxU;->A02, 577
 *   LX/AzV;->A02). It takes the session first and the like's source as its last string, which is its
 *   last parameter on 577 and 580 and on 581 comes before two callbacks (Function1) that build added.
 *   The Like button's handler passes a source of its
 *   own, and the double-tap listeners of three players (photo reels with sound, native showreel
 *   ads and one more: 580 LX/RwN;, LX/RwK;, LX/BIF;, 577 LX/STt;, LX/STo;, LX/BDl;) pass the literal
 *   "DOUBLE_TAP", and so do the reel sidebars when a double tap reaches them.
 * - The helper's double-tap like, its one instance method taking two objects and a boolean (580 and
 *   577 A03). It asks the helper's static key maker, (object, boolean)String, for the reel's key
 *   and returns when there's none. With one it hands the double tap to the reel's sidebar, which
 *   likes the reel and animates its Like button, and on 580 it likes the reel itself, logging
 *   "like_double_tap", when no sidebar is listening. Every double-tap handler of the reel players
 *   ends here (580 has seven callers, 577 seven), and nothing but a double tap calls it.
 * - GestureReactionComponent, the Litho component that lays a gesture view over nearly every reel
 *   and video player: the Reels tab, reels opened from the feed, Watch and the video viewer, photo
 *   reels and the ad players. It's the one class whose constructor holds that name (580 LX/88v;,
 *   577 LX/9be;), and its onCreateMountContent makes the view (580 LX/At4;, 577 LX/B3U;). The
 *   view's heart is its static method taking a MotionEvent and the view and holding
 *   "shortFormVideoUnit" (580 A02, 577 A03). The first of the view's object fields it reads is the
 *   double-tap handler the component mounts (A0I on both), and it returns without one. A double
 *   tap reads that field twice more: in the onDoubleTap of the gesture listener the view makes
 *   (580 LX/RmY;, 577 LX/SJA;), after the view's own interceptor, the double-tap seek, has had its
 *   turn and the heart has played, and in an event subscriber the component makes on mount (580
 *   LX/S0Z;, 577 LX/SXB;), which takes the double taps a parent overlay forwards. Each read is
 *   followed by a null check, and without a handler the tap goes no further. Nothing else in
 *   either build reads the field.
 * - The feed's multi-format attachment, which chains into Reels, has a double-tap listener of its
 *   own (580 LX/RwO;, 577 LX/STv;). It asks the helper's double-tap like and then animates a heart
 *   it adds to the screen, and it's the one onDoubleTap in either build loading "translationY".
 *   When its own config check says no it returns false, which is what the hook answers too.
 */

internal const val PATCH = "Turn off double tap to like"

private const val DOUBLE_TAP_LIKE = "$EXTENSION_PACKAGE/reels/DoubleTapLike;"
internal const val HANDLER = "$DOUBLE_TAP_LIKE->handler(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val HEART = "$DOUBLE_TAP_LIKE->heart(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val LIKE_KEY = "$DOUBLE_TAP_LIKE->likeKey(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val HOLD_BACK_LIKE = "$DOUBLE_TAP_LIKE->holdBackLike(Ljava/lang/String;)Z"
internal const val HOLD_BACK_TAP = "$DOUBLE_TAP_LIKE->holdBackTap()Z"

/** The trace the reel like helper's like opens: the helper's own name, which Redex keeps. */
internal const val MUTATE_LIKE = "FbShortsMutationUtil.mutateViewerLikeReaction"

/** The name the gesture component's constructor gives it. */
internal const val GESTURE_REACTION = "GestureReactionComponent"

/** A key the gesture view's heart logs, which no other method of the view loads. */
internal const val SHORT_FORM_VIDEO_UNIT = "shortFormVideoUnit"

/** The property the feed attachment's heart rises by, which no other onDoubleTap animates. */
internal const val HEART_RISE = "translationY"

internal const val STRING = "Ljava/lang/String;"
private const val CONTEXT = "Landroid/content/Context;"
private const val OBJECT = "Ljava/lang/Object;"
private const val CALLBACK = "Lkotlin/jvm/functions/Function1;"

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.parameters() = parameterTypes.map(CharSequence::toString)
private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private val Instruction.call: MethodReference? get() = (this as? ReferenceInstruction)?.reference as? MethodReference
private val Instruction.field: FieldReference? get() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * The index among [method]'s parameters of the like's source: its last string, with nothing after
 * it but callbacks (none on 577 and 580, two on 581). Null when there's no such string.
 */
internal fun likeSource(method: Method): Int? {
    val parameters = method.parameters()
    val source = parameters.lastIndexOf(STRING)
    return source.takeIf { it > 0 && parameters.drop(it + 1).all { parameter -> parameter == CALLBACK } }
}

/** The reel like helper's like: an instance method holding [MUTATE_LIKE], taking the session first and then a [likeSource]. */
internal fun isReelLike(method: Method): Boolean =
    !method.isStatic() && method.returnType == "V" && method.parameters().firstOrNull() == FB_USER_SESSION &&
        likeSource(method) != null && holdsString(method, MUTATE_LIKE)

/** [helper]'s double-tap likes: instance methods with a body taking two objects and a boolean, returning nothing. */
internal fun doubleTapLikes(helper: ClassDef): List<Method> = helper.methods.filter { method ->
    !method.isStatic() && method.returnType == "V" && method.implementation != null && method.parameters().let {
        it.size == 3 && it[0].startsWith("L") && it[1].startsWith("L") && it[2] == "Z"
    }
}

/** Whether [call] asks [helper]'s static key maker, (object, boolean)String, for a reel's key. */
private fun isKeyMaker(call: MethodReference, helper: String): Boolean =
    call.definingClass == helper && call.returnType == STRING &&
        call.parameterTypes.map(CharSequence::toString).let { it.size == 2 && it[0].startsWith("L") && it[1] == "Z" }

/**
 * In [doubleTapLike], the index of the instruction that takes the reel's key from the first call
 * to the helper's key maker, when the next one returns on a null key; null otherwise. The hook goes
 * right after it, so a key that isn't there sends the method down Facebook's own return.
 */
internal fun likeKeyResult(doubleTapLike: Method): Int? {
    val code = doubleTapLike.code()
    val ask = code.indexOfFirst {
        it.opcode == Opcode.INVOKE_STATIC && it.call?.let { call -> isKeyMaker(call, doubleTapLike.definingClass) } == true
    }
    if (ask < 0 || code.getOrNull(ask + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val key = (code[ask + 1] as OneRegisterInstruction).registerA
    return (ask + 1).takeIf { returnsOnNull(doubleTapLike, ask + 2, key) }
}

/** Whether [owner] is GestureReactionComponent: a constructor of it holds [GESTURE_REACTION]. */
internal fun isGestureReactionComponent(owner: ClassDef): Boolean =
    owner.methods.any { it.name == "<init>" && holdsString(it, GESTURE_REACTION) }

/** The one type [component]'s onCreateMountContent makes, or null. */
internal fun mountedView(component: ClassDef): String? =
    component.methods.singleOrNull {
        it.name == "onCreateMountContent" && it.parameters() == listOf(CONTEXT) && it.returnType == OBJECT
    }?.code()?.filter { it.opcode == Opcode.NEW_INSTANCE }?.map { (it as ReferenceInstruction).reference.toString() }
        ?.distinct()?.singleOrNull()

/** [view]'s hearts: static, taking a MotionEvent and the view, returning nothing and holding [SHORT_FORM_VIDEO_UNIT]. */
internal fun hearts(view: ClassDef): List<Method> = view.methods.filter {
    it.isStatic() && it.returnType == "V" && it.parameters() == listOf(MOTION_EVENT, view.type) &&
        holdsString(it, SHORT_FORM_VIDEO_UNIT)
}

/** The double-tap handler: the first of the view's own object fields [heart] reads. */
internal fun handlerField(heart: Method): FieldReference? {
    val view = heart.parameters().getOrNull(1) ?: return null
    return heart.code().firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.field?.definingClass == view }?.field
}

/** The instructions of [method] that read [field] into a register with iget-object. */
internal fun readsOf(method: Method, field: FieldReference): List<Int> = method.code().withIndex().filter { (_, it) ->
    it.opcode == Opcode.IGET_OBJECT && it.field?.let { read ->
        read.definingClass == field.definingClass && read.name == field.name && read.type == field.type
    } == true
}.map { it.index }

/** The types [owner]'s methods make with new-instance: the view's gesture listener, the component's event subscriber. */
internal fun typesMadeBy(owner: ClassDef): Set<String> = owner.methods.flatMap { method ->
    method.code().filter { it.opcode == Opcode.NEW_INSTANCE }.map { (it as ReferenceInstruction).reference.toString() }
}.toSet()

/**
 * Whether the read at [read] in [method] leads straight into a null check of what it read, and
 * nothing else reaches that check. The hook goes between the two, so every double tap passing the
 * read passes the hook.
 */
internal fun isCheckedRead(method: Method, read: Int): Boolean {
    val code = method.code()
    val register = (code.getOrNull(read) as? OneRegisterInstruction)?.registerA ?: return false
    val check = code.getOrNull(read + 1) ?: return false
    return (check.opcode == Opcode.IF_EQZ || check.opcode == Opcode.IF_NEZ) &&
        (check as OneRegisterInstruction).registerA == register && reachedOnlyFrom(method, read + 1, read)
}

/**
 * Whether [method] returns on a null [register] at [check]: an if-eqz there going straight to a
 * return-void, which only [check] - 1 falls into.
 */
private fun returnsOnNull(method: Method, check: Int, register: Int): Boolean {
    val code = method.code()
    val branch = code.getOrNull(check) ?: return false
    if (branch.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != register) return false
    val flow = ControlFlow.of(method)
    val target = flow.normal[check].firstOrNull { it != check + 1 } ?: return false
    return code[target].opcode == Opcode.RETURN_VOID && reachedOnlyFrom(method, check, check - 1)
}

/** Whether no branch, switch or handler in [method] lands on [target], so only [from] falls into it. */
internal fun reachedOnlyFrom(method: Method, target: Int, from: Int): Boolean {
    val flow = ControlFlow.of(method)
    return flow.instructions.indices.all { index ->
        target !in flow.exceptional[index] && (index == from || target !in flow.normal[index])
    }
}

/** The feed attachment's double tap: an onDoubleTap that asks [doubleTapLike] and animates [HEART_RISE]. */
internal fun isAttachmentDoubleTap(method: Method, doubleTapLike: Method): Boolean =
    method.name == "onDoubleTap" && !method.isStatic() && method.returnType == "Z" &&
        method.parameters() == listOf(MOTION_EVENT) && holdsString(method, HEART_RISE) &&
        method.code().any { instruction ->
            instruction.call?.let {
                it.definingClass == doubleTapLike.definingClass && it.name == doubleTapLike.name &&
                    it.returnType == doubleTapLike.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == doubleTapLike.parameters()
            } == true
        }
