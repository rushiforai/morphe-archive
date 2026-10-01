/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.postprompts

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
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide post prompts' anchor on every Facebook build the bundle declares: the one class whose public
 * no-argument constructor loads NTFeedStoryBumperComponent, and its one static (props) -> Z
 * predicate. Then the patch on that class: every answer the predicate gives goes through the
 * extension on its own register, and every branch that went to a return now goes through it too.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HidePostPromptsFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    /** The index each branch of [code] jumps to, by the branch's index. */
    private fun branchTargets(code: List<Instruction>): Map<Int, Int> {
        var address = 0
        val addresses = code.map { instruction -> address.also { address += instruction.codeUnits } }
        return code.withIndex().filter { it.value is OffsetInstruction && it.value.opcode != Opcode.FILL_ARRAY_DATA }
            .associate { (index, branch) -> index to addresses.indexOf(addresses[index] + (branch as OffsetInstruction).codeOffset) }
    }

    @Test
    fun `each declared build has the bumper check once, and every answer goes through the extension`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val components = FixtureDex.classesHolding(bundle, BUMPER_COMPONENT)
                    .filterNot { it.type.startsWith(EXTENSION_CLASSES) }.filter(::isBumperComponent)
                assertEquals("$name: bumper components", 1, components.size)
                val component = components.single()
                val checks = component.methods.filter(::isBumperCheck)
                assertEquals("$name: has-bumper predicates on ${component.type}", 1, checks.size)
                val check = checks.single()
                val original = check.code()
                val returns = original.withIndex().filter { it.value.opcode == Opcode.RETURN }
                assertTrue("$name: the predicate never returns", returns.isNotEmpty())

                val context = PatchContexts.of(listOf(component, ExtensionDex.classDef(SETTINGS_STATUS)))
                hidePostPromptsPatch.execute(context)

                val patched = context.mutableClassDefBy(check.definingClass).methods
                    .single { it.name == check.name && isBumperCheck(it) }.code()
                assertEquals("$name: two instructions in front of each return", original.size + 2 * returns.size, patched.size)
                val patchedReturns = patched.withIndex().filter { it.value.opcode == Opcode.RETURN }.map { it.index }
                assertEquals("$name: returns", returns.size, patchedReturns.size)
                for ((at, answer) in patchedReturns.zip(returns.map { (it.value as OneRegisterInstruction).registerA })) {
                    val call = patched[at - 2]
                    assertEquals("$name: the call before return v$answer", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                    assertEquals("$name: the call before return v$answer", KEEP,
                        ((call as ReferenceInstruction).reference as MethodReference).toString())
                    assertEquals("$name: the register handed over", answer, (call as RegisterRangeInstruction).startRegister)
                    assertEquals("$name: one register handed over", 1, call.registerCount)
                    assertEquals("$name: the extension's answer", Opcode.MOVE_RESULT, patched[at - 1].opcode)
                    assertEquals("$name: the extension's answer lands where the return reads it", answer,
                        (patched[at - 1] as OneRegisterInstruction).registerA)
                    assertEquals("$name: the return", answer, (patched[at] as OneRegisterInstruction).registerA)
                }
                for ((branch, target) in branchTargets(patched)) {
                    assertTrue("$name: the branch at $branch skips the extension", patched[target].opcode != Opcode.RETURN)
                }

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "postPrompts" }
                assertEquals("$name: SettingsStatus.postPrompts() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
