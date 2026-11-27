package local.wazemaps

import app.morphe.patcher.patch.*
import java.nio.ByteBuffer

/** A bad optional image is omitted from both the runtime manifest and overrides. */
internal fun reportIconMismatch(original: ByteArray?, replacement: ByteArray?): String? {
    if (original == null) return "not present in this Waze version"
    if (replacement == null) return "replacement missing; keeping Waze artwork"
    fun size(bytes: ByteArray): Pair<Int, Int>? {
        val signature = byteArrayOf(-119, 80, 78, 71, 13, 10, 26, 10)
        if (bytes.size < 33 || !bytes.copyOfRange(0, 8).contentEquals(signature) ||
            String(bytes, 12, 4, Charsets.US_ASCII) != "IHDR" || ByteBuffer.wrap(bytes).getInt(8) != 13) return null
        val data = ByteBuffer.wrap(bytes)
        val width = data.getInt(16); val height = data.getInt(20)
        return if (width in 1..4096 && height in 1..4096) width to height else null
    }
    val source = size(original) ?: return "unrecognised Waze PNG; keeping Waze artwork"
    val target = size(replacement) ?: return "invalid replacement PNG; keeping Waze artwork"
    return if (source == target) null else "canvas mismatch: Waze ${source.first}x${source.second}, pack ${target.first}x${target.second}; keeping Waze artwork"
}

internal fun validateReportIconCoverage(paths: List<String>) {
    val originals = paths.filterNot { it.startsWith("morphe_") }
    val families = listOf("police", "camera", "accident", "hazard", "closure", "traffic")
        .count { family -> originals.any { family in it } }
    if (originals.size < 20 || families < 3)
        throw PatchException("Waze report artwork schema is not recognised: ${originals.size} compatible assets across $families report families")
}

private object ReportIconAssets

/** Shared resources are applied once, whichever public patches are selected. */
internal val reportIconAssets = rawResourcePatch {
    dependsOn(refreshWazeSkins)
    execute {
        fun resource(path: String) = ReportIconAssets::class.java.getResourceAsStream(path)
            ?: throw PatchException("Missing report icon resource: $path")
        val paths = resource("/iconpacks/alias-paths.txt").bufferedReader().use { it.readLines() }
            .filter(String::isNotEmpty)
        if (paths.isEmpty() || paths.distinct().size != paths.size)
            throw PatchException("Invalid sized icon manifest")
        for (path in paths) {
            if (path.contains("..") || path.contains('/') || path.contains('\\') || !path.endsWith(".png"))
                throw PatchException("Invalid sized icon path")
            val image = resource("/iconpacks/original_aliases/$path").use { it.readBytes() }
            val target = get("assets/res/skins/default/$path")
            target.parentFile.mkdirs()
            target.writeBytes(image)
        }
    }
}
