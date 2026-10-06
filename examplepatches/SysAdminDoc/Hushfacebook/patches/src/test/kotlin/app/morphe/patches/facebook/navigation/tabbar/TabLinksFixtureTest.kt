/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.tabbar

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.navigation.starttab.TAB_TAG
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The tab links on every Facebook build the bundle declares: one static method picks the configured
 * tab a started page belongs to, FriendsUriMapHelper has one switch to the configured Friends tab,
 * FbMainTabActivityUriHelper has one target_tab_id check against the configured tabs, and the patch,
 * run on the build's own classes, asks the extension at each, reading the registers Facebook already
 * holds. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class TabLinksFixtureTest {
    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    private fun assertTabHook(name: String, code: List<Instruction>, hook: TabHook, extension: String) {
        val asks = code[hook.at]
        assertEquals("$name: the call", extension, asks.reference)
        assertEquals("$name: what the call reads", listOf(hook.tab), asks.callRegisters())
        assertEquals("$name: the answer kept", Opcode.MOVE_RESULT_OBJECT, code[hook.at + 1].opcode)
        assertEquals("$name: the answer's register", hook.tab, (code[hook.at + 1] as OneRegisterInstruction).registerA)
        assertEquals("$name: the answer cast back", Opcode.CHECK_CAST, code[hook.at + 2].opcode)
        assertEquals("$name: cast to", TAB_TAG, code[hook.at + 2].reference)
    }

    @Test
    fun `each declared build looks a link's tab up where the patch asks, and the patch goes in there`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = fixture.name
                val lookups = mutableListOf<Pair<Method, TabHook>>()
                val owners = mutableMapOf<String, ClassDef>()
                FixtureDex.forEach(fixture) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.type == FRIENDS_URI_HELPER || classDef.type == MAIN_TAB_URI_HELPER) {
                            owners[classDef.type] = ImmutableClassDef.of(classDef)
                        }
                        for (method in classDef.methods) {
                            val hook = launchedTabLookup(method) ?: continue
                            lookups += method to hook
                            owners[classDef.type] = ImmutableClassDef.of(classDef)
                        }
                    }
                }
                assertEquals("$name: launched tab lookups", 1, lookups.size)
                val friends = owners.getValue(FRIENDS_URI_HELPER).methods.mapNotNull { m -> friendsTabMatch(m)?.let { m to it } }
                assertEquals("$name: switches to the configured Friends tab", 1, friends.size)
                val checks = owners.getValue(MAIN_TAB_URI_HELPER).methods.mapNotNull { m -> configuredTabCheck(m)?.let { m to it } }
                assertEquals("$name: target_tab_id checks against the configured tabs", 1, checks.size)

                val context = PatchContexts.of(owners.values.toList())
                tabLinksPatch.execute(context)
                fun patched(method: Method) = context.mutableClassDefBy(method.definingClass).methods.single {
                    it.name == method.name && it.parameterTypes.map(CharSequence::toString) ==
                        method.parameterTypes.map(CharSequence::toString)
                }.implementation!!.instructions.toList()

                val (lookup, launched) = lookups.single()
                assertTabHook("$name launched tab", patched(lookup), launched, LAUNCHED_TAB)
                val (friendsMethod, friendsHook) = friends.single()
                assertTabHook("$name Friends link", patched(friendsMethod), friendsHook, FRIENDS_TAB)
                val (checkMethod, check) = checks.single()
                val code = patched(checkMethod)
                assertEquals("$name: the check's call", CONFIGURES_TAB, code[check.at].reference)
                assertEquals("$name: what the check's call reads", listOf(check.answer, check.tab), code[check.at].callRegisters())
                assertEquals(Opcode.MOVE_RESULT, code[check.at + 1].opcode)
                assertEquals("$name: the check's answer", check.answer, (code[check.at + 1] as OneRegisterInstruction).registerA)
                assertTrue("$name: a register past v15", listOf(launched.tab, friendsHook.tab, check.answer, check.tab).all { it <= 15 })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
