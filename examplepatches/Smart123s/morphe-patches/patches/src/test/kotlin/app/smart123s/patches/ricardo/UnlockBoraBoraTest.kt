package app.smart123s.patches.ricardo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertSame

internal class UnlockBoraBoraTest {
    private val game = "Lricardonemlopot/nemlopot/rube/RubeLoaderTest;"

    private fun availabilityCode(names: String, available: String, label: String) = """
        sget-object v1, $game->$names:[Ljava/lang/String;
        array-length v1, v1
        if-ge v0, v1, :saved_$label
        if-eqz v0, :free_$label
        const/4 v1, 0x2
        if-ne v0, v1, :saved_$label
        :free_$label
        sget-object v1, $game->$available:Lcom/badlogic/gdx/utils/Array;
        const/4 v2, 0x1
        return v2
        :saved_$label
        return p1
    """.trimIndent()

    private val maps = availabilityCode("palyaNevek", "elerhetoPalyak", "maps")
    private val cars = availabilityCode("autoNevek", "elerhetoAutok", "cars")

    private fun method(code: String): MutableMethod = MutableMethod(ImmutableMethod(
        game, "availability",
        listOf("I", "Z").map { ImmutableMethodParameter(it, emptySet(), null) }, "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()),
    )).apply { addInstructions(0, code) }

    // Execute the actual decision instructions with a selected map and saved
    // unlock flag. Stop at the fixture's free/saved return, without libGDX.
    private fun available(method: MutableMethod, start: Int, map: Int, saved: Boolean): Boolean {
        val registers = IntArray(6).apply { this[0] = map; this[5] = if (saved) 1 else 0 }
        val instructions = method.implementation!!.instructions
        var pc = start
        repeat(instructions.size) {
            val instruction = instructions[pc]
            var jump = false
            when (instruction.opcode) {
                Opcode.SGET_OBJECT -> Unit
                Opcode.CONST_4 -> registers[(instruction as OneRegisterInstruction).registerA] =
                    (instruction as NarrowLiteralInstruction).narrowLiteral
                Opcode.IF_EQZ -> jump = registers[(instruction as OneRegisterInstruction).registerA] == 0
                Opcode.IF_NE, Opcode.IF_GT -> {
                    val branch = instruction as TwoRegisterInstruction
                    val a = registers[branch.registerA]
                    val b = registers[branch.registerB]
                    jump = if (instruction.opcode == Opcode.IF_NE) a != b else a > b
                }
                Opcode.RETURN -> return registers[(instruction as OneRegisterInstruction).registerA] != 0
                else -> error("Unexpected availability instruction: ${instruction.opcode}")
            }
            pc = if (jump) (instruction as BuilderOffsetInstruction).target.location.index else pc + 1
        }
        error("Map availability did not return")
    }

    @Test
    fun `Bora Bora is free for new and existing saves while other map states are preserved`() {
        val method = method(maps)
        for (saved in listOf(false, true)) {
            for (map in 0..3) {
                assertEquals(map == 0 || map == 2 || saved, available(method, 3, map, saved))
            }
        }
        method.unlockBoraBora()
        for (saved in listOf(false, true)) {
            for (map in 0..3) {
                assertEquals(map <= 2 || saved, available(method, 3, map, saved))
            }
        }
    }

    @Test
    fun `only the map comparison changes and all jump destinations and registers survive`() {
        for (prefixSize in listOf(0, 17)) {
            val method = method(List(prefixSize) { "nop" }.joinToString("\n") + "\n" + cars + "\n" + maps)
            val implementation = method.implementation!!
            val before = implementation.instructions.toList()
            val branchIndex = prefixSize + 10 + 5
            val branch = before[branchIndex] as BuilderOffsetInstruction
            val target = branch.target.location.instruction
            val addresses = before.map { it.location.codeAddress }

            method.unlockBoraBora()

            val after = implementation.instructions
            assertEquals(6, implementation.registerCount)
            assertEquals(before.size, after.size)
            assertEquals(addresses, after.map { it.location.codeAddress })
            assertEquals(Opcode.IF_GT, after[branchIndex].opcode)
            assertSame(target, (after[branchIndex] as BuilderOffsetInstruction).target.location.instruction)
            before.indices.filter { it != branchIndex }.forEach { assertSame(before[it], after[it]) }
            for (saved in listOf(false, true)) {
                assertEquals(saved, available(method, prefixSize + 3, 1, saved)) // Cars stay locked.
                assertEquals(true, available(method, prefixSize + 10 + 3, 1, saved))
            }
        }
    }

    @Test
    fun `unsupported or ambiguous availability code is rejected`() {
        for (code in listOf(
            "return p1", cars, maps.replace("0x2", "0x3"),
            maps.replace("elerhetoPalyak", "elerhetoAutok"),
            maps.replace("if-ne v0, v1", "if-ne v0, v2"),
            maps + "\n" + availabilityCode("palyaNevek", "elerhetoPalyak", "duplicate"),
        )) {
            assertFailsWith<PatchException> { method(code).unlockBoraBora() }
        }
    }
}
