package dev.utaa.linimal.patches.features.readreceipts

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.TryBlock
import com.android.tools.smali.dexlib2.iface.ExceptionHandler
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

class ExplicitMarkAsReadPatchTest {
    private val sender = ImmutableMethodReference(
        "Lsender;",
        "d",
        listOf("J", "Ljava/lang/String;", "Z"),
        "V",
    )
    private val factory = ImmutableMethodReference("Lsender;", "e", listOf("Ljava/lang/String;"), "Lw;")
    private val isSender: (MethodReference) -> Boolean = { it == sender }
    private val isFactory: (MethodReference) -> Boolean = { it == factory }

    // --- すべて既読 ---

    @Test
    fun `the mark all loop resolves the chat id from the sender call`() {
        // 実測: invoke-virtual {v7, v5, v6, v4, v3} で chatId は v4 です。
        val shape = assertNotNull(markAllAsReadShape(method(bulkLoop()), isSender))

        assertEquals(1, shape.senderCallIndex)
        assertEquals(4, shape.chatIdRegister)
    }

    @Test
    fun `the mark all loop is rejected when it has a second sender call`() {
        assertNull(markAllAsReadShape(method(bulkLoop() + senderCall() + returnVoid()), isSender))
    }

    @Test
    fun `the mark all loop is rejected when a branch skips the cleanup position`() {
        // 分岐が送信の直後へ飛び込むと、許可の破棄を飛び越す経路ができます。
        val instructions = listOf(
            ImmutableInstruction10t(Opcode.GOTO, 4),
            senderCall(),
            ImmutableInstruction10x(Opcode.NOP),
            returnVoid(),
        )

        assertNull(markAllAsReadShape(method(instructions), isSender))
    }

    @Test
    fun `the mark all loop is rejected when an existing try block would overlap the handler`() {
        val tryBlocks = listOf(tryBlock(start = 1, count = 3, handlerAddress = 4))

        assertNull(markAllAsReadShape(method(bulkLoop(), tryBlocks), isSender))
    }

    @Test
    fun `the mark all loop is rejected when the appended handler could be fallen into`() {
        val instructions = listOf(ImmutableInstruction10x(Opcode.NOP), senderCall(), ImmutableInstruction10x(Opcode.NOP))

        assertNull(markAllAsReadShape(method(instructions), isSender))
    }

    @Test
    fun `only the two explicit coroutines may call mark all`() {
        val tab = "com.linecorp.line.chattab.ChatTabViewModel\$markAllAsReadForNormalChat\$2" to "ChatTabViewModel.kt"
        val more = "com.linecorp.line.chatlist.viewmodel.ChatListHeaderViewModel\$markAllAsReadForNormalChat\$2" to
            "ChatListHeaderViewModel.kt"

        assertTrue(areOnlyExplicitMarkAllCallers(listOf(tab, more)))
        assertFalse(areOnlyExplicitMarkAllCallers(listOf(tab)))
        assertFalse(areOnlyExplicitMarkAllCallers(listOf(tab, more, null to null)))
        assertFalse(areOnlyExplicitMarkAllCallers(listOf(tab, more, "automatic" to "Automatic.kt")))
        assertFalse(areOnlyExplicitMarkAllCallers(listOf(tab, tab)))
    }

    // --- 長押し ---

    @Test
    fun `the context menu clears the mark on both the normal and the exception path`() {
        val shape = assertNotNull(contextMenuCallShape(method(contextMenu(), contextMenuTry()), isFactory))

        assertEquals(1, shape.factoryCallIndex)
        assertEquals(3, shape.cleanupIndex)
        assertEquals(6, shape.chatIdRegister)
        // handler の先頭へ注入すると例外経路が飛び越すので、その次の命令へ置きます。
        assertEquals(listOf(5), shape.handlerCleanupIndices)
        assertFalse(shape.needsCatchAll)
    }

    @Test
    fun `the chat subtab clears the mark in each typed handler and adds a catch all`() {
        // 実測: CancellationException と Exception の 2 handler で、catch-all はありません。
        val instructions = contextMenu() + moveException() + throwRegister()
        val tryBlocks = listOf(
            ImmutableTryBlock(
                2,
                5,
                listOf(
                    ImmutableExceptionHandler("Ljava/util/concurrent/CancellationException;", 11),
                    ImmutableExceptionHandler("Ljava/lang/Exception;", 7),
                ),
            ),
        )

        val shape = assertNotNull(contextMenuCallShape(method(instructions, tryBlocks), isFactory))

        assertEquals(listOf(8, 5), shape.handlerCleanupIndices)
        assertTrue(shape.needsCatchAll)
    }

