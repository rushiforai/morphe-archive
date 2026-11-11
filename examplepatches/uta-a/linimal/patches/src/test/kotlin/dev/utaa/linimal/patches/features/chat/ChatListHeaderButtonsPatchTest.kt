package dev.utaa.linimal.patches.features.chat

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/**
 * トーク一覧上部のボタンは enum で表され、基準リストは初期化のなかで 1 回だけ組み立てられます。
 *
 * <p>ここでは、難読化名に依存しない特定手順（`Enum.name()` の定数からの enum 判定、5 定数すべてを
 * 読むメソッドの判定、組み立て確定直後の注入位置の判定）を固定します。以前は実機で一度も実行されない
 * 別実装へ注入していたため、対象の取り違えを防ぐ条件を明示的に検証します。</p>
 */
class ChatListHeaderButtonsPatchTest {

    @Test
    fun `the button list builder must be a single target`() {
        assertEquals(1, CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT)
    }

    @Test
    fun `an enum whose clinit declares every button name is the button enum`() {
        assertTrue(declaresChatListHeaderButtonNames(classInitializer(BUTTON_NAMES)))
    }

    @Test
    fun `an enum that is missing any button name is not the button enum`() {
        BUTTON_NAMES.forEach { missing ->
            assertFalse(
                declaresChatListHeaderButtonNames(classInitializer(BUTTON_NAMES - missing)),
                "$missing を持たない enum を対象にしてはいけません。",
            )
        }
        // 名前が前方一致するだけの定数では対象になりません。
        assertFalse(declaresChatListHeaderButtonNames(classInitializer(BUTTON_NAMES.map { "${it}_EXTRA" })))
    }

    @Test
    fun `a method that reads every button constant is the builder`() {
        assertTrue(readsAllChatListHeaderButtons(builder(builderBody()), BUTTON_ENUM))
    }

    @Test
    fun `a method that reads only some button constants is not the builder`() {
        // 追加ボタンを読まないメソッドは、ヘッダーの基準リストの組み立て元ではありません。
        val withoutPlusMenu = builderBody(names = BUTTON_NAMES - "PLUS_MENU")

        assertFalse(readsAllChatListHeaderButtons(builder(withoutPlusMenu), BUTTON_ENUM))
    }

    @Test
    fun `constants of another enum do not identify the builder`() {
        assertFalse(readsAllChatListHeaderButtons(builder(builderBody()), "Laz0/d1;"))
        // 名前が前方一致するだけの field は数えません。
        assertFalse(
            readsAllChatListHeaderButtons(
                builder(builderBody(names = BUTTON_NAMES.map { "${it}_EXTRA" })),
                BUTTON_ENUM,
            ),
        )
    }

    @Test
    fun `the list build call after the last constant is the injection point`() {
        // index 5 が組み立ての確定、index 6 がその move-result-object なので、注入位置は index 7 です。
        assertEquals(
            ChatListHeaderButtonsInjection(index = 7, register = 1),
            injectionOf(builderBody()),
        )
    }

    @Test
    fun `a build call that is not followed by a move-result-object is rejected`() {
        assertNull(injectionOf(builderBody(buildFollowedByMoveResult = false)))
    }

    @Test
    fun `a second list build call leaves the injection point ambiguous`() {
        assertNull(injectionOf(builderBody(extraBuildCall = true)))
    }

    @Test
    fun `a build call before the last constant is not the injection point`() {
        // 定数を 1 つも読まないメソッドと、確定呼び出しを持たないメソッドはどちらも対象外です。
        assertNull(injectionOf(builderBody(names = emptyList())))
        assertNull(injectionOf(builderBody(buildParameters = listOf("Ljava/util/Collection;"))))
    }

    @Test
    fun `a register the invocation cannot address is rejected`() {
        // invoke-static は 4bit register しか取れないため、v16 以降は注入できません。
        assertNull(injectionOf(builderBody(resultRegister = 16)))
        assertEquals(15, injectionOf(builderBody(resultRegister = 15))?.register)
    }

    @Test
    fun `an injection point that is also a branch target is rejected`() {
        // 先頭に if-eqz を足し、注入位置 (addr 0010) へ直接飛ぶ経路を作ります。dexlib2 は注入位置へ
        // 新しい location を挿入し、既存 location は Label を保持したまま後ろへずれるため、この経路
        // だけが絞り込みを飛び越して元の List をそのまま使います。
        val diverted = guarded(jumpOffset = 16)

        assertTrue(isDivertedInjectionIndex(diverted, 8))
        assertNull(chatListHeaderButtonsInjection(diverted, BUTTON_ENUM, emptySet(), ::isBuiltListType))
    }

    @Test
    fun `a branch that lands before the injection point keeps it`() {
        // 分岐先が最初の sget-object (addr 0002) なら、注入位置は分岐先ではありません。
        val safe = guarded(jumpOffset = 2)

        assertFalse(isDivertedInjectionIndex(safe, 8))
        assertEquals(
            ChatListHeaderButtonsInjection(index = 8, register = 1),
            chatListHeaderButtonsInjection(safe, BUTTON_ENUM, emptySet(), ::isBuiltListType),
        )
    }

    @Test
    fun `an injection point that starts an exception handler is rejected`() {
        // 注入位置 (addr 000e) が handler の先頭だと、例外経路だけが絞り込みを飛び越します。
        assertNull(chatListHeaderButtonsInjection(builderBody(), BUTTON_ENUM, setOf(INJECTION_ADDRESS), ::isBuiltListType))
        // handler が別の address なら注入位置は変わりません。
        assertEquals(
            ChatListHeaderButtonsInjection(index = 7, register = 1),
            chatListHeaderButtonsInjection(builderBody(), BUTTON_ENUM, setOf(0), ::isBuiltListType),
        )
    }

