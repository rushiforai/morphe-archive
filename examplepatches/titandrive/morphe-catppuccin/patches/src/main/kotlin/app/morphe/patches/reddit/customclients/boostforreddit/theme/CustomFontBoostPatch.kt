package app.morphe.patches.reddit.customclients.boostforreddit.theme

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.filePathOption
import app.morphe.patches.shared.fonts.readTrueType
import org.w3c.dom.Element

@Suppress("unused")
val customFontBoostPatch = bytecodePatch(
    name = "Boost custom font",
    description = "Uses your TTF font throughout Boost, preserving bold and italic text. No in-app font selector.",
    default = false,
) {
    compatibleWith(Compatibility(name = "Boost for Reddit", packageName = "com.rubenmayayo.reddit",
        targets = listOf(AppTarget(version = "1.12.12"), AppTarget(version = "1.14.2"), AppTarget(version = "1.14.3"))))
    val fontFile = filePathOption(
        key = "font-file", default = null, title = "Custom TTF font",
        description = "Choose a TTF file to embed as Boost's font. Repatch to change or remove it.",
        required = true, allowedExtensions = listOf("ttf"),
    )
    dependsOn(resourcePatch {
        execute {
            val bytes = readTrueType(requireNotNull(fontFile.value) { "Choose a TTF font file." })
            get("assets/catppuccin/boost-custom-font.ttf").apply { parentFile.mkdirs(); writeBytes(bytes) }
            get("res/font/boost_custom_font.ttf").apply { parentFile.mkdirs(); writeBytes(bytes) }
            // Text appearances and widget styles can override the application theme's family.
            // Set both framework and AppCompat attributes on every existing style so the
            // selected family also reaches dialogs, preferences, toolbars and list items.
            for (directory in get("res").listFiles().orEmpty()) {
                if (!directory.isDirectory || !directory.name.startsWith("values")) continue
                for (file in directory.listFiles().orEmpty()) {
                    if (file.extension != "xml" || !file.readText().contains("<style")) continue
                    document("res/${directory.name}/${file.name}").use { xml ->
                        val styles = xml.getElementsByTagName("style")
                        for (index in 0 until styles.length) {
                            val style = styles.item(index) as Element
                            for (attribute in listOf("android:fontFamily", "fontFamily")) {
                                val children = style.childNodes
                                val existing = (0 until children.length).mapNotNull { children.item(it) as? Element }
                                    .firstOrNull { it.tagName == "item" && it.getAttribute("name") == attribute }
                                val item = existing ?: xml.createElement("item").apply {
                                    setAttribute("name", attribute)
                                    style.appendChild(this)
                                }
                                item.textContent = "@font/boost_custom_font"
                            }
                        }
                    }
                }
            }
            // Explicit attributes on layouts take precedence over their styles.
            for (directory in get("res").listFiles().orEmpty()) {
                if (!directory.isDirectory || !directory.name.startsWith("layout")) continue
                for (file in directory.listFiles().orEmpty()) {
                    if (file.extension != "xml" || !file.readText().contains("fontFamily")) continue
                    document("res/${directory.name}/${file.name}").use { xml ->
                        val elements = xml.getElementsByTagName("*")
                        for (index in 0 until elements.length) {
                            val element = elements.item(index) as Element
                            for (attribute in listOf("android:fontFamily", "app:fontFamily")) {
                                if (element.hasAttribute(attribute)) element.setAttribute(attribute, "@font/boost_custom_font")
                            }
                        }
                    }
                }
            }
        }
    })
    execute {
        // Boost assigns post/comment fonts programmatically through this cache.
        // Reuse its asset loader and cache rather than repeatedly loading a font.
        val modern = packageMetadata.versionName in setOf("1.14.2", "1.14.3")
        val loader = mutableClassDefBy(if (modern) "Lps2;" else "Lhe/q;").methods.single {
            it.name == (if (modern) "e0" else "a") && it.parameterTypes == listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
                it.returnType == "Landroid/graphics/Typeface;"
        }
        val argument = if (modern) "p1" else "p2"
        loader.addInstructions(0, "const-string $argument, \"catppuccin/boost-custom-font.ttf\"")
    }
}
