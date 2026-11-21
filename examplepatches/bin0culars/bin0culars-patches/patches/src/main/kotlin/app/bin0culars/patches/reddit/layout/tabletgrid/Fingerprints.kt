package app.bin0culars.patches.reddit.layout.tabletgrid

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
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

internal fun firstParameterIndex(parameters: List<String>, type: String): Int {
    val index = parameters.indexOfFirst { it == type }
    if (index == -1) {
        throw PatchException("List feed has no $type parameter")
    }
    return index
}

object ListFeedFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/ui/composables/feed/",
    isStatic = true,
    returnType = "V",
    filters =
    listOf(
        methodCall(
            parameters =
            listOf(
                "L",
                "L",
                "L",
                "Lcom/reddit/feeds/data/FeedType;",
                "Z",
                "L",
                "L",
                "Landroidx/compose/runtime/internal/a;",
                "L",
                "I",
                "I",
            ),
            returnType = "V",
        ),
    ),
    custom = { method, _ ->
        val params = method.parameterTypes.map { it.toString() }
        "Landroidx/compose/foundation/lazy/b;" in params && "Lcom/reddit/feeds/data/FeedType;" in params
    },
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
