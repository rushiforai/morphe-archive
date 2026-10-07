/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.photo

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Download any photo on every declared build: the photo viewer's two reads of
 * `can_viewer_download` (the menu and its button) get the switch, the video menus' reads don't,
 * and Save photo's action hands its listener to the extension before it returns.
 *
 * Read from 581 (2026-10-06): the menu is `LX/8pF;->A07`, the button `LX/8pC;->A0Z` and the action
 * `LX/9QR;->newSavePhotoAction`. Only the kept names are used here.
 */
class PhotoSaveFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    private fun readsTheFlag(method: Method) = method.implementation?.instructions?.any {
        it is NarrowLiteralInstruction && it.opcode == Opcode.CONST && it.narrowLiteral == CAN_VIEWER_DOWNLOAD
    } == true

    private fun redexName(classDef: ClassDef) = classDef.staticFields
        .firstOrNull { it.name == "__redex_internal_original_name" }
        ?.let { (it.initialValue as? StringEncodedValue)?.value }

    @Test
    fun `the photo menu asks the switch and Save photo goes through the extension, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val gated = mutableListOf<ClassDef>()
                val actions = mutableListOf<ClassDef>()
                var flagReaders = 0
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { photoDownloadGates(it).isNotEmpty() }) gated += ImmutableClassDef.of(classDef)
                        if (classDef.methods.any(::isSavePhotoAction)) actions += ImmutableClassDef.of(classDef)
                        flagReaders += classDef.methods.count(::readsTheFlag)
                    }
                }

                val gates = gated.flatMap { owner -> owner.methods.flatMap { method -> photoDownloadGates(method).map { method to it } } }
                assertEquals("$name: the menu and its button each read the flag once", 2, gates.size)
                assertEquals("$name: in two methods", 2, gates.map { it.first }.distinct().size)
                assertTrue("$name: the video menus read it too and are left alone", flagReaders > gates.size)
                val menu = gated.filter { redexName(it) == "MediaGalleryMenuHelper" }
                assertEquals("$name: one gate is in the photo viewer's menu helper", 1, menu.size)
                assertTrue("$name: and that menu makes Save photo's action",
                    menu.single().methods.filter { photoDownloadGates(it).isNotEmpty() }.single().implementation!!
                        .instructions.any { it.called()?.contains("->$SAVE_PHOTO_ACTION(") == true })
                assertEquals("$name: one Save photo action", 1, actions.size)
                val actionOwner = actions.single()
                val actionMethod = actionOwner.methods.single(::isSavePhotoAction)
                val beforeAction = actionMethod.implementation!!.instructions.toList()
                // The wrap hands over p1 as the photo, so nothing before it may have written over p1.
                val p1 = actionMethod.implementation!!.registerCount - MethodUtil.getParameterRegisterCount(actionMethod) + 1
                assertTrue("$name: the action writes over the photo in p1", beforeAction.none { ins ->
                    ins.opcode.setsRegister() && (ins as? OneRegisterInstruction)?.registerA?.let {
                        it == p1 || (ins.opcode.setsWideRegister() && it + 1 == p1)
                    } == true
                })

                val context = PatchContexts.of((gated + actionOwner).distinctBy { it.type })
                with(context) { unlockPhotoSave() }

                for ((method, at) in gates) {
                    val flag = (method.implementation!!.instructions.toList()[at - 1] as OneRegisterInstruction).registerA
                    val after = context.mutableClassDefBy(method.definingClass).methods
                        .single { it.name == method.name && it.parameterTypes == method.parameterTypes }
                        .implementation!!.instructions.toList()
                    assertEquals("$name: ${method.name} asks the switch after the read", OFFERS_PHOTO_SAVE, after[at].called())
                    assertEquals("$name: into the flag's register", flag, (after[at + 1] as OneRegisterInstruction).registerA)
                    assertEquals("$name: before the test of it", Opcode.IF_EQZ, after[at + 2].opcode)
                    assertEquals("$name: which still tests the flag", flag, (after[at + 2] as OneRegisterInstruction).registerA)
                }

                val afterAction = context.mutableClassDefBy(actionOwner.type).methods.single(::isSavePhotoAction)
                    .implementation!!.instructions.toList()
                assertEquals("$name: the action gains the wrap and nothing else", beforeAction.size + 2, afterAction.size)
                val wrap = afterAction.indexOfFirst { it.called() == WRAP_SAVE_ACTION }
                assertEquals("$name: the wrap sits right before the return", Opcode.RETURN_OBJECT, afterAction[wrap + 2].opcode)
                assertEquals("$name: and the return hands back the wrapped listener",
                    (afterAction[wrap + 1] as OneRegisterInstruction).registerA,
                    (afterAction[wrap + 2] as OneRegisterInstruction).registerA)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
