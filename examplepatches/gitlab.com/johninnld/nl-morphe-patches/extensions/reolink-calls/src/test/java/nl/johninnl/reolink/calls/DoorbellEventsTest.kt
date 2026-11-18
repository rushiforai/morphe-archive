package nl.johninnl.reolink.calls

import org.junit.Assert.*
import org.junit.Test

class DoorbellEventsTest {
    @Test fun physicalVisitorAlertsDoNotRequireTheOptionalNativeCallModeFlag() {
        assertTrue(DoorbellEvents.isRing(false, "VISITOR"))
        assertTrue(DoorbellEvents.isRing(false, "visitor"))
        assertTrue(DoorbellEvents.isRing(true, "MD"))
    }
    @Test fun motionPeopleAndUnclassifiedAlertsStayOrdinaryNotifications() {
        for (type in listOf(null, "MD", "PERSON", "PEOPLE", "VEHICLE", "PET", "TEST", "visitor-motion"))
            assertFalse("Misclassified $type", DoorbellEvents.isRing(false, type))
    }
    @Test fun diagnosticLabelsCannotDumpArbitraryPayloadFields() {
        assertEquals("VISITOR", DoorbellEvents.diagnostic("VISITOR"))
        assertEquals("other", DoorbellEvents.diagnostic("private value with spaces"))
        assertEquals("other", DoorbellEvents.diagnostic("x".repeat(64)))
    }
}
