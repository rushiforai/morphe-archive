package app.darkaxt.patches.thelonging

import app.morphe.patcher.patch.PatchException
import java.io.File

internal const val IL2CPP_LIB_PATH = "lib/arm64-v8a/libil2cpp.so"

internal fun findBytes(haystack: ByteArray, needle: ByteArray): Int {
    outer@ for (i in 0..(haystack.size - needle.size)) {
        for (j in needle.indices) {
            if (haystack[i + j] != needle[j]) continue@outer
        }
        return i
    }
    return -1
}

internal fun patchIl2CppFile(
    libFile: File,
    patchName: String,
    transform: (ByteArray) -> Unit,
) {
    if (!libFile.exists()) {
        throw PatchException("$IL2CPP_LIB_PATH not found in APK (arm64-v8a APK required for $patchName).")
    }

    val bytes = libFile.readBytes()
    transform(bytes)
    libFile.writeBytes(bytes)
}
