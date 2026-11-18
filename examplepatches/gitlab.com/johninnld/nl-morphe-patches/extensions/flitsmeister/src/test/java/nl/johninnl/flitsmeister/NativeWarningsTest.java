package nl.johninnl.flitsmeister;

import static org.junit.Assert.*;
import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
public class NativeWarningsTest {
    @Test public void nativeEarlyGeometryRetainsRawValuesWithoutInventingFreshDistance(){
        Bundle fields=new Bundle();NativeWarnings.nativeEarlyGeometry(fields,100d,400d,270f,1234L);
        assertEquals(100d,fields.getDouble("native_early_distance_m"),0);
        assertEquals(400d,fields.getDouble("native_early_max_distance_m"),0);
        assertEquals(270d,fields.getDouble("native_early_heading_degrees"),0);
        assertEquals(1234L,fields.getLong("native_early_geometry_read_elapsed_ms"));
        assertFalse(fields.containsKey("distance_m"));assertFalse(fields.containsKey("relationship"));
        Bundle invalid=new Bundle();NativeWarnings.nativeEarlyGeometry(invalid,Double.NaN,-1d,361d,1234L);
        assertFalse(invalid.containsKey("native_early_geometry_read_elapsed_ms"));
    }
    private final List<Bundle> events = new ArrayList<>();
    private Context app;
    @Before public void before() { app=RuntimeEnvironment.getApplication(); NativeWarnings.resetForTest(app, events::add); }
    @After public void after(){NativeWarnings.setEndpointForTest(null);nl.flitsmeister.fmcore.service.lookahead.RelevantReportsAheadBridge.FLOW.value=Collections.emptyList();}
    public static class BaseReport {
        public String getId(){return "danger-7";}
        public String getReportType(){return "INCIDENT";}
        public Location getLocation(){return null;}
        public String reportTitleText(Context c){return "Native title";}
        public String getShortDescription(Context c){return "Native description";}
    }
    public static class Incident extends BaseReport {
        public String getIncidentType(){return "WRONG_WAY_DRIVER";}
        public String getVoiceOnlyText(){return "Native voice-only warning";}
    }
    public static class EarlyWarningReport extends BaseReport {
        public String getEarlyWarningTypeEnum(){return "AMBULANCE";}
        public String getFreeText(){return "Ambulance behind you";}
        public String getCode(){return "emergency-7";}
        public String getIncidentType(){throw new AssertionError("EarlyWarningReport is not Incident");}
    }
    public static class ServiceVehicle extends BaseReport {
        @Override public String getReportType(){return "SERVICE_VEHICLE";}
        public String getType(){return "TOW_SERVICE";}
    }
    public static class CitsBaseReport extends BaseReport {}
    public static class CitsRoadWorks extends CitsBaseReport {
        public String getIncidentType(){throw new AssertionError("CITS is not Incident");}
    }
    public static class EarlyWarning {
        public String getTitle(){return "Impact attenuator";}
        public String getSubTitle(){return "Road work ahead";}
        public Location getLocation(){return null;}
    }
    public static class Alerted {
        private final Object report;
        Alerted(Object report){this.report=report;}
        public Object getReport(){return report;}
        public boolean isActive(){return true;}
    }
    private Bundle last(){return events.get(events.size()-1);}
    private Location requestFix(long at){Location fix=new Location("request");fix.setLatitude(52);fix.setLongitude(4);fix.setAccuracy(3);fix.setBearing(0);fix.setSpeed(20);fix.setElapsedRealtimeNanos(at*1000000);return fix;}
    private org.json.JSONObject earlyJson(boolean coordinates)throws Exception{
        org.json.JSONObject json=new org.json.JSONObject();json.put("distance",100);json.put("max_distance",400);json.put("heading",0);json.put("type","AMBULANCE");
        if(coordinates){json.put("latitude",51.9991);json.put("longitude",4d);}return json;
    }
    @Test public void requestGeometryRetainsMeasurementClockAndDerivesBehindFromCoordinates()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(true);
        EarlyWarningGeometry.request(task,requestFix(1000));EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
        assertTrue("Bookkeeping must not publish",events.isEmpty());Bundle b=new Bundle();b.putString("category","emergency_vehicle");
        EarlyWarningGeometry.append(b,model,100d,400d,0f,2000);
        assertEquals(100,b.getInt("distance_m"));assertEquals(1000,b.getLong("distance_observed_elapsed_ms"));assertEquals(400,b.getInt("range_m"));assertFalse(b.containsKey("trigger_m"));
        assertEquals("behind",b.getString("relationship"));assertTrue(b.getBoolean("relationship_estimated"));assertEquals(180,b.getDouble("relative_bearing_degrees"),1);
        assertEquals("native_response_request_fix",b.getString("geometry_clock_origin"));assertEquals(1000,b.getLong("relationship_observed_elapsed_ms"));
    }
    @Test public void headingAloneCannotMeanBehindAndUnrelatedParserCannotBorrowARequest()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(false);json.put("heading",180);
        EarlyWarningGeometry.request(task,requestFix(1000));EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);
        Bundle b=new Bundle();b.putString("category","emergency_vehicle");EarlyWarningGeometry.append(b,model,100d,400d,180f,2000);
        assertEquals(100,b.getInt("distance_m"));assertFalse(b.containsKey("relationship"));assertFalse(b.containsKey("latitude"));
        Object unrelated=new Object();EarlyWarningGeometry.parsing(earlyJson(true));EarlyWarningGeometry.parsed(unrelated);b=new Bundle();EarlyWarningGeometry.append(b,unrelated,100d,400d,0f,2000);assertFalse(b.containsKey("distance_m"));
        EarlyWarningGeometry.clear();b=new Bundle();EarlyWarningGeometry.append(b,model,100d,400d,180f,2000);assertFalse(b.containsKey("distance_m"));
    }
    @Test public void partialNativeModelNeverAcquiresDefaultZeroGeometry()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(false);json.remove("distance");
        EarlyWarningGeometry.request(task,requestFix(1000));EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
        Bundle b=new Bundle();EarlyWarningGeometry.append(b,model,0d,400d,0f,2000);assertFalse(b.containsKey("distance_m"));
    }
    @Test public void partialCrossingParserResultCannotRetainDescribeDefaultCoordinates()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(true);json.put("type","RAILWAY_CROSSING");json.put("longitude","broken");
        EarlyWarningGeometry.request(task,requestFix(1000));EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
        Bundle b=new Bundle();b.putDouble("latitude",51.9991);b.putDouble("longitude",0d);b.putLong("position_observed_elapsed_ms",2000);b.putBoolean("position_estimated",false);b.putString("position_clock_origin","native_decision");b.putBoolean("native_point_target",true);
        EarlyWarningGeometry.append(b,model,100d,0d,0f,2000);
        for(String key:new String[]{"latitude","longitude","position_observed_elapsed_ms","position_estimated","position_clock_origin","native_point_target","distance_m"})assertFalse(key,b.containsKey(key));
    }
    @Test public void completeCrossingGeometryRetainsItsFixedTargetWithTheRequestClock()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(true);json.put("type","RAILWAY_CROSSING");
        EarlyWarningGeometry.request(task,requestFix(1000));EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
        Bundle b=new Bundle();b.putBoolean("native_point_target",true);EarlyWarningGeometry.append(b,model,100d,400d,0f,2000);
        assertTrue(b.getBoolean("native_point_target"));assertEquals(1000,b.getLong("position_observed_elapsed_ms"));assertEquals(51.9991,b.getDouble("latitude"),0);assertEquals(4d,b.getDouble("longitude"),0);
    }
    @Test public void unrelatedLegacyOrCitsGeometryIsNotTreatedAsAPartialNetworkParserResult(){
        Bundle b=new Bundle();b.putDouble("latitude",52d);b.putDouble("longitude",4d);b.putBoolean("native_point_target",true);
        EarlyWarningGeometry.append(b,new Object(),100d,400d,0f,2000);assertEquals(52d,b.getDouble("latitude"),0);assertTrue(b.getBoolean("native_point_target"));
    }
    @Test public void nativeDistanceDoesNotRequireAndroidSpeedOrBearingPresence()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(true);Location fix=requestFix(1000);fix.removeSpeed();fix.removeBearing();
        EarlyWarningGeometry.request(task,fix);EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
        Bundle b=new Bundle();b.putString("category","emergency_vehicle");EarlyWarningGeometry.append(b,model,100d,400d,0f,2000);
        assertEquals(100,b.getInt("distance_m"));assertEquals(1000,b.getLong("distance_observed_elapsed_ms"));assertEquals(400,b.getInt("range_m"));
        assertFalse(b.containsKey("relationship"));assertFalse(b.containsKey("relative_bearing_degrees"));
    }
    @Test public void zeroNativeVisualRangeLeavesVerifiedDistanceWithoutInventingProgress()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(false);json.put("max_distance",0);
        EarlyWarningGeometry.request(task,requestFix(1000));EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
        Bundle b=new Bundle();EarlyWarningGeometry.append(b,model,100d,0d,0f,2000);assertEquals(100,b.getInt("distance_m"));assertFalse(b.containsKey("range_m"));assertFalse(b.containsKey("trigger_m"));
    }
    @Test public void invalidBearingAccuracyWithholdsDirectionWithoutDiscardingNativeDistance()throws Exception{
        Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(true);Location fix=requestFix(1000);fix.setBearingAccuracyDegrees(Float.NaN);
        EarlyWarningGeometry.request(task,fix);EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
        Bundle b=new Bundle();b.putString("category","emergency_vehicle");EarlyWarningGeometry.append(b,model,100d,400d,0f,2000);
        assertEquals(100,b.getInt("distance_m"));assertFalse(b.containsKey("relationship"));assertFalse(b.containsKey("relative_bearing_degrees"));
    }
    @Test public void unserializableRequestNumbersCannotBeCorrelatedToAnOlderNativeResponse()throws Exception{
        for(boolean invalidSpeed:new boolean[]{true,false}){
            Object task=new Object(),model=new Object();org.json.JSONObject json=earlyJson(true);Location fix=requestFix(1000);
            if(invalidSpeed)fix.setSpeed(Float.NaN);else fix.setBearing(Float.NaN);
            EarlyWarningGeometry.request(task,fix);EarlyWarningGeometry.response(task,json);EarlyWarningGeometry.parsing(json);EarlyWarningGeometry.parsed(model);EarlyWarningGeometry.finished();
            Bundle b=new Bundle();EarlyWarningGeometry.append(b,model,100d,400d,0f,2000);
            assertFalse("Native JSON serialization rejects NaN request getters",b.containsKey("distance_m"));
        }
    }
    @Test public void roadInformationTransitionsHaveNoNativeAnnouncementAuthority(){
        NativeWarnings.roadLimit(100);NativeWarnings.roadLimit(100);assertTrue(events.isEmpty());NativeWarnings.roadLimit(80);
        assertEquals("UPSERT",last().getString("operation"));assertEquals("ROAD_LIMIT_CHANGE",last().getString("native_type"));assertTrue(last().getBoolean("native_visual_only"));assertEquals(0,last().getLong("announcement_index"));assertEquals(80,last().getInt("road_speed_limit_kmh"));
        int count=events.size();NativeWarnings.roadLimit(0);NativeWarnings.roadLimit(130);assertEquals(count,events.size());
        NativeWarnings.roadLimit(100);assertEquals("ROAD_LIMIT_CHANGE",last().getString("native_type"));assertEquals("MAXIMUM_SPEED",last().getString("indicator_kind"));
    }
    @Test public void roadAndAverageOverspeedKeepSeparateNativeIdentityAndClears(){
        NativeWarnings.maximumSpeed(null);assertEquals("MAXIMUM_SPEED",last().getString("native_type"));assertEquals("ANNOUNCE",last().getString("operation"));String road=last().getString("warning_id");
        NativeWarnings.averageSpeedWarning();assertEquals("AVERAGE_SPEED_WARNING",last().getString("native_type"));assertTrue(last().getBoolean("native_zone_alarm"));assertFalse(last().containsKey("average_speed_kmh"));String zone=last().getString("warning_id");assertNotEquals(road,zone);
        NativeWarnings.maximumSpeedCleared();assertEquals("CLEAR",last().getString("operation"));assertEquals(road,last().getString("warning_id"));NativeWarnings.averageSpeedCleared();assertEquals(zone,last().getString("warning_id"));
    }
    public static class AvgSpeedCheck extends BaseReport {
        @Override public String getId(){return "a2-north";}
        @Override public String getReportType(){return "AVG_SPEED_CHECK";}
    }
    @Test public void averageSpeedControlShipsItsStartThenItsEndAsAFixedNativePoint(){
        NativeWarnings.averageSpeedZone("a2-north",false,800,52.30,4.95);Bundle start=last();
        assertEquals("AvgSpeedCheck:a2-north",start.getString("warning_id"));assertEquals("approach",start.getString("phase"));assertEquals("zone",start.getString("relevance"));
        assertEquals("start",start.getString("zone_point"));assertEquals(52.30,start.getDouble("latitude"),0);assertEquals(4.95,start.getDouble("longitude"),0);
        assertTrue(start.getBoolean("native_point_target"));assertFalse(start.getBoolean("position_estimated",true));assertEquals("native_report_geometry",start.getString("position_clock_origin"));
        NativeWarnings.averageSpeedZone("a2-north",true,14000,52.18,5.02);Bundle end=last();
        assertEquals("enter",end.getString("phase"));assertEquals("end",end.getString("zone_point"));assertEquals(52.18,end.getDouble("latitude"),0);
        assertEquals("remaining_in_segment",end.getString("native_distance_kind"));assertTrue(end.getLong("revision")>start.getLong("revision"));
        // Flitsmeister's own announcement of the same control carries no geometry: it keeps the producer's end and its clocks.
        NativeWarnings.regular(null,new AvgSpeedCheck(),true,false,"Trajectcontrole",null);Bundle own=last();
        assertEquals("AvgSpeedCheck:a2-north",own.getString("warning_id"));assertEquals("ANNOUNCE",own.getString("operation"));
        assertEquals("end",own.getString("zone_point"));assertEquals(52.18,own.getDouble("latitude"),0);
        assertEquals(end.getLong("position_observed_elapsed_ms"),own.getLong("position_observed_elapsed_ms"));
        assertEquals(14000,own.getInt("distance_m"));assertEquals(end.getLong("distance_observed_elapsed_ms"),own.getLong("distance_observed_elapsed_ms"));
        // Its exit has no point to show.
        NativeWarnings.regular(null,new AvgSpeedCheck(),false,false,"Einde trajectcontrole",null);
        assertEquals("exit",last().getString("phase"));assertFalse(last().containsKey("zone_point"));assertFalse(last().containsKey("latitude"));
        NativeWarnings.averageSpeedZoneCleared("a2-north");assertEquals("CLEAR",last().getString("operation"));
    }
    @Test public void missingPartialOrDefaultZonePointShipsNoCoordinates(){
        double[][] invalid={{Double.NaN,5},{52,Double.POSITIVE_INFINITY},{0,0},{91,5},{52,181}};
        for(double[] point:invalid){NativeWarnings.averageSpeedZone("z",false,500,point[0],point[1]);
            assertFalse(last().containsKey("latitude"));assertFalse(last().containsKey("zone_point"));assertFalse(last().containsKey("native_point_target"));}
        NativeWarnings.averageSpeedZone("z",true,500);assertFalse(last().containsKey("latitude"));assertEquals(500,last().getInt("distance_m"));
    }
    @Test public void unavailableControllerFixDoesNotInventSpeedMetadataOrBreakNativeDecision(){
        NativeWarnings.maximumSpeedFromController(null);assertEquals("MAXIMUM_SPEED",last().getString("native_type"));assertFalse(last().containsKey("current_speed_kmh"));
        NativeWarnings.maximumSpeedFromController(new Object());assertEquals("ANNOUNCE",last().getString("operation"));assertFalse(last().containsKey("current_speed_kmh"));
    }
    @Test public void nativeEntryExportsExactTextBeforeLocalMuteAndWithoutSpeedOrGeometry() {
        NativeWarnings.regular(null,new Incident(),true,false,"Spookrijder!",null);
        assertEquals("ANNOUNCE",last().getString("operation"));
        assertEquals("WRONG_WAY_DRIVER",last().getString("native_subtype"));
        assertEquals("Spookrijder!",last().getString("message"));
        assertEquals(0,last().getInt("priority"));
        assertEquals("unknown",last().getString("relationship"));
        assertFalse(last().containsKey("latitude"));
        assertFalse(last().getBoolean("native_local_mute_bypass"));
    }
    @Test public void modelFamilyPrecedesIncidentReportedType() {
        NativeWarnings.regular(null,new EarlyWarningReport(),true,true,"Ambulance behind you",null);
        assertEquals("EarlyWarningReport",last().getString("native_family"));
        assertEquals("AMBULANCE",last().getString("native_subtype"));
        assertEquals("unknown",last().getString("relationship"));
        NativeWarnings.regular(null,new CitsRoadWorks(),true,false,"Werkzaamheden",null);
        assertEquals("CitsRoadWorks",last().getString("native_family"));
        assertEquals("INCIDENT",last().getString("native_type"));
        assertEquals("roadworks",last().getString("category"));assertEquals(1,last().getInt("priority"));assertFalse(last().containsKey("native_subtype"));
    }
    public static class RoadServiceEarlyReport extends EarlyWarningReport {
        @Override public String getEarlyWarningTypeEnum(){return "ROAD_SERVICE";}
    }
    @Test public void acceptedEarlyRoadServiceUsesEmergencyCategoryAndImmediatePriorityWithoutGeometry(){
        NativeWarnings.regular(null,new RoadServiceEarlyReport(),true,false,"Emergency vehicle behind you",null);
        assertEquals("emergency_vehicle",last().getString("category"));assertEquals(0,last().getInt("priority"));assertEquals("moving_emergency",last().getString("relevance"));assertEquals("ROAD_SERVICE",last().getString("native_subtype"));assertFalse(last().containsKey("latitude"));
    }
    @Test public void roadServiceNotificationUsesTheSameEmergencyPolicy(){
        EarlyWarningNotification notification=new EarlyWarningNotification(){@Override public String getType(){return "ROAD_SERVICE";}};
        NativeWarnings.early(null,"ROAD_SERVICE",null,notification,"Emergency vehicle",false,null);
        assertEquals("emergency_vehicle",last().getString("category"));assertEquals(0,last().getInt("priority"));assertEquals("moving_emergency",last().getString("relevance"));
    }
    @Test public void ordinaryRoadServiceIncidentDoesNotAcquireEarlyEmergencySemantics(){
        Incident incident=new Incident(){@Override public String getIncidentType(){return "ROAD_SERVICE";}};
        NativeWarnings.regular(null,incident,true,false,"Road service",null);
        assertEquals("road_danger",last().getString("category"));assertEquals(2,last().getInt("priority"));assertEquals("notice",last().getString("relevance"));
    }
    @Test public void trueNativeRepeatsIncrementButBusUpdatesNeverAnnounce() {
        Incident report=new Incident();
        NativeWarnings.regular(null,report,true,false,"Spookrijder!",null);
        long first=last().getLong("announcement_index");
        NativeWarnings.reports(Arrays.asList(new Alerted(report)));
        assertEquals("UPSERT",last().getString("operation"));
        assertEquals(first,last().getLong("announcement_index"));
        assertEquals("Spookrijder!",last().getString("message"));
        NativeWarnings.regular(null,report,true,false,"Spookrijder!",null);
        assertEquals(first+1,last().getLong("announcement_index"));
        NativeWarnings.reports(Collections.emptyList());
        assertEquals("CLEAR",last().getString("operation"));
    }
    @Test public void alertedReportCarriesFmLookaheadDistanceAndStaysAliveWithoutBusChanges(){
        Incident report=new Incident();
        nl.flitsmeister.fmcore.service.lookahead.RelevantReportsAheadBridge.FLOW.value=Collections.singletonList(new nl.flitsmeister.fmcore.service.lookahead.RelevantReportsAheadBridge.Ahead(report,420f));
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));
        Bundle first=new Bundle(last());
        assertEquals("UPSERT",first.getString("operation"));assertEquals(420,first.getInt("distance_m"));
        assertEquals("native_lookahead",first.getString("distance_origin"));assertFalse(first.getBoolean("distance_estimated"));
        int count=events.size();NativeWarnings.ahead();assertEquals("An unchanged fresh distance is not re-sent every fix",count,events.size());
        nl.flitsmeister.fmcore.service.lookahead.RelevantReportsAheadBridge.FLOW.value=Collections.singletonList(new nl.flitsmeister.fmcore.service.lookahead.RelevantReportsAheadBridge.Ahead(report,380f));
        NativeWarnings.ahead();assertEquals(count+1,events.size());assertEquals(380,last().getInt("distance_m"));
        assertEquals("UPSERT",last().getString("operation"));assertEquals(first.getLong("announcement_index"),last().getLong("announcement_index"));
        assertEquals("Distance alone never changes the warning revision",first.getLong("revision"),last().getLong("revision"));
        nl.flitsmeister.fmcore.service.lookahead.RelevantReportsAheadBridge.FLOW.value=Collections.emptyList();
        for(int second=0;second<45;second++){org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofSeconds(1));NativeWarnings.ahead();}
        long now=android.os.SystemClock.elapsedRealtime();
        assertEquals("UPSERT",last().getString("operation"));assertFalse("A report gone from the look-ahead keeps no distance",last().containsKey("distance_m"));
        assertTrue("Still-alerted state is renewed inside its display window",last().getLong("state_until_elapsed_ms")>now);
        NativeWarnings.reports(Collections.emptyList());assertEquals("CLEAR",last().getString("operation"));
        count=events.size();org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofSeconds(11));NativeWarnings.ahead();
        assertEquals("A cleared report is never revived",count,events.size());
    }
    @Test public void acceptedNativeRepeatAfterStateExpiryDoesNotReuseItsAuthorityKey(){
        Incident report=new Incident();
        NativeWarnings.regular(null,report,true,false,"Wrong-way driver",null);
        Bundle first=new Bundle(last());
        org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofSeconds(31));
        NativeWarnings.regular(null,report,true,false,"Wrong-way driver",null);
        assertEquals(first.getString("warning_id"),last().getString("warning_id"));
        assertEquals(first.getString("phase"),last().getString("phase"));
        assertTrue("A new accepted native announcement needs a distinct authority after cached state expires",
                last().getLong("announcement_index")>first.getLong("announcement_index"));
    }
    @Test public void reportSnapshotPreservesUnknownLanguageOfRetainedFreeText(){
        Incident report=new Incident();NativeWarnings.regular(null,report,true,false,report.getVoiceOnlyText(),null);
        Bundle original=new Bundle(last());assertEquals("und",original.getString("language_tag"));
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));
        assertEquals("UPSERT",last().getString("operation"));
        for(String key:new String[]{"message","message_origin","language_tag","native_text_key"})assertEquals(key,original.getString(key),last().getString(key));
        assertEquals(original.getLong("announcement_index"),last().getLong("announcement_index"));
    }
    @Test public void sameIdVoiceOnlyRevisionUpdatesUnsaidTextWithoutNewAuthority(){
        String[] instruction={"Person on road"};
        Incident report=new Incident(){@Override public String getIncidentType(){return "VOICE_ONLY";}@Override public String getVoiceOnlyText(){return instruction[0];}};
        NativeWarnings.regular(null,report,true,false,instruction[0],null);Bundle first=new Bundle(last());
        instruction[0]="Person on road, keep left";
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));
        assertEquals("UPSERT",last().getString("operation"));assertEquals(instruction[0],last().getString("message"));
        assertEquals(first.getLong("announcement_index"),last().getLong("announcement_index"));
        assertTrue(last().getLong("revision")>first.getLong("revision"));assertNotEquals(first.getString("native_text_key"),last().getString("native_text_key"));
        assertEquals("und",last().getString("language_tag"));long revision=last().getLong("revision");
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));assertEquals(revision,last().getLong("revision"));
        assertEquals(1,events.stream().filter(value->"ANNOUNCE".equals(value.getString("operation"))).count());
    }
    @Test public void stateOnlyEarlyWarningPreservesInstructionAndUnknownLanguageWithoutSpeechAuthority(){
        EarlyWarningReport report=new EarlyWarningReport();
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));
        assertEquals("UPSERT",last().getString("operation"));assertEquals(0,last().getLong("announcement_index"));
        assertEquals(report.getFreeText(),last().getString("message"));
        assertEquals("native_text",last().getString("message_origin"));assertEquals("und",last().getString("language_tag"));
        assertEquals("AMBULANCE",last().getString("native_subtype"));
    }
    @Test public void serviceSubtypeAndAuditedNativeResourceFallbackSurvive() {
        NativeWarnings.regular(null,new ServiceVehicle(),true,false,null,null);
        assertEquals("TOW_SERVICE",last().getString("native_subtype"));
        assertEquals("Native title",last().getString("message"));
        assertEquals("native_resource",last().getString("message_origin"));
    }
    public static class EmptyReport extends BaseReport {
        @Override public String getShortDescription(Context c){return "";}
        @Override public String reportTitleText(Context c){return "";}
    }
    @Test public void missingTextIsExplicitUnsupportedStateRatherThanInventedHazardSpeech() {
        NativeWarnings.regular(null,new EmptyReport(),true,false,null,null);
        assertEquals("UPSERT",last().getString("operation"));
        assertEquals("MISSING_NATIVE_TEXT",last().getString("capture_diagnostic"));
        assertEquals("",last().getString("message"));
    }
    @Test public void verifiedCitsProjectionDoesNotDuplicateItsEarlierNativeAnnouncement() {
        NativeWarnings.early(null,"AMBULANCE",new EarlyWarningReport(),null,"Ambulance achter u",true,null);
        int count=events.size();
        NativeWarnings.suppressNextProjection();
        NativeWarnings.presentation(app,new EarlyWarning(),true);
        assertEquals(count,events.size());
        NativeWarnings.presentation(app,new EarlyWarning(),true);
        assertEquals(count+1,events.size());
        assertEquals("ANNOUNCE",last().getString("operation"));
    }
    @Test public void presentationRefreshAndRemovalHaveNoSpeechAuthority() {
        NativeWarnings.presentation(app,new EarlyWarning(),false);
        assertEquals("UPSERT",last().getString("operation"));
        assertEquals(0,last().getLong("announcement_index"));
        NativeWarnings.presentation(app,null,false);
        assertEquals("CLEAR",last().getString("operation"));
    }
    @Test public void citsProjectionSuppressionMatchesOnlyTheActualConvertedObject() {
        EarlyWarning converted=new EarlyWarning();NativeWarnings.suppressProjection(converted);
        NativeWarnings.presentation(app,converted,true);assertTrue(events.isEmpty());
        NativeWarnings.presentation(app,converted,true);assertTrue(events.isEmpty());
        NativeWarnings.presentation(app,new EarlyWarning(),true);assertEquals(1,events.size());
    }
    @Test public void presentationRefreshPreservesItsIdentityWithoutCreatingAnAnnouncement() {
        NativeWarnings.presentation(app,new EarlyWarning(),true);String id=last().getString("warning_id");long index=last().getLong("announcement_index");
        NativeWarnings.presentation(app,new EarlyWarning(),false);
        assertEquals(id,last().getString("warning_id"));assertEquals(index,last().getLong("announcement_index"));assertEquals("UPSERT",last().getString("operation"));
    }
    @Test public void exitAnnouncementSurvivesItsNativeRemovalSnapshot() {
        Incident report=new Incident();
        NativeWarnings.regular(null,report,true,false,"Start",null);
        NativeWarnings.regular(null,report,false,false,"End",null);
        int count=events.size();
        NativeWarnings.reports(Collections.emptyList());
        assertEquals(count,events.size());
        assertEquals("exit",last().getString("phase"));
        NativeWarnings.stopped();
        assertEquals("CLEAR",last().getString("operation"));
    }
    @Test public void aNativeRepeatAfterClearKeepsMonotonicAnnouncementIdentity() {
        Incident report=new Incident();NativeWarnings.regular(null,report,true,false,"Danger",null);
        long first=last().getLong("announcement_index");NativeWarnings.reports(Arrays.asList(new Alerted(report)));NativeWarnings.reports(Collections.emptyList());
        assertEquals("CLEAR",last().getString("operation"));NativeWarnings.regular(null,report,true,false,"Danger",null);
        assertEquals(first+1,last().getLong("announcement_index"));
    }
    @Test public void nativeCallbacksAfterStopCannotCreateFreshWarningsUntilEngineStarts() {
        Incident report=new Incident();NativeWarnings.regular(null,report,true,false,"Danger",null);NativeWarnings.stopped();int count=events.size();
        NativeWarnings.regular(null,report,true,false,"Late callback",null);assertEquals(count,events.size());
        NativeWarnings.started();NativeWarnings.regular(null,report,true,false,"Fresh decision",null);assertEquals(count+1,events.size());
    }
    public static class EarlyWarningNotification {
        public String getType(){return "AMBULANCE";}
        public String getName(){return "danger-7";}
        public String getCode(){return "emergency-7";}
        public String getFreetext(){return "Ambulance behind you";}
        public Location getLocation(){return null;}
    }
    public static class Info {String id="impact-7";Info(){}Info(String value){id=value;}public String getEventID(){return id;}}
    public static class ImpactAttenuator {public Info info=new Info();}
    @Test public void independentEarlyBusUpdatesAndNullRemovalShareNativeSpeechIdentity() {
        EarlyWarningNotification notification=new EarlyWarningNotification();NativeWarnings.notificationState(notification);
        String id=last().getString("warning_id");assertEquals("UPSERT",last().getString("operation"));assertEquals(0,last().getLong("announcement_index"));
        NativeWarnings.early(null,"AMBULANCE",new EarlyWarningReport(),null,"Ambulance behind you",false,null);
        assertEquals(id,last().getString("warning_id"));assertEquals("ANNOUNCE",last().getString("operation"));assertEquals("moving_emergency",last().getString("relevance"));
        NativeWarnings.notificationState(null);assertEquals(id,last().getString("warning_id"));assertEquals("CLEAR",last().getString("operation"));
        int count=events.size();NativeWarnings.early(null,"AMBULANCE",new EarlyWarningReport(),null,"Late old warning",false,null);assertEquals(count,events.size());
    }
    @Test public void impactProducerOwnsOneAnnouncementAndBothUiProjectionsStayDisplayOnly() {
        ImpactAttenuator event=new ImpactAttenuator();EarlyWarning projection=new EarlyWarning();NativeWarnings.impact(event,projection,app);
        String id=last().getString("warning_id");assertEquals("ANNOUNCE",last().getString("operation"));assertEquals("IMPACT_ATTENUATOR",last().getString("native_subtype"));int count=events.size();
        NativeWarnings.presentation(app,projection,true);NativeWarnings.presentation(app,projection,true);assertEquals(count,events.size());
        NativeWarnings.impactUpdate(event,new EarlyWarning(),app);assertEquals(id,last().getString("warning_id"));assertEquals("UPSERT",last().getString("operation"));
        NativeWarnings.impactRemoved(event);assertEquals(id,last().getString("warning_id"));assertEquals("CLEAR",last().getString("operation"));
    }
    public static class TrafficJam extends BaseReport {@Override public String getReportType(){return "TRAFFIC_JAM";}}
    @Test public void exitWithNoNativeWordsUsesAnAuditedExitTemplateRatherThanTheEntryDescription() {
        NativeWarnings.regular(null,new TrafficJam(),false,false,null,null);
        assertEquals("ANNOUNCE",last().getString("operation"));assertEquals("template",last().getString("message_origin"));assertEquals("fm_native_exit_v1",last().getString("template_id"));assertEquals("exit",last().getString("phase"));
        assertNotEquals("Native description",last().getString("message"));
    }
    public static class SpeedCam extends BaseReport {
        String type="DUMMY";
        @Override public String getReportType(){return "SPEED_CAM";}
        public String getSpeedCamType(){return type;}
    }
    public static class MatrixIncident extends Incident {String type;@Override public String getIncidentType(){return type;}}
    public static class MatrixService extends ServiceVehicle {String type;@Override public String getType(){return type;}}
    public static class MatrixNotification extends EarlyWarningNotification {String type;@Override public String getType(){return type;}}
    public static class MatrixReport extends BaseReport {String type;@Override public String getReportType(){return type;}}
    @Test public void all159FrozenNativeEnumMembersPreserveRawIdentityAndExactAcceptedText() {
        int total=0;
        for(String capability:nl.johninnl.navigation.alerts.FlitsmeisterWarningTypes.required()){
            if(!capability.startsWith("fm/"))continue;String[] parts=capability.split("/",3);String family=parts[1],member=parts[2],text="Native accepted "+member;
            if(family.equals("EarlyWarningTypeEnum")){MatrixNotification n=new MatrixNotification();n.type=member;NativeWarnings.early(null,member,null,n,text,false,null);}
            else{
                BaseReport model;
                if(family.equals("SpeedCamType")){SpeedCam cam=new SpeedCam();cam.type=member;model=cam;}
                else if(family.equals("IncidentType")){MatrixIncident incident=new MatrixIncident();incident.type=member;model=incident;}
                else if(family.equals("ServiceVehicle.Type")){MatrixService service=new MatrixService();service.type=member;model=service;}
                else{MatrixReport report=new MatrixReport();report.type=member;model=report;}
                NativeWarnings.regular(null,model,true,false,text,null);
            }
            assertEquals(capability,"ANNOUNCE",last().getString("operation"));assertEquals(capability,text,last().getString("message"));
            if(!family.equals("BaseReportType"))assertEquals(capability,member,last().getString("native_subtype"));
            else assertEquals(capability,member,last().getString("native_type"));
            total++;
        }
        assertEquals(159,total);
    }
    public static class IncomingEmergencyVehicle {public Info info;public List<FreeTextWhere> freeTextsWhere=Collections.emptyList();IncomingEmergencyVehicle(String id){info=new Info(id);}}
    public static class StationaryEmergencyVehicle extends IncomingEmergencyVehicle {StationaryEmergencyVehicle(String id){super(id);}}
    public static class AliasedEarlyReport extends EarlyWarningReport {
        String id;EarlyWarningNotification notification;
        AliasedEarlyReport(String id,EarlyWarningNotification n){this.id="gmp_"+id;notification=n;}
        @Override public String getId(){return id;}
        @Override public String getFreeText(){return notification.getFreetext();}
        public EarlyWarningNotification getNotification(){return notification;}
    }
    @Test public void citsNotificationsWithTheSameVehicleLabelKeepDistinctActualEventIdentities() {
        EarlyWarningNotification a=new EarlyWarningNotification(),b=new EarlyWarningNotification();
        AliasedEarlyReport reportA=new AliasedEarlyReport("a",a),reportB=new AliasedEarlyReport("b",b);
        NativeWarnings.citsSource(new IncomingEmergencyVehicle("a"));NativeWarnings.citsModel(reportA);NativeWarnings.early(null,"AMBULANCE",null,a,"First ambulance",true,null);
        String idA=last().getString("warning_id");assertEquals("early/AMBULANCE:gmp_a",idA);assertEquals("incoming",last().getString("native_source_motion"));assertEquals("unknown",last().getString("relationship"));
        NativeWarnings.citsSource(new IncomingEmergencyVehicle("b"));NativeWarnings.citsModel(reportB);NativeWarnings.early(null,"AMBULANCE",null,b,"Second ambulance",true,null);
        String idB=last().getString("warning_id");assertNotEquals(idA,idB);
        NativeWarnings.bindProjection(new EarlyWarning(),reportB);assertEquals(idB,last().getString("warning_id"));assertEquals("Second ambulance",last().getString("native_announced_text"));assertEquals(b.getFreetext(),last().getString("native_instruction"));assertEquals("UPSERT",last().getString("operation"));
        NativeWarnings.earlyRemoved(reportA);assertEquals(idA,last().getString("warning_id"));assertEquals("CLEAR",last().getString("operation"));
    }
    @Test public void nativeStationaryEmergencyIsNotInferredToBeApproaching() {
        EarlyWarningNotification n=new EarlyWarningNotification();AliasedEarlyReport report=new AliasedEarlyReport("stationary",n);
        NativeWarnings.citsSource(new StationaryEmergencyVehicle("stationary"));NativeWarnings.citsModel(report);NativeWarnings.early(null,"AMBULANCE",null,n,"Stationary ambulance",false,null);
        assertEquals(1,last().getInt("priority"));assertEquals("notice",last().getString("relevance"));assertEquals("unknown",last().getString("relationship"));
    }
    public static class RoadServiceAliasedReport extends AliasedEarlyReport {
        RoadServiceAliasedReport(String id,EarlyWarningNotification notification){super(id,notification);}
        @Override public String getEarlyWarningTypeEnum(){return "ROAD_SERVICE";}
    }
    @Test public void explicitStationaryRoadServiceStillUsesNativeStationaryPolicy(){
        EarlyWarningNotification notification=new EarlyWarningNotification(){@Override public String getType(){return "ROAD_SERVICE";}};
        RoadServiceAliasedReport report=new RoadServiceAliasedReport("stationary-road-service",notification);
        NativeWarnings.citsSource(new StationaryEmergencyVehicle("stationary-road-service"));NativeWarnings.citsModel(report);NativeWarnings.early(null,"ROAD_SERVICE",null,notification,"Stationary emergency service",false,null);
        assertEquals("emergency_vehicle",last().getString("category"));assertEquals(1,last().getInt("priority"));assertEquals("notice",last().getString("relevance"));assertEquals("stationary",last().getString("native_source_motion"));
    }
    public static class CitsSpeedAdvice extends CitsBaseReport {@Override public String getReportType(){return "CITS_SPEED_ADVICE";}public int getAdviceKph(){return 40;}}
    public static class AdviceWrapper {boolean added;AdviceWrapper(boolean value){added=value;}public CitsSpeedAdvice getSpeedAdvice(){return new CitsSpeedAdvice();}public boolean getAdded(){return added;}}
    @Test public void nativeTrafficLightAdviceIsStateAndRemovalWithoutSpeechAuthority() {
        NativeWarnings.vriState(new AdviceWrapper(true));String id=last().getString("warning_id");assertEquals("UPSERT",last().getString("operation"));assertEquals(40,last().getInt("native_advice_kmh"));assertEquals(0,last().getLong("announcement_index"));
        NativeWarnings.vriState(new AdviceWrapper(false));assertEquals(id,last().getString("warning_id"));assertEquals("CLEAR",last().getString("operation"));
    }
    public static class FixedCamera extends SpeedCam {@Override public Location getLocation(){Location l=new Location("native-model");l.setLatitude(52);l.setLongitude(5);return l;}}
    @Test public void fixedNativeTargetCoordinatesUseDecisionObservationWithoutPretendingToBeGpsMeasurement() {
        NativeWarnings.regular(null,new FixedCamera(),true,false,"Camera",null);
        assertEquals(52,last().getDouble("latitude"),0);assertEquals("native_decision",last().getString("position_clock_origin"));assertFalse(last().getBoolean("position_estimated"));assertEquals("point_ahead",last().getString("relevance"));
    }
    @Test public void nonWarningOrReservedModelsRemainDisplayStateAndNeverBecomeAnnouncements() {
        for(String type:new String[]{"BASEREPORT","LBA","CITS_PARKING","FM_OFFICE","PARKED_LOCATION","TOLLING","ENVIRONMENTAL_ZONE"}){
            MatrixReport report=new MatrixReport();report.type=type;NativeWarnings.reports(Arrays.asList(new Alerted(report)));
            assertEquals(type,"UPSERT",last().getString("operation"));assertEquals(type,"display_only",last().getString("category"));assertEquals(0,last().getLong("announcement_index"));
        }
    }
    public static class FreeTextWhere {public String freeText,language;FreeTextWhere(String text,String language){freeText=text;this.language=language;}}
    @Test public void explicitNativeCitsFreeTextLanguageSurvivesTheLossyReportConversion() {
        EarlyWarningNotification n=new EarlyWarningNotification(){@Override public String getFreetext(){return "Krankenwagen hinter Ihnen";}};
        AliasedEarlyReport report=new AliasedEarlyReport("german",n);IncomingEmergencyVehicle event=new IncomingEmergencyVehicle("german");event.freeTextsWhere=Arrays.asList(new FreeTextWhere(n.getFreetext(),"de"));
        NativeWarnings.citsSource(event);NativeWarnings.citsModel(report);NativeWarnings.early(null,"AMBULANCE",null,n,n.getFreetext(),true,null);
        assertEquals(n.getFreetext(),last().getString("message"));assertEquals("de",last().getString("language_tag"));
        NativeWarnings.bindProjection(new EarlyWarning(),report);assertEquals("de",last().getString("language_tag"));assertEquals("native_free_text_where",last().getString("language_origin"));
    }
    public static class CitsLaneClosed extends BaseReport {
        @Override public String getReportType(){return "CITS_LANE_CLOSED";}
        public String getLaneClosedType(){return "RIGHT_LANE";}
        public int getLaneIndex(){return 0;}
        public int getNumberOfLanesClosed(){return 2;}
        public String getLaneClosedTitle(Context context){return "Two lanes closed";}
    }
    @Test public void laneClosurePreservesNativeSubtypeLaneIndexAndClosedCount(){
        NativeWarnings.regular(null,new CitsLaneClosed(),true,false,null,null);
        assertEquals("RIGHT_LANE",last().getString("native_subtype"));assertEquals(0,last().getInt("lane_index"));assertEquals(2,last().getInt("number_of_lanes_closed"));assertEquals("Two lanes closed",last().getString("message"));
    }
    @Test public void citsGenericAnnouncementKeepsTheActualMatchingLanguageInstructionInOneAuthority(){
        EarlyWarningNotification n=new EarlyWarningNotification();AliasedEarlyReport report=new AliasedEarlyReport("instruction",n);IncomingEmergencyVehicle event=new IncomingEmergencyVehicle("instruction");
        event.freeTextsWhere=Arrays.asList(new FreeTextWhere(n.getFreetext(),"en"));NativeWarnings.citsSource(event);NativeWarnings.citsModel(report);
        NativeWarnings.early(null,"AMBULANCE",null,n,"Caution! Ambulance",true,null);
        assertEquals(1,events.size());assertEquals("ANNOUNCE",last().getString("operation"));assertEquals("Caution! Ambulance",last().getString("native_announced_text"));
        assertEquals(n.getFreetext(),last().getString("native_instruction"));assertEquals("en",last().getString("native_instruction_language_tag"));assertTrue(last().getString("message").contains(n.getFreetext()));assertEquals("en",last().getString("language_tag"));
        NativeWarnings.bindProjection(new EarlyWarning(),report);assertEquals("UPSERT",last().getString("operation"));assertTrue(last().getString("message").contains(n.getFreetext()));assertEquals("Caution! Ambulance",last().getString("native_announced_text"));
    }
    @Test public void citsInstructionDoesNotPretendAnEnglishLabelIsGerman(){
        EarlyWarningNotification n=new EarlyWarningNotification(){@Override public String getFreetext(){return "Krankenwagen hinter Ihnen";}};AliasedEarlyReport report=new AliasedEarlyReport("mixed",n);IncomingEmergencyVehicle event=new IncomingEmergencyVehicle("mixed");
        event.freeTextsWhere=Arrays.asList(new FreeTextWhere(n.getFreetext(),"de"));NativeWarnings.citsSource(event);NativeWarnings.citsModel(report);NativeWarnings.early(null,"AMBULANCE",null,n,"Caution! Ambulance",true,null);
        assertEquals("Caution! Ambulance",last().getString("native_announced_text"));assertEquals(n.getFreetext(),last().getString("message"));assertEquals("de",last().getString("language_tag"));assertEquals("unknown",last().getString("relationship"));
    }
    public static class MutableInstruction extends EarlyWarningNotification {String instruction;MutableInstruction(String text){instruction=text;}@Override public String getFreetext(){return instruction;}}
    @Test public void nativeCitsRevisionUpdatesTheInstructionWithoutIssuingAnotherAnnouncement(){
        MutableInstruction first=new MutableInstruction("Ambulance behind you");AliasedEarlyReport report=new AliasedEarlyReport("revision",first);IncomingEmergencyVehicle event=new IncomingEmergencyVehicle("revision");event.freeTextsWhere=Arrays.asList(new FreeTextWhere(first.getFreetext(),"en"));
        NativeWarnings.citsSource(event);NativeWarnings.citsModel(report);NativeWarnings.early(null,"AMBULANCE",null,first,"Caution! Ambulance",true,null);long index=last().getLong("announcement_index");
        MutableInstruction next=new MutableInstruction("Allow the ambulance to pass");AliasedEarlyReport revised=new AliasedEarlyReport("revision",next);event.freeTextsWhere=Arrays.asList(new FreeTextWhere(next.getFreetext(),"en"));NativeWarnings.citsSource(event);NativeWarnings.citsModel(revised);NativeWarnings.bindProjection(new EarlyWarning(),revised);
        assertEquals("UPSERT",last().getString("operation"));assertEquals(index,last().getLong("announcement_index"));assertTrue(last().getString("message").contains(next.getFreetext()));assertEquals("Caution! Ambulance",last().getString("native_announced_text"));
        assertEquals(1,events.stream().filter(value->"ANNOUNCE".equals(value.getString("operation"))).count());
    }
    public static class CitsWeather extends CitsBaseReport {
        enum Weather {FOG,ICE_ON_THE_ROAD}
        private Weather mWeatherType=Weather.ICE_ON_THE_ROAD;
        @Override public String getReportType(){return "CITS_WEATHER";}
        public String getTitle(Context c){return "Ice on the road";}public String getSubtitle(Context c){return "Watch your speed";}
    }
    @Test public void actualWeatherSubtypeAndHazardTitleAreNotReducedToACareSubtitle(){
        NativeWarnings.regular(null,new CitsWeather(),true,false,null,null);
        assertEquals("ICE_ON_THE_ROAD",last().getString("native_subtype"));assertEquals("weather",last().getString("category"));assertEquals("Ice on the road. Watch your speed",last().getString("message"));
    }
    @Test public void stateOnlyWeatherUsesHazardAndInstructionInsteadOfGenericUiDescription(){
        CitsWeather report=new CitsWeather();
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));
        assertEquals("UPSERT",last().getString("operation"));assertEquals(0,last().getLong("announcement_index"));
        assertEquals("Ice on the road. Watch your speed",last().getString("message"));
        assertEquals("native_resource",last().getString("message_origin"));
        assertEquals("ICE_ON_THE_ROAD",last().getString("native_subtype"));assertEquals("weather",last().getString("category"));
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));
        assertEquals(2,events.size());assertTrue(events.stream().allMatch(value->"UPSERT".equals(value.getString("operation"))));
    }
    @Test public void changedFormattedNativeInstructionRefreshesEvenWithoutRawFreeText(){
        String[] instruction={"Watch your speed"};CitsWeather report=new CitsWeather(){@Override public String getSubtitle(Context c){return instruction[0];}};
        NativeWarnings.reports(Collections.singletonList(new Alerted(report)));Bundle first=new Bundle(last());
        instruction[0]="Keep left";NativeWarnings.reports(Collections.singletonList(new Alerted(report)));
        assertEquals("Ice on the road. Keep left",last().getString("message"));assertEquals("UPSERT",last().getString("operation"));
        assertEquals(0,last().getLong("announcement_index"));assertTrue(last().getLong("revision")>first.getLong("revision"));
        assertNotEquals(first.getString("native_text_key"),last().getString("native_text_key"));
    }
    @Test public void overCapacityNativeSnapshotFaultsInsteadOfClearingAnUnseenAcceptedWarning() throws Exception {
        nl.johninnl.navigation.alerts.WarningEndpoint endpoint=nl.johninnl.navigation.alerts.WarningEndpointFixtures.empty();NativeWarnings.setEndpointForTest(endpoint);NativeWarnings.resetForTest(app,events::add);
        Incident accepted=new Incident();NativeWarnings.regular(null,accepted,true,false,"Native accepted warning",null);int count=events.size();List<Alerted> oversized=new ArrayList<>();for(int i=0;i<129;i++)oversized.add(new Alerted(new BaseReport()));
        NativeWarnings.reports(oversized);assertEquals("Partial snapshot must not create false clears",count,events.size());
        java.lang.reflect.Field fault=endpoint.getClass().getDeclaredField("captureFault");fault.setAccessible(true);assertTrue("Native capacity loss must be explicit",fault.getBoolean(endpoint));
    }
    @Test public void provedProducerAdvertisesItsCompleteCoverageAndPinnedRequiredInventory() throws Exception {
        android.content.pm.PackageInfo info=app.getPackageManager().getPackageInfo(app.getPackageName(),0);info.versionName="14.17";info.versionCode=1287;
        org.robolectric.Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        nl.johninnl.navigation.alerts.WarningEndpoint endpoint=NativeWarnings.init(app);
        java.lang.reflect.Field field=endpoint.getClass().getDeclaredField("profile");field.setAccessible(true);nl.johninnl.navigation.alerts.WarningCapabilities profile=(nl.johninnl.navigation.alerts.WarningCapabilities)field.get(endpoint);
        assertTrue("Proved native capture must not remain permanently disabled",profile.complete);
        assertEquals(nl.johninnl.navigation.alerts.FlitsmeisterWarningTypes.MANIFEST_DIGEST,profile.manifestDigest);
        assertEquals(nl.johninnl.navigation.alerts.FlitsmeisterWarningTypes.required(),profile.required);assertEquals(163,profile.required.size());
    }
}
