/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.patcher.patch.OptionException
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The AMOLED patch's Background colour option (issue #34): the colour dark mode's backgrounds take
 * instead of black, chosen when patching, since routes two and three write it into resources and
 * code.
 */
class AmoledBackgroundOptionTest {
    private val black = -0x1000000
    private val navy = 0xFF0D1117.toInt()

    /** Facebook's PRIMARY_TEXT in dark mode on 577 and 580. */
    private val text = 0xFFF2F4F7.toInt()

    private val option get() = amoledThemePatch.options["backgroundColour"]

    @After
    fun optionAsBefore() = option.reset()

    @Test
    fun aBlankOptionIsBlack() {
        for (blank in listOf(null, "", "   ", "#")) assertEquals("'$blank'", black, backgroundColour(blank))
    }

    @Test
    fun aHexColourIsTaken() {
        assertEquals(navy, backgroundColour("#0D1117"))
        assertEquals("no hash, lower case", navy, backgroundColour("0d1117"))
        assertEquals("with spaces", navy, backgroundColour(" #0d1117 "))
        assertEquals("opaque, as a colour picker writes it", navy, backgroundColour("#FF0D1117"))
    }

    @Test
    fun anythingElseIsRefused() {
        for (value in listOf("#123", "#0D111", "#0D11170", "#800D1117", "#000D1117", "navy", "#GG1117", "0x0D1117")) {
            assertNull(value, backgroundColour(value))
        }
    }

    /**
     * Text has to stay readable on every surface AMOLED makes from the colour, and the lightest is an
     * input's fill, [LIGHTEST_STEP] above it. The last grey that keeps Facebook's white text at 4.5:1
     * there is #3A3A3A; the next one up is refused, and so is anything lighter.
     */
    @Test
    fun aColourTooLightForTheTextIsRefused() {
        assertEquals(0xFF3A3A3A.toInt(), backgroundColour("#3A3A3A"))
        assertTrue(contrast(text, raised(0xFF3A3A3A.toInt(), LIGHTEST_STEP)) >= 4.5)

        assertNull(backgroundColour("#3B3B3B"))
        assertTrue(contrast(text, raised(0xFF3B3B3B.toInt(), LIGHTEST_STEP)) < 4.5)

        for (light in listOf("#808080", "#FFFFFF", "#4A90E2", "#F2F4F7")) assertNull(light, backgroundColour(light))
        assertTrue("#808080 is under 4.5:1 even on its own", contrast(text, 0xFF808080.toInt()) < 4.5)
    }

    /** The WCAG 2.2 ratios the rule stands on: black on white is 21:1, a colour against itself 1:1. */
    @Test
    fun theContrastIsWcags() {
        assertEquals(21.0, contrast(black, -1), 0.001)
        assertEquals(21.0, contrast(-1, black), 0.001)
        assertEquals(1.0, contrast(navy, navy), 0.001)
        assertEquals("as far as white", -1, raised(0xFFF0F0F0.toInt(), 0x35))
        assertEquals(0xFF42464C.toInt(), raised(navy, 0x35))
    }

    /** The option is black unless it's set, and refuses what the rule refuses, so the Manager can't patch with it. */
    @Test
    fun theOptionRefusesWhatTheRuleRefuses() {
        assertEquals("#000000", option.default)
        assertEquals(black, backgroundColour(option.value as String?))

        amoledThemePatch.options["backgroundColour"] = "#0D1117"
        assertEquals("#0D1117", option.value)
        amoledThemePatch.options["backgroundColour"] = null
        assertEquals("cleared", black, backgroundColour(option.value as String?))

        assertThrows(OptionException.ValueValidationException::class.java) {
            amoledThemePatch.options["backgroundColour"] = "#FFFFFF"
        }
    }

    /**
     * Route two writes the colour over each dark grey resource. Facebook's own black stays black, as
     * route three leaves a black literal, and anything outside the band stays as it was.
     */
    @Test
    fun routeTwoWritesTheColourOverADarkGrey() {
        assertEquals("#ff0d1117", routeTwoValue("#ff252728", "#ff0d1117"))
        assertEquals("#ff0d1117", routeTwoValue("#18191a", "#ff0d1117"))
        assertEquals("Facebook's black", "#000000", routeTwoValue("#000000", "#ff0d1117"))
        assertNull("a card's grey, above the band", routeTwoValue("#ff333334", "#ff0d1117"))
        assertNull("translucent", routeTwoValue("#80252728", "#ff0d1117"))
        assertNull("a dark colour with a hue", routeTwoValue("#ff0a2a0a", "#ff0d1117"))
        assertNull("a reference", routeTwoValue("@color/foo", "#ff0d1117"))
        assertEquals("black by default", "#ff000000", routeTwoValue("#ff252728", "#%08x".format(black)))
    }
}
