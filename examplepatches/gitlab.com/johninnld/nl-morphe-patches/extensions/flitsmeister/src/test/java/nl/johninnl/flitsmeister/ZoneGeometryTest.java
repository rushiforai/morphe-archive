package nl.johninnl.flitsmeister;
import org.junit.Test;
import static org.junit.Assert.*;
public class ZoneGeometryTest {
 @Test public void followsPolylineRatherThanDistanceToEnd() {
  double[][] path={{0,0},{0,0.01},{0.01,0.01}};
  ZoneGeometry.Result r=ZoneGeometry.project(path,0,0.005);
  assertTrue(r.inside); assertEquals(1668,r.remaining,5); assertEquals(25,r.percent,1);
  assertFalse(ZoneGeometry.project(path,0.005,0.005).inside);
 }
 @Test public void joinedSegmentsMeasureTheWholeControl() {
  double[][] first={{0,0},{0,0.01}},second={{0,0.01},{0.01,0.01}};
  double[][] whole=ZoneGeometry.join(java.util.Arrays.asList(first,second));
  assertEquals(3,whole.length); // the shared point is kept once
  ZoneGeometry.Result r=ZoneGeometry.project(whole,0,0.005);
  assertTrue(r.inside); assertEquals(1668,r.remaining,5); assertEquals(25,r.percent,1);
  ZoneGeometry.Result later=ZoneGeometry.project(whole,0.005,0.01);
  assertTrue(later.inside); assertEquals(556,later.remaining,5); assertEquals(75,later.percent,1);
 }
 @Test public void zeroLengthAndMalformedGeometryStayUnavailable() {
  assertFalse(ZoneGeometry.project(new double[][]{{0,0},{0,0}},0,0).inside);
  assertFalse(ZoneGeometry.project(new double[][]{{Double.NaN,0},{0,1}},0,0).inside);
 }
}
