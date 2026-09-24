package app.lchanc3.patches.jptt.article

import app.lchanc3.patches.jptt.shared.Constants.ARTICLE_FRAGMENT_CLASS
import app.morphe.patcher.Fingerprint

/**
 * `ArticleFragment.notifyDataSetChanged()`, called by `ArticleUrlAsyncTask` every
 * time a link in the article resolves to an image, so the list of image URLs is
 * still growing while this runs.
 */
internal object ArticleFragmentNotifyDataSetChangedFingerprint : Fingerprint(
    definingClass = ARTICLE_FRAGMENT_CLASS,
    name = "notifyDataSetChanged",
    returnType = "V",
    parameters = emptyList(),
)

/** `ArticleFragment.showListPartial()`, called after a page of the article is parsed. */
internal object ArticleFragmentShowListPartialFingerprint : Fingerprint(
    definingClass = ARTICLE_FRAGMENT_CLASS,
    name = "showListPartial",
    returnType = "V",
    parameters = emptyList(),
)
