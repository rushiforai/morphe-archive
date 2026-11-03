package dev.utaa.linimal.patches.features.readreceipts

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ExceptionHandler
import com.android.tools.smali.dexlib2.iface.TryBlock
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.util.instructionWritesRegister
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.registerSurvivesBetween
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * 注入位置の回帰テスト。dexlib2 の `addInstructions(index, ...)` は新しい MethodLocation を挿入し、
 * 既存 location は Label を保持したまま後ろへずれるため、既存の分岐先や例外 handler の先頭へ
 * 注入するとその経路だけが注入コードを飛び越します。
 */
class MainChatReadReceiptPatchTest {
    // --- supplier worker (Lq33/c;->run()V) ---

    @Test
    fun `a wide destination also occupies the following register`() {
        // const-wide/16 v3 は v3 と v4 の pair へ書きます。smali 上に v4 は現れません。
        val constWide = ImmutableInstruction21s(Opcode.CONST_WIDE_16, 3, 0)

        assertTrue(instructionWritesRegister(constWide, 3))
        assertTrue(instructionWritesRegister(constWide, 4))
        assertFalse(instructionWritesRegister(constWide, 5))
    }

    @Test
    fun `an invoke writes no register`() {
        // invoke の結果は move-result が受け取ります。invoke 自体は register を潰しません。
        assertFalse(instructionWritesRegister(supplierWorkerInstructions()[2], 4))
    }

    @Test
    fun `the scratch register does not survive across the read point comparison`() {
        // 旧実装は命令 0 で v4 へ this を退避し、命令 9 の直前で読み出していました。間の
        // const-wide/16 v3 が v4 を潰すため、この前提は成り立ちません（実機で VerifyError）。
        val instructions = supplierWorkerInstructions()

        assertFalse(registerSurvivesBetween(instructions, 4, 0, 9))
    }

    @Test
    fun `the scratch register survives when its use is adjacent to its definition`() {
        // 現行実装は v4 へ chatId を読み、次の命令で prepareSupplier へ渡すだけです。
        val instructions = supplierWorkerInstructions()

        assertTrue(registerSurvivesBetween(instructions, 4, 0, 1))
    }

    @Test
    fun `supplier preparation is injected where every path reaches it`() {
        // 注入前の index 0 / 7 / 10 が prefix・早期 return の cleanup・正常終了の cleanup です。
        // 注入によって index はずれますが、判定は必ず注入前の並びと index で行います。
        val instructions = supplierWorkerInstructions()

        assertEquals(listOf(0, 7, 10), SUPPLIER_PREPARATION_INJECTION_INDICES)
        assertFalse(supplierPreparationInjectionDiverted(instructions, emptySet()))
    }

    @Test
    fun `supplier preparation is rejected when a cleanup site is a branch target`() {
        // read point の判定が早期 return (addr 000e) そのものへ飛ぶ形にします。cleanup はその return の
        // 直前へ入るため、この経路だけが one-shot を解放しないまま戻ります。
        val instructions = supplierWorkerInstructions(readPointJumpOffset = 2)

        assertTrue(isDivertedInjectionIndex(instructions, 7))
        assertTrue(supplierPreparationInjectionDiverted(instructions, emptySet()))
    }

    @Test
    fun `supplier preparation is rejected when the prefix site is a branch target`() {
        // 末尾に addr 0000 へ戻る goto を足すと、prefix の注入位置が分岐先と一致し、その経路だけが
        // prepareSupplier を呼ばずに run() 本体へ入ります。
        val instructions = supplierWorkerInstructions(
            trailing = listOf(ImmutableInstruction10t(Opcode.GOTO, -0x14)),
        )

        assertTrue(isDivertedInjectionIndex(instructions, 0))
        assertTrue(supplierPreparationInjectionDiverted(instructions, emptySet()))
    }

    @Test
    fun `supplier preparation is rejected when a cleanup site is an exception handler head`() {
        // addr 0013 は d() 正常終了後の return です。ここが handler 先頭だと例外経路が cleanup を
        // 飛び越します。元の supplier に handler はありませんが、前提が崩れた場合に備えて拒否します。
        val instructions = supplierWorkerInstructions()

        assertTrue(supplierPreparationInjectionDiverted(instructions, handlerAddresses = setOf(0x13)))
    }

    // --- outbound gate (Lq33/e;->d(JLjava/lang/String;Z)V) ---

    @Test
    fun `outbound gate is injected after the branch merge point`() {
        // 合流点 index 5 (addr 000c) は命令 0 の if-eqz の分岐先そのものです。そこへ注入すると
        // 第 4 引数 Z が false の経路だけが gate を飛び越し、抑制されないまま送信へ到達します。
        val instructions = outboundGateInstructions()

        assertTrue(isDivertedInjectionIndex(instructions, 5))
        assertFalse(isDivertedInjectionIndex(instructions, 6))
        assertEquals(6, outboundGateInsertionIndex(instructions, emptySet()))
    }

