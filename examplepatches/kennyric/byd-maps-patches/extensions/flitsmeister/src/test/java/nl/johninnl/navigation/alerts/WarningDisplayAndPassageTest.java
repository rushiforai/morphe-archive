package nl.johninnl.navigation.alerts;
import static org.junit.Assert.*;
import android.os.Bundle;
import android.location.Location;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class WarningDisplayAndPassageTest {
    final WarningSchedulerTest fixtures=new WarningSchedulerTest();
    WarningEvent state(String id,int priority,long revision){return fixtures.event(id,priority,revision,WarningEvent.Operation.UPSERT);}
    @Test public void allNineteenOwnerIconsHaveExplicitSemanticMappings(){
        String[][] cases={
            {"speed_trap","SPEED_TRAP","","speed_control"},{"poor_road","INCIDENT","BUMPY_ROAD","road_danger"},
            {"speed_camera","SPEED_CAM","SPEED_100","speed_control"},{"average_speed","AVG_SPEED_CHECK","","speed_control"},
            {"traffic_jam","TRAFFIC_JAM","","traffic"},{"speed_trap_hotspot","POLICEHOTSPOT","","police_control"},
            {"incident","INCIDENT","OBSTACLE","road_danger"},{"wrong_way","INCIDENT","WRONG_WAY_DRIVER","road_danger"},
            {"bridge","INCIDENT","BRIDGE_OPEN","road_danger"},{"roadworks","INCIDENT","ROADWORKS","roadworks"},
            {"emergency","INCIDENT","AMBULANCE","emergency_vehicle"},{"maximum_speed_unknown","MAXIMUM_SPEED","","maximum_speed"},
            {"animals","INCIDENT","ANIMAL_ON_ROAD","road_danger"},{"border_nl","BORDER_CROSSING","","border_crossing"},
            {"speed_limit_130","MAXIMUM_SPEED","","maximum_speed"},{"traffic_camera","SPEED_CAM","TRAFFIC_CAMERA","traffic_camera"},
            {"matrix","CITS_LANE_CLOSED","","closure"},{"level_crossing","EARLY_WARNING","RAILWAY_CROSSING","road_feature"},
            {"traffic_light","CITS_SPEED_ADVICE","","speed_advice"},
            {"speed_trap","POLICE","POLICE_HIDING","police_control"},{"speed_trap","POLICE","POLICE_VISIBLE","police_control"},
            {"speed_trap","REPORT","CONTROL","police_control"}};
        for(String[] row:cases){Bundle b=WarningCodec.encode(state(row[0],1,1));b.putString("native_type",row[1]);b.putString("native_subtype",row[2]);b.putString("category",row[3]);
            if(row[0].equals("border_nl"))b.putString("country_code","NL");
            if(row[0].equals("speed_limit_130"))b.putInt("road_speed_limit_kmh",130);
            if(row[0].equals("traffic_light")){b.putString("capture_path","vri_state");b.putBoolean("native_is_traffic_light",true);}
            assertEquals(row[0],row[0],WarningIcons.key(WarningCodec.decode(b,1000)));
        }
    }
    @Test public void structuredCarPillsRespectNativeExclusionAndGeometryAge(){
        Bundle b=WarningCodec.encode(state("geometry",1,1));b.putInt("distance_m",100);b.putLong("distance_observed_elapsed_ms",1000);b.putBoolean("distance_estimated",false);
        b.putInt("trigger_m",400);b.putLong("trigger_observed_elapsed_ms",1000);b.putBoolean("trigger_estimated",false);
        WarningEvent event=WarningCodec.decode(b,1000);assertEquals(.75f,CarWarningPills.approachProgress(event,1100),0);
        assertNull(CarWarningPills.approachProgress(event,7000));
        WarningView view=new WarningView();b.putBoolean("native_car_available",false);view.events(Collections.singletonList(WarningCodec.decode(b,1000)));
        assertTrue(view.carEvents(1100,e->true).isEmpty());assertFalse(view.messages(1100,e->true).isEmpty());
    }
    @Test public void emergencyArtworkDoesNotTurnAStaticWazeHazardIntoBehind(){
        Bundle b=WarningCodec.encode(state("emergency",1,1));b.putString("native_type","HAZARD");b.putString("native_subtype","HAZARD_TYPE_EMERGENCY_VEHICLE");b.putString("category","road_danger");b.putString("relationship","behind");
        WarningEvent event=WarningCodec.decode(b,1000);assertEquals("emergency",WarningIcons.key(event));assertEquals("",CarWarningPills.relation(event,false));
        b.putString("category","emergency_vehicle");event=WarningCodec.decode(b,1000);assertEquals("Behind",CarWarningPills.relation(event,false));
        b.putString("relationship","unknown");assertEquals("",CarWarningPills.relation(WarningCodec.decode(b,1000),false));
    }
    @Test public void multipleUrgentWarningsStayVisibleAndNonwarningContentIsExcluded(){
        WarningView view=new WarningView();WarningEvent camera=state("camera",1,1),behind=state("ambulance behind",0,1),person=state("person on road",0,1);
        Bundle b=WarningCodec.encode(state("parking",0,1));b.putString("category","display_only");view.events(Arrays.asList(camera,behind,person,WarningCodec.decode(b,1000)));
        String shown=view.messages(1100,e->true);assertTrue(shown.contains("ambulance behind"));assertTrue(shown.contains("person on road"));assertFalse(shown.contains("parking"));assertEquals(3,shown.split("\n").length);
    }
    @Test public void staleSnapshotCannotOverwriteANewerRevision(){
        WarningView view=new WarningView();WarningEvent old=state("road",1,1),current=state("road",1,2);view.events(Arrays.asList(old,current));
        view.snapshot(new WarningConnection.Snapshot(old.providerSession,old.sequence,false,true,"UNOWNED",new ArrayList<>(Arrays.asList(old)),new ArrayList<>(),new ArrayList<>(),new ArrayList<>()));
        assertTrue(view.messages(1100,e->true).contains("revision 2"));assertEquals("",view.messages(31000,e->true));
    }
    @Test public void explicitPoliceSelectionMatchesTheActualPinnedNativeEnum(){
        android.content.SharedPreferences prefs=org.robolectric.RuntimeEnvironment.getApplication().getSharedPreferences("native-police",0);prefs.edit().clear().putInt("waze_alerts_kinds",1).commit();WarningPreferences choices=new WarningPreferences(prefs,true);
        Bundle b=WarningCodec.encode(state("police",1,1));b.putString("native_type","POLICEHOTSPOT");assertTrue(choices.enabled(WarningCodec.decode(b,1000)));
        b.putString("category","emergency_vehicle");assertFalse(choices.enabled(WarningCodec.decode(b,1000)));
    }
    @Test public void pointPassageNeedsFreshDirectedEvidenceAndNeverFiltersEmergency(){
        Bundle b=WarningCodec.encode(state("point",1,1));b.putString("relevance","point_ahead");b.putDouble("latitude",0);b.putDouble("longitude",0);b.putLong("position_observed_elapsed_ms",1000);b.putBoolean("position_estimated",false);WarningEvent point=WarningCodec.decode(b,1000);
        Location fix=new Location("gps");fix.setLatitude(.001);fix.setLongitude(0);fix.setAccuracy(5);fix.setSpeed(10);fix.setBearing(0);fix.setElapsedRealtimeNanos(1000000000);
        assertTrue(WarningPassage.passed(point,fix,1100));assertFalse(WarningPassage.passed(point,fix,7000));fix.setLongitude(.001);assertFalse(WarningPassage.passed(point,fix,1100));fix.setLongitude(0);fix.setSpeed(0);assertFalse(WarningPassage.passed(point,fix,1100));
        assertFalse(WarningPassage.passedOnRoute(point,fix,1100,100d));assertTrue(WarningPassage.passedOnRoute(point,fix,1100,-100d));assertFalse(WarningPassage.passedOnRoute(point,fix,1100,null));
        b.putString("relevance","moving_emergency");assertFalse(WarningPassage.passed(WarningCodec.decode(b,1000),fix,1100));assertFalse(WarningPassage.passed(point,null,1100));
    }
    @Test public void producerSpecificFamiliesUseThePromisedAudibleCategory(){
        Bundle b=WarningCodec.encode(state("families",1,1));
        for(String family:new String[]{"service_vehicle","slow_vehicle","roadworks","weather","closure"}){
            b.putString("category",family);assertEquals(family,WarningPreferences.ROAD_DANGER,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        }
        b.putString("category","traffic_camera");assertEquals(WarningPreferences.CAMERA,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        b.putString("category","police_control");assertEquals(WarningPreferences.POLICE,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
    }
    @Test public void wazeWarningCategoriesPreserveZoneRoadFeaturesAndStaticEmergencyHazards(){
        Bundle b=WarningCodec.encode(state("waze",1,1));
        b.putString("native_type","AVERAGE_SPEED_CAMERA");b.putString("category","average_speed_zone");
        assertEquals(WarningPreferences.ZONE,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        b.putString("native_type","NOTIFICATION");b.putString("category","road_feature");
        assertEquals(WarningPreferences.ROAD_DANGER,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        b.putString("native_type","HAZARD");b.putString("category","road_danger");b.putString("native_subtype","HAZARD_TYPE_EMERGENCY_VEHICLE");
        assertEquals(WarningPreferences.ROAD_DANGER,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        b.putString("native_type","POLICE");b.putString("category","police_control");b.putString("native_subtype","POLICE_TYPE_MOBILE_CAMERA");
        assertEquals(WarningPreferences.CAMERA,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        b.putString("native_subtype","POLICE_TYPE_HIDDEN");assertEquals(WarningPreferences.POLICE,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        b.putString("category","other_native");b.putString("native_subtype","");
        for(String type:new String[]{"HAZARD","ACCIDENT","CONSTRUCTION","CLOSURE","BLOCKED_LANE","BAD_WEATHER","PERMANENT_HAZARD","ANIMAL","SUDDEN_SLOWDOWN","SPEED_BUMP","DANGEROUS_CURVE","SCHOOL_ZONE"}){
            b.putString("native_type",type);assertEquals(type,WarningPreferences.ROAD_DANGER,WarningPreferences.categoryOf(WarningCodec.decode(b,1000)));
        }
    }

    @Test public void wazeLegacyFineCategoryChoicesKeepCrashAndClosureMeaningWithoutASubtype(){
        android.content.SharedPreferences prefs=org.robolectric.RuntimeEnvironment.getApplication().getSharedPreferences("waze-legacy-types",0);prefs.edit().clear().putInt("waze_alerts_kinds",1<<1).commit();
        WarningPreferences choices=new WarningPreferences(prefs,true,WarningProviders.WAZE);Bundle b=WarningCodec.encode(state("waze-legacy",1,1));b.putString("native_subtype","");b.putString("native_type","ACCIDENT");
        assertTrue(choices.enabled(WarningCodec.decode(b,1000)));b.putString("native_type","HAZARD");assertFalse(choices.enabled(WarningCodec.decode(b,1000)));
        prefs.edit().putInt("morphe_native_warnings_waze_legacy_types",1<<4).commit();b.putString("native_type","CONSTRUCTION");assertTrue(choices.enabled(WarningCodec.decode(b,1000)));b.putString("native_type","CLOSURE");assertTrue(choices.enabled(WarningCodec.decode(b,1000)));
    }

    @Test public void nativeCarVariantsAndExclusionsDoNotChangePhoneTextOrOrdinaryWarnings(){
        WarningView view=new WarningView();Bundle b=WarningCodec.encode(state("notification",1,1));b.putString("native_type","NOTIFICATION");b.putString("message","Phone cyclist title and detail");b.putBoolean("native_car_available",true);b.putString("native_car_title","Cyclist ahead");b.putString("native_car_body","Use caution");
        view.events(Collections.singletonList(WarningCodec.decode(b,1000)));
        assertEquals("Phone cyclist title and detail",view.messages(1000,event->true));assertEquals("Cyclist ahead: Use caution",view.carMessages(1000,event->true));
        view.clear();b.putBoolean("native_car_available",false);view.events(Collections.singletonList(WarningCodec.decode(b,1000)));
        assertEquals("Phone cyclist title and detail",view.messages(1000,event->true));assertEquals("",view.carMessages(1000,event->true));
        view.events(Collections.singletonList(state("camera",1,1)));assertEquals("Native camera revision 1",view.carMessages(1000,event->true));
        assertEquals("",view.carMessages(1000,event->false));
    }

    @Test public void carLabelsBehindOnlyWhenAnEmergencyEventSaysBehind(){
        WarningView view=new WarningView();Bundle b=WarningCodec.encode(state("responder",0,1));
        b.putString("category","emergency_vehicle");b.putString("message","Emergency vehicle");b.putString("language_tag","en");
        b.putString("relationship","behind");view.events(Collections.singletonList(WarningCodec.decode(b,1000)));
        assertEquals("Behind · Emergency vehicle",view.carMessages(1000,e->true));
        assertEquals("Emergency vehicle",view.messages(1000,e->true));
        view.clear();b.putString("relationship","unknown");view.events(Collections.singletonList(WarningCodec.decode(b,1000)));
        assertEquals("Emergency vehicle",view.carMessages(1000,e->true));
        view.clear();b.putString("relationship","behind");b.putString("language_tag","nl");view.events(Collections.singletonList(WarningCodec.decode(b,1000)));
        assertEquals("Van achteren · Emergency vehicle",view.carMessages(1000,e->true));
    }

    private WarningEvent point(boolean fixed){
        Bundle b=WarningCodec.encode(state("source-point",1,1));b.putString("relevance","point_ahead");b.putDouble("latitude",.001);b.putDouble("longitude",0);
        b.putLong("position_observed_elapsed_ms",1000);b.putBoolean("position_estimated",false);b.putBoolean("native_point_target",fixed);return WarningCodec.decode(b,1000);
    }
    private Location geometryFix(long at){Location fix=new Location("gps");fix.setLatitude(0);fix.setLongitude(0);fix.setAccuracy(5);fix.setBearing(0);fix.setElapsedRealtimeNanos(at*1000000);return fix;}
    @Test public void fixedSourceCoordinatesProduceAnEstimatedDisplayDistanceWithoutChangingNativeAuthority(){
        WarningEvent original=point(true);WarningGeometry shown=WarningGeometry.display(original,geometryFix(1000),1100,null,false);
        assertNotNull(shown);assertEquals(111,shown.distanceMeters,2);assertTrue(shown.estimated);assertEquals("receiver_heading",shown.origin);assertEquals(1000,shown.observedAt);
        assertNull("No provider trigger means no invented progress",shown.progress(original,1100));assertNull(original.distanceMeters);assertFalse(original.fields().containsKey("trigger_m"));
        assertEquals(1000,original.observedAt);assertEquals(1000,original.issuedAt);assertEquals(WarningEvent.Operation.UPSERT,original.operation);
    }
    @Test public void derivedDistancesRequireCurrentAccuratePositionAndTheRealReceivingRouteWhenActive(){
        WarningEvent original=point(true);Location fix=geometryFix(1000);
        assertNull(WarningGeometry.display(original,fix,7000,null,false));assertNull(WarningGeometry.display(original,geometryFix(1200),1100,null,false));
        fix.setAccuracy(100);assertNull(WarningGeometry.display(original,fix,1100,null,false));fix=geometryFix(1000);
        assertNull(WarningGeometry.display(original,fix,1100,null,true));assertNull(WarningGeometry.display(original,fix,1100,-20d,true));assertNull(WarningGeometry.display(original,fix,1100,2500d,true));
        fix.removeBearing();WarningGeometry route=WarningGeometry.display(original,fix,1100,450d,true);assertNotNull(route);assertEquals(450,route.distanceMeters);assertTrue(route.estimated);assertEquals("receiver_route",route.origin);
        assertNull("A native route cannot fall back to the straight line",WarningGeometry.display(original,fix,1100,null,true));
    }
    @Test public void movingAndStaleNonfixedSourceGeometryNeverAcquiresAFabricatedDistanceOrDirection(){
        assertNull(WarningGeometry.display(point(false),geometryFix(6500),7000,null,false));assertNotNull(WarningGeometry.display(point(true),geometryFix(6500),7000,null,false));
        Bundle b=WarningCodec.encode(point(false));b.putString("relevance","moving_emergency");b.putString("category","emergency_vehicle");b.putDouble("native_early_distance_m",100);b.putDouble("native_early_heading_degrees",180);
        WarningEvent emergency=WarningCodec.decode(b,1000);assertNull(WarningGeometry.display(emergency,geometryFix(1000),1100,100d,true));assertEquals("unknown",emergency.relationship);
        Location behind=geometryFix(1000);behind.setBearing(180);assertNull(WarningGeometry.display(point(true),behind,1100,null,false));
    }
    @Test public void nativeDistanceAndTriggerKeepTheirOwnClocksAndExpireWithoutRefreshingTheEvent(){
        Bundle b=WarningCodec.encode(point(true));b.putInt("distance_m",100);b.putLong("distance_observed_elapsed_ms",1000);b.putBoolean("distance_estimated",false);b.putInt("trigger_m",400);b.putLong("trigger_observed_elapsed_ms",1000);b.putBoolean("trigger_estimated",false);
        WarningEvent original=WarningCodec.decode(b,1000);WarningGeometry nativeValue=WarningGeometry.display(original,null,1100,null,true);assertNotNull(nativeValue);assertEquals(100,nativeValue.distanceMeters);assertFalse(nativeValue.estimated);assertEquals("native",nativeValue.origin);assertEquals(.75f,nativeValue.progress(original,1100),0);
        assertNull(WarningGeometry.fromNative(original,7000));WarningGeometry updated=WarningGeometry.display(original,geometryFix(6500),7000,350d,true);assertEquals(350,updated.distanceMeters);assertNull(updated.progress(original,7000));assertEquals(Long.valueOf(1000),original.distanceObservedAt);assertEquals(Integer.valueOf(100),original.distanceMeters);
        b.putLong("state_until_elapsed_ms",1050);assertNull(WarningGeometry.display(WarningCodec.decode(b,1000),geometryFix(1000),1100,350d,true));
    }
    @Test public void aCorrelatedWazeAverageSegmentUsesTheAverageCameraIconWithoutRelabelingOtherZones(){
        Bundle b=WarningCodec.encode(state("waze-average",1,1));b.putString("native_type","CAMERA");b.putString("category","enforcement_zone");b.putString("native_segment_type","AVERAGE_SPEED_CAMERA");
        assertEquals("speed_camera",WarningIcons.key(WarningCodec.decode(b,1000)));
        b.putBoolean("native_segment_correlated",true);assertEquals("average_speed",WarningIcons.key(WarningCodec.decode(b,1000)));
        b.putString("native_segment_type","ENFORCEMENT_ZONE");assertEquals("speed_camera",WarningIcons.key(WarningCodec.decode(b,1000)));
    }
    @Test public void visualVocabularyNeverChangesNativeMeaningOrInventsTrafficLightState(){
        assertEquals(19,IndicatorContract.Kind.values().length);
        Bundle b=WarningCodec.encode(state("info",1,1));b.putString("native_type","ROAD_LIMIT_CHANGE");b.putString("category","maximum_speed");b.putInt("road_speed_limit_kmh",100);
        IndicatorContract.annotate(b);assertEquals(1,b.getInt("indicator_contract_version"));assertEquals("MAXIMUM_SPEED",b.getString("indicator_kind"));assertEquals("ROAD_LIMIT_CHANGE",b.getString("native_type"));
        assertEquals("100 km/h",IndicatorContract.valueText(WarningCodec.decode(b,1000),false));assertEquals("62 mph",IndicatorContract.valueText(WarningCodec.decode(b,1000),true));
        b.putInt("road_speed_limit_kmh",130);assertEquals("speed_limit_130",WarningIcons.key(WarningCodec.decode(b,1000)));
        b.putString("native_type","HOP_HOP_GAS_EROP");assertEquals("speed_limit_130",WarningIcons.key(WarningCodec.decode(b,1000)));assertEquals("HOP_HOP_GAS_EROP",b.getString("native_type"));
        b.putString("native_type","BORDER_CROSSING");b.putString("category","border_crossing");b.putString("country_code","BE");assertEquals("incident",WarningIcons.key(WarningCodec.decode(b,1000)));
        b.putString("country_code","NL");assertEquals("border_nl",WarningIcons.key(WarningCodec.decode(b,1000)));
        b.putString("native_type","CITS_SPEED_ADVICE");b.putString("category","speed_advice");b.putString("capture_path","vri_state");assertEquals("incident",WarningIcons.key(WarningCodec.decode(b,1000)));
        b.putBoolean("native_is_traffic_light",true);assertEquals("traffic_light",WarningIcons.key(WarningCodec.decode(b,1000)));
    }
    @Test public void nativeUiRangeIsNotAnAudioTriggerAndExpiresIndependently(){
        Bundle b=WarningCodec.encode(state("range",1,1));b.putInt("distance_m",100);b.putLong("distance_observed_elapsed_ms",1000);b.putBoolean("distance_estimated",false);
        b.putInt("range_m",400);b.putLong("range_observed_elapsed_ms",1000);b.putBoolean("range_estimated",false);b.putString("range_origin","native_ui_max_distance");
        WarningEvent event=WarningCodec.decode(b,1000);assertNull(event.triggerMeters);assertEquals(.75f,CarWarningPills.approachProgress(event,1100),0);
        b.putString("range_origin","unknown");assertNull(CarWarningPills.approachProgress(WarningCodec.decode(b,1000),1100));
        b.remove("range_estimated");assertThrows(IllegalArgumentException.class,()->WarningCodec.decode(b,1000));
    }
    @Test public void behindHasItsOwnClockAndNeverOutlivesItsPositionObservation(){
        Bundle b=WarningCodec.encode(state("behind",0,1));b.putString("category","emergency_vehicle");b.putString("relationship","behind");
        b.putLong("relationship_observed_elapsed_ms",500);b.putBoolean("relationship_estimated",true);b.putDouble("relative_bearing_degrees",180d);
        WarningEvent event=WarningCodec.decode(b,1000);assertEquals("Behind",CarWarningPills.relation(event,false,1100));assertEquals("",CarWarningPills.relation(event,false,6000));
        b.putDouble("relative_bearing_degrees",360d);assertThrows(IllegalArgumentException.class,()->WarningCodec.decode(b,1000));
    }
    @Test public void correlatedZoneRemainingNeverUsesEntryThresholdAsItsProgressSpan(){
        Bundle b=WarningCodec.encode(state("zone",1,1));b.putString("native_type","CAMERA");b.putString("category","enforcement_zone");b.putBoolean("native_segment_correlated",true);b.putString("native_segment_type","AVERAGE_SPEED_CAMERA");
        b.putString("native_segment_phase","WITHIN");b.putString("native_zone_state","InZone");b.putInt("native_segment_distance_m",1800);b.putLong("native_segment_observed_ms",1000);
        b.putInt("distance_m",0);b.putLong("distance_observed_elapsed_ms",1000);b.putBoolean("distance_estimated",false);b.putInt("trigger_m",500);b.putLong("trigger_observed_elapsed_ms",1000);b.putBoolean("trigger_estimated",false);
        WarningEvent event=WarningCodec.decode(b,1000);WarningGeometry geometry=WarningGeometry.fromNative(event,1100);assertEquals(1800,geometry.distanceMeters);assertNull(geometry.progress(event,1100));assertEquals(Integer.valueOf(0),event.distanceMeters);
        b.putInt("native_zone_percent",40);b.putLong("native_zone_observed_elapsed_ms",1000);event=WarningCodec.decode(b,1000);assertEquals(.4f,geometry.progress(event,1100),0);
        assertNull(geometry.progress(event,7000));assertTrue(CarWarningPills.zoneEvent(event));
        b.putBoolean("native_zone_alarm",true);assertFalse(CarWarningPills.zoneEvent(WarningCodec.decode(b,1000)));
        b.putLong("native_segment_observed_ms",0);assertNull("Stale remaining geometry cannot revert to entry 0m",WarningGeometry.fromNative(WarningCodec.decode(b,1000),6000));
        b.putString("native_zone_state","LeftZone");assertNull(WarningGeometry.fromNative(WarningCodec.decode(b,1000),1100));
    }
    @Test public void staleWithinSegmentCannotAcquireAReceiverEstimateBackToItsEntryPoint(){
        Bundle b=WarningCodec.encode(point(true));b.putString("native_type","CAMERA");b.putBoolean("native_segment_correlated",true);b.putString("native_segment_type","AVERAGE_SPEED_CAMERA");b.putString("native_segment_phase","WITHIN");b.putString("native_zone_state","InZone");b.putInt("native_segment_distance_m",1800);b.putLong("native_segment_observed_ms",1000);
        WarningEvent within=WarningCodec.decode(b,1000);assertFalse(WarningGeometry.pointDisplay(within));
        assertNull(WarningGeometry.display(within,geometryFix(6500),7000,350d,true));
        assertEquals("Original source relevance and authority remain unchanged","point_ahead",within.relevance);
        b.putString("native_segment_phase","APPROACHING");b.putString("native_zone_state","BeforeZone");WarningEvent approach=WarningCodec.decode(b,1000);assertTrue(WarningGeometry.pointDisplay(approach));
        assertEquals("Before entry the qualified receiver route can still estimate the approach",350,WarningGeometry.display(approach,geometryFix(6500),7000,350d,true).distanceMeters);
    }
    @Test public void activeZoneWithoutSegmentCorrelationCannotExposeAnEntryDistanceAsRemaining(){
        Bundle b=WarningCodec.encode(point(true));b.putString("native_type","CAMERA");b.putString("native_zone_state","InZone");b.putInt("distance_m",0);b.putLong("distance_observed_elapsed_ms",1000);b.putBoolean("distance_estimated",false);
        WarningEvent in=WarningCodec.decode(b,1000);assertFalse(WarningGeometry.pointDisplay(in));assertNull(WarningGeometry.fromNative(in,1100));assertNull(WarningGeometry.display(in,geometryFix(1000),1100,350d,true));
        b.putString("native_zone_state","LeftZone");assertNull(WarningGeometry.fromNative(WarningCodec.decode(b,1000),1100));
        b.putString("native_zone_state","BeforeZone");assertEquals(0,WarningGeometry.fromNative(WarningCodec.decode(b,1000),1100).distanceMeters);
    }

    /** An average-speed control with its provider's own fixed start or end point (contract revision 12 November 2026). */
    private WarningEvent zonePoint(String point,String phase,String distanceKind){
        Bundle b=WarningCodec.encode(state("AvgSpeedCheck:a2",1,1));b.putString("native_type","AVG_SPEED_CHECK");b.putString("category","speed_control");
        b.putString("relevance","zone");b.putString("phase",phase);b.putDouble("latitude",.001);b.putDouble("longitude",0);
        b.putLong("position_observed_elapsed_ms",1000);b.putBoolean("position_estimated",false);b.putBoolean("native_point_target",true);
        if(point!=null)b.putString("zone_point",point);
        if(distanceKind!=null){b.putInt("distance_m",800);b.putLong("distance_observed_elapsed_ms",1000);b.putBoolean("distance_estimated",false);b.putString("native_distance_kind",distanceKind);}
        return WarningCodec.decode(b,1000);
    }
    @Test public void aZonePointIsTheControlsStartBeforeEntryAndItsEndInsideAndNothingElse(){
        assertEquals("start",WarningGeometry.zonePoint(zonePoint("start","approach","to_segment")));
        assertEquals("end",WarningGeometry.zonePoint(zonePoint("end","enter","remaining_in_segment")));
        assertEquals("Flitsmeister's own entry announcement while still approaching keeps the start",
            "start",WarningGeometry.zonePoint(zonePoint("start","enter","to_segment")));
        assertNull("An entry point is not shown while the zone is traversed",WarningGeometry.zonePoint(zonePoint("start","enter","remaining_in_segment")));
        assertNull("An end point is not shown before entry",WarningGeometry.zonePoint(zonePoint("end","approach","to_segment")));
        assertNull("Exit has no point",WarningGeometry.zonePoint(zonePoint("end","exit","remaining_in_segment")));
        // acc31: Flitsmeister's own report for the control carries the kept end point and a distance of its own
        // without a kind; it must not alternate with the tracked update.
        Bundle own=WarningCodec.encode(zonePoint("end","enter",null));own.putInt("distance_m",900);own.putLong("distance_observed_elapsed_ms",1000);own.putBoolean("distance_estimated",false);
        assertEquals("end",WarningGeometry.zonePoint(WarningCodec.decode(own,1000)));
        assertNull("An end point without a kind is not shown while approaching",WarningGeometry.zonePoint(zonePoint("end","approach",null)));
        assertNull("Unmarked zone coordinates are not a zone point",WarningGeometry.zonePoint(zonePoint(null,"approach","to_segment")));
        Bundle notFixed=WarningCodec.encode(zonePoint("start","approach","to_segment"));notFixed.putBoolean("native_point_target",false);
        assertNull(WarningGeometry.zonePoint(WarningCodec.decode(notFixed,1000)));
        Bundle estimated=WarningCodec.encode(zonePoint("start","approach","to_segment"));estimated.putBoolean("position_estimated",true);
        assertNull(WarningGeometry.zonePoint(WarningCodec.decode(estimated,1000)));
        assertNull("A camera point is not a zone point",WarningGeometry.zonePoint(point(true)));
    }
    @Test public void aZonePointNeverYieldsAReceiverDistanceOrPassage(){
        WarningEvent start=zonePoint("start","approach","to_segment");
        assertFalse(WarningGeometry.pointDisplay(start));
        assertNull("Stale native distance: no receiver estimate to the start point",WarningGeometry.display(start,geometryFix(7000),7000,500d,true));
        assertNull(WarningGeometry.display(start,geometryFix(7000),7000,null,false));
        Location beyond=geometryFix(1000);beyond.setLatitude(.002);beyond.setSpeed(20);
        assertFalse("Passing the start point does not retire the zone",WarningPassage.passed(start,beyond,1100));
        assertFalse(WarningPassage.passedOnRoute(start,beyond,1100,-100d));
    }
}
