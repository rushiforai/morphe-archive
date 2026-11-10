package dev.utaa.linimal.patches.features.navigation

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * 隠すタブの page を画面外で作らないための注入先の形と、注入後の命令列を固定します。
 *
 * <p>fixture は 26.16.0 の `mg8.p0`（`getItem` と `getItemId`）の命令列を縮めたものです。
 * `m` は register 4（local 2 + this + position）、`n` は register 2（local 0）で、`n` には空き
 * register がないため、`ordinal()` の呼び出しだけを置き換えます。</p>
 */
class MainTabPageInjectionTest {
    // getItem(int) -------------------------------------------------------------------------------------

    @Test
    fun `the page factory site is found at the start of getItem`() {
        val site = tabPageFactorySite(pageFactory(), 4, listOf("I"), FRAGMENT, ADAPTER)

        assertNotNull(site)
        assertEquals(2, site.thisRegister)
        assertEquals(3, site.positionRegister)
        assertEquals(0, site.scratchRegister)
        assertEquals("g", site.tabsField.name)
        assertEquals(FRAGMENT, site.fragmentType)
    }

    @Test
    fun `a method with no free local register is rejected`() {
        assertNull(tabPageFactorySite(pageFactory(), 2, listOf("I"), FRAGMENT, ADAPTER))
    }

    @Test
    fun `a method that does not start by reading the tab list is rejected`() {
        val shifted = listOf<Instruction>(ImmutableInstruction10x(Opcode.NOP)) + pageFactory()
        assertNull(tabPageFactorySite(shifted, 4, listOf("I"), FRAGMENT, ADAPTER))

        val otherType = pageFactory(listType = "Ljava/util/ArrayList;")
        assertNull(tabPageFactorySite(otherType, 4, listOf("I"), FRAGMENT, ADAPTER))
        assertNull(tabPageFactorySite(pageFactory(), 4, listOf("I"), FRAGMENT, "Lother/Adapter;"))
    }

    @Test
    fun `a method with another signature or return type is rejected`() {
        assertNull(tabPageFactorySite(pageFactory(), 4, listOf("J"), FRAGMENT, ADAPTER))
        assertNull(tabPageFactorySite(pageFactory(), 4, listOf("I"), "I", ADAPTER))
        assertNull(tabPageFactorySite(pageFactory(), 5, listOf("I", "I"), FRAGMENT, ADAPTER))
    }

    @Test
    fun `a method that other code branches into at the first instruction is rejected`() {
        val instructions = pageFactory()
        assertNull(tabPageFactorySite(instructions, 4, listOf("I"), FRAGMENT, ADAPTER, setOf(0)))
    }

    @Test
    fun `the placeholder returns a bare fragment for a hidden page and falls through otherwise`() {
        val implementation = mutable(pageFactory(), registerCount = 4)
        val site = checkNotNull(tabPageFactorySite(implementation.instructions.toList(), 4, listOf("I"), FRAGMENT, ADAPTER))

        placeholderForHiddenPage(implementation, site)

        val instructions = implementation.instructions.toList()
        assertEquals(
            listOf(
                Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT,
                // 元の先頭
                Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE,
            ),
            instructions.take(9).map { it.opcode },
        )
        val load = instructions[0] as ReferenceInstruction
        assertEquals("g", (load.reference as ImmutableFieldReference).name)
        assertEquals(0, (instructions[0] as OneRegisterInstruction).registerA)

        val hook = instructions[1] as FiveRegisterInstruction
        assertEquals(2, hook.registerCount)
        assertEquals(0, hook.registerC)
        assertEquals(3, hook.registerD)
        val hookReference = (hook as ReferenceInstruction).reference as MethodReference
        assertEquals("hidesPage", hookReference.name)
        assertEquals(listOf("Ljava/util/List;", "I"), hookReference.parameterTypes.map { it.toString() })
        assertEquals("Z", hookReference.returnType)

        assertEquals(0, (instructions[2] as OneRegisterInstruction).registerA)
        val branch = instructions[3] as BuilderOffsetInstruction
        assertEquals(0, (instructions[3] as OneRegisterInstruction).registerA)
        // false のときは、元の先頭の命令へ進みます。
        assertEquals(7, branch.target.location.index)

        assertEquals(FRAGMENT, ((instructions[4] as ReferenceInstruction).reference as TypeReference).type)
        val constructor = (instructions[5] as ReferenceInstruction).reference as MethodReference
        assertEquals(FRAGMENT, constructor.definingClass)
        assertEquals("<init>", constructor.name)
        assertTrue(constructor.parameterTypes.isEmpty())
        assertEquals(0, (instructions[5] as FiveRegisterInstruction).registerC)
        assertEquals(0, (instructions[6] as OneRegisterInstruction).registerA)
    }

