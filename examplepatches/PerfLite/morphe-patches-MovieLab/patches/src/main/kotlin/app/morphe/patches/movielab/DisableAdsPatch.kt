package app.morphe.patches.movielab

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import java.io.File

/**
 * Replaces all occurrences of a target byte sequence with replacement bytes of identical length.
 */
private fun replaceAll(file: File, target: ByteArray, replacement: ByteArray): Int {
    if (!file.exists()) return 0
    require(target.size == replacement.size) {
        "Target (${target.size}) and replacement (${replacement.size}) sizes must match"
    }
    val data = file.readBytes()
    var count = 0
    var i = 0
    val limit = data.size - target.size
    while (i <= limit) {
        var match = true
        for (j in target.indices) {
            if (data[i + j] != target[j]) {
                match = false
                break
            }
        }
        if (match) {
            System.arraycopy(replacement, 0, data, i, replacement.size)
            count++
            i += target.size
        } else {
            i++
        }
    }
    if (count > 0) {
        file.writeBytes(data)
    }
    return count
}

private val TARGET_ARCHITECTURES = listOf(
    "arm64-v8a",
    "armeabi-v7a",
    "x86_64",
)

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Отключение рекламы",
    description = "Удаление видео-прероллов VAST/VMAP, баннеров на паузе, нативных рекламных блоков и рекламных эндпоинтов.",
    default = true,
) {
    compatibleWith(MOVIELAB_COMPATIBILITY)

    execute {
        // Native ad endpoints and flags in libapp.so across all architectures
        val replacements = listOf(
            // 1. Native banner API endpoint (22 bytes): redirects to local dead port for instant connection failure
            "https://aj1907.online/".toByteArray(Charsets.US_ASCII) to "http://127.0.0.1:9999/".toByteArray(Charsets.US_ASCII),

            // 2. Fallback VAST/VMAP video preroll XML endpoint (27 bytes)
            "https://cvt-s2.agl007.site/".toByteArray(Charsets.US_ASCII) to "http://127.0.0.1:9999/null/".toByteArray(Charsets.US_ASCII),

            // 3. Ad configuration API endpoint (13 bytes): returns 404 from server, preventing ad inventory fetch
            "/ads_settings".toByteArray(Charsets.US_ASCII) to "/ads_disabled".toByteArray(Charsets.US_ASCII),

            // 4. Pause banner JSON key (18 bytes): disables pause banner parsing
            "pauseBannerEnabled".toByteArray(Charsets.US_ASCII) to "pauseBannerDisabld".toByteArray(Charsets.US_ASCII),
        )

        TARGET_ARCHITECTURES.forEach { arch ->
            val path = "lib/$arch/libapp.so"
            try {
                val libFile = resourceFile(path, true)
                if (libFile.exists()) {
                    replacements.forEach { (target, replacement) ->
                        replaceAll(libFile, target, replacement)
                    }
                }
            } catch (_: Exception) {
                // Ignore missing architecture if APK is split
            }
        }
    }
}
