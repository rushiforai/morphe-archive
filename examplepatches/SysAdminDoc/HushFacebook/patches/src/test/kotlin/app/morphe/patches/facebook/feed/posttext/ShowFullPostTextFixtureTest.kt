/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.posttext

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Show full post text's anchor on every Facebook build the bundle declares: the one method shaped
 * like the feed's text cut that reads the line limit, with the cut's answer in the register each
 * build keeps it in. Then the patch on it: the answer goes through the extension right after it
 * lands and before the null check reads it. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR
 * and skips without it.
 */
class ShowFullPostTextFixtureTest {
    /** Where each declared build keeps the cut, by ABI: the class and the answer's register. */
    private val expected = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to mapOf(
            "arm64-v8a" to ("LX/03Bn;" to 5),
            "armeabi-v7a" to ("LX/03Bn;" to 5),
        ),
    )

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build cuts post text once, and the cut goes through the extension`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val methods = FixtureDex.methodsWhere(bundle, { true }) {
                    !it.definingClass.startsWith(EXTENSION_CLASSES) && cutShaped(it)
                }
                assertEquals("$name: methods shaped like the text cut", 1, methods.size)
                val cut = textCut(methods.single())
                assertEquals("$name: the cut's class and register", expected[version]?.get(name.substringAfter("-$version-").substringBefore(".apkm")),
                    cut.method.definingClass to cut.register)
                val owner = FixtureDex.classes(bundle, setOf(cut.method.definingClass)).getValue(cut.method.definingClass)
                val original = cut.method.code()

                val context = PatchContexts.of(listOf(owner, ExtensionDex.classDef(SETTINGS_STATUS)))
                showFullPostTextPatch.execute(context)

                val patched = context.mutableClassDefBy(owner.type).methods.single {
                    it.name == cut.method.name && it.parameterTypes == cut.method.parameterTypes
                }.code()
                assertEquals("$name: two instructions for the hook", original.size + 2, patched.size)
                val calls = patched.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == CUT }
                assertEquals("$name: calls of the extension", 1, calls.size)
                val (at, call) = calls.single()
                assertEquals("$name: the hook's place", cut.hookIndex, at)
                assertEquals("$name: the call", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                val range = call as RegisterRangeInstruction
                assertEquals("$name: the register handed over", cut.register to 1, range.startRegister to range.registerCount)
                assertEquals("$name: right after the cut's own answer", Opcode.MOVE_RESULT_OBJECT, patched[at - 1].opcode)
                assertEquals(cut.register, (patched[at - 1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the extension's answer", Opcode.MOVE_RESULT_OBJECT, patched[at + 1].opcode)
                assertEquals("$name: the extension's answer lands where the null check reads it", cut.register,
                    (patched[at + 1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the null check after the hook", Opcode.IF_EQZ, patched[at + 2].opcode)
                assertEquals(cut.register, (patched[at + 2] as OneRegisterInstruction).registerA)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "fullPostText" }
                assertEquals("$name: SettingsStatus.fullPostText() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
