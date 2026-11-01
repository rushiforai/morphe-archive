/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import app.morphe.patches.pinterest.ui.instructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22b
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The Home fragment's return check and the Home presenter's refresh, in each declared APK, plus the
 * mask every caller of that refresh passes.
 */
@Category(FixtureTests::class)
class KeepHomeFeedFixtureTest {
    private class Build(val name: String, val fragment: ClassDef, val presenter: ClassDef, val masks: Map<Int, Int>) {
        val classes get() = listOf(fragment, presenter)
        val resume get() = fragment.methods.single { it.isReturnCheck() }
        val check: Method get() {
            val away = homeAwayCalls(resume).single()
            return presenter.methods.single { it.name == away.name && it.parameterTypes == away.parameterTypes }
        }
        val refresh: Method get() {
            val call = homeRefreshCalls(check).single()
            return presenter.methods.single {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.name == call.name &&
                    it.parameterTypes.map(CharSequence::toString) == call.parameterTypes.map(CharSequence::toString)
            }
        }
    }

    @Test
    fun `each declared original APK holds the return check and only the refreshes that pass no pins`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            // Mask 1 is the sticky refresh event's subscriber and its replay, 2 the new pins prompt,
            // 3 every other caller. Only mask 1 can reach the refresh without a 0x2 bit.
            assertEquals("${build.name}: the refresh's callers by mask", setOf(1, 2, 3), build.masks.keys)
            assertEquals("${build.name}: the sticky event's two callers", 2, build.masks[1])
            assertTrue("${build.name}: the presenter compares the time away with five minutes", isHomeAwayCheck(build.check))
            requireMaskShape(build.refresh)

            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            keepHomeFeedPatch.execute(context)
            for (flag in listOf("keepHomeFeed", "homeFeed")) {
                assertEquals("${build.name}: $flag", 1, flag(context, flag))
            }

