package app.ahmedyarub.patches

import app.ahmedyarub.patches.harness.Bundle
import app.ahmedyarub.patches.harness.withDependencies
import kotlin.test.Test
import java.util.jar.JarFile
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/** Checks on the bundle that need no APK. */
class BundleTest {
    @Test
    fun `the bundle exposes exactly the six add-on patches`() {
        val expected = setOf("Hide Who to follow", "Hide Find more", "Fix external post links", "Copy media URL", "Hide sports scores", "Hide search relevance prompt")
        assertEquals(expected, Bundle.patches.mapNotNull { it.name }.toSet())
        assertEquals(expected, Bundle.loadedPatchNames)
    }

    @Test
    fun `the bundle does not package upstream patch classes or extensions`() {
        val entries = JarFile(Bundle.file).use { jar -> jar.entries().toList().map { it.name }.toSet() }

        assertTrue(
            entries.none { it.startsWith("app/ahmedyarub/patches/") },
            "Upstream Ahmed patch classes leaked into the add-on bundle",
        )
        assertEquals(
            setOf("extensions/shared.mpe", "extensions/x.mpe", "extensions/feedcleanup-x.mpe"),
            entries.filter { it.startsWith("extensions/") && it.endsWith(".mpe") }.toSet(),
        )
    }

    /**
     * The loader drops unnamed patches, so one that no named patch depends on is never applied:
     * it compiles, it ships, and it does nothing.
     */
    @Test
    fun `every unnamed patch is reachable from a named one`() {
        val reachable = Bundle.patches.flatMap { it.withDependencies() }.toSet()
        // The libraries bundled in the .mpp carry patches of their own, which are theirs to prune.
        val unreachable =
            Bundle.declaredPatches
                .filterKeys { it.startsWith("app.xfeedcleanup.") }
                .filterValues { it.name == null && it !in reachable }
                .keys
                .sorted()

        assertTrue(unreachable.isEmpty(), "Unnamed patches no named patch depends on:\n" + unreachable.joinToString("\n"))
    }

    @Test
    fun `every named patch declares the apps it supports`() {
        val undeclared = Bundle.patches.filter { it.compatibility.isNullOrEmpty() }.map { it.name }
        assertTrue(undeclared.isEmpty(), "Patches without compatibility: $undeclared")
    }

    /** One app, one list of supported versions, whichever patch a user looks at. */
    @Test
    fun `patches for the same app declare the same versions`() {
        val targetsByPackage =
            Bundle.patches
                .flatMap { patch -> patch.compatibility.orEmpty() }
                .groupBy { it.packageName }
                .mapValues { (_, compatibilities) -> compatibilities.map { it.targets.map { t -> t.version } }.toSet() }

        val inconsistent = targetsByPackage.filterValues { it.size > 1 }
        assertTrue(inconsistent.isEmpty(), "Differing version lists: $inconsistent")
    }
}
