package dev.utaa.linimal.patches.features.home

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class HomeFeaturedCollectionsPatchTest {
    @Test
    fun `source metadata resolves the package that holds the featured grid composables`() {
        assertEquals(
            setOf("Lexample/home/"),
            featuredGridPackagePrefixes(
                setOf("Lexample/home/Grid\$1;", "Lexample/home/GridPost\$1;"),
            ),
        )
    }

    @Test
    fun `a package that cannot be derived leaves the target unresolved`() {
        assertTrue(featuredGridPackagePrefixes(emptySet()).isEmpty())
        assertTrue(featuredGridPackagePrefixes(setOf("LGrid;")).isEmpty())
        // source file が複数 package に散っている場合は 1 つに絞り込めません。
        assertEquals(
            2,
            featuredGridPackagePrefixes(setOf("Lexample/a/Grid;", "Lexample/b/Grid;")).size,
        )
    }

    @Test
    fun `only the module renderer parameter order is accepted`() {
        assertTrue(
            isFeaturedCollectionsRendererSignature(
                renderer(listOf("Lexample/home/ViewData;", "Lsg2/h;", "Lj3/r;", "I")),
            ),
        )
        // 投稿カード module のように view data の前に module id を取るものは対象外です。
        assertFalse(
            isFeaturedCollectionsRendererSignature(
                renderer(listOf("Ljava/lang/String;", "Lexample/home/ViewData;", "Lsg2/h;", "Lj3/r;", "I")),
            ),
        )
        assertFalse(
            isFeaturedCollectionsRendererSignature(renderer(listOf("Z", "Lsg2/h;", "Lj3/r;", "I"))),
        )
        assertFalse(
            isFeaturedCollectionsRendererSignature(
                renderer(listOf("Lexample/home/ViewData;", "Lsg2/h;", "Lj3/r;")),
            ),
        )
    }

    @Test
    fun `only grid state types built by the renderer are counted`() {
        val method = renderer(
            parameters = listOf("Lexample/home/ViewData;", "Lsg2/h;", "Lj3/r;", "I"),
            instructions = listOf(
                newInstance("Lexample/grid/GridState;"),
                newInstance("Lexample/grid/CardState;"),
                newInstance("Lexample/grid/GridState;"),
                newInstance("Lexample/other/Unrelated;"),
            ),
        )

        assertEquals(
            setOf("Lexample/grid/GridState;", "Lexample/grid/CardState;"),
            featuredGridStateTypes(method, "Lexample/grid/"),
        )
        assertTrue(featuredGridStateTypes(method, "Lexample/grid/").size >= FEATURED_GRID_STATE_TYPE_MINIMUM)
        assertTrue(featuredGridStateTypes(method, "Lexample/missing/").isEmpty())
    }

    @Test
    fun `the featured grid module renderer must be a single target`() {
        assertEquals(1, HOME_FEATURED_COLLECTIONS_TARGET_COUNT)
    }

    @Test
    fun `no resolved renderer reports target not found and an ambiguous one reports error`() {
        val notFound = homeFeaturedCollectionsUnappliedRecord(0, "HomeFeaturedGridSourcePackageNotUnique")
        assertEquals(PatchId.HOME_FEATURED_COLLECTIONS, notFound.patchId)
        assertEquals(PatchStatus.TARGET_NOT_FOUND, notFound.status)
        assertEquals(HOME_FEATURED_COLLECTIONS_TARGET_COUNT, notFound.expectedTargetCount)
        assertEquals(0, notFound.actualTargetCount)

        val ambiguous = homeFeaturedCollectionsUnappliedRecord(2, "HomeFeaturedCollectionsRendererNotUnique")
        assertEquals(PatchStatus.ERROR, ambiguous.status)
        assertEquals(2, ambiguous.actualTargetCount)
    }

    @Test
    fun `should execute branch is the injection point`() {
        val gate = homeFeaturedCollectionsGateShape(gateBody(shouldExecuteRegister = 1), hasTryBlocks = false)
        assertEquals(HomeFeaturedCollectionsGate(branchIndex = 2, shouldExecuteRegister = 1), gate)
    }

    @Test
    fun `a register the restore constant cannot address is rejected`() {
        // const/4 は 4bit register しか取れないため、v16 以降は注入できません。
        assertNull(homeFeaturedCollectionsGateShape(gateBody(shouldExecuteRegister = 16), hasTryBlocks = false))
    }

    @Test
    fun `try blocks and a missing skip path are rejected`() {
        assertNull(homeFeaturedCollectionsGateShape(gateBody(shouldExecuteRegister = 1), hasTryBlocks = true))
        assertNull(
            homeFeaturedCollectionsGateShape(
                gateBody(shouldExecuteRegister = 1, skipToGroupEndCount = 0),
                hasTryBlocks = false,
            ),
        )
        assertNull(
            homeFeaturedCollectionsGateShape(
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
        assertNull(homeFeaturedCollectionsGateShape(instructions, hasTryBlocks = false))
    }

    private fun renderer(
        parameters: List<String>,
        instructions: List<Instruction> = emptyList(),
    ) = ImmutableMethod(
        "Lexample/home/Renderer;",
        "a",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        0,
        null,
        null,
        if (instructions.isEmpty()) {
            null
        } else {
            ImmutableMethodImplementation(8, instructions, null, null)
        },
    )

    private fun newInstance(type: String) =
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(type))

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
}