    // getItemId(int) -----------------------------------------------------------------------------------

    @Test
    fun `the page id site is the ordinal call on the same tab list`() {
        val factory = checkNotNull(tabPageFactorySite(pageFactory(), 4, listOf("I"), FRAGMENT, ADAPTER))

        val site = tabPageIdSite(pageId(), 2, listOf("I"), ADAPTER, factory.tabsField)

        assertEquals(TabPageIdSite(ordinalIndex = 4, tabRegister = 0), site)
    }

    @Test
    fun `the page id of another list or without the cast is rejected`() {
        val factory = checkNotNull(tabPageFactorySite(pageFactory(), 4, listOf("I"), FRAGMENT, ADAPTER))

        assertNull(tabPageIdSite(pageId(field = "other"), 2, listOf("I"), ADAPTER, factory.tabsField))
        assertNull(tabPageIdSite(pageId().filterIndexed { index, _ -> index != 3 }, 2, listOf("I"), ADAPTER, factory.tabsField))
        assertNull(tabPageIdSite(pageId() + pageId(), 2, listOf("I"), ADAPTER, factory.tabsField))
    }

    @Test
    fun `the page id whose element is not this tab list get of the position is rejected`() {
        val factory = checkNotNull(tabPageFactorySite(pageFactory(), 4, listOf("I"), FRAGMENT, ADAPTER))
        fun site(instructions: List<Instruction>, registerCount: Int = 2, parameters: List<String> = listOf("I")) =
            tabPageIdSite(instructions, registerCount, parameters, ADAPTER, factory.tabsField)

        // List.get 以外の呼び出し
        val otherCall = ImmutableInstruction35c(
            Opcode.INVOKE_INTERFACE, 2, 0, 1, 0, 0, 0,
            ImmutableMethodReference(LIST, "remove", listOf("I"), "Ljava/lang/Object;"),
        )
        assertNull(site(pageId().mapIndexed { index, instruction -> if (index == 1) otherCall else instruction }))
        // position 以外を index に渡す
        assertNull(site(pageId().mapIndexed { index, instruction -> if (index == 1) listGet(0, 0) else instruction }))
        // this 以外から一覧を読む
        val otherReceiver = ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, ImmutableFieldReference(ADAPTER, "g", LIST))
        assertNull(site(pageId().mapIndexed { index, instruction -> if (index == 0) otherReceiver else instruction }))
        // getItemId でない signature
        assertNull(site(pageId(), parameters = listOf("J")))
        assertNull(site(pageId(), registerCount = 3))
    }

    @Test
    fun `the ordinal call is replaced by the hook with the same register`() {
        val implementation = mutable(pageId(), registerCount = 2)
        val factory = checkNotNull(tabPageFactorySite(pageFactory(), 4, listOf("I"), FRAGMENT, ADAPTER))
        val site = checkNotNull(tabPageIdSite(implementation.instructions.toList(), 2, listOf("I"), ADAPTER, factory.tabsField))

        separateHiddenPageId(implementation, site)

        val instructions = implementation.instructions.toList()
        assertEquals(8, instructions.size)
        val hook = instructions[4] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, hook.opcode)
        assertEquals(1, hook.registerCount)
        assertEquals(0, hook.registerC)
        val reference = (hook as ReferenceInstruction).reference as MethodReference
        assertEquals("pageItemOrdinal", reference.name)
        assertEquals(listOf("Ljava/lang/Enum;"), reference.parameterTypes.map { it.toString() })
        assertEquals("I", reference.returnType)
        assertEquals(Opcode.MOVE_RESULT, instructions[5].opcode)
        assertEquals(Opcode.INT_TO_LONG, instructions[6].opcode)
        assertEquals(Opcode.RETURN_WIDE, instructions[7].opcode)
    }

    // placeholder の型 ------------------------------------------------------------------------------------

    @Test
    fun `only a concrete fragment with a public no-arg constructor can be the placeholder`() {
        assertTrue(isInstantiablePlaceholder(fragmentClass()))
        assertFalse(isInstantiablePlaceholder(fragmentClass(classFlags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value)))
        assertFalse(isInstantiablePlaceholder(fragmentClass(constructorFlags = AccessFlags.PROTECTED.value)))
        assertFalse(isInstantiablePlaceholder(fragmentClass(constructorParameters = listOf("I"))))
        assertFalse(isInstantiablePlaceholder(null))
    }

    // fixture ------------------------------------------------------------------------------------------

    /** 26.16.0 の `p0.m(int)` の先頭と、残りを縮めたもの。this=v2、position=v3。 */
    private fun pageFactory(listType: String = LIST): List<Instruction> = listOf(
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 2, ImmutableFieldReference(ADAPTER, "g", listType)),
        listGet(0, 3),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 3),
        ImmutableInstruction21c(Opcode.CHECK_CAST, 3, ImmutableTypeReference("Ljp/naver/line/android/activity/main/a;")),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 2),
    )

    /** 26.16.0 の `p0.n(int)`。this=v0、position=v1 で、空き register はありません。 */
    private fun pageId(field: String = "g"): List<Instruction> = listOf(
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 0, ImmutableFieldReference(ADAPTER, field, LIST)),
        listGet(0, 1),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference("Ljp/naver/line/android/activity/main/a;")),
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0,
            ImmutableMethodReference("Ljava/lang/Enum;", "ordinal", emptyList(), "I"),
        ),
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
        ImmutableInstruction12x(Opcode.INT_TO_LONG, 0, 0),
        ImmutableInstruction11x(Opcode.RETURN_WIDE, 0),
    )

    private fun listGet(listRegister: Int, positionRegister: Int): Instruction = ImmutableInstruction35c(
        Opcode.INVOKE_INTERFACE, 2, listRegister, positionRegister, 0, 0, 0,
        ImmutableMethodReference(LIST, "get", listOf("I"), "Ljava/lang/Object;"),
    )

    private fun fragmentClass(
        classFlags: Int = AccessFlags.PUBLIC.value,
        constructorFlags: Int = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
        constructorParameters: List<String> = emptyList(),
    ) = ImmutableClassDef(
        FRAGMENT,
        classFlags,
        "Ljava/lang/Object;",
        null,
        null,
        null,
        null,
        listOf(
            ImmutableMethod(
                FRAGMENT,
                "<init>",
                constructorParameters.map { com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(it, null, null) },
                "V",
                constructorFlags or AccessFlags.CONSTRUCTOR.value,
                null,
                null,
                null,
            ),
        ),
    )

    private fun mutable(instructions: List<Instruction>, registerCount: Int): MutableMethodImplementation =
        MutableMethodImplementation(ImmutableMethodImplementation(registerCount, instructions, emptyList(), emptyList()))

    private companion object {
        const val ADAPTER = "Lmg8/p0;"
        const val FRAGMENT = "Landroidx/fragment/app/v;"
        const val LIST = "Ljava/util/List;"
    }
}
