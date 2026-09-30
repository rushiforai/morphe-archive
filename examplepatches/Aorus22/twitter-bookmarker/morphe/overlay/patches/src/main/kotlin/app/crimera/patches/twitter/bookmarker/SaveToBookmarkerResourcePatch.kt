/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md.
 */

package app.crimera.patches.twitter.bookmarker

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources

/**
 * Ships the save button's own icons.
 *
 * The button uses drawables of ours rather than names from the app: the native
 * bookmark icon is a different action, so reusing its artwork would make the two
 * buttons indistinguishable. Two of them, because the button shows whether the
 * tweet is already in the archive. The resource names are what
 * `ResourceUtils.getIdentifier` looks up at runtime.
 */
@Suppress("unused")
val saveToBookmarkerResourcePatch =
    resourcePatch {
        execute {
            copyResources(
                "twitter/bookmarker",
                ResourceGroup(
                    "drawable",
                    "ic_twb_bookmark.xml",
                    "ic_twb_bookmark_saved.xml",
                ),
            )
        }
    }
