package util

import app.template.patches.steamlink.binary.SWAPCHAIN_FORMAT_OFFSETS_5002244
import app.template.patches.steamlink.binary.VIDEO_LIBRARY_SIZE_5002244
import app.template.patches.steamlink.binary.VIDEO_SHADER_SIZE
import app.template.patches.steamlink.binary.VideoOutputPrecision
import app.template.patches.steamlink.binary.findVideoShader
import app.template.patches.steamlink.binary.paddedVideoShader
import app.template.patches.steamlink.binary.setProjectionSwapchainFormat
import java.io.File
import java.security.MessageDigest

private const val STOCK_SHA256 =
    "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12"
private const val LIBRARY_PATH = "lib/arm64-v8a/libvrlink_scene.so"

fun main(args: Array<String>) {
    require(args.size == 2) { "Usage: VideoOutputAbGenerator <decoded-5002244> <new-output-root>" }
    val base = File(args[0]).canonicalFile
    val outputRoot = File(args[1]).canonicalFile
    require(base.isDirectory) { "Decoded base does not exist: $base" }
    require(!outputRoot.exists()) { "Refusing to overwrite existing A/B output: $outputRoot" }

    val metadata = File(base, "apktool.yml")
    require(metadata.isFile && metadata.readText().contains("versionCode: 5002244")) {
        "Decoded base is not Steam Link versionCode 5002244: $metadata"
    }
    val stockLibrary = File(base, LIBRARY_PATH).readBytes()
    require(stockLibrary.size == VIDEO_LIBRARY_SIZE_5002244) {
        "Unexpected stock library size=${stockLibrary.size}"
    }
    require(stockLibrary.sha256() == STOCK_SHA256) {
        "Unexpected stock library sha256=${stockLibrary.sha256()}"
    }
    val shaderOffset = findVideoShader(stockLibrary)

    val artifacts = VideoOutputPrecision.entries.map { precision ->
        val destination = File(outputRoot, precision.optionValue)
        require(base.copyRecursively(destination, overwrite = false)) {
            "Failed to copy decoded base to $destination"
        }
        val patched = stockLibrary.copyOf().apply {
            paddedVideoShader(1.06f, 1.12f, precision).copyInto(this, shaderOffset)
        }.let { setProjectionSwapchainFormat(it, precision) }
        verifyDiff(stockLibrary, patched, shaderOffset, precision)
        File(destination, LIBRARY_PATH).writeBytes(patched)
        Artifact(precision.optionValue, patched.sha256(), changedByteCount(stockLibrary, patched))
    }

    File(outputRoot, "manifest.txt").writeText(
        buildString {
            appendLine("base=$base")
            appendLine("baseLibrarySha256=$STOCK_SHA256")
            appendLine("baseLibrarySize=$VIDEO_LIBRARY_SIZE_5002244")
            appendLine("shaderOffset=0x${shaderOffset.toString(16)}")
            artifacts.forEach { artifact ->
                appendLine("${artifact.mode}.librarySha256=${artifact.sha256}")
                appendLine("${artifact.mode}.changedBytes=${artifact.changedBytes}")
            }
            appendLine("runtimeValidation=not-performed")
        },
    )
    println("Generated guarded A/B decoded trees at $outputRoot")
}

private data class Artifact(val mode: String, val sha256: String, val changedBytes: Int)

private fun verifyDiff(
    original: ByteArray,
    patched: ByteArray,
    shaderOffset: Int,
    precision: VideoOutputPrecision,
) {
    val shaderRange = shaderOffset until shaderOffset + VIDEO_SHADER_SIZE
    val swapchainRanges = SWAPCHAIN_FORMAT_OFFSETS_5002244.map { it until it + 4 }
    val unexpected = original.indices.filter { index ->
        original[index] != patched[index] &&
            index !in shaderRange &&
            (precision != VideoOutputPrecision.RGB10_A2_EXPERIMENTAL ||
                swapchainRanges.none { index in it })
    }
    require(unexpected.isEmpty()) {
        "Unexpected ${precision.optionValue} changes at " +
            unexpected.take(8).joinToString { "0x${it.toString(16)}" }
    }
    if (precision == VideoOutputPrecision.SRGB8_HIGHP) {
        SWAPCHAIN_FORMAT_OFFSETS_5002244.forEach { offset ->
            require(original.copyOfRange(offset, offset + 4).contentEquals(patched.copyOfRange(offset, offset + 4))) {
                "sRGB8 control changed swapchain instruction at 0x${offset.toString(16)}"
            }
        }
    } else {
        SWAPCHAIN_FORMAT_OFFSETS_5002244.forEach { offset ->
            require(!original.copyOfRange(offset, offset + 4).contentEquals(patched.copyOfRange(offset, offset + 4))) {
                "RGB10_A2 did not change swapchain instruction at 0x${offset.toString(16)}"
            }
        }
    }
}

private fun changedByteCount(left: ByteArray, right: ByteArray): Int =
    left.indices.count { left[it] != right[it] }

private fun ByteArray.sha256(): String =
    MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
