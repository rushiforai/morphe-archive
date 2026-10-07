/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.restore

import app.mix.patches.reddit.sync.cosmetics.archiveSourceBadgePatch
import app.mix.patches.reddit.sync.profile.userAgentFingerprint
import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val restoreDeletedPostsPatch = bytecodePatch(
    name = "Restore deleted posts",
    description = "Restores deleted or removed post content from Arctic Shift when available.",
) {
    compatibleWith(COMPATIBILITY_SYNC)
    dependsOn(archiveSourceBadgePatch)

    execute {
        val userAgent = userAgentFingerprint.method.let {
            "${it.definingClass}->${it.name}()Ljava/lang/String;"
        }
        commentsResponseFingerprint.method.apply {
            val bodyIndex = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.let {
                    it.definingClass == "Ljava/lang/String;" && it.name == "<init>"
                            && it.parameterTypes == listOf("[B")
                } == true
            }
            val constructor = implementation!!.instructions.elementAt(bodyIndex) as FiveRegisterInstruction
            val body = constructor.registerC
            val scratch = constructor.registerD
            val parserIndex = indexOfFirstInstructionOrThrow(bodyIndex + 1) {
                getReference<MethodReference>()?.parameterTypes == listOf(
                    "Landroid/content/Context;", "Ljava/lang/String;", "I",
                )
            }
            val parser = implementation!!.instructions.elementAt(parserIndex) as FiveRegisterInstruction
            val context = parser.registerC
            addInstructions(
                bodyIndex + 1,
                """
                invoke-static {}, $userAgent
                move-result-object v$scratch
                invoke-static {v$context, v$body, v$scratch}, Lapp/mix/extension/syncforreddit/DeletedPostRestorer;->restore(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$body
                """,
            )
        }
    }
}
