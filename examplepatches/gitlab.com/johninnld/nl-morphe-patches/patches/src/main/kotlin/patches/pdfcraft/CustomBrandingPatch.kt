package patches.pdfcraft

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import patches.shared.ARTCRAFT_ORIGINAL_ICON
import patches.shared.ArtCraftBrand
import patches.shared.anyArtCraftRelease
import patches.shared.artCraftBrandingPatch

internal val pdfCraftBrand = ArtCraftBrand(
    compatibility = Compatibility(
        name = "PdfCraft", packageName = "io.github.artcraftandroid.pdfcraft", apkFileType = ApkFileType.APK,
        targets = anyArtCraftRelease,
    ),
    slug = "pdfcraft",
    brandName = "Adobe Acrobat",
    iconStyles = linkedMapOf(
        "Original PdfCraft" to ARTCRAFT_ORIGINAL_ICON,
        "Adobe Acrobat (default)" to "acrobat",
        "Adobe Acrobat classic" to "acrobat_classic",
    ),
    defaultIcon = "acrobat",
    description = "Renames PdfCraft to Adobe Acrobat and gives it the Adobe Acrobat launcher icon. " +
        "Choose another name, the classic Acrobat icon or PdfCraft's original icon.",
    // The classic artwork keeps its gradient as a bitmap behind the glyph.
    extraResources = mapOf("acrobat_classic" to listOf("drawable-nodpi/morphe_pdfcraft_backdrop.png")),
)

@Suppress("unused")
val customBrandingPatch = artCraftBrandingPatch(pdfCraftBrand)
