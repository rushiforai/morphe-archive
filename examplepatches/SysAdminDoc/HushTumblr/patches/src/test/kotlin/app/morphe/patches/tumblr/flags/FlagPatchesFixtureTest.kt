/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.flags

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patches.tumblr.ads.hideAdFreeBannerPatch
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.patches.tumblr.privacy.disableAnalyticsPatch
import app.morphe.patches.tumblr.ui.hideBlazePromptsPatch
import app.morphe.patches.tumblr.ui.hideCommunitiesTabPatch
import app.morphe.patches.tumblr.ui.hideTumblrTvPatch
import app.morphe.patches.tumblr.ui.turnOffScreenshotSharingPatch
import app.morphe.patches.tumblr.ui.disableUpdatePromptsPatch
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * Each patch that works through Tumblr's feature flags, against each declared build: every flag the
 * test names is a constant of Tumblr's feature enum there and is claimed in the extension's table,
 * and the patch turns its switch and its target on. The hook itself is FeatureSwitchHookFixtureTest's.
 */
@Category(FixtureTests::class)
class FlagPatchesFixtureTest {
    @Test
    fun `Disable analytics claims tracking flags Tumblr has and turns its switch on`() =
        check(disableAnalyticsPatch, "disableAnalytics", "analyticsFlags", "LIVERAMP_ATS", "ENABLE_OM_SDK", "MOAT_VIDEO_AD_BEACONING", "LITTLE_SISTER_MOAT_LOGGING", "SEND_FEATURE_EXPOSED_ANALYTICS", "SEND_NETWORK_USAGE_DATA", "MOBILE_PERFORMANCE_LOGGING", "SUPPLY_LOGGING")

    @Test
    fun `Hide the ad-free banner claims a flag Tumblr has and turns its switch on`() =
        check(hideAdFreeBannerPatch, "hideAdFreeBanner", "adFreeBannerFlags", "AD_FREE_CTA_BANNER")

    @Test
    fun `Hide Tumblr TV claims flags Tumblr has and turns its switch on`() =
        check(hideTumblrTvPatch, "hideTumblrTv", "tumblrTvFlags", "TUMBLR_TV_MOBILE_NAV", "TUMBLR_TV_ONBOARDING_REDIRECT")

    /**
     * Only the post editor's tips. The tab's own flag, COMMUNITIES_TAB_BAR_ITEM, is left to Tumblr, and
     * BottomBarTabsFixtureTest holds why and checks the claim table doesn't name it.
     */
    @Test
    fun `Hide the Communities tab claims a flag Tumblr has and turns its switch on`() =
        check(hideCommunitiesTabPatch, "hideCommunitiesTab", "communitiesTabFlags", "COMMUNITIES_TOOLTIPS")

    @Test
    fun `Hide Blaze prompts claims flags Tumblr has and turns its switch on`() =
        check(hideBlazePromptsPatch, "hideBlazePrompts", "blazePromptFlags", "BLAZE_DASHBOARD_ENTRYPOINT_IN_USER_BLOG_HEADER", "BLAZE_DASHBOARD_ENTRYPOINT_NEAR_PREMIUM", "BLAZE_NUDGE_AFTER_POST", "SHOW_BLAZE_SETTINGS_BANNER", "TUMBLR_BLAZE_LANDING_PAGE_BANNER")

    @Test
    fun `Turn off screenshot sharing claims a flag Tumblr has and turns its switch on`() =
        check(turnOffScreenshotSharingPatch, "turnOffScreenshotSharing", "screenshotSharingFlags", "SCREENSHOT_INTERCEPTION")

    @Test
    fun `Disable update prompts claims a flag Tumblr has and turns its switch on`() =
        check(disableUpdatePromptsPatch, "disableUpdatePrompts", "updatePromptFlags", "IN_APP_UPDATE")

