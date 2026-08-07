package app.morphe

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils
import app.morphe.patcher.apk.ApkUtils.applyTo
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

fun main(args: Array<String>) {
    require(args.size >= 2) {
        "Usage: PatcherMain <input-apk> <output-apk>"
    }

    val inputApk = File(args[0])
    val outputApk = File(args[1])

    require(inputApk.exists()) { "Input APK not found: ${inputApk.absolutePath}" }

    val tempDir = File(System.getProperty("java.io.tmpdir"), "morphe-patcher-${System.currentTimeMillis()}")
    tempDir.mkdirs()

    try {
        val patches = PatchRegistry.allPatches

        val patcherResult = Patcher(
            PatcherConfig(
                apkFile = inputApk,
                temporaryFilesPath = tempDir,
                aaptBinaryPath = "",
                frameworkFileDirectory = tempDir.absolutePath,
            )
        ).use { patcher ->
            patcher += patches

            runBlocking {
                patcher().collect { result ->
                    if (result.exception != null) {
                        System.err.println("  FAILED: ${result.patch.name}")
                        result.exception?.printStackTrace()
                    } else {
                        println("  OK: ${result.patch.name}")
                    }
                }
            }

            patcher.get()
        }

        val rebuiltApk = File(tempDir, "patched.apk")
        inputApk.copyTo(rebuiltApk, overwrite = true)
        // applyTo() modifies rebuiltApk in-place: it opens the ZIP with ZFile.openReadWrite,
        // overwrites the dex files with our patched dex, merges resources, and realigns the
        // central directory. After this call, rebuiltApk is already a valid standalone APK
        // — there is no need to call ApkMerger (which is designed for APK *bundles* and
        // looks for `*.apk` entries that do not exist inside a single-module APK, throwing
        // "No *.apk files found on: ...").
        patcherResult.applyTo(rebuiltApk)

        // WORKAROUND: morphe 1.6.0 with arsclib 1.6.0 has a bug where DOM modifications
        // to AndroidManifest.xml via resourcePatch are silently dropped during AAPT/arsclib
        // XML-to-binary encoding. The text manifest in the working directory contains our
        // changes, but the compiled binary manifest in the output APK does not.
        //
        // To work around this, we patch the binary AndroidManifest.xml in the rebuilt APK
        // directly using arsclib's AndroidManifestBlock decoder/encoder.
        injectSignatureSpoofProvider(rebuiltApk)

        val keystoreFile = File(tempDir, "morphe.keystore")
        ApkUtils.signApk(
            rebuiltApk,
            outputApk,
            "v3",
            ApkUtils.KeyStoreDetails(
                keystoreFile,
                "Morphe",
                "Morphe",
                "",
            )
        )
    } finally {
        tempDir.deleteRecursively()
    }
}

/**
 * Manually inject the SignatureSpoof provider into the binary AndroidManifest.xml
 * of an APK after morphe's broken resource encoding has run.
 *
 * This works around a morphe 1.6.0 + arsclib bug where DOM modifications to
 * AndroidManifest.xml via `resourcePatch { document(...).use { ... } }` are
 * silently dropped during the XML-to-binary encoding pass. The text manifest
 * is correctly modified on disk, but the compiled binary in the output APK
 * does not reflect the changes.
 *
 * The function reads the binary manifest, decodes it via arsclib's
 * AndroidManifestBlock, appends a `<provider>` element to `<application>`,
 * re-encodes to binary, and writes it back into the APK.
 */
private fun injectSignatureSpoofProvider(apkFile: File) {
    val authority = "com.tantantribe.tribe.signatureSpoof"
    val providerName = "com.p1.mobile.putong.data.extension.signature.SignatureSpoofApplication"

    val tempApk = File(apkFile.parentFile, apkFile.name + ".tmp")
    var providerInjected = false

    ZipFile(apkFile).use { zipIn ->
        ZipOutputStream(tempApk.outputStream()).use { zipOut ->
            val entries = zipIn.entries()
            while (entries.hasMoreElements()) {
                val entry = entries.nextElement()
                zipOut.putNextEntry(ZipEntry(entry.name))
                if (entry.name == "AndroidManifest.xml") {
                    val manifestBytes = zipIn.getInputStream(entry).readBytes()
                    val patchedBytes = patchManifestBytes(manifestBytes, authority, providerName)
                    providerInjected = patchedBytes != manifestBytes
                    zipOut.write(patchedBytes)
                } else {
                    zipIn.getInputStream(entry).use { it.copyTo(zipOut) }
                }
                zipOut.closeEntry()
            }
        }
    }

    if (providerInjected) {
        apkFile.delete()
        tempApk.renameTo(apkFile)
    } else {
        tempApk.delete()
    }
}

