package app.sadmod.client

import app.sadmod.client.data.bridge.BridgeConfig
import app.sadmod.client.data.bridge.SadModBridge
import app.sadmod.client.data.crypto.HappyModCrypto
import app.sadmod.client.data.download.ApkSecurityScanner
import app.sadmod.client.data.model.FindingKind
import app.sadmod.client.data.model.SecurityRiskLevel
import app.sadmod.client.data.patcher.ApkManifestParser
import app.sadmod.client.data.patcher.ApkPermissionPatcher
import app.sadmod.client.ui.components.compactDisplaySize
import com.android.apksig.ApkVerifier
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.KeyFactory
import java.security.cert.CertificateFactory
import java.security.cert.X509Certificate
import java.security.spec.PKCS8EncodedKeySpec
import java.util.zip.CRC32
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

class SadModSuiteTest {

    @Test
    fun decodeResponse_decodesKnownHappyModResponses() {
        assertEquals(
            """{"status":-10}""",
            HappyModCrypto.decodeResponse("ezL2hLL7lgMjQl42SO8=")
        )
        assertEquals(
            """{"status":-10,"timestamp":0}""",
            HappyModCrypto.decodeResponse("ezL2hLL7lgMjQl42SJ4rdHnwdcT7gf1xKms1lX==")
        )
    }

    @Test
    fun makeStamp_matchesExpectedMd5() {
        val stamp = HappyModCrypto.makeStamp("uid123", 1700000000L, stampKey = "synthetic_test_key")
        assertEquals(32, stamp.length)
        assertEquals(
            HappyModCrypto.md5Hex("uid1231700000000synthetic_test_key"),
            stamp
        )
    }

    @Test
    fun generateDownloadHash_returns16CharSlice() {
        SadModBridge.overrideForTesting(
            BridgeConfig(
                appVersion = "3.4.5",
                aid = "0123456789abcdef",
                stampKey = "synthetic_test_key",
                hashSalt = "synthetic_salt",
                apiBase = "https://api.example.org",
                downloadBase = "https://cdn.example.org"
            )
        )
        val hash = HappyModCrypto.generateDownloadHash("com.example.demo")
        assertEquals(16, hash.length)
    }

    @Test
    fun cleanHtml_stripsBreaksAndTags() {
        val cleaned = HappyModCrypto.cleanHtml("God Mode<br/>Unlimited Coins &amp; Gems<p>Next</p>")
        assertEquals("God Mode\nUnlimited Coins & GemsNext", cleaned)
    }

    @Test
    fun compactDisplaySize_formatsLargeMediumAndRawBytes() {
        assertEquals("2.5 GB", compactDisplaySize("2523.43 MB"))
        assertEquals("272 MB", compactDisplaySize("272.88 MB"))
        assertEquals("16.7 MB", compactDisplaySize("16.65 MB"))
        assertEquals("22.4 MB", compactDisplaySize("23524500"))
    }

    @Test
    fun securityScanner_flagsHighRiskPermissionsTrackersAndRawIps() {
        val tmp = File.createTempFile("test_mod", ".apk")
        try {
            val axml = buildMinimalAxml(
                listOf(
                    "android.permission.INTERNET",
                    "android.permission.READ_SMS"
                )
            )
            ZipOutputStream(FileOutputStream(tmp)).use { zos ->
                zos.putNextEntry(ZipEntry("AndroidManifest.xml"))
                zos.write(axml)
                zos.closeEntry()

                zos.putNextEntry(ZipEntry("classes.dex"))
                zos.write("Lcom/google/android/gms/ads/AdView; http://45.12.99.8/log".toByteArray(Charsets.UTF_8))
                zos.closeEntry()
            }
            val report = ApkSecurityScanner.scan(tmp)
            assertTrue(report.isValidArchive)
            assertEquals(SecurityRiskLevel.HIGH, report.riskLevel)
            assertTrue(report.declaredPermissions.contains("android.permission.READ_SMS"))
            assertTrue(report.findings.any { it.kind == FindingKind.PERMISSION && it.isHighRisk })
            assertTrue(report.findings.any { it.kind == FindingKind.TRACKER && it.identifier.contains("AdMob") })
            assertTrue(report.findings.any { it.kind == FindingKind.HARDCODED_IP && it.identifier.contains("45.12.99.8") })
            assertEquals(64, report.sha256.length)
        } finally {
            tmp.delete()
        }
    }

