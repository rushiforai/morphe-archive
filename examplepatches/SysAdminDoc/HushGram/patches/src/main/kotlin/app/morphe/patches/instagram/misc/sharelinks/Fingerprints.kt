/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.sharelinks

import app.morphe.patcher.Fingerprint

/**
 * The parser of the server's answer to "copy link" on a post or reel. The link is the answer's
 * "permalink" field, and the model it fills is named by its GraphQL type, "XDTPermalinkResponse".
 * Parser classes are Redex names; the method name is an interface method, so it's kept.
 */
internal object PermalinkParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    strings = listOf("permalink", PERMALINK_TYPE),
)

internal const val PERMALINK_TYPE = "XDTPermalinkResponse"

/** The same for a story's share link, the "story_item_to_share_url" field. */
internal object StoryShareUrlParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    strings = listOf("story_item_to_share_url", STORY_SHARE_URL_TYPE),
)

internal const val STORY_SHARE_URL_TYPE = "XDTStoryItemThirdPartySharingUrlResponse"
