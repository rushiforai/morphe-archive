package dev.jason.gboardpatches.patches.gboard.shared

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardSoftKeyFamilySelectionStoreTest {
    @Test
    fun `take returns each selected feature once and clears the context`() {
        val store = GboardSoftKeyFamilySelectionStore<Any>()
        val context = Any()

        store.add(context, GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE)
        store.add(context, GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE)
        store.add(context, GboardSoftKeyFamilyFeature.ZHUYIN_TOGGLE)

        assertEquals(
            setOf(
                GboardSoftKeyFamilyFeature.TOP_ROW_SWIPE,
                GboardSoftKeyFamilyFeature.ZHUYIN_TOGGLE,
            ),
            store.take(context).toSet(),
        )
        assertTrue(store.take(context).isEmpty())
    }
}
