package dev.freeteaspoon.wisprflowbridge;

import org.junit.Test;
import static org.junit.Assert.*;

public class BridgePolicyTest {
    @Test public void onlyVerifiedWisprVersionsEnableTheBridge() {
        assertTrue(BridgePolicy.supportsVersion("2.8.5"));
        assertTrue(BridgePolicy.supportsVersion("2.8.7"));
        assertFalse(BridgePolicy.supportsVersion("2.8.6"));
        assertFalse(BridgePolicy.supportsVersion("2.8.8"));
        assertFalse(BridgePolicy.supportsVersion(null));
    }

    @Test public void commandsRequireTheRealCurrentImeUid() {
        assertTrue(BridgePolicy.acceptsSender(10400, 10400));
        assertFalse(BridgePolicy.acceptsSender(10401, 10400));
        assertFalse(BridgePolicy.acceptsSender(-1, -1));
        assertFalse(BridgePolicy.acceptsSender(0, 10400));
    }

    @Test public void keyboardModeRetainsRecordingAndRecoveryControls() {
        for (String state : new String[]{"Recording", "Processing", "Error", "Repair"}) {
            assertTrue(state, BridgePolicy.showOverlay(true, state));
        }
        assertFalse(BridgePolicy.showOverlay(true, "Idle"));
        assertFalse(BridgePolicy.showOverlay(true, "FlowBubble"));
        assertTrue(BridgePolicy.showOverlay(false, "Idle"));
    }

    @Test public void stoppingCannotAccidentallyStartAnotherDictation() {
        for (String status : new String[]{"Idle", "Error", "Dismissed"}) {
            assertTrue(status, BridgePolicy.canStart(status));
            assertFalse(status, BridgePolicy.canStop(status, true));
            assertFalse(status, BridgePolicy.canStop(status, false));
        }
        assertFalse(BridgePolicy.canStart("Processing"));
        assertFalse(BridgePolicy.canStop("Processing", false));
        assertFalse(BridgePolicy.canStop("Initializing", true));
        assertTrue(BridgePolicy.canStop("Initializing", false));
        assertTrue(BridgePolicy.canStop("Listening", true));
        assertTrue(BridgePolicy.canStop("Listening", false));
    }

    @Test public void wisprMeterMapsOntoGboardWaveformRange() {
        assertEquals(0, BridgePolicy.voiceLevel(-0.1f));
        assertEquals(0, BridgePolicy.voiceLevel(Float.NaN));
        assertEquals(37, BridgePolicy.voiceLevel(0.37f));
        assertEquals(100, BridgePolicy.voiceLevel(1.1f));
    }
}
