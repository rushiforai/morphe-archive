package io.github.liongalahad.nuviotv.extension.settings

import org.junit.After
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class MorpheStorageConsumersTest {
    @After fun tearDown() {
        MorpheStorageConsumers.clearForTesting()
    }

    @Test fun `shared path enables when any registered consumer is enabled`() {
        var first = false
        var second = false
        MorpheStorageConsumers.register("first") { first }
        MorpheStorageConsumers.register("second") { second }

        assertFalse(MorpheStorageConsumers.isAnyEnabled())
        second = true
        assertTrue(MorpheStorageConsumers.isAnyEnabled())
        second = false
        first = true
        assertTrue(MorpheStorageConsumers.isAnyEnabled())
    }

    @Test fun `write access is required only by an enabled writer`() {
        var reader = true
        var writer = false
        MorpheStorageConsumers.register("reader", { reader }, false)
        MorpheStorageConsumers.register("writer", { writer }, true)

        assertTrue(MorpheStorageConsumers.isAnyEnabled())
        assertFalse(MorpheStorageConsumers.isWriteAccessRequired())

        writer = true
        assertTrue(MorpheStorageConsumers.isWriteAccessRequired())

        writer = false
        reader = false
        assertFalse(MorpheStorageConsumers.isWriteAccessRequired())
    }

    @Test fun `storage changes invalidate every registered consumer`() {
        var first = 0
        var second = 0
        MorpheStorageConsumers.register("first", { true }, false) { first += 1 }
        MorpheStorageConsumers.register("second", { false }, true) { second += 1 }

        MorpheStorageConsumers.notifyStorageChanged()
        MorpheStorageConsumers.notifyStorageChanged()

        assertEquals(2, first)
        assertEquals(2, second)
    }
}
