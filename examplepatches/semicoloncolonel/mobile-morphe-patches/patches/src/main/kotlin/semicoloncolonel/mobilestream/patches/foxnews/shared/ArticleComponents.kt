package semicoloncolonel.mobilestream.patches.foxnews.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext

// Fox News 5.51.0 builds each article's rows from ScreenModel's
// componentModels: ArticleDetailItemEntryListFactory makes one row per
// component, and the floating comments button appears only when the list
// holds a CommentsComponent. The list is filtered as the model is built, at
// the start of its primary constructor. The defaults constructor, copy(), and
// the Parcelable creator all call that constructor.

private const val ARTICLE_COMPONENTS = "Lsemicoloncolonel/mobilestream/extension/foxnews/ArticleComponents;"

internal object ScreenModelConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/data/model/articles/ScreenModel;",
    name = "<init>",
    custom = { method, _ ->
        // (id, title, componentModels, articleUrls, ...). The defaults
        // constructor ends with a DefaultConstructorMarker and calls this one.
        val types = method.parameterTypes.map { it.toString() }
        types.size > 3 && types[2] == "Ljava/util/List;" &&
            types.last() != "Lkotlin/jvm/internal/DefaultConstructorMarker;"
    },
)

/** Passes componentModels (p3) through [filter] in ArticleComponents before the model stores it. */
internal fun BytecodePatchContext.filterArticleComponents(filter: String) {
    ScreenModelConstructorFingerprint.method.addInstructions(
        0,
        """
            invoke-static/range { p3 .. p3 }, $ARTICLE_COMPONENTS->$filter(Ljava/util/List;)Ljava/util/List;
            move-result-object p3
        """,
    )
}
