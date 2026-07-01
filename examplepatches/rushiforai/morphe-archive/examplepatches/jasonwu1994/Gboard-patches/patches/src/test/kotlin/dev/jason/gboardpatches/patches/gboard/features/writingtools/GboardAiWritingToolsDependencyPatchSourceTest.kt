package dev.jason.gboardpatches.patches.gboard.features.writingtools

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAiWritingToolsDependencyPatchSourceTest {
    @Test
    fun dependencyPatchPassesContextToRuntimeForEagerEntryPoint() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                        "writingtools/GboardAiWritingToolsDependencyPatch.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("name = \"eU\""))
        assertTrue(source.contains("contextRegister = \"p1\""))
        assertTrue(
            source.contains(
                "syncDependencyProvider(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/String;)V"
            )
        )
    }
}
