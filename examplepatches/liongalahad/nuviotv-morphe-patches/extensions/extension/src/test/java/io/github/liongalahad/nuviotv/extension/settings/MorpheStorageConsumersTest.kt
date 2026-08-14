package io.github.liongalahad.nuviotv.extension.settings

import org.junit.After
import org.junit.Assert.assertFalse
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
}
