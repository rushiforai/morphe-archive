package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import java.io.File

private const val BANNER = "Lapp/mightymorphing/extension/joey/SeasonalBanner;"

/** Puts the bundled pictures in the app so the header can load them with no network. */
private val seasonalBannerResources = resourcePatch {
    compatibleWith(JOEY)

    execute {
        // Assets only. The extension reads every picture from here, so a second copy in
        // res/drawable only made the app bigger.
        val assets = get("assets").resolve("seasonal")
        assets.mkdirs()
        val pictures = listOf(
            "christmas", "halloween", "diwali", "perseids",
            "summer", "blossom", "valentine", "newyear",
            "coffee", "synthwave", "jellyfish",
            "vinyl", "campfire", "potion", "origami",
            "logo_plain", "logo_headphones", "logo_glasses", "logo_flower",
            "logo_leaf", "logo_bamboo", "logo_spark",
        )
        for (name in pictures) {
            val bytes = loadPicture(name) ?: continue
            assets.resolve("$name.png").writeBytes(bytes)
            val motion = loadFile("${name}_overlay.webp") ?: continue
            assets.resolve("${name}_overlay.webp").writeBytes(motion)
            if (name.startsWith("logo_")) {
                loadFile("${name}_icon.webp")?.let { assets.resolve("${name}_icon.webp").writeBytes(it) }
                loadFile("${name}_bg.png")?.let { assets.resolve("${name}_bg.png").writeBytes(it) }
            }
        }
    }
}

@Suppress("unused")
val seasonalBannerPatch = bytecodePatch(
    name = "Seasonal sidebar banner",
    description = "Shows a picture in the sidebar header that changes with the season, or one you choose. If you set it back to Joey's image, any picture Joey had already saved is still there and gets used again.",
    default = true,
) {
    compatibleWith(JOEY)

    dependsOn(seasonalBannerResources)
    extendWith("extensions/extension.mpe")

    execute {
        HomeActivityOnCreateFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $BANNER->enable()V
            """,
        )
        SettingsHookFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $BANNER->enable()V
            """,
        )

        // After Joey's header bind, including the saved drawer picture. Classic and Modern both use this row.
        val header = Fingerprint(
            definingClass = "Lva/c;",
            name = "p",
            returnType = "V",
            parameters = listOf(
                "Lq5/c;",
                "Landroidx/recyclerview/widget/RecyclerView\$c0;",
                "I",
                "Ljava/util/List;",
            ),
        ).method
        header.insertAt(
            header.instructions.lastIndex,
            """
            invoke-static {p2}, $BANNER->apply(Ljava/lang/Object;)V
            """,
        )
    }
}

private fun loadPicture(name: String): ByteArray? = loadFile("$name.png")

private fun loadFile(name: String): ByteArray? {
    val loader = Class.forName("app.mightymorphing.patches.joey.SeasonalBannerPatchKt").classLoader
    loader?.getResourceAsStream("seasonal/$name")?.use { return it.readBytes() }
    var dir = File(System.getProperty("user.dir") ?: ".")
    repeat(5) {
        val file = dir.resolve("patches/src/main/resources/seasonal/$name")
        if (file.isFile) return file.readBytes()
        dir = dir.parentFile ?: return null
    }
    return null
}
