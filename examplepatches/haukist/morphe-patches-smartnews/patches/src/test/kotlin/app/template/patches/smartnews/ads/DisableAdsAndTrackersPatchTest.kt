package app.template.patches.smartnews.ads

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkMerger
import app.morphe.patcher.apk.ApkUtils
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream
import kotlin.test.Test
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

class DisableAdsAndTrackersPatchTest {
    @Test
    fun `patch SmartNews apks and generate standalone and apks bundles`() = runBlocking {
        val apksFile = File("../../SmartNews_26.10.30.apks")
        if (!apksFile.exists()) {
            println("Skipping E2E APK patch test: Target APKS does not exist at ${apksFile.absolutePath} (CI / build-only environment)")
            return@runBlocking
        }

        val outputDir = File("../../")
        val mergedApk = File("build/tmp/SmartNews_merged.apk")
        val standalonePatchedApk = File(outputDir, "SmartNews-26.10.30-standalone-patched.apk")
        val patchedApksFile = File(outputDir, "SmartNews-26.10.30-patched.apks")
        val customMapsKey = getCustomMapsApiKey()

        // 1. Merge SmartNews_26.10.30.apks into a single standalone APK using ApkMerger
        println("Merging SmartNews_26.10.30.apks into standalone APK...")
        ApkMerger().merge(
            inputFile = apksFile,
            outputFile = mergedApk,
            validateModules = true,
            validateResDir = true,
        )
        assertTrue(mergedApk.exists(), "Merged APK must be generated")
        println("Merged standalone APK generated successfully! Size: ${mergedApk.length()} bytes")

        // 2. Load Morphe patches
        val mppFiles = File("build/libs").listFiles { file ->
            file.name.endsWith(".mpp") && !file.name.contains("sources") && !file.name.contains("javadoc")
        }?.toSet() ?: emptySet()
        assertTrue(mppFiles.isNotEmpty(), "Built .mpp patch bundle must exist in build/libs")

        val patches = loadPatchesFromJar(mppFiles)
        assertTrue(patches.isNotEmpty(), "Loaded patches must not be empty")
        println("Loaded patches: ${patches.map { "${it.name} (default=${it.default})" }}")

        // 3. Patch the merged standalone APK
        println("Patching standalone APK with Disable ads and trackers...")
        val tempDir = File("build/tmp/patcher-merged-test")
        val config = PatcherConfig(
            apkFile = mergedApk,
            temporaryFilesPath = tempDir,
            targetPatcherVersion = "2.0.0",
            validate = true,
        )

        val keyStore = File("build/tmp/morphe-test.keystore")
        val keyStoreDetails = ApkUtils.KeyStoreDetails(
            keyStore = keyStore,
            alias = "morphe",
            password = "password",
            keyStorePassword = "password",
        )

        Patcher(config).use { patcher ->
            patcher += patches
            val results = patcher().toList()
            assertTrue(results.isNotEmpty(), "Patch execution must produce results")
            results.forEach { result ->
                println("Executed patch: '${result.patch.name}', success: ${result.exception == null}")
                if (result.exception != null) {
                    result.exception!!.printStackTrace()
                }
                assertNull(result.exception, "Patch '${result.patch.name}' failed: ${result.exception?.stackTraceToString()}")
            }

            val patcherResult = patcher.get()
            assertTrue(patcherResult.dexFiles.isNotEmpty(), "Patched DEX files must be produced")
            println("Successfully patched bytecode! Applying to standalone APK...")

            // Copy merged APK to final standalone destination
            mergedApk.copyTo(standalonePatchedApk, overwrite = true)
            patcherResult.applyTo(standalonePatchedApk)

            // Inject custom Google Maps API key from .env if configured
            if (customMapsKey != null) {
                println("Found custom Google Maps API key in .env: ${customMapsKey.take(10)}... (length: ${customMapsKey.length})")
                replaceMapsKeyInApk(standalonePatchedApk, customMapsKey)
            } else {
                println("No custom Google Maps API key found in .env (or unset). Keeping default key.")
            }

            // Sign the standalone APK
            ApkUtils.signApk(
                inputApkFile = standalonePatchedApk,
                outputApkFile = standalonePatchedApk,
                signer = "Morphe",
                keyStoreDetails = keyStoreDetails,
                minSdkVersion = 32,
            )
            println("Signed standalone APK successfully! Final size: ${standalonePatchedApk.length()} bytes")

            val certs = ApkUtils.verifiedSigningCertificates(standalonePatchedApk, 32)
            assertNotNull(certs, "Standalone APK signature verification failed")
            assertTrue(certs.isNotEmpty(), "Standalone APK certificate list was empty")
            println("Standalone APK signature verified successfully with ${certs.size} certificate(s).")
        }

        // 4. Generate patched .apks bundle with all split APKs resigned
        println("Generating patched .apks bundle...")
        val splitsDir = File("build/tmp/apks_splits").apply { mkdirs() }
        val rawBaseApk = File(splitsDir, "base.apk")
        val rawArmApk = File(splitsDir, "split_config.arm64_v8a.apk")
        val rawXxhApk = File(splitsDir, "split_config.xxhdpi.apk")

        ZipFile(apksFile).use { zip ->
            zip.getInputStream(zip.getEntry("base.apk")).use { input ->
                rawBaseApk.outputStream().use { output -> input.copyTo(output) }
            }
            zip.getInputStream(zip.getEntry("split_config.arm64_v8a.apk")).use { input ->
                rawArmApk.outputStream().use { output -> input.copyTo(output) }
            }
            zip.getInputStream(zip.getEntry("split_config.xxhdpi.apk")).use { input ->
                rawXxhApk.outputStream().use { output -> input.copyTo(output) }
            }
        }

        // Patch base.apk
        val baseConfig = PatcherConfig(
            apkFile = rawBaseApk,
            temporaryFilesPath = File("build/tmp/patcher-base-test"),
            targetPatcherVersion = "2.0.0",
            validate = true,
        )
        val patchedBaseApk = File(splitsDir, "base_patched.apk")
        rawBaseApk.copyTo(patchedBaseApk, overwrite = true)

        Patcher(baseConfig).use { patcher ->
            patcher += patches
            val results = patcher().toList()
            results.forEach { assertNull(it.exception) }
            val patcherResult = patcher.get()
            patcherResult.applyTo(patchedBaseApk)
        }

        if (customMapsKey != null) {
            replaceMapsKeyInApk(patchedBaseApk, customMapsKey)
        }

        // Sign all 3 split APKs with the identical key
        val signedBaseApk = File(splitsDir, "base_signed.apk")
        val signedArmApk = File(splitsDir, "arm_signed.apk")
        val signedXxhApk = File(splitsDir, "xxh_signed.apk")

        ApkUtils.signApk(patchedBaseApk, signedBaseApk, "Morphe", keyStoreDetails, 32)
        ApkUtils.signApk(rawArmApk, signedArmApk, "Morphe", keyStoreDetails, 32)
        ApkUtils.signApk(rawXxhApk, signedXxhApk, "Morphe", keyStoreDetails, 32)

        // Pack into patched .apks archive
        if (patchedApksFile.exists()) patchedApksFile.delete()
        ZipOutputStream(FileOutputStream(patchedApksFile)).use { zos ->
            // Copy info.json and icon.png from original .apks
            ZipFile(apksFile).use { origZip ->
                origZip.getEntry("info.json")?.let { entry ->
                    zos.putNextEntry(ZipEntry("info.json"))
                    origZip.getInputStream(entry).use { it.copyTo(zos) }
                    zos.closeEntry()
                }
                origZip.getEntry("icon.png")?.let { entry ->
                    zos.putNextEntry(ZipEntry("icon.png"))
                    origZip.getInputStream(entry).use { it.copyTo(zos) }
                    zos.closeEntry()
                }
            }

            // Put signed splits
            zos.putNextEntry(ZipEntry("base.apk"))
            signedBaseApk.inputStream().use { it.copyTo(zos) }
            zos.closeEntry()

            zos.putNextEntry(ZipEntry("split_config.arm64_v8a.apk"))
            signedArmApk.inputStream().use { it.copyTo(zos) }
            zos.closeEntry()

            zos.putNextEntry(ZipEntry("split_config.xxhdpi.apk"))
            signedXxhApk.inputStream().use { it.copyTo(zos) }
            zos.closeEntry()
        }
        println("Patched .apks generated successfully at ${patchedApksFile.absolutePath} (Size: ${patchedApksFile.length()} bytes)")
    }

