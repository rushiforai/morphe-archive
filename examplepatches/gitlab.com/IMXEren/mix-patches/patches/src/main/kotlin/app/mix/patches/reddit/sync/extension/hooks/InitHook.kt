/*
 * Copyright 2026 wchill, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.extension.hooks

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook

internal val initHook = ExtensionHook(
    Fingerprint(
        custom = { method, _ ->
            method.definingClass == "Lcom/laurencedawson/reddit_sync/RedditApplication;" && method.name == "onCreate"
        }
    ),
    insertIndexResolver = { 1 }
)
