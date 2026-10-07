/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.cosmetics

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal val postDescriptionFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/posts/PostDescriptionTextView;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "I", "Z", "Z", "Z"),
)

internal val commentDescriptionFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/comments/CommentDescriptionTextView;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L", "Z"),
)
