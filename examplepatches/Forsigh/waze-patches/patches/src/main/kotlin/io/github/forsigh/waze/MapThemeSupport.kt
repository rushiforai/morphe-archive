package io.github.forsigh.waze

import app.morphe.patcher.patch.PatchException

/**
 * Shared machinery for the map-theme row (`ThemePatch`).
 *
 * A theme is a palette substitution that runs at RUNTIME, inside the app: Waze streams its skin
 * files through two points (the resource extractor on first run, and the loadSkinJNI bridge when
 * it refreshes or re-reads a skin), and the hooks this patch installs rewrite the palette lines
 * on the way through. The files inside the APK stay exactly as Waze built them - nothing is
 * written to disk - which is what keeps a themed build packable by every Morphe version. (An
 * earlier build of this row edited the asset files themselves; current Morphe packers then emit
 * zip folder records that Waze's renderer crashes on at launch, so the files stay untouched.)
 *
 * One menu, two slots: the day selector and the night selector each offer the WHOLE catalog, so
 * any theme can run in either mode (an OLED theme in daylight, a light theme at night - the
 * user's call). Nothing in the machinery cares which palette a theme carries; the night slot's
 * pairs are applied to `.night.lua` files and the day slot's pairs to `.day.lua` files.
 *
 * A theme defines `key = rgb(0xWANTED)` for the canvas and the five road classes. The hooks turn
 * each key into literal text pairs `key = rgb(0xSTOCK)` -> `key = rgb(0xWANTED)`, one pair per
 * distinct stock value the key has across the driving and editor palettes of that mode. If a
 * future Waze build changes a stock value, that replacement simply stops matching - the theme
 * degrades to stock for that key, it cannot crash.
 *
 * The catalog families, named so both selectors can tell them apart:
 *
 *  - `AMOLED ...`     - night palettes on true black (#000000), for OLED screens.
 *  - `Dark ...`       - night palettes on Waze's own night background (#272E3A).
 *  - `Paper / Lavender / Mint / Coastal` - light canvases with daylight-tuned road ramps.
 *
 * A theme carries a canvas, not a mode: a dark canvas in the day slot (or a light canvas at
 * night) also swaps the map-text family to the other mode's values, so labels never sit
 * black-on-black on a themed map - see `DAY_TEXT_TO_NIGHT` below.
 */

/** Stock night palettes (driving map and editor), measured on Waze 5.24.90.901 through 5.25.4.900. */
internal val STOCK_NIGHT = mapOf(
    "map_background" to "272E3A",
    "freeways" to "799ABA",
    "primary" to "54718C",
    "secondary" to "3F5871",
    "highways" to "3F5871",
    "street" to "3F5871",
)

/** The editor's night palette: same canvas, but its road colours differ from the driving map. */
internal val STOCK_NIGHT_EDITOR = mapOf(
    "map_background" to "272E3A",
    "freeways" to "8F5D9F",
    "primary" to "1987AB",
    "secondary" to "0B7039",
    "highways" to "9C9B35",
    "street" to "3F5871",
)

/** Stock day palettes - same structure, light values. */
internal val STOCK_DAY = mapOf(
    "map_background" to "FAFCFA",
    "freeways" to "8D949B",
    "primary" to "A6ADB3",
    "secondary" to "C6CBCF",
    "highways" to "BABFC4",
    "street" to "D2D7DB",
)

/** The editor's day palette: same canvas, coloured road classes. */
internal val STOCK_DAY_EDITOR = mapOf(
    "map_background" to "FAFCFA",
    "freeways" to "CA9DFA",
    "primary" to "33CCFF",
    "secondary" to "71EB96",
    "highways" to "FDEC7B",
    "street" to "D2D7DB",
)

/**
 * The theme menu. One catalog for both selectors - `Stock` is handled separately (it means
 * "leave this mode untouched" and produces no pairs at all).
 */
