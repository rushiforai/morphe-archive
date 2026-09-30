package app.ahmedyarub.patches

import app.ahmedyarub.patches.harness.Bundle
import app.ahmedyarub.patches.harness.withDependencies
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/** Checks on the bundle that need no APK. */
class BundleTest {
    @Test
    fun `the bundle loads the named patches`() {
        assertEquals(Bundle.patches.mapNotNull { it.name }.toSet(), Bundle.loadedPatchNames)
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
                .filterKeys { it.startsWith("app.ahmedyarub.") || it.startsWith("app.crimera.") }
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
