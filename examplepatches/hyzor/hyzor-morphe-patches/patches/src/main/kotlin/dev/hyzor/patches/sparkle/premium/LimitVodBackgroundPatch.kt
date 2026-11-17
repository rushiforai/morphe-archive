package dev.hyzor.patches.sparkle.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.hyzor.patches.sparkle.shared.Constants.SPARKLE
import org.w3c.dom.Element

/**
 * Caps the VOD full-screen background artwork.
 *
 * `MovieDetailsActivity` and `SeriesDetailsActivity` load their background through Glide with
 * `movie_image_background_*` / `series_image_background_*` as the requested size. The stock
 * values are `2000dp` square, so on a 4K TV at 640 dpi (density 4) Glide decodes an
 * 8000 x 8000 ARGB bitmap — 256 MB. Android refuses to draw it
 * (`Canvas: trying to draw too large(256000000bytes) bitmap`) and the activity is killed as
 * soon as it opens, which is why the VOD screens appear to bounce straight back.
 *
 * `960dp` x `540dp` is still the full 3840 x 2160 pixels at density 4, so a 4K screen loses
 * nothing, while the bitmap drops to 32 MB. The VOD screens are only reachable once the
 * licence gates are open, so this ships as an internal dependency of `Enable Plus` rather
 * than a separate user-facing patch.
 */
internal val limitVodBackgroundPatch = resourcePatch(
    description = "Caps the VOD background artwork so 4K screens do not allocate an 8K bitmap.",
) {
    compatibleWith(SPARKLE)

    execute {
        document("res/values/dimens.xml").use { document ->
            val replacements = linkedMapOf(
                "movie_image_background_width" to "960dp",
                "movie_image_background_height" to "540dp",
                "series_image_background_width" to "960dp",
                "series_image_background_height" to "540dp",
            )
            val dimens = document.getElementsByTagName("dimen")
            val found = mutableSetOf<String>()

            for (index in 0 until dimens.length) {
                val element = dimens.item(index) as? Element ?: continue
                val replacement = replacements[element.getAttribute("name")] ?: continue
                element.textContent = replacement
                found += element.getAttribute("name")
            }

            val missing = replacements.keys - found
            if (missing.isNotEmpty()) {
                throw PatchException(
                    "Sparkle: res/values/dimens.xml is missing ${missing.joinToString()}. " +
                        "The VOD background sizes moved; re-derive the artwork cap.",
                )
            }
        }
    }
}
