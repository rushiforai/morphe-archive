package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest
import org.junit.Assume.assumeTrue
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class TelemetryPatchTest {
    private val pairs = listOf(
        "2.0.20" to "5001712",
        "2.0.20" to "5001812",
        "2.0.21" to "5001968",
        "2.0.22" to "5002244",
        "2.0.23" to "5002363",
    )

    @Test fun `merged Codecs Support exposes telemetry off by default without dependencies`() {
        val patches = listOf(xrCodecsSupportPatch)
        patches.forEach { patch ->
            assertEquals(false, patch.options["enableTelemetry"].default, patch.name)
            assertTrue(patch.dependencies.isEmpty(), patch.name)
        }
        val actual = patches.flatMap { patch -> patch.compatibility.orEmpty().flatMap { compatibility ->
            assertEquals(TELEMETRY_PACKAGE, compatibility.packageName)
            compatibility.targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it.toString() }
            }
        } }.toSet()
        // Codecs Support ships on 2.0.24 too, but the optional telemetry payload has no
        // 2.0.24 admission profile yet; enabling it there must fail closed.
        assertEquals((pairs + ("2.0.24" to "5002395")).toSet(), actual)
        pairs.forEach { (version, code) -> assertTrue(isTelemetrySteamLinkTarget(TELEMETRY_PACKAGE, version, code)) }
        assertFalse(isTelemetrySteamLinkTarget(TELEMETRY_PACKAGE, "2.0.24", "5002395"))
    }

    @Test fun `unknown pairs and other apps return before file or payload access`() = withTemporaryRoot { root ->
        val absent = File(root, "must-stay-absent")
        val invalidPayload = mapOf("unknown" to byteArrayOf(1))
        listOf("2.0.20" to "5002363", "2.0.23" to "5001712",
            "2.0.20" to "5001813", "2.0.20" to "5002364", "2.0.22" to "5002322",
            "2.0.21" to "5001969", "2.0.24" to "5002363").forEach { (version, code) ->
            assertTrue(prepareTelemetryResources(absent, version, code, payloads = invalidPayload,
                profileBytes = byteArrayOf(1)).isEmpty())
            assertFalse(installTelemetryResources(absent, version, code, payloads = invalidPayload,
                profileBytes = byteArrayOf(1)))
        }
        pairs.forEach { (version, code) ->
            assertFalse(installTelemetryResources(absent, version, code, "cn.vr4p.oculus4xvrplayerov",
                invalidPayload, byteArrayOf(1)))
        }
        assertFalse(absent.exists())
    }

    @Test fun `tracked admission metadata and payloads validate without proprietary APKs`() {
        val bytes = telemetryResource("profiles.tsv")
        assertEquals(TELEMETRY_PROFILES_SHA256, sha256(bytes))
        val profiles = parseTelemetryProfiles(bytes)
        assertEquals(pairs.toSet(), profiles.map { it.versionName to it.versionCode }.toSet())
        profiles.forEach {
            assertEquals(8, it.anchors.size)
            assertEquals(8, it.imports.size)
            assertTrue(it.segments.isNotEmpty())
        }
        val payloads = payloads()
        validateTelemetryPayloads(payloads)
        assertEquals(setOf(TELEMETRY_LIBRARY, "libshadowhook.so", "libshadowhook_nothing.so",
            TELEMETRY_MANIFEST, "NOTICE.txt"), payloads.keys)
        payloads.filterKeys { !it.endsWith(".so") }.forEach { (name, bytes) ->
            assertFalse(bytes.contains(0x0d.toByte()),
                "$name must use canonical LF bytes; re-checkout the telemetry resource on Windows")
        }
        val producer = payloads.getValue(TELEMETRY_LIBRARY).toString(Charsets.ISO_8859_1)
        assertTrue(producer.contains("GXRDecoderProbe"))
        assertTrue(producer.contains("colourlab-probe.request"))
        assertTrue(payloads.getValue("NOTICE.txt").isNotEmpty())
        val codec = projectionModeResource(CODECS_SUPPORT_LIBRARY).toString(Charsets.ISO_8859_1)
        assertFalse(codec.contains("GXRDecoderProbe"), "Optional telemetry must not add instrumentation to the base codec helper")
        assertFalse(codec.contains("colourlab-probe.request"))
    }

    @Test fun `profile parser rejects malformed and incomplete admission records`() {
        val rows = telemetryResource("profiles.tsv").decodeToString().lineSequence()
            .filter { it.isNotBlank() && !it.startsWith("#") }.toList()
        fun changed(field: Int, value: String): ByteArray {
            val first = rows.first().split('\t').toMutableList().apply { this[field] = value }
            return (listOf(first.joinToString("\t")) + rows.drop(1)).joinToString("\n").toByteArray()
        }
        listOf(changed(0, "9.9.9"), changed(2, "-1"), changed(3, "not-a-sha256"),
            changed(4, "999999999:128:" + "a".repeat(64)),
            changed(5, "AMediaCodec_queueInputBuffer@0x1"), changed(6, "0:100:50:5"),
            rows.drop(1).joinToString("\n").toByteArray(),
            (rows + rows.first()).joinToString("\n").toByteArray(),
            "too\tfew\tfields".toByteArray(), byteArrayOf(0xc3.toByte(), 0x28)).forEach { invalid ->
            assertFailsWith<PatchException> { parseTelemetryProfiles(invalid) }
        }
    }

    @Test fun `every packaged payload rejects tampering and foreign payload sets`() {
        val resources = payloads()
        resources.keys.forEach { name ->
            val changed = resources.toMutableMap()
            changed[name] = changed.getValue(name).copyOf().apply {
                this[lastIndex] = (this[lastIndex].toInt() xor 1).toByte()
            }
            assertFailsWith<PatchException>(name) { validateTelemetryPayloads(changed) }
        }
        assertFailsWith<PatchException> { validateTelemetryPayloads(resources - TELEMETRY_LIBRARY) }
        assertFailsWith<PatchException> { validateTelemetryPayloads(resources + ("foreign.so" to byteArrayOf(1))) }
    }

    @Test fun `actual 5001712 installs idempotently without codec resources or unrelated edits`() = auditRealBase("2.0.20", "5001712")
    @Test fun `actual 5002363 installs idempotently without codec resources or unrelated edits`() = auditRealBase("2.0.23", "5002363")

    private fun auditRealBase(version: String, code: String) = withFixtureRoot(version, code) { root, original ->
        val manifest = File(root, "AndroidManifest.xml").readBytes()
        val neighbor = File(root, "assets/openxr/1/api_layers/implicit.d/neighbour.json")
            .apply { parentFile.mkdirs(); writeText("preserve other layer") }
        val unknown = File(root, "assets/unknown-settings.bin").apply { writeBytes(byteArrayOf(3, 5, 7)) }
        val neighborBytes = neighbor.readBytes()
        val unknownBytes = unknown.readBytes()
        val profile = profiles().single { it.versionName == version && it.versionCode == code }
        assertEquals(profile.stockSha256, sha256(original), "Audit must use pristine exact $version/$code bytes")
        validateTelemetryScene(original, profile)
        val before = root.walkTopDown().filter { it.isFile }.associate { it.relativeTo(root).path to sha256(it.readBytes()) }
        val prepared = prepareTelemetryResources(root, version, code)
        assertEquals(5, prepared.size)
        assertTrue(prepared.all { (target, _) -> !target.exists() })
        assertEquals(before, root.walkTopDown().filter { it.isFile }
            .associate { it.relativeTo(root).path to sha256(it.readBytes()) }, "Preparation must not write files")
        assertTrue(installTelemetryResources(root, version, code))
        val expected = installedFiles(root)
        expected.forEach { (name, file) -> assertContentEquals(telemetryResource(name), file.readBytes(), name) }
        val times = expected.mapValues { it.value.lastModified() }
        assertTrue(installTelemetryResources(root, version, code))
        assertEquals(times, expected.mapValues { it.value.lastModified() })
        assertContentEquals(original, sceneFile(root).readBytes())
        assertContentEquals(manifest, File(root, "AndroidManifest.xml").readBytes())
        assertContentEquals(neighborBytes, neighbor.readBytes())
        assertContentEquals(unknownBytes, unknown.readBytes())
        assertFalse(File(root, "lib/arm64-v8a/$CODECS_SUPPORT_LIBRARY").exists())
        assertFalse(File(root, "assets/openxr/1/api_layers/implicit.d/$CODECS_SUPPORT_MANIFEST").exists())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test fun `actual scenes reject changed size code anchors and ELF layout before installation`() {
        pairs.forEach { (version, code) -> withFixtureRoot(version, code) { root, original ->
            val scene = sceneFile(root)
            val profile = profiles().single { it.versionName == version && it.versionCode == code }
            val changedCode = original.copyOf().apply {
                val offset = profile.anchors.first().offset
                this[offset] = (this[offset].toInt() xor 1).toByte()
            }
            val wrongArchitecture = original.copyOf().apply { this[18] = 0x3e }
            val wrongProgramHeader = original.copyOf().apply { this[54] = 0 }
            listOf(original.copyOf(original.size - 1), changedCode, wrongArchitecture, wrongProgramHeader).forEach { invalid ->
                scene.writeBytes(invalid)
                assertFailsWith<PatchException> { installTelemetryResources(root, version, code) }
                assertFalse(installedFiles(root).values.any { it.exists() })
                assertFalse(File(root, "assets/openxr").exists())
                assertContentEquals(invalid, scene.readBytes())
            }
        } }
    }

    @Test fun `actual base permits an independent edit outside guarded decoder regions`() =
        withFixtureRoot("2.0.23", "5002363") { root, original ->
            val profile = profiles().single { it.versionCode == "5002363" }
            // Test coexistence with a change outside the guarded decoder anchors
            // and ELF program headers, starting from the actual decoded ELF.
            val offset = 0x10000
            assertTrue(profile.anchors.none { offset in it.offset until it.offset + it.size })
            val modified = original.copyOf().apply { this[offset] = (this[offset].toInt() xor 1).toByte() }
            sceneFile(root).writeBytes(modified)
            assertTrue(installTelemetryResources(root, "2.0.23", "5002363"))
            assertContentEquals(modified, sceneFile(root).readBytes())
        }

    @Test fun `stale resources and tampered metadata fail before any counterpart is installed`() =
        withFixtureRoot("2.0.20", "5001712") { root, original ->
            val destinations = installedFiles(root)
            destinations.forEach { (_, stale) ->
                stale.parentFile.mkdirs()
                stale.writeText("user or stale content")
                assertFailsWith<PatchException> { installTelemetryResources(root, "2.0.20", "5001712") }
                assertEquals("user or stale content", stale.readText())
                assertTrue(destinations.values.filter { it != stale }.none { it.exists() })
                Files.delete(stale.toPath())
            }
            val invalidProfiles = telemetryResource("profiles.tsv").copyOf().apply { this[lastIndex] = 33 }
            assertFailsWith<PatchException> {
                installTelemetryResources(root, "2.0.20", "5001712", profileBytes = invalidProfiles)
            }
            val invalidPayloads = payloads().toMutableMap().apply { this[TELEMETRY_MANIFEST] = byteArrayOf(1) }
            assertFailsWith<PatchException> {
                installTelemetryResources(root, "2.0.20", "5001712", payloads = invalidPayloads)
            }
            assertFalse(destinations.values.any { it.exists() })
            assertContentEquals(original, sceneFile(root).readBytes())
        }

    private fun payloads() = TELEMETRY_PAYLOAD_SHA256.keys.associateWith(::telemetryResource)
    private fun profiles() = parseTelemetryProfiles(telemetryResource("profiles.tsv"))
    private fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes)
        .joinToString("") { "%02x".format(it) }
    private fun sceneFile(root: File) = File(root, "lib/arm64-v8a/libvrlink_scene.so")
    private fun installedFiles(root: File): Map<String, File> = TELEMETRY_PAYLOAD_SHA256.keys.associateWith { name ->
        File(root, when {
            name.endsWith(".so") -> "lib/arm64-v8a/$name"
            name == TELEMETRY_MANIFEST -> "assets/openxr/1/api_layers/implicit.d/$name"
            else -> "assets/gxr-telemetry/NOTICE.txt"
        })
    }

    private fun repositoryRoot(): File = listOf(File("."), File("..")).first { File(it, "patches/src/main").isDirectory }.canonicalFile
    private fun originalScene(version: String, code: String): ByteArray {
        val scene = File(repositoryRoot(), "android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so")
        assumeTrue("BLOCKED: missing actual decoded $version/$code scene; no synthetic success fixture", scene.isFile)
        return scene.readBytes()
    }
    private fun withFixtureRoot(version: String, code: String, block: (File, ByteArray) -> Unit) {
        val original = originalScene(version, code)
        withTemporaryRoot { root ->
            sceneFile(root).apply { parentFile.mkdirs(); writeBytes(original) }
            val originalManifest = File(repositoryRoot(),
                "android-steamlinkvr-release-base-$version-$code/AndroidManifest.xml")
            assumeTrue("BLOCKED: missing actual decoded $version/$code manifest", originalManifest.isFile)
            File(root, "AndroidManifest.xml").writeBytes(originalManifest.readBytes())
            block(root, original)
        }
    }
    private fun withTemporaryRoot(block: (File) -> Unit) {
        val base = File(System.getProperty("steamlink.telemetry.testRoot") ?: File(repositoryRoot().parentFile,
            "builds/SteamVRColourLab/build/telemetry-separation/kotlin-fixtures").path).canonicalFile
        base.mkdirs()
        val root = Files.createTempDirectory(base.toPath(), "telemetry-").toFile().canonicalFile
        check(root.toPath().startsWith(base.toPath()) && !Files.isSymbolicLink(root.toPath()))
        try { block(root) } finally { root.deleteRecursively() }
    }
}
