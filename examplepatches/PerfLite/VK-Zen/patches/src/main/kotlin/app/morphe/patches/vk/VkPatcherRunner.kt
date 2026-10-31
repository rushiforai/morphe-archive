package app.morphe.patches.vk

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkSigner
import app.morphe.patcher.apk.ApkUtils
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patches.vk.ad.clipsAdsPatch
import app.morphe.patches.vk.ad.feedAdsPatch
import app.morphe.patches.vk.ad.videoAdsPatch
import app.morphe.patches.vk.video.videoQualityPatch
import app.morphe.patches.vk.layout.navigationPatch
import app.morphe.patches.vk.misc.cloneAppPatch
import app.morphe.patches.vk.misc.nativePatch
import app.morphe.patches.vk.misc.pushNotificationsPatch
import app.morphe.patches.vk.misc.securityPatch
import app.morphe.patches.vk.misc.telemetryPatch
import app.morphe.patches.vk.misc.vpnDetectionPatch
import app.morphe.patches.vk.music.audioAdsPatch
import app.morphe.patches.vk.music.backgroundPlaybackPatch
import app.morphe.patches.vk.music.musicCachePatch
import kotlinx.coroutines.runBlocking
import java.io.File

fun main(args: Array<String>) {
    val inputApk = File(args.getOrNull(0) ?: "vk.apk").canonicalFile
    val outputApk = File(args.getOrNull(1) ?: "vk-morphe-cloned.apk").canonicalFile

    require(inputApk.exists()) { "Input APK not found: ${inputApk.absolutePath}" }

    println("==================================================")
    println("Morphe VK Patcher")
    println("Input APK:  ${inputApk.absolutePath} (${inputApk.length() / (1024 * 1024)} MB)")
    println("Output APK: ${outputApk.absolutePath}")
    println("==================================================")

    val tempWorkingDir = File("build/tmp/patcher-work").canonicalFile.apply {
        deleteRecursively()
        mkdirs()
    }

    val sourceApk = if (inputApk.name.endsWith(".apks", ignoreCase = true) || inputApk.name.endsWith(".xapk", ignoreCase = true)) {
        val merged = File(tempWorkingDir, "merged.apk")
        println("Input is APKS/XAPK bundle. Merging modules using ApkMerger...")
        val mergerLogger = object : app.morphe.patcher.logging.Logger() {
            override fun log(level: app.morphe.patcher.logging.LogLevel, message: String) {
                println("[ApkMerger $level] $message")
            }
        }
        app.morphe.patcher.apk.ApkMerger(mergerLogger).merge(inputApk, merged)
        println("Merged successfully: ${merged.length() / (1024 * 1024)} MB")
        val savedMerged = File(inputApk.parentFile, "VK_8.201_merged.apk")
        merged.copyTo(savedMerged, overwrite = true)
        println("Saved standalone merged APK to: ${savedMerged.absolutePath}")
        merged
    } else {
        inputApk
    }

    val tempApk = File(tempWorkingDir, "vk-temp.apk")
    println("Copying input APK to temporary working location...")
    sourceApk.copyTo(tempApk, overwrite = true)

    println("Preparing BKS keystore...")
    val keyStoreFile = File(if (File("patches").isDirectory) "patches/morphe.bks" else "morphe.bks").canonicalFile
    keyStoreFile.parentFile.mkdirs()

    val keyStore = if (keyStoreFile.exists()) {
        ApkSigner.readKeyStore(keyStoreFile.inputStream(), "morphekeystore")
    } else {
        println("Creating new persistent BKS keystore: ${keyStoreFile.absolutePath}")
        val pair = ApkSigner.newPrivateKeyCertificatePair("Morphe", java.util.Date(System.currentTimeMillis() + 100L * 365 * 24 * 3600 * 1000))
        val ks = ApkSigner.newKeyStore(setOf(ApkSigner.KeyStoreEntry("morphe", "morphekeystore", pair)))
        keyStoreFile.outputStream().use { ks.store(it, "morphekeystore".toCharArray()) }
        ks
    }

    val cert = keyStore.getCertificate("morphe") as java.security.cert.X509Certificate
    val sha1Digest = java.security.MessageDigest.getInstance("SHA-1").digest(cert.encoded)
    val sha1Hex = sha1Digest.joinToString("") { "%02x".format(it) }
    println("Using certificate SHA-1: $sha1Hex")

    val config = PatcherConfig(
        apkFile = tempApk,
        temporaryFilesPath = File(tempWorkingDir, "morphe-temp"),
        useBytecodeMode = BytecodeMode.STRIP_FAST,
    )

    val patcher = Patcher(config)
    try {
        println("Registering patches...")
        patcher += setOf(
            feedAdsPatch,
            clipsAdsPatch,
            videoAdsPatch,
            videoQualityPatch,
            navigationPatch,
            backgroundPlaybackPatch,
            audioAdsPatch,
            nativePatch,
            cloneAppPatch,
            securityPatch,
            pushNotificationsPatch,
            vpnDetectionPatch,
            musicCachePatch,
            telemetryPatch
        )

        println("Executing patches...")
        runBlocking {
            patcher().collect { result ->
                if (result.exception != null) {
                    System.err.println("FAILED: ${result.patch.name}")
                    result.exception?.printStackTrace()
                    throw result.exception!!
                } else {
                    println("SUCCESS: ${result.patch.name}")
                }
            }
        }

        println("Compiling patched resources and bytecode...")
        val patcherResult = patcher.get()

        println("Applying changes to APK...")
        patcherResult.applyTo(tempApk)

        println("Signing APK...")
        val keyStoreDetails = ApkUtils.KeyStoreDetails(
            keyStore = keyStoreFile,
            keyStorePassword = "morphekeystore",
            alias = "morphe",
            password = "morphekeystore",
        )

        ApkUtils.signApk(
            inputApkFile = tempApk,
            outputApkFile = outputApk,
            signer = "Morphe",
            keyStoreDetails = keyStoreDetails,
        )

        java.util.zip.ZipFile(outputApk).use { zf ->
            val arsc = zf.getEntry("resources.arsc")
            if (arsc != null) {
                println("Output resources.arsc method: ${arsc.method} (STORED = ${java.util.zip.ZipEntry.STORED})")
                check(arsc.method == java.util.zip.ZipEntry.STORED) {
                    "resources.arsc MUST be STORED (uncompressed) for Android 11+ compatibility!"
                }
            }
        }

        println("==================================================")
        println("Patching completed successfully!")
        println("Saved to: ${outputApk.absolutePath} (${outputApk.length() / (1024 * 1024)} MB)")
        println("==================================================")
    } finally {
        patcher.close()
        tempWorkingDir.deleteRecursively()
    }
}

