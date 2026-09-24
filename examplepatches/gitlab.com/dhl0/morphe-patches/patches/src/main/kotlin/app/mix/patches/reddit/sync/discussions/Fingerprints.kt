/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.discussions

import app.morphe.patcher.Fingerprint

internal val sortDialogSelectionFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/material_dialogs/base/AbstractSelectionDialogBottomSheet",
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "SubredditSortAccessDialogBottomSheet.java"
    },
)
