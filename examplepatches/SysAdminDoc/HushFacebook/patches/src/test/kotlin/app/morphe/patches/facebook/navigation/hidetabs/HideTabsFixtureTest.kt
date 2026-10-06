/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.hidetabs

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide tabs on every Facebook build the bundle declares: each tab it can take off has its class,
 * under the name the extension's HiddenTabs knows it by. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HideTabsFixtureTest {
    @Test
    fun `each declared build carries a class for every hideable tab`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val found = FixtureDex.classes(bundle, HIDEABLE_TABS.values.flatten().toSet()).keys
                for ((tab, classes) in HIDEABLE_TABS) {
                    assertTrue("${bundle.name}: no class for the $tab tab among $classes", classes.any { it in found })
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
