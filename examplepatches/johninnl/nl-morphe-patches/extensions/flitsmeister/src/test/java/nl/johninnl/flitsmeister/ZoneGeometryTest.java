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
 @Test public void zeroLengthAndMalformedGeometryStayUnavailable() {
  assertFalse(ZoneGeometry.project(new double[][]{{0,0},{0,0}},0,0).inside);
  assertFalse(ZoneGeometry.project(new double[][]{{Double.NaN,0},{0,1}},0,0).inside);
 }
}
