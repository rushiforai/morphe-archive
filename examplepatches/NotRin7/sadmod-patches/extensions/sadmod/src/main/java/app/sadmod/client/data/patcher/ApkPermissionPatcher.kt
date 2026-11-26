package app.sadmod.client.data.patcher

import android.content.Context
import com.android.apksig.ApkSigner
import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.FilterOutputStream
import java.io.InputStream
import java.io.OutputStream
import java.security.KeyFactory
import java.security.PrivateKey
import java.security.cert.CertificateFactory
import java.security.cert.X509Certificate
import java.security.spec.PKCS8EncodedKeySpec
import java.util.zip.Deflater
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

object ApkPermissionPatcher {

    private class CountingOutputStream(out: OutputStream) : FilterOutputStream(out) {
        var bytesWritten: Long = 0L
            private set

        override fun write(b: Int) {
            out.write(b)
            bytesWritten++
        }

        override fun write(b: ByteArray, off: Int, len: Int) {
            out.write(b, off, len)
            bytesWritten += len.toLong()
        }
    }

    private fun readAssetBytes(context: Context, name: String): ByteArray {
        return runCatching {
            context.applicationContext.assets.open(name).use { it.readBytes() }
        }.getOrElse {
            context.assets.open(name).use { it.readBytes() }
        }
    }

    fun patchApkWithEmbeddedKey(
        context: Context,
        inputApk: File,
        permissionsToRemove: Set<String>,
        outputApk: File
    ) {
        val pk8Bytes = readAssetBytes(context, "patch_signer.pk8")
        val derBytes = readAssetBytes(context, "patch_signer.der")
        val privateKey = KeyFactory.getInstance("RSA")
            .generatePrivate(PKCS8EncodedKeySpec(pk8Bytes))
        val certificate = CertificateFactory.getInstance("X.509")
            .generateCertificate(derBytes.inputStream()) as X509Certificate
        patchApk(inputApk, permissionsToRemove, outputApk, privateKey, certificate)
    }

    fun patchApk(
        inputApk: File,
        permissionsToRemove: Set<String>,
        outputApk: File,
        privateKey: PrivateKey,
        certificate: X509Certificate
    ) {
        val tempUnsigned = File(outputApk.parentFile, "${outputApk.name}.unsigned.tmp")
        try {
            rewriteUnsignedAligned(inputApk, permissionsToRemove, tempUnsigned)

            val signerConfig = ApkSigner.SignerConfig.Builder(
                "SADMOD",
                privateKey,
                listOf(certificate)
            ).build()

            val signer = ApkSigner.Builder(listOf(signerConfig))
                .setInputApk(tempUnsigned)
                .setOutputApk(outputApk)
                .setMinSdkVersion(21)
                .setV1SigningEnabled(true)
                .setV2SigningEnabled(true)
                .setV3SigningEnabled(true)
                .setAlignmentPreserved(true)
                .setCreatedBy("Android")
                .build()

            signer.sign()
        } finally {
            tempUnsigned.delete()
        }
    }

    private fun rewriteUnsignedAligned(
        inputApk: File,
        permissionsToRemove: Set<String>,
        tempUnsigned: File
    ) {
        val buffer = ByteArray(64 * 1024)
        ZipFile(inputApk).use { zip ->
            val counting = CountingOutputStream(BufferedOutputStream(FileOutputStream(tempUnsigned), 64 * 1024))
            ZipOutputStream(counting).use { zos ->
                zos.setLevel(Deflater.BEST_SPEED)
                val entries = zip.entries()
                while (entries.hasMoreElements()) {
                    val orig = entries.nextElement()
                    val name = orig.name
                    if (isSignatureEntry(name)) continue

                    if (name == "AndroidManifest.xml") {
                        val origManifest = zip.getInputStream(orig).use { it.readBytes() }
                        val patchedManifest = ApkManifestParser.stripPermissionsFromAxml(
                            origManifest,
                            permissionsToRemove
                        )
                        val outEntry = ZipEntry("AndroidManifest.xml").apply {
                            method = ZipEntry.DEFLATED
                            time = 0L
                        }
                        zos.putNextEntry(outEntry)
                        zos.write(patchedManifest)
                        zos.closeEntry()
                        continue
                    }

                    if (!orig.isDirectory &&
                        orig.method == ZipEntry.STORED &&
                        orig.size >= 0L &&
                        orig.crc >= 0L
                    ) {
                        zos.flush()
                        val align = if (name.endsWith(".so", ignoreCase = true)) 16384 else 4
                        val nameBytes = name.toByteArray(Charsets.UTF_8)
                        val headerBase = counting.bytesWritten + 30L + nameBytes.size
                        var pad = ((align - (headerBase % align)) % align).toInt()
                        if (pad in 1..3) pad += align

                        val outEntry = ZipEntry(name).apply {
                            method = ZipEntry.STORED
                            size = orig.size
                            compressedSize = orig.size
                            crc = orig.crc
                            time = 0L
                            if (pad >= 4) {
                                val dataLen = pad - 4
                                val extraBytes = ByteArray(pad)
                                // Standard Android zipalign TLV header ID 0xD935 (little-endian)
                                extraBytes[0] = 0x35.toByte()
                                extraBytes[1] = 0xD9.toByte()
                                extraBytes[2] = (dataLen and 0xFF).toByte()
                                extraBytes[3] = ((dataLen ushr 8) and 0xFF).toByte()
                                extra = extraBytes
                            }
                        }
                        zos.putNextEntry(outEntry)
                        zip.getInputStream(orig).use { ins -> copyStream(ins, zos, buffer) }
                        zos.closeEntry()
                    } else {
                        val outEntry = ZipEntry(name).apply {
                            method = ZipEntry.DEFLATED
                            time = 0L
                        }
                        zos.putNextEntry(outEntry)
                        if (!orig.isDirectory) {
                            zip.getInputStream(orig).use { ins -> copyStream(ins, zos, buffer) }
                        }
                        zos.closeEntry()
                    }
                }
            }
        }
    }

    private fun isSignatureEntry(name: String): Boolean {
        if (!name.startsWith("META-INF/")) return false
        val upper = name.uppercase()
        return upper == "META-INF/MANIFEST.MF" ||
            upper.endsWith(".SF") ||
            upper.endsWith(".RSA") ||
            upper.endsWith(".DSA") ||
            upper.endsWith(".EC") ||
            upper.startsWith("META-INF/SIG-")
    }

    private fun copyStream(input: InputStream, output: OutputStream, buffer: ByteArray) {
        while (true) {
            val read = input.read(buffer)
            if (read <= 0) break
            output.write(buffer, 0, read)
        }
    }
}
