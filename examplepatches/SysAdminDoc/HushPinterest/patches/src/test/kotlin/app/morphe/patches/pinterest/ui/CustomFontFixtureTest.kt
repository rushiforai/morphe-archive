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
import app.morphe.patcher.patch.PatchException
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** ResourcesCompat's font loader and Pinterest's reads of Android's default fonts, in each declared APK (#51). */
@Category(FixtureTests::class)
class CustomFontFixtureTest {
    @Test
    fun `each declared APK hands every loaded font to the extension and reads the stand-ins for Android's defaults`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val loader = classes.flatMap { it.methods }.single { it.holds(FONT_RESOURCE) && it.typefaceReturn() }
            val before = loader.instructions()
            val exit = before.indices.single { before[it].opcode == Opcode.RETURN_OBJECT }
            val result = (before[exit] as OneRegisterInstruction).registerA
            val reads = defaultReads(classes)
            assertTrue("${build.name}: Pinterest reads Android's default fonts", reads.isNotEmpty())

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            customFontPatch.execute(context)
            assertEquals("${build.name}: customFont", 1, PinPageKit.flag(context, "customFont"))

            val after = PinPageKit.patched(context, loader)
            assertEquals("${build.name}: two instructions go in", before.size + 2, after.size)
            assertEquals(build.name, RESOURCE_FONT_HOOK, PinPageKit.target(after[exit]))
            // The id is the loader's second parameter, a static method's, so the register past the locals plus one.
            val id = loader.implementation!!.registerCount - loader.parameters().size + 1
            assertEquals("${build.name}: the typeface and the font's id", listOf(result, id), after[exit].namedRegisters())
            assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, after[exit + 1].opcode)
            assertEquals(build.name, result, (after[exit + 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.RETURN_OBJECT, after[exit + 2].opcode)
            assertEquals("${build.name}: the rest of the loader", PinPageKit.kinds(before), PinPageKit.kinds(after.filterIndexed { at, _ -> at != exit && at != exit + 1 }))

            var swapped = 0
            for ((method, at) in reads) {
                val body = PinPageKit.patched(context, method)
                val was = method.instructions()
                assertEquals("${build.name}: ${method.definingClass}->${method.name} keeps its length", was.size, body.size)
                for (index in at) {
                    val read = body[index]
                    val field = (read as ReferenceInstruction).reference as FieldReference
                    assertEquals(build.name, Opcode.SGET_OBJECT, read.opcode)
                    assertEquals("${build.name}: ${method.name} reads into the same register",
                        (was[index] as OneRegisterInstruction).registerA, (read as OneRegisterInstruction).registerA)
                    assertEquals(build.name, CUSTOM_FONT, field.definingClass)
                    assertEquals(build.name, STAND_INS[((was[index] as ReferenceInstruction).reference as FieldReference).name], field.name)
                    swapped++
                }
                val rest = was.indices.filter { it !in at }
                assertEquals("${build.name}: the rest of ${method.name}", rest.map { was[it].opcode }, rest.map { body[it].opcode })
            }
            assertEquals("${build.name}: every read of Android's default fonts", reads.sumOf { it.second.size }, swapped)
            assertTrue("${build.name}: none of Pinterest's reads are left",
                defaultReads(classes.map { context.mutableClassDefBy(it.type) }).isEmpty())
        }
    }

    @Test
    fun `a missing stub, hook, stand-in or loader refuses with nothing changed`() {
        val build = Fixtures.declaredBuilds().last()
        val classes = read(build)
        val loaderClass = classes.single { owner -> owner.methods.any { it.holds(FONT_RESOURCE) && it.typefaceReturn() } }
        fun customFontWithout(name: String) = ExtensionDex.classes().map { owner ->
            if (owner.type != CUSTOM_FONT) owner else ImmutableClassDef(
                owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations,
                owner.fields.filterNot { it.name == name }, owner.methods.filterNot { it.name == name },
            )
        }
        val cases = linkedMapOf(
            "no customFont stub" to (PinPageKit.extensionWithout("customFont") + classes to "customFont"),
            "no resourceFont hook" to (customFontWithout("resourceFont") + classes to "no public static resourceFont"),
            "no androidDefault stand-in" to (customFontWithout("androidDefault") + classes to "no field androidDefault"),
            "no font loader" to (ExtensionDex.classes() + classes.filter { it !== loaderClass } to "0 ResourcesCompat font loaders"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { customFontPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "customFont"))
            val present = input.map { it.type }.toSet()
            for (owner in classes.filter { it.type in present }) for (method in owner.methods.filter { it.implementation != null }) {
                assertEquals("$reason changed ${method.definingClass}->${method.name}",
                    method.instructions().map { it.render() }, PinPageKit.patched(context, method).map { it.render() })
            }
        }
    }

    /** Each method reading Typeface.DEFAULT, SANS_SERIF or DEFAULT_BOLD, with the index of each read. */
    private fun defaultReads(classes: List<ClassDef>): List<Pair<Method, List<Int>>> = classes.flatMap { it.methods }.mapNotNull { method ->
        val body = method.instructions()
        val at = body.indices.filter { body[it].readsAndroidDefault() }
        if (at.isEmpty()) null else method to at
    }

    private fun Instruction.readsAndroidDefault(): Boolean {
        if (opcode != Opcode.SGET_OBJECT) return false
        val field = (this as ReferenceInstruction).reference as? FieldReference ?: return false
        return field.definingClass == TYPEFACE && field.type == TYPEFACE && field.name in STAND_INS
    }

    private fun Method.holds(text: String) = instructions().any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == text }

    private fun Method.typefaceReturn() = returnType == TYPEFACE && parameters().size == 7

    /** An instruction by what it does: opcode, registers and reference. */
    private fun Instruction.render(): String = buildString {
        append(opcode).append(namedRegisters())
        (this@render as? ReferenceInstruction)?.let { append(" ").append(it.reference) }
    }

    /** ResourcesCompat's font loader's class and every class of Pinterest's that reads one of Android's default fonts. */
    private fun read(build: java.io.File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            (method.holds(FONT_RESOURCE) && method.typefaceReturn()) || method.instructions().any { it.readsAndroidDefault() }
        }.filterNot { it.type.startsWith("Lapp/hushpinterest/") }
        check(found.isNotEmpty()) { "${build.name}: nothing loads a font resource or reads Android's default fonts" }
        return found
    }
}

/** The extension's stand-in for each of Android's default fonts, by the field Pinterest reads. */
private val STAND_INS = mapOf("DEFAULT" to "androidDefault", "SANS_SERIF" to "androidSansSerif", "DEFAULT_BOLD" to "androidDefaultBold")
