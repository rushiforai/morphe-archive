package nl.johninnl.vela;
import org.junit.Test;import static org.junit.Assert.*;import java.util.*;
public class RoadWarningEngineTest {
 private static Map<?,?> cachedTargets(RoadWarningEngine.Route route)throws Exception {
  java.lang.reflect.Field cache=RoadWarningEngine.Route.class.getDeclaredField("targets");cache.setAccessible(true);return (Map<?,?>)cache.get(route);
 }
 private static TelemetryStore.View report(String id,int distance,int trigger,double latitude,double longitude) {
  TelemetryStore s=new TelemetryStore();s.select("com.waze");
  Map<String,Object> p=TelemetryStoreTest.packet("com.waze","w1",1,1000);
  p.put("alerts_status","valid");p.put("alerts_updated_elapsed_ms",1000L);
  p.put("alert_ids",new String[]{id});p.put("alert_kinds",new String[]{"camera"});p.put("alert_titles",new String[]{"Camera"});
  p.put("alert_distance_m",new int[]{distance});p.put("alert_trigger_m",new int[]{trigger});
  p.put("alert_latitude",new double[]{latitude});p.put("alert_longitude",new double[]{longitude});p.put("alert_updated_elapsed_ms",new long[]{1000});
  assertTrue(s.accept(p,"com.waze",1000));return s.view(1000);
 }
 @Test public void providerTriggerControlsSpeechAndUnknownTriggerUsesSpeedLead() {
  RoadWarningEngine e=new RoadWarningEngine();
  RoadWarningEngine.Warning nativeLead=e.update(report("native",800,1000,Double.NaN,Double.NaN),null,1000);
  assertNotNull(nativeLead);assertEquals(1000,nativeLead.leadMeters,0);assertTrue(e.shouldSpeak(nativeLead,1000));
  RoadWarningEngine.Warning shortLead=e.update(report("short",200,100,Double.NaN,Double.NaN),null,10000);
  assertNotNull(shortLead);assertFalse(e.shouldSpeak(shortLead,10000));
  RoadWarningEngine.Warning fallback=e.update(report("unknown",200,-1,Double.NaN,Double.NaN),null,1000);
  assertNotNull(fallback);assertEquals(240,fallback.leadMeters,0);
 }
 @Test public void routeFindsAnApproachAroundABendOutsideTheHeadingCone() {
  RoadWarningEngine e=new RoadWarningEngine();
  RoadWarningEngine.Fix fix=new RoadWarningEngine.Fix(0,0,0,20,1000);
  RoadWarningEngine.Route route=new RoadWarningEngine.Route(new double[]{0,.001,.001},new double[]{0,0,.004});
  TelemetryStore.View view=report("bend",-1,600,.001,.003);
  assertNull(e.update(view,fix,1000)); // Direct bearing is over 60 degrees from the current north heading.
  RoadWarningEngine.Warning w=e.update(view,fix,route,1000);
  assertNotNull(w);assertEquals(444.8,w.distanceMeters,2);assertTrue(w.estimated);assertTrue(e.shouldSpeak(w,1000));
 }
 @Test public void usableRouteRejectsBehindAndOffRouteReportsRatherThanUsingHeading() {
  RoadWarningEngine e=new RoadWarningEngine();
  RoadWarningEngine.Route route=new RoadWarningEngine.Route(new double[]{0,.01},new double[]{0,0});
  RoadWarningEngine.Fix fix=new RoadWarningEngine.Fix(.005,0,180,20,1000);
  TelemetryStore.View behind=report("behind-route",-1,600,.004,0);
  assertNotNull(e.update(behind,fix,1000));assertNull(e.update(behind,fix,route,1000));
  TelemetryStore.View offRoute=report("other-road",-1,600,.007,.001);
  RoadWarningEngine.Fix north=new RoadWarningEngine.Fix(.005,0,0,20,1000);
  assertNotNull(e.update(offRoute,north,1000));assertNull(e.update(offRoute,north,route,1000));
 }
 @Test public void noUsableRouteFallsBackToHeadingButNeverMakesAnOldFixFresh() {
  RoadWarningEngine e=new RoadWarningEngine();TelemetryStore.View view=report("ahead",-1,600,.002,0);
  RoadWarningEngine.Fix fix=new RoadWarningEngine.Fix(.001,0,0,20,1000);
  RoadWarningEngine.Route far=new RoadWarningEngine.Route(new double[]{0,.01},new double[]{.01,.01});
  assertNotNull(e.update(view,fix,far,1000));
  RoadWarningEngine.Route invalid=new RoadWarningEngine.Route(new double[]{Double.NaN,.01},new double[]{0,0});
  assertNotNull(e.update(view,fix,invalid,1000));
  assertNull(e.update(view,fix,new RoadWarningEngine.Route(new double[]{0,.01},new double[]{0,0}),11001));
 }
 @Test public void routeSnapshotPreservesShapeAndDoesNotRequireAHeading() {
  double[] latitude={0,.001,.001},longitude={0,0,.004};
  RoadWarningEngine.Route route=new RoadWarningEngine.Route(latitude,longitude);
  latitude[1]=latitude[2]=.01;longitude[2]=0;
  RoadWarningEngine.Warning w=new RoadWarningEngine().update(report("immutable",-1,600,.001,.003),
   new RoadWarningEngine.Fix(0,0,Double.NaN,20,1000),route,1000);
  assertNotNull(w);assertEquals(444.8,w.distanceMeters,2);
 }
 @Test public void longRouteIgnoresDistantReportsAndReusesTargetsWhileOwnFixMoves()throws Exception {
  double[] latitude=new double[20001],longitude=new double[latitude.length];
  for(int i=0;i<latitude.length;i++)latitude[i]=i*.00001;
  RoadWarningEngine.Route route=new RoadWarningEngine.Route(latitude,longitude);RoadWarningEngine e=new RoadWarningEngine();
  assertNull(e.update(report("distant",-1,600,.15,0),new RoadWarningEngine.Fix(.001,0,0,20,1000),route,1000));
  assertEquals(0,cachedTargets(route).size());
  TelemetryStore.View nearby=report("nearby",-1,600,.003,0);
  RoadWarningEngine.Warning first=e.update(nearby,new RoadWarningEngine.Fix(.001,0,0,20,1000),route,1000);
  Object cached=cachedTargets(route).values().iterator().next();
  RoadWarningEngine.Warning second=e.update(nearby,new RoadWarningEngine.Fix(.002,0,0,20,1000),route,1000);
  assertNotNull(first);assertNotNull(second);assertEquals(first.distanceMeters/2,second.distanceMeters,.1);
  assertEquals(1,cachedTargets(route).size());assertSame(cached,cachedTargets(route).values().iterator().next());
 }
 @Test public void targetCacheIsBoundedAndOffRouteMissesAreRetained()throws Exception {
  RoadWarningEngine.Route route=new RoadWarningEngine.Route(new double[]{0,.02},new double[]{0,0});
  RoadWarningEngine e=new RoadWarningEngine();RoadWarningEngine.Fix fix=new RoadWarningEngine.Fix(0,0,0,20,1000);
  for(int i=0;i<600;i++)assertNotNull(e.update(report("id"+i,-1,600,.001+i*.00001,0),fix,route,1000));
  assertEquals(512,cachedTargets(route).size());
  TelemetryStore.View offRoute=report("off",-1,600,.002,.001);
  assertNull(e.update(offRoute,fix,route,1000));assertTrue(cachedTargets(route).containsValue(null));assertEquals(512,cachedTargets(route).size());
  assertNull(e.update(offRoute,fix,route,1000));assertEquals(512,cachedTargets(route).size());
 }
 @Test public void routeDistancePrefilterRetainsBothLateralAllowanceMargins() {
  // Both fixes are near opposite ends, each59m beyond the route. Direct distance exceeds2060m.
  double degreeMeters=RoadWarningEngine.distance(0,0,.001,0)/.001;
  RoadWarningEngine.Route route=new RoadWarningEngine.Route(new double[]{0,1990/degreeMeters},new double[]{0,0});
  RoadWarningEngine.Warning warning=new RoadWarningEngine().update(report("margin",-1,600,(1990+59)/degreeMeters,0),
   new RoadWarningEngine.Fix(-59/degreeMeters,0,0,20,1000),route,1000);
  assertNotNull(warning);assertEquals(1990,warning.distanceMeters,.1);
 }
 @Test public void approachingZonesWarnBeforeEntryAndOnlyOnce() {
  RoadWarningEngine e=new RoadWarningEngine();TelemetryStore s=new TelemetryStore();s.select("com.waze");
  Map<String,Object> p=TelemetryStoreTest.packet("com.waze","w1",1,1000);
  p.put("zone_approach_status","ahead");p.put("zone_approach_id","z");p.put("zone_approach_distance_m",200);p.put("zone_approach_updated_elapsed_ms",1000L);
  s.accept(p,"com.waze",1000);
  RoadWarningEngine.Warning w=e.update(s.view(1000),null,1000);assertNotNull(w);assertEquals("average_speed_zone",w.kind);assertTrue(e.shouldSpeak(w,1000));assertFalse(e.shouldSpeak(w,2000));
 }
 @Test public void behindOrFarOffHeadingReportsDoNotWarn() {
  RoadWarningEngine e=new RoadWarningEngine();TelemetryStore s=new TelemetryStore();s.select("com.waze");
  Map<String,Object> p=TelemetryStoreTest.packet("com.waze","w1",1,1000);
  p.put("alerts_status","valid");p.put("alerts_updated_elapsed_ms",1000L);p.put("alert_ids",new String[]{"behind"});p.put("alert_kinds",new String[]{"camera"});p.put("alert_titles",new String[]{"Camera"});p.put("alert_distance_m",new int[]{-1});p.put("alert_trigger_m",new int[]{300});p.put("alert_latitude",new double[]{38.53});p.put("alert_longitude",new double[]{-121.75});p.put("alert_updated_elapsed_ms",new long[]{1000});
  s.accept(p,"com.waze",1000);
  RoadWarningEngine.Fix fix=new RoadWarningEngine.Fix(38.54,-121.75,0,20,1000);
  assertNull(e.update(s.view(1000),fix,1000));
 }
}
