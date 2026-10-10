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
     * there is #3A3A3A, and up to it every colour keeps Facebook's full step. Issue #34 lets a little
     * lighter through with a smaller step and lifted text, up to #535353 for a grey; the next one up
     * is refused, and so is anything lighter.
     */
    @Test
    fun aColourTooLightForTheTextIsRefused() {
        assertEquals(0xFF3A3A3A.toInt(), backgroundColour("#3A3A3A"))
        assertEquals(LIGHTEST_STEP, lightestStep(0xFF3A3A3A.toInt()))
        assertTrue(contrast(text, raised(0xFF3A3A3A.toInt(), LIGHTEST_STEP)) >= 4.5)

        assertEquals("the first lighter grey", 0xFF3B3B3B.toInt(), backgroundColour("#3B3B3B"))
        assertTrue(contrast(text, raised(0xFF3B3B3B.toInt(), LIGHTEST_STEP)) < 4.5)
        assertEquals(35, lightestStep(0xFF3B3B3B.toInt()))

        assertEquals("the last grey", 0xFF535353.toInt(), backgroundColour(LIGHTEST_ADMITTED_GREY))
        assertEquals(11, lightestStep(0xFF535353.toInt()))
        assertNull("the next grey up", backgroundColour("#545454"))

        for (light in listOf("#808080", "#FFFFFF", "#4A90E2", "#F2F4F7", "#6A6A6A")) assertNull(light, backgroundColour(light))
        assertTrue("#808080 is under 4.5:1 even on its own", contrast(text, 0xFF808080.toInt()) < 4.5)
    }

    /**
     * Every colour the option took before #34's lighter ones keeps [LIGHTEST_STEP], which the patch
     * leaves in the extension's stub as it is, so their output stays what it was: every opaque
     * colour with channels in steps of 0x0B up to 0x58, judged by the rule as it stood.
     */
    @Test
    fun everyColourTakenBeforeKeepsItsStep() {
        var before = 0
        var lighter = 0
        val channels = (0..0x58 step 0x0B)
        for (red in channels) for (green in channels) for (blue in channels) {
            val colour = (0xFF000000L or (red.toLong() shl 16) or (green.toLong() shl 8) or blue.toLong()).toInt()
            val takenBefore = contrast(text, raised(colour, LIGHTEST_STEP)) >= 4.5
            if (takenBefore) {
                before++
                assertEquals("%08X".format(colour), LIGHTEST_STEP, lightestStep(colour))
            } else if (lightestStep(colour) != null) {
                lighter++
                assertTrue("%08X".format(colour), lightestStep(colour)!! < LIGHTEST_STEP)
            }
        }
        assertTrue("taken before: $before", before > 50)
        assertTrue("taken now: $lighter", lighter > 10)
    }

    /**
     * Issue #34's #5B513F: Facebook's white has 7.08:1 on it but 3.26:1 on the lightest surface the
     * full step makes, so it gets a step of 12. Its page, card, popover and input fill stay in order
     * and apart, its lightest surface and an unread row's tint stay light enough for secondary text
     * at 4.5:1 that is still [TEXT_HIERARCHY] under the primary, and the primary text keeps 4.5:1.
     */
    @Test
    fun aLighterColourGetsSmallerStepsInTheSameOrder() {
        val sand = 0xFF5B513F.toInt()
        assertEquals(sand, backgroundColour("#5b513f"))
        assertEquals(7.08, contrast(text, sand), 0.01)
        assertEquals(3.26, contrast(text, raised(sand, LIGHTEST_STEP)), 0.01)
        assertEquals(12, lightestStep(sand))

        val surfaces = surfaces(sand, 12)
        assertEquals(listOf(sand, 0xFF5F5543.toInt(), 0xFF615746.toInt(), 0xFF645A48.toInt()), surfaces)
        assertEquals("ordered and apart", surfaces, surfaces.sortedBy { luminance(it) }.distinct())
        assertEquals(0xFF4F5F6F.toInt(), over(sand, UNREAD_ROW))

        val ceiling = (luminance(text) + 0.05) / (TEXT_HIERARCHY * TEXT_CONTRAST) - 0.05
        assertTrue(textSurface(sand, 12) <= ceiling)
        assertTrue("one step lighter would leave no room", textSurface(sand, 13) > ceiling)
        for (surface in surfaces + raised(sand, 12) + over(sand, UNREAD_ROW)) {
            assertTrue("primary text on %08X".format(surface), contrast(text, surface) >= 4.5)
        }
    }

    /** What the option says when it refuses a colour: how to give it, or what to pick instead. */
    @Test
    fun aRefusalSaysWhatToDo() {
        for (good in listOf(null, "", "#000000", "#0D1117", "#5B513F", "#FF3B3B3B")) assertNull(good, backgroundProblem(good))
        assertTrue(backgroundProblem("navy")!!.contains("#RRGGBB"))
        assertTrue(backgroundProblem("#123")!!.contains("isn't a color"))
        assertTrue(backgroundProblem("#800D1117")!!.contains("see-through"))
        val tooLight = backgroundProblem("#808080")!!
        assertTrue(tooLight, tooLight.contains("too light") && tooLight.contains(LIGHTEST_ADMITTED_GREY))
        for (message in listOf("navy", "#800D1117", "#808080").map { backgroundProblem(it)!! }) {
            assertTrue("no dashes: $message", '—' !in message && '–' !in message && " - " !in message)
        }
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
