package sabp.morphe.patches.smartaudiobook.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import sabp.morphe.patches.smartaudiobook.smartAudioBookCompatibility

/**
 * Copies the bundled Outfit font (SIL Open Font License) into the APK's assets. Shared by the Eppy
 * UI and Modern font patches. A new res/font resource type can't be added by the patcher's resource
 * encoder, so the font ships as an asset and is applied in code.
 */
internal val fontAssetPatch = resourcePatch(
    description = "Bundles the Outfit and Plus Jakarta Sans fonts. Applied with the eppy or Modern font patch.",
) {
    compatibleWith(smartAudioBookCompatibility)

    execute {
        // Outfit and Plus Jakarta Sans, both SIL Open Font License 1.1.
        for (name in listOf("eppy_outfit.ttf", "eppy_jakarta.ttf")) {
            val font = get("assets/fonts/$name")
            font.parentFile.mkdirs()
            val stream = object {}.javaClass.getResourceAsStream("/sabp/fonts/$name")
                ?: throw PatchException("Bundled font $name is missing from the patches file.")
            stream.use { input -> font.outputStream().use { input.copyTo(it) } }
        }
    }
}

@Suppress("unused")
val modernFontPatch = bytecodePatch(
    name = "Modern font",
    description = "Uses the rounded geometric Outfit font across the classic SABP screens (lists, " +
        "settings, toolbars), keeping each label's weight. eppy always uses it.",
) {
    compatibleWith(smartAudioBookCompatibility)
    dependsOn(fontAssetPatch)
    extendWith("extensions/sabp.mpe")

    execute {
        val app = mutableClassDefBy("Lak/alizandro/smartaudiobookplayer/SABPApplication;")
        app.methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {p0}, Lapp/morphe/extension/sabp/EppyFont;->install(Landroid/app/Application;)V")
    }
}
