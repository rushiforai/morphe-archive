package patches.wordcraft

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import patches.shared.ARTCRAFT_ORIGINAL_ICON
import patches.shared.ArtCraftBrand
import patches.shared.anyArtCraftRelease
import patches.shared.artCraftBrandingPatch

internal val wordCraftBrand = ArtCraftBrand(
    compatibility = Compatibility(
        name = "WordCraft", packageName = "io.github.artcraftandroid.wordcraft", apkFileType = ApkFileType.APK,
        targets = anyArtCraftRelease,
    ),
    slug = "wordcraft",
    brandName = "Microsoft Word",
    iconStyles = linkedMapOf(
        "Original WordCraft" to ARTCRAFT_ORIGINAL_ICON,
        "Microsoft Word (default)" to "word",
    ),
    defaultIcon = "word",
    description = "Renames WordCraft to Microsoft Word and gives it the Microsoft Word launcher icon. " +
        "Choose another name or WordCraft's original icon.",
    // The themed-icon layer is the logo's white W.
    extraResources = mapOf("word" to listOf(
        "drawable-nodpi/morphe_wordcraft_monochrome_artwork.png",
        "drawable/morphe_wordcraft_monochrome.xml",
    )),
)

@Suppress("unused")
val customBrandingPatch = artCraftBrandingPatch(wordCraftBrand)
