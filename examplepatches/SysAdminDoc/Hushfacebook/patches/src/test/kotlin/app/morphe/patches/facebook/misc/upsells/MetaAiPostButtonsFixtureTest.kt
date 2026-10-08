/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.upsells

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide other Meta AI buttons under posts rides on Imagine me's hook in the post call-to-action
 * selector's check, which hands the extension the name the selector's table gives each plugin. On
 * every Facebook build the bundle declares, that table names each of the other Meta AI buttons as
 * a case's answer, the check the hook goes into is found and has a local register for it, and the
 * extension the patch merges in holds the same names. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class MetaAiPostButtonsFixtureTest {
    @Test
    fun `the selector's table names every other Meta AI button on each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val table = ctaTable(FixtureDex.classesHolding(bundle, IMAGINE_ME_PLUGIN))
                val code = table.implementation!!.instructions.toList()
                for (plugin in META_AI_POST_PLUGINS) {
                    val at = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == plugin }
                    assertTrue("$name: the CTA table doesn't name $plugin", at >= 0)
                    assertEquals("$name: $plugin isn't a case's answer", Opcode.RETURN_OBJECT, code[at + 1].opcode)
                }

                val socketHolders = FixtureDex.classesHolding(bundle, IMAGINE_CTA_SOCKET)
                val sockets = socketHolders.flatMap { methodsHolding(it, IMAGINE_CTA_SOCKET) }
                val calledTypes = sockets.flatMap { method ->
                    method.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                        .map { it.definingClass }
                }.toSet()
                val calledClasses = FixtureDex.classes(bundle, calledTypes)
                val check = ctaCheck(table, sockets) { calledClasses[it] }
                assertTrue("$name: the post button check has no local register for the hook",
                    check.implementation!!.registerCount - check.parameterTypes.size >= 1)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `the extension answers the same plugin names the patch documents`() {
        val methods = ExtensionDex.classes().flatMap { it.methods }
        for (plugin in META_AI_POST_PLUGINS) {
            assertTrue("the extension never names $plugin", methods.any { holdsString(it, plugin) })
        }
        assertTrue("the extension has no $META_UPSELLS", ExtensionDex.classDef(META_UPSELLS).methods.any { it.name == "hidesImagineCta" })
    }
}
