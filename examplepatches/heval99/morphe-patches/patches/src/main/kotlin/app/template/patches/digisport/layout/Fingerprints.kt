package app.template.patches.digisport.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.template.patches.digisport.ads.dataGetterFingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Since 1.1.16 (R8) the listing and article-widget parsers are inlined into multi-case lambda
// classes (one invoke method that switches on a byte case field and also hosts unrelated code).
// The cases are found by the app's own string literals; the patches guard on the case selector
// (see LambdaCases.kt). Data classes keep their names and field names, their getters are renamed.

internal const val API_ARTICLE = "Lro/rcsrds/digisport/data/model/api/article/ApiArticle;"
internal const val API_ARTICLE_LAYOUT = "Lro/rcsrds/digisport/data/model/api/article/ApiArticleLayout;"
internal const val ARTICLE_SECTION = "Lro/rcsrds/digisport/data/model/ui/articles/ArticleSection;"
internal const val SECTION_TYPE = "Lro/rcsrds/digisport/data/model/ui/articles/SectionType;"
internal const val UI_EXCLUSIVE = "Lro/rcsrds/digisport/data/model/ui/epg/UIExclusive;"
internal const val HOME_FRAGMENT = "Lro/rcsrds/digisport/ui/main/home/HomeFragment;"
internal const val WIDGET_TITLE_LAYOUT = "row.widget.title"

// ArticleConstants.KEY_WIDGET_CROSS: the widget type of the cross-promotion block that lists
// articles from sister RCS&RDS apps and sites under an article.
internal const val WIDGET_CROSS = "widgetCross"

// ApiArticle's sponsored text (a nullable String; listing titles show it as a label).
internal val apiArticleSponsoredFingerprint = dataGetterFingerprint(API_ARTICLE, "sponsored", "Ljava/lang/String;")

// ApiArticleLayout's widget type ("widgetCross", ...).
internal val apiArticleLayoutTypeFingerprint = dataGetterFingerprint(API_ARTICLE_LAYOUT, "type", "Ljava/lang/String;")

// ParsingExtensionsKt.getSpacing(): a plain BASE / SPACING section.
internal val spacingSectionFingerprint = Fingerprint(
    returnType = ARTICLE_SECTION,
    parameters = listOf(),
    filters = listOf(fieldAccess(definingClass = SECTION_TYPE, name = "SPACING")),
    custom = { method, _ -> method.implementation != null && AccessFlags.STATIC.isSet(method.accessFlags) },
)

// GetListingDetailsArticles.parseListingArticles(article), inlined into the listing article
// lambda (a byte case field plus the GetListingDetailsArticles and ApiArticle captures). Its case
// queues the card (the lambda's other case, addArticle), adds the listing ad widget on page "1"
// and the "bg"-dependent separator lines.
internal val listingArticleLambdaFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(string("1"), string("bg")),
    custom = { method, classDef ->
        method.implementation != null && classDef.fields.any { it.type == API_ARTICLE } &&
            classDef.fields.any { it.type == "B" }
    },
)

// GetArticleDetails' widget card lambda with GetArticleDetailsWidgets.addArticleWidget inlined:
// one article card of a widget under an article, flagged as cross-promotion when the widget type
// is "widgetCross" (the only use of that string in the app). Its case adds the card to the list.
internal val articleWidgetLambdaFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(string(WIDGET_CROSS)),
    custom = { method, _ -> method.implementation != null },
)

// GetArticleDetailsWidgets.widgetTitle(sections, widget), inlined into a shared lambda: the
// heading row of a widget (layout "row.widget.title") with its widget lines.
internal val widgetTitleLambdaFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(string(WIDGET_TITLE_LAYOUT)),
    custom = { method, _ -> method.implementation != null },
)

// HomeViewModel.getExclusiveVideo(), inlined into a HomeFragment method: fills the "has exclusive
// promotion" flag and the count from the EPG's exclusive-video count (UIExclusive's count getter,
// read twice). The Home header shows the "EXCLUSIVE ONLINE · LIVE" bar only when the flag is true.
internal val homeExclusiveVideoFingerprint = Fingerprint(
    definingClass = HOME_FRAGMENT,
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = UI_EXCLUSIVE, returnType = "I"),
        methodCall(definingClass = UI_EXCLUSIVE, returnType = "I"),
    ),
    custom = { method, _ -> method.implementation != null },
)