internal val THEMES = linkedMapOf(
    "AMOLED" to mapOf(
        "map_background" to "000000",
    ),
    "AMOLED Pop" to mapOf(
        // The readability variant: plain AMOLED's canvas with the night road ramp lifted +15% per
        // channel (same hues, luminance +14.7-15.1%) so streets stay readable on true black.
        "map_background" to "000000",
        "freeways" to "8BB1D6",
        "primary" to "6182A1",
        "secondary" to "486582",
        "highways" to "486582",
        "street" to "486582",
    ),
    "AMOLED Carbon" to mapOf(
        "map_background" to "000000",
        "freeways" to "ECEFF2",
        "primary" to "B4BAC0",
        "secondary" to "6E757C",
        "highways" to "6E757C",
        "street" to "6E757C",
    ),
    "AMOLED Purple" to mapOf(
        "map_background" to "000000",
        "freeways" to "CA9DFA",
        "primary" to "A173E8",
        "secondary" to "6F4CC0",
        "highways" to "6F4CC0",
        "street" to "6F4CC0",
    ),
    "AMOLED Emerald" to mapOf(
        "map_background" to "000000",
        "freeways" to "7DE3A0",
        "primary" to "4CC47A",
        "secondary" to "2F9A55",
        "highways" to "2F9A55",
        "street" to "2F9A55",
    ),
    "AMOLED Blue" to mapOf(
        "map_background" to "000000",
        "freeways" to "9CC8FF",
        "primary" to "6AA4F0",
        "secondary" to "4A7DC8",
        "highways" to "4A7DC8",
        "street" to "4A7DC8",
    ),
    "AMOLED Amber" to mapOf(
        "map_background" to "000000",
        "freeways" to "E9B85E",
        "primary" to "C8923F",
        "secondary" to "9A7030",
        "highways" to "9A7030",
        "street" to "9A7030",
    ),
    // The Bright family: same true-black canvas as the AMOLED rows, but the road ramp sits high
    // enough in luminance that streets stay legible without squinting - the answer to "the AMOLED
    // colours are too dark". Freeways are near-white tints of the hue, secondary still clearly lit.
    "AMOLED Lilac" to mapOf(
        "map_background" to "000000",
        "freeways" to "F0D9FF",
        "primary" to "D3B0FF",
        "secondary" to "A683E8",
        "highways" to "A683E8",
        "street" to "A683E8",
    ),
    "AMOLED Mint" to mapOf(
        "map_background" to "000000",
        "freeways" to "C8FFE0",
        "primary" to "9AF0C0",
        "secondary" to "6FC79A",
        "highways" to "6FC79A",
        "street" to "6FC79A",
    ),
    "AMOLED Ice" to mapOf(
        "map_background" to "000000",
        "freeways" to "D6ECFF",
        "primary" to "A9CDFF",
        "secondary" to "7FA8E0",
        "highways" to "7FA8E0",
        "street" to "7FA8E0",
    ),
    "AMOLED Peach" to mapOf(
        "map_background" to "000000",
        "freeways" to "FFD9C2",
        "primary" to "FFB894",
        "secondary" to "D98F6B",
        "highways" to "D98F6B",
        "street" to "D98F6B",
    ),
    "Dark Purple" to mapOf(
        "map_background" to "272E3A",
        "freeways" to "B18CFF",
        "primary" to "8E63E8",
        "secondary" to "6A47B8",
        "highways" to "6A47B8",
        "street" to "6A47B8",
    ),
    "Dark Emerald" to mapOf(
        "map_background" to "272E3A",
        "freeways" to "6FD695",
        "primary" to "3FB868",
        "secondary" to "2A8148",
        "highways" to "2A8148",
        "street" to "2A8148",
    ),
    "Dark Blue" to mapOf(
        "map_background" to "272E3A",
        "freeways" to "6FA8F5",
        "primary" to "4A7FD4",
        "secondary" to "3560A8",
        "highways" to "3560A8",
        "street" to "3560A8",
    ),
    "Dark Amber" to mapOf(
        "map_background" to "272E3A",
        "freeways" to "E0A94F",
        "primary" to "C08737",
        "secondary" to "8F6426",
        "highways" to "8F6426",
        "street" to "8F6426",
    ),
    "Paper" to mapOf(
        "map_background" to "F5EFE2",
        "freeways" to "8A6B42",
        "primary" to "A5865B",
        "secondary" to "C0AF92",
        "highways" to "C0AF92",
        "street" to "C0AF92",
    ),
    "Lavender" to mapOf(
        "map_background" to "F3F0FA",
        "freeways" to "7E5BD0",
        "primary" to "9B7BDD",
        "secondary" to "BCA6EA",
        "highways" to "BCA6EA",
        "street" to "BCA6EA",
    ),
    "Mint" to mapOf(
        "map_background" to "EFF6F0",
        "freeways" to "3E9A63",
        "primary" to "5FB381",
        "secondary" to "93CDA9",
        "highways" to "93CDA9",
        "street" to "93CDA9",
    ),
    "Coastal" to mapOf(
        "map_background" to "ECF3FA",
        "freeways" to "3E7BC9",
        "primary" to "6494D4",
        "secondary" to "9DBEE6",
        "highways" to "9DBEE6",
        "street" to "9DBEE6",
    ),
)

/** The selector choices shared by both slots: Stock (untouched) plus the whole catalog. */
internal val THEME_CHOICES: Map<String, String> = linkedMapOf<String, String>("Stock" to "Stock").apply {
    THEMES.keys.forEach { put(it, it) }
}

/**
 * The map-text family swap. Waze ships two text designs: the day skin's dark labels (for the
 * light canvas) and the night skin's light labels (for the dark canvas). Without this, a theme
 * paints its canvas but the labels keep the mode's own text - a dark theme in the day slot left
 * city names #3D4B52 on a #000000 canvas, unreadable. When a slot's theme canvas clashes with
 * the mode that way, these twelve lines turn the skin's whole label family (the label greys,
 * the label halo, one-way arrows, station/city/vegetation/water labels, generic-event labels
 * and their outline, the ad-label pair) into the OTHER mode's Waze-designed values.
 *
 * Gate: dark canvas in the day slot -> day text becomes the night text; light canvas in the
 * night slot -> night text becomes the day text. Dark-at-night and light-at-day keep the mode's
 * own text, which is already correct. Each search string below is unique in its skin file
 * (checked against the 5.25.4.900 assets), so the runtime replace cannot cascade.
 */
