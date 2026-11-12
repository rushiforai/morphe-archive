package dev.utaa.linimal.patches.features.readers

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull

private const val MESSAGE = "Lhe1/c;"
private const val HOLDER = "Lhe1/h;"
private const val KIND = "Lhe1/w;"
private const val LABEL_HOLDER = "Ldr1/m;"
private const val LABEL_TEXT = "Lsg1/a;"
private const val STRING = "Ljava/lang/String;"
private const val PROFILE = "Ldp3/a;"
private const val TIMESTAMP_ID = 0x7f0b0864

class ReadReceiptReadersShapesTest {
    @Test
    fun `message fields are taken from the toString markers`() {
        val fields = assertNotNull(messageFieldsFromToString(MESSAGE, messageToString()))

        assertEquals("a", fields.chatId.name)
        assertEquals("c", fields.serverMessageId.name)
        assertEquals("J", fields.serverMessageId.type)
        // `, senderMid=` の直後の引数に入るのは e で、直前の d（validServerMessageId）ではありません。
        assertEquals("e", fields.senderMid.name)
        assertEquals("m", fields.isOtherUserMessage?.name)
    }

    @Test
    fun `message fields are rejected when a marker is missing`() {
        val withoutSender = messageToString().filterNot {
            (it as? ImmutableInstruction21c)?.reference == ImmutableStringReference(SENDER_MID_MARKER)
        }
        assertNull(messageFieldsFromToString(MESSAGE, withoutSender))
        assertNull(messageFieldsFromToString("Lother/Type;", messageToString()))
    }

    @Test
    fun `read count bind injects after both visibility calls`() {
        val shape = assertNotNull(readCountBindShape(readCountBind()))

        assertEquals(6, shape.labelRegister)
        assertEquals(2, shape.messageRegister)
        assertEquals(HOLDER, shape.messageHolderType)
        assertEquals(14, shape.shownInjectionIndex)
        assertEquals(16, shape.hiddenInjectionIndex)
    }

    @Test
    fun `read count bind is rejected when the goto does not reach the merge point`() {
        val instructions = readCountBind().toMutableList()
        instructions[14] = ImmutableInstruction10t(Opcode.GOTO, 1)
        assertNull(readCountBindShape(instructions))
    }

    @Test
    fun `read count bind is rejected when the message register is overwritten`() {
        val instructions = readCountBind().toMutableList()
        instructions[9] = ImmutableInstruction11n(Opcode.CONST_4, 2, 0)
        assertNull(readCountBindShape(instructions))
    }

    @Test
    fun `read count bind is rejected without a unique read count query`() {
        val instructions = readCountBind() + readCountBind().subList(1, 4)
        assertNull(readCountBindShape(instructions))
    }

    @Test
    fun `timestamp holder is the field that wraps the timestamp view`() {
        val holder = assertNotNull(timestampHolder(rowViewsConstructor(), TIMESTAMP_ID) { type ->
            if (type == "Ldr1/h;") field("Ldr1/h;", "a", TEXT_VIEW) else null
        })
        assertEquals("Ldr1/g;", holder.ownerType)
        assertEquals("z", holder.holderField.name)
        assertEquals("a", holder.textField.name)
        // holder の TextView field を一意に決められなければ使いません。
        assertNull(timestampHolder(rowViewsConstructor(), TIMESTAMP_ID) { null })
        assertNull(timestampHolder(rowViewsConstructor(), 0x7f0b0000) { field("Ldr1/h;", "a", TEXT_VIEW) })
    }

