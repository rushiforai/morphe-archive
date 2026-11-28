/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.topshare

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.localRegisterCount
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.extension.stringLoadedAt
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val PATCH = "Double tap the top of a reel to share"
internal const val REEL_TOP_SHARE = "$EXTENSION_PACKAGE/reels/ReelTopShare;"
internal const val TOP_SHARE_HOOK = "$REEL_TOP_SHARE->doubleTap(Landroid/view/View;Landroid/view/MotionEvent;)Z"

private const val GESTURE_LISTENER = "Landroid/view/GestureDetector\$SimpleOnGestureListener;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val VIEW = "Landroid/view/View;"

/**
 * What the Reels viewer's double tap loads, the one gesture listener's onDoubleTap to load it, as
 * Turn off double tap to like finds it ("double_tap", the gesture it reports to the skip action).
 */
internal const val REEL_DOUBLE_TAP = "double_tap"

/**
 * Opens a reel's share sheet on a double tap near its top, instead of liking it. A double tap
 * anywhere else stays Instagram's: its like, or Double tap to skip's strips along the edges.
 *
 * The Reels viewer's gesture listener (`LX/0Ijz;` on 457's 386314341) keeps the reel's page in its
 * one View field and measures each double tap against it. The patch hands that page and the tap to
 * ReelTopShare first thing in its onDoubleTap, and returns true there when the extension pressed the
 * reel's Share button. In the default selection with its switch off.
 */
@Suppress("unused")
val reelTopSharePatch = bytecodePatch(
    name = "Double tap the top of a reel to share",
    description = "A double tap near the top of a reel opens its share sheet instead of liking it, in clear mode " +
        "too. Starts off. Turn it on in HushGram settings > Reels.",
) {
    // Interaction, beside Ask before a like: Reels is past the group limit, and it's a gesture. Its switch sits on the Reels settings page.
    category("Interaction")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        requireStatusMethod("reelTopShare")
        hookReelTopShare(findReelDoubleTap())
        enableStatus("reelTopShare")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** The Reels viewer's onDoubleTap and the listener's one View field, the reel's page. */
internal class ReelDoubleTap(val listener: String, val page: String)

/**
 * The one gesture listener's onDoubleTap(MotionEvent) that loads [REEL_DOUBLE_TAP], itself or
 * from a pool of shared strings, and the one instance View field of its class. Fails before
 * anything changes when there isn't exactly one of each, or the method has fewer than two
 * registers of its own for the hook.
 */
internal fun BytecodePatchContext.findReelDoubleTap(): ReelDoubleTap {
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        if (classDef.superclass != GESTURE_LISTENER) return@classDefForEach
        classDef.methods.filter { it.isDoubleTapListener() }.forEach { method ->
            val code = method.implementation?.instructions?.toList().orEmpty()
            if (code.indices.any { stringLoadedAt(code, it) == REEL_DOUBLE_TAP }) found += classDef.type to method
        }
    }
    val (type, method) = found.singleOrNull()
        ?: refuse("expected one gesture listener's double tap loading \"$REEL_DOUBLE_TAP\", found ${found.size}")
    if (method.localRegisterCount() < 2) refuse("$type->onDoubleTap has fewer than two registers of its own")
    val listener = mutableClassDefBy(type)
    val views = listener.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == VIEW }
    val page = views.singleOrNull() ?: refuse("expected $type to keep one View, found ${views.size}")
    return ReelDoubleTap(type, "$type->${page.name}:$VIEW")
}

/**
 * First thing in the double tap: hand [TOP_SHARE_HOOK] the page and the tap, and return true when
 * it shared. The registers are copied down first, since the method's parameters sit past v15.
 */
internal fun BytecodePatchContext.hookReelTopShare(found: ReelDoubleTap) {
    val method = mutableClassDefBy(found.listener).methods.single { it.isDoubleTapListener() }
    method.addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${found.page}
            move-object/from16 v1, p1
            invoke-static { v0, v1 }, $TOP_SHARE_HOOK
            move-result v0
            if-eqz v0, :tap
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("tap", method.getInstruction(0)),
    )
}

/** A gesture listener's onDoubleTap(MotionEvent). */
private fun Method.isDoubleTapListener(): Boolean =
    name == "onDoubleTap" && returnType == "Z" && !AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.map(CharSequence::toString) == listOf(MOTION_EVENT)
