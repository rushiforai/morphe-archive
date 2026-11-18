package app.saketh.patches.webnovel.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Server-driven promotional splash screen shown on launch.
 * A null config list makes SplashActivity take its normal no-splash startup path.
 */
internal object SplashScreenConfigsFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/QDReader/components/entity/SplashScreenBean;",
    name = "getConfigs",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

/**
 * Per-chapter ad placement config from the server (reader banner and chapter-end ad).
 * The method already has a fallback that returns an empty placement for "not ok" devices.
 */
internal object ChapterAdPositionFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/QDReader/components/entity/ChapterContentItem;",
    name = "getAdPosition",
    returnType = "Lcom/qidian/QDReader/components/entity/AdPosition;",
    parameters = listOf(),
    strings = listOf("getAdPosition return empty AdPosition for not ok device"),
)

/**
 * Decides whether the reader footer shows the bottom banner ad.
 */
internal object ReaderBottomBannerFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        string("currentPageItem"),
        methodCall(
            definingClass = "Lcom/qidian/QDReader/components/entity/AdPosition;",
            name = "getReadBanner",
        ),
    ),
)

/**
 * Reader page renderer. The call right after the "LINE_TYPE_BOTTOM_AD" log inserts the
 * chapter-end ad view (and its "remove ads" promo) into the page.
 */
internal object ChapterEndAdRendererFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("drawHelper LINE_TYPE_BOTTOM_AD"),
        methodCall(
            definingClass = "this",
            parameters = listOf("J", "J", "Landroid/widget/LinearLayout;", "Z"),
            returnType = "V",
            location = MatchAfterWithin(10),
        ),
    ),
)

/** Uses the native no-market-data branch to remove the promoted shelf slot. */
internal object LibraryPromotedBookFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/Int/reader/fragment/ReadsFragment;",
    returnType = "V",
    parameters = listOf("Lcom/qidian/QDReader/components/entity/LibraryReadingTimeItem;"),
    filters = listOf(methodCall(name = "getFirstBookInfo")),
)

/** Cached promotional slots are reinserted at the head of the shelf after updates and edit-mode changes. */
internal object LibraryCachedPromotedBookFingerprint : Fingerprint(
    definingClass = "Lcom/qidian/Int/reader/fragment/ReadsFragment;",
    returnType = "V",
    parameters = listOf("Lcom/qidian/QDReader/components/entity/BookShelfItem;"),
    filters = listOf(methodCall(definingClass = "Ljava/util/ArrayList;", name = "add", parameters = listOf("I", "Ljava/lang/Object;"))),
)

/** The first daily lookup is the native show/hide decision, before binding/reporting. */
internal object LibraryDailyRecommendationFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/qidian/QDReader/components/entity/LibraryReadingTimeItem;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/qidian/QDReader/components/entity/LibraryReadingTimeItem;", name = "getDaily"),
        methodCall(definingClass = "Lcom/qidian/Int/reader/view/LibraryDailyGuideView;", name = "setLibraryReadingTimeItem"),
    ),
)
