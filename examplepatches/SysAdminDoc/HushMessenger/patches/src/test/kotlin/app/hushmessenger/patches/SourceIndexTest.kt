package app.hushmessenger.patches

import java.nio.file.Files
import java.nio.file.Path
import java.time.LocalDateTime
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertContains
import kotlin.test.assertNotNull
import kotlin.test.assertNull

class SourceIndexTest {
    @Test
    fun compatibilityRetainsBothExactBuildsWithoutInventingAbiMappings() {
        val targets = MessengerTarget.COMPATIBILITY.targets
        assertEquals(MessengerTarget.VERSIONS.keys.toList(), targets.map { it.version })
        for (target in targets) {
            assertEquals(MessengerTarget.MIN_SDK, target.minSdk)
            assertNull(target.versionCodes)
            val description = assertNotNull(target.description)
            MessengerTarget.VERSIONS.entries.single { it.key == target.version }.value
                .forEach { assertContains(description, it.toString()) }
        }
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
