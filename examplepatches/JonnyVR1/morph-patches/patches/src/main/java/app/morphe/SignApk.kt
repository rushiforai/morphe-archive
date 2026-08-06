package app.morphe

import app.morphe.patcher.apk.ApkUtils
import java.io.File

/**
 * Signs an APK without applying any patches.
 * Useful for preparing base APKs for use with Morphe Manager.
 *
 * Usage: SignApk <input-apk> <output-apk>
 */
fun main(args: Array<String>) {
    require(args.size >= 2) {
        "Usage: SignApk <input-apk> <output-apk>"
    }

    val inputApk = File(args[0])
    val outputApk = File(args[1])

    require(inputApk.exists()) { "Input APK not found: ${inputApk.absolutePath}" }

    val tempDir = File(System.getProperty("java.io.tmpdir"), "morphe-signer-${System.currentTimeMillis()}")
    tempDir.mkdirs()

    try {
        val keystoreFile = File(tempDir, "morphe.keystore")
        ApkUtils.signApk(
            inputApk,
            outputApk,
            "v3",
            ApkUtils.KeyStoreDetails(
                keystoreFile,
                "Morphe",
                "Morphe",
                "",
            )
        )
        println("Signed APK: ${outputApk.absolutePath}")
    } finally {
        tempDir.deleteRecursively()
    }
}
