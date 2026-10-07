/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.sellerprofile

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Show View profile on Marketplace sellers on every Facebook build the bundle declares: the config
 * module for React Native is there under its kept name, with exactly the two by-name boolean reads
 * the hook goes in, each with the one local the hook uses and the name in a four-bit register.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class SellerViewProfileFixtureTest {
    @Test
    fun `each declared build has both named boolean reads with room for the answer`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val module = FixtureDex.classes(bundle, setOf(CONFIG_MODULE))[CONFIG_MODULE]
                assertNotNull("${bundle.name}: $CONFIG_MODULE", module)
                val reads = module!!.methods.filter(::isNamedBooleanRead)
                assertEquals("${bundle.name}: named boolean reads", NAMED_BOOLEAN_READS, reads.map { it.name }.toSet())
                assertEquals("${bundle.name}: one method per name", NAMED_BOOLEAN_READS.size, reads.size)
                for (read in reads) {
                    val locals = read.localRegisterCount()
                    assertTrue("${bundle.name}: ${read.name} has $locals locals", locals in 1..14)
                    read.checkRoomForTheAnswer()
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
