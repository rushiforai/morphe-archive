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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/** Pinterest's collage image model, pin closeup builder and pin image size set in both APKs. */
class OriginalImagesFixtureTest {
    /** The classes the patch reads in one build: the image model, the closeup builder's class and the size bucket. */
    private class Build(val name: String, val model: ClassDef, val builder: ClassDef, val bucket: ClassDef) {
        val classes get() = listOf(model, builder, bucket)
    }

    @Test
    fun `each declared original APK answers the original rendition first behind the switch`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            originalImagesPatch.execute(context)
            for (flag in listOf("originalImages", "imageChooser", "closeupImage")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
            val description = build.model.methods.single { it.name == "toString" }
            val original = description.imageLabels().getValue(IMAGE_ORIGINAL)
            val large = description.imageLabels().getValue(IMAGE_DESCRIPTION)
            val chooser = context.mutableClassDefBy(build.model.type).methods.single { method ->
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
    fun `each declared original APK asks for the original with pins and shows it in the closeup`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val clean = build.builder.methods.single { it.closeupHelper() != null }
            val (helper, large) = clean.closeupHelper()!!
            val image = (clean.instructions()[helper + 1] as OneRegisterInstruction).registerA
            val pin = clean.implementation!!.registerCount - 1
            val sizeSet = build.bucket.methods.single { it.returnType == "Ljava/util/HashSet;" && it.parameterTypes.isEmpty() }
            val exit = sizeSet.instructions().indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
            val set = (sizeSet.instructions()[exit] as OneRegisterInstruction).registerA
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            originalImagesPatch.execute(context)

            val closeup = patched(context, clean)
            val hook = closeup[helper + 2]
            assertEquals(build.name, "$UI_HOOKS->closeupImage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                (hook as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the pin, then its large image", listOf(pin, image), registers(hook))
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST), closeup.subList(helper + 3, helper + 5).map { it.opcode })
            assertEquals(build.name, listOf(image, image), closeup.subList(helper + 3, helper + 5).map { (it as OneRegisterInstruction).registerA })
            assertEquals(build.name, large.returnType, (closeup[helper + 4] as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the closeup's own code follows", clean.instructions().drop(helper + 2).map { it.opcode },
                closeup.drop(helper + 5).map { it.opcode })

            val sizes = patched(context, sizeSet)
            assertEquals(build.name, "$UI_HOOKS->imageSizes(Ljava/util/Set;)V", (sizes[exit] as ReferenceInstruction).reference.toString())
            assertEquals(build.name, listOf(set), registers(sizes[exit]))
            assertEquals(build.name, Opcode.RETURN_OBJECT, sizes[exit + 1].opcode)
            assertEquals("${build.name}: one hook in the size set", sizeSet.instructions().size + 1, sizes.size)
        }
    }

    @Test
    fun `a missing model, a changed chooser or a missing status stub refuses before any change`() {
        val build = read(Fixtures.declaredBuilds().last())
        val model = build.model
        val large = model.methods.single { it.name == "toString" }.imageLabels().getValue(IMAGE_DESCRIPTION)
        val renamed = replace(model, { it.name == "toString" }) { instructions ->
            instructions.map {
                val text = ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (text == IMAGE_DESCRIPTION) ImmutableInstruction10x(Opcode.NOP) else it
            }
        }
        val reordered = replace(model, { it.name != "toString" && it.parameterTypes.isEmpty() && it.returnType == large.type }) {
            listOf(ImmutableInstruction10x(Opcode.NOP)) + it
        }
        val extension = ExtensionDex.classes()
        val closeup = listOf(build.builder, build.bucket)
        val cases = linkedMapOf(
            "missing model" to extension + closeup,
            "renamed description" to extension + closeup + renamed,
            "chooser no longer starts with the large rendition" to extension + closeup + reordered,
            "missing status stub" to build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
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

    @Test
    fun `a missing closeup builder, size set or status stub, or a large image made for another pin, refuses with the chooser untouched`() {
        val build = read(Fixtures.declaredBuilds().last())
        val sizeSet: (Method) -> Boolean = { it.returnType == "Ljava/util/HashSet;" && it.parameterTypes.isEmpty() }
        val noSizeSet = ImmutableClassDef(build.bucket.type, build.bucket.accessFlags, build.bucket.superclass, build.bucket.interfaces,
            build.bucket.sourceFile, build.bucket.annotations, build.bucket.fields, build.bucket.methods.filterNot(sizeSet))
        // A second, unreachable exit would let one path return the set without asking for the original.
        val twoExits = replace(build.bucket, sizeSet) { instructions ->
            val exit = instructions.single { it.opcode == Opcode.RETURN_OBJECT } as OneRegisterInstruction
            instructions + ImmutableInstruction11x(Opcode.RETURN_OBJECT, exit.registerA)
        }
        // A set the method didn't just make could be one every caller shares.
        val notNew = replace(build.bucket, sizeSet) { instructions -> listOf(ImmutableInstruction10x(Opcode.NOP)) + instructions.drop(1) }
        // The hook reads p0, so a large image the helper made from some other register's pin must refuse.
        val otherPin = replace(build.builder, { it.closeupHelper() != null }) { instructions ->
            val at = instructions.indexOfFirst { call ->
                call.opcode == Opcode.INVOKE_STATIC && ((call as ReferenceInstruction).reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                    ?.parameterTypes?.size == 2 && (call as FiveRegisterInstruction).registerCount == 2
            }
            val call = instructions[at] as FiveRegisterInstruction
            instructions.toMutableList().apply {
                set(at, ImmutableInstruction35c(Opcode.INVOKE_STATIC, 2, call.registerD, call.registerD, 0, 0, 0, (call as ReferenceInstruction).reference))
            }
        }
        val extension = ExtensionDex.classes()
        val cases = linkedMapOf(
            "missing closeup builder" to extension + build.model + build.bucket,
            "missing size set" to extension + build.model + build.builder + noSizeSet,
            "size set with two exits" to extension + build.model + build.builder + twoExits,
            "size set that isn't new each call" to extension + build.model + build.builder + notNew,
            "large image made for another pin" to extension + build.model + otherPin + build.bucket,
            "missing closeup status stub" to build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "closeupImage" }) },
        )
        val large = build.model.methods.single { it.name == "toString" }.imageLabels().getValue(IMAGE_DESCRIPTION)
        for ((reason, input) in cases) {
            val context = PatchContexts.of(input)
            assertThrows(reason, PatchException::class.java) { originalImagesPatch.execute(context) }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "originalImages" }
            assertEquals("$reason left the family flag set", 0, (status.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral)
            val chooser = context.mutableClassDefBy(build.model.type).methods.single { method ->
                method.parameterTypes.isEmpty() && method.returnType == large.type && method.name != "toString"
            }
            assertEquals("$reason changed the chooser", large.toString(),
                (chooser.implementation!!.instructions.first() as ReferenceInstruction).reference.toString())
        }
    }

    private fun patched(context: app.morphe.patcher.patch.BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    private fun registers(instruction: Instruction): List<Int> {
        val call = instruction as FiveRegisterInstruction
        return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
    }

    /** A copy of [owner] whose methods matching [which] carry [change]d instructions. */
    private fun replace(owner: ClassDef, which: (Method) -> Boolean, change: (List<Instruction>) -> List<Instruction>) =
        ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.map { method ->
                val instructions = method.implementation?.instructions?.toList()
                if (!which(method) || instructions == null) method else ImmutableMethod(method.definingClass, method.name, method.parameters,
                    method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(method.implementation!!.registerCount, change(instructions), null, null))
            })

    /** The one class whose description names the four image renditions, and the closeup builder and its size bucket. */
    private fun read(build: File): Build {
        var model: ClassDef? = null
        val builders = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                val described = classDef.methods.any { method -> method.name == "toString" && method.implementation?.instructions?.any {
                    ((it as? Instruction21c)?.reference as? StringReference)?.string == IMAGE_DESCRIPTION } == true }
                if (described) {
                    check(model == null) { "${build.name}: two image models" }
                    model = ImmutableClassDef.of(classDef)
                }
                if (classDef.methods.any { it.closeupHelper() != null }) builders += ImmutableClassDef.of(classDef)
            }
        }
        val builder = builders.singleOrNull() ?: error("${build.name}: ${builders.size} closeup builders")
        val bucket = builder.methods.firstNotNullOf { it.closeupHelper() }.second.parameterTypes[1].toString()
        return Build(build.name, checkNotNull(model) { "${build.name}: no image model" }, builder,
            checkNotNull(FixtureDex.classes(build, setOf(bucket))[bucket]) { "${build.name}: no size bucket" })
    }
}
