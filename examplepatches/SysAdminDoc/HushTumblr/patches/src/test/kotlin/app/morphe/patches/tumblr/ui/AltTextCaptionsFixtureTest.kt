/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.reandroid.arsc.chunk.xml.ResXmlDocument
import com.reandroid.arsc.chunk.xml.ResXmlElement
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.util.zip.ZipFile

@Category(FixtureTests::class)
class AltTextCaptionsFixtureTest {
    private val types = setOf(IMAGE_BLOCK, IMAGE_BLOCK.removeSuffix(";") + "JsonAdapter;",
        PHOTO_CONTAINER, PHOTO_HOLDER, GALLERY_ITEM, "Lzka\$a;", "Lx1f;", "Lu1f;")

    @Test
    fun `the correct images are bound and gallery cleanup runs before every native early return`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            assertEquals(types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            val plan = context.resolveAltTextCaptions()
            assertEquals("Lzka\$a;->c:$IMAGE_BLOCK", plan.photoBlock.toString())
            assertEquals("i", plan.photo.name)
            assertEquals("r", plan.gallery.name)
            assertEquals("n", plan.galleryFull.name)
            val nativePhoto = plan.photo.instructionList().map(::fingerprint)
            val nativeGallery = plan.gallery.instructionList().map(::fingerprint)
            val nativeFull = plan.galleryFull.instructionList().map(::fingerprint)
            visibleAltTextPatch.execute(context)
            val photo = plan.photo.instructionList()
            assertEquals(Opcode.IGET_OBJECT, photo[0].opcode)
            assertEquals(listOf(0, 1), photo[0].namedRegisters())
            assertEquals(plan.photoBlock.toString(), photo[0].fieldRef().toString())
            assertEquals(PHOTO_ALT_HOOK, photo[1].methodRef().toString())
            assertEquals(listOf(2, 0), photo[1].namedRegisters())
            assertEquals(nativePhoto, photo.drop(2).map(::fingerprint))
            val gallery = plan.gallery.instructionList()
            assertEquals(GALLERY_ALT_HOOK, gallery[0].methodRef().toString())
            assertEquals(listOf(2, 3), gallery[0].namedRegisters())
            assertEquals(nativeGallery, gallery.drop(1).map(::fingerprint))
            val full = plan.galleryFull.instructionList()
            assertEquals(CLEAR_GALLERY_ALT_HOOK, full[0].methodRef().toString())
            assertEquals(listOf(29), full[0].namedRegisters())
            assertEquals(nativeFull, full.drop(1).map(::fingerprint))

            val expected = mapOf(
                IMAGE_BLOCK to Triple(HUSH_IMAGE, "hushAltText", "$IMAGE_BLOCK->i()Ljava/lang/String;"),
                PHOTO_CONTAINER to Triple(HUSH_IMAGE_CONTAINER, "hushImageFrame", "$PHOTO_CONTAINER->j0()Landroid/widget/FrameLayout;"),
                "Lu1f;" to Triple(HUSH_IMAGE_ROW, "hushImageItems", "Lu1f;->Z()[$GALLERY_ITEM"),
            )
            for ((type, target) in expected) {
                val model = context.mutableClassDefBy(type)
                assertTrue(target.first in model.interfaces)
                val bridge = model.methods.single { it.name == target.second }
                assertTrue(AccessFlags.PUBLIC.isSet(bridge.accessFlags))
                assertFalse(AccessFlags.ABSTRACT.isSet(bridge.accessFlags))
                val body = bridge.instructionList()
                assertEquals(listOf(if (type == IMAGE_BLOCK) Opcode.INVOKE_VIRTUAL else Opcode.INVOKE_INTERFACE,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), body.map { it.opcode })
                assertEquals(target.third, body[0].methodRef().toString())
            }
            for (status in listOf("visibleAltText", "photoAltTextCaptions", "galleryAltTextCaptions")) {
                val enabled = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == status }
                assertEquals(1, (enabled.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `missing gallery cleanup anchor refuses before any caption bridge or status changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types - "Lu1f;")
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            assertThrows(PatchException::class.java) { visibleAltTextPatch.execute(context) }
            assertFalse(HUSH_IMAGE in context.mutableClassDefBy(IMAGE_BLOCK).interfaces)
            assertFalse(HUSH_IMAGE_CONTAINER in context.mutableClassDefBy(PHOTO_CONTAINER).interfaces)
            for (status in listOf("visibleAltText", "photoAltTextCaptions", "galleryAltTextCaptions")) {
                val enabled = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == status }
                assertEquals(0, (enabled.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `an alt text field without its getter cannot bind a later JSON string property`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            val writer = context.mutableClassDefBy(IMAGE_BLOCK.removeSuffix(";") + "JsonAdapter;").methods.single {
                it.name == "toJson" && it.parameterTypes.size == 2 && it.returnType == "V"
            }
            val instructions = writer.instructionList()
            val key = instructions.indexOfFirst { it.stringRef() == "alt_text" }
            val getter = instructions.indices.first { it > key && instructions[it].methodRef()?.definingClass == IMAGE_BLOCK }
            writer.replaceInstruction(getter, "nop")
            val failure = assertThrows(PatchException::class.java) { visibleAltTextPatch.execute(context) }
            assertTrue(failure.message.orEmpty().contains("alt_text no longer has a public native string getter"))
            assertFalse(HUSH_IMAGE in context.mutableClassDefBy(IMAGE_BLOCK).interfaces)
            for (status in listOf("visibleAltText", "photoAltTextCaptions", "galleryAltTextCaptions")) {
                val enabled = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == status }
                assertEquals(0, (enabled.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `native image layouts have a vertical parent and a separate gallery attribution sibling`() {
        for (build in Fixtures.declaredBuilds()) {
            ZipFile(build).use { zip ->
                for (layout in listOf("graywater_dashboard_photo", "graywater_dashboard_photoset_row_item")) {
                    val document = ResXmlDocument()
                    zip.getInputStream(zip.getEntry("res/layout/$layout.xml")).use(document::readBytes)
                    val parent = document.documentElement
                    assertEquals("LinearLayout", parent.name)
                    assertEquals(1, parent.searchAttributeByResourceId(0x010100c4).data)
                    assertEquals(-2, parent.searchAttributeByResourceId(0x010100f5).data)
                    val children = parent.elements.asSequence().map { it as ResXmlElement }.toList()
                    assertEquals("com.tumblr.ui.widget.aspect.AspectFrameLayout", children[0].name)
                    assertEquals(0x7f0b0668, children[0].idAttribute.data)
                    if (layout.endsWith("row_item")) {
                        assertEquals("include", children[1].name)
                        assertEquals(-2, children[1].searchAttributeByResourceId(0x010100f5).data)
                    }
                }
            }
        }
    }

    private fun fingerprint(instruction: Instruction): String = listOf(instruction.opcode, instruction.namedRegisters(),
        instruction.methodRef()?.toString(), instruction.fieldRef()?.toString(), instruction.stringRef(),
        (instruction as? NarrowLiteralInstruction)?.narrowLiteral, (instruction as? OffsetInstruction)?.codeOffset).toString()
}
