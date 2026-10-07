/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.usercertificates

import app.morphe.FixtureResources
import app.morphe.Fixtures
import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import javax.xml.parsers.DocumentBuilderFactory

/**
 * Trust user-added certificates on every declared build: the manifest already names Threads' own
 * network security config, which gains one user entry in its base trust anchors and nothing else,
 * so its domain configs, their pin sets and debug-overrides read as they did. A file that isn't a
 * network security config is refused.
 */
class TrustUserCertificatesFixtureTest {
    @Test
    fun everyDeclaredBuildTrustsUserCertificatesAndNothingElseMoves() {
        val builds = Fixtures.declaredBuilds()
        for (build in builds) FixtureResources.of(build).use { resources ->
            val manifest = resources.document("AndroidManifest.xml")
            val path = configPath(manifest)
            assertEquals("${build.name}: Threads names its own config", "res/xml/fb_network_security_config.xml", path)

            val config = resources.document(path!!)
            val stock = FixtureResources.elements(config)
            assertTrue("${build.name}: Meta's domains are pinned", stock.any { "/pin-set/pin[" in it })
            assertEquals("${build.name}: only the base config sets trust anchors", 1, trustUserCertificates(config))
            val patched = FixtureResources.elements(config)

            assertEquals("${build.name}: one user entry, in the base config", listOf(
                "network-security-config/base-config/trust-anchors/certificates[overridePins=true,src=user]",
            ), patched.toMutableList().apply { stock.forEach { remove(it) } })
            assertEquals("${build.name}: nothing goes", emptyList<String>(), stock - patched.toSet())

            assertEquals("${build.name}: a second run adds nothing", 1, trustUserCertificates(config))
            assertEquals(patched, FixtureResources.elements(config))
        }
        assertEquals("one build of each declared version", 3, builds.size)

        val other = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse("<shortcuts/>".byteInputStream())
        val refused = runCatching { trustUserCertificates(other) }.exceptionOrNull()
        assertTrue("${refused?.message}", refused is PatchException && refused.message!!.contains("network-security-config"))
    }
}
