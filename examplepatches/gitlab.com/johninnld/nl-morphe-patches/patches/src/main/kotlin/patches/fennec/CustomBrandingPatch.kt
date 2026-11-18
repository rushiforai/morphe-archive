package patches.fennec

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import patches.shared.ARTCRAFT_ORIGINAL_ICON
import patches.shared.ArtCraftBrand
import patches.shared.anyArtCraftRelease
import patches.shared.artCraftBrandingPatch

internal val fennecBrand = ArtCraftBrand(
    compatibility = Compatibility(
        name = "Fennec", packageName = "org.mozilla.fennec_fdroid", apkFileType = ApkFileType.APK,
        targets = anyArtCraftRelease,
    ),
    slug = "fennec",
    brandName = "Firefox",
    iconStyles = linkedMapOf(
        "Original Fennec" to ARTCRAFT_ORIGINAL_ICON,
        "Firefox (default)" to "firefox",
    ),
    defaultIcon = "firefox",
    description = "Renames Fennec to Firefox and gives it the Firefox launcher icon. " +
        "Choose another name or Fennec's original icon.",
    // The themed-icon layer is the fox and flame around the globe.
    extraResources = mapOf("firefox" to listOf(
        "drawable-nodpi/morphe_fennec_monochrome_artwork.png",
        "drawable/morphe_fennec_monochrome.xml",
    )),
)

@Suppress("unused")
val customBrandingPatch = artCraftBrandingPatch(fennecBrand)
