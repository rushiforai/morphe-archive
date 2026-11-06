package dev.utaa.linimal.patches.features.readwithoutreceipt

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22b
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val COMPOSER = "Lj3/r;"
private const val COMPOSER_IMPL = "Lj3/d1;"
private const val FUNCTION0 = "Lnt8/a;"
private const val FUNCTION2 = "Lnt8/p;"
private const val FUNCTION = "Lvs8/g;"
private const val COMPOSABLE_LAMBDA = "Lt3/k;"
private const val MENU_ITEMS = "Lrx1/a;"
private const val PROMOTION = "Lrx1/i;"
private const val MENU_OWNER = "Lrx1/h;"
private const val CALLBACK = "Lcom/linecorp/line/chat/ui/impl/preview/ChatHistoryPreviewActivity\$c;"
private const val PREVIEW_ITEM = "Lpi1/b;"
private const val PROMOTION_LABEL = "Lrx1/b;"
private const val ITEM_LABEL = "Lrx1/d;"
private const val UNIT = "Lvs8/i0;"

/** caller fixture でメニュー composable を呼ぶ命令の index。これが注入位置です。 */
private const val MENU_CALL_INDEX = 12

/**
 * スクロールプレビューのメニュー（`rx1/h.a`）と、それを Column の中で呼ぶ `rx1/c0.f`、行一覧のラベル lambda
 * （`rx1/d`）を、26.16.0 で実測した並びと register のまま fixture で再現します。分岐と無関係な命令は省きます。
 */
class ReadWithoutReceiptPreviewMenuPatchTest {
    private val menu = menuMethod()

    @Test
    fun `the measured menu resolves the row, the lambda factory and the group calls`() {
        val shape = checkNotNull(previewMenuShape(menu))

        assertEquals(COMPOSER, shape.composerInterface)
        assertEquals("b", shape.row.name)
        assertEquals(MENU_OWNER, shape.row.definingClass)
        assertEquals("b", shape.rememberLambda.name)
        assertEquals("q", shape.startGroup.name)
        assertEquals(COMPOSER_IMPL, shape.startGroup.definingClass)
        assertEquals("X", shape.endGroup.name)
        assertEquals(listOf(PROMOTION_LABEL, ITEM_LABEL), shape.labelDonorTypes)
    }

    @Test
    fun `the fingerprint filter accepts only the menu signature`() {
        assertTrue(looksLikePreviewMenu(menu, MENU_ITEMS, PROMOTION))
        assertFalse(looksLikePreviewMenu(menu, MENU_ITEMS, "Lother;"))
    }

    @Test
    fun `a menu with a single row call is rejected`() {
        assertNull(previewMenuShape(menuMethod(itemRow = false)))
    }

    @Test
    fun `the measured caller resolves the insertion point and registers`() {
        val shape = checkNotNull(previewMenuCallerShape(callerMethod(), menu))

        assertEquals(MENU_CALL_INDEX, shape.insertionIndex)
        assertEquals(PREVIEW_ITEM, shape.itemType)
        assertEquals(0, shape.itemRegister)
        assertEquals(COMPOSER_IMPL, shape.composerType)
        assertEquals(11, shape.composerRegister)
    }

    @Test
    fun `the caller only matches when it calls the menu once`() {
        assertTrue(callsExactlyOnce(callerMethod(), menu))
        assertFalse(callsExactlyOnce(menu, menu))
    }

    @Test
    fun `an item register that one branch does not load from the model is rejected`() {
        assertNull(previewMenuCallerShape(callerMethod(clobberOneBranch = true), menu))
    }

    @Test
    fun `an item register overwritten after the model is loaded is rejected`() {
        assertNull(previewMenuCallerShape(callerMethod(overwriteBeforeMenu = true), menu))
    }

    @Test
    fun `an insertion point that is also a branch target is rejected`() {
        assertNull(previewMenuCallerShape(callerMethod(branchToMenuCall = true), menu))
    }

    @Test
    fun `a composer the row invocation cannot address is rejected`() {
        assertNull(previewMenuCallerShape(callerMethod(composerRegister = 16), menu))
    }

    @Test
    fun `the item label donor yields the text call and the Unit field`() {
        val shape = checkNotNull(previewLabelShape(itemLabelClass(), COMPOSER, menuOwnerClass()))

        assertEquals("c", shape.text.name)
        assertEquals("A", shape.shouldExecute.name)
        assertEquals("l", shape.skipToGroupEnd.name)
        assertEquals(UNIT, shape.unitField.definingClass)
        assertEquals(listOf(FUNCTION2), shape.interfaces)
    }

    @Test
    fun `a donor whose lambda also draws layout nodes is rejected`() {
        assertNull(previewLabelShape(itemLabelClass(extraComposerCall = true), COMPOSER, menuOwnerClass()))
    }

