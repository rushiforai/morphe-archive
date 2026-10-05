/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.PatchLogCapture
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class UiFixtureTest {
    private val patches = listOf(
        hideScreenshotSharePatch, hideSearchHistoryPatch, hideNavigationButtonsPatch, hideHeaderButtonsPatch,
        hidePinMenuItemsPatch, hideCommentsPatch, quietEmailReminderPatch, disableUpdateNagPatch,
    )
    private val flags = listOf(
        "hideScreenshotShare" to "screenshotShare", "hideSearchHistory" to "searchHistory",
        "hideNavigationButtons" to "navigationButtons", "hideHeaderButtons" to "headerButtons",
        "hidePinMenuItems" to "pinMenuItems", "hideComments" to "comments",
        "quietEmailReminder" to "emailReminder", "disableUpdateNag" to "updateNag",
    )

    @Test fun `every interface family matches each supported vendor build without a warning`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val commentsModules = classes.filter { it.isCommentsModule() }
            assertEquals("${build.name}: dedicated comments module count", 2, commentsModules.size)
            val unifiedComments = commentsModules.single { it.fields.any { field -> field.type == COMMENT_PREVIEW } }
            val rejectedComments = PatchContexts.of(ExtensionDex.classes() + classes)
            rejectedComments.mutableClassDefBy(unifiedComments.type).fields.removeAll { it.type == COMMENT_PREVIEW }
            val wrongScope = assertThrows(PatchException::class.java) { hideCommentsPatch.execute(rejectedComments) }
            assertTrue(wrongScope.message, wrongScope.message.orEmpty().contains("dedicated layout"))
            assertFlag(rejectedComments, "hideComments", false)
            assertFlag(rejectedComments, "comments", false)
            val hasUpdateManager = classes.any { it.type.startsWith("Lcom/google/android/play/core/appupdate/") }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val warnings = PatchLogCapture.warnings { patches.forEach { it.execute(context) } }
            assertEquals("${build.name} warnings", emptyList<String>(), warnings)
            for ((family, capability) in flags) {
                val installed = family != "disableUpdateNag" || hasUpdateManager
                assertFlag(context, family, installed)
                assertFlag(context, capability, installed)
            }
            for (type in SEARCH_HISTORY_VIEWS + COMMENT_PREVIEW + commentsModules.map { it.type }) {
                val view = context.mutableClassDefBy(type)
                for (name in listOf("setVisibility", "onMeasure")) {
                    val own = view.methods.single { it.name == name && it.returnType == "V" }
                    assertTrue("${build.name}: $type->$name has no extension hook",
                        own.calls().any { it.definingClass == UI_HOOKS })
                }
            }
            val closeups = classes.filter { owner ->
                owner.methods.any { "unifiedCommentsModulePresenterFactory" in it.strings() } ||
                    owner.type == "Lcom/pinterest/activity/pin/view/modules/PinCloseupVideoModule;"
            }
            assertTrue("${build.name}: missing closeup controls", closeups.size >= 2)
            for (original in closeups) {
                val closeup = context.mutableClassDefBy(original.type)
                assertEquals("${build.name}: ${original.type} method count changed", original.methods.count(), closeup.methods.size)
                assertTrue("${build.name}: ${original.type} must keep pin media and non-comment modules visible",
                    closeup.methods.none { it.calls().any { call -> call.definingClass == UI_HOOKS } })
            }
            val header = context.mutableClassDefBy(HEADER_BAR).methods.single { it.name == "onMeasure" }
            assertTrue(header.calls().any { it.definingClass == INTERFACE_CONTROLS && it.name == "headerButtons" })
            val menuType = context.classDefBy(PIN_MENU).fields.single { it.name == "modalView" }.type
            val menu = context.mutableClassDefBy(menuType).methods.single { it.name == "<init>" }
            assertTrue("${build.name} pin-menu entry hooks",
                menu.calls().count { it.definingClass == INTERFACE_CONTROLS && it.name == "pinMenuItem" } >= 4)
            assertTrue(menu.strings().containsAll(FILTERABLE_PIN_MENU_TITLES))
            val navType = classes.single { owner ->
                owner.methods.any { "BottomNavBar tab insertion out of range" in it.strings() }
            }.type
            val nav = context.mutableClassDefBy(navType)
            assertEquals(1, nav.methods.sumOf { method ->
                method.calls().count { it.definingClass == INTERFACE_CONTROLS && it.name == "bindNavigation" }
            })
            assertTrue(nav.methods.single { it.name == "onMeasure" }.calls().any {
                it.definingClass == INTERFACE_CONTROLS && it.name == "refreshNavigation"
            })
            if (hasUpdateManager) {
                val original = classes.flatMap { it.methods }.single { "inAppUpdateManager" in it.strings() }
                val modified = context.mutable(original)
                assertEquals("the shared coroutine's other task must keep its dispatcher", original.instructions()[0].opcode,
                    modified.instructions()[0].opcode)
                assertEquals(1, modified.calls().count { it.definingClass == UI_HOOKS && it.name == "disableUpdateNag" })
            }
        }
    }

    @Test fun `a missing family status refuses before changing any vendor method`() {
        for ((index, patch) in patches.withIndex()) {
            val context = PatchContexts.of(ExtensionDex.classes())
            val family = flags[index].first
            context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == family }
            val failure = assertThrows(PatchException::class.java) { patch.execute(context) }
            assertTrue(failure.message, failure.message.orEmpty().contains(family))
            assertFlag(context, flags[index].second, false)
        }
    }

    private fun read(build: File): List<ClassDef> {
        val anchors = setOf("sg_android_new_screenshot_api_14", "BottomNavTabModel(type=",
            "BottomNavBar tab insertion out of range", "confirmEmailButton", "inAppUpdateManager",
            "unifiedCommentsModulePresenterFactory", "CommentsZone(isVisible=")
        val required = (SEARCH_HISTORY_VIEWS + COMMENT_PREVIEW + HEADER_BAR + PIN_MENU +
            "Lcom/pinterest/activity/pin/view/modules/PinCloseupVideoModule;").toSet()
        val found = mutableMapOf<String, ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                val match = owner.type in required || owner.isCommentsModule() ||
                    owner.type.startsWith("Lcom/google/android/play/core/appupdate/") ||
                    (owner.superclass == "Ljava/lang/Enum;" && owner.fields.map { it.name }
                        .containsAll(listOf("HOME", "PROFILE", "CREATE", "NOTIFICATIONS"))) ||
                    owner.methods.any { method -> method.strings().any { it in anchors } ||
                        method.fields().any { it.name in FILTERABLE_PIN_MENU_TITLES ||
                            it.name == "email_verification_reminder_title" } }
                if (match) found[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        // Include every application superclass so final inherited methods are checked before an override is added.
        var parents = found.values.mapNotNull { it.superclass }.toSet() - found.keys
        while (parents.isNotEmpty()) {
            val loaded = FixtureDex.classes(build, parents)
            found += loaded
            parents = loaded.values.mapNotNull { it.superclass }.toSet() - found.keys
        }
        assertFalse("${build.name}: no vendor targets", found.isEmpty())
        return found.values.toList()
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, enabled: Boolean) {
        val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions().first()
        assertEquals(name, Opcode.CONST_4, first.opcode)
        assertEquals(name, if (enabled) 1 else 0, (first as NarrowLiteralInstruction).narrowLiteral)
    }
}