    @Test
    fun `bind entry passes this through the message holder as a register range`() {
        val parameters = listOf("Lzd1/c;", "Lsg1/a;", HOLDER, "I", "Lgh6/m;", "Lg42/b;", "Z")
        val instructions = listOf(
            ImmutableInstruction10x(Opcode.NOP),
            invokeVirtual("Llq1/i;", "M0", emptyList(), "Ldr1/g;", 0),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        val shape = assertNotNull(
            messageBindEntryShape("Llq1/i;", false, parameters, 43, instructions, HOLDER, "Ldr1/g;"),
        )
        assertEquals(35, shape.firstRegister)
        assertEquals(38, shape.lastRegister)
        assertEquals(listOf("Llq1/i;", "Lzd1/c;", "Lsg1/a;", HOLDER), shape.parameterTypes)
        assertEquals("M0", shape.viewsGetter.name)

        // 26.16.0 は `invoke-virtual/range {p0 .. p0}` で呼びます。
        val ranged = listOf(
            com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc(
                Opcode.INVOKE_VIRTUAL_RANGE, 35, 1, ImmutableMethodReference("Llq1/i;", "M0", emptyList(), "Ldr1/g;"),
            ),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        assertNotNull(messageBindEntryShape("Llq1/i;", false, parameters, 43, ranged, HOLDER, "Ldr1/g;"))

        assertNull(messageBindEntryShape("Llq1/i;", true, parameters, 43, instructions, HOLDER, "Ldr1/g;"))
        assertNull(messageBindEntryShape("Llq1/i;", false, parameters, 43, instructions, HOLDER, "Lother/Views;"))
        // view data より前に wide の引数があると、range で渡す型が合いません。
        assertNull(
            messageBindEntryShape(
                "Llq1/i;", false, listOf("J", HOLDER), 10, instructions, HOLDER, "Ldr1/g;",
            ),
        )
    }

    @Test
    fun `context menu hook goes right before the theme call`() {
        val shape = assertNotNull(contextMenuShape(contextMenu()) { it == "Lfm1/o1;" })

        assertEquals(4, shape.injectionIndex)
        assertEquals(3, shape.scratchRegister)
        assertEquals(8, shape.containerRegister)
        assertEquals(1, shape.dialogRegister)
        assertEquals("Lfm1/o1;", shape.dialogType)
    }

    @Test
    fun `context menu is rejected when the dialog register is reused`() {
        val instructions = contextMenu().toMutableList()
        instructions.add(2, ImmutableInstruction11n(Opcode.CONST_4, 1, 0))
        assertNull(contextMenuShape(instructions) { it == "Lfm1/o1;" })
    }

    @Test
    fun `context menu is rejected without a dialog`() {
        assertNull(contextMenuShape(contextMenu()) { false })
    }

    @Test
    fun `read range sync references come from the coroutine body`() {
        val shape = assertNotNull(readRangeSyncShape(readRangeSync()))

        assertEquals("Lsp8/c;", shape.managerType)
        assertEquals("e", shape.synchronizerField.name)
        assertEquals("c", shape.databaseField.name)
        assertEquals("b", shape.syncMethod.name)
        assertEquals("Lsp8/c\$a;", shape.reasonType)
        assertEquals(Opcode.INVOKE_VIRTUAL, shape.syncOpcode)
    }

    @Test
    fun `read range sync is rejected when the fields come from different owners`() {
        val instructions = readRangeSync().toMutableList()
        instructions[1] = ImmutableInstruction22c(
            Opcode.IGET_OBJECT, 1, 2, ImmutableFieldReference("Lother/Owner;", "c", SQLITE_DATABASE),
        )
        assertNull(readRangeSyncShape(instructions))
    }

    @Test
    fun `own mid comes from the argument right after the mid label`() {
        // label を先に読み込み、field をその後に読む並びでも、引数の位置で mid を選びます。
        val mid = assertNotNull(labeledStringField(PROFILE, profileToString(), PROFILE_MID_MARKER))
        assertEquals("b", mid.name)
        assertNull(labeledStringField("Lother/Type;", profileToString(), PROFILE_MID_MARKER))
    }

    @Test
    fun `own mid getter must return the profile mid unchanged`() {
        val mid = field(PROFILE, "b", STRING)
        assertEquals(true, isOwnMidGetter(ownMidGetter("b"), PROFILE, mid))
        // 別の field（地域コードなど）を返す helper は使いません。
        assertEquals(false, isOwnMidGetter(ownMidGetter("d"), PROFILE, mid))
        // 読んだ後に加工する helper も使いません。
        val transformed = ownMidGetter("b").toMutableList()
        transformed.add(transformed.size - 1, invokeVirtual(STRING, "trim", emptyList(), STRING, 0))
        assertEquals(false, isOwnMidGetter(transformed, PROFILE, mid))
    }

    private fun profileToString(): List<Instruction> = listOf(
        constString(0, PROFILE_MID_MARKER),
        constString(1, ", id="),
        constString(2, PROFILE_MARKER),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 3, 5, field(PROFILE, "a", STRING)),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 4, 5, field(PROFILE, "b", STRING)),
        invokeStatic("Lk6/b;", "a", listOf(STRING, STRING, STRING, STRING, STRING), 2, 3, 0, 4, 1),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
    )

