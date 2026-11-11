package dev.utaa.linimal.patches.features.navigation

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull

/**
 * 下部タブの注入先の形と、注入後の命令列を固定します。
 *
 * <p>以前は下部ボタンの constructor に渡る List を絞っていたため、ボタンの位置と ViewPager の位置が
 * ずれました（issue #14）。現在は一覧に触れず、ボタンの表示と、隠したタブへの遷移先だけを変えます。
 * fixture は 26.16.0 の `ng8.p` / `MainActivityTabManager` の命令列を縮めたものです。</p>
 */
class MainTabsPatchTest {
    // 下部ボタン（ng8.p）の constructor -----------------------------------------------------------------

    @Test
    fun `edits in the same method are applied from the last index regardless of the argument order`() {
        val applied = mutableListOf<Int>()

        applyEditsFromLast(3 to { applied += 3 }, 10 to { applied += 10 })
        applyEditsFromLast(10 to { applied += 10 }, 3 to { applied += 3 })

        // wallet と button のどちらが先に現れても、後ろの位置から書き換えます。
        assertEquals(listOf(10, 3, 10, 3), applied)
    }

    @Test
    fun `the button position is found right after the Integer cast of the lookup`() {
        val site = buttonPositionSite(buttonConstructor(), DESCRIPTOR, BUTTON_CONTROLLER)

        assertEquals(ButtonPositionSite(insertIndex = 8, buttonRegister = 8, positionRegister = 9), site)
    }

