package audit

import com.google.gson.JsonParser
import java.io.File
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class SourceManifestTest {
    @Test fun `custom-source release date is accepted by the Manager serializer`() {
        val root = generateSequence(File(System.getProperty("user.dir")).canonicalFile) { it.parentFile }
            .first { File(it, "patches-bundle.json").isFile }
        val json = JsonParser.parseString(File(root, "patches-bundle.json").readText()).asJsonObject
        val date = json["created_at"].asString
        // Same parser as Morphe Manager's LocalDateTimeSerializer, including its
        // rejection of a trailing Z; Instant/OffsetDateTime would hide this bug.
        val parsed = LocalDateTime.parse(date, DateTimeFormatter.ISO_LOCAL_DATE_TIME)
        assertEquals(date, parsed.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME))
        assertTrue(json["download_url"].asString.endsWith("/patches-${json["version"].asString}.mpp"))
    }
}
