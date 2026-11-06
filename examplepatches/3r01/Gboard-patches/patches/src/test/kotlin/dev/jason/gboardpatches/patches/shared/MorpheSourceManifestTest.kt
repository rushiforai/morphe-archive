package dev.jason.gboardpatches.patches.shared

import com.google.gson.JsonParser
import java.nio.file.Files
import java.nio.file.Path
import java.time.LocalDateTime
import org.junit.Test

class MorpheSourceManifestTest {
    @Test
    fun customSourceTimestampHasNoTimezoneSuffix() {
        val root = generateSequence(Path.of("").toAbsolutePath()) { it.parent }
            .first { Files.isRegularFile(it.resolve("patches-bundle.json")) }
        val manifest = JsonParser.parseString(Files.readString(root.resolve("patches-bundle.json")))
            .asJsonObject
        // Morphe deserializes third-party sources into LocalDateTime, not Instant.
        LocalDateTime.parse(manifest["created_at"].asString)
    }
}
