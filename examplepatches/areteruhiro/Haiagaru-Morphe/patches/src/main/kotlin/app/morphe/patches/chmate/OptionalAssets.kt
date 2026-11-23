package app.morphe.patches.chmate

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.IOException
import java.io.InputStream
import java.net.URI
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

/** Open the local ZIP selected by Morphe without passing its path through a shell. */
internal fun <T> withImageModerationArchive(selection: String, read: (ZipFile) -> T): T {
    val input = try {
        if (selection.startsWith("file:", ignoreCase = true)) File(URI.create(selection))
        else File(selection)
    } catch (_: IllegalArgumentException) {
        throw PatchException("画像検出ZIPの選択先を開けません。MorpheでZIPを選び直してください。")
    }
    if (!input.isFile || !input.canRead())
        throw PatchException("画像検出ZIPを読み取れません。Morpheのファイル選択からZIPを選び直してください。$OPTIONAL_ASSET_GUIDE")

    var staged: File? = null
    try {
        val zip = try {
            ZipFile(input)
        } catch (first: IOException) {
            // Some Android runtimes fail to open a non-ASCII path in the ZIP
            // reader even though the picker materialized a readable local file.
            if (input.path.all { it.code < 128 } || input.length() !in 1..(128L * 1024 * 1024)) throw first
            val temporary = File.createTempFile("haiagaru-image-", ".zip")
            staged = temporary
            val expected = input.length()
            input.inputStream().buffered().use { source ->
                temporary.outputStream().buffered().use { destination ->
                    val buffer = ByteArray(32 * 1024)
                    var remaining = expected
                    while (remaining > 0) {
                        val count = source.read(buffer, 0, minOf(buffer.size.toLong(), remaining).toInt())
                        if (count <= 0) throw IOException("ZIPのコピーが途中で終了しました")
                        destination.write(buffer, 0, count)
                        remaining -= count
                    }
                    if (source.read() != -1) throw IOException("ZIPのサイズが読み込み中に変わりました")
                }
            }
            ZipFile(temporary)
        }
        return zip.use(read)
    } catch (error: IOException) {
        throw PatchException("画像検出ZIPを開けません。ZIPを展開せず再選択してください。${error.message ?: ""} $OPTIONAL_ASSET_GUIDE")
    } finally {
        staged?.delete()
    }
}

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
