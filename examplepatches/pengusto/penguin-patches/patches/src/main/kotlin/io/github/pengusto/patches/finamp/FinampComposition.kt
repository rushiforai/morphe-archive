package io.github.pengusto.patches.finamp

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.InputStream
import java.nio.file.Files
import java.util.Properties

private const val FINAMP_PACKAGE = "com.unicornsonlsd.finamp"
private const val FINAMP_VERSION = "1.0.1"
private const val FINAMP_ABI = "arm64-v8a"
private const val FLUTTER_VERSION = "3.47.2"
private const val DART_VERSION = "3.13.2"
private const val BASE_SHA = "83de04b43bfcad7f1ae9aa69b433044f409d89957cccdc9deb6b6b0e85789607"
private const val ENGINE_SHA = "d70bbedc2b157630f90123a32ca894a6fa1816ec10cda9f335bada0692b376ee"
private const val LIBRARY_PATH = "lib/$FINAMP_ABI/libapp.so"
private const val ENGINE_PATH = "lib/$FINAMP_ABI/libflutter.so"
private const val RESOURCE_ROOT = "finamp/$FINAMP_VERSION"

/** Anchor resource lookup to the patch bundle's loader on both Desktop and Android. */
private object FinampBundle {
    fun open(path: String): InputStream = javaClass.getResourceAsStream("/$path")
        ?: throw PatchException("Finamp native patch: missing bundle resource $path")
}

internal fun ResourcePatchContext.applyFinampComposition(mask: Int) {
    nativeCheck(mask in 1..255, "invalid selection mask $mask")
    nativeCheck(packageMetadata.packageName == FINAMP_PACKAGE && packageMetadata.versionName == FINAMP_VERSION,
        "unsupported app; use the original official Finamp 1.0.1 APK")

    val nativeEntries = listApkEntries("lib/")
    nativeCheck(nativeEntries.size == nativeEntries.toSet().size, "duplicate native archive entries")
    nativeCheck(nativeEntries.all { path ->
        path.split('/').none { it == "." || it == ".." } && '\\' !in path
    }, "unsupported native archive path")
    nativeCheck(LIBRARY_PATH in nativeEntries && ENGINE_PATH in nativeEntries,
        "missing required ARM64 libapp.so or libflutter.so; only ARM64 output is verified")

    val library = get(LIBRARY_PATH)
    nativeCheck(library.isFile && library.length() in 1L..FinampDelta.MAX_LIBRARY_BYTES.toLong(),
        "ARM64 libapp.so is missing or outside the supported size bounds")
    val original = library.readBytes()
    nativeCheck(FinampDelta.sha256(original) == BASE_SHA,
        "unsupported or already patched ARM64 libapp.so; use the original official Finamp 1.0.1 APK")
    val engine = get(ENGINE_PATH)
    nativeCheck(engine.isFile && engine.inputStream().use(FinampDelta::sha256) == ENGINE_SHA,
        "unsupported ARM64 libflutter.so; use the original official Finamp 1.0.1 APK")

    val manifest = loadManifest()
    fun property(key: String): String = manifest.getProperty(key)?.trim()?.takeIf { it.isNotEmpty() }
        ?: throw PatchException("Finamp native patch: missing manifest property $key")
    nativeCheck(property("schema") == "1", "unsupported manifest schema")
    nativeCheck(property("package") == FINAMP_PACKAGE && property("version") == FINAMP_VERSION,
        "manifest does not target official Finamp 1.0.1")
    nativeCheck(property("flutter") == FLUTTER_VERSION && property("dart") == DART_VERSION,
        "manifest must use the verified Flutter $FLUTTER_VERSION / Dart $DART_VERSION toolchain")
    val prefix = "abi.$FINAMP_ABI"
    nativeCheck(property("$prefix.base.sha256") == BASE_SHA && property("$prefix.engine.sha256") == ENGINE_SHA,
        "manifest base or engine hash is unsupported")

    val selected = "$prefix.mask.$mask"
    val expectedHash = property("$selected.sha256")
    nativeCheck(expectedHash.matches(Regex("[0-9a-f]{64}")), "invalid manifest output SHA-256")
    val expectedSize = property("$selected.size").toLongOrNull()
    nativeCheck(expectedSize != null && expectedSize in 1L..FinampDelta.MAX_LIBRARY_BYTES.toLong(),
        "invalid manifest output size")
    val deltaResource = property("$selected.resource")
    nativeCheck(deltaResource == "$RESOURCE_ROOT/$FINAMP_ABI/$mask.pfd", "invalid manifest delta resource")

    val output = FinampBundle.open(deltaResource).use { FinampDelta.apply(original, it) }
    nativeCheck(output.size.toLong() == expectedSize && FinampDelta.sha256(output) == expectedHash,
        "composite delta output does not match manifest size/SHA-256 for mask $mask")

    // All identity, resource, decoder and output checks complete before modifying any APK content.
    val originalModified = Files.getLastModifiedTime(library.toPath())
    library.writeBytes(output)
    FinampNativeOutput.markWritten(library.toPath(), originalModified)
    nativeEntries.filter { !it.endsWith('/') && !it.startsWith("lib/$FINAMP_ABI/") }
        .forEach { delete(it) }
}

private fun loadManifest(): Properties {
    val bytes = FinampBundle.open("$RESOURCE_ROOT/manifest.properties").use { input ->
        val output = ByteArrayOutputStream()
        val buffer = ByteArray(4096)
        while (true) {
            val count = input.read(buffer)
            if (count < 0) break
            if (count == 0) {
                val single = input.read()
                if (single < 0) break
                nativeCheck(output.size() < 128 * 1024, "manifest exceeds 128 KiB")
                output.write(single)
            } else {
                nativeCheck(output.size() + count <= 128 * 1024, "manifest exceeds 128 KiB")
                output.write(buffer, 0, count)
            }
        }
        output.toByteArray()
    }
    return Properties().apply { ByteArrayInputStream(bytes).use { load(it) } }
}

private fun nativeCheck(condition: Boolean, message: String) {
    if (!condition) throw PatchException("Finamp native patch: $message")
}
