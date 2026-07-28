package app.template.patches.ozon.account

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozon.shared.Constants.COMPATIBILITY_OZON_CURRENT

private const val REVIEW_FEED_TITLE_MARKER = "Лента обзоров"
private const val REVIEW_FEED_AUTHORS_MARKER = "authors-feed"
private const val REVIEW_FEED_SOCIAL_MARKER = "social"
private const val REVIEW_FEED_GALLERY_MARKER = "gallery"

private val returnEmptyList =
    """
        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object v0
        return-object v0
    """.trimIndent()

private val hideReviewFeed =
    """
        invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
        move-result-object v0
        const-string v1, "$REVIEW_FEED_TITLE_MARKER"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v1
        if-nez v1, :ozon_review_feed_hide
        const-string v1, "$REVIEW_FEED_AUTHORS_MARKER"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v1
        if-nez v1, :ozon_review_feed_hide
        const-string v1, "$REVIEW_FEED_SOCIAL_MARKER"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v1
        if-eqz v1, :ozon_review_feed_continue
        const-string v1, "$REVIEW_FEED_GALLERY_MARKER"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v1
        if-eqz v1, :ozon_review_feed_continue
        :ozon_review_feed_hide
        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object v0
        return-object v0
        :ozon_review_feed_continue
    """.trimIndent()

@Suppress("unused")
val hideAccountPromotionsPatch = bytecodePatch(
    name = "Hide account lottery and review feed",
    description = "Removes the lottery entry banner and review feed shortcut from the account screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        listOf(
            EntryBannerSingleMapperFingerprint,
            EntryBannerMultiMapperFingerprint,
            EntryBannerContentMapperFingerprint,
            EntryBannerOverlayMapperFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, returnEmptyList)
        }

        listOf(
            DesignSystemAtomsMapperFingerprint,
            LegacyCellListMapperFingerprint,
            CellListMapperFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, hideReviewFeed)
        }
    }
}
