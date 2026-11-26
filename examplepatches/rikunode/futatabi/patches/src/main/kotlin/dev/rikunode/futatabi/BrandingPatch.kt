package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.file.Files
import java.nio.file.attribute.FileTime
import java.security.MessageDigest
import org.w3c.dom.Element

private object BrandingAssets

// All existing AOT writers verify full-file hashes during execute. Rename only
// after their writes, at the verified standalone UTF-16 snapshot string.
private val brandingTitleResources = rawResourcePatch {
    finalize {
        val lib = get("lib/arm64-v8a/libapp.so")
        val bytes = lib.readBytes()
        val digest = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
        val supported = setOf(
            "dd542fe3af5f266096e07f823da3880d3a6e7c771aa80afe6324137e63c5041a",
            "f46c85060c997990099d8a6848d119680346bccd84371d7e34c45ac66e18a5b0",
            LOGIN_ONLY_LIBAPP_SHA256,
            "a076ce46ff02e598d1e8c183ef8306ce447ec1f5117e2198bcad379bd07ec5d7",
            REPLY_ONLY_LIBAPP_SHA256, REPLY_BANNER_LIBAPP_SHA256,
            REPLY_LOGIN_LIBAPP_SHA256, REPLY_ALL_LIBAPP_SHA256,
        )
        val offset = 0xfdac2
        val original = "ふたったー".toByteArray(Charsets.UTF_16LE)
        // Keep the snapshot's serialized string width; U+200B has no visible glyph.
        val replacement = "ふたたび\u200b".toByteArray(Charsets.UTF_16LE)
        if (digest !in supported || bytes[offset - 1] != 0x8b.toByte() ||
            !bytes.copyOfRange(offset, offset + original.size).contentEquals(original))
            throw PatchException("futatabi: unsupported ARM64 title snapshot")
        replacement.copyInto(bytes, offset)
        val stamp = Files.getLastModifiedTime(lib.toPath())
        lib.writeBytes(bytes)
        if (Files.getLastModifiedTime(lib.toPath()) == stamp)
            Files.setLastModifiedTime(lib.toPath(), FileTime.fromMillis(stamp.toMillis() + 2000))
    }
}

@Suppress("unused")
val brandingPatch = resourcePatch(
    name = "futatabi branding",
    description = "Use the futatabi launcher name and icon, and rename the home title to ふたたび. Optional.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "futatter", packageName = "com.Nanasaki.ftutter", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "3.1.1", versionCodes = mapOf(app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to 65))),
    ))
    dependsOn(brandingTitleResources)
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
