/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.tumblr.flags.FEATURE_ENUM_TEXT
import app.morphe.patches.tumblr.flags.FEATURE_SWITCHES
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.sameAs
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.reandroid.arsc.chunk.xml.ResXmlDocument
import com.reandroid.arsc.chunk.xml.ResXmlElement
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.util.zip.ZipFile

/** The Communities tab's button on the bar, a view id in [VIEW_IDS] that `BottomBarTabs` hides by this name. */
private const val COMMUNITIES_BUTTON = "communities_button_wrapper"

/** The flag Tumblr lists the Communities tab by, a constant of its feature enum. */
private const val COMMUNITIES_TAB_FLAG = "COMMUNITIES_TAB_BAR_ITEM"

/** The bar's layout, and the Communities and Tumblr TV buttons' ids in it (Tumblr 46.9.1.100). */
private const val BAR_LAYOUT = "res/layout/root_activity_nav_bar.xml"
private const val COMMUNITIES_BUTTON_ID = 0x7f0b0334
private const val TUMBLR_TV_BUTTON_ID = 0x7f0b0d91

/** `android:visibility`, and its value for gone. */
private const val ANDROID_VISIBILITY = 0x010100dc
private const val GONE = 2

/**
 * The bottom bar hooks in each declared build: Tumblr's tab list goes to the extension right before
 * it's frozen, on the list it built, and the bar right after its controller is built, on the view
 * the controller was given. Tumblr's own code around each call is unchanged, and each of the four
 * patches turns on its own switch and targets. The last two tests hold what Hide the Communities
 * tab stands on: where Tumblr decides that tab's button, and what the layout does until then.
 */
@Category(FixtureTests::class)
class BottomBarTabsFixtureTest {
    @Test
    fun `each declared build hands the tab list and the bar to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructionList().any { instruction ->
                    instruction.isDashboardBadge() || instruction.fieldRef()?.name.let { it == "Dashboard" || it == "top_nav_bar" }
                }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val hooks = context.resolveBottomBarTabs()
            val list = "${hooks.tabList.definingClass}->${hooks.tabList.name}"
            val bar = "${hooks.bar.definingClass}->${hooks.bar.name}"
            val listBefore = hooks.tabList.instructionList().map { it.opcode }
            val barBefore = hooks.bar.instructionList().map { it.opcode }

            bottomBarTabsHookPatch.execute(context)

            val listBody = context.mutableClassDefBy(hooks.tabList.definingClass).methods
                .single { it.name == hooks.tabList.name && it.parameterTypes == hooks.tabList.parameterTypes }
                .instructionList()
            assertEquals("$list: one call added", listBefore.size + 1, listBody.size)
            val arranged = listBody[hooks.tabListIndex]
            assertEquals(list, ARRANGE_TABS_HOOK, arranged.descriptor())
            assertEquals("$list: on the list it built", listOf(hooks.tabListRegister), arranged.namedRegisters())
            assertEquals("$list: right before the copy", Opcode.INVOKE_STATIC, listBody[hooks.tabListIndex + 1].opcode)
            assertEquals("$list: of the same list", listOf(hooks.tabListRegister), listBody[hooks.tabListIndex + 1].namedRegisters())
            assertEquals(list, Opcode.RETURN_OBJECT, listBody.last().opcode)
            assertEquals("$list: Tumblr's own code around it", listBefore,
                listBody.filterIndexed { index, _ -> index != hooks.tabListIndex }.map { it.opcode })

            val barBody = context.mutableClassDefBy(hooks.bar.definingClass).methods
                .single { it.name == hooks.bar.name && it.parameterTypes == hooks.bar.parameterTypes }
                .instructionList()
            assertEquals("$bar: one call added", barBefore.size + 1, barBody.size)
            assertEquals("$bar: right after the controller is built", "<init>", barBody[hooks.barIndex - 1].methodRef()?.name)
            val built = barBody[hooks.barIndex]
            assertEquals(bar, ARRANGE_BAR_HOOK, built.descriptor())
            assertEquals("$bar: on the controller's view", listOf(barBody[hooks.barIndex - 1].namedRegisters()[1]),
                built.namedRegisters())
            assertEquals("$bar: Tumblr's own code around it", barBefore,
                barBody.filterIndexed { index, _ -> index != hooks.barIndex }.map { it.opcode })

            for ((patch, flags) in listOf(
                hideExploreTabPatch to listOf("hideExploreTab", "exploreTab"),
                hideNotificationsTabPatch to listOf("hideNotificationsTab", "notificationsTab"),
                reorderBottomBarPatch to listOf("reorderTabs", "tabOrder"),
                hideCommunitiesTabPatch to listOf("hideCommunitiesTab", "communitiesTabFlags", "communitiesTabButton"),
            )) {
                patch.execute(context)
                for (flag in flags) {
                    val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                        .implementation!!.instructions.first()
                    assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
                }
            }
        }
    }

    /**
     * Why Hide the Communities tab takes the tab's button through the bar hook and leaves the tab's
     * flag to Tumblr. In each declared build one method of the bar's controller looks up the
     * Communities button and shows or hides it, on the flag the tab list is built by, and only the
     * controller's constructor runs it, for a tab that's in the list. With that flag answered off the
     * tab isn't in the list, so nothing decides the button. The extension therefore doesn't claim the
     * flag, hides the button by the name Tumblr looks it up by, and the bar hook comes right after
     * the constructor that method runs in.
     */
    @Test
    fun `each declared build decides the Communities button in its bar's constructor, on a flag left to Tumblr`() {
        val extension = ExtensionDex.classes()
        val hidden = extension.single { it.type == BOTTOM_BAR_TABS }.methods.flatMap { it.strings() }.toSet()
        assertTrue("BottomBarTabs hides the button by Tumblr's name for it", COMMUNITIES_BUTTON in hidden)
        val claimed = extension.single { it.type == FEATURE_SWITCHES }.methods.flatMap { it.strings() }.toSet()
        assertFalse("$COMMUNITIES_TAB_FLAG is claimed in the extension's table", COMMUNITIES_TAB_FLAG in claimed)

