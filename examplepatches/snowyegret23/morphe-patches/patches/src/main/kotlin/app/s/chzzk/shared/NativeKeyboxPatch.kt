package app.s.chzzk.shared

import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest

private data class KeyboxLibrary(val sha256: String, val offset: Int, val returnTrue: ByteArray)

internal val nativeKeyboxPatch = resourcePatch {
    execute {
        if (packageMetadata.versionName != "3.16.0") return@execute
        val libraries = mapOf(
            "arm64-v8a" to KeyboxLibrary(
                "8ba589b0409164e0e89fa27d285e73a3e0f2b410a164d925fdbc7482af56543c", 0x111c,
                byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte()),
            ),
            "armeabi-v7a" to KeyboxLibrary(
                "2da826817b2c5d722ee08351f3e2feffdd06440b4b4e3eaa699c71d2e8aa4c1e", 0x940,
                byteArrayOf(0x01, 0x20, 0x70, 0x47),
            ),
            "x86" to KeyboxLibrary(
                "af710119f0e139bc193f990d0aabe728c5c95a9fcab7cc60472910099d655635", 0xd10,
                byteArrayOf(0xb8.toByte(), 0x01, 0x00, 0x00, 0x00, 0xc3.toByte()),
            ),
            "x86_64" to KeyboxLibrary(
                "0119c56c01d09dfb856cf0e3af91e7ea9ef362cd903302607d0234c62b483a58", 0xfd0,
                byteArrayOf(0xb8.toByte(), 0x01, 0x00, 0x00, 0x00, 0xc3.toByte()),
            ),
        )
        val entries = listApkEntries("lib/").filter { it.endsWith("/libczz_keybox.so") }
        check(entries.isNotEmpty()) { "CHZZK native keybox library was not found" }
        for (entry in entries) {
            val abi = entry.split('/')[1]
            val expected = checkNotNull(libraries[abi]) { "Unsupported CHZZK keybox ABI: $abi" }
            val file = get(entry)
            val bytes = file.readBytes()
            val digest = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
            check(digest == expected.sha256) { "CHZZK keybox library changed: $abi" }
            // JNI_OnLoad gates key access on checkFingerprints; patched APKs use a different signing key.
            expected.returnTrue.copyInto(bytes, expected.offset)
            file.writeBytes(bytes)
        }
    }
}
