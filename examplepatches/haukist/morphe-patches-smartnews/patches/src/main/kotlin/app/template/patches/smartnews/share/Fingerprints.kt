package app.template.patches.smartnews.share

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprint for `LinkShareActionControllerFactoryImpl.create(context, shareData, isShareable)`
 * (`a7a.a(Context, rdf, boolean): d7a`).
 *
 * When `p3` (isShareable/enableDynamicLinks) is forced to false (0), the factory skips
 * creating `ArticleDynamicLinksCreator` and passes null to `LinkShareActionController`.
 * This cleanly triggers the built-in fallback path across all share/copy actions,
 * causing SmartNews to directly share and copy the original article URL rather than
 * requesting a tracking redirect URL (`http://l.smartnews.com/...`).
 */
internal object CreateLinkShareActionControllerFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Landroid/content/Context;", "L", "Z"),
    filters = listOf(
        string("smartnews://openVideoFeed?target=video")
    )
)

/**
 * Fingerprint for `ArticleContainer.Z(View)`: click handler for top-right share button.
 *
 * By overriding the condition before checking `customizedShareSheetEnabled`, execution jumps
 * to the built-in `PopupMenu` (`y4a.v0(view)`) route instead of inflating the bottom sheet
 * (`jp-article-custom-share-sheet`), perfectly reproducing the clean popup menu used in web mode.
 */
internal object ArticleContainerShareMenuFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/article/ArticleContainer;",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        string("customizedShareSheetEnabled")
    )
)