internal val DAY_TEXT_TO_NIGHT: List<Pair<String, String>> = listOf(
    "labels = rgb(0x787878)" to "labels = rgb(0xCADADC)",
    "labels_strong = rgb(0x565C61)" to "labels_strong = rgb(0xD2E2E4)",
    "labels_bgcolor = rgb(0xffffff)" to "labels_bgcolor = rgba(0x091421bf)",
    "oneWay = rgba(0x55555566)" to "oneWay = rgba(0xffffff44)",
    "label_station = rgb(0x8E9496)" to "label_station = rgb(0x97B8D8)",
    "label_cities = rgb(0x3D4B52)" to "label_cities = rgb(0xB9C5D3)",
    "label_vegetation = rgb(0x118742)" to "label_vegetation = rgb(0x7CDA98)",
    "label_water = rgb(0x1360A7)" to "label_water = rgb(0x80DDFF)",
    "label_generic_event = rgb(0xA84600)" to "label_generic_event = rgb(0xFFC400)",
    "label_outline_generic_event = rgb(0xFFFFFF)" to "label_outline_generic_event = rgb(0x202124)",
    "ad_labels_color = rgb(0x565C61)" to "ad_labels_color = rgb(0xD2E2E4)",
    "ad_labels_outline_color = rgb(0xffffff)" to "ad_labels_outline_color = rgba(0x091421bf)",
)

/** The same twelve lines in the other direction: a light canvas in the night slot. */
internal val NIGHT_TEXT_TO_DAY: List<Pair<String, String>> = listOf(
    "labels = rgb(0xCADADC)" to "labels = rgb(0x787878)",
    "labels_strong = rgb(0xD2E2E4)" to "labels_strong = rgb(0x565C61)",
    "labels_bgcolor = rgba(0x091421bf)" to "labels_bgcolor = rgb(0xffffff)",
    "oneWay = rgba(0xffffff44)" to "oneWay = rgba(0x55555566)",
    "label_station = rgb(0x97B8D8)" to "label_station = rgb(0x8E9496)",
    "label_cities = rgb(0xB9C5D3)" to "label_cities = rgb(0x3D4B52)",
    "label_vegetation = rgb(0x7CDA98)" to "label_vegetation = rgb(0x118742)",
    "label_water = rgb(0x80DDFF)" to "label_water = rgb(0x1360A7)",
    "label_generic_event = rgb(0xFFC400)" to "label_generic_event = rgb(0xA84600)",
    "label_outline_generic_event = rgb(0x202124)" to "label_outline_generic_event = rgb(0xFFFFFF)",
    "ad_labels_color = rgb(0xD2E2E4)" to "ad_labels_color = rgb(0x565C61)",
    "ad_labels_outline_color = rgba(0x091421bf)" to "ad_labels_outline_color = rgb(0xffffff)",
)

/**
 * True when a theme's canvas is dark. The stack separates cleanly: Waze's black (#000000) and
 * the Dark family's #272E3A sit at 0.00-0.18 luminance, the light canvases at 0.93-0.97 - the
 * 0.5 threshold sorts any future theme without a hand-kept list.
 */
internal fun isDarkCanvas(wanted: Map<String, String>): Boolean {
    val hex = wanted["map_background"] ?: return false
    if (hex.length < 6) return false
    val r = hex.substring(0, 2).toInt(16)
    val g = hex.substring(2, 4).toInt(16)
    val b = hex.substring(4, 6).toInt(16)
    return (0.2126 * r + 0.7152 * g + 0.0722 * b) / 255.0 < 0.5
}

/**
 * Expands a theme (key -> wanted hex) into literal replacement pairs:
 * `key = rgb(0xSTOCK)` -> `key = rgb(0xWANTED)`, one pair per distinct stock value the key has
 * across the driving and editor palettes of the mode. Pairs where the wanted value already
 * equals the stock value are skipped (e.g. Dark themes keep the stock background). The key
 * prefix keeps a pair from ever matching another key's line, and the `Palette.<key>` reference
 * lines carry no value, so they cannot match either.
 */
internal fun replacementPairs(
    wanted: Map<String, String>,
    stockDriving: Map<String, String>,
    stockEditor: Map<String, String>,
): List<Pair<String, String>> {
    val pairs = LinkedHashMap<String, String>()
    for ((key, hex) in wanted) {
        val stocks = listOfNotNull(stockDriving[key], stockEditor[key]).distinct()
        if (stocks.isEmpty()) {
            throw PatchException(
                "themePatch: no stock value is known for `$key` - refusing to install a replacement that cannot match",
            )
        }
        for (stock in stocks) {
            if (stock.equals(hex, ignoreCase = true)) continue
            pairs["$key = rgb(0x$stock)"] = "$key = rgb(0x$hex)"
        }
    }
    return pairs.entries.map { it.key to it.value }
}
