package dev.utaa.linimal.patches.features.readwithoutreceipt

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val COMPOSER = "Lj3/r;"
private const val ITEM = "Lz61/j3\$a;"
private const val FUNCTION0 = "Lnt8/a;"
private const val FUNCTION1 = "Lnt8/l;"
private const val FUNCTION2 = "Lnt8/p;"
private const val MODIFIER = "Lb4/j;"
private const val COMPOSABLE_LAMBDA = "Lt3/k;"
private const val DONOR = "La71/d;"
private const val ROW_LIST_OWNER = "La71/f;"

/** 行一覧を呼ぶ命令の index。これが注入位置です。 */
private const val ROW_LIST_INDEX = 10

/**
 * メニュー本体と行一覧の composable を、26.16.0 で実測した並びと register のまま fixture で再現します。
 * トーク項目の分岐内で行一覧を呼び、その直前へ 1 行を差し込む形を検証します。
 */
class ReadWithoutReceiptComposeMenuPatchTest {
    private val rowList = rowListMethod()

    private fun shapeOf(method: Method) = composeMenuShape(method, ITEM) { rowList }

    @Test
    fun `the measured menu shape resolves every reference it injects`() {
        val shape = checkNotNull(shapeOf(menuMethod()))

        assertEquals(COMPOSER, shape.composerType)
        assertEquals(ITEM, shape.itemType)
        assertEquals(DONOR, shape.labelDonorType)
        assertEquals(6, shape.composerRegister)
        assertEquals(10, shape.itemRegister)
        assertEquals(8, shape.dismissRegister)
        assertEquals(ROW_LIST_INDEX, shape.insertionIndex)
        assertEquals("a", shape.rowComposable.name)
        assertEquals("b", shape.rememberLambda.name)
        assertEquals("q", shape.startReplaceGroup.name)
        assertEquals("m", shape.endReplaceGroup.name)
        assertEquals("l", shape.skipToGroupEnd.name)
        assertEquals("A", shape.shouldExecute.name)
    }

    @Test
    fun `the fingerprint filter accepts the measured shape`() {
        assertTrue(looksLikeComposeMenu(menuMethod(), ITEM))
    }

    @Test
    fun `a method that never tests the item type is not the menu`() {
        assertFalse(looksLikeComposeMenu(menuMethod(), "Lother;"))
    }

    @Test
    fun `a method calling the row list twice is not the menu`() {
        assertFalse(looksLikeComposeMenu(menuMethod(rowListCalls = 2), ITEM))
    }

    @Test
    fun `a missing composer cast is rejected`() {
        assertNull(shapeOf(menuMethod(includeComposerCast = false)))
    }

    @Test
    fun `an unresolved row list is rejected`() {
        assertNull(composeMenuShape(menuMethod(), ITEM) { null })
    }

    @Test
    fun `an item register overwritten before the insertion point is rejected`() {
        assertNull(shapeOf(menuMethod(overwriteItemRegister = true)))
    }

    @Test
    fun `a composer register the row invocation cannot address is rejected`() {
        // 注入する invoke-static は 35c 形式なので、引数の register は 4bit（v0〜v15）に限られます。
        assertNull(shapeOf(menuMethod(dismissRegister = 16)))
    }

    @Test
    fun `an injection point that is also a branch target is rejected`() {
        // 分岐が注入位置そのものへ来ると、その経路だけが行を飛び越し、slot 構造がずれます。
        val diverted = menuMethod(branchToRowList = true)

        assertTrue(isDivertedInjectionIndex(diverted.implementation!!.instructions.toList(), ROW_LIST_INDEX))
        assertNull(shapeOf(diverted))
    }

    @Test
    fun `a menu without a skipToGroupEnd call is rejected`() {
        assertNull(shapeOf(menuMethod(includeSkipToGroupEnd = false)))
    }

    @Test
    fun `the chat id is the only String field of the item type`() {
        assertEquals("a", chatIdField(itemClass())?.name)
        assertNull(chatIdField(itemClass(extraStringField = true)))
        assertNull(chatIdField(null))
    }

    @Test
    fun `the label donor yields the text call and the Unit field`() {
        val donor = checkNotNull(labelDonorShape(listOf(donorInvoke())))

        assertEquals("b", donor.text.name)
        assertEquals("a", donor.unitField.name)
    }

    @Test
    fun `a label donor without a 25 register text call is rejected`() {
        assertNull(labelDonorShape(listOf(donorInvoke(textRegisterCount = 24))))
    }

    private fun itemClass(extraStringField: Boolean = false) = ImmutableClassDef(
        ITEM,
        0,
        "Lz61/j3;",
        null,
        null,
        null,
        null,
        buildList {
            add(ImmutableField(ITEM, "a", "Ljava/lang/String;", 0, null, null, null))
            add(ImmutableField(ITEM, "b", "Lz61/q2;", 0, null, null, null))
            if (extraStringField) {
                add(ImmutableField(ITEM, "c", "Ljava/lang/String;", 0, null, null, null))
            }
        },
        null,
        null,
    )

