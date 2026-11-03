package dev.utaa.linimal.patches.features.ads

import dev.utaa.linimal.patches.status.FeatureId
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class HomeTopAdPatchTest {
    @Test
    fun `non-unique module gate preserves actual cardinality as an error`() {
        val record = homeTopAdModuleGateUnappliedRecord(2, "HomeTopAdModuleGateNotUnique")

        assertEquals(PatchId.HOME_TOP_AD_MODULE_GATE, record.patchId)
        assertEquals(FeatureId.HOME_TOP_AD, record.featureId)
        assertEquals(PatchStatus.ERROR, record.status)
        assertEquals(1, record.expectedTargetCount)
        assertEquals(2, record.actualTargetCount)
    }

    @Test
    fun `missing module gate reports target not found`() {
        val record = homeTopAdModuleGateUnappliedRecord(0, "HomeTopAdModuleGateNotUnique")

        assertEquals(PatchStatus.TARGET_NOT_FOUND, record.status)
        assertEquals(0, record.actualTargetCount)
    }

    @Test
    fun `catalog gate requires the seven-entry list factory return shape`() {
        assertEquals(
            HomePerformanceAdCatalogGateShape(insertionIndex = 4, listRegister = 9),
            homePerformanceAdCatalogGateShape(catalogInstructions(), hasTryBlocks = false),
        )
    }

    @Test
    fun `catalog gate rejects a factory that does not consume the catalog array`() {
        val instructions = catalogInstructions().toMutableList()
        instructions[2] = ImmutableInstruction35c(
            Opcode.INVOKE_STATIC,
            1,
            7, 0, 0, 0, 0,
            ImmutableMethodReference(
                "Lexample/ListFactory;",
                "h",
                listOf("[Ljava/lang/Object;"),
                "Ljava/util/List;",
            ),
        )

        assertNull(homePerformanceAdCatalogGateShape(instructions, hasTryBlocks = false))
    }

    @Test
    fun `catalog status counts two verified ad entries rather than catalog methods`() {
        val missing = homePerformanceAdCatalogUnappliedRecord(0, "HomePerformanceAdCatalogNotUnique")
        val ambiguous = homePerformanceAdCatalogUnappliedRecord(2, "HomePerformanceAdCatalogNotUnique")

        assertEquals(PatchId.HOME_TOP_AD_CATALOG_GATE, missing.patchId)
        assertEquals(PatchStatus.TARGET_NOT_FOUND, missing.status)
        assertEquals(2, missing.expectedTargetCount)
        assertEquals(0, missing.actualTargetCount)
        assertEquals(PatchStatus.ERROR, ambiguous.status)
        assertEquals(2, ambiguous.actualTargetCount)
    }

    @Test
    fun `generic GCS ad gate targets the dedicated singleton list return`() {
        val instructions = listOf(
            ImmutableInstruction35c(
                Opcode.INVOKE_STATIC,
                1,
                1, 0, 0, 0, 0,
                ImmutableMethodReference(
                    "Lws8/t;",
                    "g",
                    listOf("Ljava/lang/Object;"),
                    "Ljava/util/List;",
                ),
            ),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 7),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 7),
        )

        assertEquals(
            HomeGcsAdListGateShape(insertionIndex = 2, listRegister = 7),
            homeGcsAdListGateShape(instructions, listFactoryIndex = 0, hasTryBlocks = false),
        )
    }

    @Test
    fun `generic GCS ad gate rejects a mismatched return register`() {
        val instructions = listOf(
            ImmutableInstruction35c(
                Opcode.INVOKE_STATIC,
                1,
                1, 0, 0, 0, 0,
                ImmutableMethodReference(
                    "Lws8/t;",
                    "g",
                    listOf("Ljava/lang/Object;"),
                    "Ljava/util/List;",
                ),
            ),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 7),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 6),
        )

        assertNull(homeGcsAdListGateShape(instructions, listFactoryIndex = 0, hasTryBlocks = false))
    }

    @Test
    fun `generic GCS ad status preserves candidate cardinality`() {
        val record = homeGcsAdModuleGateUnappliedRecord(2, "HomeGcsAdCreateViewDataNotUnique")

        assertEquals(PatchId.HOME_GCS_AD_MODULE_GATE, record.patchId)
        assertEquals(PatchStatus.ERROR, record.status)
        assertEquals(1, record.expectedTargetCount)
        assertEquals(2, record.actualTargetCount)
    }

    private fun catalogInstructions(): List<Instruction> = listOf(
        ImmutableInstruction3rc(
            Opcode.FILLED_NEW_ARRAY_RANGE,
            0,
            7,
            ImmutableTypeReference("[Lexample/Module;"),
        ),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 8),
        ImmutableInstruction35c(
            Opcode.INVOKE_STATIC,
            1,
            8, 0, 0, 0, 0,
            ImmutableMethodReference(
                "Lexample/ListFactory;",
                "h",
                listOf("[Ljava/lang/Object;"),
                "Ljava/util/List;",
            ),
        ),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 9),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 9),
    )
}
