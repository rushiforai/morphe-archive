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
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** Pinterest's closeup modules and the title row they build, in each declared APK. */
@Category(FixtureTests::class)
class ShowPostedDateFixtureTest {
    /** Every closeup module, and every class whose constructor finds the title row's chevron. */
    private class Build(val name: String, val modules: List<ClassDef>, val rows: List<ClassDef>, val frameworkBase: String?) {
        val classes get() = modules + rows
    }

    @Test
    fun `each declared APK hands the title module and its pin to the extension first`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val updates = build.modules.flatMap { owner -> owner.methods.filter { it.name == "updatePin" && HOLISTIC_METADATA in it.strings() } }
            assertTrue("${build.name}: the description module checks the same experiment", updates.size > 1)
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            showPostedDatePatch.execute(context)
            for (flag in listOf("showPostedDate", "postedDate")) assertEquals("${build.name}: $flag", 1, flag(context, flag))

            // A count can't tell: on 14.43.0 the hook pushes a switch payload off its boundary and the
            // padding nop in front of it goes, so the method keeps its length.
            val hooked = updates.filter { ((patched(context, it).first() as? ReferenceInstruction)?.reference)?.toString() == POSTED_DATE_HOOK }
            val clean = hooked.singleOrNull() ?: error("${build.name}: ${hooked.size} title modules hooked")
            val body = patched(context, clean)
            val hook = body[0]
            assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals(build.name, POSTED_DATE_HOOK, (hook as ReferenceInstruction).reference.toString())
            val registers = clean.implementation!!.registerCount
            assertEquals("${build.name}: the module, then the pin", registers - 2, (hook as RegisterRangeInstruction).startRegister)
            assertEquals(build.name, 2, hook.registerCount)
            assertEquals("${build.name}: Pinterest's own update follows", unpadded(clean.instructions()), unpadded(body.drop(1)))
            assertEquals("${build.name}: the extension only adds its line to a LinearLayout", "Landroid/widget/LinearLayout;", build.frameworkBase)
        }
    }

    @Test
    fun `a missing title row, module or status stub refuses with every module untouched`() {
        val build = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        fun without(stub: String) = build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                owner.annotations, owner.fields, owner.methods.filterNot { it.name == stub }) }
        val title = "$PATCH_NAME: closeup title module: expected one exact target, found 0"
        val cases = linkedMapOf(
            "missing title row" to (extension + build.modules to title),
            "missing closeup modules" to (extension + build.rows to title),
            "missing showPostedDate stub" to (without("showPostedDate") to "showPostedDate"),
            "missing postedDate stub" to (without("postedDate") to "postedDate"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { showPostedDatePatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.singleOrNull { it.name == "showPostedDate" }
            if (status != null) assertEquals("$reason left the family flag set", 0, flag(context, "showPostedDate"))
            for (owner in build.modules.filter { module -> input.any { it.type == module.type } }) {
                for (method in owner.methods.filter { it.name == "updatePin" }) {
                    assertEquals("$reason changed ${owner.type}", method.instructions().map { it.opcode }, patched(context, method).map { it.opcode })
                }
            }
        }
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    /** The opcodes without the nop that only pads a payload onto its 4-byte boundary. */
    private fun unpadded(body: List<Instruction>) = body.filterIndexed { at, instruction ->
        instruction.opcode != Opcode.NOP || body.getOrNull(at + 1)?.opcode !in PAYLOADS
    }.map { it.opcode }

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    private fun read(build: File): Build {
        val modules = mutableListOf<ClassDef>()
        val rows = mutableListOf<ClassDef>()
        val parents = mutableMapOf<String, String?>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                parents[classDef.type] = classDef.superclass
                if (classDef.superclass == CLOSEUP_MODULE) modules += ImmutableClassDef.of(classDef)
                else if (classDef.methods.any { it.name == "<init>" && it.instructions().any { read -> read.readsId(TITLE_CHEVRON_ID) } }) {
                    rows += ImmutableClassDef.of(classDef)
                }
            }
        }
        check(modules.isNotEmpty()) { "${build.name}: no closeup modules" }
        check(rows.isNotEmpty()) { "${build.name}: nothing finds the title chevron" }
        // The first ancestor outside the APK is what the extension gets handed.
        var outside: String? = CLOSEUP_MODULE
        while (outside != null && outside in parents) outside = parents[outside]
        return Build(build.name, modules, rows, outside)
    }

    private companion object {
        const val PATCH_NAME = "Show posted date"
        val PAYLOADS = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    }
}
