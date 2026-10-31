package app.morphe.patches.vk.misc

import app.morphe.patcher.apk.ApkUtils
import java.io.File
import java.net.URI
import java.nio.file.FileSystems
import java.nio.file.Files
import java.nio.file.StandardOpenOption

fun main() {
    val apkFile = listOf(
        File("vk-morphe-cloned.apk"),
        File("../vk-morphe-cloned.apk")
    ).first { it.exists() }.canonicalFile

    val keyStoreFile = listOf(
        File("patches/morphe.bks"),
        File("morphe.bks"),
        File("../patches/morphe.bks")
    ).first { it.exists() }.canonicalFile

    println("Target APK: ${apkFile.absolutePath}")
    println("Keystore:   ${keyStoreFile.absolutePath}")

    val iconBase = listOf(
        File("src/main/resources/zen_icons"),
        File("patches/src/main/resources/zen_icons"),
        File("../patches/src/main/resources/zen_icons")
    ).first { it.isDirectory }
    println("Icon Base:  ${iconBase.absolutePath}")

    val tempApk = File(apkFile.parentFile, "vk-temp-inject.apk")
    apkFile.copyTo(tempApk, overwrite = true)

    val uri = URI.create("jar:" + tempApk.toURI().toString())
    FileSystems.newFileSystem(uri, emptyMap<String, Any>()).use { fs ->
        iconBase.walk().filter { it.isFile }.forEach { file ->
            val relPath = file.relativeTo(iconBase).path.replace('\\', '/')
            val targetPath = fs.getPath(relPath)
            val parent = targetPath.parent
            if (parent != null) {
                Files.createDirectories(parent)
            }
            Files.write(targetPath, file.readBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING)
            println("Injected $relPath")
        }
    }

    println("Signing APK...")
    val keyStoreDetails = ApkUtils.KeyStoreDetails(
        keyStore = keyStoreFile,
        keyStorePassword = "morphekeystore",
        alias = "morphe",
        password = "morphekeystore",
    )

    ApkUtils.signApk(
        inputApkFile = tempApk,
        outputApkFile = apkFile,
        signer = "Morphe",
        keyStoreDetails = keyStoreDetails,
    )
    tempApk.delete()

    println("SUCCESS: Injected icons and signed ${apkFile.absolutePath} (${apkFile.length() / (1024 * 1024)} MB)")
}
