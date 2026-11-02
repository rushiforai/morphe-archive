package app.morphe.patches.shared

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patches.shared.extension.com.android.tools.smali.dexlib2.iface.isNotExtension
import app.morphe.util.ResourceGroup
import app.morphe.util.p0Register
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import java.io.FilterInputStream
import java.io.InputStream
import java.io.RandomAccessFile
import kotlin.experimental.and
import kotlin.math.max

fun isNotExtension(
    @Suppress("UNUSED_PARAMETER") method: Method,
    classDef: ClassDef,
) = classDef.isNotExtension()

fun Method.getRegisterName(register: Int): String {
    val firstParameterRegister = if (implementation != null) p0Register else 0

    return if (register >= firstParameterRegister) {
        "p${register - firstParameterRegister}"
    } else {
        "v$register"
    }
}

fun ByteArray.indexOfPatternIn(
    file: RandomAccessFile,
    mask: ByteArray = ByteArray(0),
): Long {
    val right = IntArray(256) { -1 }
    for ((i, element) in withIndex()) right[element.toInt().and(0xFF)] = i

    val bufferSize = 65536
    val buffer = ByteArray(bufferSize + size)

    var fileOffset = 0L
    val fileLength = file.length()

    while (fileOffset < fileLength) {
        file.seek(fileOffset)
        val bytesRead = file.read(buffer)

        if (bytesRead < size) break

        var skip: Int
        var i = 0
        while (i <= bytesRead - size) {
            skip = 0

            for (j in size - 1 downTo 0) {
                val maskByte = mask.getOrElse(j) { 0xFF.toByte() }
                if (this[j].and(maskByte) != buffer[i + j].and(maskByte)) {
                    skip = max(1, j - right[buffer[i + j].toInt().and(0xFF)])
                    break
                }
            }

            if (skip == 0) return fileOffset + i
            i += skip
        }

        fileOffset += (bytesRead - size + 1)
    }
    return -1L
}

fun RandomAccessFile.read(
    len: Int,
    off: Long = 0L,
): ByteArray {
    seek(off)
    val b = ByteArray(len)
    read(b)
    return b
}

fun InputStream.limitNBytes(n: Int): InputStream =
    object : FilterInputStream(this) {
        private var left = n

        override fun read(): Int = if (left <= 0) -1 else super.read().also { if (it >= 0) left -= it }

        override fun read(
            b: ByteArray,
            off: Int,
            len: Int,
        ): Int =
            if (left <= 0) {
                -1
            } else {
                super
                    .read(
                        b,
                        off,
                        minOf(len, left),
                    ).also { if (it >= 0) left -= it }
            }
    }

fun ResourcePatchContext.writeResources(
    vararg streams: InputStream,
    resourceGroup: ResourceGroup,
) {
    require(streams.size == resourceGroup.resources.size)
    val targetResourceDirectory = this["res", false]

    streams.zip(resourceGroup.resources).forEach { (stream, resource) ->
        val resourceGroupDirectory =
            targetResourceDirectory.resolve(resourceGroup.resourceDirectoryName)
        resourceGroupDirectory.mkdirs()

        resourceGroupDirectory.resolve(resource).outputStream().use(stream::copyTo)
    }
}
