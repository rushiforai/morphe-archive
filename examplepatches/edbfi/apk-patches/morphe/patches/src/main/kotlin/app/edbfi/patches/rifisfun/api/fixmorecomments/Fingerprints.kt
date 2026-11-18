// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.rifisfun.api.fixmorecomments

import app.morphe.patcher.Fingerprint

internal const val THREAD = "Lcom/andrewshu/android/reddit/things/objects/ThreadThing;"

/** The more-comments loader, R8-renamed, builds its form from the thread: `link_id`, `id`, `api_type`, `children`, `sort`. */
internal object MoreCommentsFormFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/util/ArrayList;",
    strings = listOf("link_id", "id", "api_type", "children", "sort"),
    custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == THREAD },
)
