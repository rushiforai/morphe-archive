/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The two components that draw a Marketplace video ad, on every Facebook build the bundle
 * declares: each is one method in the app, takes one object and returns one, and has a local the
 * hook can use. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class MarketplaceVideoAdFixtureTest {
    @Test
    fun `each declared build has both video ad drawers once`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                for (drawer in VideoAdDrawer.entries) {
                    val found = FixtureDex.classesHolding(bundle, drawer.strings.first())
                        .flatMap { owner -> owner.methods.filter { draws(it, drawer) } }
                    assertEquals("${bundle.name}: $drawer drawers", 1, found.size)
                    assertTrue("${bundle.name}: $drawer has no local", found.single().localRegisterCount() >= 1)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
