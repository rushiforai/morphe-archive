package dev.jkcarino.adobo.patches.reddit.layout.relatedposts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

private object ToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("RelatedPostLazyListSection(id=")
    )
)

internal object RelatedPostsFingerprint : Fingerprint(
    classFingerprint = ToStringFingerprint,
    returnType = "V",
    filters = listOf(
        string(
            string = "related_posts_label",
            comparison = StringComparisonType.STARTS_WITH
        )
    )
)
