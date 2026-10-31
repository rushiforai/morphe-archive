/*
 * Modifications Copyright 2026 brealorg.
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.insets

import app.morphe.patcher.Fingerprint

internal val mediaImageActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/ui/activities/MediaImageActivity;",
    name = "onCreate",
)

internal val mediaVideoActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/ui/activities/MediaVideoActivity;",
    name = "onCreate",
)

internal val mainActivityOnResumeFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/ui/submissions/subreddit/MainActivity;",
    name = "onResume",
)

internal val myApplicationOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/MyApplication;",
    name = "onCreate",
)