    private fun ownMidGetter(fieldName: String): List<Instruction> = listOf(
        ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, field("Lap3/b;", "k0", "Lap3/b\$a;")),
        invokeStatic("Lsc0/f;", "a", listOf("Landroid/content/Context;", "Lsc0/a;"), 1, 0),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
        ImmutableInstruction21c(Opcode.CHECK_CAST, 1, ImmutableTypeReference("Lap3/b;")),
        invoke(
            Opcode.INVOKE_INTERFACE,
            ImmutableMethodReference("Lap3/b;", GET_PROFILE_METHOD, emptyList(), PROFILE),
            intArrayOf(1),
        ),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 1, field(PROFILE, fieldName, STRING)),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1),
    )

    private fun messageToString(): List<Instruction> = listOf(
        constString(0, MESSAGE_COMMON_MARKER),
        constString(1, ", localMessageId="),
        ImmutableInstruction22c(Opcode.IGET_WIDE, 2, 5, field(MESSAGE, "b", "J")),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 4, 5, field(MESSAGE, "a", STRING)),
        invokeStatic("Lvw/e;", "a", listOf("J", STRING, STRING, STRING), 2, 3, 0, 4, 1),
        constString(1, SERVER_MESSAGE_ID_MARKER),
        constString(2, ", validServerMessageId="),
        ImmutableInstruction22c(Opcode.IGET_WIDE, 3, 5, field(MESSAGE, "c", "J")),
        invokeStatic("Lfa/o0;", "a", listOf("J", STRING, STRING, "Ljava/lang/StringBuilder;"), 3, 4, 1, 2, 0),
        constString(1, SENDER_MID_MARKER),
        constString(2, ", contentType="),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 3, 5, field(MESSAGE, "d", STRING)),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 4, 5, field(MESSAGE, "e", STRING)),
        invokeStatic("Lo6/f;", "a", listOf("Ljava/lang/StringBuilder;", STRING, STRING, STRING, STRING), 0, 3, 1, 4, 2),
        constString(1, OTHER_USER_MESSAGE_MARKER),
        invokeVirtual("Ljava/lang/StringBuilder;", "append", listOf(STRING), "Ljava/lang/StringBuilder;", 0, 1),
        ImmutableInstruction22c(Opcode.IGET_BOOLEAN, 1, 5, field(MESSAGE, "m", "Z")),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
    )

    /**
     * 26.16.0 の既読ラベルの bind を縮めたもの。
     *
     * 0 iget-object v6, v6, label  / 1 invoke d() / 2 move-result / 3 isReadCountRequired / 4 move-result
     * 5 if-eqz → 9 / 6 invoke b() / 7 move-result / 8 nop / 9 const/16 v8 / 10 iget-object text
     * 11 setText / 12 const/4 / 13 setVisibility(表示) / 14 goto → 16（表示経路の注入位置）
     * 15 setVisibility(非表示) / 16 合流点（非表示経路の注入位置）
     */
    private fun readCountBind(): List<Instruction> {
        val instructions = mutableListOf<Instruction>(
            ImmutableInstruction22c(Opcode.IGET_OBJECT, 6, 6, field(LABEL_HOLDER, "a", TEXT_VIEW)),
            invokeVirtual(HOLDER, "d", emptyList(), KIND, 2),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 8),
            invokeVirtual(KIND, READ_COUNT_REQUIRED_METHOD, emptyList(), "Z", 8),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 8),
            ImmutableInstruction10x(Opcode.NOP),
            invokeVirtual(HOLDER, "b", emptyList(), MESSAGE, 2),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 8),
            ImmutableInstruction10x(Opcode.NOP),
            ImmutableInstruction10x(Opcode.NOP),
            ImmutableInstruction22c(Opcode.IGET_OBJECT, 8, 9, field(LABEL_TEXT, "b", STRING)),
            invokeVirtual(TEXT_VIEW, "setText", listOf(CHAR_SEQUENCE), "V", 6, 8),
            ImmutableInstruction11n(Opcode.CONST_4, 8, 0),
            invokeVirtual(VIEW, "setVisibility", listOf("I"), "V", 6, 8),
        )
        // goto の飛び先は、非表示の setVisibility（3 code unit）の直後です。
        instructions += ImmutableInstruction10t(Opcode.GOTO, 1 + 3)
        instructions += invokeVirtual(VIEW, "setVisibility", listOf("I"), "V", 6, 8)
        instructions += ImmutableInstruction10x(Opcode.RETURN_VOID)
        return instructions
    }

    private fun rowViewsConstructor(): List<Instruction> = listOf(
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, ImmutableTypeReference("Ldr1/h;")),
        com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i(Opcode.CONST, 4, TIMESTAMP_ID),
        invokeVirtual(VIEW, "findViewById", listOf("I"), VIEW, 12, 4),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4),
        ImmutableInstruction21c(Opcode.CHECK_CAST, 4, ImmutableTypeReference(TEXT_VIEW)),
        invokeDirect("Ldr1/h;", "<init>", listOf(TEXT_VIEW, "Ld81/a;"), 1, 4, 5),
        ImmutableInstruction22c(Opcode.IPUT_OBJECT, 1, 0, field("Ldr1/g;", "z", "Ldr1/h;")),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    private fun contextMenu(): List<Instruction> = listOf(
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, ImmutableTypeReference("Lfm1/o1;")),
        invokeDirect("Lfm1/o1;", "<init>", emptyList(), 1),
        ImmutableInstruction21c(Opcode.SGET_OBJECT, 3, field("Lgh6/m;", "w3", "Lgh6/m\$a;")),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2),
        ImmutableInstruction21c(Opcode.SGET_OBJECT, 3, field("Lwy1/f;", "a", SET)),
        ImmutableInstruction35c(
            Opcode.INVOKE_INTERFACE, 4, 2, 8, 3, 11, 0,
            ImmutableMethodReference("Lgh6/m;", "r", listOf(VIEW, SET, "Lgh6/e;"), "Z"),
        ),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 2, 1, field("Lfm1/o1;", "d", "Lwc1/d;")),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    private fun readRangeSync(): List<Instruction> = listOf(
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 2, field("Lsp8/c;", "e", "Lsp8/e;")),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 2, field("Lsp8/c;", "c", SQLITE_DATABASE)),
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 3, 4, field("Lsp8/d;", "c", "Lsp8/c\$a;")),
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, 4, 0, 1, 5, 3, 0,
            ImmutableMethodReference("Lsp8/e;", "b", listOf(SQLITE_DATABASE, SET, "Lsp8/c\$a;"), "Lorg/apache/thrift/l;"),
        ),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
    )

    private fun constString(register: Int, value: String) =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))

    private fun field(owner: String, name: String, type: String) = ImmutableFieldReference(owner, name, type)

    private fun invokeStatic(owner: String, name: String, parameters: List<String>, vararg registers: Int) =
        invoke(Opcode.INVOKE_STATIC, ImmutableMethodReference(owner, name, parameters, "V"), registers)

    private fun invokeDirect(owner: String, name: String, parameters: List<String>, vararg registers: Int) =
        invoke(Opcode.INVOKE_DIRECT, ImmutableMethodReference(owner, name, parameters, "V"), registers)

    private fun invokeVirtual(
        owner: String,
        name: String,
        parameters: List<String>,
        returnType: String,
        vararg registers: Int,
    ) = invoke(Opcode.INVOKE_VIRTUAL, ImmutableMethodReference(owner, name, parameters, returnType), registers)

    private fun invoke(opcode: Opcode, reference: ImmutableMethodReference, registers: IntArray): Instruction {
        val padded = registers.toList() + List(5 - registers.size) { 0 }
        return ImmutableInstruction35c(
            opcode, registers.size, padded[0], padded[1], padded[2], padded[3], padded[4], reference,
        )
    }
}
