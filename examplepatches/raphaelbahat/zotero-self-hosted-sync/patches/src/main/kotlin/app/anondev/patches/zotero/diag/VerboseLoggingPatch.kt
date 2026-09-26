/*
 * Copyright 2026 anondev.
 *
 * GPLv3. See the LICENSE file for details.
 */

package app.anondev.patches.zotero.diag

import app.anondev.patches.zotero.shared.Constants.COMPATIBILITY_ZOTERO
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/** Timber and the two types the plant needs, as the target app bundles them. */
private const val TIMBER_CLASS = "Ltimber/log/Timber;"
private const val TIMBER_FOREST = "Ltimber/log/Timber\$Forest;"
private const val TIMBER_TREE = "Ltimber/log/Timber\$Tree;"
private const val DEBUG_TREE = "Ltimber/log/Timber\$DebugTree;"

private const val INITIALIZER = "<clinit>"

/**
 * Plants Timber's debug tree so the app's own log lines reach logcat.
 *
 * The release build never plants a tree — `Timber.<clinit>` builds an empty forest and no
 * `Timber.plant` call exists anywhere — so every `Timber.d/e/…` the app makes is discarded. That
 * includes the attachment-upload path (`ReadAttachmentUploadsDbRequest`, which logs why it skips a
 * row, and `UploadAttachmentSyncAction`), which is exactly the trace needed when a self-hosted
 * server ends up with attachment metadata but no file bytes.
 *
 * The plant is injected at the last instruction of `Timber.<clinit>`: the method is static and
 * declares `.registers 2`, so `v0`/`v1` are free scratch registers with no parameters to preserve
 * — no register helper and no extra dependency are needed.
 *
 * Off by default: a diagnostics tool, not a behaviour change. Nothing but the tree is touched.
 */
@Suppress("unused")
val verboseLoggingPatch = bytecodePatch(
    name = "Enable verbose logging",
    description = "For development only. Plants Timber's debug tree so the app's own log lines " +
        "reach logcat — expect a lot of output, and do not patch this into a build you rely on.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZOTERO)
    category("Diagnostics")

    execute {
        val timber = mutableClassDefBy(TIMBER_CLASS)
        val initializer = timber.methods.firstOrNull { it.name == INITIALIZER }
            ?: throw PatchException(
                "Enable verbose logging: '$TIMBER_CLASS' has no $INITIALIZER method in this APK.",
            )

        val instructions = initializer.implementation?.instructions
            ?: throw PatchException(
                "Enable verbose logging: $INITIALIZER has no implementation in this APK.",
            )
        if (instructions.isEmpty()) {
            throw PatchException("Enable verbose logging: $INITIALIZER is empty in this APK.")
        }

        // Inserted before the final instruction; see the class comment for why v0/v1 are safe.
        initializer.addInstructions(
            instructions.size - 1,
            "new-instance v0, $DEBUG_TREE\n" +
                "invoke-direct {v0}, $DEBUG_TREE-><init>()V\n" +
                "sget-object v1, $TIMBER_CLASS->Forest:$TIMBER_FOREST\n" +
                "invoke-virtual {v1, v0}, $TIMBER_FOREST->plant($TIMBER_TREE)V\n",
        )
    }
}
