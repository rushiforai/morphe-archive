package app.jaydenlu.patches.line.customfont

import app.jaydenlu.patches.shared.Constants.COMPATIBILITY_LINE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.File

@Suppress("unused")
val customFontPatch = resourcePatch(
    name = "[General] Custom font",
    description = "Sets a font file from your device as the font of LINE's themes. " +
        "Text that LINE draws without a theme font, such as Jetpack Compose screens, " +
        "can keep the system font.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LINE)

    val fontPath by stringOption(
        key = "fontPath",
        title = "Font file",
        description = "Full path of a .ttf, .otf or .ttc font file on this device, " +
            "for example /storage/emulated/0/Download/MyFont.ttf. " +
            "The patcher needs permission to read the file.",
        required = true,
    )

    // LINE's own font page cannot be used on this build, so this patch does not go through it.
    // It adds the font file as a new font resource and names it in `android:fontFamily` of
    // LINE's themes. A TextView reads that attribute from the theme when its layout and style
    // set no font, so the font reaches every such view with no change to LINE's code.
    //
    // The themes are the ones the manifest gives to the application and its activities, plus
    // their parents inside the app. A theme set at run time often shares one of those parents.
    execute {
        val path = fontPath?.trim().orEmpty()
        if (path.isEmpty()) {
            throw PatchException("Set the \"Font file\" option to the path of a font file")
        }
        val fontFile = File(path)
        if (!fontFile.isFile) {
            throw PatchException("Font file not found: ${fontFile.absolutePath}")
        }
        val extension = fontFile.extension.lowercase()
        if (extension !in FONT_EXTENSIONS) {
            throw PatchException("The font file must be one of $FONT_EXTENSIONS, got: ${fontFile.name}")
        }

        val resDirectory = get("res")

        // The patcher numbers a new resource after the last one of its type. An app with no
        // font resource has no number to continue from.
        if ("type=\"font\"" !in get("res/values/public.xml").readText()) {
            throw PatchException("This LINE version has no font resource to add the font next to")
        }

        // All files are read before the first write, so a failure leaves the resources as they were.
        val themes = manifestThemes(readDocument(get("AndroidManifest.xml")))
        if (themes.isEmpty()) {
            throw PatchException("No app theme found in AndroidManifest.xml")
        }

        val styleFiles = resDirectory
            .listFiles { file -> file.isDirectory && file.name.startsWith("values") }
            .orEmpty()
            .map { it.resolve("styles.xml") }
            .filter { it.isFile }
            .sortedBy { it.parentFile.name }

        val parents = mutableMapOf<String, MutableSet<String>>()
        val stylesOfFile = styleFiles.associateWith { file ->
            readDocument(file).styleParents().onEach { (name, parent) ->
                if (parent != null) parents.getOrPut(name) { mutableSetOf() } += parent
            }.keys
        }
        val targets = withParents(themes, parents)

        val filesToPatch = stylesOfFile.filterValues { names -> names.any(targets::contains) }.keys
        if (filesToPatch.isEmpty()) {
            throw PatchException("None of the app themes $themes is in a styles.xml")
        }

        fontFile.copyTo(
            resDirectory.resolve("font").apply { mkdirs() }.resolve("$FONT_RESOURCE_NAME.$extension"),
            overwrite = true,
        )

        // Only the files that hold a target theme are opened for writing. The patcher encodes
        // every values file a patch writes, so the other files stay as LINE ships them.
        filesToPatch.forEach { file ->
            document("res/${file.parentFile.name}/styles.xml").use { document ->
                document.setThemeFont(targets, "@font/$FONT_RESOURCE_NAME")
            }
        }
    }
}