        for (build in Fixtures.declaredBuilds()) {
            val feature = FixtureDex.classesWhere(build, { true }) { method ->
                method.name == "<clinit>" && FEATURE_ENUM_TEXT in method.strings()
            }.single { it.superclass == "Ljava/lang/Enum;" }.type
            val classes = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructionList().any { instruction ->
                    instruction.isDashboardBadge() || instruction.fieldRef()?.name.let { it == "Dashboard" || it == "top_nav_bar" }
                }
            }
            val hooks = PatchContexts.of(extension + classes).resolveBottomBarTabs()
            val built = hooks.bar.instructionList()[hooks.barIndex - 1].methodRef()!!
            val controller = classes.single { it.type == built.definingClass }

            val deciders = controller.methods.filter { method ->
                val body = method.instructionList()
                body.any { it.viewIdRead() == COMMUNITIES_BUTTON } && body.any { it.methodRef()?.name == "setVisibility" }
            }
            assertEquals("${build.name}: one method of the bar shows or hides the Communities button", 1, deciders.size)
            val decider = deciders.single()
            assertEquals("${build.name}: on the tab's own flag", listOf(COMMUNITIES_TAB_FLAG), decider.flagsRead(feature))
            assertTrue("${build.name}: the tab list is built by the same flag", COMMUNITIES_TAB_FLAG in hooks.tabList.flagsRead(feature))

            val callers = FixtureDex.methodsWhere(build, { dex -> dex.methodSection.any { it.sameAs(decider) } }) { method ->
                method.instructionList().any { it.methodRef()?.sameAs(decider) == true }
            }
            assertEquals("${build.name}: only the bar's constructor runs it, and the bar hook follows that constructor",
                listOf("${built.definingClass}->${built.name}"), callers.map { "${it.definingClass}->${it.name}" })
        }
    }

    /**
     * The other half. The bar's layout keeps the Communities and Tumblr TV buttons gone until code
     * shows them, so a tab Tumblr leaves out of its list leaves no button behind. Tumblr 46.5.0.109
     * showed the Communities button until code hid it; hiding it after the controller runs covers
     * both layouts.
     */
    @Test
    fun `each declared build's bar layout keeps the Communities and Tumblr TV buttons gone until code shows them`() {
        for (build in Fixtures.declaredBuilds()) {
            ZipFile(build).use { zip ->
                val document = ResXmlDocument()
                zip.getInputStream(zip.getEntry(BAR_LAYOUT)).use(document::readBytes)
                val buttons = document.documentElement.elements.asSequence().map { it as ResXmlElement }.toList()
                val communities = buttons.single { it.idAttribute?.data == COMMUNITIES_BUTTON_ID }
                val tumblrTv = buttons.single { it.idAttribute?.data == TUMBLR_TV_BUTTON_ID }
                assertEquals("${build.name}: the Communities button starts gone", GONE,
                    communities.searchAttributeByResourceId(ANDROID_VISIBILITY)?.data)
                assertEquals("${build.name}: the Tumblr TV button starts gone", GONE,
                    tumblrTv.searchAttributeByResourceId(ANDROID_VISIBILITY).data)
            }
        }
    }

    /** The constants of Tumblr's feature enum, [feature], that the method reads. */
    private fun Method.flagsRead(feature: String): List<String> = instructionList().mapNotNull { instruction ->
        instruction.fieldRef()?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.definingClass == feature && it.type == feature }?.name
    }

    private fun Instruction.descriptor(): String? = methodRef()?.let {
        "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
    }
}