    @Test
    fun `a donor whose text call lives outside the menu class is rejected`() {
        assertNull(previewLabelShape(itemLabelClass(textOwner = "Lother;"), COMPOSER, menuOwnerClass()))
    }

    @Test
    fun `the callback contract holds for the measured Kotlin function interfaces`() {
        val menuShape = checkNotNull(previewMenuShape(menu))
        val labelShape = checkNotNull(previewLabelShape(itemLabelClass(), COMPOSER, menuOwnerClass()))

        assertTrue(previewCallbackContractHolds(menuShape, labelShape, functionTypes()::get))
    }

    @Test
    fun `a row callback that is not an interface is rejected`() {
        val menuShape = checkNotNull(previewMenuShape(menu))
        val labelShape = checkNotNull(previewLabelShape(itemLabelClass(), COMPOSER, menuOwnerClass()))
        val types = functionTypes() + (FUNCTION0 to typeClass(FUNCTION0, isInterface = false, invokeArity = 0))

        assertFalse(previewCallbackContractHolds(menuShape, labelShape, types::get))
    }

    @Test
    fun `a label interface without the two argument invoke is rejected`() {
        val menuShape = checkNotNull(previewMenuShape(menu))
        val labelShape = checkNotNull(previewLabelShape(itemLabelClass(), COMPOSER, menuOwnerClass()))
        val types = functionTypes() + (FUNCTION2 to typeClass(FUNCTION2, invokeArity = 1, superInterface = FUNCTION))

        assertFalse(previewCallbackContractHolds(menuShape, labelShape, types::get))
    }

    @Test
    fun `a lambda factory whose parameter the label cannot satisfy is rejected`() {
        val menuShape = checkNotNull(previewMenuShape(menu))
        val labelShape = checkNotNull(previewLabelShape(itemLabelClass(), COMPOSER, menuOwnerClass()))
        val types = functionTypes() + (FUNCTION2 to typeClass(FUNCTION2, invokeArity = 2, superInterface = null))

        assertFalse(previewCallbackContractHolds(menuShape, labelShape, types::get))
    }

    private fun functionTypes(): Map<String, ImmutableClassDef> = mapOf(
        FUNCTION0 to typeClass(FUNCTION0, invokeArity = 0, superInterface = FUNCTION),
        FUNCTION2 to typeClass(FUNCTION2, invokeArity = 2, superInterface = FUNCTION),
        FUNCTION to typeClass(FUNCTION, invokeArity = null, superInterface = null),
    )

    private fun typeClass(
        type: String,
        isInterface: Boolean = true,
        invokeArity: Int?,
        superInterface: String? = FUNCTION,
    ): ImmutableClassDef {
        val methods = invokeArity?.let { arity ->
            listOf(
                ImmutableMethod(
                    type,
                    "invoke",
                    List(arity) { ImmutableMethodParameter("Ljava/lang/Object;", null, null) },
                    "Ljava/lang/Object;",
                    AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value,
                    null,
                    null,
                    null,
                ),
            )
        }
        val flags = if (isInterface) {
            AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value
        } else {
            AccessFlags.PUBLIC.value
        }
        return ImmutableClassDef(type, flags, "Ljava/lang/Object;", listOfNotNull(superInterface), null, null, null, methods)
    }

    @Test
    fun `the data flow follows both branches into the merge point`() {
        val instructions = checkNotNull(callerMethod().implementation).instructions.toList()

        assertTrue(registerHoldsParameterAt(instructions, 0, 22, MENU_CALL_INDEX))
        assertFalse(registerHoldsParameterAt(instructions, 1, 22, MENU_CALL_INDEX))
    }

    @Test
    fun `the data flow does not trust a value from before a loop back edge`() {
        val code = Code()
        code += ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 22)
        val loop = code.mark()
        code += ImmutableInstruction11n(Opcode.CONST_4, 1, 0)
        code.branch(ImmutableInstruction21t(Opcode.IF_EQZ, 1, 0), "end")
        code += ImmutableInstruction11n(Opcode.CONST_4, 0, 0)
        code.goto(loop)
        code.label("end")
        code += ImmutableInstruction10x(Opcode.RETURN_VOID)

