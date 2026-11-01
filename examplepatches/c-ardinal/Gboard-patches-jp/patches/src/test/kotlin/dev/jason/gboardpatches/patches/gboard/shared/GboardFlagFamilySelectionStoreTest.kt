package dev.jason.gboardpatches.patches.gboard.shared

import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardFlagFamilySelectionStoreTest {
    @Test
    fun `take cleans only its own context`() {
        val store = GboardFlagFamilySelectionStore<Any>()
        val firstContext = Any()
        val secondContext = Any()
        store.add(firstContext, DEVICE_SPEC)
        store.add(secondContext, GRAMMAR_SPEC)

        assertEquals(listOf(DEVICE_SPEC), store.take(firstContext).toList())
        assertTrue(store.take(firstContext).isEmpty())
        assertEquals(listOf(GRAMMAR_SPEC), store.take(secondContext).toList())
        assertTrue(store.take(secondContext).isEmpty())
    }

    @Test
    fun `same spec is idempotent and conflicting spec does not replace it`() {
        val store = GboardFlagFamilySelectionStore<Any>()
        val context = Any()
        store.add(context, DEVICE_SPEC)
        store.add(context, DEVICE_SPEC)

        assertThrows(IllegalStateException::class.java) {
            store.add(
                context,
                DEVICE_SPEC.copy(
                    runtimeCall = RuntimeCallId.GRAMMAR_CHECKER_RUNTIME_APPLY_FLAG_VALUE,
                ),
            )
        }

        assertEquals(listOf(DEVICE_SPEC), store.take(context).toList())
    }

    private companion object {
        val DEVICE_SPEC = GboardFlagFamilyFeature.DEVICE_INTELLIGENCE.spec
        val GRAMMAR_SPEC = GboardFlagFamilyFeature.GRAMMAR_CHECKER.spec
    }
}
