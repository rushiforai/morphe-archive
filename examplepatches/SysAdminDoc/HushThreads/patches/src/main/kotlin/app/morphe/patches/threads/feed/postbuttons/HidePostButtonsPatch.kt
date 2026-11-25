/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 457 (2026-11-24).
 */
package app.morphe.patches.threads.feed.postbuttons

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.classesNoted
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.holdsNote
import app.morphe.patches.threads.misc.extension.noteSites
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags

private const val PATCH = "Hide post buttons"
internal const val POST_BUTTONS = "$EXTENSION_PACKAGE/feed/PostButtons;"

/** Where Threads keeps the row under a post and its buttons. */
private const val UFI = "com.instagram.barcelona.feed.post.ufi.ui."

/**
 * A button under a post: the [note] Compose keeps for its function, and the extension's [show]
 * answer, a static ()Z on [POST_BUTTONS].
 */
internal enum class PostButton(val note: String, val show: String) {
    LIKE("${UFI}LikeButtonWithMultiAccount (PostDenseUfi.kt:756)", "showLike"),
    REPLY("${UFI}ReplyButton (PostDenseUfi.kt:663)", "showReply"),
    REPOST("${UFI}RepostButton (PostDenseUfi.kt:1148)", "showRepost"),
    SHARE("${UFI}ShareButton (PostDenseUfi.kt:1203)", "showShare"),
    SAVE("${UFI}SaveButton (PostDenseUfi.kt:1341)", "showSave"),
}

/**
 * Hides the buttons under posts and replies, each on a switch of its own (#27).
 *
 * Threads draws the like, reply, repost, share and save buttons under a post in a Compose function
 * each, called from the row under every post and reply. Each function asks the extension first
 * thing whether its button goes in, and returns before drawing anything when the answer is no, so
 * the button and its count are gone and the row's other buttons close up. A function that draws
 * nothing is something Compose already handles, the way any button the row leaves out is.
 *
 * Each function is found by the note Compose compiled into it, has to hold that note once and be the
 * only method that does, and has to be a static void function with a local register to spare, or
 * the patch refuses rather than cutting into the wrong code.
 */
@Suppress("unused")
val hidePostButtonsPatch = bytecodePatch(
    name = PATCH,
    description = "Takes the like, reply, repost, share and save buttons off posts and replies, each on its own " +
        "switch. A hidden button's count goes with it. Good if you keep tapping one by mistake. Every button " +
        "starts out showing. Pick the ones to hide in HushThreads settings > Posts.",
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("hidePostButtons")
        // Every function is found and checked before the first one changes.
        val functions = PostButton.entries.associateWith { postButtonFunction(it) }
        functions.forEach { (button, method) ->
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $POST_BUTTONS->${button.show}()Z
                    move-result v0
                    if-nez v0, :draw
                    return-void
                """,
                ExternalLabel("draw", method.getInstruction(0)),
            )
        }
        enableStatus("hidePostButtons")
    }
}

/** The one Compose function holding [button]'s note, checked so an early return can go in first thing. */
internal fun BytecodePatchContext.postButtonFunction(button: PostButton): MutableMethod {
    val method = classesNoted(button.note)
        .flatMap { it.methods }
        .filter { it.holdsNote(button.note) }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }
        .singleOrPatchException("$PATCH: the ${button.name.lowercase()} button, the method holding \"${button.note}\"")
    val mutable = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)
    val sites = mutable.implementation!!.instructions.noteSites(button.note)
    if (sites.size != 1) {
        throw PatchException("$PATCH: ${method.definingClass}->${method.name} holds \"${button.note}\" ${sites.size} times, not once")
    }
    if (!AccessFlags.STATIC.isSet(mutable.accessFlags) || mutable.returnType != "V") {
        throw PatchException("$PATCH: ${method.definingClass}->${method.name}, the ${button.name.lowercase()} button, " +
            "isn't a static void function")
    }
    mutable.requireLocals(PATCH, 1)
    return mutable
}
