/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.tabbar

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.navigation.starttab.TAB_TAG
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The tab bar filter on every Facebook build the bundle declares: one method builds the tab bar's
 * shown tabs from NavigationConfig's list, asking the hidden-tab set about each; every tab
 * Marketplace only or Hide the Reels tab drops or keeps by name is one of Facebook's TabTag
 * classes; and the patch, run on the build's own tab bar state, asks the extension right after the
 * set answers, reading the registers the builder already holds. Moved here from Marketplace only's
 * tests when Hide the Reels tab came to share the call. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class TabBarFilterFixtureTest {
    private val facebookTabs = "Lapp/morphe/extension/facebook/navigation/FacebookTabs;"

    private fun descriptor(constant: String) = "L" + ExtensionDex.stringConstant(facebookTabs, constant).replace('.', '/') + ";"

    /**
     * The tabs the extension takes off the bar, and the ones it keeps, by the class Facebook keeps.
     * Hide the Reels tab's one tab, VIDEO, is among Marketplace only's.
     */
    private val dropped = listOf("HOME", "FEEDS", "MOST_RECENT", "VIDEO", "FRIENDS", "GROUPS", "GAMING",
        "GAMING_CONTROLLER", "EVENTS").map { descriptor("${it}_CLASS") }
    private val kept = listOf("MARKETPLACE", "NOTIFICATIONS", "MENU", "PROFILE").map { descriptor("${it}_CLASS") }

    @Test
    fun `each declared build builds its tab bar the way the patch asks it, and the patch goes in there`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = fixture.name
                val builders = mutableListOf<Pair<Method, TabFilter>>()
                val owners = mutableMapOf<String, ClassDef>()
                val tabs = mutableSetOf<String>()
                FixtureDex.forEach(fixture) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.superclass == TAB_TAG) tabs += classDef.type
                        if (classDef.fields.none { it.type == NAVIGATION_CONFIG }) continue
                        for (method in classDef.methods) {
                            val filter = shownTabFilter(method) ?: continue
                            builders += method to filter
                            owners[classDef.type] = ImmutableClassDef.of(classDef)
                        }
                    }
                }
                assertEquals("$name: tab bar builders", 1, builders.size)
                assertEquals("$name: tabs the extension names that Facebook hasn't got", emptyList<String>(),
                    (dropped + kept).filter { it !in tabs })

                val (builder, filter) = builders.single()
                val context = PatchContexts.of(listOf(owners.getValue(builder.definingClass)))
                tabBarFilterPatch.execute(context)
                val patched = context.mutableClassDefBy(builder.definingClass).methods.single {
                    it.name == builder.name && it.parameterTypes.map(CharSequence::toString) ==
                        builder.parameterTypes.map(CharSequence::toString)
                }.implementation!!.instructions.toList()
                val asks = patched[filter.result + 1]
                assertEquals("$name: the call", HIDES_TAB, (asks as ReferenceInstruction).reference.toString())
                assertEquals("$name: what the call reads",
                    listOf(filter.answer, filter.tab, filter.configured, filter.hidden), asks.callRegisters())
                assertTrue("$name: a register past v15", asks.callRegisters().all { it <= 15 })
                assertEquals(Opcode.MOVE_RESULT, patched[filter.result + 2].opcode)
                assertEquals(Opcode.IF_NEZ, patched[filter.result + 3].opcode)
                listOf(filter.result + 2, filter.result + 3).forEach {
                    assertEquals("$name: ${patched[it].opcode} after the call", filter.answer,
                        (patched[it] as OneRegisterInstruction).registerA)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
