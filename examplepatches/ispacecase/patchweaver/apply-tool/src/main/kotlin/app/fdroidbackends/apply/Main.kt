package app.fdroidbackends.apply

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.apksig.ApkSigner
import com.android.tools.build.apkzlib.zip.ZFile
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.KeyStore
import java.security.cert.X509Certificate
import kotlin.system.exitProcess

/**
 * Usage: apply-tool <input.apk> <patches.mpp> <output.apk> <keystore> <ks-pass> <key-alias> <key-pass>
 */
fun main(args: Array<String>) {
    if (args.size != 7) {
        System.err.println(
            "Usage: apply-tool <input.apk> <patches.mpp> <output.apk> <keystore> <ks-pass> <key-alias> <key-pass>",
        )
        exitProcess(1)
    }
    val inputApkPath = args[0]
    val mppPath = args[1]
    val outputApkPath = args[2]
    val keystorePath = args[3]
    val ksPass = args[4]
    val keyAlias = args[5]
    val keyPass = args[6]

    val inputApk = File(inputApkPath)
    val workDir = File("apply-tool-workspace").also { it.deleteRecursively(); it.mkdirs() }
    val unsignedApk = File(workDir, "unsigned.apk")

    println("Loading patches from $mppPath")
    val patches = loadPatchesFromJar(setOf(File(mppPath)))
    println("Loaded ${patches.size} top-level patch(es): ${patches.joinToString { it.name ?: "?" }}")

    val config = PatcherConfig(apkFile = inputApk, temporaryFilesPath = File(workDir, "patcher-temp"))
    val patcher = Patcher(config)
    patcher += patches

    var failed = false
    runBlocking {
        patcher().collect { result ->
            val exception = result.exception
            if (exception != null) {
                failed = true
                System.err.println("FAILED: ${result.patch.name}")
                exception.printStackTrace()
            } else {
                println("OK: ${result.patch.name}")
            }
        }
    }

    if (failed) {
        System.err.println("One or more patches failed. Aborting.")
        exitProcess(1)
    }

    println("Compiling patched APK pieces...")
    val result = patcher.get()
    patcher.close()

    println("Assembling unsigned APK at $unsignedApk")
    assembleApk(inputApk, unsignedApk, result)

    println("Signing APK to $outputApkPath")
    signApk(unsignedApk, File(outputApkPath), File(keystorePath), ksPass, keyAlias, keyPass)

    println("Done: $outputApkPath")
}

private fun assembleApk(
    inputApk: File,
    outputApk: File,
    result: app.morphe.patcher.PatcherResult,
) {
    val resourcesApk = result.resources.resourcesApk
    val otherResources = result.resources.otherResources
    val deleteResources = result.resources.deleteResources
    val dexNames = result.dexFiles.map { it.name }.toSet()

    val resourcesApkEntryNames: Set<String> = resourcesApk?.let { file ->
        ZFile.openReadOnly(file).use { z -> z.entries().map { it.centralDirectoryHeader.name }.toSet() }
    } ?: emptySet()

    val otherResourceRelativePaths: Set<String> = otherResources?.let { dir ->
        dir.walkTopDown().filter { it.isFile }.map { it.relativeTo(dir).path.replace(File.separatorChar, '/') }.toSet()
    } ?: emptySet()

    val excludedFromOriginal = dexNames + resourcesApkEntryNames + deleteResources + otherResourceRelativePaths +
        setOf("META-INF/MANIFEST.MF")

    outputApk.parentFile?.mkdirs()
    ZFile.openReadWrite(outputApk).use { out ->
        // 1. Copy everything from the original APK, except what's about to be replaced (dex,
        //    anything the compiled resources.apk itself supplies, deleted resources, files the
        //    resource patches wrote directly, and the old v1 signature manifest).
        ZFile.openReadOnly(inputApk).use { original ->
            val ignore = com.google.common.base.Predicate<String> { name ->
                name in excludedFromOriginal ||
                    (name.startsWith("META-INF/") && (name.endsWith(".SF") || name.endsWith(".RSA") || name.endsWith(".DSA") || name.endsWith(".EC")))
            }
            out.mergeFrom(original, ignore)
        }

        // 2. Overlay the compiled resources.apk (AndroidManifest.xml, resources.arsc, res/*).
        if (resourcesApk != null) {
            ZFile.openReadOnly(resourcesApk).use { res ->
                out.mergeFrom(res, com.google.common.base.Predicate<String> { false })
            }
        }

        // 3. Add/overwrite any other resource files the resource patches wrote directly.
        otherResources?.walkTopDown()?.filter { it.isFile }?.forEach { file ->
            val relativePath = file.relativeTo(otherResources).path.replace(File.separatorChar, '/')
            file.inputStream().use { out.add(relativePath, it) }
        }

        // 4. Add the patched dex files.
        result.dexFiles.forEach { dex ->
            dex.stream.use { out.add(dex.name, it) }
        }
    }
}

private fun signApk(
    unsignedApk: File,
    outputApk: File,
    keystoreFile: File,
    ksPass: String,
    keyAlias: String,
    keyPass: String,
) {
    val keyStore = KeyStore.getInstance("JKS")
    keystoreFile.inputStream().use { keyStore.load(it, ksPass.toCharArray()) }

    val privateKey = keyStore.getKey(keyAlias, keyPass.toCharArray()) as java.security.PrivateKey
    val certChain = keyStore.getCertificateChain(keyAlias).map { it as X509Certificate }

    val signerConfig = ApkSigner.SignerConfig.Builder("fdroidbackends", privateKey, certChain).build()

    outputApk.parentFile?.mkdirs()
    ApkSigner.Builder(listOf(signerConfig))
        .setInputApk(unsignedApk)
        .setOutputApk(outputApk)
        .setV1SigningEnabled(true)
        .setV2SigningEnabled(true)
        .setV3SigningEnabled(true)
        .setMinSdkVersion(26)
        .build()
        .sign()
}
