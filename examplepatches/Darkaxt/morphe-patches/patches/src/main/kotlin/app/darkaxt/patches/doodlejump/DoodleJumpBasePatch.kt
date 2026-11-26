package app.darkaxt.patches.doodlejump

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import java.io.File

internal const val DJ_LIB_PATH = "lib/arm64-v8a/libDoodleJump.so"
internal const val DJ_ORIG_LIB_PATH = "lib/arm64-v8a/libDoodleJump_orig.so"
private const val BUNDLED_MOD_RESOURCE = "doodlejump/arm64-v8a/libDoodleJump.so"
private val CFG_MAGIC = "DJMODCFG".toByteArray(Charsets.US_ASCII)

internal const val FLAG_OFFSET_ENDLESS_FALL = 8
internal const val FLAG_OFFSET_FOLDABLE_VIEW = 12

internal fun findConfigMagicOffset(bytes: ByteArray): Int {
    outer@ for (i in 0..(bytes.size - CFG_MAGIC.size - 8)) {
        for (j in CFG_MAGIC.indices) {
            if (bytes[i + j] != CFG_MAGIC[j]) continue@outer
        }
        return i
    }
    return -1
}

internal fun setModFeatureFlag(libFile: File, flagOffset: Int, enabled: Boolean) {
    val bytes = libFile.readBytes()
    val magicIdx = findConfigMagicOffset(bytes)
    if (magicIdx < 0) {
        throw PatchException("DJMODCFG header not found in $DJ_LIB_PATH.")
    }
    val off = magicIdx + flagOffset
    val value = if (enabled) 1 else 0
    bytes[off] = (value and 0xFF).toByte()
    bytes[off + 1] = ((value ushr 8) and 0xFF).toByte()
    bytes[off + 2] = ((value ushr 16) and 0xFF).toByte()
    bytes[off + 3] = ((value ushr 24) and 0xFF).toByte()
    libFile.writeBytes(bytes)
}

private object DoodleJumpResourceAnchor

/**
 * Shared internal patch that backs up libDoodleJump.so -> libDoodleJump_orig.so
 * and installs our native proxy library with all feature flags initially disabled
 * so each user-facing patch can enable only its own feature independently.
 */
internal val doodleJumpNativeBasePatch = patch {
    execute {
        val targetLib = resourceFile(DJ_LIB_PATH)
        if (!targetLib.exists()) {
            throw PatchException("$DJ_LIB_PATH not found in APK (arm64-v8a APK required).")
        }

        val origLib = resourceFile(DJ_ORIG_LIB_PATH, copy = false)
        origLib.parentFile?.mkdirs()
        targetLib.copyTo(origLib, overwrite = true)

        val modStream = DoodleJumpResourceAnchor::class.java.classLoader
            ?.getResourceAsStream(BUNDLED_MOD_RESOURCE)
            ?: DoodleJumpResourceAnchor::class.java.getResourceAsStream("/$BUNDLED_MOD_RESOURCE")
            ?: throw PatchException("Bundled mod library $BUNDLED_MOD_RESOURCE not found.")

        val modBytes = modStream.use { it.readBytes() }
        val magicIdx = findConfigMagicOffset(modBytes)
        if (magicIdx < 0) {
            throw PatchException("DJMODCFG header not found in bundled $BUNDLED_MOD_RESOURCE.")
        }
        // Clear both feature flags to 0; dependent user-facing patches flip theirs to 1.
        for (i in 8 until 16) {
            modBytes[magicIdx + i] = 0
        }
        targetLib.writeBytes(modBytes)

        // Newly added .so files (libDoodleJump_orig.so) are compressed by Morphe's APK writer,
        // so enable extractNativeLibs to prevent INSTALL_FAILED_INVALID_APK (res=-2).
        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.root.children("application").firstOrNull()
                ?: throw PatchException("No <application> element found in AndroidManifest.xml.")
            app.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
