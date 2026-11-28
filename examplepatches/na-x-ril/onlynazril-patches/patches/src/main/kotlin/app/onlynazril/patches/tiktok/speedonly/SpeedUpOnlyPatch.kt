package app.onlynazril.patches.tiktok.speedonly

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TOUCH_GUARD = "Lapp/onlynazril/extension/tiktok/speedonly/SpeedOnlyTouch;"
private const val LONG_CLICK = "Landroid/view/View\$OnLongClickListener;"
private const val DIGG_ASSEM = "Lcom/ss/android/ugc/aweme/feed/assem/digg/VideoDiggAssem;"
private const val COMMENT_ASSEM = "Lcom/ss/android/ugc/aweme/feed/assem/videocomment/VideoCommentAssem;"
private const val EDGE_ASSEM = "Lcom/ss/android/ugc/aweme/feed/longvideo/edgespeedup/EdgeSpeedupAssem;"
private const val DIGG_ABILITY = "Lcom/ss/android/ugc/feed/platform/cell/ability/VideoDiggAssemAbility;"
private const val COMMENT_ABILITY = "Lcom/ss/android/ugc/aweme/feed/assem/ability/IVideoCommentAbility;"

/**
 * A hold that speeds the video up no longer also likes, opens the comment sheet, reposts or opens
 * reactions.
 *
 * The feed's speed-up zone check is where the like and comment areas are refused. The patch
 * answers `true` there when the switch is on, so the 2x starts, and reports the point to the guard:
 * the gesture is then a button one. Two things follow from that mark: the button's own long press
 * is silenced, and the release is turned into a cancel, which stops the 2x and leaves no click.
 * A tap is shorter than the hold, so it still likes or opens the comments.
 */
@Suppress("unused")
val speedUpOnlyPatch = bytecodePatch(
    name = "Speed up only",
    description = "Holding the like or comment button only speeds the video up. It no longer " +
        "likes, opens the comment sheet, reposts or opens reactions; a tap still does. On by " +
        "default; the switch is in Tweaks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)
    extendWith("extensions/tiktok.mpe")

    execute {
        val dispatch = FeedCellTouchFingerprint.method

        // The release of a button hold is taken here, before the cell dispatches it as a click.
        dispatch.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1}, $TOUCH_GUARD->consume(Landroid/view/View;Landroid/view/MotionEvent;)Z
                move-result v0
                if-eqz v0, :onlynazril_speed_only_run
                const/4 v0, 1
                return v0
                :onlynazril_speed_only_run
                nop
            """.trimIndent(),
        )

        // The zone check is where TikTok refuses the two buttons; the mark comes from there, so
        // no obfuscated speed-up class or listener has to be named.
        allowButtonZones()
        suppressLongPress("the like", DIGG_ASSEM)
        suppressLongPress("the comment", COMMENT_ASSEM)
    }
}

/**
 * Turns the like and comment areas into speed-up zones.
 *
 * The zone check refuses a down over either button: the like through the digg hit test, the
 * comment through the comment hit test when quick comment is on. Each refusal is the `return`
 * that follows the hit test; with the switch on it answers `true` instead and marks the gesture
 * for the guard, and with it off the original answer stands.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.allowButtonZones() {
    val assem = mutableClassDefByOrNull(EDGE_ASSEM)
        ?: throw PatchException("Speed up: the speed-up component was not found.")
    val zone = assem.methods.firstOrNull { method ->
        method.parameterTypes.map { it.toString() } == listOf("F", "F") && method.returnType == "Z"
    } ?: throw PatchException("Speed up: the speed-up zone check was not found.")
    val instructions = zone.implementation?.instructions?.toList().orEmpty()

    val refusals = listOf(DIGG_ABILITY to "like", COMMENT_ABILITY to "comment").map { (ability, label) ->
        val call = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)
                ?.getReference<MethodReference>() ?: return@indexOfFirst false
            reference.definingClass == ability &&
                reference.returnType == "Z" &&
                reference.parameterTypes.map { it.toString() } == listOf("F", "F")
        }
        if (call < 0) throw PatchException("Speed up: the $label zone check was not found.")
        val refusal = call + 3
        if (instructions.elementAtOrNull(refusal)?.opcode != Opcode.RETURN) {
            throw PatchException("Speed up: the $label zone check is not where it was expected.")
        }
        refusal to label
    }

    refusals.sortedByDescending { it.first }.forEach { (index, label) ->
        zone.addInstructionsWithLabels(
            index,
            """
                invoke-static {}, $TOUCH_GUARD->allowZone()Z
                move-result v0
                if-eqz v0, :onlynazril_speed_only_zone_$label
                return v0
                :onlynazril_speed_only_zone_$label
                nop
            """.trimIndent(),
        )
    }
}

/**
 * Silences the action a button's own long press performs (`es` on the like, `js` on the comment).
 *
 * The listener is found by shape, the class implementing `View.OnLongClickListener` that holds
 * the component, and the action is read off its `onLongClick`, so no obfuscated name is written
 * down. Every caller of that action is covered, including the ones that post it as a runnable.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.suppressLongPress(
    label: String,
    assem: String,
) {
    val holder: ClassDef = classDefByOrNull { definition ->
        definition.interfaces.map { it.toString() }.contains(LONG_CLICK) &&
            definition.fields.any { field -> field.type == assem }
    } ?: throw PatchException("Speed up: the $label long-press listener was not found.")
    val onLongClick = holder.methods.firstOrNull { method ->
        method.name == "onLongClick" &&
            method.parameterTypes.map { it.toString() } == listOf("Landroid/view/View;") &&
            method.returnType == "Z"
    } ?: throw PatchException("Speed up: the $label long-press listener has no call.")

    val action = onLongClick.implementation?.instructions?.toList().orEmpty()
        .filterIsInstance<ReferenceInstruction>()
        .mapNotNull { it.getReference<MethodReference>() }
        .firstOrNull { it.definingClass == assem }
        ?: throw PatchException("Speed up: the $label long press calls nothing on its component.")

    val method = mutableClassDefByOrNull(assem)?.methods?.firstOrNull { candidate ->
        candidate.name == action.name &&
            candidate.parameterTypes.map { it.toString() } ==
            action.parameterTypes.map { it.toString() }
    } ?: throw PatchException("Speed up: the $label long-press action was not found.")

    val guard = """
        invoke-static {}, $TOUCH_GUARD->buttonZone()Z
        move-result v0
        if-eqz v0, :onlynazril_speed_only_long
    """.trimIndent()
    when (method.returnType) {
        "Z" -> method.addInstructionsWithLabels(
            0,
            """
                $guard
                const/4 v0, 0
                return v0
                :onlynazril_speed_only_long
                nop
            """.trimIndent(),
        )
        "V" -> method.addInstructionsWithLabels(
            0,
            """
                $guard
                return-void
                :onlynazril_speed_only_long
                nop
            """.trimIndent(),
        )
        else -> throw PatchException("Speed up: the $label long-press action has no known shape.")
    }
}
