package app.morphe.patches.all.pairip.strip

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.indexOfPatternIn
import app.morphe.patches.shared.limitNBytes
import app.morphe.patches.shared.read
import app.morphe.util.toInt
import java.io.File
import java.io.InputStream
import java.io.RandomAccessFile
import java.util.function.Supplier

private val ASSET_FILE_MAGIC = byteArrayOf(0x00, 0x49, 0x41, 0x50)
private val DEX_FILE_MAGIC = byteArrayOf(0x64, 0x65, 0x78, 0x0a)

internal val restoreDexPatch =
    bytecodePatch {
        val vmAssets = mutableListOf<File>()

        dependsOn(
            rawResourcePatch {
                execute {
                    get("assets").listFiles()?.forEach { file ->
                        if (!file.isFile) return@forEach

                        file.inputStream().use { stream ->
                            val header = stream.readNBytes(ASSET_FILE_MAGIC.size)
                            if (!header.contentEquals(ASSET_FILE_MAGIC)) return@forEach
                            vmAssets.add(file)
                        }
                    }
                }

                finalize {
                    vmAssets.forEach(File::delete)
                }
            },
        )

        extendWithAll {
            vmAssets.mapNotNull(::restoreDex)
        }
    }

private fun restoreDex(vmAsset: File): Supplier<InputStream>? {
    RandomAccessFile(vmAsset, "r").use { raf ->
        val dexOffset = DEX_FILE_MAGIC.indexOfPatternIn(raf)
        if (dexOffset == -1L) return null

        val dexSizeOffset = dexOffset + 0x20
        val dexSize = raf.read(Int.SIZE_BYTES, dexSizeOffset).toInt(littleEndian = true)

        return Supplier {
            val stream = vmAsset.inputStream()
            stream.skipNBytes(dexOffset)
            return@Supplier stream.limitNBytes(dexSize)
        }
    }
}
