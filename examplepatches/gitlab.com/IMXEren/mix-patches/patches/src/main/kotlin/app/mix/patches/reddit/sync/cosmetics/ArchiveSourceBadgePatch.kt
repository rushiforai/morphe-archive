/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.cosmetics

import app.mix.patches.reddit.sync.extension.sharedExtensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/mix/extension/syncforreddit/ArchiveSourceBadge;"

internal val archiveSourceBadgePatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        listOf(postDescriptionFingerprint, commentDescriptionFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                addInstructions(
                    implementation!!.instructions.size - 1,
                    """
                    invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->decorate(Landroid/widget/TextView;Ljava/lang/Object;)V
                    """,
                )
            }
        }
    }
}
