package nl.johninnl.vela;
import static org.junit.Assert.*;
import org.junit.Test;
import java.util.*;
public class TelemetryStoreTest {
 static final String WAZE="com.waze", FM="nl.flitsmeister";
 static Map<String,Object> packet(String source,String session,long sequence,long at) {
  Map<String,Object> p=new HashMap<>();
  p.put("schema_version",1);p.put("source_package",source);p.put("publisher_session_id",session);p.put("sequence",sequence);p.put("sent_elapsed_ms",at);
  p.put("current_speed_status","valid");p.put("current_speed_kmh",72d);p.put("current_speed_updated_elapsed_ms",at);p.put("current_speed_max_age_ms",5000L);
  p.put("road_speed_limit_status","valid");p.put("road_speed_limit_kmh",100d);p.put("road_updated_elapsed_ms",at);p.put("road_max_age_ms",30000L);
  p.put("zone_status","inactive");p.put("zone_updated_elapsed_ms",at);p.put("zone_max_age_ms",90000L);return p;
 }
 @Test public void selectedProviderSuppliesBothValuesAndNeverMixesTheOtherProvider() {
  TelemetryStore s=new TelemetryStore();s.select(WAZE);
  assertTrue(s.accept(packet(WAZE,"w1",1,1000),WAZE,1000));
  Map<String,Object> fm=packet(FM,"f1",1,1001);fm.put("current_speed_kmh",90d);fm.put("road_speed_limit_kmh",80d);s.accept(fm,FM,1001);
  assertEquals(72,s.view(1001).currentKmh,0);assertEquals(100,s.view(1001).limitKmh,0);
  s.select(FM);assertEquals(90,s.view(1001).currentKmh,0);assertEquals(80,s.view(1001).limitKmh,0);
  s.select("");assertFalse(s.view(1001).external);assertNull(s.view(1001).currentKmh);
 }
 @Test public void measuredZeroIsValidButMissingStaleOrDisabledNumbersAreNot() {
  TelemetryStore s=new TelemetryStore();s.select(WAZE);Map<String,Object> p=packet(WAZE,"w1",1,1000);p.put("current_speed_kmh",0d);s.accept(p,WAZE,1000);
  assertEquals(0,s.view(1000).currentKmh,0);assertNull(s.view(6001).currentKmh);assertEquals(100,s.view(6001).limitKmh,0);
  Map<String,Object> disabled=packet(WAZE,"w1",2,7000);disabled.put("current_speed_status","disabled");disabled.put("road_speed_limit_status","disabled");disabled.put("zone_status","disabled");s.accept(disabled,WAZE,7000);
  assertFalse(s.view(7000).external);assertNull(s.view(7000).limitKmh);
 }
 @Test public void invalidSenderReplayAndFutureOrAncientEnvelopesCannotReplaceState() {
  TelemetryStore s=new TelemetryStore();s.select(WAZE);Map<String,Object> p=packet(WAZE,"w1",2,1000);assertTrue(s.accept(p,WAZE,1000));
  assertFalse(s.accept(packet(WAZE,"w1",3,1001),FM,1001));
  assertFalse(s.accept(packet(WAZE,"w1",1,999),WAZE,1001));
  assertFalse(s.accept(packet(WAZE,"old",9,999),WAZE,1001));
  assertFalse(s.accept(packet(WAZE,"future",1,5000),WAZE,1001));
  assertFalse(s.accept(packet(WAZE,"old",1,0),WAZE,60000));
  assertEquals(72,s.view(1001).currentKmh,0);
 }
 @Test public void heartbeatDoesNotRefreshFieldsAndProviderDeathRestoresNativeFlock() {
  TelemetryStore s=new TelemetryStore();s.select(WAZE);s.accept(packet(WAZE,"w1",1,1000),WAZE,1000);
  assertTrue(s.suppressNativeFlock(1000));
  Map<String,Object> heartbeat=packet(WAZE,"w1",2,4000);heartbeat.put("current_speed_updated_elapsed_ms",1000L);heartbeat.put("road_updated_elapsed_ms",1000L);s.accept(heartbeat,WAZE,4000);
  assertNull(s.view(6001).currentKmh);assertFalse(s.suppressNativeFlock(14001));
 }
 @Test public void eitherFreshAdvertiserPausesFlockOnlyWhenAnExternalSourceWasSelected() {
  TelemetryStore s=new TelemetryStore();s.accept(packet(FM,"f1",1,1000),FM,1000);
  assertFalse(s.suppressNativeFlock(1000));s.select(WAZE);
  assertTrue(s.suppressNativeFlock(1000));assertFalse(s.view(1000).external);
  assertFalse(s.suppressNativeFlock(11001));
 }
 @Test public void partialZoneDataExpiresAndCannotBleedAcrossSourcesOrProcessSessions() {
  TelemetryStore s=new TelemetryStore();s.select(WAZE);Map<String,Object> p=packet(WAZE,"w1",1,5000);
  p.put("zone_status","active");p.put("zone_session",1L);p.put("zone_segment_id","a");p.put("zone_remaining_m",2000);p.put("zone_progress_percent",30d);p.put("zone_progress_estimated",true);
  p.put("zone_observation_start_elapsed_ms",1000L);p.put("zone_observed_distance_m",100);p.put("zone_average_partial",true);p.put("zone_average_speed_kmh",90d);
  s.accept(p,WAZE,5000);assertEquals(90,s.view(5000).averageKmh,0);assertTrue(s.view(5000).partialAverage);
  s.select(FM);assertNull(s.view(5000).averageKmh);s.select(WAZE);assertNull(s.view(95001).averageKmh);
  s.accept(packet(WAZE,"w2",1,96000),WAZE,96000);assertNull(s.view(96000).averageKmh);
 }
 @Test public void malformedNumericsAndFalseCompleteAveragesStayUnavailable() {
  TelemetryStore s=new TelemetryStore();s.select(WAZE);Map<String,Object> p=packet(WAZE,"w1",1,1000);p.put("current_speed_kmh",Double.NaN);p.put("road_speed_limit_kmh",-1d);
  p.put("zone_status","active");p.put("zone_average_speed_kmh",120d);p.put("zone_average_partial",false);
  s.accept(p,WAZE,1000);assertNull(s.view(1000).currentKmh);assertNull(s.view(1000).limitKmh);assertNull(s.view(1000).averageKmh);
 }
 @Test public void eachRoadAlertExpiresIndependentlyOfAnotherFreshEntry() {
  TelemetryStore s=new TelemetryStore();s.select(WAZE);Map<String,Object> p=packet(WAZE,"w1",1,40000);
  p.put("alerts_status","valid");p.put("alerts_updated_elapsed_ms",40000L);p.put("alerts_max_age_ms",30000L);
  p.put("alert_ids",new String[]{"old","fresh"});p.put("alert_kinds",new String[]{"camera","police"});p.put("alert_titles",new String[]{"Camera","Police"});
  p.put("alert_distance_m",new int[]{200,300});p.put("alert_trigger_m",new int[]{300,500});
  p.put("alert_latitude",new double[]{38.54,38.55});p.put("alert_longitude",new double[]{-121.75,-121.75});p.put("alert_updated_elapsed_ms",new long[]{1000,40000});
  assertTrue(s.accept(p,WAZE,40000));assertEquals(1,s.view(40000).alerts.size());assertEquals("fresh",s.view(40000).alerts.get(0).id);
  assertTrue(s.view(40000).alerts.get(0).distanceMeters>0);
 }
 @Test public void approachIsSeparateFromAnActiveZoneAndNeverSuppliesAnAverage() {
  TelemetryStore s=new TelemetryStore();s.select(FM);Map<String,Object> p=packet(FM,"f1",1,1000);
  p.put("zone_approach_status","ahead");p.put("zone_approach_id","ahead-a");p.put("zone_approach_distance_m",600);p.put("zone_approach_distance_estimated",true);p.put("zone_approach_updated_elapsed_ms",1000L);p.put("zone_approach_max_age_ms",30000L);
  s.accept(p,FM,1000);assertEquals("ahead-a",s.view(1000).approachId);assertEquals(600,s.view(1000).approachDistanceMeters.intValue());assertTrue(s.view(1000).approachEstimated);assertFalse(s.view(1000).zoneActive);assertNull(s.view(1000).averageKmh);
 }

}
