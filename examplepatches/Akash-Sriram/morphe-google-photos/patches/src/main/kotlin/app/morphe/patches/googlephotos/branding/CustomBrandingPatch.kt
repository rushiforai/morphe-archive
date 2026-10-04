package app.morphe.patches.googlephotos.branding

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources

private const val BRANDING_DIR = "app/morphe/patches/googlephotos/branding"

private val densities = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")

// ── Launcher mipmap assets ─────────────────────────────────────────────────────

private val mipmapSquareAssets = listOf(
    "adaptiveproduct_photos_2025_foreground_color_108.png",
    "product_logo_photos_2025_launcher_color_48.png",
)

private val mipmapRoundAssets = listOf(
    "product_logo_photos_2025_round_launcher_color_48.png",
)

// ── In-app drawable assets ─────────────────────────────────────────────────────

private val drawableAssets = listOf(
    "product_logo_photos_color_144.png",
    "product_logo_photos_2025_color_144.png",
    "product_logo_photos_2025_color_36.png",
    "product_logo_photos_color_48.png",
    "product_logo_photos_color_24.png",
    "product_logo_photos_color_192.png",
)

// ── Monochrome themed icon (Android 13+) ──────────────────────────────────────

private val monochromeAsset = listOf(
    "photos_launchericon_release_monochrome.xml",
)

@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom Morphe branding",
    description = "Replaces the Google Photos icon and in-app logos with Morphe branding " +
            "(violet / teal / indigo / slate pinwheel, hand-drawn style).",
    default = false, // opt-in only
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    execute {
        // Replace mipmap launcher icons (square + adaptive foreground)
        densities.forEach { density ->
            copyResources(
                BRANDING_DIR,
                ResourceGroup(
                    "mipmap-$density",
                    *(mipmapSquareAssets + mipmapRoundAssets).toTypedArray(),
                ),
            )
        }

        // Replace drawable in-app logos
        densities.forEach { density ->
            copyResources(
                BRANDING_DIR,
                ResourceGroup(
                    "drawable-$density",
                    *drawableAssets.toTypedArray(),
                ),
            )
        }

        // Replace monochrome vector (Android 13+ themed icon)
        copyResources(
            BRANDING_DIR,
            ResourceGroup(
                "drawable",
                *monochromeAsset.toTypedArray(),
            ),
        )

        // Recolor the header pinwheel Lottie ("rotate to disappear") that plays when the
        // home header collapses. It draws the official 4-colour pinwheel from vector paths,
        // so no PNG replacement covers it.
        val lottie = get("res/raw/photos_lumos_pinwheel_rotate_to_disappear.json")
        if (lottie.exists()) {
            var text = lottie.readText()
            val gradient = Regex("\"g\":\\{\"p\":(\\d+),\"k\":\\{\"a\":0,\"k\":\\[([^\\]]*)\\]")
            lottiePetalColors.forEach { (petal, rgb) ->
                val layerIdx = text.indexOf("\"nm\":\"$petal\"")
                if (layerIdx < 0) return@forEach
                val match = gradient.find(text, layerIdx) ?: return@forEach
                val count = match.groupValues[1].toInt()
                val stops = match.groupValues[2].split(",").map { it.trim() }.toMutableList()
                // Each colour stop = offset, r, g, b; keep offsets, replace colour.
                for (c in 0 until count) {
                    stops[c * 4 + 1] = "%.4f".format(java.util.Locale.US, rgb[0])
                    stops[c * 4 + 2] = "%.4f".format(java.util.Locale.US, rgb[1])
                    stops[c * 4 + 3] = "%.4f".format(java.util.Locale.US, rgb[2])
                }
                val replacement = "\"g\":{\"p\":$count,\"k\":{\"a\":0,\"k\":[${stops.joinToString(",")}]"
                text = text.replaceRange(match.range, replacement)
            }
            lottie.writeText(text)
        }
    }
}

// Morphe palette mapped onto the Lottie's petal layer names (0..1 floats).
private val lottiePetalColors = mapOf(
    "Red" to doubleArrayOf(108 / 255.0, 72 / 255.0, 178 / 255.0),    // violet
    "Yellow" to doubleArrayOf(27 / 255.0, 121 / 255.0, 99 / 255.0),  // teal
    "Green" to doubleArrayOf(116 / 255.0, 117 / 255.0, 178 / 255.0), // indigo
    "Blue" to doubleArrayOf(95 / 255.0, 130 / 255.0, 162 / 255.0),   // slate
)
