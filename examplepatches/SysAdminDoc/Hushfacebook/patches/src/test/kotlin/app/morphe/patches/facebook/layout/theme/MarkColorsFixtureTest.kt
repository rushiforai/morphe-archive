/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Badge and logo colors (#263) on each declared build: the token enum FDSColors resolves still has
 * the badge and logo tokens the extension goes by, as the patch checks when it applies.
 */
class MarkColorsFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    @Test
    fun `the token enum holds the badge and logo tokens, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val tokenType = fdsColourSource(fdsColorsOf(bundle))!!.parameterTypes[1].toString()
                val tokenClass = FixtureDex.classes(bundle, setOf(tokenType)).getValue(tokenType)
                val constants = tokenConstants(tokenClass.methods.single { it.name == "<clinit>" }, tokenType)
                assertEquals("${bundle.name}: tokens missing", emptyList<String>(), missingMarkTokens(constants))
                assertTrue("${bundle.name}: a token the patch doesn't ask for counts as missing",
                    missingMarkTokens(TokenConstants(tokenType, emptyMap(), emptyMap())) == MARK_TOKENS)
                checked += version
            }
        }
        assertEquals("a fixture for each declared build", versions, checked)
    }
}
