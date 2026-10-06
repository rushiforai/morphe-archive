package app.morphe.patches.instants

import app.morphe.patcher.patch.resourcePatch

private const val WORDMARK_NAME = "moonshot___instants_instants_wordmark_in_product.xml"

/**
 * Replaces the "Instants" header logo with a "WInstants" vector drawable.
 *
 * The header is the image `moonshot___instants_instants_wordmark_in_product`, which ships as a
 * proprietary AppRedrawableDrawable stub (no drawing data in res/). The Compose header loads it
 * as a plain Drawable, so a standard VectorDrawable with the same name is a drop-in replacement.
 * The glyphs come from the app's own font (Optimistic) with a slab "I" to resemble the original;
 * the fill color is irrelevant because the header tints the image.
 */
@Suppress("unused")
val instantsWordmarkPatch = resourcePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)

    execute {
        // The logo exists once per density; the system picks the closest one, so all are replaced.
        listOf("mdpi", "xhdpi", "xxhdpi").forEach { density ->
            get("res/drawable-$density/$WORDMARK_NAME").writeText(WINSTANTS_VECTOR)
        }
    }
}
