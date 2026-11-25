package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private object BrandingAssets

@Suppress("unused")
val brandingPatch = resourcePatch(
    name = "futatabi branding",
    description = "Rename the app to futatabi and use its blue-to-teal launcher icon on black. Optional.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "futatter", packageName = "com.Nanasaki.ftutter", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "3.1.1", versionCode = 65)),
    ))
    execute {
        // Separate names keep the original icon and Restore launcher icon independent,
        // regardless of the order in which the two optional patches execute.
        val files = mutableListOf(
            "res/mipmap-anydpi-v26/futatabi_launcher.xml",
        )
        for (density in listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")) {
            files += "res/drawable-$density-v4/futatabi_launcher_foreground.png"
            files += "res/mipmap-$density-v4/futatabi_launcher.png"
        }
        for (path in files) {
            val destination = get(path, copy = false)
            val input = BrandingAssets::class.java.classLoader
                ?.getResourceAsStream("futatabi-branding/$path")
                ?: throw PatchException("futatabi: missing bundled branding resource $path")
            input.use { source ->
                destination.parentFile.mkdirs()
                destination.outputStream().use { source.copyTo(it) }
            }
        }
        document("AndroidManifest.xml").use { doc ->
            val app = doc.documentElement.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("futatabi: application manifest element missing")
            app.setAttribute("android:label", "futatabi")
            app.setAttribute("android:icon", "@mipmap/futatabi_launcher")
            app.setAttribute("android:roundIcon", "@mipmap/futatabi_launcher")
            val activities = app.getElementsByTagName("activity")
            val main = (0 until activities.length).map { activities.item(it) as Element }
                .singleOrNull { it.getAttribute("android:name") == "com.Nanasaki.ftutter.MainActivity" }
                ?: throw PatchException("futatabi: original launcher activity missing")
            main.setAttribute("android:label", "futatabi")
            main.setAttribute("android:icon", "@mipmap/futatabi_launcher")
            // The separate posting launcher keeps its own label and inherits the app icon.
        }
    }
}