/**
 * Decode binary AndroidManifest.xml, append a `<provider>` element to `<application>`,
 * and re-encode. Returns the original bytes if the provider is already present or
 * something goes wrong.
 */
private fun patchManifestBytes(manifestBytes: ByteArray, authority: String, providerName: String): ByteArray {
    return try {
        // Use arsclib (transitive dep of morphe) via reflection to avoid hard dependency
        val manifestBlockClass = Class.forName("com.reandroid.arsc.chunk.xml.AndroidManifestBlock")
        val manifestBlock = manifestBlockClass.getDeclaredConstructor().newInstance()

        // Read binary manifest from ByteArrayInputStream
        val readBytesStream = manifestBlockClass.getMethod("readBytes", java.io.InputStream::class.java)
        readBytesStream.invoke(manifestBlock, java.io.ByteArrayInputStream(manifestBytes))

        // Get <application> element
        val getApplicationElement = manifestBlockClass.getMethod("getApplicationElement")
        val applicationElement = getApplicationElement.invoke(manifestBlock) ?: return manifestBytes
        val applicationElementClass = applicationElement.javaClass

        val elementClass = Class.forName("com.reandroid.arsc.chunk.xml.ResXmlElement")
        val attrClass = Class.forName("com.reandroid.arsc.chunk.xml.ResXmlAttribute")
        val getOrCreateAndroidAttribute = elementClass.getMethod(
            "getOrCreateAndroidAttribute", String::class.java, java.lang.Integer.TYPE
        )

        fun setAttrString(elem: Any, localName: String, value: String) {
            val attr = getOrCreateAndroidAttribute.invoke(elem, localName, 0) ?: return
            val setValueAsString = attrClass.getMethod("setValueAsString", String::class.java)
            setValueAsString.invoke(attr, value)
        }

        // Check if provider already exists
        val listApplicationElementsByTag = manifestBlockClass.getMethod(
            "listApplicationElementsByTag", String::class.java
        )
        @Suppress("UNCHECKED_CAST")
        val existingProviders = listApplicationElementsByTag.invoke(manifestBlock, "provider") as List<Any>
        var providerExists = false
        for (provider in existingProviders) {
            val getAttributes = elementClass.getMethod("getAttributes")
            @Suppress("UNCHECKED_CAST")
            val attrs = getAttributes.invoke(provider) as Iterator<Any>
            while (attrs.hasNext()) {
                val attr = attrs.next()
                val getName = attrClass.getMethod("getName")
                val nameVal = getName.invoke(attr) as String?
                if (nameVal == "name") {
                    val getValueString = attrClass.getMethod("getValueString")
                    val nameAttr = getValueString.invoke(attr) as String?
                    if (nameAttr != null && nameAttr.contains("SignatureSpoof")) {
                        providerExists = true
                        break
                    }
                }
            }
            if (providerExists) break
        }

        // Create provider if it doesn't exist
        if (!providerExists) {
            val newElement = applicationElementClass.getMethod("newElement", String::class.java)
            val providerElement = newElement.invoke(applicationElement, "provider")

            setAttrString(providerElement, "name", providerName)
            setAttrString(providerElement, "authorities", authority)
            setAttrString(providerElement, "exported", "false")
            setAttrString(providerElement, "initOrder", "2147483647")
        }

        // Inject meta-data entries for MicroG signature spoofing (always, even if provider exists)
        fun addMetadata(name: String, value: String) {
            val newElement = applicationElementClass.getMethod("newElement", String::class.java)
            val metadataElement = newElement.invoke(applicationElement, "meta-data")
            setAttrString(metadataElement, "name", name)
            setAttrString(metadataElement, "value", value)
        }

        addMetadata("app.revanced.android.gms.SPOOFED_PACKAGE_NAME", "com.tantantribe.tribe")
        addMetadata("app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE", "71:5B:AB:0F:36:33:95:FE:34:D1:87:68:4B:0E:F7:71:A9:D4:00:F0")
        addMetadata("app.revanced.MICROG_PACKAGE_NAME", "app.revanced.android.gms")

        // Re-encode to binary by writing to a temp file and reading back
        val tempFile = File.createTempFile("manifest-", ".bin")
        try {
            val writeBytes = manifestBlockClass.getMethod("writeBytes", java.io.File::class.java)
            writeBytes.invoke(manifestBlock, tempFile)
            tempFile.readBytes()
        } finally {
            tempFile.delete()
        }
    } catch (e: Throwable) {
        manifestBytes
    }
}