    @Test
    fun `a build call that does not return a list is rejected`() {
        assertNull(chatListHeaderButtonsInjection(builderBody(), BUTTON_ENUM, emptySet()) { false })
    }

    @Test
    fun `list types are resolved through the app class hierarchy and known jdk lists`() {
        val classes = mapOf(
            "Lfb8/b;" to classDef("Lfb8/b;", superclass = "Lfb8/a;"),
            "Lfb8/a;" to classDef("Lfb8/a;", superclass = "Ljava/util/AbstractList;"),
            "Lfb8/c;" to classDef("Lfb8/c;", interfaces = listOf("Ljava/util/List;")),
            "Lfb8/d;" to classDef("Lfb8/d;"),
        )

        assertTrue(isListType("Ljava/util/List;", classes::get))
        assertTrue(isListType("Lfb8/b;", classes::get))
        assertTrue(isListType("Lfb8/c;", classes::get))
        assertFalse(isListType("Lfb8/d;", classes::get))
        // たどれない型は List と見なしません。
        assertFalse(isListType("Lfb8/unknown;", classes::get))
        assertFalse(isListType("Ljava/util/Collection;", classes::get))
    }

    private fun classDef(
        type: String,
        superclass: String = "Ljava/lang/Object;",
        interfaces: List<String> = emptyList(),
    ): ClassDef = ImmutableClassDef(type, 0, superclass, interfaces, null, null, null, null)

    private fun isBuiltListType(type: String): Boolean = type == "Lfb8/b;"

    private fun injectionOf(instructions: List<Instruction>): ChatListHeaderButtonsInjection? =
        chatListHeaderButtonsInjection(instructions, BUTTON_ENUM, emptySet(), ::isBuiltListType)

    /**
     * 先頭に if-eqz を置いた形。addr 0000 の if-eqz から [jumpOffset] だけ進んだ address が分岐先です。
     * 本体は 2 codeUnits ずれるため、注入位置は addr 0010 になります。
     */
    private fun guarded(jumpOffset: Int): List<Instruction> =
        listOf<Instruction>(ImmutableInstruction21t(Opcode.IF_EQZ, 3, jumpOffset)) + builderBody()

    /**
     * 実機の初期化と同じ並びを再現します。ボタン定数を順に読み、`(List)` を取る `invoke-static` で
     * 基準リストを確定し、その結果を StateFlow へ包んで field へ入れます。
     *
     * <p>命令境界は addr 0000 / 0002 / 0004 / 0006 / 0008 / 000a / 000d / 000e / 0011 / 0012 です。</p>
     */
    private fun builderBody(
        names: List<String> = BUTTON_NAMES,
        resultRegister: Int = 1,
        buildParameters: List<String> = listOf("Ljava/util/List;"),
        buildFollowedByMoveResult: Boolean = true,
        extraBuildCall: Boolean = false,
    ): List<Instruction> = buildList {
        names.forEach { name ->
            add(
                ImmutableInstruction21c(
                    Opcode.SGET_OBJECT,
                    3,
                    ImmutableFieldReference(BUTTON_ENUM, name, BUTTON_ENUM),
                ),
            )
        }
        add(
            ImmutableInstruction35c(
                Opcode.INVOKE_STATIC,
                1,
                2, 0, 0, 0, 0,
                ImmutableMethodReference("Leb8/v;", "c", buildParameters, "Lfb8/b;"),
            ),
        )
        if (buildFollowedByMoveResult) {
            add(ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, resultRegister))
        }
        if (extraBuildCall) {
            add(
                ImmutableInstruction35c(
                    Opcode.INVOKE_STATIC,
                    1,
                    2, 0, 0, 0, 0,
                    ImmutableMethodReference("Leb8/v;", "c", listOf("Ljava/util/List;"), "Lfb8/b;"),
                ),
            )
            add(ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, resultRegister))
        }
        // StateFlow 化は `Ljava/lang/Object;` を取るため、確定呼び出しとは取り違えません。
        add(
            ImmutableInstruction35c(
                Opcode.INVOKE_STATIC,
                1,
                2, 0, 0, 0, 0,
                ImmutableMethodReference("Lze8/g3;", "a", listOf("Ljava/lang/Object;"), "Lze8/f3;"),
            ),
        )
        add(ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, resultRegister))
        add(
            ImmutableInstruction22c(
                Opcode.IPUT_OBJECT,
                2,
                0,
                ImmutableFieldReference("Lgw1/f;", "y", "Lze8/f3;"),
            ),
        )
        add(ImmutableInstruction10x(Opcode.RETURN_VOID))
    }

    private fun classInitializer(names: Collection<String>): Method = method(
        "<clinit>",
        names.map { name ->
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(name))
        } + ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    private fun builder(instructions: List<Instruction>): Method = method("<init>", instructions)

    private fun method(name: String, instructions: List<Instruction>): Method = ImmutableMethod(
        "Lgw1/f;",
        name,
        emptyList(),
        "V",
        0,
        null,
        null,
        ImmutableMethodImplementation(20, instructions, null, null),
    )

    private companion object {
        const val BUTTON_ENUM = "Laz0/q;"
        val BUTTON_NAMES = listOf("AI_FRIEND", "ALBUM", "CALENDAR", "OPEN_CHAT", "PLUS_MENU")

        /** 注入位置 (index 7) の code address。sget-object 5 つ (10) + invoke-static (3) + move-result (1)。 */
        const val INJECTION_ADDRESS = 14
    }
}
