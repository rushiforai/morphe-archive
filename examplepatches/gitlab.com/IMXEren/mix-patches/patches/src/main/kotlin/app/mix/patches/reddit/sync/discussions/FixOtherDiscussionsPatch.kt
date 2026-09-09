/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.discussions

import app.mix.patches.reddit.sync.extension.sharedExtensionPatch
import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.mix.patches.reddit.sync.shared.postsRequestConstructorFingerprint
import app.mix.patches.reddit.sync.shared.postsUrlResultIndex
import app.mix.patches.reddit.sync.shared.stringFieldOfParameter
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/mix/extension/syncforreddit/OtherDiscussions;"

@Suppress("unused")
val fixOtherDiscussionsPatch = bytecodePatch(
    name = "Fix Other discussions",
    description = "Uses Reddit search for Other discussions and applies the selected sort.",
) {
    compatibleWith(COMPATIBILITY_SYNC)
    dependsOn(sharedExtensionPatch)

    execute {
        postsRequestConstructorFingerprint.method.apply {
            val cursorField = stringFieldOfParameter(5)
            val urlResultIndex = postsUrlResultIndex()
            addInstructions(
                urlResultIndex + 1,
                """
                move-object/from16 v0, p3
                move-object/from16 v1, p6
                iget-object v1, v1, $cursorField
                move-object/from16 v2, p4
                invoke-static {v3, v0, v1, v2}, $EXTENSION_CLASS->rewriteUrl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v3
                """,
            )
        }

        sortDialogSelectionFingerprint.method.apply {
            val eventConstructor = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.let {
                    it.name == "<init>" && it.parameterTypes == listOf(
                        "Ljava/lang/String;",
                        "Ljava/lang/String;",
                    )
                } == true
            }
            val eventType = getInstruction(eventConstructor)
                .getReference<MethodReference>()!!
            replaceInstruction(
                eventConstructor,
                "invoke-direct {v1, p1, p1}, $eventType",
            )
        }
    }
}
