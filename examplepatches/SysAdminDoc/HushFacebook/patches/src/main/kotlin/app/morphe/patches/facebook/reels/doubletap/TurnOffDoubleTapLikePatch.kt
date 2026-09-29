/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.doubletap

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Keeps a double tap on a reel or a video from liking it. See DoubleTapAnchors.kt for where a double
 * tap likes and where the hooks go.
 *
 * Over nearly every player, the gesture view's double-tap handler reads as absent while the switch
 * is on, which is how Facebook builds a player without a double-tap like: no heart plays and the
 * tap goes no further. The view's other gestures, the double-tap seek included, and a single tap
 * are untouched. Behind that, the reel like helper's double-tap like finds no key for the reel,
 * which stops the players that call it themselves before the reel's sidebar hears of it, and the
 * helper's like holds back a like whose source is a double tap. The feed attachment that plays its
 * own heart leaves its double tap unhandled. The Like button likes as before.
 *
 * Off in the default selection: a double tap to like is a gesture people use on purpose, so taking
 * it away is a choice to make, as with Tap to play. Picked, its switch starts on.
 */
@Suppress("unused")
val turnOffDoubleTapLikePatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Turn off double tap to like",
    description = "Stops a double tap on a reel or a video from liking it, and the heart doesn't show. A single tap " +
        "still plays or pauses, and the Like button still likes.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        hookReelLikes()
        hookGestureView()
        enableStatus("doubleTapLike")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

private fun Method.isSameAs(other: Method): Boolean =
    name == other.name && returnType == other.returnType &&
        parameterTypes.map(Any::toString) == other.parameterTypes.map(Any::toString)

/**
 * The reel like helper: its like holds back a double tap's, its double-tap like finds no key, and
 * the feed attachment asking it leaves its double tap unhandled.
 */
private fun BytecodePatchContext.hookReelLikes() {
    val likes = classDefByStrings(MUTATE_LIKE, StringComparisonType.EQUALS).flatMap { owner -> owner.methods.filter(::isReelLike) }
    val like = likes.singleOrNull()
        ?: refuse("expected one reel like holding \"$MUTATE_LIKE\" and taking the session first and the source last, found ${likes.size}")
    val helper = classDefBy(like.definingClass)
    val doubleTapLike = doubleTapLikes(helper).singleOrNull()
        ?: refuse("expected the reel like helper to have one double-tap like taking two objects and a boolean")
    val key = likeKeyResult(doubleTapLike)
        ?: refuse("the reel like helper's double-tap like doesn't return on a missing key from its key maker")
    val attachments = classDefByStrings(HEART_RISE, StringComparisonType.EQUALS)
        .flatMap { owner -> owner.methods.filter { isAttachmentDoubleTap(it, doubleTapLike) } }
    val attachment = attachments.singleOrNull() ?: refuse(
        "expected one onDoubleTap asking the reel like helper's double-tap like and loading \"$HEART_RISE\", " +
            "found ${attachments.size}",
    )

    val mutableHelper = mutableClassDefBy(helper.type)
    mutableHelper.methods.single { it.isSameAs(like) }.holdBackDoubleTapLike()
    mutableHelper.methods.single { it.isSameAs(doubleTapLike) }.emptyKeyAfter(key)
    mutableClassDefBy(attachment.definingClass).methods.single { it.isSameAs(attachment) }.leaveDoubleTapUnhandled()
}

/**
 * GestureReactionComponent's view: the heart and each hand-over read the double-tap handler as
 * absent.
 */
private fun BytecodePatchContext.hookGestureView() {
    val components = classDefByStrings(GESTURE_REACTION, StringComparisonType.EQUALS).filter(::isGestureReactionComponent)
    val component = components.singleOrNull()
        ?: refuse("expected one class whose constructor holds \"$GESTURE_REACTION\", found ${components.size}")
    val viewType = mountedView(component)
        ?: refuse("$GESTURE_REACTION's onCreateMountContent doesn't make one view")
    val view = classDefByOrNull(viewType) ?: refuse("this build has no $viewType")
    val heart = hearts(view).singleOrNull()
        ?: refuse("expected the gesture view to have one static heart holding \"$SHORT_FORM_VIDEO_UNIT\"")
    val handler = handlerField(heart) ?: refuse("the gesture view's heart reads none of the view's fields")

    // The view, what the view makes (its gesture listener) and what the component makes (its event
    // subscriber): nothing else in 577 or 580 reads the handler.
    val owners = (sequenceOf(viewType) + typesMadeBy(view) + typesMadeBy(component)).distinct()
        .mapNotNull(::classDefByOrNull).toList()
    val readers = owners.flatMap { owner -> owner.methods.filter { readsOf(it, handler).isNotEmpty() } }
    if (readers.none { it.isSameAs(heart) && it.definingClass == heart.definingClass }) {
        refuse("the gesture view's heart doesn't read $handler")
    }
    if (readers.none { it.name == "onDoubleTap" }) refuse("no onDoubleTap of the gesture view's listener reads $handler")
    for (reader in readers) {
        val reads = readsOf(reader, handler)
        reads.firstOrNull { !isCheckedRead(reader, it) }?.let {
            refuse("${reader.definingClass}->${reader.name} reads $handler at $it without checking it for null straight away")
        }
        val hook = if (reader.definingClass == heart.definingClass && reader.isSameAs(heart)) HEART else HANDLER
        val mutable = mutableClassDefBy(reader.definingClass).findMutableMethodOf(reader)
        // Last read first, so each index still names its read.
        reads.sortedDescending().forEach { mutable.askAfterRead(it, handler, hook) }
    }
}

/**
 * After the read at [read], the extension's answer in place of what was read: the handler, or null
 * while the switch holds the double tap back. Nothing else reaches the null check that follows, and
 * the range form passes the register whatever its number.
 */
private fun MutableMethod.askAfterRead(read: Int, handler: FieldReference, hook: String) {
    val register = (getInstruction(read) as OneRegisterInstruction).registerA
    addInstructions(
        read + 1,
        """
            invoke-static/range { v$register .. v$register }, $hook
            move-result-object v$register
            check-cast v$register, ${handler.type}
        """,
    )
}

/**
 * First thing in the reel like helper's like: hand the extension the source, the last parameter,
 * and return while it holds a double tap's like back. v0 is free at index 0.
 */
private fun MutableMethod.holdBackDoubleTapLike() {
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, ${parameterRegister(parameterTypes.lastIndex)}
            invoke-static { v0 }, $HOLD_BACK_LIKE
            move-result v0
            if-eqz v0, :like
            return-void
        """,
        ExternalLabel("like", getInstruction(0)),
    )
}

/**
 * After the double-tap like takes the reel's key at [taken], the extension's answer in its place:
 * the key, or null while the switch holds the double tap back, which sends the method down its own
 * return before anything else runs.
 */
private fun MutableMethod.emptyKeyAfter(taken: Int) {
    val register = (getInstruction(taken) as OneRegisterInstruction).registerA
    addInstructions(
        taken + 1,
        """
            invoke-static/range { v$register .. v$register }, $LIKE_KEY
            move-result-object v$register
            check-cast v$register, $STRING
        """,
    )
}

/**
 * First thing in the feed attachment's onDoubleTap: answer false, the tap not handled, while the
 * switch holds it back. v0 is free at index 0.
 */
private fun MutableMethod.leaveDoubleTapUnhandled() {
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HOLD_BACK_TAP
            move-result v0
            if-eqz v0, :tap
            const/4 v0, 0x0
            return v0
        """,
        ExternalLabel("tap", getInstruction(0)),
    )
}
