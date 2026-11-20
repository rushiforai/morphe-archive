package deezer.patches

import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.resourceFile
import java.io.ByteArrayInputStream
import java.io.DataInputStream
import java.security.MessageDigest
import java.util.Base64
import java.util.zip.GZIPInputStream

private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256")
    .digest(this).joinToString("") { "%02x".format(it.toInt() and 0xff) }

internal fun restoreStartupNativeLibraries() {
    val entries = listApkEntries("lib/").toSet()
    val restores = nativeStartupRestores()
    val supportedPaths = restores.map { it.path }.toSet()
    val protectedLibraries = entries.filter { path ->
        listOf("/libflacJNI.so", "/libquickjs.so", "/libACRCloudUniversalEngine.so").any(path::endsWith)
    }
    check(protectedLibraries.isNotEmpty() && supportedPaths.containsAll(protectedLibraries)) {
        "Unsupported native architecture in the supplied app archive"
    }
    var restored = 0
    for (restore in restores) {
        if (restore.path !in entries) continue
        val file = resourceFile(restore.path)
        val input = file.readBytes()
        check(input.sha256() == restore.inputHash) { "Unexpected native library: ${restore.path}" }
        val output = input.copyOf(restore.outputSize)
        DataInputStream(GZIPInputStream(ByteArrayInputStream(Base64.getDecoder().decode(restore.delta)))).use { delta ->
            val count = delta.readInt()
            check(count in 1..100_000)
            repeat(count) {
                val offset = delta.readInt()
                val length = delta.readInt()
                check(offset >= 0 && length > 0 && offset <= output.size - length)
                delta.readFully(output, offset, length)
            }
            check(delta.read() == -1)
        }
        check(output.sha256() == restore.outputHash) { "Native restoration failed: ${restore.path}" }
        file.writeBytes(output)
        restored++
    }
    check(restored > 0) { "Missing supported native libraries" }
}
