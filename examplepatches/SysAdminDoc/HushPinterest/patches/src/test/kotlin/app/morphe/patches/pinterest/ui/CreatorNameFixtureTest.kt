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
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The pin page's creator row and the collector that draws its state, in each declared APK. */
@Category(FixtureTests::class)
class CreatorNameFixtureTest {
    @Test
    fun `each declared APK hands the creator row's avatar over where every branch of its drawing meets`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val row = classes.single { it.type == CREATOR_ATTRIBUTION }
            val avatar = row.fields.single { it.type == GESTALT_AVATAR }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            hideCreatorNamePatch.execute(context)
            for (flag in listOf("hideCreatorName", "creatorName")) assertEquals("${build.name}: $flag", 1, flag(context, flag))

            val hooked = classes.flatMap { owner -> owner.methods.filter { it.implementation != null } }.mapNotNull { method ->
                val body = patched(context, method)
                body.indices.filter { (body[it] as? ReferenceInstruction)?.reference?.toString() == CREATOR_NAME_HOOK }
                    .takeIf { it.isNotEmpty() }?.let { method to it }
            }
            assertEquals("${build.name}: one hook in the whole row's code", 1, hooked.sumOf { it.second.size })
            val (method, sites) = hooked.single()
            assertTrue("${build.name}: the collector isn't the row itself", method.definingClass != CREATOR_ATTRIBUTION)
            val at = sites.single()
            val clean = method.implementation!!.instructions.toList()
            val body = patched(context, method)

            // The hook takes the avatar, read from the register the row's padding reads the row from.
            val read = body[at - 1]
            assertEquals(build.name, Opcode.IGET_OBJECT, read.opcode)
            assertEquals(build.name, "$CREATOR_ATTRIBUTION->${avatar.name}:$GESTALT_AVATAR", (read as ReferenceInstruction).reference.toString())
            val hook = body[at] as FiveRegisterInstruction
            assertEquals(build.name, 1, hook.registerCount)
            assertEquals(build.name, (read as TwoRegisterInstruction).registerA, hook.registerC)
            val layout = body[at + 1]
            assertEquals(build.name, Opcode.IGET_OBJECT, layout.opcode)
            val layoutField = (layout as ReferenceInstruction).reference as FieldReference
            assertEquals(build.name, CREATOR_ATTRIBUTION, layoutField.definingClass)
            assertEquals(build.name, "Landroid/widget/LinearLayout;", layoutField.type)
            assertEquals(build.name, (layout as TwoRegisterInstruction).registerB, read.registerB)
            assertEquals("${build.name}: the padding follows", "Landroid/view/View;->setPaddingRelative(IIII)V",
                (body[at + 5] as ReferenceInstruction).reference.toString())
            assertTrue("${build.name}: the scratch isn't the row", read.registerA != read.registerB)

            // Every jump that went to the padding now lands on the avatar read, so every branch passes the hook.
            val branches = body.filterIsInstance<BuilderOffsetInstruction>()
            assertEquals("${build.name}: nothing jumps past the hook", emptyList<Instruction>(),
                branches.filter { it.target.location.instruction === layout || it.target.location.instruction === body[at] })
            assertTrue("${build.name}: branches meet at the hook", branches.count { it.target.location.instruction === read } >= 2)
            // Five more code units move the switch payload, so the nop that aligned it can go.
            assertEquals("${build.name}: Pinterest's own code is unchanged", clean.map { it.opcode }.filter { it != Opcode.NOP },
                (body.take(at - 1) + body.drop(at + 1)).map { it.opcode }.filter { it != Opcode.NOP })
        }
    }

    @Test
    fun `a missing row, avatar field, drawing point or status stub refuses with the collector untouched`() {
        val build = Fixtures.declaredBuilds().last()
        val classes = read(build)
        val extension = ExtensionDex.classes()
        val row = classes.single { it.type == CREATOR_ATTRIBUTION }
        fun without(stub: String) = classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                owner.annotations, owner.fields, owner.methods.filterNot { it.name == stub }) }
        val noAvatar = ImmutableClassDef(row.type, row.accessFlags, row.superclass, row.interfaces, row.sourceFile,
            row.annotations, row.fields.filterNot { it.type == GESTALT_AVATAR }, row.methods)
        val cases = linkedMapOf(
            "missing row" to (extension + classes.filter { it.type != CREATOR_ATTRIBUTION } to CREATOR_ATTRIBUTION),
            "missing avatar field" to (extension + classes.map { if (it.type == CREATOR_ATTRIBUTION) noAvatar else it } to "avatar field"),
            "missing collector" to (extension + listOf(row) to "the point where the creator row's state has been drawn"),
            "missing hideCreatorName stub" to (without("hideCreatorName") to "hideCreatorName"),
            "missing creatorName stub" to (without("creatorName") to "creatorName"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { hideCreatorNamePatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (name in listOf("hideCreatorName", "creatorName")) {
                if (context.mutableClassDefBy(SETTINGS_STATUS).methods.any { it.name == name }) {
                    assertEquals("$reason left $name set", 0, flag(context, name))
                }
            }
            for (owner in input.filter { it in classes }) for (method in owner.methods.filter { it.implementation != null }) {
                assertEquals("$reason changed ${owner.type}->${method.name}", method.implementation!!.instructions.map { it.opcode },
                    patched(context, method).map { it.opcode })
            }
        }
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    /** The row, and every class with a method that reads one of the row's fields and pads a view. */
    private fun read(build: java.io.File): List<ClassDef> {
        val row = FixtureDex.classes(build, setOf(CREATOR_ATTRIBUTION))[CREATOR_ATTRIBUTION]
            ?: error("${build.name}: no creator row")
        val users = FixtureDex.classesWhere(build, { true }) { method ->
            val body = method.implementation?.instructions?.toList().orEmpty()
            body.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == CREATOR_ATTRIBUTION } &&
                body.any { (it as? ReferenceInstruction)?.reference?.toString() == "Landroid/view/View;->setPaddingRelative(IIII)V" }
        }.filter { it.type != CREATOR_ATTRIBUTION }
        check(users.isNotEmpty()) { "${build.name}: nothing draws the creator row" }
        return listOf(row) + users
    }
}
