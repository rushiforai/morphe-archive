/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.misc.inbox

import org.junit.Assert.*
import org.junit.Test

class PushDeliveryDiagnosticsTest {
    @Test fun diagnosticsRemainAnUnnamedDependency() {
        assertNull(pushDeliveryDiagnosticsPatch.name)
        assertTrue(pushDeliveryDiagnosticsPatch in notificationControlsPatch.dependencies)
    }
}
