package app.bin0culars.patches.reddit.layout.tabletgrid

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

private val MASONRY_PARAMETERS =
    listOf(
        "L",
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "L",
        "L",
        "F",
        "L",
        "Landroidx/compose/runtime/internal/a;",
        "Z",
        "L",
        "Lkotlin/jvm/functions/Function2;",
        "L",
        "I",
        "I",
    )

object ListFeedFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/ui/composables/feed/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters =
    listOf(
        "L",
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "Landroidx/compose/foundation/lazy/b;",
        "L",
        "Lcom/reddit/feeds/data/FeedType;",
        "F",
        "Lkotlin/jvm/functions/Function2;",
        "L",
        "L",
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Z",
        "L",
        "L",
        "Lkotlin/jvm/functions/Function0;",
        "L",
        "F",
        "L",
        "Z",
        "L",
        "Lkotlin/jvm/functions/Function1;",
        "F",
        "L",
        "L",
        "I",
        "I",
        "I",
        "I",
    ),
)

object MasonryFeedFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/ui/composables/feed/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = MASONRY_PARAMETERS,
)

object SearchMasonryCallFingerprint : Fingerprint(
    filters =
    listOf(
        string("search_screen_surface"),
        methodCall(
            parameters = MASONRY_PARAMETERS,
            returnType = "V",
        ),
    ),
)

object StaggeredCellsFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("I"),
    filters = listOf(string("grid with no rows/columns")),
)
