package app.morphe.patches.all.misc.hex

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.util.byteArrayOf
import java.io.RandomAccessFile
import kotlin.experimental.and
import kotlin.math.max

private fun String.getPattern() = replace('?', '0')

private fun String.getMaskPattern() = replace(Regex("[0-9a-fA-F]"), "f").getPattern()

fun maskedHexPatch(
    ignoreMissingTargetFiles: Boolean = false,
    ignoreMissingReplacements: Boolean = false,
    block: MaskedHexPatchBuilder.() -> Unit
) = rawResourcePatch {
    execute {
        MaskedHexPatchBuilder().apply(block).groupBy { it.targetFilePath }
            .forEach { (targetFilePath, replacements) ->
                val targetFile = get(targetFilePath, true)
                if (ignoreMissingTargetFiles && !targetFile.exists()) return@forEach

                RandomAccessFile(targetFile, "rw").use { raf ->
                    replacements.forEach { it.replacePattern(ignoreMissingReplacements, raf) }
                }
            }
    }
}

@Suppress("JavaDefaultMethodsNotOverriddenByDelegation")
class MaskedHexPatchBuilder internal constructor(
    private val replacements: MutableSet<MaskedReplacement> = mutableSetOf(),
) : Set<MaskedReplacement> by replacements {
    infix fun String.asPatternTo(replacementPattern: String) = Triple(
        byteArrayOf(getPattern()),
        byteArrayOf(getMaskPattern()),
        byteArrayOf(replacementPattern)
    )


    infix fun <T> Triple<T, T, T>.inFile(filePath: String) {
        when (first) {
            is String if second is String && third is String -> {
                val first = (first as String).getPattern()
                val second = (second as String).getMaskPattern()
                val third = third as String

                replacements += MaskedReplacement(
                    first.toByteArray(), second.toByteArray(), third.toByteArray(), filePath
                )
            }

            is ByteArray if second is ByteArray && third is ByteArray -> {
                val first = first as ByteArray
                val second = second as ByteArray
                val third = third as ByteArray

                replacements += MaskedReplacement(first, second, third, filePath)
            }

            else -> throw PatchException("Unsupported types for pattern, mask and replacement: $first, $second, $third")
        }
    }
}

@Suppress("CanBeParameter")
class MaskedReplacement(
    private val bytes: ByteArray,
    private val maskBytes: ByteArray = ByteArray(0),
    private val replacementBytes: ByteArray,
    internal val targetFilePath: String,
) {
    val maskBytesPadded = maskBytes + ByteArray(bytes.size - maskBytes.size) { 0xFF.toByte() }
    val replacementBytesPadded = replacementBytes + ByteArray(bytes.size - replacementBytes.size)

    fun replacePattern(ignoreMissingReplacements: Boolean = false, targetFile: RandomAccessFile) {
        val startIndex = indexOfPatternIn(targetFile)

        if (startIndex == -1L) {
            if (ignoreMissingReplacements) return
            throw PatchException(
                "Pattern and mask not found in target file: ${
                    bytes.joinToString(" ") { "%02x".format(it) }
                }, ${maskBytes.joinToString(" ") { "%02x".format(it) }}"
            )
        }

        targetFile.seek(startIndex)
        targetFile.write(replacementBytesPadded)
    }

    private fun indexOfPatternIn(file: RandomAccessFile): Long {
        val needle = bytes
        val right = IntArray(256) { -1 }

        for ((i, element) in needle.withIndex()) right[element.toInt().and(0xFF)] = i

        val bufferSize = 65536
        val buffer = ByteArray(bufferSize + needle.size)

        var fileOffset = 0L
        val fileLength = file.length()

        while (fileOffset < fileLength) {
            file.seek(fileOffset)
            val bytesRead = file.read(buffer)

            if (bytesRead < needle.size) break

            var skip: Int
            var i = 0
            while (i <= bytesRead - needle.size) {
                skip = 0

                for (j in needle.size - 1 downTo 0) {
                    if (needle[j].and(maskBytesPadded[j]) != buffer[i + j].and(maskBytesPadded[j])) {
                        skip = max(1, j - right[buffer[i + j].toInt().and(0xFF)])
                        break
                    }
                }

                if (skip == 0) return fileOffset + i
                i += skip
            }

            fileOffset += (bytesRead - needle.size + 1)
        }
        return -1L
    }
}