package patches.npostarttv

import app.morphe.patcher.patch.ResourcePatchContext
import java.security.MessageDigest

// Both inspected TV and phone builds ship the same complete PairIP image per ABI.
private val pairipImages = mapOf(
    "armeabi-v7a" to "bac92c75db71dbb9a6fc9bfb6efd72a25c8aa534e4a6b3add2aeda6f3af31518",
    "arm64-v8a" to "c6c35d7f628745632c2038ab7930d0ab50c8edf3f85962e18ab8f5466bde82a8",
    "x86" to "86d13eab346c3e7fce4956c4a51eedb9f3d7fb088eba5cba5990d52d5d7f1e35",
    "x86_64" to "ba0b1c126977398d29b9ce07635e8872e3ab8c1dd61880c673eebdb8b9468d8a",
)
private const val completeInput = "Select the complete original APKS including its native ABI splits; base.apk alone is incomplete. Required libpairipcore.so"

/** Protected callbacks still load PairIP; startup restoration does not replace its native library. */
internal fun ResourcePatchContext.requirePairipLibraries() {
    // Query the archive, not the workspace: native resources can still be unextracted.
    val entries = listApkEntries("lib/").toSet()
    val abis = entries.filter { it.endsWith(".so") }
        .map { it.removePrefix("lib/").substringBefore('/') }.toSet()
    check(abis.isNotEmpty() && abis.all { it in pairipImages }) { "$completeInput is missing or has an unsupported ABI" }
    for (abi in abis) {
        val path = "lib/$abi/libpairipcore.so"
        check(path in entries) { "$completeInput is missing for $abi" }
        // Request each exact file so the SDK extracts lazy resources before reading.
        val digest = MessageDigest.getInstance("SHA-256").digest(get(path).readBytes())
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
        check(digest == pairipImages.getValue(abi)) { "$completeInput is not the inspected complete $abi native library" }
    }
}
