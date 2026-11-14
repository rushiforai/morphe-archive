package semicoloncolonel.mobilestream.patches.yttvshell.misc

import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml

// The shell app is YouTube for Android TV, so its launcher icon and Android TV banner are
// YouTube's. Since the patched app is YouTube TV, this replaces them with YouTube TV's own icon
// and banner, taken from the YouTube TV (unplugged) app. The images are bundled under
// resources/yttvshell/branding at the same paths they have in the app's res folder. A dependency
// of Skip ads.
private val IMAGES = listOf(
    "drawable/app_banner.png",
    "mipmap-mdpi/ic_launcher.png",
    "mipmap-hdpi/ic_launcher.png",
    "mipmap-xhdpi/ic_launcher.png",
    "mipmap-xxhdpi/ic_launcher.png",
    "mipmap-xxxhdpi/ic_launcher.png",
)

val brandingPatch = resourcePatch {
    execute {
        // Touch a values resource so the full resource table is decoded to readable file names;
        // otherwise the obfuscated drawable/mipmap files are not writable by their real paths.
        resourceXml("res/values/strings.xml").use { }

        IMAGES.forEach { image ->
            val bundled = object {}.javaClass.classLoader.getResourceAsStream("yttvshell/branding/$image")
                ?: throw IllegalStateException("Bundled image $image missing")
            val target = resourceFile("res/$image", false)
            target.parentFile.mkdirs()
            bundled.use { input -> target.outputStream().use { input.copyTo(it) } }
        }
    }
}