    @Test
    fun securityScanner_acceptsCleanApk() {
        val tmp = File.createTempFile("clean_mod", ".apk")
        try {
            val axml = buildMinimalAxml(listOf("android.permission.INTERNET"))
            ZipOutputStream(FileOutputStream(tmp)).use { zos ->
                zos.putNextEntry(ZipEntry("AndroidManifest.xml"))
                zos.write(axml)
                zos.closeEntry()

                zos.putNextEntry(ZipEntry("classes.dex"))
                zos.write("Lcom/example/CleanApp;".toByteArray(Charsets.UTF_8))
                zos.closeEntry()
            }
            val report = ApkSecurityScanner.scan(tmp)
            assertTrue(report.isValidArchive)
            assertEquals(SecurityRiskLevel.CLEAN, report.riskLevel)
            assertTrue(report.findings.isEmpty())
        } finally {
            tmp.delete()
        }
    }

    @Test
    fun permissionPatcher_stripsSelectedPermissionsAndSignsValidApk() {
        val inputApk = File.createTempFile("patch_in", ".apk")
        val outputApk = File.createTempFile("patch_out", ".apk")
        try {
            val axml = buildMinimalAxml(
                listOf(
                    "android.permission.INTERNET",
                    "android.permission.CAMERA",
                    "android.permission.RECORD_AUDIO"
                )
            )
            val parsedBefore = ApkManifestParser.parsePermissions(axml)
            assertEquals(
                listOf(
                    "android.permission.INTERNET",
                    "android.permission.CAMERA",
                    "android.permission.RECORD_AUDIO"
                ),
                parsedBefore
            )

            ZipOutputStream(FileOutputStream(inputApk)).use { zos ->
                zos.putNextEntry(ZipEntry("AndroidManifest.xml"))
                zos.write(axml)
                zos.closeEntry()

                val arscBytes = "ARSC_DUMMY_BYTES".toByteArray()
                val arscEntry = ZipEntry("resources.arsc").apply {
                    method = ZipEntry.STORED
                    size = arscBytes.size.toLong()
                    compressedSize = arscBytes.size.toLong()
                    crc = CRC32().apply { update(arscBytes) }.value
                }
                zos.putNextEntry(arscEntry)
                zos.write(arscBytes)
                zos.closeEntry()

                val soBytes = ByteArray(1024) { 0x7f }
                val soEntry = ZipEntry("lib/arm64-v8a/libtest.so").apply {
                    method = ZipEntry.STORED
                    size = soBytes.size.toLong()
                    compressedSize = soBytes.size.toLong()
                    crc = CRC32().apply { update(soBytes) }.value
                }
                zos.putNextEntry(soEntry)
                zos.write(soBytes)
                zos.closeEntry()

                zos.putNextEntry(ZipEntry("classes.dex"))
                zos.write("DEX".toByteArray())
                zos.closeEntry()
            }

            val assetsDir = listOf(
                File("app/src/main/assets"),
                File("src/main/assets")
            ).first { it.exists() }

            val pk8 = File(assetsDir, "patch_signer.pk8").readBytes()
            val der = File(assetsDir, "patch_signer.der").readBytes()
            val privKey = KeyFactory.getInstance("RSA").generatePrivate(PKCS8EncodedKeySpec(pk8))
            val cert = CertificateFactory.getInstance("X.509")
                .generateCertificate(der.inputStream()) as X509Certificate

            ApkPermissionPatcher.patchApk(
                inputApk = inputApk,
                permissionsToRemove = setOf("android.permission.CAMERA", "android.permission.RECORD_AUDIO"),
                outputApk = outputApk,
                privateKey = privKey,
                certificate = cert
            )

            val verifyResult = ApkVerifier.Builder(outputApk)
                .setMinCheckedPlatformVersion(24)
                .build()
                .verify()
            assertTrue("Patched APK must verify with apksig", verifyResult.isVerified)

            val postReport = ApkSecurityScanner.scan(outputApk)
            assertTrue(postReport.isValidArchive)
            assertEquals(listOf("android.permission.INTERNET"), postReport.declaredPermissions)
            assertFalse(postReport.declaredPermissions.contains("android.permission.CAMERA"))
            assertFalse(postReport.declaredPermissions.contains("android.permission.RECORD_AUDIO"))
        } finally {
            inputApk.delete()
            outputApk.delete()
        }
    }

