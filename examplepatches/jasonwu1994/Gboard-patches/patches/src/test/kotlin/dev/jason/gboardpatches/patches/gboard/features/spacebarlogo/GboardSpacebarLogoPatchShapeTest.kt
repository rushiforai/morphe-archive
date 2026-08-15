package dev.jason.gboardpatches.patches.gboard.features.spacebarlogo

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardSpacebarLogoPatchShapeTest {
    private val root = Path.of(".").toAbsolutePath().normalize()

    @Test
    fun `soft key patch consumes reviewed binding and emits thin entry and return delegates`() {
        val source = Files.readString(
            root.resolve(
                "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                    "spacebarlogo/GboardSpacebarLogoSoftKeyPatch.kt"
            )
        )

        assertTrue(source.contains("findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)"))
        assertTrue(source.contains("SPACEBAR_LOGO_RUNTIME_BEFORE_SOFT_KEY_BOUND"))
        assertTrue(source.contains("SPACEBAR_LOGO_RUNTIME_AFTER_SOFT_KEY_BOUND"))
        assertTrue(source.contains("returnInstructionIndices()"))
        assertTrue(source.contains("RuntimeCallEmitter.invoke"))
        assertTrue(source.contains("\"p0, p1\""))
        assertTrue(!source.contains("Lowd;"))
        assertTrue(!source.contains("Loth;"))
    }

    @Test
    fun `registry exposes independent G Logo on Spacebar patch`() {
        val source = Files.readString(
            root.resolve(
                "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                    "GboardPatchRegistry.kt"
            )
        )

        assertTrue(source.contains("val gboardSpacebarLogoPatch = resourcePatch("))
        assertTrue(source.contains("name = \"G Logo on Spacebar\""))
        assertTrue(source.contains("gboardSpacebarLogoFeatureMarkerPatch"))
        assertTrue(source.contains("gboardSpacebarLogoSoftKeyPatch"))
    }
}