    @Test
    fun `outbound gate is rejected when the insertion site is another branch target`() {
        // 末尾に addr 000e (index 6) へ戻る goto を足すと、注入位置がその分岐先と一致します。
        val instructions = outboundGateInstructions(trailing = listOf(ImmutableInstruction10t(Opcode.GOTO, -6)))

        assertTrue(isDivertedInjectionIndex(instructions, 6))
        assertNull(outboundGateInsertionIndex(instructions, emptySet()))
    }

    @Test
    fun `outbound gate is rejected when the insertion site is an exception handler head`() {
        val instructions = outboundGateInstructions()

        assertTrue(isDivertedInjectionIndex(instructions, 6, handlerAddresses = setOf(0x0e)))
        assertNull(outboundGateInsertionIndex(instructions, setOf(0x0e)))
    }

    @Test
    fun `outbound gate is rejected when the leading branch does not skip the local update`() {
        // 分岐先が合流点 index 5 でなくなった shape は、注入位置を導けないので拒否します。
        assertNull(outboundGateInsertionIndex(outboundGateInstructions(skipOffset = 14), emptySet()))
        assertNull(
            outboundGateInsertionIndex(outboundGateInstructions().drop(1), emptySet()),
        )
    }

    // --- 手動既読ボタンの coroutine (invokeSuspend) ---

    @Test
    fun `the button coroutine locates the single executor call and its chat id`() {
        val shape = checkNotNull(manualButtonShape(buttonMethod()))

        assertEquals(1, shape.executorCallIndex)
        assertEquals(3, shape.cleanupIndex)
        // v5 は executor interface、v1 が chatId、v4 が continuation です。
        assertEquals(1, shape.chatIdRegister)
        assertEquals("a", shape.executorCall.name)
    }

    @Test
    fun `a button coroutine with an existing try block is rejected`() {
        // 既存の handler に重ねると例外時の解除順序を保証できません。
        val tryBlock: List<TryBlock<out ExceptionHandler>> = listOf(
            ImmutableTryBlock(0, 3, listOf(ImmutableExceptionHandler(null, 3))),
        )

        assertNull(manualButtonShape(buttonMethod(tryBlocks = tryBlock)))
    }

    @Test
    fun `a button coroutine calling the executor twice is rejected`() {
        val call = buttonInstructions()[1]

        assertNull(manualButtonShape(buttonMethod(instructions = buttonInstructions() + call)))
    }

    @Test
    fun `a button coroutine whose cleanup site is a branch target is rejected`() {
        // 分岐が cleanup の注入位置そのものへ来る経路があると、その経路は解除を通りません。
        // 先頭の if-eqz は 2 code unit なので、注入位置は addr 0006 です。
        val branch = ImmutableInstruction21t(Opcode.IF_EQZ, 0, 6)
        val instructions = listOf(branch) + buttonInstructions().drop(1)

        assertTrue(isDivertedInjectionIndex(instructions, 3))
        assertNull(manualButtonShape(buttonMethod(instructions = instructions)))
    }