    /**
     * Constructs a valid minimal binary AndroidManifest.xml (AXML) with UTF-16LE string pool
     * containing `<manifest>` and `<uses-permission android:name="..."/>` elements.
     */
    private fun buildMinimalAxml(permissions: List<String>): ByteArray {
        val strings = mutableListOf("manifest", "uses-permission", "name")
        strings.addAll(permissions)

        val spData = ByteArrayOutputStream()
        val offsets = IntArray(strings.size)
        val utf16 = Charsets.UTF_16LE
        for ((i, s) in strings.withIndex()) {
            offsets[i] = spData.size()
            val lenBuf = ByteBuffer.allocate(2).order(ByteOrder.LITTLE_ENDIAN).putShort(s.length.toShort())
            spData.write(lenBuf.array())
            spData.write(s.toByteArray(utf16))
            spData.write(0)
            spData.write(0)
        }
        while (spData.size() % 4 != 0) spData.write(0)

        val spHeaderSize = 28
        val offsetsSize = strings.size * 4
        val stringsStart = spHeaderSize + offsetsSize
        val spTotalSize = stringsStart + spData.size()

        val spChunk = ByteBuffer.allocate(spTotalSize).order(ByteOrder.LITTLE_ENDIAN).apply {
            putShort(0x0001)
            putShort(spHeaderSize.toShort())
            putInt(spTotalSize)
            putInt(strings.size)
            putInt(0) // styleCount
            putInt(0) // flags (UTF-16)
            putInt(stringsStart)
            putInt(0) // stylesStart
            offsets.forEach { putInt(it) }
            put(spData.toByteArray())
        }.array()

        val bodyChunks = ByteArrayOutputStream()
        // START_ELEMENT: manifest (36 bytes header, 0 attrs)
        bodyChunks.write(startElementChunk(nameIdx = 0, attrNameIdx = -1, attrValIdx = -1))
        for (i in permissions.indices) {
            val valIdx = 3 + i
            bodyChunks.write(startElementChunk(nameIdx = 1, attrNameIdx = 2, attrValIdx = valIdx))
            bodyChunks.write(endElementChunk(nameIdx = 1))
        }
        bodyChunks.write(endElementChunk(nameIdx = 0))

        val totalSize = 8 + spChunk.size + bodyChunks.size()
        return ByteBuffer.allocate(totalSize).order(ByteOrder.LITTLE_ENDIAN).apply {
            putShort(0x0003)
            putShort(8)
            putInt(totalSize)
            put(spChunk)
            put(bodyChunks.toByteArray())
        }.array()
    }

    private fun startElementChunk(nameIdx: Int, attrNameIdx: Int, attrValIdx: Int): ByteArray {
        val hasAttr = attrNameIdx >= 0
        val attrCount = if (hasAttr) 1 else 0
        val size = 36 + (if (hasAttr) 20 else 0)
        return ByteBuffer.allocate(size).order(ByteOrder.LITTLE_ENDIAN).apply {
            putShort(0x0102)
            putShort(16)
            putInt(size)
            putInt(1) // lineNumber
            putInt(-1) // comment
            putInt(-1) // ns
            putInt(nameIdx)
            putShort(20) // attrStart
            putShort(20) // attrSize
            putShort(attrCount.toShort())
            putShort(0) // idIndex
            putShort(0) // classIndex
            putShort(0) // styleIndex
            if (hasAttr) {
                putInt(-1) // attr ns
                putInt(attrNameIdx)
                putInt(attrValIdx)
                putShort(8) // typed value size
                put(0) // res0
                put(3) // type = STRING
                putInt(attrValIdx)
            }
        }.array()
    }

    private fun endElementChunk(nameIdx: Int): ByteArray {
        return ByteBuffer.allocate(24).order(ByteOrder.LITTLE_ENDIAN).apply {
            putShort(0x0103)
            putShort(16)
            putInt(24)
            putInt(1)
            putInt(-1)
            putInt(-1)
            putInt(nameIdx)
        }.array()
    }
}
