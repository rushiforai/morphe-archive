/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.sellerprofile

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream

/**
 * Show View profile on Marketplace sellers on every Facebook build the bundle declares: the config
 * module for React Native is there under its kept name, with exactly the two by-name boolean reads
 * the hook goes in, each with the one local the hook uses and the name in a four-bit register, and
 * the four by-id reads. The build's rn_params.txt gives the seller flag the stable id the extension
 * answers, and after the patch every one of the six reads asks the extension first, the by-id ones
 * from a copy whose first moves put the parameters back where Facebook's code reads them. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class SellerViewProfileFixtureTest {
    @Test
    fun `each declared build has both named boolean reads with room for the answer`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val module = FixtureDex.classes(bundle, setOf(CONFIG_MODULE))[CONFIG_MODULE]
                assertNotNull("${bundle.name}: $CONFIG_MODULE", module)
                val reads = module!!.methods.filter(::isNamedBooleanRead)
                assertEquals("${bundle.name}: named boolean reads", NAMED_BOOLEAN_READS, reads.map { it.name }.toSet())
                assertEquals("${bundle.name}: one method per name", NAMED_BOOLEAN_READS.size, reads.size)
                for (read in reads) {
                    val locals = read.localRegisterCount()
                    assertTrue("${bundle.name}: ${read.name} has $locals locals", locals in 1..14)
                    read.checkRoomForTheAnswer()
                }
                val byId = module.methods.filter(::isByIdBooleanRead)
                assertEquals("${bundle.name}: by-id boolean reads", BY_ID_BOOLEAN_READS, byId.map { it.name }.toSet())
                assertEquals("${bundle.name}: one method per by-id name", BY_ID_BOOLEAN_READS.size, byId.size)
                assertEquals("${bundle.name}: the seller flag's stable id in rn_params.txt",
                    ExtensionDex.longConstant(SELLER_PROFILE, "FLAG_SPEC"), flagSpec(bundle))

                val context = PatchContexts.of(listOf(module, ExtensionDex.classDef(SETTINGS_STATUS)))
                showSellerViewProfilePatch.execute(context)
                val patched = context.mutableClassDefBy(CONFIG_MODULE).methods
                for (read in reads + byId) {
                    val method = patched.single { MethodUtil.methodSignaturesMatch(it, read) }
                    val code = method.implementation!!.instructions.toList()
                    val original = read.implementation!!.instructions.toList()
                    // The copy's moves: this, then one per parameter.
                    val moves = if (read in byId) 1 + read.parameterTypes.size else 0
                    assertEquals("${bundle.name}: ${read.name} gains the four hook instructions", original.size + 4 + moves, code.size)
                    assertEquals("${bundle.name}: ${read.name} runs Facebook's own code after the hook",
                        original.map { it.opcode }, code.drop(4 + moves).map { it.opcode })
                    val call = code[0] as ReferenceInstruction
                    if (read in byId) {
                        assertEquals("${bundle.name}: ${read.name}'s first call", ANSWER_TRUE_FOR_SPEC, (call.reference as MethodReference).toString())
                        call as RegisterRangeInstruction
                        assertEquals("${bundle.name}: ${read.name} hands over both keys", 4, call.registerCount)
                        val parameterRegisters = 1 + read.parameterTypes.sumOf { if (it.toString() == "D" || it.toString() == "J") 2 as Int else 1 }
                        val registers = method.implementation!!.registerCount
                        assertEquals("${bundle.name}: ${read.name} has its parameters copied", read.implementation!!.registerCount + parameterRegisters, registers)
                        assertEquals("${bundle.name}: ${read.name}'s keys start at p1", registers - parameterRegisters + 1, call.startRegister)
                        assertEquals("${bundle.name}: ${read.name}'s answer is in the register its this goes to",
                            0, (code[1] as OneRegisterInstruction).registerA)
                        assertEquals("${bundle.name}: ${read.name} moves this down after the hook", Opcode.MOVE_OBJECT_FROM16, code[4].opcode)
                        assertEquals("${bundle.name}: ${read.name}'s this goes back to its old p0",
                            read.implementation!!.registerCount - parameterRegisters, (code[4] as OneRegisterInstruction).registerA)
                    } else {
                        assertEquals("${bundle.name}: ${read.name}'s first call", ANSWER_TRUE, (call.reference as MethodReference).toString())
                    }
                    assertEquals("${bundle.name}: ${read.name} reads the answer", Opcode.MOVE_RESULT, code[1].opcode)
                    assertEquals("${bundle.name}: ${read.name} branches past the answer", Opcode.IF_EQZ, code[2].opcode)
                    assertEquals("${bundle.name}: ${read.name} returns the answer", Opcode.RETURN, code[3].opcode)
                    assertEquals("${bundle.name}: ${read.name} returns what it read",
                        (code[1] as OneRegisterInstruction).registerA, (code[3] as OneRegisterInstruction).registerA)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /** The seller flag's stable id from [bundle]'s rn_params.txt, folded as the module folds it. */
    private fun flagSpec(bundle: File): Long {
        val flag = ExtensionDex.stringConstant(SELLER_PROFILE, "FLAG")
        val params: String = ZipFile(bundle).use { apkm ->
            ZipInputStream(apkm.getInputStream(apkm.getEntry("base.apk"))).use { apk ->
                generateSequence { apk.nextEntry }.first { it.name == "assets/rn_params.txt" }
                String(apk.readBytes(), Charsets.UTF_8)
            }
        }
        val line = params.lines().singleOrNull { it.startsWith("$flag,") }
        assertNotNull("${bundle.name}: rn_params.txt has no $flag", line)
        // name, native spec, config key, param key, then nothing.
        val fields = line!!.split(",")
        return (fields[2].toLong() shl 32) or fields[3].toLong()
    }
}
