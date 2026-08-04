package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardClipboardContentLimitPatchContractTest {
    @Test
    fun `content limit stays an independent public patch`() {
        val registry = read(
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardPatchRegistry.kt",
        )
        val declaration = registry.substringAfter(
            "val gboardClipboardContentLimitPatch = resourcePatch(",
        ).substringBefore("\n}\n")

        assertTrue(declaration.contains("name = \"Clipboard Custom Character Limit\""))
        assertTrue(declaration.contains("gboardClipboardContentLimitFeatureMarkerPatch"))
        assertTrue(declaration.contains("gboardClipboardContentLimitFlagValuePatch"))
        assertFalse(declaration.contains("gboardClipboardEnhancementsPatch"))
        assertTrue(registry.contains("gboardClipboardContentLimitPatch,"))
    }

    @Test
    fun `marker runtime and settings use the dedicated boundary`() {
        val marker = read(
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "clipboardcontentlimit/GboardClipboardContentLimitFeatureMarkerPatch.kt",
        )
        val runtime = read(
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/" +
                "clipboardcontentlimit/GboardClipboardContentLimitRuntime.java",
        )
        val policy = read(
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/" +
                "clipboardcontentlimit/GboardClipboardContentLimitPolicy.java",
        )
        val settings = read(
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/" +
                "clipboardcontentlimit/GboardClipboardContentLimitSettings.java",
        )

        assertTrue(marker.contains(
            "dev.jason.gboardpatches.feature.clipboard_content_limit",
        ))
        assertTrue(policy.contains("text_clip_item_char_limit"))
        assertTrue(runtime.contains("stockResult instanceof Long"))
        assertTrue(settings.contains("gboard_clipboard_content_limit"))
        assertTrue(settings.contains("DEFAULT_MAX_CHARACTERS = 20_000"))
    }

    private fun read(relative: String): String =
        Files.readString(repositoryRoot().resolve(relative))

    private fun repositoryRoot(): Path =
        generateSequence(Path.of("").toAbsolutePath()) { it.parent }
            .first { Files.isRegularFile(it.resolve("patches-list.json")) }
}
