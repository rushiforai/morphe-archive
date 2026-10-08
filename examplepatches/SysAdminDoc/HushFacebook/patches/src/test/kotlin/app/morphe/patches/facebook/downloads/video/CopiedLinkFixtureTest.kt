/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.video

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

/**
 * Offer to download copied links opens a video Facebook hasn't built a player for through
 * Facebook's own link handler, named by its class in the extension (ClipboardLink.URI_HANDLER).
 * It's a manifest component, so Redex keeps the name: this holds it to every declared build, and
 * to an activity, since the extension starts it as one. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class CopiedLinkFixtureTest {
    @Test
    fun `each declared build keeps Facebook's link handler activity`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val handler = FixtureDex.classes(bundle, setOf(URI_HANDLER, FRAGMENT_ACTIVITY))
                assertNotNull("${bundle.name}: no link handler", handler[URI_HANDLER])
                assertEquals("${bundle.name}: the link handler isn't Facebook's activity",
                    FRAGMENT_ACTIVITY, handler.getValue(URI_HANDLER).superclass)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private companion object {
        const val URI_HANDLER = "Lcom/facebook/katana/IntentUriHandler;"
        const val FRAGMENT_ACTIVITY = "Lcom/facebook/base/activity/FbFragmentActivity;"
    }
}
