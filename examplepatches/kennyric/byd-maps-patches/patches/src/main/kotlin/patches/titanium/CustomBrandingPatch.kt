package patches.titanium

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import patches.shared.ARTCRAFT_ORIGINAL_ICON
import patches.shared.ArtCraftBrand
import patches.shared.anyArtCraftRelease
import patches.shared.artCraftBrandingPatch

internal val titaniumBrand = ArtCraftBrand(
    compatibility = Compatibility(
        name = "Titanium Browser", packageName = "io.github.jqssun.helium", apkFileType = ApkFileType.APK,
        targets = anyArtCraftRelease,
    ),
    slug = "titanium",
    brandName = "Chrome",
    iconStyles = linkedMapOf(
        "Original Titanium" to ARTCRAFT_ORIGINAL_ICON,
        "Chrome (default)" to "chrome",
    ),
    defaultIcon = "chrome",
    description = "Renames Titanium Browser to Chrome and gives it the Chrome launcher icon. " +
        "Choose another name or Titanium's original icon.",
    // The themed-icon layer is the logo's silhouette.
    extraResources = mapOf("chrome" to listOf(
        "drawable-nodpi/morphe_titanium_monochrome_artwork.png",
        "drawable/morphe_titanium_monochrome.xml",
    )),
)

@Suppress("unused")
val customBrandingPatch = artCraftBrandingPatch(titaniumBrand)