        assertFalse(registerHoldsParameterAt(code.build(), 0, 22, code.size - 1))
    }

    private fun menuMethod(itemRow: Boolean = true): Method {
        val code = Code()
        code += ImmutableInstruction31i(Opcode.CONST, 0, 0x138256c2)
        code += invokeInterface(listOf(13, 0), methodRef(COMPOSER, "x", listOf("I"), COMPOSER_IMPL))
        code += ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 13)
        code += ImmutableInstruction11n(Opcode.CONST_4, 4, 0)
        code.branch(ImmutableInstruction21t(Opcode.IF_EQZ, 10, 0), "noPromotion")
        code += invokeVirtual(listOf(13, 3), methodRef(COMPOSER_IMPL, "q", listOf("I"), "V"))
        code += ImmutableInstruction21c(Opcode.NEW_INSTANCE, 3, ImmutableTypeReference(PROMOTION_LABEL))
        code += invokeStatic(listOf(6, 3, 13), rememberLambda())
        code += ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 3)
        code += invokeStatic(listOf(11, 3, 13, 6), row())
        code += invokeVirtual(listOf(13, 4), methodRef(COMPOSER_IMPL, "X", listOf("Z"), "V"))
        code.branch(ImmutableInstruction10t(Opcode.GOTO, 0), "items")
        code.label("noPromotion")
        code += invokeVirtual(listOf(13, 3), methodRef(COMPOSER_IMPL, "q", listOf("I"), "V"))
        code += invokeVirtual(listOf(13, 4), methodRef(COMPOSER_IMPL, "X", listOf("Z"), "V"))
        code.label("items")
        code += ImmutableInstruction21c(Opcode.NEW_INSTANCE, 7, ImmutableTypeReference(ITEM_LABEL))
        code += invokeStatic(listOf(6, 7, 13), rememberLambda())
        code += ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6)
        if (itemRow) {
            code += invokeStatic(listOf(8, 6, 13, 1), row())
        }
        code += ImmutableInstruction10x(Opcode.RETURN_VOID)
        return staticMethod(
            MENU_OWNER,
            "a",
            listOf(MENU_ITEMS, PROMOTION, FUNCTION0, CALLBACK, COMPOSER, "I"),
            15,
            code.build(),
        )
    }

    /** `rx1/c0.f`。p0 = v22（トーク model）、p5 = v27（Composer）。 */
    private fun callerMethod(
        clobberOneBranch: Boolean = false,
        overwriteBeforeMenu: Boolean = false,
        branchToMenuCall: Boolean = false,
        composerRegister: Int = 11,
    ): Method {
        val code = Code()
        code += ImmutableInstruction31i(Opcode.CONST, 0, 0x583bd461)
        code += ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, 27)
        code += invokeInterface(listOf(1, 0), methodRef(COMPOSER, "x", listOf("I"), COMPOSER_IMPL))
        code += ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, composerRegister)
        code += ImmutableInstruction22b(Opcode.AND_INT_LIT8, 0, 6, 6)
        code.branch(ImmutableInstruction21t(Opcode.IF_NEZ, 0, 0), "other")
        code += ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 22)
        code.branch(ImmutableInstruction10t(Opcode.GOTO, 0), "loaded")
        code.label("other")
        if (clobberOneBranch) {
            code += ImmutableInstruction11n(Opcode.CONST_4, 0, 0)
        } else {
            code += ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 22)
        }
        code.label("loaded")
        code += invokeStatic(listOf(0), methodRef("La71/f;", "b", listOf(PREVIEW_ITEM), "Ljava/util/ArrayList;"))
        if (overwriteBeforeMenu) {
            code += ImmutableInstruction11n(Opcode.CONST_4, 0, 0)
        } else {
            code += ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1)
        }
        if (branchToMenuCall) {
            code.branch(ImmutableInstruction21t(Opcode.IF_EQZ, 1, 0), "menu")
        } else {
            code += ImmutableInstruction11n(Opcode.CONST_4, 2, 0)
        }
        code.label("menu")
        code += ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, composerRegister - 4, 6, menuRef())
        code += ImmutableInstruction10x(Opcode.RETURN_VOID)
        val instructions = code.build()
        check(branchToMenuCall || overwriteBeforeMenu || instructions[MENU_CALL_INDEX].opcode == Opcode.INVOKE_STATIC_RANGE)
        return staticMethod(
            "Lrx1/c0;",
            "f",
            listOf(PREVIEW_ITEM, PROMOTION, CALLBACK, FUNCTION0, "Lb4/j;", COMPOSER, "I"),
            29,
            instructions,
        )
    }

    private fun itemLabelClass(extraComposerCall: Boolean = false, textOwner: String = MENU_OWNER): ImmutableClassDef {
        val code = Code()
        code += ImmutableInstruction21c(Opcode.CHECK_CAST, 5, ImmutableTypeReference(COMPOSER))
        code += invokeInterface(listOf(5, 6, 0), methodRef(COMPOSER, "A", listOf("I", "Z"), "Z"))
        code += ImmutableInstruction11x(Opcode.MOVE_RESULT, 6)
        code.branch(ImmutableInstruction21t(Opcode.IF_EQZ, 6, 0), "skip")
        code += invokeStatic(listOf(5, 4), methodRef("Lh5/h;", "d", listOf(COMPOSER, "I"), "Ljava/lang/String;"))
        code += ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4)
        code += invokeStatic(listOf(4, 5, 3), methodRef(textOwner, "c", listOf("Ljava/lang/String;", COMPOSER, "I"), "V"))
        if (extraComposerCall) {
            code += invokeInterface(listOf(5), methodRef(COMPOSER, "k", emptyList(), "V"))
        }
        code.branch(ImmutableInstruction10t(Opcode.GOTO, 0), "done")
        code.label("skip")
        code += invokeInterface(listOf(5), methodRef(COMPOSER, "l", emptyList(), "V"))
        code.label("done")
        code += ImmutableInstruction21c(Opcode.SGET_OBJECT, 4, ImmutableFieldReference(UNIT, "a", UNIT))
        code += ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4)
        val invoke = ImmutableMethod(
            ITEM_LABEL,
            "invoke",
            listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null), ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
            "Ljava/lang/Object;",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            ImmutableMethodImplementation(7, code.build(), null, null),
        )
        return ImmutableClassDef(
            ITEM_LABEL,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            "Ljava/lang/Object;",
            listOf(FUNCTION2),
            null,
            null,
            null,
            listOf(invoke),
        )
    }

    private fun menuOwnerClass(): ImmutableClassDef = ImmutableClassDef(
        MENU_OWNER,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        "Ljava/lang/Object;",
        null,
        null,
        null,
        null,
        listOf(menu),
    )

    private fun row() = methodRef(MENU_OWNER, "b", listOf(FUNCTION0, COMPOSABLE_LAMBDA, COMPOSER, "I"), "V")

    private fun rememberLambda() = methodRef("Lt3/l;", "b", listOf("I", FUNCTION, COMPOSER), COMPOSABLE_LAMBDA)

    private fun menuRef() = methodRef(MENU_OWNER, "a", listOf(MENU_ITEMS, PROMOTION, FUNCTION0, CALLBACK, COMPOSER, "I"), "V")

    private fun methodRef(owner: String, name: String, parameters: List<String>, returnType: String) =
        ImmutableMethodReference(owner, name, parameters, returnType)

    private fun invokeStatic(registers: List<Int>, reference: ImmutableMethodReference) =
        invoke(Opcode.INVOKE_STATIC, registers, reference)

    private fun invokeVirtual(registers: List<Int>, reference: ImmutableMethodReference) =
        invoke(Opcode.INVOKE_VIRTUAL, registers, reference)

    private fun invokeInterface(registers: List<Int>, reference: ImmutableMethodReference) =
        invoke(Opcode.INVOKE_INTERFACE, registers, reference)

    private fun invoke(opcode: Opcode, registers: List<Int>, reference: ImmutableMethodReference): Instruction {
        val r = registers + List(5 - registers.size) { 0 }
        return ImmutableInstruction35c(opcode, registers.size, r[0], r[1], r[2], r[3], r[4], reference)
    }

    private fun staticMethod(
        owner: String,
        name: String,
        parameters: List<String>,
        registerCount: Int,
        instructions: List<Instruction>,
    ): Method = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
        null,
        null,
        ImmutableMethodImplementation(registerCount, instructions, null, null),
    )

    /** 分岐先をラベルで書ける小さな命令列 builder。offset は code unit 単位で最後に解決します。 */
    private class Code {
        private val entries = mutableListOf<Instruction>()
        private val branches = mutableMapOf<Int, Any>()
        private val labels = mutableMapOf<String, Int>()

        val size: Int get() = entries.size

        operator fun plusAssign(instruction: Instruction) {
            entries += instruction
        }

        fun mark(): Int = entries.size

        fun label(name: String) {
            labels[name] = entries.size
        }

        fun branch(instruction: Instruction, target: String) {
            branches[entries.size] = target
            entries += instruction
        }

        fun goto(target: Int) {
            branches[entries.size] = target
            entries += ImmutableInstruction10t(Opcode.GOTO, 0)
        }

        fun build(): List<Instruction> {
            val addresses = entries.runningFold(0) { address, instruction -> address + instruction.codeUnits }
            return entries.mapIndexed { index, instruction ->
                val target = branches[index] ?: return@mapIndexed instruction
                val targetIndex = when (target) {
                    is String -> checkNotNull(labels[target])
                    else -> target as Int
                }
                val offset = addresses[targetIndex] - addresses[index]
                when (instruction) {
                    is ImmutableInstruction21t -> ImmutableInstruction21t(instruction.opcode, instruction.registerA, offset)
                    is ImmutableInstruction10t -> ImmutableInstruction10t(instruction.opcode, offset)
                    else -> error("unsupported branch")
                }
            }
        }
    }

    @Test
    fun `the fixture places the menu call at the documented index`() {
        assertNotNull(callerMethod().implementation)
        assertEquals(
            Opcode.INVOKE_STATIC_RANGE,
            checkNotNull(callerMethod().implementation).instructions.toList()[MENU_CALL_INDEX].opcode,
        )
    }
}
