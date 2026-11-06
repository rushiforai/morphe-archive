package app.hushmessenger.patches

import app.morphe.patcher.patch.SupportedAbi
import java.nio.file.Files
import java.nio.file.Path
import java.time.LocalDateTime
import java.util.zip.ZipFile
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertContains
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue

class SourceIndexTest {
    @Test
    fun compatibilityNamesEachCheckedBuildByItsAbi() {
        val targets = MessengerTarget.COMPATIBILITY.targets
        assertEquals(MessengerTarget.VERSIONS.keys.toList(), targets.map { it.version })
        for (target in targets) {
            assertEquals(MessengerTarget.MIN_SDK, target.minSdk)
            val description = assertNotNull(target.description)
            MessengerTarget.VERSIONS.entries.single { it.key == target.version }.value
                .forEach { assertContains(description, it.toString()) }
        }
        // #145: 586 has several arm64 builds and the map holds one code per ABI, so Manager is told none and the
        // patch-time check is what refuses a build that isn't recorded. Declaring one would turn the others away.
        assertNull(targets.single { it.version == "586.0.0.55.92" }.versionCodes)
    }

    @Test
    fun buildCodesAreOnlyDeclaredWhenEveryBuildHasItsOwnAbi() {
        val abis = mapOf(1 to SupportedAbi.ARM64_V8A, 2 to SupportedAbi.ARM64_V8A, 3 to SupportedAbi.ARMEABI_V7A)
        assertEquals(mapOf(SupportedAbi.ARM64_V8A to 1, SupportedAbi.ARMEABI_V7A to 3), MessengerTarget.exactCodes(listOf(1, 3), abis))
        // Two DEX variants for one ABI can't both fit the map, and a missing ABI key would mean any build.
        assertNull(MessengerTarget.exactCodes(listOf(1, 2), abis))
        assertNull(MessengerTarget.exactCodes(listOf(1, 4), abis))
    }

    @Test
    fun eachDeclaredAbiIsTheOneItsFixtureShipsCodeFor() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val folders = mapOf(
            SupportedAbi.ARM64_V8A to "arm64-v8a", SupportedAbi.ARMEABI_V7A to "armeabi-v7a",
            SupportedAbi.X86_64 to "x86_64", SupportedAbi.X86 to "x86",
        )
        for ((code, abi) in MessengerTarget.ABIS) {
            val apk = Files.list(Path.of(root!!)).use { files -> files.filter { it.fileName.toString().endsWith("-$code.apk") }.toList() }.single()
            val shipped = ZipFile(apk.toFile()).use { zip ->
                zip.stream().map { it.name }.filter { it.startsWith("lib/") }.map { it.split('/')[1] }.distinct().toList()
            }
            assertEquals(listOf(folders.getValue(abi)), shipped, apk.toString())
        }
        assertTrue(MessengerTarget.VERSION_CODES.all { it in MessengerTarget.ABIS })
    }

    @Test
    fun aSecondVersionNameGetsItsOwnTarget() {
        val targets = MessengerTarget.compatibility(mapOf(
            "584.0.0.49.98" to listOf(346814894, 346814880),
            "585.0.0.1.91" to listOf(348000001),
        )).targets
        assertEquals(listOf("584.0.0.49.98", "585.0.0.1.91"), targets.map { it.version })
        assertEquals("Stock builds 346814894 and 346814880; checked again during patching", targets[0].description)
        assertEquals("Stock build 348000001; checked again during patching", targets[1].description)
    }

    @Test
    fun `source timestamp is accepted by Manager LocalDateTime serializer`() {
        val index = Files.readString(Path.of("../patches-bundle.json"))
        val timestamps = Regex("\"created_at\"\\s*:\\s*\"([^\"]+)\"").findAll(index).toList()
        assertEquals(1, timestamps.size)
        // Manager treats this local date-time as UTC later. A trailing Z fails parsing.
        LocalDateTime.parse(timestamps.single().groupValues[1])
    }
}
