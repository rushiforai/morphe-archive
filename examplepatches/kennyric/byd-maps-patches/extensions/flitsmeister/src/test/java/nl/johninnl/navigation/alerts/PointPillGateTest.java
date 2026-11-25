package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import org.junit.Test;

public class PointPillGateTest {
    private static final WarningPassage.Relevance RELEVANT=WarningPassage.Relevance.RELEVANT,
        UNVERIFIED=WarningPassage.Relevance.CONTEXT_UNVERIFIED,OFF=WarningPassage.Relevance.OFF_ROUTE,PASSED=WarningPassage.Relevance.PASSED;

    @Test public void unverifiedPointWithoutDistanceNeverAppears(){
        PointPillGate gate=new PointPillGate();
        assertFalse(gate.visible("closure",UNVERIFIED,false,1000));
        assertFalse("A route match without a distance is still withheld",gate.visible("closure",RELEVANT,false,2000));
    }
    @Test public void pointWithDistanceSurvivesOneLostFixButNotTheHoldWindow(){
        PointPillGate gate=new PointPillGate();
        assertTrue(gate.visible("camera",UNVERIFIED,true,1000));
        assertTrue("One unverifiable fix must not blink a verified pill",gate.visible("camera",UNVERIFIED,false,2000));
        assertTrue(gate.visible("camera",UNVERIFIED,false,1000+PointPillGate.HOLD_MS));
        assertFalse(gate.visible("camera",UNVERIFIED,false,1001+PointPillGate.HOLD_MS));
    }
    @Test public void offRouteAndPassedHideImmediatelyAndCancelTheHold(){
        PointPillGate gate=new PointPillGate();
        assertTrue(gate.visible("a",RELEVANT,true,1000));
        assertFalse("Off-route wins even with a provider distance",gate.visible("a",OFF,true,1100));
        assertFalse(gate.visible("a",UNVERIFIED,false,1200));
        assertTrue(gate.visible("b",RELEVANT,true,1000));
        assertFalse(gate.visible("b",PASSED,false,1100));assertFalse(gate.visible("b",UNVERIFIED,false,1200));
    }
    @Test public void clockRegressionDropsTheHold(){
        PointPillGate gate=new PointPillGate();
        assertTrue(gate.visible("a",RELEVANT,true,5000));
        assertFalse(gate.visible("a",UNVERIFIED,false,4000));
    }
}
