package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import org.junit.Test;

public class WarningLegacyClientsTest {
    @Test public void awareReceiverCannotClearAnotherUidLegacySession() {
        WarningLegacyClients clients = new WarningLegacyClients();
        clients.observe(10001, false, 0);
        clients.observe(10002, true, 1000);
        clients.observe(10002, true, 2000);
        assertTrue(clients.legacyActive(44999));
        assertFalse(clients.legacyActive(45000));
    }

    @Test public void legacyObservationExpiresAtExactlyFortyFiveSeconds() {
        WarningLegacyClients clients = new WarningLegacyClients();
        clients.observe(10001, false, 1500);
        assertTrue(clients.legacyActive(46499));
        assertFalse(clients.legacyActive(46500));
    }

    @Test public void awarenessUpgradeAndHeartbeatAffectOnlyTheirOwnUid() {
        WarningLegacyClients clients = new WarningLegacyClients();
        clients.observe(10001, false, 10000);
        clients.observe(10002, false, 20000);
        clients.observe(10001, true, 30000);
        assertTrue(clients.legacyActive(64999));
        assertFalse(clients.legacyActive(65000));
        clients.observe(10001, false, 65001);
        assertTrue(clients.legacyActive(65001));
    }

    @Test public void overflowDoesNotDisplaceLegacyClientsOrSilentlyGrantAudio() {
        WarningLegacyClients clients = new WarningLegacyClients();
        for (int uid = 10001; uid <= 10008; uid++) clients.observe(uid, false, 0);
        assertEquals(WarningLegacyClients.Observation.OVERFLOW, clients.observe(10009, true, 1000));
        for (int uid = 10001; uid <= 10008; uid++)
            assertEquals(WarningLegacyClients.Observation.ACCEPTED, clients.observe(uid, true, 1000));
        assertTrue(clients.legacyActive(45999));
        assertFalse(clients.legacyActive(46000));
    }

    @Test public void untrackedLegacyUidRetainsItsEntireLeaseWhenTrackedSlotsExpire() {
        WarningLegacyClients clients = new WarningLegacyClients();
        for (int uid = 10001; uid <= 10008; uid++) clients.observe(uid, true, 0);
        assertEquals(WarningLegacyClients.Observation.OVERFLOW, clients.observe(10009, false, 1));
        assertEquals(WarningLegacyClients.Observation.ACCEPTED, clients.observe(10010, true, 45000));
        assertTrue(clients.legacyActive(45000));
        assertFalse(clients.legacyActive(45001));
    }

    @Test public void repeatedOverflowExtendsTheConservativeGate() {
        WarningLegacyClients clients = new WarningLegacyClients();
        for (int uid = 10001; uid <= 10008; uid++) clients.observe(uid, true, 0);
        clients.observe(10009, false, 1000);
        clients.observe(10009, false, 2000);
        assertTrue(clients.legacyActive(46999));
        assertFalse(clients.legacyActive(47000));
    }

    @Test public void expiredSlotsAreReclaimedBeforeApplyingCapacity() {
        WarningLegacyClients clients = new WarningLegacyClients();
        for (int uid = 10001; uid <= 10008; uid++) clients.observe(uid, true, 0);
        assertEquals(WarningLegacyClients.Observation.ACCEPTED, clients.observe(10009, false, 45000));
        clients.observe(10009, true, 45001);
        assertFalse(clients.legacyActive(45001));
    }

    @Test public void invalidIdentityAndClockCannotChangeAcceptedObservations() {
        WarningLegacyClients clients = new WarningLegacyClients();
        clients.observe(10001, false, 500);
        assertThrows(IllegalArgumentException.class, () -> clients.observe(0, true, 600));
        assertTrue(clients.legacyActive(550));
        assertThrows(IllegalArgumentException.class, () -> clients.observe(10001, true, 549));
        assertThrows(IllegalArgumentException.class, () -> clients.legacyActive(Long.MAX_VALUE));
        assertTrue(clients.legacyActive(550));
    }
}
