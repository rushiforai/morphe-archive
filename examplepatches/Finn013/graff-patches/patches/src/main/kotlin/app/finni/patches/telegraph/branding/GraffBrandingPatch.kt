package app.finni.patches.telegraph.branding

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.shared.bundledBytes
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption

private val DENSITIES = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")
private val ICON_FILES = listOf("graff_bg.png", "graff_fg.png", "ic_launcher.png", "ic_launcher_round.png")

@Suppress("unused")
val graffBrandingPatch = patch(
    name = "Graff branding",
    description = "Renames the app (default \"Graff\") and replaces the default launcher icon " +
        "with the Graff adaptive icon.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    val appName by stringOption(
        key = "appName",
        default = "Graff",
        values = mapOf("Graff" to "Graff"),
        title = "App name",
        description = "Name shown under the launcher icon.",
        required = true,
    ) { !it.isNullOrBlank() }

    val brandStyle by stringOption(
        key = "brandStyle",
        default = "tailplane",
        values = mapOf(
            "Raccoon-tail paper plane (Graff v4)" to "tailplane",
            "Classic Graff paper plane (Graff v3)" to "classic",
            "Keep original icon" to "original",
        ),
        title = "Launcher icon",
        description = "Graff launcher icon style.",
        required = true,
    ) { it in setOf("tailplane", "classic", "original") }

    execute {
        resourceXml("res/values/strings.xml").use { strings ->
            strings.resource("AppName").text = appName!!
        }

        val style = brandStyle!!
        if (style == "original") return@execute

        // New mipmaps (graff_bg / graff_fg) plus legacy PNG launcher icons for every density.
        DENSITIES.forEach { density ->
            ICON_FILES.forEach { file ->
                val target = resourceFile("res/mipmap-$density/$file", false)
                target.parentFile.mkdirs()
                target.writeBytes(bundledBytes("graff/icon/$style/mipmap-$density/$file"))
            }
        }

        // Adaptive icon (API 26+) for the default launcher alias.
        listOf("ic_launcher", "ic_launcher_round").forEach { name ->
            resourceXml("res/mipmap-anydpi-v26/$name.xml").use { icon ->
                icon.root.removeChildren()
                icon.root.appendChild("background") { setAttribute("android:drawable", "@mipmap/graff_bg") }
                icon.root.appendChild("foreground") { setAttribute("android:drawable", "@mipmap/graff_fg") }
            }
        }
    }
}
