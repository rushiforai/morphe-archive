/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.extension.hooks

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook

internal object RedditActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/launch/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
)

internal val redditActivityOnCreateHook = ExtensionHook(RedditActivityOnCreateFingerprint)

internal val redditApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/reddit/frontpage/FrontpageApplication;"
)
