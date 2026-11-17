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
import com.android.tools.smali.dexlib2.AccessFlags
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
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** Pinterest's education container and the pop-up banner it shows, in each declared APK. */
@Category(FixtureTests::class)
class PopupBannersFixtureTest {
    @Test
    fun `each declared APK hands the shown banner to the extension at the show method's one return`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val container = classes.single { it.type == EDUCATION_CONTAINER }
            val field = container.fields.single { it.type == BANNER_OVERLAY }
            val show = container.methods.single { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.implementation?.instructions?.any { call ->
                        (call as? ReferenceInstruction)?.reference?.toString()?.let { it.startsWith("$BANNER_OVERLAY->") && it.endsWith(LISTENER_SETTER) } == true
                    } == true
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            hidePopupBannersPatch.execute(context)
            for (flag in listOf("hidePopupBanners", "popupBanners")) assertEquals("${build.name}: $flag", 1, flag(context, flag))

            val clean = show.implementation!!.instructions.toList()
            val body = patched(context, show)
            val hooks = body.indices.filter { (body[it] as? ReferenceInstruction)?.reference?.toString() == POPUP_BANNER_HOOK }
            val at = hooks.singleOrNull() ?: error("${build.name}: ${hooks.size} banner hooks")
            val register = (body[at] as FiveRegisterInstruction).registerC
            assertEquals("${build.name}: the hook takes one view", 1, (body[at] as FiveRegisterInstruction).registerCount)
            assertTrue("${build.name}: an iget and an invoke can name the register", register <= 15)

            val load = body[at - 2]
            assertEquals(build.name, Opcode.MOVE_OBJECT_FROM16, load.opcode)
            assertEquals(build.name, register, (load as OneRegisterInstruction).registerA)
            val p0 = show.implementation!!.registerCount - show.parameterTypes.size
            assertEquals("${build.name}: the container comes from the first parameter", p0, (load as TwoRegisterInstruction).registerB)
            val banner = body[at - 1]
            assertEquals(build.name, Opcode.IGET_OBJECT, banner.opcode)
            assertEquals(build.name, register, (banner as TwoRegisterInstruction).registerA)
            assertEquals(build.name, register, banner.registerB)
            assertEquals(build.name, "$EDUCATION_CONTAINER->${field.name}:$BANNER_OVERLAY", (banner as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the hook sits right before the return", Opcode.RETURN_VOID, body[at + 1].opcode)
            assertEquals(build.name, 1, body.count { it.opcode == Opcode.RETURN_VOID })

            // Every jump that went to the return now lands on the hand-over, so every way out of the
            // method passes through it.
            val returnOffsets = clean.indices.filter { clean[it].opcode == Opcode.RETURN_VOID }
            assertEquals(build.name, 1, returnOffsets.size)
            val branches = body.filterIsInstance<BuilderOffsetInstruction>()
            val toReturn = branches.filter { it.target.location.instruction === body[at + 1] }
            assertEquals("${build.name}: nothing jumps past the hook", emptyList<Instruction>(), toReturn)
            val toHook = branches.filter { it.target.location.instruction === load }
            assertTrue("${build.name}: the show method jumps to its return", toHook.isNotEmpty())
            assertEquals("${build.name}: Pinterest's own code is unchanged", clean.map { it.opcode },
                (body.take(at - 2) + body.drop(at + 1)).map { it.opcode })
        }
    }

    @Test
    fun `a missing container, banner field, show method or status stub refuses with the method untouched`() {
        val build = Fixtures.declaredBuilds().last()
        val classes = read(build)
        val extension = ExtensionDex.classes()
        val container = classes.single { it.type == EDUCATION_CONTAINER }
        fun replaced(owner: ClassDef) = classes.map { if (it.type == owner.type) owner else it }
        fun without(stub: String) = classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                owner.annotations, owner.fields, owner.methods.filterNot { it.name == stub }) }
        val noField = ImmutableClassDef(container.type, container.accessFlags, container.superclass, container.interfaces,
            container.sourceFile, container.annotations, container.fields.filterNot { it.type == BANNER_OVERLAY }, container.methods)
        val noShow = ImmutableClassDef(container.type, container.accessFlags, container.superclass, container.interfaces,
            container.sourceFile, container.annotations, container.fields,
            container.methods.filterNot { AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.firstOrNull()?.toString() == EDUCATION_CONTAINER })
        val cases = linkedMapOf(
            "missing container" to (extension + classes.filter { it.type != EDUCATION_CONTAINER } to EDUCATION_CONTAINER),
            "missing banner field" to (extension + replaced(noField) to "the education container's banner field"),
            "missing show method" to (extension + replaced(noShow) to "the method that shows the banner"),
            "missing hidePopupBanners stub" to (without("hidePopupBanners") to "hidePopupBanners"),
            "missing popupBanners stub" to (without("popupBanners") to "popupBanners"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { hidePopupBannersPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (name in listOf("hidePopupBanners", "popupBanners")) {
                if (context.mutableClassDefBy(SETTINGS_STATUS).methods.any { it.name == name }) {
                    assertEquals("$reason left $name set", 0, flag(context, name))
                }
            }
            if (input.any { it.type == EDUCATION_CONTAINER }) {
                for (method in container.methods.filter { it.implementation != null }) {
                    val owner = context.mutableClassDefBy(EDUCATION_CONTAINER)
                    val now = owner.methods.singleOrNull { it.name == method.name && it.parameterTypes == method.parameterTypes } ?: continue
                    assertEquals("$reason changed ${method.name}", method.implementation!!.instructions.map { it.opcode },
                        now.implementation!!.instructions.map { it.opcode })
                }
            }
        }
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    private fun read(build: java.io.File): List<ClassDef> {
        val found = FixtureDex.classes(build, setOf(EDUCATION_CONTAINER, BANNER_OVERLAY))
        check(EDUCATION_CONTAINER in found) { "${build.name}: no education container" }
        check(BANNER_OVERLAY in found) { "${build.name}: no banner overlay" }
        return found.values.toList()
    }
}

/** The banner's listener setter as the clean 14.44.0 dex declares it: four click listeners, nothing back. */
private val LISTENER_SETTER = "(" + "Landroid/view/View\$OnClickListener;".repeat(4) + ")V"