    private fun buttonInstructions(): List<Instruction> = listOf(
        // addr 0000
        ImmutableInstruction11x(Opcode.MONITOR_ENTER, 3),
        // addr 0001: executor 呼び出し
        ImmutableInstruction35c(
            Opcode.INVOKE_INTERFACE,
            3,
            5,
            1,
            4,
            0,
            0,
            ImmutableMethodReference(
                "Lexecutor;",
                "a",
                listOf("Ljava/lang/String;", "Lcontinuation;"),
                "Ljava/lang/Object;",
            ),
        ),
        // addr 0004
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4),
        // addr 0005: cleanup の注入位置
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4),
    )

    private fun buttonMethod(
        instructions: List<Instruction> = buttonInstructions(),
        tryBlocks: List<TryBlock<out ExceptionHandler>> = emptyList(),
    ) = ImmutableMethod(
        "Lbutton;",
        "invokeSuspend",
        listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
        "Ljava/lang/Object;",
        0,
        null,
        null,
        ImmutableMethodImplementation(6, instructions, tryBlocks, emptyList()),
    )

    /**
     * `Lq33/e;->d` の先頭。index 0 の if-eqz が local update と chat-list Runnable を飛び越し、
     * index 5 (addr 000c) の queue 取得で合流します。
     */
    private fun outboundGateInstructions(
        skipOffset: Int = 12,
        trailing: List<Instruction> = emptyList(),
    ): List<Instruction> = listOf<Instruction>(
        // addr 0000
        ImmutableInstruction21t(Opcode.IF_EQZ, 9, skipOffset),
        // addr 0002
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 9, 5, field("Lq33/e;", "c", "Lu13/l;")),
        // addr 0004
        ImmutableInstruction35c(
            Opcode.INVOKE_INTERFACE,
            2,
            9,
            8,
            0,
            0,
            0,
            ImmutableMethodReference("Lu13/l;", "Y", listOf("Ljava/lang/String;"), "V"),
        ),
        // addr 0007
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 9, 5, field("Lq33/e;", "h", "Lq33/b;")),
        // addr 0009
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            1,
            9,
            0,
            0,
            0,
            0,
            ImmutableMethodReference("Lq33/b;", "run", emptyList(), "V"),
        ),
        // addr 000c: 合流点
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 9, 5, field("Lq33/e;", "b", "Lq33/f;")),
        // addr 000e: 注入位置
        ImmutableInstruction11x(Opcode.MONITOR_ENTER, 9),
        // addr 000f
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            1,
            9,
            0,
            0,
            0,
            0,
            ImmutableMethodReference("Lq33/f;", "a", emptyList(), "V"),
        ),
        // addr 0012
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 9, field("Lq33/f;", "b", "Ljava/util/HashMap;")),
    ) + trailing

    /**
     * `Lq33/c;->run()V`（registers 6 / ins 1）の命令列。v5 が p0、命令 1 で chatId に潰されます。
     * v3 と v4 は命令 4 の const-wide/16 が pair として使います。
     *
     * <p>命令境界は addr 0000 / 0002 / 0004 / 0007 / 0008 / 000a / 000c / 000e / 000f / 0010 / 0013 です。
     * 既定の [readPointJumpOffset] は addr 000c の if-nez から addr 000f（const/4 v3, 1）へ飛び、
     * read point が 0 でないときだけ既読送信へ進みます。</p>
     */
    private fun supplierWorkerInstructions(
        readPointJumpOffset: Int = 3,
        trailing: List<Instruction> = emptyList(),
    ): List<Instruction> = listOf<Instruction>(
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 5, field("Lq33/c;", "a", "Lq33/e;")),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 5, 5, field("Lq33/c;", "b", "Ljava/lang/String;")),
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            2,
            0,
            5,
            0,
            0,
            0,
            ImmutableMethodReference("Lq33/e;", "a", listOf("Ljava/lang/String;"), "J"),
        ),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 1),
        ImmutableInstruction21s(Opcode.CONST_WIDE_16, 3, 0),
        ImmutableInstruction23x(Opcode.CMP_LONG, 3, 1, 3),
        ImmutableInstruction21t(Opcode.IF_NEZ, 3, readPointJumpOffset),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
        ImmutableInstruction11n(Opcode.CONST_4, 3, 1),
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            5,
            0,
            1,
            2,
            5,
            3,
            ImmutableMethodReference("Lq33/e;", "d", listOf("J", "Ljava/lang/String;", "Z"), "V"),
        ),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    ) + trailing

    private fun field(definingClass: String, name: String, type: String) =
        ImmutableFieldReference(definingClass, name, type)

    /**
     * prefix の書き込みと読み出しの間に wide 命令が挟まると、scratch が pair の上位半分として
     * 潰されます。区間を固定値で書いていたころ、この検証は恒真で何も守っていませんでした。
     */
    @Test
    fun `a prefix that lets a wide instruction clobber the scratch register is rejected`() {
        val prefix = prefixInstructionsForTest()

        assertTrue(prefixKeepsScratchRegister(prefix))

        val clobbered = listOf(prefix[0], ImmutableInstruction21s(Opcode.CONST_WIDE_16, 3, 0), prefix[1])
        assertFalse(prefixKeepsScratchRegister(clobbered))
    }

    @Test
    fun `a prefix that never reads the scratch register is rejected`() {
        val prefix = prefixInstructionsForTest()

        assertFalse(prefixKeepsScratchRegister(listOf(prefix[0])))
        assertFalse(prefixKeepsScratchRegister(listOf(prefix[1])))
    }

    /** 実装が組み立てるのと同じ並び。scratch へ chatId を読み、直後に prepare へ渡します。 */
    private fun prefixInstructionsForTest(): List<Instruction> = listOf(
        ImmutableInstruction22c(
            Opcode.IGET_OBJECT,
            4,
            5,
            field("Lq33/c;", "b", "Ljava/lang/String;"),
        ),
        ImmutableInstruction35c(
            Opcode.INVOKE_STATIC,
            2,
            5, 4, 0, 0, 0,
            ImmutableMethodReference(
                "Ldev/utaa/linimal/extension/features/readreceipts/ReadReceiptHooks;",
                "prepareSupplier",
                listOf("Ljava/lang/Object;", "Ljava/lang/String;"),
                "V",
            ),
        ),
    )
}