    private fun donorInvoke(textRegisterCount: Int = 25): Method = ImmutableMethod(
        DONOR,
        "invoke",
        listOf(
            ImmutableMethodParameter("Ljava/lang/Object;", null, null),
            ImmutableMethodParameter("Ljava/lang/Object;", null, null),
        ),
        "Ljava/lang/Object;",
        0,
        null,
        null,
        ImmutableMethodImplementation(
            28,
            listOf(
                ImmutableInstruction3rc(
                    Opcode.INVOKE_STATIC_RANGE,
                    0,
                    textRegisterCount,
                    ImmutableMethodReference("Ld3/kh;", "b", listOf("Ljava/lang/String;"), "V"),
                ),
                ImmutableInstruction21c(
                    Opcode.SGET_OBJECT,
                    0,
                    ImmutableFieldReference("Lvs8/i0;", "a", "Lvs8/i0;"),
                ),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
            null,
            null,
        ),
    )

    private fun menuMethod(
        rowListCalls: Int = 1,
        includeComposerCast: Boolean = true,
        includeSkipToGroupEnd: Boolean = true,
        overwriteItemRegister: Boolean = false,
        dismissRegister: Int = 8,
        branchToRowList: Boolean = false,
    ): Method = method(
        "Lb71/e;",
        "k",
        List(3) { "Ljava/lang/Object;" },
        "Ljava/lang/Object;",
        29,
        menuInstructions(
            rowListCalls,
            includeComposerCast,
            includeSkipToGroupEnd,
            overwriteItemRegister,
            dismissRegister,
            branchToRowList,
        ),
    )

    /** `b71.e.k` の冒頭から行一覧の呼び出しまで。分岐と無関係な命令は省略しています。 */
    private fun menuInstructions(
        rowListCalls: Int,
        includeComposerCast: Boolean,
        includeSkipToGroupEnd: Boolean,
        overwriteItemRegister: Boolean,
        dismissRegister: Int,
        branchToRowList: Boolean,
    ): List<Instruction> = buildList {
        // index 0
        if (includeComposerCast) {
            add(ImmutableInstruction21c(Opcode.CHECK_CAST, 6, ImmutableTypeReference(COMPOSER)))
        } else {
            add(ImmutableInstruction10x(Opcode.NOP))
        }
        // index 1: shouldExecute
        add(composerCall("A", listOf("I", "Z"), "Z", 6, 2, 1))
        // index 2
        add(ImmutableInstruction11x(Opcode.MOVE_RESULT, 1))
        // index 3
        add(ImmutableInstruction22c(Opcode.IGET_OBJECT, 10, 1, ImmutableFieldReference("Lb71/k;", "b", "Lz61/j3;")))
        // index 4
        add(ImmutableInstruction22c(Opcode.INSTANCE_OF, 2, 10, ImmutableTypeReference(ITEM)))
        // index 5: 閉じる動作の lambda
        add(
            if (dismissRegister <= 15) {
                ImmutableInstruction22c(
                    Opcode.IGET_OBJECT,
                    dismissRegister,
                    0,
                    ImmutableFieldReference("Lb71/e;", "b", FUNCTION0),
                )
            } else {
                ImmutableInstruction22cHigh(dismissRegister)
            },
        )
        // index 6: startReplaceGroup
        add(composerCall("q", listOf("I"), "V", 6, 1))
        // index 7: 注入位置より前の分岐。既定では index 9 へ、branchToRowList では注入位置へ向かいます。
        add(ImmutableInstruction21t(Opcode.IF_EQZ, 2, if (branchToRowList) 4 else 5))
        // index 8
        add(if (overwriteItemRegister) ImmutableInstruction11n(Opcode.CONST_4, 10, 0) else ImmutableInstruction10x(Opcode.NOP))
        // index 9
        add(ImmutableInstruction10x(Opcode.NOP))
        // index 10: 行一覧の呼び出し
        repeat(rowListCalls) {
            add(
                ImmutableInstruction35c(
                    Opcode.INVOKE_STATIC,
                    4,
                    1,
                    4,
                    6,
                    0,
                    0,
                    ImmutableMethodReference(ROW_LIST_OWNER, "a", listOf("Lpi1/b;", FUNCTION1, COMPOSER, "I"), "V"),
                ),
            )
        }
        // endReplaceGroup
        add(composerCall("m", emptyList(), "V", 6))
        if (includeSkipToGroupEnd) {
            add(composerCall("l", emptyList(), "V", 6))
        }
    }

    /** `a71.f.a` の行描画部分。 */
    private fun rowListMethod(): Method = method(
        ROW_LIST_OWNER,
        "a",
        listOf("Lpi1/b;", FUNCTION1, COMPOSER, "I"),
        "V",
        16,
        listOf(
            ImmutableInstruction21c(Opcode.NEW_INSTANCE, 2, ImmutableTypeReference(DONOR)),
            ImmutableInstruction35c(
                Opcode.INVOKE_STATIC,
                3,
                1,
                2,
                5,
                0,
                0,
                ImmutableMethodReference("Lt3/l;", "b", listOf("I", "Lvs8/g;", COMPOSER), COMPOSABLE_LAMBDA),
            ),
            ImmutableInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE,
                1,
                7,
                ImmutableMethodReference(
                    "Lz82/r;",
                    "a",
                    listOf(FUNCTION0, MODIFIER, FUNCTION2, FUNCTION2, COMPOSER, "I", "I"),
                    "V",
                ),
            ),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        ),
    )

    private fun composerCall(name: String, parameters: List<String>, result: String, vararg registers: Int) =
        ImmutableInstruction35c(
            Opcode.INVOKE_INTERFACE,
            registers.size,
            registers.getOrElse(0) { 0 },
            registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 },
            0,
            0,
            ImmutableMethodReference(COMPOSER, name, parameters, result),
        )

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        result: String,
        registers: Int,
        instructions: List<Instruction>,
    ): Method = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        result,
        0,
        null,
        null,
        ImmutableMethodImplementation(registers, instructions, null, null),
    )

    /** 4bit に収まらない dismiss register を持つ iget 相当。22c は表現できないため 21c で代用します。 */
    @Suppress("TestFunctionName")
    private fun ImmutableInstruction22cHigh(register: Int): Instruction =
        ImmutableInstruction21c(Opcode.SGET_OBJECT, register, ImmutableFieldReference("Lb71/e;", "b", FUNCTION0))
}
