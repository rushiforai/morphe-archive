/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** #48: the parser of the row under the search bar, in each declared APK. */
@Category(FixtureTests::class)
class SearchSuggestionsFixtureTest {
    @Test
    fun `each declared APK asks about each module right after the row parser casts it`() {
        for (build in Fixtures.declaredBuilds()) {
            val readers = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ONE_BAR_MODULES }
            }
            assertTrue("${build.name}: readers of $ONE_BAR_MODULES", readers.size >= 2)
            val parsers = readers.flatMap { it.methods }.flatMap { it.instructions() }
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .filter { it.returnType == "Ljava/util/ArrayList;" && it.parameterTypes.size == 1 }.map { it.definingClass }.toSet()
            val context = PatchContexts.of(ExtensionDex.classes() + (readers + FixtureDex.classes(build, parsers).values).distinctBy { it.type })

            val site = context.searchSuggestionSite()
            assertEquals("${build.name}: the parser hands back a list", "Ljava/util/ArrayList;", site.method.returnType)
            val clean = site.method.implementation!!.instructions.toList()
            assertEquals("${build.name}: the hook follows the cast", Opcode.CHECK_CAST, clean[site.index - 1].opcode)
            assertEquals(build.name, site.module, (clean[site.index - 1] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: a yes goes back to hasNext", "Ljava/util/Iterator;->hasNext()Z",
                (clean[site.next] as ReferenceInstruction).reference.toString())

            context.hideSearchSuggestions()
            assertEquals("${build.name}: searchSuggestions", 1, flag(context, "searchSuggestions"))
            val body = context.mutableClassDefBy(site.method.definingClass).methods.single {
                it.name == site.method.name && it.parameterTypes == site.method.parameterTypes
            }.implementation!!.instructions.toList()
            val ask = body[site.index]
            assertEquals(build.name, SEARCH_SUGGESTION_HOOK, (ask as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the module goes in", listOf(site.module, 1),
                listOf((ask as RegisterRangeInstruction).startRegister, ask.registerCount))
            assertEquals(build.name, Opcode.MOVE_RESULT, body[site.index + 1].opcode)
            val answer = (body[site.index + 1] as OneRegisterInstruction).registerA
            assertEquals(build.name, Opcode.IF_NEZ, body[site.index + 2].opcode)
            assertEquals(build.name, answer, (body[site.index + 2] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: a yes takes the next module", address(body, site.next),
                address(body, site.index + 2) + (body[site.index + 2] as OffsetInstruction).codeOffset)
            assertTrue("${build.name}: the answer borrows a local", answer != site.module &&
                answer < site.method.implementation!!.registerCount - site.method.parameterTypes.size)
            assertEquals("${build.name}: the parser is unchanged", clean.map { it.opcode },
                (body.take(site.index) + body.drop(site.index + 3)).map { it.opcode })
        }
    }

    private fun address(instructions: List<Instruction>, at: Int) = instructions.take(at).sumOf { it.codeUnits }

    private fun flag(context: app.morphe.patcher.patch.BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral
}
