package app.morphe.patches.bejeweled

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.Constants

/**
 * Cross-promo button-text patch for Bejeweled Classic.
 *
 * The "GET STARS!" button label lives in the Nimble OBB, not in any DEX:
 *   assets/main.com.ea.gp.bej3.obb  (ZIP, stored)
 *     -> iphone/main.rsb           (Nimble RSB, magic "1bsr")
 *        -> <String id="13194">GET STARS!</String>   (plain text in the XML blob)
 *
 * It is absent from every classesN.dex, res/, and native .so, and renders
 * offline / cache-cleared / first-load (the OBB is bundled in base.apk,
 * not a Play download), so it is a Nimble resource string, not server-pushed
 * and not a DEX string.
 *
 * Patch: SAME-LENGTH byte replacement inside the OBB, applied to every
 * localized copy of the button. The RSB interleaves the same ID block
 * (13190-13199) once per language, so the button value (id 13194) appears
 * once per locale — each with its own text and byte length:
 *   German  "STARS HOLEN!"    (12)   -> "   GitHub   "
 *   English "GET STARS!"      (10)   -> "  GitHub  "
 *   Spanish "¡HAZTE CON ÉL!"  (16)   -> "     GitHub     "
 *   French  "OBTENIR STARS !" (15)   -> "    GitHub!    "
 *   Italian "SCARICA STARS!"  (14)   -> "    GitHub    "
 * Each replacement is byte-for-byte the same length as its original (core
 * "GitHub" centered with equal spaces; French keeps "GitHub!" centered), so
 * the RSB header, offset table, and OBB file size stay byte-identical.
 *
 * The OBB must stay uncompressed (it is stored for mmap); rawResourcePatch
 * keeps the entry in doNotCompress.
 */
val bejeweledObbButtonText = rawResourcePatch(
    name = "[Experimental] Cross-promo-button-text",
    description = "Replaces the in-game \"GET STARS!\" cross-promo button label (a Nimble OBB string, all locales) with \"GitHub\" (same length per locale, no size change).",
    default = true
) {
    compatibleWith(Constants.BEJEWELED_COMPATIBILITY)

    execute {
        val obb = get("assets/main.com.ea.gp.bej3.obb")

        val data = obb.readBytes()
        var total = 0
        for ((original, replacement) in BUTTON_SWAPS) {
            total += replaceInPlace(data, original.toByteArray(), replacement.toByteArray())
        }
        if (total > 0) {
            obb.writeBytes(data)
        }
    }
}

/**
 * Localized button values (id 13194) and their same-length centered
 * replacements. Each pair is byte-equal in length (UTF-8); "GitHub" is
 * centered with equal spaces on both sides, French keeps "GitHub!".
 */
private val BUTTON_SWAPS: List<Pair<String, String>> = listOf(
    "STARS HOLEN!" to "   GitHub   ",       // German  (12)
    "GET STARS!" to "  GitHub  ",           // English (10)
    "¡HAZTE CON ÉL!" to "     GitHub     ", // Spanish (16)
    "OBTENIR STARS !" to "    GitHub!    ", // French  (15)
    "SCARICA STARS!" to "    GitHub    ",   // Italian (14)
)

/** Same-length byte replacement (no shift, size preserved). Returns match count. */
private fun replaceInPlace(src: ByteArray, find: ByteArray, repl: ByteArray): Int {
    check(find.size == repl.size) { "find/repl must be same length" }
    var idx = 0
    var count = 0
    while (idx <= src.size - find.size) {
        var match = true
        for (i in find.indices) {
            if (src[idx + i] != find[i]) { match = false; break }
        }
        if (match) {
            for (i in repl.indices) src[idx + i] = repl[i]
            count++
            idx += find.size
        } else {
            idx++
        }
    }
    return count
}