    /**
     * Hide ads stops the full-screen ad Tumblr shows on opening a blog through two flags it claims in
     * the extension's table. In each declared build, Tumblr's interstitial manager hands each flag to
     * its feature check, tests the answer at once, and only on false logs the line for that flag and
     * returns: the first ends the show method before it asks for or shows an ad, the second ends the
     * route that blog opens from notifications, messages and notes take into it. The cooldown flag is
     * left to Tumblr, since off it ends the wait between two ads.
     */
    @Test
    fun `Hide ads stops the full-screen ad on opening a blog`() {
        val claimed = claimedFlags()
        assertFalse("the cooldown flag is left to Tumblr", "INTERSTITIAL_ADS_CLIENT_COOLDOWN" in claimed)
        val gates = mapOf(
            "MAKE_NIMBUS_INTERSTITIAL_CLIENT_AD_REQUESTS" to "Interstitial Ad - Skipping: flag off",
            "INTERSTITIAL_ADS_BLOG_OPENING_TRIGGERS" to "Interstitial Ad - Skipping: blog opening triggers flag off",
        )
        for (build in Fixtures.declaredBuilds()) {
            val feature = featureEnum(build)
            for ((flag, skipped) in gates) {
                assertTrue("$flag isn't claimed in the extension's table", flag in claimed)
                val managers = FixtureDex.methodsWhere(build, { true }) { skipped in it.strings() }
                assertEquals("${build.name}: methods that log \"$skipped\"", 1, managers.size)
                val body = managers.single().instructionList()
                val read = body.indexOfFirst { instruction ->
                    instruction.opcode == Opcode.SGET_OBJECT &&
                        instruction.fieldRef()?.let { it.definingClass == feature.type && it.name == flag } == true
                }
                val log = body.indexOfFirst { it.stringRef() == skipped }
                assertTrue("${build.name}: \"$skipped\" isn't logged after a read of $flag", read in 0 until log - 3)
                // The flag goes into a check that answers a boolean, the answer is tested next, and
                // its true side jumps past the log and the return that follows it.
                val check = body[read + 1]
                assertTrue("${build.name}: $flag isn't handed to a feature check",
                    check.methodRef()?.returnType == "Z" &&
                        (body[read] as OneRegisterInstruction).registerA in check.namedRegisters())
                val answer = body[read + 2]
                val branch = body[read + 3]
                assertEquals("${build.name}: the check's answer", Opcode.MOVE_RESULT, answer.opcode)
                assertEquals("${build.name}: the test of $flag", Opcode.IF_NEZ, branch.opcode)
                assertEquals("${build.name}: the tested register", (answer as OneRegisterInstruction).registerA,
                    (branch as OneRegisterInstruction).registerA)
                val end = (log until body.size).first { body[it].opcode in returnOpcodes }
                assertEquals("${build.name}: the manager returns right after \"$skipped\"", Opcode.RETURN_VOID,
                    body[end].opcode)
                assertTrue("${build.name}: the manager goes on after \"$skipped\"", end - log <= 3)
                assertTrue("${build.name}: another branch sits between the test of $flag and its return",
                    body.subList(read + 4, end).none { it is OffsetInstruction })
                assertTrue("${build.name}: $flag on doesn't skip \"$skipped\"", target(body, read + 3) > end)
            }
        }
    }

    private val returnOpcodes = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)

    /** The index of the instruction the branch at [index] lands on. */
    private fun target(body: List<Instruction>, index: Int): Int {
        val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
    }

    /** Every string the extension's claim table holds, which names each claimed flag. */
    private fun claimedFlags(): Set<String> =
        ExtensionDex.classes().single { it.type == FEATURE_SWITCHES }.methods.flatMap { it.strings() }.toSet()

    /** Tumblr's feature enum in [build]. */
    private fun featureEnum(build: File): ClassDef =
        FixtureDex.classesWhere(build, { true }) { method ->
            method.name == "<clinit>" && FEATURE_ENUM_TEXT in method.strings()
        }.single { it.superclass == "Ljava/lang/Enum;" }

    /**
     * Applies [patch] to the extension and checks it flips the [status] and [capability] stubs, after
     * checking each of [flags] against the feature enum of each declared build and the extension's
     * claim table.
     */
    private fun check(patch: BytecodePatch, status: String, capability: String, vararg flags: String) {
        val claimed = claimedFlags()
        for (build in Fixtures.declaredBuilds()) {
            val feature = featureEnum(build)
            val constants = feature.staticFields.filter { it.type == feature.type }.map { it.name }.toSet()
            for (flag in flags) {
                assertTrue("${build.name}: $flag isn't a constant of Tumblr's feature enum", flag in constants)
                assertTrue("$flag isn't claimed in the extension's table", flag in claimed)
            }
            val context = PatchContexts.of(ExtensionDex.classes())
            patch.execute(context)
            for (flag in listOf(status, capability)) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }
}