    @Test
    fun `the chat subtab is rejected when a handler cleanup position is a branch target`() {
        // address 6 の goto が handler の次（address 9）へ飛び込むと、解除を飛び越す経路ができます。
        val instructions = contextMenu().toMutableList()
        instructions[3] = ImmutableInstruction10t(Opcode.GOTO, 3)

        assertNull(contextMenuCallShape(method(instructions, contextMenuTry()), isFactory))
    }

    @Test
    fun `the context menu is rejected without a covering try`() {
        assertNull(contextMenuCallShape(method(contextMenu()), isFactory))
    }

    @Test
    fun `a typed handler is rejected when the appended catch all could be fallen into`() {
        val instructions = contextMenu() + ImmutableInstruction10x(Opcode.NOP)
        val typed = listOf(tryBlock(start = 2, count = 5, handlerAddress = 7, type = "Ljava/lang/Exception;"))

        assertNull(contextMenuCallShape(method(instructions, typed), isFactory))
    }

    @Test
    fun `the factory call must be unique`() {
        val twice = contextMenu() + factoryCall() + ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1)

        assertNull(contextMenuCallShape(method(twice, contextMenuTry()), isFactory))
        assertNull(notificationCallShape(method(twice), isFactory))
    }

    // --- 通知 ---

    @Test
    fun `the notification entry needs no handler when no try covers the call`() {
        val shape = assertNotNull(notificationCallShape(method(contextMenu()), isFactory))

        assertEquals(1, shape.factoryCallIndex)
        assertEquals(3, shape.cleanupIndex)
        assertTrue(shape.handlerCleanupIndices.isEmpty())
        assertFalse(shape.needsCatchAll)
    }

    @Test
    fun `the notification entry is rejected when a try covers the call`() {
        // 例外が onStartCommand の中で捕まると、プロセスが終わらず印が残ります。
        assertNull(notificationCallShape(method(contextMenu(), contextMenuTry()), isFactory))
    }

    // --- helpers ---

    /** addresses: 0 nop, 1 sender, 4 goto, 5 return-void */
    private fun bulkLoop(): List<Instruction> = listOf(
        ImmutableInstruction10x(Opcode.NOP),
        senderCall(),
        ImmutableInstruction10t(Opcode.GOTO, -4),
        returnVoid(),
    )

    /** addresses: 0 nop(2), 2 factory, 5 move-result, 6 nop, 7 sget(handler), 9 nop, 10 return-void */
    private fun contextMenu(): List<Instruction> = listOf(
        ImmutableInstruction21c(
            Opcode.SGET_OBJECT,
            0,
            ImmutableFieldReference("Lother;", "a", "Ljava/lang/Object;"),
        ),
        factoryCall(),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
        ImmutableInstruction10x(Opcode.NOP),
        ImmutableInstruction21c(
            Opcode.SGET_OBJECT,
            5,
            ImmutableFieldReference("Lother;", "b", "Ljava/lang/Object;"),
        ),
        ImmutableInstruction10x(Opcode.NOP),
        returnVoid(),
    )

    private fun contextMenuTry() = listOf(tryBlock(start = 2, count = 5, handlerAddress = 7))

    private fun senderCall() = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 5, 7, 5, 6, 4, 3, sender)

    private fun factoryCall() = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 1, 6, 0, 0, 0, factory)

    private fun returnVoid() = ImmutableInstruction10x(Opcode.RETURN_VOID)

    private fun moveException() = ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 5)

    private fun throwRegister() = ImmutableInstruction11x(Opcode.THROW, 5)

    private fun tryBlock(
        start: Int,
        count: Int,
        handlerAddress: Int,
        type: String? = null,
    ): TryBlock<out ExceptionHandler> =
        ImmutableTryBlock(start, count, listOf(ImmutableExceptionHandler(type, handlerAddress)))

    private fun method(
        instructions: List<Instruction>,
        tryBlocks: List<TryBlock<out ExceptionHandler>> = emptyList(),
    ) = ImmutableMethod(
        "Ltarget;",
        "target",
        emptyList(),
        "V",
        0,
        null,
        null,
        ImmutableMethodImplementation(8, instructions, tryBlocks, emptyList()),
    )
}
