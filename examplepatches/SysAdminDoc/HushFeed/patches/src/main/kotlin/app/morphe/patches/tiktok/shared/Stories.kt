/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tiktok.misc.theme.buildName
import app.morphe.patches.tiktok.misc.theme.declaredVersions

/** TikTok's story service. Every TikTok build has it; PineDrama 47.5.3 dropped it with the rest of its stories. */
internal const val STORY_API_CLASS = "Lcom/ss/android/ugc/aweme/story/api/StoryApi;"

/**
 * Whether this build has stories. A declared TikTok build must, so a missing story service fails
 * [patch] there. Any other build (PineDrama 47.5.3 has no stories) leaves [what] out with a note.
 */
internal fun BytecodePatchContext.shipsStories(patch: String, what: String): Boolean {
    if (classDefByOrNull(STORY_API_CLASS) != null) return true
    if (packageMetadata.buildName in declaredVersions()) {
        throw PatchException("$patch: $STORY_API_CLASS is missing, so this build has no stories.")
    }
    println("[$patch] Left out $what on ${packageMetadata.buildName}: it has no stories.")
    return false
}
