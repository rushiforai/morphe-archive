/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.reelstab

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.navigation.starttab.TAB_TAG
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide the Reels tab on every Facebook build the bundle declares: the tab the bar calls Reels on
 * some accounts and Video on others is one TabTag class, the one the extension names, and no
 * other tab has a Reels, Video, Watch or Shorts name the rule would miss. That the class hands
 * TabTag the Video tab's id is StartTabFixtureTest's, and the builder the rule is asked from is
 * TabBarFilterFixtureTest's. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips
 * without it.
 */
class HideReelsTabFixtureTest {
    private val facebookTabs = "Lapp/morphe/extension/facebook/navigation/FacebookTabs;"
    private val reelsLike = Regex("(?i)reel|video|watch|short")

    @Test
    fun `each declared build keeps its Reels tab in the one class the extension names`() {
        val reelsTab = "L" + ExtensionDex.stringConstant(facebookTabs, "VIDEO_CLASS").replace('.', '/') + ";"
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val tabs = mutableSetOf<String>()
                FixtureDex.forEach(fixture) { dex ->
                    for (classDef in dex.classes) if (classDef.superclass == TAB_TAG) tabs += classDef.type
                }
                assertTrue("${fixture.name}: found only ${tabs.size} tabs", tabs.size > 10)
                assertEquals("${fixture.name}: tabs with a Reels or Video name", listOf(reelsTab),
                    tabs.filter { reelsLike.containsMatchIn(it.substringAfterLast('/')) }.sorted())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
