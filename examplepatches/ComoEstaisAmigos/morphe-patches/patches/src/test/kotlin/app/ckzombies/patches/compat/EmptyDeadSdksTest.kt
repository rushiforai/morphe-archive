package app.ckzombies.patches.compat

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class EmptyDeadSdksTest {
    @Test
    fun `each SDK prefix has a locked class count and TapjoyConnect is kept`() {
        assertEquals(
            listOf(
                OPENFEINT_PACKAGE to OPENFEINT_CLASSES,
                "Lcom/flurry/" to 49,
                "Lcom/tapjoy/" to 57,
                "Lcom/playhaven/" to 92,
                "Lcom/urbanairship/" to 95,
            ),
            DEAD_SDK_PREFIXES,
        )
        assertEquals(setOf(TAPJOY_CONNECT), DEAD_SDK_KEEP)
        assertEquals("Lcom/tapjoy/TapjoyConnect;", TAPJOY_CONNECT)
        assertEquals(319, OPENFEINT_CLASSES)
        assertEquals(612, DEAD_SDK_PREFIXES.sumOf { it.second })
    }

    @Test
    fun `TapjoyConnect is the only Tapjoy type that keeps its body`() {
        assertTrue(TAPJOY_CONNECT.startsWith("Lcom/tapjoy/"))
        val tapjoy = DEAD_SDK_PREFIXES.single { it.first == "Lcom/tapjoy/" }
        assertEquals(57, tapjoy.second)
    }
}
