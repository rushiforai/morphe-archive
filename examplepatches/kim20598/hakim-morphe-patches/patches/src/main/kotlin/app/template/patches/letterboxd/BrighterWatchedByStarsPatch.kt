package app.template.patches.letterboxd

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import org.w3c.dom.Element

@Suppress("unused")
val brighterWatchedByStarsPatch = resourcePatch(
    name = "Brighter Watched-by stars",
    description = "Other people's star ratings in a film's \"Watched by\" row use a very dark grey " +
        "(#445566) that is hard to read, especially on a black theme. This switches them to the " +
        "lighter grey (#99AABB) the rest of the app already uses for other people's ratings. " +
        "A small legibility fix, on by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        document("res/layout/item_member_film_relationship_icon.xml").use { document ->
            val ratingViews =
                document.getElementsByTagName("com.letterboxd.letterboxd.ui.views.RatingView")
            if (ratingViews.length == 0) {
                throw PatchException(
                    "No <com.letterboxd.letterboxd.ui.views.RatingView> in " +
                        "res/layout/item_member_film_relationship_icon.xml",
                )
            }
            for (i in 0 until ratingViews.length) {
                (ratingViews.item(i) as Element).setAttribute("app:starColor", "@color/gray99AABB")
            }
        }
    }
}
