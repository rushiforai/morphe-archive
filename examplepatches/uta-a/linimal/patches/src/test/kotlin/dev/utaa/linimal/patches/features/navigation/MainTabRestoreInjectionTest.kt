package dev.utaa.linimal.patches.features.navigation

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull

/**
 * ViewPager が復元した隠しページを、ページ選択の通知で 0 へ戻す注入の形を固定します。
 * fixture は 26.16.0 の `MainActivityTabManager.I(int)` と、同 class の ViewPager 利用箇所を縮めたものです。
 */
class MainTabRestoreInjectionTest {
    @Test
    fun `the view pager field and setCurrentItem are found uniquely in the manager class`() {
        val access = assertNotNull(viewPagerAccess(managerBody(), MANAGER))

        assertEquals("j", access.first.name)
        assertEquals("w", access.second.name)
    }

    @Test
    fun `two different view pager fields are ambiguous`() {
        val other = ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, ImmutableFieldReference(MANAGER, "k", VIEW_PAGER))

        assertNull(viewPagerAccess(managerBody() + other, MANAGER))
    }

    @Test
    fun `two different setCurrentItem candidates are ambiguous`() {
        val other = ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, 3, 0, 1, 2, 0, 0,
            ImmutableMethodReference(VIEW_PAGER, "x", listOf("I", "Z"), "V"),
        )

        assertNull(viewPagerAccess(managerBody() + other, MANAGER))
    }

    @Test
    fun `a view pager field of another class is ignored`() {
        assertNull(viewPagerAccess(managerBody(), "Lother/Manager;"))
    }

    @Test
    fun `the site uses this and the position parameter at the end of the registers`() {
        val site = assertNotNull(site(registerCount = 16))

        assertEquals(14, site.thisRegister)
        assertEquals(15, site.positionRegister)
    }

    @Test
    fun `a position register above v15 is rejected`() {
        assertNull(site(registerCount = 18))
    }

    @Test
    fun `a method without locals for the scratch registers is rejected`() {
        assertNull(site(registerCount = 3))
    }

    @Test
    fun `a method with a different parameter list is rejected`() {
        assertNull(site(registerCount = 16, parameters = listOf("I", "I")))
    }

    @Test
    fun `an entry that is an exception handler target is rejected`() {
        assertNull(site(registerCount = 16, handlers = setOf(0)))
    }

    @Test
    fun `the view pager access is required`() {
        assertNull(restoredPageSite(body(), 16, listOf("I"), null, PROVIDER_FIELD, TAB_AT_POSITION))
    }

    @Test
    fun `the hook is a guard that returns before the original body for a hidden page`() {
        val implementation = MutableMethodImplementation(
            ImmutableMethodImplementation(16, body(), emptyList(), emptyList()),
        )

        resetHiddenPage(implementation, assertNotNull(site(registerCount = 16)))

        val instructions = implementation.instructions.toList()
        assertEquals(
            listOf(
                Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL,
                Opcode.RETURN_VOID, Opcode.NOP, Opcode.RETURN_VOID,
            ),
            instructions.map { it.opcode },
        )
        val hook = (instructions[3] as ReferenceInstruction).reference as MethodReference
        assertEquals("resetsHiddenPage", hook.name)
        assertEquals(listOf("Ljava/lang/Enum;", "I"), hook.parameterTypes.map { it.toString() })
        assertEquals("Z", hook.returnType)
        // 隠さないページは、分岐で元の先頭命令（index 10）へ進みます。
        assertEquals(10, (instructions[5] as BuilderOffsetInstruction).target.location.index)
        // ViewPager.setCurrentItem(0, false): v1 = ViewPager、v0 = 0 を 2 回渡します。
        val reset = instructions[8] as FiveRegisterInstruction
        assertEquals(listOf(1, 0, 0), listOf(reset.registerC, reset.registerD, reset.registerE))
        assertEquals("w", ((reset as ReferenceInstruction).reference as MethodReference).name)
        // 一時領域は v0 / v1 だけに書き、this と position は読むだけです。
        val written = instructions.take(10).filter { it.opcode.setsRegister() }
            .map { (it as OneRegisterInstruction).registerA }
        assertEquals(setOf(0, 1), written.toSet())
    }

    private fun site(
        registerCount: Int,
        parameters: List<String> = listOf("I"),
        handlers: Set<Int> = emptySet(),
    ) = restoredPageSite(
        body(), registerCount, parameters, viewPagerAccess(managerBody(), MANAGER),
        PROVIDER_FIELD, TAB_AT_POSITION, handlers,
    )

    /** `I(int)` を縮めた形。 */
    private fun body(): List<Instruction> = listOf(
        ImmutableInstruction10x(Opcode.NOP),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    /** 同 class の他の method で、ViewPager を取り出して `w(int, boolean)` を呼ぶ形。 */
    private fun managerBody(): List<Instruction> = listOf(
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 5, ImmutableFieldReference(MANAGER, "j", VIEW_PAGER)),
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, 3, 0, 1, 2, 0, 0,
            ImmutableMethodReference(VIEW_PAGER, "w", listOf("I", "Z"), "V"),
        ),
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0,
            ImmutableMethodReference(VIEW_PAGER, "getCurrentItem", emptyList(), "I"),
        ),
    )

    private companion object {
        const val MANAGER = "Ljp/naver/line/android/activity/main/c;"
        const val VIEW_PAGER = "Landroidx/viewpager/widget/ViewPager;"
        const val PROVIDER = "Lmg8/d;"
        const val TAB = "Ljp/naver/line/android/activity/main/a;"
        val PROVIDER_FIELD = ImmutableFieldReference(MANAGER, "c", PROVIDER)
        val TAB_AT_POSITION = ImmutableMethodReference(PROVIDER, "e", listOf("I"), TAB)
    }
}