    @Test
    fun `the button hook replaces the position register and keeps the loop intact`() {
        val implementation = mutable(buttonConstructor(), registerCount = 20)
        val site = checkNotNull(buttonPositionSite(implementation.instructions.toList(), DESCRIPTOR, BUTTON_CONTROLLER))

        hideButtonAtPosition(implementation, site)

        val instructions = implementation.instructions.toList()
        assertEquals(Opcode.CHECK_CAST, instructions[7].opcode)
        val hook = instructions[8] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, hook.opcode)
        assertEquals(2, hook.registerCount)
        assertEquals(8, hook.registerC)
        assertEquals(9, hook.registerD)
        val reference = (hook as ReferenceInstruction).reference as MethodReference
        assertEquals("Ldev/utaa/linimal/extension/features/MainTabHooks;", reference.definingClass)
        assertEquals("visibleButtonPosition", reference.name)
        assertEquals(listOf("Ljava/lang/Enum;", "Ljava/lang/Integer;"), reference.parameterTypes.map { it.toString() })
        assertEquals("Ljava/lang/Integer;", reference.returnType)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, instructions[9].opcode)
        assertEquals(9, (instructions[9] as OneRegisterInstruction).registerA)
        // ループの先頭（aget-object）へ戻る goto は変わりません。
        val back = instructions[11] as BuilderOffsetInstruction
        assertEquals(Opcode.GOTO, back.opcode)
        assertEquals(3, back.target.location.index)
    }

    @Test
    fun `an array that does not come from the descriptor values is rejected`() {
        val instructions = buttonConstructor().toMutableList().also {
            it[0] = invokeStatic("Lother/Descriptor;", "values", emptyList(), "[Lother/Descriptor;")
        }

        assertNull(buttonPositionSite(instructions, DESCRIPTOR, BUTTON_CONTROLLER))
    }

    @Test
    fun `a lookup that does not read the own LinkedHashMap field is rejected`() {
        val instructions = buttonConstructor().toMutableList().also {
            it[4] = iget(9, 0, "Lother/Holder;", "map", "Ljava/util/LinkedHashMap;")
        }

        assertNull(buttonPositionSite(instructions, DESCRIPTOR, BUTTON_CONTROLLER))
    }

    @Test
    fun `a button position register outside the non-range invoke window is rejected`() {
        val instructions = buttonConstructor().toMutableList().also {
            it[6] = ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 16)
            it[7] = ImmutableInstruction21c(Opcode.CHECK_CAST, 16, ImmutableTypeReference("Ljava/lang/Integer;"))
        }

        assertNull(buttonPositionSite(instructions, DESCRIPTOR, BUTTON_CONTROLLER))
    }

    @Test
    fun `a branch into the position after the cast would skip the hook and is rejected`() {
        val instructions = buttonConstructor().toMutableList().also {
            // index 2 に if を足すと cast の直後は addr 17 になります。そこを分岐先にします。
            it.add(2, ImmutableInstruction21t(Opcode.IF_EQZ, 6, 13))
        }

        assertNull(buttonPositionSite(instructions, DESCRIPTOR, BUTTON_CONTROLLER))
    }

    @Test
    fun `two matching lookups are ambiguous and rejected`() {
        val block = buttonConstructor().subList(0, 9)

        assertNull(buttonPositionSite(block + block, DESCRIPTOR, BUTTON_CONTROLLER))
    }

    @Test
    fun `the wallet tooltip site is the branch on contains of the bottom tab WALLET`() {
        val site = walletTooltipSite(buttonConstructor(), DESCRIPTOR, BUTTON_CONTROLLER)

        assertEquals(WalletTooltipSite(insertIndex = 16, resultRegister = 1), site)
    }

    @Test
    fun `the wallet tooltip hook rewrites the contains result before the branch`() {
        val implementation = mutable(buttonConstructor(), registerCount = 20)
        val site = checkNotNull(walletTooltipSite(implementation.instructions.toList(), DESCRIPTOR, BUTTON_CONTROLLER))

        gateWalletTooltip(implementation, site)

        val instructions = implementation.instructions.toList()
        assertEquals(Opcode.MOVE_RESULT, instructions[15].opcode)
        val hook = instructions[16] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, hook.opcode)
        assertEquals(1, hook.registerCount)
        assertEquals(1, hook.registerC)
        val reference = (hook as ReferenceInstruction).reference as MethodReference
        assertEquals("keepsWalletTooltip", reference.name)
        assertEquals(listOf("Z"), reference.parameterTypes.map { it.toString() })
        assertEquals("Z", reference.returnType)
        assertEquals(Opcode.MOVE_RESULT, instructions[17].opcode)
        assertEquals(1, (instructions[17] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, instructions[18].opcode)
    }

    @Test
    fun `a contains of the descriptor WALLET is not the wallet tooltip site`() {
        val instructions = buttonConstructor().toMutableList().also {
            it[13] = ImmutableInstruction21c(
                Opcode.SGET_OBJECT,
                3,
                ImmutableFieldReference(DESCRIPTOR, "WALLET", DESCRIPTOR),
            )
        }

        assertNull(walletTooltipSite(instructions, DESCRIPTOR, BUTTON_CONTROLLER))
    }

    // タブ管理（MainActivityTabManager）の constructor ----------------------------------------------------

    @Test
    fun `the restored position site reads the list from the button controller arguments`() {
        val site = restoredPositionSite(managerConstructor(), MANAGER, BUTTON_CONTROLLER)

        assertNotNull(site)
        assertEquals(6, site.storeIndex)
        assertEquals(9, site.tabsRegister)
        assertEquals(14, site.positionRegister)
        assertEquals(12, site.thisRegister)
        assertEquals("r", site.positionField.name)
        assertEquals(TAB_AT_POSITION, site.tabAtPosition)
    }

    @Test
    fun `the restored position hook replaces the store and both branches still pass through it`() {
        val implementation = mutable(managerConstructor(), registerCount = 20)
        val site = checkNotNull(restoredPositionSite(implementation.instructions.toList(), MANAGER, BUTTON_CONTROLLER))

        redirectRestoredPosition(implementation, site)

        val instructions = implementation.instructions.toList()
        val hook = instructions[6] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, hook.opcode)
        assertEquals(9, hook.registerC)
        assertEquals(14, hook.registerD)
        val reference = (hook as ReferenceInstruction).reference as MethodReference
        assertEquals("visibleTabPosition", reference.name)
        assertEquals(listOf("Ljava/util/List;", "I"), reference.parameterTypes.map { it.toString() })
        assertEquals("I", reference.returnType)
        assertEquals(Opcode.MOVE_RESULT, instructions[7].opcode)
        assertEquals(14, (instructions[7] as OneRegisterInstruction).registerA)
        val store = instructions[8] as TwoRegisterInstruction
        assertEquals(Opcode.IPUT, store.opcode)
        assertEquals(14, store.registerA)
        assertEquals(12, store.registerB)
        assertEquals("r", ((store as ReferenceInstruction).reference as FieldReference).name)
        // 元の iput の直後にあった e(position) はそのまま残ります。
        assertEquals(Opcode.INVOKE_VIRTUAL, instructions[9].opcode)
        // goto は、元の iput だった位置（hook の invoke）を指したままです。
        val jump = instructions[4] as BuilderOffsetInstruction
        assertEquals(Opcode.GOTO, jump.opcode)
        assertEquals(6, jump.target.location.index)
    }

    @Test
    fun `a list register that is overwritten before the store is rejected`() {
        val instructions = managerConstructor().toMutableList().also {
            it[3] = ImmutableInstruction11n(Opcode.CONST_4, 9, 2)
        }

        assertNull(restoredPositionSite(instructions, MANAGER, BUTTON_CONTROLLER))
    }

    @Test
    fun `a store that is not followed by the tab lookup is rejected`() {
        val instructions = managerConstructor().toMutableList().also {
            it[7] = ImmutableInstruction10x(Opcode.NOP)
        }

        assertNull(restoredPositionSite(instructions, MANAGER, BUTTON_CONTROLLER))
    }

    @Test
    fun `a position field of another class is rejected`() {
        val instructions = managerConstructor().toMutableList().also {
            it[6] = ImmutableInstruction22c(
                Opcode.IPUT,
                14,
                12,
                ImmutableFieldReference("Lother/Holder;", "r", "I"),
            )
        }

        assertNull(restoredPositionSite(instructions, MANAGER, BUTTON_CONTROLLER))
    }

    // タブを開く method ------------------------------------------------------------------------------------

    @Test
    fun `the tab request site is the method entry with the tabs provider field`() {
        val site = tabRequestSite(
            tabRequest(), registerCount = 11, parameterTypes = REQUEST_PARAMETERS, ownType = MANAGER,
            tabAtPosition = TAB_AT_POSITION,
        )

        assertNotNull(site)
        assertEquals(8, site.thisRegister)
        assertEquals(9, site.tabRegister)
        assertEquals("c", site.tabsProviderField.name)
        assertEquals(TAB, site.tabType)
    }

    @Test
    fun `the tab request hook runs first and casts the requested tab back to its type`() {
        val implementation = mutable(tabRequest(), registerCount = 11)
        val site = checkNotNull(
            tabRequestSite(
                implementation.instructions.toList(), 11, REQUEST_PARAMETERS, MANAGER, TAB_AT_POSITION,
            ),
        )

        redirectRequestedTab(implementation, site, TAB_AT_POSITION)

        val instructions = implementation.instructions.toList()
        assertEquals(
            listOf(
                Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST,
            ),
            instructions.take(7).map { it.opcode },
        )
        val load = instructions[0] as TwoRegisterInstruction
        assertEquals(0, load.registerA)
        assertEquals(8, load.registerB)
        val home = instructions[2] as FiveRegisterInstruction
        assertEquals(listOf(0, 1), listOf(home.registerC, home.registerD))
        assertEquals(TAB_AT_POSITION, (home as ReferenceInstruction).reference)
        val hook = instructions[4] as FiveRegisterInstruction
        assertEquals(listOf(9, 0), listOf(hook.registerC, hook.registerD))
        val reference = (hook as ReferenceInstruction).reference as MethodReference
        assertEquals("visibleTab", reference.name)
        assertEquals(listOf("Ljava/lang/Enum;", "Ljava/lang/Enum;"), reference.parameterTypes.map { it.toString() })
        assertEquals("Ljava/lang/Enum;", reference.returnType)
        assertEquals(9, (instructions[5] as OneRegisterInstruction).registerA)
        val cast = instructions[6] as OneRegisterInstruction
        assertEquals(9, cast.registerA)
        assertEquals(TAB, ((cast as ReferenceInstruction).reference as TypeReference).type)
        // 元の先頭命令（引数の null 検査）はそのまま後ろに続きます。
        assertEquals(Opcode.INVOKE_VIRTUAL, instructions[7].opcode)
    }

    @Test
    fun `a method with fewer than two scratch registers is rejected`() {
        assertNull(
            tabRequestSite(tabRequest(), 4, REQUEST_PARAMETERS, MANAGER, TAB_AT_POSITION),
        )
    }

    @Test
    fun `a requested tab register above v15 is rejected`() {
        assertNull(
            tabRequestSite(tabRequest(), 18, REQUEST_PARAMETERS, MANAGER, TAB_AT_POSITION),
        )
    }

    @Test
    fun `a position lookup that does not read a field of this is rejected`() {
        val instructions = tabRequest().toMutableList().also {
            it[1] = iget(1, 7, MANAGER, "c", PROVIDER)
        }

        assertNull(tabRequestSite(instructions, 11, REQUEST_PARAMETERS, MANAGER, TAB_AT_POSITION))
    }

    @Test
    fun `a tab lookup that returns another type than the request tab is rejected`() {
        val lookup = ImmutableMethodReference(PROVIDER, "e", listOf("I"), "Lother/Tab;")

        assertNull(tabRequestSite(tabRequest(), 11, REQUEST_PARAMETERS, MANAGER, lookup))
    }

    // fixture ----------------------------------------------------------------------------------------------

    private fun mutable(instructions: List<Instruction>, registerCount: Int): MutableMethodImplementation =
        MutableMethodImplementation(ImmutableMethodImplementation(registerCount, instructions, emptyList(), emptyList()))

    private fun iget(a: Int, b: Int, definingClass: String, name: String, type: String): Instruction =
        ImmutableInstruction22c(Opcode.IGET_OBJECT, a, b, ImmutableFieldReference(definingClass, name, type))

    private fun invokeStatic(
        definingClass: String,
        name: String,
        parameters: List<String>,
        returnType: String,
    ): Instruction = ImmutableInstruction35c(
        Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
        ImmutableMethodReference(definingClass, name, parameters, returnType),
    )

    /** `ng8.p` の constructor を縮めた形。各行のコメントは index と code address です。 */
    private fun buttonConstructor(): List<Instruction> = listOf(
        // 0 addr 0: ng8.e.values()
        invokeStatic(DESCRIPTOR, "values", emptyList(), "[$DESCRIPTOR"),
        // 1 addr 3
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
        // 2 addr 4
        ImmutableInstruction11n(Opcode.CONST_4, 6, 0),
        // 3 addr 5: ループの先頭
        ImmutableInstruction23x(Opcode.AGET_OBJECT, 8, 1, 6),
        // 4 addr 7
        iget(9, 0, BUTTON_CONTROLLER, "i", "Ljava/util/LinkedHashMap;"),
        // 5 addr 9
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 9, 8, 0, 0, 0, MAP_GET),
        // 6 addr 12
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 9),
        // 7 addr 13
        ImmutableInstruction21c(Opcode.CHECK_CAST, 9, ImmutableTypeReference("Ljava/lang/Integer;")),
        // 8 addr 15: ここへ hook を入れる。ボタンごとの処理の続き
        ImmutableInstruction10x(Opcode.NOP),
        // 9 addr 16: addr 5 のループ先頭へ戻る
        ImmutableInstruction10t(Opcode.GOTO, -11),
        // 10 addr 17: ループの後ろ。ng8.e.WALLET（descriptor 側）を読む
        ImmutableInstruction21c(
            Opcode.SGET_OBJECT,
            4,
            ImmutableFieldReference(DESCRIPTOR, "WALLET", DESCRIPTOR),
        ),
        // 11 addr 19
        ImmutableInstruction10x(Opcode.NOP),
        // 12 addr 20
        iget(1, 0, BUTTON_CONTROLLER, "d", "Ljava/util/List;"),
        // 13 addr 22
        ImmutableInstruction21c(Opcode.SGET_OBJECT, 3, ImmutableFieldReference(TAB, "WALLET", TAB)),
        // 14 addr 24
        ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 1, 3, 0, 0, 0, LIST_CONTAINS),
        // 15 addr 27
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 1),
        // 16 addr 28: contains の結果で tooltip を作るか決める
        ImmutableInstruction21t(Opcode.IF_EQZ, 1, 3),
        // 17 addr 30
        ImmutableInstruction10x(Opcode.NOP),
        // 18 addr 31
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    /**
     * `MainActivityTabManager` の constructor を縮めた形。保存した位置があれば Bundle の値、なければ指定タブの
     * 位置を v14 に入れ、合流先の `iput` で保存します。
     */
    private fun managerConstructor(): List<Instruction> = listOf(
        // 0 addr 0: ng8.p(v3 = this, v4..v11 = 引数)。List は 6 番目の引数 = v9
        ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 3, 9, BUTTON_CONTROLLER_INIT),
        // 1 addr 3
        ImmutableInstruction21c(Opcode.CONST_STRING, 5, ImmutableStringReference("MainActivityTabManager.currentPosition")),
        // 2 addr 5: 保存した位置がないときは addr 9
        ImmutableInstruction21t(Opcode.IF_EQZ, 5, 4),
        // 3 addr 7
        ImmutableInstruction11n(Opcode.CONST_4, 14, 2),
        // 4 addr 8: 合流先の iput (addr 10) へ
        ImmutableInstruction10t(Opcode.GOTO, 2),
        // 5 addr 9
        ImmutableInstruction11n(Opcode.CONST_4, 14, 0),
        // 6 addr 10: 合流先
        ImmutableInstruction22c(Opcode.IPUT, 14, 12, ImmutableFieldReference(MANAGER, "r", "I")),
        // 7 addr 12
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 1, 14, 0, 0, 0, TAB_AT_POSITION),
        // 8 addr 15
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    /** タブを開く method の先頭。`this` は v8、タブは v9、intent は v10（registerCount 11）。 */
    private fun tabRequest(): List<Instruction> = listOf(
        // 0 addr 0: 引数の null 検査
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, 1, 9, 0, 0, 0, 0,
            ImmutableMethodReference("Ljava/lang/Object;", "getClass", emptyList(), "Ljava/lang/Class;"),
        ),
        // 1 addr 3
        iget(1, 8, MANAGER, "c", PROVIDER),
        // 2 addr 5
        ImmutableInstruction35c(
            Opcode.INVOKE_VIRTUAL, 2, 1, 9, 0, 0, 0,
            ImmutableMethodReference(PROVIDER, "c", listOf(TAB), "I"),
        ),
        // 3 addr 8
        ImmutableInstruction11x(Opcode.MOVE_RESULT, 1),
        // 4 addr 9
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    private companion object {
        const val DESCRIPTOR = "Lng8/e;"
        const val BUTTON_CONTROLLER = "Lng8/p;"
        const val MANAGER = "Ljp/naver/line/android/activity/main/c;"
        const val TAB = "Ljp/naver/line/android/activity/main/a;"
        const val PROVIDER = "Lmg8/d;"
        val REQUEST_PARAMETERS = listOf(TAB, "Landroid/content/Intent;")

        val MAP_GET = ImmutableMethodReference(
            "Ljava/util/LinkedHashMap;", "get", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;",
        )
        val LIST_CONTAINS = ImmutableMethodReference(
            "Ljava/util/List;", "contains", listOf("Ljava/lang/Object;"), "Z",
        )
        val TAB_AT_POSITION = ImmutableMethodReference(PROVIDER, "e", listOf("I"), TAB)
        val BUTTON_CONTROLLER_INIT = ImmutableMethodReference(
            BUTTON_CONTROLLER,
            "<init>",
            listOf(
                "Landroidx/lifecycle/u0;",
                "Ljp/naver/line/android/activity/main/MainBottomNavigationStateViewModel;",
                "Lcom/linecorp/line/home/ui/floataction/HomeFloatingActionSharedViewModel;",
                "Landroid/view/View;",
                "Lgh6/m;",
                "Ljava/util/List;",
                "Lng8/b;",
                "Ljp/naver/line/android/activity/main/c\$a;",
            ),
            "V",
        )
    }
}
