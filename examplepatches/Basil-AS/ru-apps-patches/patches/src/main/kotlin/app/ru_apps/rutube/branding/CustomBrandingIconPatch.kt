// Ported from virzak/morphe-patches (GPLv3), app/rutube/patches/branding/CustomBrandingIconPatch.kt.
package app.ru_apps.rutube.branding

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.ru_apps.rutube.shared.Constants.COMPATIBILITY_RUTUBE
import java.io.File

/**
 * Where the replacement icons live inside this bundle.
 *
 * Files are named `<resource>-<density>.<ext>`, which is only a convention for looking
 * them up here - they are written out under the app's own resource names. Both a `.png`
 * and a `.webp` variant are bundled for every icon/density, because RuTube switched its
 * launcher resources from PNG to lossless WebP at some point and may switch back or
 * ship a mix; the target file's own extension picks which bundled variant is used, so
 * the replacement is always written in the same format the app already ships.
 */
private const val ICON_RESOURCES = "/rutube/branding"

private val DENSITIES = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")

private val SUPPORTED_EXTENSIONS = listOf("png", "webp")

/**
 * Anchor for loading the bundled icons.
 *
 * The lookup has to go through a class defined in *this* bundle. Inside `execute` the
 * receiver is the patcher's own `ResourcePatchContext`, so reaching for `javaClass`
 * there searches the patcher's jar instead and silently finds nothing.
 */
private object BundledIcons

/**
 * The three launcher resources, with the pixel size each density is expected to be.
 *
 * The sizes are asserted before anything is overwritten. The app ships its resource
 * *files* under obfuscated names (`res/asb.png`), so a resource that moved or changed
 * shape in a later version could otherwise be replaced with an icon of the wrong size,
 * and the only symptom would be a subtly wrong launcher icon.
 */
private val LAUNCHER_ICONS = mapOf(
    "ic_launcher" to listOf(48, 72, 96, 144, 192),
    "ic_launcher_foreground" to listOf(108, 162, 216, 324, 432),
    "ic_launcher_round" to listOf(48, 72, 96, 144, 192),
)

@Suppress("unused")
val customBrandingIconPatch = resourcePatch(
    name = "Custom branding icon",
    description = "Adds a badge to the launcher icon so the patched app is " +
        "distinguishable from an unpatched install.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    execute {
        val res = get("res")
        if (!res.isDirectory) throw PatchException("No decoded res directory to patch.")

        // Density directories carry an API qualifier that is not fixed across builds
        // (mipmap-xxxhdpi vs mipmap-xxxhdpi-v4), so match on the density instead of
        // assuming a full directory name.
        val mipmapDirs = res.listFiles()
            ?.filter { it.isDirectory && it.name.startsWith("mipmap-") }
            .orEmpty()

        var replaced = 0

        LAUNCHER_ICONS.forEach { (icon, sizes) ->
            DENSITIES.zip(sizes).forEach { (density, expectedSize) ->
                val target = mipmapDirs
                    .filter { it.name.substringAfter("mipmap-").substringBefore("-") == density }
                    .flatMap { dir -> SUPPORTED_EXTENSIONS.map { ext -> File(dir, "$icon.$ext") } }
                    .firstOrNull(File::exists)
                    ?: return@forEach

                val actualSize = target.imageWidth()
                if (actualSize != expectedSize) {
                    throw PatchException(
                        "Expected $icon at $density to be ${expectedSize}px, " +
                            "but it is ${actualSize}px. The launcher icons have changed " +
                            "shape in this version and the replacements no longer fit.",
                    )
                }

                val ext = target.extension
                val replacement = BundledIcons.javaClass
                    .getResourceAsStream("$ICON_RESOURCES/$icon-$density.$ext")
                    ?: throw PatchException("Missing bundled icon $icon-$density.$ext.")

                replacement.use { input -> target.outputStream().use(input::copyTo) }
                replaced++
            }
        }

        // Every icon being absent means the resource names are not what this patch
        // expects, which would otherwise pass as a successful no-op.
        if (replaced == 0) {
            throw PatchException(
                "Found none of the expected launcher icons under res/mipmap-*. " +
                    "The app's icon resources have been renamed.",
            )
        }
    }
}

/**
 * Reads the pixel width out of a launcher icon image, dispatching on its extension.
 *
 * Done by hand rather than with an image library because patches also run on device,
 * where `javax.imageio` does not exist.
 */
private fun File.imageWidth(): Int = when (extension.lowercase()) {
    "png" -> pngWidth()
    "webp" -> webpWidth()
    else -> throw PatchException("$name is neither a PNG nor a WebP file.")
}

private fun File.pngWidth(): Int = inputStream().use { stream ->
    val header = ByteArray(24)
    if (stream.readNBytes(header, 0, 24) != 24) throw PatchException("$name is not a PNG.")
    header.copyOfRange(16, 20).fold(0) { acc, byte -> (acc shl 8) or (byte.toInt() and 0xFF) }
}

/**
 * Reads the pixel width out of a WebP file's RIFF container.
 *
 * Only the lossless `VP8L` chunk format is handled - the only format RuTube's launcher
 * icons have been observed to use - since the simple fixed-width (lossy `VP8`) and
 * extended (`VP8X`) chunk layouts encode dimensions differently.
 */
private fun File.webpWidth(): Int = inputStream().use { stream ->
    val header = ByteArray(25)
    if (stream.readNBytes(header, 0, 25) != 25 ||
        header.copyOfRange(0, 4).toString(Charsets.US_ASCII) != "RIFF" ||
        header.copyOfRange(8, 12).toString(Charsets.US_ASCII) != "WEBP"
    ) {
        throw PatchException("$name is not a WebP file.")
    }

    val fourCc = header.copyOfRange(12, 16).toString(Charsets.US_ASCII)
    if (fourCc != "VP8L") {
        throw PatchException("$name uses unsupported WebP chunk format '$fourCc' (only VP8L is handled).")
    }

    // VP8L: 1 signature byte (0x2F) then a little-endian 32-bit field packing
    // 14 bits width-1, 14 bits height-1, 1 bit alpha flag, 3 bits version.
    val bits = header[21].toInt().and(0xFF) or
        (header[22].toInt().and(0xFF) shl 8) or
        (header[23].toInt().and(0xFF) shl 16) or
        (header[24].toInt().and(0xFF) shl 24)
    (bits and 0x3FFF) + 1
}
