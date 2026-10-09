/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.photo

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Save photo's size on every declared build: Facebook's own save holds one call to the image
 * address modifier, the options it's handed are built from FIT_CENTER (the scale type the save
 * falls through to when MobileConfig names no crop) and a tier, and the patch adds a public helper
 * to the save's public class that makes the same call with the extension's width and height, which
 * the extension's stub calls. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips
 * without it.
 *
 * Read 2026-10-08: the save is 581 `LX/8pP;` and 577 `LX/8RE;`, the modifier 581
 * `LX/3PI;->A00:LX/3ib;` and 577 `LX/1Ue;->A00:LX/3qR;`. Only the kept name and the call's shape
 * are used here.
 */
class PhotoSizeFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

    @Test
    fun `each declared build hands Save photo's address to Facebook's modifier through the stub`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val owners = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.type.startsWith(EXTENSION_CLASSES)) continue
                        if (classDef.methods.any(::isSaveEncodedImage)) owners += ImmutableClassDef.of(classDef)
                    }
                }
                assertEquals("$name: one class saves the photo it shows", 1, owners.size)
                val owner = owners.single()
                assertTrue("$name: ${owner.type} isn't public, so the extension can't call its helper",
                    AccessFlags.PUBLIC.isSet(owner.accessFlags))
                val save = owner.methods.single(::isSaveEncodedImage)
                val found = cdnResize(save)
                assertNotNull("$name: no modifier call in ${owner.type}->$SAVE_ENCODED_IMAGE", found)
                found!!

                // The scale type is the one read right after the FIT_CENTER test, where every
                // other scale type MobileConfig could name falls through; the crops read others.
                val code = save.code()
                val fit = code.indexOfFirst { it.string() == "FIT_CENTER" }
                assertTrue("$name: the save names no FIT_CENTER", fit >= 0)
                assertEquals("$name: the scale type read after the FIT_CENTER test", found.scale, code[fit + 3].field())
                for (crop in listOf("CENTER_CROP", "FOCUS_CROP")) {
                    val at = code.indexOfFirst { it.string() == crop }
                    assertTrue("$name: the save names no $crop", at >= 0)
                    val read = code.drop(at).firstOrNull { it.opcode == Opcode.SGET_OBJECT }?.field()
                    assertEquals("$name: $crop reads a scale type", found.scale.type, read?.type)
                    assertNotEquals("$name: $crop reads FIT_CENTER's", found.scale, read)
                }
                assertTrue("$name: the save's options aren't the resize's second parameter",
                    found.resize.parameterTypes[1].toString() == found.options.definingClass)

                val context = PatchContexts.of(listOf(owner, ExtensionDex.classDef(PHOTO_SAVE)))
                context.fillCdnResize()

                val helper = context.mutableClassDefBy(owner.type).methods.single { it.name == CDN_RESIZE_HELPER }
                assertTrue("$name: the helper is public and static",
                    AccessFlags.PUBLIC.isSet(helper.accessFlags) && AccessFlags.STATIC.isSet(helper.accessFlags))
                val made = helper.code()
                assertEquals("$name: the helper's instructions",
                    listOf(Opcode.SGET_OBJECT, Opcode.SGET_OBJECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.SGET_OBJECT,
                        Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                    made.map { it.opcode })
                assertEquals("$name: the scale type", found.scale, made[0].field())
                assertEquals("$name: the tier", found.tier, made[1].field())
                assertEquals("$name: the options", found.options.definingClass,
                    ((made[2] as ReferenceInstruction).reference as TypeReference).type)
                val init = made[3] as FiveRegisterInstruction
                assertEquals("$name: the constructor", found.options.toString(), (init as ReferenceInstruction).reference.toString())
                // p1 and p2, the width and height, after four locals.
                assertEquals("$name: the width and height handed in", listOf(5, 6), listOf(init.registerF, init.registerG))
                assertEquals("$name: the modifier", found.modifier, made[4].field())
                val call = made[5] as FiveRegisterInstruction
                assertEquals("$name: the modifier's call", found.resize.toString(), (call as ReferenceInstruction).reference.toString())
                assertEquals("$name: the address handed in, then the options", listOf(4, 2), listOf(call.registerD, call.registerE))

                val stub = context.mutableClassDefBy(PHOTO_SAVE).methods.single { it.name == CDN_RESIZE_STUB }.code()
                assertEquals("$name: the stub calls the helper", "${owner.type}->$CDN_RESIZE_HELPER(Landroid/net/Uri;II)Landroid/net/Uri;",
                    ((stub[0] as ReferenceInstruction).reference as MethodReference).toString())
                assertEquals("$name: and hands back its answer", listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                    stub.subList(1, 3).map { it.opcode })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
