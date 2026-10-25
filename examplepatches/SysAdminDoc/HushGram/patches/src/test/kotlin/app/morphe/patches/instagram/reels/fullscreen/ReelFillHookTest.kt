/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.fullscreen

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.NeutralNativePath
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * #288: Instagram's reel crop decision asks ReelFill.fill with the crop percentage right after
 * working it out, and returns true on a yes. On no it goes on to Instagram's own checks unchanged.
 */
class ReelFillHookTest {
    @Test
    fun theHookIsInTheExtension() {
        val fill = ExtensionDex.classDef(FILL_HOOK.substringBefore("->")).methods.single {
            "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == FILL_HOOK.substringAfter("->")
        }
        assertTrue(AccessFlags.PUBLIC.isSet(fill.accessFlags) && AccessFlags.STATIC.isSet(fill.accessFlags))
    }

    @Test
    fun eachDeclaredBuildAsksAfterTheCropPercentage() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                asks(bundle, bundle.name)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun asks(bundle: File, label: String) {
        val types = FixtureDex.classesHolding(bundle, SHOULD_CROP).map { it.type }.toSet()
        for ((read, classesOf) in listOf("copied" to FixtureDex::classes, "as read" to FixtureDex::classesAsRead)) {
            val what = "$label ($read)"
            val context = PatchContexts.of(classesOf(bundle, types).values)
            val decision = types.flatMap { context.mutableClassDefBy(it).methods }.single { it.loadsBoth() }
            val before = decision.code()
            val multiply = before.indices.first { at ->
                before[at].opcode == Opcode.MUL_FLOAT_2ADDR && before.take(at).any { it.string() == CROP_PERCENTAGE }
            }
            val percent = (before[multiply] as TwoRegisterInstruction).registerA
            val native = NeutralNativePath(decision)

            context.fillReelScreen()

            val code = decision.code()
            val ask = multiply + 1
            assertEquals("$what: four instructions added", before.size + 4, code.size)
            assertEquals("$what: one ask", 1, code.count { it.referenceText() == FILL_HOOK })
            assertEquals("$what: right after the multiply", FILL_HOOK, code[ask].referenceText())
            assertEquals("$what: an invoke-static", Opcode.INVOKE_STATIC, code[ask].opcode)
            assertEquals("$what: on the percentage", listOf(percent), (code[ask] as FiveRegisterInstruction).let {
                listOf(it.registerC).take(it.registerCount)
            })
            assertEquals("$what: the answer", Opcode.MOVE_RESULT, code[ask + 1].opcode)
            val answer = (code[ask + 1] as OneRegisterInstruction).registerA
            assertTrue("$what: not in the percentage's register", answer != percent)
            assertEquals("$what: a no goes on", Opcode.IF_EQZ, code[ask + 2].opcode)
            assertEquals("$what: on the answer", answer, (code[ask + 2] as OneRegisterInstruction).registerA)
            assertEquals("$what: to Instagram's next instruction", before[multiply + 1].opcode, code[ask + 4].opcode)
            assertEquals("$what: past the return", 2 + 1, (code[ask + 2] as OffsetInstruction).codeOffset)
            assertEquals("$what: a yes fills", Opcode.RETURN, code[ask + 3].opcode)
            assertEquals("$what: returning the answer", answer, (code[ask + 3] as OneRegisterInstruction).registerA)
            native.assertPreserved(what, decision, (ask until ask + 4).toSet())
        }
    }

    private fun Method.loadsBoth(): Boolean {
        val strings = code().mapNotNull { it.string() }
        return returnType == "Z" && SHOULD_CROP in strings && CROP_PERCENTAGE in strings
    }

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.string(): String? =
        ((this as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()
}
