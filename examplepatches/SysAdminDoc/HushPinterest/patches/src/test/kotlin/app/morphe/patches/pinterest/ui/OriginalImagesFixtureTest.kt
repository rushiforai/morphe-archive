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
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
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
import org.junit.experimental.categories.Category

/** Pinterest's collage image model, pin closeup builder and pin image size set in each declared APK. */
@Category(FixtureTests::class)
class OriginalImagesFixtureTest {
    /** The classes the patch reads in one build: the image model, the closeup builder's class, the size bucket, the page lookups and the follow-up code. */
    private class Build(
        val name: String, val model: ClassDef, val builder: ClassDef, val bucket: ClassDef, val pages: List<ClassDef>, val followUps: List<ClassDef>,
    ) {
        val classes get() = listOf(model, builder, bucket) + pages + followUps
        val stock get() = followUps.flatMap { it.methods }.single { it.isFollowUp(PROXY_AUTH_ERROR) }
        val loop get() = followUps.flatMap { it.methods }.single { it.isFollowUp(FOLLOW_UP_LIMIT) }
        fun owner(method: Method) = followUps.single { it.type == method.definingClass }
    }

    @Test
    fun `each declared original APK answers the original rendition first behind the switch`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            originalImagesPatch.execute(context)
            for (flag in listOf("originalImages", "imageChooser", "closeupImage", "pageImage", "originalRetry")) {
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
    fun `each declared original APK offers an idea pin page its original ahead of every read by the asked size`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            assertEquals("${build.name}: the two page image lookups", 2, build.pages.size)
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            originalImagesPatch.execute(context)
            for (page in build.pages) {
                val clean = page.methods.single { it.pageImageReads().isNotEmpty() }
                val reads = clean.pageImageReads()
                val was = clean.instructions()
                val body = patched(context, clean)
                assertEquals("${build.name}: ${clean.name}", was.size + 4 * reads.size, body.size)
                reads.forEachIndexed { earlier, read ->
                    val at = read + 4 * earlier
                    val where = "${build.name}: ${clean.definingClass}@$read"
                    assertEquals(where, "$UI_HOOKS->pageImage(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;",
                        (body[at] as ReferenceInstruction).reference.toString())
                    assertEquals("$where: the page's images, then the asked size", registers(was[read]), registers(body[at]))
                    assertEquals(where, listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT),
                        body.subList(at + 1, at + 4).map { it.opcode })
                    val answer = (body[at + 1] as OneRegisterInstruction).registerA
                    assertEquals(where, listOf(answer, answer), body.subList(at + 2, at + 4).map { (it as OneRegisterInstruction).registerA })
                    assertEquals("$where: with no original, Pinterest's own read runs", at + 4,
                        (body[at + 2] as BuilderOffsetInstruction).target.location.index)
                    assertEquals(where, registers(was[read]), registers(body[at + 4]))
                }
            }
        }
    }

    @Test
    fun `each declared original APK asks about a refused original on both follow-up paths`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val stock = build.stock
            val loop = build.loop
            val parts = checkNotNull(stock.followUpParts()) { "${build.name}: no redirect parts" }
            val exit = loop.noFollowUpExits(parts.request).single()
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            originalImagesPatch.execute(context)

            val opened = patched(context, stock)
            assertRetry("${build.name}: stock", opened, 0, stock.implementation!!.registerCount - 2, parts)
            assertEquals(build.name, Opcode.RETURN_OBJECT, opened[14].opcode)
            assertEquals("${build.name}: the new request is the one returned",
                (opened[12] as OneRegisterInstruction).registerA, (opened[14] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: the stock method's own code follows", shape(stock.instructions()), shape(opened.drop(15)))

            val ended = patched(context, loop)
            assertRetry("${build.name}: loop", ended, exit.at, exit.answer, parts)
            assertEquals("${build.name}: the new request is the one the loop tests", exit.next, (ended[exit.at + 12] as OneRegisterInstruction).registerA)
            assertEquals(build.name, listOf(Opcode.GOTO), shape(listOf(ended[exit.at + 14])))
            assertEquals("${build.name}: a retry goes on as a follow-up", exit.at + 16,
                (ended[exit.at + 14] as BuilderOffsetInstruction).target.location.index)
            assertEquals("${build.name}: the loop's own code follows", shape(loop.instructions().drop(exit.at)), shape(ended.drop(exit.at + 15)))
            assertEquals("${build.name}: the loop's own code leads in", shape(loop.instructions().take(exit.at)), shape(ended.take(exit.at)))
        }
    }

    @Test
    fun `a follow-up path gone or a missing retry status stub refuses with the chooser untouched`() {
        val build = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val others = listOf(build.model, build.builder, build.bucket) + build.pages
        val stock = build.owner(build.stock)
        val loop = build.owner(build.loop)
        // Without the jump, the loop's path with no next request can't be told from any other branch.
        val noExit = replace(loop, { it.isFollowUp(FOLLOW_UP_LIMIT) }) { instructions ->
            val at = build.loop.noFollowUpExits(build.stock.followUpParts()!!.request).single().at
            instructions.toMutableList().apply { set(at, ImmutableInstruction10x(Opcode.NOP)) }
        }
        val cases = linkedMapOf(
            "stock follow-up gone" to extension + others + loop,
            "follow-up loop gone" to extension + others + stock,
            "the loop's exit gone" to extension + others + stock + noExit,
            "missing retry status stub" to build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "originalRetry" }) },
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

    /** The hook's block at [at]: it reads [response], asks the hook, and gives up at the code that was there. */
    private fun assertRetry(where: String, body: List<Instruction>, at: Int, response: Int, parts: FollowUpParts) {
        assertEquals(where, listOf(Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT,
            Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT), body.subList(at, at + 14).map { it.opcode })
        assertEquals("$where: the status comes from the response", response, (body[at] as TwoRegisterInstruction).registerB)
        assertEquals("$where: the request comes from the response", response, (body[at + 1] as TwoRegisterInstruction).registerB)
        val references = listOf(0 to parts.status, 1 to parts.answered, 2 to parts.address, 6 to parts.resolve, 9 to parts.newBuilder,
            11 to parts.builderAddress, 13 to parts.build)
        for ((offset, expected) in references) assertEquals("$where+$offset", expected.toString(), (body[at + offset] as ReferenceInstruction).reference.toString())
        assertEquals(where, parts.request, (body[at + 12] as ReferenceInstruction).reference.toString())
        assertEquals(where, "$UI_HOOKS->originalRetry(ILjava/lang/Object;)Ljava/lang/String;", (body[at + 3] as ReferenceInstruction).reference.toString())
        assertEquals("$where: the status, then the address", listOf((body[at] as OneRegisterInstruction).registerA, (body[at + 2] as OneRegisterInstruction).registerA),
            registers(body[at + 3]))
        for (branch in listOf(at + 5, at + 8)) assertEquals("$where: with nothing to try, Pinterest's own code runs", at + 15,
            (body[branch] as BuilderOffsetInstruction).target.location.index)
    }

    /** What the code does, apart from the padding and jump sizes an edit can change. */
    private fun shape(body: List<Instruction>) = body.map { it.opcode }.filter { it != Opcode.NOP }.map {
        if (it == Opcode.GOTO_16 || it == Opcode.GOTO_32) Opcode.GOTO else it
    }

    @Test
    fun `a page image lookup gone or a missing page status stub refuses with the chooser untouched`() {
        val build = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val others = listOf(build.model, build.builder, build.bucket) + build.followUps
        val lookup: (Method) -> Boolean = { it.pageImageReads().isNotEmpty() }
        // A size read only after the method replaced its parameter is no longer the size it was asked for.
        val overwritten = replace(build.pages.first(), lookup) { instructions ->
            val size = (instructions.first { it.opcode == Opcode.INVOKE_INTERFACE } as FiveRegisterInstruction).registerD
            listOf(ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, size)) + instructions
        }
        val cases = linkedMapOf(
            "one lookup gone" to extension + others + build.pages.drop(1),
            "both lookups gone" to extension + others,
            "the size overwritten first" to extension + others + overwritten + build.pages.drop(1),
            "missing page status stub" to build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "pageImage" }) },
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
        val closeup = listOf(build.builder, build.bucket) + build.pages + build.followUps
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
        val extension = ExtensionDex.classes() + build.followUps
        val cases = linkedMapOf(
            "missing closeup builder" to extension + build.pages + build.model + build.bucket,
            "missing size set" to extension + build.pages + build.model + build.builder + noSizeSet,
            "size set with two exits" to extension + build.pages + build.model + build.builder + twoExits,
            "size set that isn't new each call" to extension + build.pages + build.model + build.builder + notNew,
            "large image made for another pin" to extension + build.pages + build.model + otherPin + build.bucket,
            "missing closeup status stub" to build.classes + ExtensionDex.classes().map { owner -> if (owner.type != SETTINGS_STATUS) owner else
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
        val pages = mutableListOf<ClassDef>()
        val followUps = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                if (classDef.methods.any { it.pageImageReads().isNotEmpty() }) pages += ImmutableClassDef.of(classDef)
                // Both follow-up paths live in interceptors, which keeps this from reading every method's text.
                if (classDef.methods.any { it.name == "intercept" && it.parameterTypes.size == 1 } &&
                    classDef.methods.any { it.isFollowUp(PROXY_AUTH_ERROR) || it.isFollowUp(FOLLOW_UP_LIMIT) }) followUps += ImmutableClassDef.of(classDef)
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
            checkNotNull(FixtureDex.classes(build, setOf(bucket))[bucket]) { "${build.name}: no size bucket" }, pages, followUps)
    }
}

/** True when this method holds [text] and reads the Location header, as the two follow-up paths do. */
private fun Method.isFollowUp(text: String) = strings().let { text in it && LOCATION_HEADER in it }
