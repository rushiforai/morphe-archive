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
    }
}
