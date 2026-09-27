/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test

/**
 * The three methods a Reels page enters by, found in each declared build the way the patch finds
 * them, with both page filters put on each as the two patches put them: the page copied down into
 * v0, the class name in v1, and the answer copied back. 577's controller page method has 15
 * registers, its page in v14, so two more would have put the page out of the filter call's reach.
 */
class ReelPagesFixtureTest {
    @Before
    @After
    fun forgetMatches() {
        SfdAdInsertFingerprint.clearMatch()
        VideoHomeInsertAdsFingerprint.clearMatch()
    }

    /** Registers and the page's register of the page insert, the announcement and the controller's page method. */
    private val expected = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to listOf(6 to 5, 7 to 6, 11 to 10),
        AppCompatibilities.FACEBOOK_PREVIOUS_VERSION to listOf(6 to 5, 7 to 6, 15 to 14),
    )

    private fun MutableMethod.assertFilteredAtTop(where: String, page: Int, at: Int) {
        val body = implementation!!.instructions.toList()
        val copy = body[at] as TwoRegisterInstruction
        assertEquals("$where: copy down", listOf(Opcode.MOVE_OBJECT_FROM16, 0, page), listOf(body[at].opcode, copy.registerA, copy.registerB))
        val call = body[at + 2] as FiveRegisterInstruction
        assertEquals("$where: the filter call", listOf(0, 1), listOf(call.registerC, call.registerD))
        val back = body[at + 4] as TwoRegisterInstruction
        assertEquals("$where: copy back", listOf(Opcode.MOVE_OBJECT_16, page, 0), listOf(body[at + 4].opcode, back.registerA, back.registerB))
    }

    @Test
    fun `both page filters go on the three page methods of each declared build in v0 and v1`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("the declared builds", expected.keys, versions)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                forgetMatches()
                val anchors = FixtureDex.classesHolding(bundle, "VideoHomeDataControllerSfdAdsUtil") +
                    FixtureDex.classesHolding(bundle, "VideoHomeDataControllerImpl.maybeInsertAds")
                val taken = anchors.flatMap { it.methods }.filter { it.name == "<init>" }
                    .flatMap { method -> method.parameterTypes.map { it.toString() } }
                    .filter { it.startsWith("L") }.toSet()
                val classes = anchors + FixtureDex.classes(bundle, taken).values
                val context = PatchContexts.of(classes)

                val pages = with(context) { reelPages(SPONSORED_REELS_PATCH) }
                val methods = listOf(pages.insertPage, pages.announcePage, pages.addPage)
                assertEquals(
                    "${bundle.name}: registers and page register",
                    expected.getValue(version),
                    methods.map { it.implementation!!.registerCount to it.implementation!!.registerCount - 1 },
                )

                pages.insertPage.filterPageFirst("fixture.Ad")
                pages.announcePage.filterPageFirst("fixture.Ad")
                pages.addPage.filterSectionsFirst("fixture.Ad")
                // Hide AI-detected posts puts its own in front, on the same methods.
                pages.insertPage.filterPageFirst("fixture.Model", "Lfixture/Reels;->pages(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;")
                pages.announcePage.filterPageFirst("fixture.Model", "Lfixture/Reels;->pages(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;")
                pages.addPage.filterSectionsFirst("fixture.Model", "Lfixture/Reels;->sections(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;")

                methods.forEachIndexed { index, method ->
                    val page = expected.getValue(version)[index].second
                    val where = "${bundle.name}: ${method.definingClass}->${method.name}"
                    method.assertFilteredAtTop("$where, the AI filter", page, at = 0)
                    method.assertFilteredAtTop("$where, the ad filter", page, at = 5)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
