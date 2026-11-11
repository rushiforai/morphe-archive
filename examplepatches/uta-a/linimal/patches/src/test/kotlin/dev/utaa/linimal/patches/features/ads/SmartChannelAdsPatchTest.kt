package dev.utaa.linimal.patches.features.ads

import dev.utaa.linimal.patches.status.FeatureId
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class SmartChannelAdsPatchTest {
    @Test
    fun `every target guarded reports ok`() {
        val record = smartChannelSuppressionRecord(SMART_CHANNEL_TARGET_COUNT, frameGateApplied = true)

        assertEquals(PatchId.SMART_CHANNEL_ADS, record.patchId)
        assertEquals(FeatureId.SMART_CHANNEL_ADS, record.featureId)
        assertEquals(PatchStatus.OK, record.status)
        assertEquals(3, record.expectedTargetCount)
        assertEquals(3, record.actualTargetCount)
        assertEquals("SmartChannelFrameAndBindGuarded", record.reason)
    }

    @Test
    fun `a missing frame gate stays partial and is distinguishable in the reason`() {
        val record = smartChannelSuppressionRecord(2, frameGateApplied = false)

        assertEquals(PatchStatus.PARTIAL, record.status)
        assertEquals(2, record.actualTargetCount)
        assertEquals("SmartChannelFrameGateMissing", record.reason)
    }

    @Test
    fun `a missing bind target keeps the frame gate reason`() {
        val record = smartChannelSuppressionRecord(2, frameGateApplied = true)

        assertEquals(PatchStatus.PARTIAL, record.status)
        assertEquals("SmartChannelTargetPartial", record.reason)
    }

    @Test
    fun `every target is applied only after all of them are verified`() {
        val applied = mutableListOf<String>()

        val allVerified = applyAllOrNone(listOf({ applied += "uiState" }, { applied += "initial" }, { applied += "rebind" }))

        assertTrue(allVerified)
        assertEquals(listOf("uiState", "initial", "rebind"), applied)
    }

    @Test
    fun `a failed verification leaves the earlier verified targets untouched`() {
        val applied = mutableListOf<String>()

        // 後続の rebind だけが形状検証に失敗しても、先に検証できた対象への注入を残しません。
        val allVerified = applyAllOrNone(listOf({ applied += "uiState" }, { applied += "initial" }, null))

        assertFalse(allVerified)
        assertTrue(applied.isEmpty())
    }

    @Test
    fun `no target found reports target not found`() {
        val record = smartChannelSuppressionRecord(0, frameGateApplied = false)

        assertEquals(PatchStatus.TARGET_NOT_FOUND, record.status)
        assertEquals(0, record.actualTargetCount)
    }
}
