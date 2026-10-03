/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.story

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.isStringTableCall
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Download any story's save action, found in every Facebook build the bundle declares the way the
 * patch finds it: one method among the types the story viewer's "More" menu creates reports
 * "save_story_attempted" (a literal on 577 and 580, a string table entry on 581), its class holds
 * one context and one story, and one menu method creates it. The control is the same search
 * without the menu: on 581 the composer's InspirationSaveButtonController names the event in a
 * method of the same shape, which is why the search starts at the menu. Reads the fixture bundles
 * from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class SaveStoryActionFixtureTest {
    @Test
    fun `every declared build has one save action among the story menu's types, created by one menu method`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val menu = FixtureDex.classes(bundle, setOf(STORY_VIEWER_MORE_MENU)).getValue(STORY_VIEWER_MORE_MENU)
                val created = FixtureDex.classes(bundle, typesCreated(menu))
                val tables = FixtureDex.classes(bundle, tableTypes(created.values))
                val resolve = { call: MethodReference -> tables[call.definingClass]?.let { resolveStatic(it, call) } }

                val actions = created.values.flatMap { owner -> owner.methods.filter { isSaveStoryAction(it, resolve) } }
                assertEquals("$name: save actions among the menu's types: ${actions.map { "${it.definingClass}->${it.name}" }}",
                    1, actions.size)
                val action = created.getValue(actions.single().definingClass)
                for (type in listOf("Landroid/content/Context;", STORY_CARD)) {
                    assertEquals("$name: ${action.type}'s fields of $type", 1, action.fields.count { it.type == type })
                }
                val builders = menu.methods.filter { method ->
                    method.implementation?.instructions?.toList().orEmpty().any {
                        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == action.type
                    }
                }
                assertEquals("$name: menu methods creating ${action.type}", 1, builders.size)
                checked[version] = "${action.type} from ${builders.single().name}"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions.toSet(), checked.keys)
    }

    /** The control: on 581 a method the menu doesn't create has the action's shape and names the event too. */
    @Test
    fun `on 581 the composer's save button names the event in the same shape, outside the menu's types`() {
        val version = "581.0.0.45.58"
        if (version !in AppCompatibilities.facebook().single().targets.mapNotNull { it.version }) return
        for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
            val composer = "Lcom/facebook/inspiration/saving/InspirationSaveButtonController;"
            val owner = FixtureDex.classes(bundle, setOf(composer)).getValue(composer)
            val tables = FixtureDex.classes(bundle, tableTypes(listOf(owner)))
            val resolve = { call: MethodReference -> tables[call.definingClass]?.let { resolveStatic(it, call) } }
            assertTrue("${bundle.name}: $composer has no method shaped like the save action",
                owner.methods.any { isSaveStoryAction(it, resolve) })
            val menu = FixtureDex.classes(bundle, setOf(STORY_VIEWER_MORE_MENU)).getValue(STORY_VIEWER_MORE_MENU)
            assertTrue("${bundle.name}: the story menu creates $composer", composer !in typesCreated(menu))
        }
    }

    /** The string tables [owners]' methods call. */
    private fun tableTypes(owners: Collection<ClassDef>): Set<String> = owners.flatMap { owner ->
        owner.methods.flatMap { method -> method.implementation?.instructions?.toList().orEmpty().filter(::isStringTableCall) }
    }.mapNotNull { ((it as ReferenceInstruction).reference as? MethodReference)?.definingClass }.toSet()
}
