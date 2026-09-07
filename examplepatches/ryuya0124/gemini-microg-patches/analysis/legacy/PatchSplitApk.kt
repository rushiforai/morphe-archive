package scratch

import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import app.morphe.patcher.apk.ApkSigner
import java.io.File
import java.io.FileInputStream

/**
 * split_config.xxhdpi.apk のパッケージ名を morphe 向けに変更し、
 * morphe-desktop に内蔵された BouncyCastle (BKS) キーストアで署名する。
 */
@Suppress("UNCHECKED_CAST")
fun main() {
    val inputFile       = File("com.google.android.googlequicksearchbox_17.54.18.ve.arm64-301800642_1dpi_119f2a51a8433088ecd247743b151418_apkmirror.com/split_config.xxhdpi.apk")
    val outputUnsigned  = File("split_config.xxhdpi_morphe_unsigned.apk")
    val outputSigned    = File("split_config.xxhdpi_morphe.apk")
    val keystoreFile    = File("morphe-data/morphe.keystore")

    // --- パッケージ名書き換え ---
    println("Loading APK: ${inputFile.absolutePath}")
    val apkModule = ApkModule.loadApkFile(inputFile)
    val manifest: AndroidManifestBlock = apkModule.androidManifest
    println("Original packageName: ${manifest.packageName}")

    val manifestElem = manifest.manifestElement ?: error("manifest element not found")
    val pkgAttr = manifestElem.searchAttributeByName("package")
        ?: error("package attribute not found")
    pkgAttr.setValueAsString("com.google.android.googlequicksearchbox.morphe")
    println("New packageName: ${manifest.packageName}")

    println("Writing unsigned APK...")
    apkModule.writeApk(outputUnsigned)
    apkModule.close()
    println("Unsigned size: ${outputUnsigned.length()} bytes")

    // --- BKS キーストアで署名（morphe-desktop 内蔵 BouncyCastle 使用）---
    println("Reading BKS keystore: ${keystoreFile.absolutePath}")
    val apkSignerInstance: ApkSigner = ApkSigner::class.java
        .getDeclaredField("INSTANCE")
        .also { it.isAccessible = true }
        .get(null) as ApkSigner

    val keyStore = FileInputStream(keystoreFile).use { stream: FileInputStream ->
        apkSignerInstance.readKeyStore(stream, null)
    }
    println("Keystore loaded. Aliases: ${keyStore.aliases().toList()}")

    val keyPair = apkSignerInstance.readPrivateKeyCertificatePair(keyStore, "Morphe", "Morphe")
    val signer  = apkSignerInstance.newApkSigner("Morphe", keyPair)

    println("Signing APK...")
    signer.signApk(outputUnsigned, outputSigned)
    println("Signed! Size: ${outputSigned.length()} bytes")
    println("Output: ${outputSigned.absolutePath}")
}
