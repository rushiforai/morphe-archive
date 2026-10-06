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
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/** Pinterest's image model and its rendition chooser in both APKs. */
class OriginalImagesFixtureTest {
    @Test
    fun `each declared original APK answers the original rendition first behind the switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val model = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + model)
            originalImagesPatch.execute(context)
            for (flag in listOf("originalImages", "imageChooser")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
            val description = model.methods.single { it.name == "toString" }
            val original = description.imageLabels().getValue(IMAGE_ORIGINAL)
            val large = description.imageLabels().getValue(IMAGE_DESCRIPTION)
            val chooser = context.mutableClassDefBy(model.type).methods.single { method ->
                method.parameterTypes.isEmpty() && method.returnType == large.type && method.name != "toString"
            }
            val body = chooser.implementation!!.instructions.toList()
            assertEquals(build.name, "$UI_HOOKS->originalImages()Z", (body[0] as ReferenceInstruction).reference.toString())
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT),
                body.subList(1, 6).map { it.opcode })
            assertEquals(build.name, original.toString(), (body[3] as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the original order follows", large.toString(), (body[6] as ReferenceInstruction).reference.toString())
        }
    }

    @Test
    fun `a missing model, a changed chooser or a missing status stub refuses before any change`() {
        val model = read(Fixtures.declaredBuilds().last())
        val large = model.methods.single { it.name == "toString" }.imageLabels().getValue(IMAGE_DESCRIPTION)
        val renamed = ImmutableClassDef(model.type, model.accessFlags, model.superclass, model.interfaces, model.sourceFile,
            model.annotations, model.fields, model.methods.map { method ->
                if (method.name != "toString") method else ImmutableMethod(method.definingClass, method.name, method.parameters,
                    method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(method.implementation!!.registerCount, method.implementation!!.instructions.map {
                        val text = ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                        if (text == IMAGE_DESCRIPTION) ImmutableInstruction10x(Opcode.NOP) else it
                    }, null, null))
            })
        val reordered = ImmutableClassDef(model.type, model.accessFlags, model.superclass, model.interfaces, model.sourceFile,
            model.annotations, model.fields, model.methods.map { method ->
                val instructions = method.implementation?.instructions?.toList()
                val chooser = method.name != "toString" && method.parameterTypes.isEmpty() && method.returnType == large.type
                if (!chooser || instructions == null) method else ImmutableMethod(method.definingClass, method.name, method.parameters,
                    method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(method.implementation!!.registerCount,
                        listOf(ImmutableInstruction10x(Opcode.NOP)) + instructions, null, null))
            })
        val extension = ExtensionDex.classes()
        val cases = linkedMapOf(
            "missing model" to extension,
            "renamed description" to extension + renamed,
            "chooser no longer starts with the large rendition" to extension + reordered,
            "missing status stub" to listOf(model) + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "imageChooser" }) },
        )
        for ((reason, input) in cases) {
            val context = PatchContexts.of(input)
            assertThrows(reason, PatchException::class.java) { originalImagesPatch.execute(context) }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.singleOrNull { it.name == "originalImages" }
            assertEquals("$reason left the family flag set", 0, (status!!.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    /** The one class whose description names the four image renditions. */
    private fun read(build: File): ClassDef {
        var model: ClassDef? = null
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                val described = classDef.methods.any { method -> method.name == "toString" && method.implementation?.instructions?.any {
                    ((it as? Instruction21c)?.reference as? StringReference)?.string == IMAGE_DESCRIPTION } == true }
                if (described) {
                    check(model == null) { "${build.name}: two image models" }
                    model = ImmutableClassDef.of(classDef)
                }
            }
        }
        return checkNotNull(model) { "${build.name}: no image model" }
    }
}
