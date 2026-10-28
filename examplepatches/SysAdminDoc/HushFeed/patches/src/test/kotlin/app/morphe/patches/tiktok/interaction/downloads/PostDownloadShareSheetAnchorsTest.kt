/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.downloads

import app.morphe.Fixtures
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

private const val SHEET_FRAGMENT =
    "Lcom/ss/android/ugc/aweme/internalshare/impl/fragment/DownloadAndShareFragment;"
private const val SHEET_EVENT = "after_video_saved_share_to_nscreen"
private const val DOWNLOADS = "Lapp/morphe/extension/tiktok/download/DownloadsPatch;"

/**
 * What Skip the Share to sheet after a save hooks, held to each declared build: the one method
 * of TikTok's post-download sheet fragment that logs the sheet's event, which builds the sheet
 * and shows it. The guard leaves it before the first of TikTok's instructions when the switch
 * is on and runs it untouched when it is off.
 */
class PostDownloadShareSheetAnchorsTest {
    @Test
    fun `each declared build has one sheet show method and the fingerprint takes exactly it`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val byShape = methodsOf(apk) { classDef, method -> classDef.type == SHEET_FRAGMENT && logsSheetEvent(method) }
            val byFingerprint = methodsOf(apk) { classDef, method -> PostDownloadShareSheetFingerprint.takes(method, classDef) }
            assertEquals("$version: show methods ${byShape.map { it.second.name }}", 1, byShape.size)
            assertEquals(
                "$version: the fingerprint took ${byFingerprint.map { it.second.name }}",
                byShape.map { it.first.type to it.second.name },
                byFingerprint.map { it.first.type to it.second.name },
            )
            // It hands the sheet to the fragment manager itself, so leaving it shows nothing.
            assertTrue(
                "$version: the show method no longer calls DialogFragment.show",
                byShape.single().second.implementation!!.instructions.any {
                    it.getReference<MethodReference>()?.let { call -> call.name == "show" && call.returnType == "V" } == true
                },
            )
        }
    }

    @Test
    fun `the guard asks the switch first and leaves TikTok's body as it was`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val native = methodsOf(apk) { classDef, method -> classDef.type == SHEET_FRAGMENT && logsSheetEvent(method) }
                .single().second
            val before = native.implementation!!.instructions.toList()

            val hooked = MutableMethod(native)
            hooked.guardAtEntry(
                "Downloads",
                "invoke-static {}, $DOWNLOADS->skipPostDownloadShareSheet()Z",
                "return-void",
            )
            val after = hooked.implementation!!.instructions.toList()

            assertEquals(
                "$version: the guard",
                listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP),
                after.take(5).map { it.opcode },
            )
            val call = after[0].getReference<MethodReference>()!!
            assertEquals(DOWNLOADS, call.definingClass)
            assertEquals("skipPostDownloadShareSheet", call.name)
            assertEquals(0, (after[1] as OneRegisterInstruction).registerA)
            assertEquals(before.map { it.opcode }, after.drop(5).map { it.opcode })
        }
    }

    private fun logsSheetEvent(method: Method) = method.implementation?.instructions?.any {
        it.getReference<StringReference>()?.string == SHEET_EVENT
    } == true

    /** Every method of one build the filter takes, walked once and never held (the dex has millions). */
    private fun methodsOf(apk: File, accept: (ClassDef, Method) -> Boolean): List<Pair<ClassDef, Method>> {
        val found = mutableListOf<Pair<ClassDef, Method>>()
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) {
            for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                for (method in classDef.methods) {
                    if (accept(classDef, method)) found += classDef to method
                }
            }
        }
        return found
    }
}
