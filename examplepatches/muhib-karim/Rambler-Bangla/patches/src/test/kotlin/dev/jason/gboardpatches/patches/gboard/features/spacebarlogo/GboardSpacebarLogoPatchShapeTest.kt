package dev.jason.gboardpatches.patches.gboard.features.spacebarlogo

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardSpacebarLogoPatchShapeTest {
    private val root = Path.of(".").toAbsolutePath().normalize()
    private val wiring = Files.readString(
        root.resolve(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardContributionWiring.kt",
        ),
    )

    @Test
    fun `soft key patch contributes both phases to the family composer`() {
        val source = Files.readString(
            root.resolve(
                "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                    "spacebarlogo/GboardSpacebarLogoSoftKeyPatch.kt"
            )
        )
        assertTrue(source.contains("GboardSoftKeyFamilyFeature.SPACEBAR_LOGO"))
        assertTrue(source.contains("beforeDelegate()"))
        assertTrue(source.contains("afterDelegate()"))
        assertTrue(!source.contains("addInstructions"))
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

        assertTrue(source.contains("val gboardSpacebarLogoPatch = gboardPublicResourcePatch("))
        assertTrue(source.contains("name = \"G Logo on Spacebar\""))
        assertTrue(source.contains("gboardSpacebarLogoFeatureMarkerPatch"))
        assertTrue(wiring.contains("gboardSpacebarLogoSoftKeyPatch"))
    }
}
