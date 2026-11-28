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
    dependsOn(arm64TargetGuard)
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
        // The snapshot uses fixed-width serialized strings. Keep their byte
        // lengths exactly unchanged; invisible padding is the existing title strategy.
        fun replaceText(at: Int, before: String, after: String) {
            if (after.length > before.length)
                throw PatchException("futatabi: text exceeds verified snapshot slot")
            replaceChecked(at, before.toByteArray(Charsets.UTF_16LE),
                after.padEnd(before.length, '\u200b').toByteArray(Charsets.UTF_16LE))
        }
        // Reuse a longer constant Text from the hidden beta-test page so
        // the notice can be polite without changing snapshot layout.
        replaceChecked(0x6d152, oldNotice.toByteArray(Charsets.UTF_16LE),
            oldNotice.toByteArray(Charsets.UTF_16LE))
        replaceText(0xeab66,
            "β版では、今後実装予定の新機能をいち早くお試しいただけます。テスト後に問題がなければ正式版としてリリースされます",
            "不具合のご報告やご要望はGitHub Issuesへ。\nお手数ですが、再現手順もあわせてお知らせください。")
        replaceChecked(0x8a9fb8, hex("707b409110ba40f9"), hex("706f409110f645f9"))
        replaceText(0xa2502, "ブラウザでGoogleアンケートを開く", "GitHub Issuesを開く")

        // The beta-test entry was removed from Settings above. Reuse its
        // otherwise unreachable constant Text widget, without adding a Dart
        // allocation or call site (which would need new GC stack metadata).
        // The stats column keeps its host version widget and platform label.
        val bundleVersion = BrandingAssets::class.java.classLoader
            ?.getResourceAsStream("futatabi-patch-version.txt")?.use { it.bufferedReader().readText().trim() }
            ?: throw PatchException("futatabi: missing bundle version resource")
        if (!Regex("[0-9]+\\.[0-9]+\\.[0-9]+(?:-[0-9A-Za-z.-]+)?").matches(bundleVersion))
            throw PatchException("futatabi: invalid bundle version")
        replaceText(0x80dea, "ふたったーでは、新機能の試用を目的としたベータテストを実施しています",
            "android\nパッチ：ふたたび $bundleVersion")
        // Replace the allocation of Text("android") by the constant Text
        // at PP+0x1bbe0. Store the object in the same local used by the column.
        replaceChecked(0x8f93a4,
            hex("48c0f597e30300aa60ff66f9a3031ef860b000b8a0035ff8603001b8"),
            hex("606f409100f045f9a0031ef81f2003d51f2003d51f2003d51f2003d5"))
        // The nineteenth palette entry is the legacy Futaba sentinel #800000.
        // Do not mutate that shared constant: other theme providers compare it.
        // Reuse the existing Context allocation call/return PC, frame and stack map:
        // only the final entry allocates a stock Color first, initializes its fields,
        // then returns to the same Context allocation with the tracked color local.
        // The existing selection callback and ARGB integer persistence are unchanged.
        val paletteStub = hex("210080d2b1835ef83f4e00f1e1000054703b4091109643f9b1835ff83f0210eb41000054410080d26fd8f8173f0800f1410000543392e71752e1ff1710f05ff8107e4cd3b14182d21f0211eb81020054609760fd70d775f9107002b801106e1e017000fc310280522102631e2118601e01f000fc511280522102631e2118601e017001fc311980522102631e2118601e01f001fca0831ff852d8f817e20300aa53d8f81710f0bf525f0010eb610000542259925222e2bf72f1378092060cfa17")
        val paletteAt = 0xaa67ec
        val elf = java.nio.ByteBuffer.wrap(bytes).order(java.nio.ByteOrder.LITTLE_ENDIAN)
        val rxSize = elf.getLong(0xd0)
        val recoveryEnd = 0x6869e4L
        val paddingStart = if (rxSize == recoveryEnd) paletteAt else 0x420000 + rxSize.toInt()
        if (rxSize !in setOf(0x686160L, recoveryEnd) || elf.getLong(0xd8) != rxSize ||
            bytes.copyOfRange(paddingStart, paletteAt + paletteStub.size).any { it != 0.toByte() })
            throw PatchException("futatabi: unsupported palette executable padding")
        replaceChecked(0x8dc9cc, hex("210080d2e7080794e20300aa"), hex("882707149227079495270714"))
        // Translate just the removed ARGB value when restoring mainColor, not
        // other colors or the preference format; stock constructor still runs.
        replaceChecked(0x9298bc, hex("f1378092"), hex("f5f30514"))
        // The original swatch shows futaba.svg only when its Color equals
        // the shared legacy #800000 sentinel. Keep the original SVG drawing,
        // but use the one-based palette position already saved at fp-0x18.
        replaceChecked(0x8dc9ec,
            hex("60f05ff8007c4cd3703b4091109643f9f00d00a9fe0300aabe7a7ef8c0033fd660052037"),
            hex("b1835ef83f4e00f1210600541f2003d51f2003d51f2003d51f2003d51f2003d51f2003d5"))
        paletteStub.copyInto(bytes, paletteAt)
        val paletteEnd = (paletteAt + paletteStub.size - 0x420000).toLong()
        elf.putLong(0xd0, maxOf(rxSize, paletteEnd))
        elf.putLong(0xd8, maxOf(rxSize, paletteEnd))

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
