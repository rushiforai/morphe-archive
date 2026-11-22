package app.morphe.patches.chmate

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.InputStream
import java.security.MessageDigest
import java.util.zip.ZipFile

internal const val OPTIONAL_ASSET_GUIDE = "https://github.com/areteruhiro/Haiagaru-Morphe/blob/dev/docs/optional-assets.md"
internal const val OPTIONAL_ASSET_EMOJI_URL = "https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/patches/src/main/resources/chmate/emoji/NotoColorEmoji.ttf"
internal const val OPTIONAL_ASSET_IMAGE_NG_URL = "https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/optional-assets/haiagaru-image-ng.zip"
internal const val OPTIONAL_ASSET_VPN_URL = "https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/vpn/image-stack/prebuilt/image-stack.aar"
internal const val OPTIONAL_ASSET_VPN_ZIP_URL = "https://github.com/areteruhiro/Haiagaru-Morphe/releases/latest/download/haiagaru-image-vpn-v2.zip"
internal const val OPTIONAL_ASSET_MODERATION_VPN_URL = "https://github.com/areteruhiro/Haiagaru-Morphe/releases/latest/download/haiagaru-image-moderation-vpn.zip"

internal val IMAGE_VPN_NOTICES = listOf("open-sstp/LICENSE", "image-stack/NOTICE.md") +
    listOf("go", "gvisor", "btree", "x-mobile", "x-sys", "x-time").map { "image-stack/$it/LICENSE" }

internal val IMAGE_VPN_BUNDLE_ENTRIES = setOf("vpn/VERSION.txt") +
    IMAGE_VPN_NOTICES.filter { it.startsWith("image-stack/") }.map { "vpn/licenses/$it" } +
    listOf("arm64-v8a", "armeabi-v7a", "x86", "x86_64").map { "vpn/jni/$it/libgojni.so" }

/** Read up to a bounded number of bytes using methods available before Android API 33. */
internal fun InputStream.readLimitedBytes(limit: Int): ByteArray {
    require(limit >= 0) { "limit must be non-negative" }
    val buffer = ByteArray(8 * 1024)
    val output = ByteArrayOutputStream(minOf(limit, buffer.size))
    var remaining = limit
    while (remaining > 0) {
        val count = read(buffer, 0, minOf(buffer.size, remaining))
        when {
            count < 0 -> break
            count == 0 -> {
                val next = read()
                if (next < 0) break
                output.write(next)
                remaining--
            }
            else -> {
                output.write(buffer, 0, count)
                remaining -= count
            }
        }
    }
    return output.toByteArray()
}

/** Read named entries without extracting archive paths onto disk. Verify before modifying the APK. */
internal fun optionalLibraries(path: String, names: Map<String, String>, library: String): Map<String, ByteArray> {
    val file = File(path)
    if (!file.isFile || !file.canRead()) throw PatchException("選択したファイルを読み込めません。Morpheで再選択してください: $path")
    try {
        return ZipFile(file).use { zip ->
            val isVpn = library == "libgojni.so"
            val asset = if (isVpn) "VPN入りのhaiagaru-image-moderation-vpn.zip、haiagaru-image-vpn-v2.zip、またはimage-stack.aar" else "191画像判定用のhaiagaru-image-ng.zip（または対応する226元APK）"
            val otherLibrary = if (isVpn) "libtensorflowlite_jni.so" else "libgojni.so"
            if (zip.entries().asSequence().none { !it.isDirectory && it.name.endsWith("/$library") } &&
                zip.entries().asSequence().any { !it.isDirectory && it.name.endsWith("/$otherLibrary") }) {
                throw PatchException("選択ファイルには必要な $library がありません。$asset を展開せず選択してください。$OPTIONAL_ASSET_GUIDE")
            }
            names.mapValues { (abi, expected) ->
                val candidates = zip.entries().asSequence().filter {
                    !it.isDirectory && (it.name == "$abi/$library" || it.name.endsWith("/$abi/$library"))
                }.toList()
                if (candidates.size != 1) throw PatchException("追加ファイルに必要なライブラリが不足または重複しています（$abi/$library）。$asset をダウンロードし直して、展開せず選択してください。$OPTIONAL_ASSET_GUIDE")
                val entry = candidates.single()
                if (entry.size !in 1..(32L * 1024 * 1024)) throw PatchException("ライブラリのサイズが不正です: $abi")
                val bytes = zip.getInputStream(entry).use { it.readLimitedBytes(entry.size.toInt() + 1) }
                val hash = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
                if (hash != expected) throw PatchException("対応するライブラリではありません。案内の配布ファイルを選択してください: $abi / $OPTIONAL_ASSET_GUIDE")
                bytes
            }
        }
    } catch (e: PatchException) { throw e }
    catch (e: Exception) { throw PatchException("追加ライブラリを読み込めません。ZIP/AAR/APKを展開せず選択してください: ${e.message}") }
}