            val resume = build.resume
            val resumeBefore = resume.implementation!!.instructions.toList()
            val resumeAfter = patched(context, resume)
            assertEquals("${build.name}: the return check asks first", RESUME_HOOK, reference(resumeAfter[0]))
            assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, resumeAfter[0].opcode)
            val away = resumeAfter[0] as RegisterRangeInstruction
            val resumeRegisters = resume.implementation!!.registerCount
            // An instance (J)V: the time away is the wide pair in its last two registers.
            assertEquals("${build.name}: the hook reads the time away", listOf(resumeRegisters - 2, 2), listOf(away.startRegister, away.registerCount))
            assertEquals("${build.name}: the return answer goes to v0", 0, guarded(build.name, resumeAfter))
            assertTrue("${build.name}: v0 is a local", resumeRegisters > 3)
            assertEquals("${build.name}: the return check stays", resumeBefore.map { it.opcode }.filter { it != Opcode.NOP },
                resumeAfter.drop(4).map { it.opcode }.filter { it != Opcode.NOP })

            val refresh = build.refresh
            val refreshBefore = refresh.implementation!!.instructions.toList()
            val refreshAfter = patched(context, refresh)
            assertEquals("${build.name}: the refresh asks first", REFRESH_HOOK, reference(refreshAfter[0]))
            assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, refreshAfter[0].opcode)
            val range = refreshAfter[0] as RegisterRangeInstruction
            val registers = refresh.implementation!!.registerCount
            // A static (presenter, HashMap, int): the map and the mask are its last two registers.
            assertEquals("${build.name}: the hook reads the map and the mask", listOf(registers - 2, 2), listOf(range.startRegister, range.registerCount))
            assertEquals("${build.name}: the refresh answer goes to v0", 0, guarded(build.name, refreshAfter))
            assertEquals("${build.name}: the refresh stays", refreshBefore.map { it.opcode }.filter { it != Opcode.NOP },
                refreshAfter.drop(4).map { it.opcode }.filter { it != Opcode.NOP })
        }
    }

    @Test
    fun `a missing return check, a moved mask bit or a missing status stub refuses before any change`() {
        val build = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val fragment = build.fragment
        val noReturnCheck = ImmutableClassDef(fragment.type, fragment.accessFlags, fragment.superclass, fragment.interfaces,
            fragment.sourceFile, fragment.annotations, fragment.fields, fragment.methods.filterNot { it.isReturnCheck() })
        val refresh = build.refresh
        val presenter = build.presenter
        val movedBit = ImmutableClassDef(presenter.type, presenter.accessFlags, presenter.superclass, presenter.interfaces,
            presenter.sourceFile, presenter.annotations, presenter.fields, presenter.methods.map { method ->
                if (method != refresh) method else ImmutableMethod(method.definingClass, method.name, method.parameters,
                    method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(method.implementation!!.registerCount, method.implementation!!.instructions.map {
                        if (it.opcode != Opcode.AND_INT_LIT8 || (it as NarrowLiteralInstruction).narrowLiteral != 2) it
                        else ImmutableInstruction22b(Opcode.AND_INT_LIT8, (it as TwoRegisterInstruction).registerA, it.registerB, 4)
                    }, method.implementation!!.tryBlocks, method.implementation!!.debugItems))
            })
        val noAwayCheck = ImmutableClassDef(presenter.type, presenter.accessFlags, presenter.superclass, presenter.interfaces,
            presenter.sourceFile, presenter.annotations, presenter.fields, presenter.methods.filterNot { it == build.check })
        // Each case and the refusal it has to give, so none passes on another check's account.
        val cases = linkedMapOf(
            "no return check" to (extension + noReturnCheck + presenter to "Home return check: expected one exact target, found 0"),
            "no presenter check" to (extension + fragment + noAwayCheck to "presenter check of the time away: expected one exact target, found 0"),
            "mask bit moved" to (extension + fragment + movedBit to "no longer drops its map on mask bit 0x2"),
            "missing status stub" to (build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "homeFeed" }) }
                to "no boolean method homeFeed()"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val before = snapshot(context, input)
            val refusal = assertThrows(reason, PatchException::class.java) { keepHomeFeedPatch.execute(context) }
            assertTrue("$reason refused for another reason: ${refusal.message}", refusal.message.orEmpty().contains(message))
            assertArrayEquals("$reason left retained edits", before, snapshot(context, input))
            assertEquals("$reason left the family flag set", 0, flag(context, "keepHomeFeed"))
        }
    }

    /** Checks the guard the hook at 0 opens and answers the register its answer lands in. */
    private fun guarded(name: String, body: List<Instruction>): Int {
        assertEquals(name, Opcode.MOVE_RESULT, body[1].opcode)
        val answer = (body[1] as OneRegisterInstruction).registerA
        assertEquals(name, Opcode.IF_EQZ, body[2].opcode)
        assertEquals(name, answer, (body[2] as OneRegisterInstruction).registerA)
        assertEquals("$name: off goes on to the original first instruction",
            address(body, 4), address(body, 2) + (body[2] as OffsetInstruction).codeOffset)
        assertEquals(name, Opcode.RETURN_VOID, body[3].opcode)
        return answer
    }

    private fun reference(instruction: Instruction) = (instruction as? ReferenceInstruction)?.reference?.toString()

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral

    private fun snapshot(context: BytecodePatchContext, classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(context.mutableClassDefBy(it.type)) }
        val store = MemoryDataStore()
        try {
            pool.writeTo(store)
            return store.data
        } finally {
            store.close()
        }
    }

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    /** The code unit address of instruction [at]. */
    private fun address(instructions: List<Instruction>, at: Int) = instructions.take(at).sumOf { it.codeUnits }

    /**
     * The Home fragment, the presenter its return check refreshes through, and how many calls of
     * that refresh in the whole build pass each mask, read from the last write to the mask register
     * before the call. A write that isn't a constant counts as -1.
     */
    private fun read(build: File): Build {
        val fragment = FixtureDex.classes(build, setOf(HOME_FEED_FRAGMENT))[HOME_FEED_FRAGMENT]
            ?: error("${build.name}: no $HOME_FEED_FRAGMENT")
        val resume = fragment.methods.filter { it.isReturnCheck() }.singleOrNull()
            ?: error("${build.name}: no single Home return check")
        val away = homeAwayCalls(resume).singleOrNull() ?: error("${build.name}: the return check calls no single presenter check")
        val presenter = FixtureDex.classes(build, setOf(away.definingClass))[away.definingClass]
            ?: error("${build.name}: no ${away.definingClass}")
        val check = presenter.methods.singleOrNull { it.name == away.name && it.parameterTypes == away.parameterTypes }
            ?: error("${build.name}: no $away")
        val call = homeRefreshCalls(check).singleOrNull() ?: error("${build.name}: the presenter check calls no single refresh")
        val target = call.toString()
        val masks = mutableMapOf<Int, Int>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) for (method in classDef.methods) {
                val body = method.implementation?.instructions?.toList() ?: continue
                for ((at, instruction) in body.withIndex()) {
                    if ((instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) ||
                        reference(instruction) != target) continue
                    // l9's replay loads its 1 a hundred lines up, so walk back to the last write.
                    val maskRegister = registers(instruction).last()
                    val load = (at - 1 downTo 0).map { body[it] }.firstOrNull { it.writes(maskRegister) }
                    val mask = if (load != null && load.opcode in CONSTANTS) (load as NarrowLiteralInstruction).narrowLiteral else -1
                    masks.merge(mask, 1, Int::plus)
                }
            }
        }
        return Build(build.name, fragment, presenter, masks)
    }

    private fun Instruction.writes(register: Int): Boolean {
        val a = (this as? OneRegisterInstruction)?.registerA ?: return false
        return (opcode.setsRegister() && a == register) || (opcode.setsWideRegister() && a + 1 == register)
    }

    private fun registers(instruction: Instruction): List<Int> = when (instruction) {
        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
            instruction.registerF, instruction.registerG).take(instruction.registerCount)
        else -> emptyList()
    }

    private companion object {
        const val RESUME_HOOK = "Lapp/hushpinterest/extension/pinterest/ads/HomeFeed;->holdResumeRefresh(J)Z"
        const val REFRESH_HOOK = "Lapp/hushpinterest/extension/pinterest/ads/HomeFeed;->holdHomeRefresh(Ljava/util/Map;I)Z"
        val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)
    }
}

/** The Home fragment's `(J)V` that reads the scroll offset and hands the time away to the presenter. */
private fun Method.isReturnCheck() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.map(CharSequence::toString) == listOf("J") &&
    instructions().any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "computeVerticalScrollOffset" } &&
    homeAwayCalls(this).isNotEmpty()
