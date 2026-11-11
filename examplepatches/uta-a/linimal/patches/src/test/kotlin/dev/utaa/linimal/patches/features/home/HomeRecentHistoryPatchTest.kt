package dev.utaa.linimal.patches.features.home

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class HomeRecentHistoryPatchTest {
    @Test
    fun `source metadata resolves the package that holds the activity card composables`() {
        assertEquals(
            setOf("Lexample/card/"),
            activityCardPackagePrefixes(
                setOf("Lexample/card/Contents\$1;", "Lexample/card/Contents\$2;"),
            ),
        )
    }

    @Test
    fun `a package that cannot be derived leaves the target unresolved`() {
        assertTrue(activityCardPackagePrefixes(emptySet()).isEmpty())
        assertTrue(activityCardPackagePrefixes(setOf("LContents;")).isEmpty())
        // source file が複数 package に散っている場合は 1 つに絞り込めません。
        assertEquals(
            2,
            activityCardPackagePrefixes(setOf("Lexample/a/Contents;", "Lexample/b/Contents;")).size,
        )
    }

    @Test
    fun `only the recent history card renderer parameter order is accepted`() {
        assertTrue(
            isRecentHistoryCardRendererSignature(
                renderer(listOf(RECENT_HISTORY_CARD, "Ljava/util/List;", "I", "I", "Lj3/r;", "I")),
                RECENT_HISTORY_CARD,
            ),
        )
        // 引数が増減しても、先頭の内容型と末尾の composer・changed の位置だけを見ます。
        assertTrue(
            isRecentHistoryCardRendererSignature(
                renderer(listOf(RECENT_HISTORY_CARD, "Lj3/r;", "I")),
                RECENT_HISTORY_CARD,
            ),
        )
        // 隣に並ぶ「サービス」card は別の内容型を取るため、対象外です。
        assertFalse(
            isRecentHistoryCardRendererSignature(
                renderer(listOf(FIXED_SERVICE_CARD, "Ljava/util/List;", "Lj3/r;", "I")),
                RECENT_HISTORY_CARD,
            ),
        )
        // 内容型を第 1 引数に取らないものは、card 本体の renderer ではありません。
        assertFalse(
            isRecentHistoryCardRendererSignature(
                renderer(listOf("Ljava/lang/String;", RECENT_HISTORY_CARD, "Lj3/r;", "I")),
                RECENT_HISTORY_CARD,
            ),
        )
        assertFalse(
            isRecentHistoryCardRendererSignature(
                renderer(listOf(RECENT_HISTORY_CARD, "Lj3/r;")),
                RECENT_HISTORY_CARD,
            ),
        )
        assertFalse(
            isRecentHistoryCardRendererSignature(
                renderer(listOf(RECENT_HISTORY_CARD, "I", "Lj3/r;")),
                RECENT_HISTORY_CARD,
            ),
        )
    }

    @Test
    fun `the recent history card renderer must be a single target`() {
        assertEquals(1, HOME_RECENT_HISTORY_TARGET_COUNT)
        assertEquals(3, RECENT_HISTORY_CARD_MINIMUM_PARAMETER_COUNT)
    }

    /** 「サービス」card と区別できる唯一の非難読化 marker のため、値そのものを固定します。 */
    @Test
    fun `the card content marker distinguishes recent history from the neighbouring service card`() {
        assertEquals("RecentlyUsedService(id=", RECENTLY_USED_SERVICE_MARKER)
        // GlobalHome の別 model を外すため、Home26 の model だけが持つ field 名も固定します。
        assertEquals(", config=", RECENTLY_USED_SERVICE_CONFIG_MARKER)
    }

    @Test
    fun `no resolved renderer reports target not found and an ambiguous one reports error`() {
        val notFound = homeRecentHistoryUnappliedRecord(0, "HomeRecentHistorySourcePackageNotUnique")
        assertEquals(PatchId.HOME_RECENT_HISTORY, notFound.patchId)
        assertEquals(PatchStatus.TARGET_NOT_FOUND, notFound.status)
        assertEquals(HOME_RECENT_HISTORY_TARGET_COUNT, notFound.expectedTargetCount)
        assertEquals(0, notFound.actualTargetCount)

        val ambiguous = homeRecentHistoryUnappliedRecord(2, "HomeRecentHistoryRendererNotUnique")
        assertEquals(PatchStatus.ERROR, ambiguous.status)
        assertEquals(2, ambiguous.actualTargetCount)
    }

    @Test
    fun `should execute branch is the injection point`() {
        val gate = homeRecentHistoryGateShape(gateBody(shouldExecuteRegister = 1), hasTryBlocks = false)
        assertEquals(HomeRecentHistoryGate(branchIndex = 2, shouldExecuteRegister = 1), gate)
    }

    @Test
    fun `a register the restore constant cannot address is rejected`() {
        // const/4 は 4bit register しか取れないため、v16 以降は注入できません。
        assertNull(homeRecentHistoryGateShape(gateBody(shouldExecuteRegister = 16), hasTryBlocks = false))
    }

    @Test
    fun `try blocks and a missing skip path are rejected`() {
        assertNull(homeRecentHistoryGateShape(gateBody(shouldExecuteRegister = 1), hasTryBlocks = true))
        assertNull(
            homeRecentHistoryGateShape(
                gateBody(shouldExecuteRegister = 1, skipToGroupEndCount = 0),
                hasTryBlocks = false,
            ),
        )
        assertNull(
            homeRecentHistoryGateShape(
                gateBody(shouldExecuteRegister = 1, skipToGroupEndCount = 2),
                hasTryBlocks = false,
            ),
        )
    }

    @Test
    fun `a branch that targets the injection point is rejected`() {
        // 既存の分岐が if-eqz を指していると、注入した gate を飛び越えて元の判定へ戻ります。
        val instructions = gateBody(shouldExecuteRegister = 1).toMutableList()
        // shouldExecute(3) + move-result(1) = 4 code units 先の if-eqz を指す分岐を先頭へ足します。
        instructions.add(0, ImmutableInstruction21t(Opcode.IF_EQZ, 1, 6))
        assertNull(homeRecentHistoryGateShape(instructions, hasTryBlocks = false))
    }

    private fun renderer(parameters: List<String>) = ImmutableMethod(
        "Lexample/card/Renderer;",
        "a",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        0,
        null,
        null,
        null,
    )

    private fun gateBody(
        shouldExecuteRegister: Int,
        skipToGroupEndCount: Int = 1,
    ): List<Instruction> = buildList {
        add(composerCall("A", listOf("I", "Z"), "Z"))
        add(ImmutableInstruction11x(Opcode.MOVE_RESULT, shouldExecuteRegister))
        add(ImmutableInstruction21t(Opcode.IF_EQZ, shouldExecuteRegister, 3))
        add(ImmutableInstruction10x(Opcode.NOP))
        repeat(skipToGroupEndCount) { add(composerCall("l", emptyList(), "V")) }
        add(composerCall("Z", emptyList(), "Lj3/p3;"))
    }

    private fun composerCall(
        name: String,
        parameters: List<String>,
        returnType: String,
    ) = ImmutableInstruction35c(
        Opcode.INVOKE_VIRTUAL,
        1,
        6, 0, 0, 0, 0,
        ImmutableMethodReference("Lj3/d1;", name, parameters, returnType),
    )

    private companion object {
        /** 「最近の履歴」card の内容型に相当する stand-in です。 */
        const val RECENT_HISTORY_CARD = "Lexample/model/Card\$RecentlyUsedService;"

        /** 隣に並ぶ「サービス」card の内容型に相当する stand-in です。 */
        const val FIXED_SERVICE_CARD = "Lexample/model/Card\$FixedService;"
    }
}
