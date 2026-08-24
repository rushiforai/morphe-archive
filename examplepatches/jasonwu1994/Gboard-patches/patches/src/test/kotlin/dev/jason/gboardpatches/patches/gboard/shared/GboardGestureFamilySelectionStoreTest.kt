package dev.jason.gboardpatches.patches.gboard.shared

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardGestureFamilySelectionStoreTest {
    @Test
    fun `take returns each selected feature once and removes the context`() {
        val store = GboardGestureFamilySelectionStore<Any>()
        val context = Any()
        store.add(context, GboardGestureFamilyFeature.TOP_ROW_SWIPE)
        store.add(context, GboardGestureFamilyFeature.TOP_ROW_SWIPE)
        store.add(context, GboardGestureFamilyFeature.ZHUYIN_TOGGLE)

        assertEquals(
            listOf(
                GboardGestureFamilyFeature.TOP_ROW_SWIPE,
                GboardGestureFamilyFeature.ZHUYIN_TOGGLE,
            ),
            store.take(context).toList(),
        )
        assertTrue(store.take(context).isEmpty())
    }
}
