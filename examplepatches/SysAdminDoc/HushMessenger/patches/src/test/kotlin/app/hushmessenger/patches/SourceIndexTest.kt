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
        val target = MessengerTarget.COMPATIBILITY.targets.single()
        assertEquals(MessengerTarget.VERSION, target.version)
        assertEquals(MessengerTarget.MIN_SDK, target.minSdk)
        assertNull(target.versionCodes)
        val description = assertNotNull(target.description)
        MessengerTarget.VERSION_CODES.forEach { assertContains(description, it.toString()) }
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