    private fun getCustomMapsApiKey(): String? {
        val candidates = listOf(
            File(".env"),
            File("../../.env"),
            File("../.env"),
            File(System.getProperty("user.dir"), ".env")
        )
        for (f in candidates) {
            if (f.exists()) {
                for (line in f.readLines()) {
                    val trimmed = line.trim()
                    if (trimmed.startsWith("GOOGLE_MAPS_API_KEY=")) {
                        val key = trimmed.substringAfter("=").trim().removeSurrounding("\"").removeSurrounding("'")
                        if (key.isNotEmpty() && key != "your_api_key_here") {
                            return key
                        }
                    }
                }
            }
        }
        return null
    }

    private fun indexOfSubarray(array: ByteArray, target: ByteArray, startIndex: Int = 0): Int {
        if (target.isEmpty()) return startIndex
        val limit = array.size - target.size
        for (i in startIndex..limit) {
            var match = true
            for (j in target.indices) {
                if (array[i + j] != target[j]) {
                    match = false
                    break
                }
            }
            if (match) return i
        }
        return -1
    }

    private fun replaceMapsKeyInApk(apkFile: File, newKey: String) {
        val origKeyBytes = "AIzaSyBaWH_9ZMjvoJCgeCsjqXP4AhVtAzIbl9Y".toByteArray(Charsets.UTF_8)
        val newKeyBytes = newKey.toByteArray(Charsets.UTF_8)
        require(newKeyBytes.size == origKeyBytes.size) {
            "Google Maps API key must be exactly 39 characters long (got ${newKey.length})"
        }

        // 1. Read resources.arsc from APK to compute new CRC32
        var newCrc = 0L
        ZipFile(apkFile).use { zip ->
            val entry = zip.getEntry("resources.arsc") ?: return
            val arscData = zip.getInputStream(entry).readBytes()
            val keyIndex = indexOfSubarray(arscData, origKeyBytes)
            if (keyIndex == -1) {
                println("Key already replaced or not found in ${apkFile.name}")
                return
            }
            val newArscData = arscData.clone()
            System.arraycopy(newKeyBytes, 0, newArscData, keyIndex, newKeyBytes.size)
            val crc = java.util.zip.CRC32()
            crc.update(newArscData)
            newCrc = crc.value
        }

        // 2. Modify APK in-place: update Local Header CRC, data bytes, and Central Directory CRC
        java.io.RandomAccessFile(apkFile, "rw").use { raf ->
            val fileLength = raf.length()
            val fileData = ByteArray(fileLength.toInt())
            raf.seek(0)
            raf.readFully(fileData)

            val crcBytes = byteArrayOf(
                (newCrc and 0xFF).toByte(),
                ((newCrc shr 8) and 0xFF).toByte(),
                ((newCrc shr 16) and 0xFF).toByte(),
                ((newCrc shr 24) and 0xFF).toByte()
            )

            // Find Central Directory entry for resources.arsc
            val cdSig = byteArrayOf(0x50, 0x4b, 0x01, 0x02)
            var cdPos = 0
            var localHeaderOffset = -1
            while (cdPos < fileData.size - 4) {
                cdPos = indexOfSubarray(fileData, cdSig, cdPos)
                if (cdPos == -1) break
                val fnLen = (fileData[cdPos + 28].toInt() and 0xFF) or ((fileData[cdPos + 29].toInt() and 0xFF) shl 8)
                val fn = String(fileData, cdPos + 46, fnLen, Charsets.UTF_8)
                if (fn == "resources.arsc") {
                    // Update CRC in Central Directory (cdPos + 16)
                    System.arraycopy(crcBytes, 0, fileData, cdPos + 16, 4)
                    // Read relative offset of local header (cdPos + 42)
                    localHeaderOffset = (fileData[cdPos + 42].toInt() and 0xFF) or
                            ((fileData[cdPos + 43].toInt() and 0xFF) shl 8) or
                            ((fileData[cdPos + 44].toInt() and 0xFF) shl 16) or
                            ((fileData[cdPos + 45].toInt() and 0xFF) shl 24)
                    break
                }
                cdPos += 4
            }

            require(localHeaderOffset != -1) { "Could not find Central Directory entry for resources.arsc in ${apkFile.name}" }

            // Update CRC in Local File Header (localHeaderOffset + 14)
            System.arraycopy(crcBytes, 0, fileData, localHeaderOffset + 14, 4)

            // Replace the key in the raw data payload
            val keyPos = indexOfSubarray(fileData, origKeyBytes)
            require(keyPos != -1) { "Failed to locate key in raw file data" }
            System.arraycopy(newKeyBytes, 0, fileData, keyPos, newKeyBytes.size)

            // Write back updated file data
            raf.seek(0)
            raf.write(fileData)
        }
        println("In-place replaced Google Maps API key in ${apkFile.name} (preserved 100% STORED compression and 4096-byte alignment)!")
    }
}
