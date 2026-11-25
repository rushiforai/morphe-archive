package org.ungoogled.ui;
import static org.junit.Assert.*;import org.junit.Test;
public class RoadPassageProjectionTest {
 @Test public void parallelPointWithinLegacySixtyMeterCorridorIsUnknownForPassage(){RoadWarningEngine.Route r=new RoadWarningEngine.Route(new double[]{0,.01},new double[]{0,0});assertNull(r.passageDistance(.005,0,.0044,.0002,3));}
 @Test public void parallelReturnLegMakesNearbyPositionAmbiguous(){RoadWarningEngine.Route r=new RoadWarningEngine.Route(new double[]{0,.01,.01,0},new double[]{0,0,.00005,.00005});assertNull(r.passageDistance(.005,0,.0044,0,3));}
 @Test public void adjacentSegmentsAtOrdinaryVertexAreNotAmbiguous(){RoadWarningEngine.Route r=new RoadWarningEngine.Route(new double[]{0,.005,.01},new double[]{0,0,0});assertEquals(-66.7,r.passageDistance(.005,0,.0044,0,3),1);}
 @Test public void freshPointRelevanceSeparatesAheadPassedOffRouteAndNearbyAmbiguity(){
  RoadWarningEngine.Route r=new RoadWarningEngine.Route(new double[]{0,.01},new double[]{0,0});
  assertEquals(nl.johninnl.navigation.alerts.WarningPassage.Relevance.RELEVANT,r.warningRelevance(.005,0,.006,0,3));
  assertEquals(nl.johninnl.navigation.alerts.WarningPassage.Relevance.PASSED,r.warningRelevance(.005,0,.004,0,3));
  assertEquals(nl.johninnl.navigation.alerts.WarningPassage.Relevance.OFF_ROUTE,r.warningRelevance(.005,0,.006,.001,3));
  assertEquals(nl.johninnl.navigation.alerts.WarningPassage.Relevance.CONTEXT_UNVERIFIED,r.warningRelevance(.005,0,.006,.0002,3));
  assertEquals(nl.johninnl.navigation.alerts.WarningPassage.Relevance.CONTEXT_UNVERIFIED,r.warningRelevance(.005,.001,.006,0,3));
 }
 @Test public void routeBendIsDirectedAndParallelReturnLegDoesNotGuess(){
  RoadWarningEngine.Route bend=new RoadWarningEngine.Route(new double[]{0,.005,.005},new double[]{0,0,.005});
  assertEquals(nl.johninnl.navigation.alerts.WarningPassage.Relevance.RELEVANT,bend.warningRelevance(.0049,0,.005,.001,3));
  RoadWarningEngine.Route loop=new RoadWarningEngine.Route(new double[]{0,.01,.01,0},new double[]{0,0,.00005,.00005});
  assertEquals(nl.johninnl.navigation.alerts.WarningPassage.Relevance.CONTEXT_UNVERIFIED,loop.warningRelevance(.005,0,.006,0,3));
 }
}
