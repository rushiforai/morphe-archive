/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.games

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Block Instant Games ads on every Facebook build the bundle declares: one game bridge has a
 * postMessage holding every ad message, that method has the locals the hook uses with the message
 * in a four-bit register, and the bridge rejects a promise through one method calling the call that
 * builds the rejected answer. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips
 * without it.
 */
class GameAdsFixtureTest {
    @Test
    fun `each declared build has one game bridge and one way to reject`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val bridges = FixtureDex.classesHolding(bundle, AD_MESSAGES.first()).filter { it.methods.any(::isPostMessage) }
                assertEquals("${bundle.name}: game bridges", 1, bridges.size)
                val post = bridges.single().methods.single(::isPostMessage)
                val locals = post.localRegisterCount()
                assertTrue("${bundle.name}: postMessage has $locals locals", locals in 3..14)
                val rejects = FixtureDex.classesHolding(bundle, REJECT_LOG).flatMap { it.methods.filter(::isRejectPromise) }
                assertEquals("${bundle.name}: calls building a rejected promise", 1, rejects.size)
                assertEquals("${bundle.name}: the bridge's reject methods", 1, rejectOn(bridges.single(), rejects).size)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
