package app.liquidmusic.patches.applemusic.layout.icon

import app.liquidmusic.patches.applemusic.shared.Constants.COMPATIBILITY_APPLE_MUSIC
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.File

private const val ICON_RESOURCES = "liquidmusic/icon"

private object IconResourceAnchor

private val DENSITIES = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")

@Suppress("unused")
val liquidIconPatch = resourcePatch(
    name = "Liquid Glass icon",
    description = "Replaces the Apple Music launcher icon with a custom Liquid Glass icon (including Android 13+ themed monochrome).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_APPLE_MUSIC)

    execute {
        decode("res/mipmap*/ic_launcher*")
        val resDir = get("res")
        val folders = resDir.listFiles { file -> file.isDirectory }.orEmpty()

        fun folderFor(prefix: String): File =
            folders.firstOrNull { it.name == prefix }
                ?: folders.firstOrNull {
                    it.name.matches(Regex("${Regex.escape(prefix)}-v([0-9]+)")) &&
                        it.name.substringAfterLast("-v").toInt() <= 26
                }
                ?: resDir.resolve(prefix).apply { mkdirs() }

        fun copyResource(resourcePath: String, destination: File) {
            val stream = IconResourceAnchor::class.java.classLoader
                .getResourceAsStream("$ICON_RESOURCES/$resourcePath")
                ?: throw PatchException("Missing icon resource: $resourcePath")
            stream.use { input ->
                destination.outputStream().use { output -> input.copyTo(output) }
            }
        }

        for (density in DENSITIES) {
            val folder = folderFor("mipmap-$density")
            for (fileName in listOf("liquidmusic_icon_background.png", "ic_launcher.png", "ic_launcher_round.png")) {
                copyResource("mipmap-$density/$fileName", folder.resolve(fileName))
            }
        }

        copyResource(
            "drawable/liquidmusic_icon_monochrome.xml",
            folderFor("drawable").resolve("liquidmusic_icon_monochrome.xml"),
        )

        val adaptiveIcons = folders
            .filter { it.name.startsWith("mipmap-anydpi") }
            .map { it.resolve("ic_launcher.xml") }
            .filter(File::isFile)

        if (adaptiveIcons.isEmpty()) {
            throw PatchException("Could not locate Apple Music adaptive icon (ic_launcher.xml)")
        }

        adaptiveIcons.forEach { copyResource("mipmap-anydpi-v26/ic_launcher.xml", it) }
    }
}
