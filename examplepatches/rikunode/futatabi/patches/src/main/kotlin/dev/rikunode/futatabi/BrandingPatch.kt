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

        // Settings list: compact the six surviving slots over purchase + divider,
        // exclude the final beta row and divider, then use the original ListView.
        // Feedback: use a fixed Issues URL, with no user/app value concatenation.
        fun hex(s: String) = s.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
        fun replaceChecked(at: Int, expected: ByteArray, updated: ByteArray) {
            if (expected.size != updated.size ||
                !bytes.copyOfRange(at, at + expected.size).contentEquals(expected))
                throw PatchException("futatabi: unsupported settings snapshot at ${at.toString(16)}")
            updated.copyInto(bytes, at)
        }
        val settingsOriginal = hex("70634091101246f9103007b82bddf597e30300aa6063409100a446f9a3831cf860b000b86063409100a846f960f000b8c0c2009160b001b8c482009164b004b8a2035ff86163409121ac46f906540694e10300aaa0835cf801f004b8c2c2009102f005b8023007b8c3820091033009b8a1035df824b040b89fd0007161000054a1835df8d3f3ec97a4835ef8a3035ef8a2835df8c00680d240b000b841f040b821801c8ba0835cf839dc0191200300b9e000003630f05f3811f05f38300a508a1f825cea40000054924f0694")
        val settingsCode = hex("02b045b8023005b802f045b8027005b8023046b802b005b8027046b802f005b802b046b8023006b802f046b8027006b816b006b816f006b8163007b8c205805222b000b8a4835ef8a3035ef8a2835df81f000014")
        replaceChecked(0x90a0cc, settingsOriginal, settingsCode + settingsOriginal.copyOfRange(settingsCode.size, settingsOriginal.size))
        val feedbackOriginal = hex("a0035ff801f040b821801c8ba1831ef8403740f9006454f9702340f91f00106b810000546247409142ec41f953cf0794703b45f9be835ef8fec100a9e00100f9642f40f9c75af897701f48f9f00100a9904eee97707b409110be40f9e04100a98c4eee97e10300aa")
        val feedbackCode = hex("617b409121bc40f9020080d2c30a80d2e30100f9643b42f96854ee9712000014")
        replaceChecked(0x8aa100, feedbackOriginal, feedbackCode + feedbackOriginal.copyOfRange(feedbackCode.size, feedbackOriginal.size))
        val oldUrl = "https://docs.google.com/forms/d/e/1FAIpQLSf_N_4UVGgZ0wbFdBnA4YDD0WfvWrcid0_DKd2zm3JwkaKlgg/viewform?usp=pp_url&entry.1830299662="
        val issues = "https://github.com/rikunode/futatabi/issues"
        // StringBase.substring(0,43) in the modified closure strips the snapshot padding.
        check(issues.length == 43)
        replaceChecked(0x99c26, oldUrl.toByteArray(Charsets.US_ASCII),
            issues.padEnd(oldUrl.length, ' ').toByteArray(Charsets.US_ASCII))
        val oldNotice = "機能改善のためのアンケートを募集しています\nご気軽にお答えください"
        val newNotice = "不具合・要望はGitHub Issuesへ\n再現手順もお願いします"
        replaceChecked(0x6d152, oldNotice.toByteArray(Charsets.UTF_16LE), newNotice.toByteArray(Charsets.UTF_16LE))
        val stamp = Files.getLastModifiedTime(lib.toPath())
        lib.writeBytes(bytes)
        if (Files.getLastModifiedTime(lib.toPath()) == stamp)
            Files.setLastModifiedTime(lib.toPath(), FileTime.fromMillis(stamp.toMillis() + 2000))
    }
}

@Suppress("unused")
val brandingPatch = resourcePatch(
    name = "futatabi branding",
    description = "Use the futatabi launcher and stats icons, rename the home title, and tailor the settings and feedback entry. Optional.",
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
        // The stock statistics page calls Image.asset with this exact path.
        val statsIcon = "assets/flutter_assets/assets/images/icon.png"
        val statsDestination = get(statsIcon)
        val statsSource = BrandingAssets::class.java.classLoader
            ?.getResourceAsStream("futatabi-branding/$statsIcon")
            ?: throw PatchException("futatabi: missing statistics icon")
        statsSource.use { source -> statsDestination.outputStream().use { source.copyTo(it) } }
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
            // The internal bridge home has no separate launcher registration.
        }
    }
}
