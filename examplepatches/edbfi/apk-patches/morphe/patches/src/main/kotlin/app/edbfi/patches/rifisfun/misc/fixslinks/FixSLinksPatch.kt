// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fixslinks

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.shared.Edit
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction

private const val SHARE_LINKS = "$EXTENSION/ShareLinks;"

/**
 * Hands share links to the extension's `ShareLinks` at each place a link comes in: the in-app link opener, and the two
 * activities whose intent filters take `/r/` and `/u/` links from other apps. They pass it to
 * `RedditMailClickDummyActivity`, the invisible activity that routes a Reddit URL by its type, which stays open while
 * the extension resolves the redirect, then routes the result.
 */
@Suppress("unused")
val fixSLinksPatch =
    patch(
        name = "Fix /s/ links",
        description = "Opens Reddit share links (/s/) as the post they point to, from the app and from other apps.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)
        dependsOn(extensionPatch)

        execute {
            // The extension opens these by name.
            for (activity in listOf(MAIN_ACTIVITY, MAIL_CLICK_ACTIVITY)) {
                if (classDefByOrNull(activity) == null) throw PatchException("The app has no $activity")
            }
            val opener = LinkOpenerFingerprint.matchSingle().method
            val main = MainIntentFingerprint.matchSingle().method
            val userPath = OnCreateFingerprint(USER_PATH_ACTIVITY).matchSingle().method
            val router = OnCreateFingerprint(MAIL_CLICK_ACTIVITY).matchSingle().method

            val edits =
                listOf(
                    // The URL is p0 and the context p8; both may be above v15, so they go through v0 and v1.
                    opener.returnIfTrue(
                        0,
                        locals = 2,
                        """
                            move-object/from16 v0, p0
                            move-object/from16 v1, p8
                            invoke-static { v0, v1 }, $SHARE_LINKS->open(Ljava/lang/String;Landroid/content/Context;)Z
                        """,
                    ),
                    main.returnIfTrue(0, locals = 1, activityCall("forward")),
                    userPath.returnIfTrue(userPath.afterSuperOnCreate(), locals = 1, activityCall("forward")),
                    router.returnIfTrue(router.afterSuperOnCreate(), locals = 1, activityCall("resolve")),
                )
            edits.forEach(Edit::apply)
        }
    }

private fun activityCall(method: String) = "invoke-static/range { p0 .. p0 }, $SHARE_LINKS->$method(Landroid/app/Activity;)Z"

/**
 * An edit that inserts [call], which leaves a boolean result, at [index], and returns from the method when it is true.
 * The result goes in v0; the method must have [locals] local registers, the ones [call] uses.
 */
private fun MutableMethod.returnIfTrue(
    index: Int,
    locals: Int,
    call: String,
): Edit {
    if (returnType != "V") throw PatchException("$definingClass->$name doesn't return void")
    val available = localRegisters()
    if (available < locals) throw PatchException("$definingClass->$name has $available local registers, $locals are needed")
    val original = getInstruction<BuilderInstruction>(index)
    // A branch to the original instruction would skip the call.
    if (original.location.labels.isNotEmpty()) throw PatchException("A branch lands on instruction $index of $definingClass->$name")
    // The skip lands on the original instruction; a branch can't land on a move-result.
    if (original.opcode in listOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_EXCEPTION)) {
        throw PatchException("Instruction $index of $definingClass->$name keeps a result")
    }
    return Edit(1) {
        addInstructionsWithLabels(
            index,
            """
                $call
                move-result v0
                if-eqz v0, :original
                return-void
            """,
            ExternalLabel("original", original),
        )
    }
}
