package patches.gridcraft

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import patches.shared.ARTCRAFT_ORIGINAL_ICON
import patches.shared.ArtCraftBrand
import patches.shared.anyArtCraftRelease
import patches.shared.artCraftBrandingPatch

internal val gridCraftBrand = ArtCraftBrand(
    compatibility = Compatibility(
        name = "GridCraft", packageName = "io.github.artcraftandroid.gridcraft", apkFileType = ApkFileType.APK,
        targets = anyArtCraftRelease,
    ),
    slug = "gridcraft",
    brandName = "Microsoft Excel",
    iconStyles = linkedMapOf(
        "Original GridCraft" to ARTCRAFT_ORIGINAL_ICON,
        "Microsoft Excel (default)" to "excel",
    ),
    defaultIcon = "excel",
    description = "Renames GridCraft to Microsoft Excel and gives it the Microsoft Excel launcher icon. " +
        "Choose another name or GridCraft's original icon.",
    // The themed-icon layer is the logo's white X.
    extraResources = mapOf("excel" to listOf(
        "drawable-nodpi/morphe_gridcraft_monochrome_artwork.png",
        "drawable/morphe_gridcraft_monochrome.xml",
    )),
)

@Suppress("unused")
val customBrandingPatch = artCraftBrandingPatch(gridCraftBrand)
