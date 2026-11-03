package dev.utaa.linimal.patches.features.readwithoutreceipt

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ReadWithoutReceiptManualReadPatchTest {
    @Test
    fun `bridge preserves wide point and clears local unread without touching executor registers`() {
        val outbound = method("execute", listOf("J", STRING, "Z"), "V")
        val getter = method("latest", listOf(STRING), "J")
        val bridge = manualReadBridge(outbound, getter)
        val dex = checkNotNull(ImmutableMethodImplementation.of(bridge.implementation))
        val instructions = dex.instructions.toList()
        assertEquals("J", bridge.returnType)
        assertEquals(listOf("J", STRING), bridge.parameterTypes.map(CharSequence::toString))
        assertTrue(AccessFlags.PUBLIC.isSet(bridge.accessFlags))
        assertTrue(AccessFlags.FINAL.isSet(bridge.accessFlags))
        assertFalse(AccessFlags.STATIC.isSet(bridge.accessFlags))
        assertEquals(7, dex.registerCount)
        val send = instructions.indexOfFirst { (it as? ReferenceInstruction)?.reference == outbound }
        val invoke = instructions[send] as FiveRegisterInstruction
        assertEquals(listOf(3, 4, 5, 6, 2), listOf(invoke.registerC, invoke.registerD, invoke.registerE,
            invoke.registerF, invoke.registerG))
        val flag = instructions[send - 1] as NarrowLiteralInstruction
        assertEquals(Opcode.CONST_4, instructions[send - 1].opcode)
        assertEquals(1, flag.narrowLiteral)
        assertEquals(2, (instructions[send - 1] as OneRegisterInstruction).registerA)
        // 正常終了後だけ、渡した point の両 register を戻します。
        assertEquals(Opcode.RETURN_WIDE, instructions[send + 1].opcode)
        assertEquals(4, (instructions[send + 1] as OneRegisterInstruction).registerA)
        assertEquals(8, checkNotNull(outbound.implementation).registerCount)
    }

    @Test
    fun `bridge reads getter once and keeps observed point when getter is zero or older`() {
        val getter = method("latest", listOf(STRING), "J")
        val instructions = checkNotNull(manualReadBridge(
            method("execute", listOf("J", STRING, "Z"), "V"), getter).implementation).instructions.toList()
        assertEquals(1, instructions.count { (it as? ReferenceInstruction)?.reference == getter })
        val compare = instructions.first { it.opcode == Opcode.CMP_LONG } as ThreeRegisterInstruction
        assertEquals(2, compare.registerA)
        assertEquals(0, compare.registerB)
        assertEquals(4, compare.registerC)
        val move = instructions.single { it.opcode == Opcode.MOVE_WIDE } as TwoRegisterInstruction
        assertEquals(4, move.registerA)
        assertEquals(0, move.registerB)
        // null chat と非正の point の分岐は既存処理の呼び出しより前です。
        assertEquals(Opcode.IF_EQZ, instructions[0].opcode)
        assertEquals(6, (instructions[0] as OneRegisterInstruction).registerA)
        assertEquals(2, instructions.count { it.opcode == Opcode.IF_LEZ })
    }

    @Test
    fun `exception returns zero and does not expose a successful point`() {
        val dex = checkNotNull(ImmutableMethodImplementation.of(manualReadBridge(
            method("execute", listOf("J", STRING, "Z"), "V"),
            method("latest", listOf(STRING), "J")).implementation))
        assertEquals(1, dex.tryBlocks.size)
        assertEquals(null, dex.tryBlocks.single().exceptionHandlers.single().exceptionType)
        assertEquals(listOf(Opcode.MOVE_EXCEPTION, Opcode.CONST_WIDE_16, Opcode.RETURN_WIDE),
            dex.instructions.toList().takeLast(3).map { it.opcode })
    }

    @Test
    fun `getter contract uses stable calls rather than executor or helper names`() {
        // fingerprint 用の reference fixture。実行用コードではなく、owner/name の難読化耐性を調べます。
        val calls = listOf(
            ImmutableMethodReference("Ljava/lang/Long;", "parseLong", listOf(STRING), "J"),
            ImmutableMethodReference("Lrenamed/query;", "anything", listOf("J", STRING, STRING), "Ljava/util/List;"),
            ImmutableMethodReference("Ljava/util/List;", "isEmpty", emptyList(), "Z"),
            ImmutableMethodReference("Ljava/util/List;", "get", listOf("I"), "Ljava/lang/Object;"),
            ImmutableMethodReference("Lrenamed/row;", "position", emptyList(), "J"),
        )
        val instructions = calls.map {
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, it)
        } + listOf(ImmutableInstruction11x(Opcode.RETURN_WIDE, 0), ImmutableInstruction11x(Opcode.RETURN_WIDE, 0))
        val getter = ImmutableMethod("Lrenamed/executor;", "anything",
            listOf(ImmutableMethodParameter(STRING, null, null)), "J",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(8, instructions, emptyList(), emptyList()))
        assertTrue(isManualReadPointGetter(getter))
        val incomplete = ImmutableMethod(getter.definingClass, getter.name, getter.parameters, "J",
            getter.accessFlags, null, null,
            ImmutableMethodImplementation(8, instructions.drop(1), emptyList(), emptyList()))
        assertFalse(isManualReadPointGetter(incomplete))
    }

    @Test
    fun `unknown getter signatures and static methods are rejected`() {
        assertFalse(isManualReadPointGetter(method("latest", listOf(STRING), "J")))
        assertFalse(isManualReadPointGetter(method("latest", emptyList(), "J")))
        assertFalse(isManualReadPointGetter(method("latest", listOf(STRING), "J", AccessFlags.STATIC.value)))
    }

    private fun method(name: String, parameters: List<String>, result: String,
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) = ImmutableMethod(
        "Lexecutor;", name, parameters.map { ImmutableMethodParameter(it, null, null) }, result,
        flags, null, null, ImmutableMethodImplementation(8,
            listOf(if (result == "V") com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(
                Opcode.RETURN_VOID) else ImmutableInstruction11x(Opcode.RETURN_WIDE, 0)), emptyList(), emptyList()))

    private companion object {
        const val STRING = "Ljava/lang/String;"
    }
}
