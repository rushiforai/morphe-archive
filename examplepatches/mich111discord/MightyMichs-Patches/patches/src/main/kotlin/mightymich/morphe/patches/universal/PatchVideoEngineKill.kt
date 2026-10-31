package mightymich.morphe.patches.com.camerasideas.instashot

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private fun bytesOf(vararg values: Int): ByteArray =
    ByteArray(values.size) { values[it].toByte() }

private data class NativeKillSite(
    val abiFolder: String,
    val pattern: ByteArray,
    val patchOffset: Int,
    val patchBytes: ByteArray,
)

private val killSites = listOf(
    NativeKillSite(
        abiFolder = "arm64-v8a",
        pattern = bytesOf(
            0x54, 0x00, 0x00, 0x36,
            0x80, 0x00, 0x00, 0x37,
            0xb3, 0x27, 0x01, 0x94,
            0x21, 0x01, 0x80, 0x52,
            0xb5, 0x27, 0x01, 0x94,
        ),
        patchOffset = 16,
        patchBytes = bytesOf(0x1f, 0x20, 0x03, 0xd5),
    ),
    NativeKillSite(
        abiFolder = "armeabi-v7a",
        pattern = bytesOf(
            0x28, 0x46,
            0x21, 0x46,
            0x01, 0xf0, 0x21, 0xf9,
            0x00, 0x2e,
            0x18, 0xbf,
            0x00, 0x28,
            0x04, 0xd1,
            0x32, 0xf0, 0xfa, 0xeb,
            0x09, 0x21,
            0x32, 0xf0, 0xfe, 0xeb,
        ),
        patchOffset = 14,
        patchBytes = bytesOf(0x04, 0xe0),
    ),
)

@Suppress("unused")
val patchVideoEngineKillPatch = rawResourcePatch(
    name = "Fix video engine on re-sign",
    description = "Stops the bundled video engine library from terminating the process "",
    default = true
) {
    compatibleWith(InShotCompatibility.INSHOT)

    execute {
        var changed = false

        for (site in killSites) {
            val path = "lib/${site.abiFolder}/libisvideoengine.so"
            val file = get(path)
            if (!file.exists()) continue

            val data = file.readBytes()
            val at = data.indexOfUnique(site.pattern)
                ?: throw PatchException(
                    "Could not locate the process-exit sequence inside $path. " +
                        "This pattern matches known 2.214.x builds; a newer engine " +
                        "binary may need an updated scan."
                )

            site.patchBytes.copyInto(data, at + site.patchOffset)
            file.writeBytes(data)
            changed = true
        }

        if (!changed) {
            throw PatchException(
                "libisvideoengine.so is missing for every supported ABI. " +
                    "Patch a multi-arch / universal InShot APK instead of a stripped split."
            )
        }
    }
}

private fun ByteArray.indexOfUnique(needle: ByteArray): Int? {
    var hit: Int? = null
    val limit = size - needle.size
    outer@ for (i in 0..limit) {
        for (j in needle.indices) {
            if (this[i + j] != needle[j]) continue@outer
        }
        if (hit != null) {
            throw PatchException(
                "Process-exit sequence matched more than once in libisvideoengine.so; refusing to patch."
            )
        }
        hit = i
    }
    return hit
}
