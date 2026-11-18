package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Bundle;
import java.util.*;
import nl.johninnl.navigation.alerts.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Contract v1 Geometry rules for display-only map markers. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class AlertMarkersTest {
    static final String SESSION=UUID.randomUUID().toString();
    static final long T=100_000;

    /** A point warning observed at {@code at}; its position observed at {@code positionAt}. */
    static WarningEvent point(String id,long at,Double latitude,Double longitude,Long positionAt,boolean fixed,String relevance,Map<String,Object> extra){
        Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session",SESSION);b.putLong("sequence",1);
        b.putString("operation","UPSERT");b.putString("warning_id",id);b.putLong("revision",1);b.putLong("announcement_index",0);
        b.putString("phase","approach");b.putString("native_type","SPEED_CAM");b.putString("native_subtype","");b.putString("category","speed_camera");
        b.putInt("priority",1);b.putString("message","Speed camera");b.putString("language_tag","en-US");b.putString("message_origin","native_text");
        b.putString("relevance",relevance);b.putString("relationship","unknown");b.putLong("observed_elapsed_ms",at);b.putLong("issued_elapsed_ms",at);
        b.putLong("state_until_elapsed_ms",at+30000);
        if(latitude!=null){b.putDouble("latitude",latitude);b.putDouble("longitude",longitude);b.putLong("position_observed_elapsed_ms",positionAt);b.putBoolean("position_estimated",false);}
        if(fixed)b.putBoolean("native_point_target",true);
        for(Map.Entry<String,Object> e:extra.entrySet()){Object v=e.getValue();if(v instanceof String)b.putString(e.getKey(),(String)v);else if(v instanceof Boolean)b.putBoolean(e.getKey(),(Boolean)v);else if(v instanceof Integer)b.putInt(e.getKey(),(Integer)v);else if(v instanceof Long)b.putLong(e.getKey(),(Long)v);}
        return WarningCodec.decode(b,at);
    }
    static WarningEvent point(String id,boolean fixed){return point(id,T,52.1,5.1,T,fixed,"point_ahead",Collections.emptyMap());}
    static List<AlertMarkers.Marker> select(long now,WarningEvent... events){return AlertMarkers.select(Arrays.asList(events),now,e->WarningPassage.Relevance.RELEVANT);}
    @Test public void nativeTileMapFeatureIsNotRetiredByWarningRouteOrPassageDecisions(){
        Map<String,Object> extra=new HashMap<>();extra.put("category","display_only");extra.put("native_type","CAMERA");
        extra.put("native_namespace","waze.insights.native_tile");extra.put("native_tile_kind",72);extra.put("position_clock_origin","native_tile");
        WarningEvent camera=point("waze/tile/7/11/72",T,52.1,5.1,T,true,"point_ahead",extra);
        for(WarningPassage.Relevance relevance:new WarningPassage.Relevance[]{WarningPassage.Relevance.PASSED,WarningPassage.Relevance.OFF_ROUTE})
            assertEquals(1,AlertMarkers.select(Collections.singletonList(camera),T,e->relevance).size());
        assertTrue(AlertMarkers.select(Collections.singletonList(camera),T+30000,e->WarningPassage.Relevance.RELEVANT).isEmpty());
        extra.put("native_namespace","other");
        WarningEvent ordinary=point("ordinary",T,52.1,5.1,T,true,"point_ahead",extra);
        assertTrue(AlertMarkers.select(Collections.singletonList(ordinary),T,e->WarningPassage.Relevance.OFF_ROUTE).isEmpty());
    }

    @Test public void nativeRangeUsesItsCorrelatedApproachWithoutForgingTheAlertsPhase(){
        Map<String,Object> extra=new HashMap<>();extra.put("native_type","CAMERA");extra.put("phase","notice");
        extra.put("zone_point","start");extra.put("position_clock_origin","native_route_line");
        extra.put("native_segment_correlated",true);extra.put("native_segment_type","AVERAGE_SPEED_CAMERA");extra.put("native_segment_phase","APPROACHING");
        WarningEvent e=point("waze/alert",T,52.1,5.1,T,true,"zone",extra);
        assertEquals(1,select(T,e).size());assertEquals(WarningEvent.Phase.NOTICE,e.phase);
        extra.put("native_zone_state","InZone");assertTrue(select(T,point("waze/alert",T,52.1,5.1,T,true,"zone",extra)).isEmpty());
    }

    @Test public void fixedNativePointsPersistUntilStateEndsButOtherPointsNeedAFreshPosition(){
        WarningEvent fixed=point("fm/cam",true),waze=point("waze/cam",false);
        assertEquals(2,select(T+5000,fixed,waze).size());
        List<AlertMarkers.Marker> later=select(T+5001,fixed,waze);
        assertEquals("A non-fixed point is withheld once its position is older than 5 s",1,later.size());
        assertEquals("fm/cam",later.get(0).warningId);
        assertEquals("Still shown late in the state window",1,select(T+29_999,fixed).size());
        assertTrue("Gone at state_until",select(T+30_000,fixed).isEmpty());
    }

    @Test public void onlyANativeCoordinatePairIsATarget(){
        assertTrue("No coordinates",select(T,point("none",T,null,null,null,true,"point_ahead",Collections.emptyMap())).isEmpty());
        assertTrue("A default (0,0) is never drawn",select(T,point("zero",T,0d,0d,T,true,"point_ahead",Collections.emptyMap())).isEmpty());
        AlertMarkers.Marker marker=select(T,point("real",T,51.485487,5.416153,T,true,"point_ahead",Collections.emptyMap())).get(0);
        assertEquals(51.485487,marker.latitude,0);assertEquals(5.416153,marker.longitude,0);
        assertEquals("Shared icon vocabulary","speed_camera",marker.icon);assertEquals("johninnl-warning-speed_camera",marker.image());
    }

    @Test public void passedOffRouteZoneAndNonspatialWarningsHaveNoMarker(){
        WarningEvent cam=point("cam",true);
        for(WarningPassage.Relevance gone:new WarningPassage.Relevance[]{WarningPassage.Relevance.PASSED,WarningPassage.Relevance.OFF_ROUTE})
            assertTrue(gone.name(),AlertMarkers.select(Collections.singletonList(cam),T,e->gone).isEmpty());
        assertEquals("Unverified context keeps the pill selection's decision",1,
            AlertMarkers.select(Collections.singletonList(cam),T,e->WarningPassage.Relevance.CONTEXT_UNVERIFIED).size());
        Map<String,Object> inside=new HashMap<>();inside.put("native_zone_state","InZone");
        assertTrue("An entry point is not the end of a segment being traversed",select(T,point("zone",T,52.1,5.1,T,true,"point_ahead",inside)).isEmpty());
        assertTrue(select(T,point("notice",T,52.1,5.1,T,true,"notice",Collections.emptyMap())).isEmpty());
        assertTrue(select(T,point("zone2",T,52.1,5.1,T,true,"zone",Collections.emptyMap())).isEmpty());
    }

    /** An average-speed control with its provider's own fixed point: start before entry, end inside. */
    static WarningEvent zone(String point,boolean inside,double latitude,double longitude){
        Map<String,Object> extra=new HashMap<>();extra.put("native_type","AVG_SPEED_CHECK");extra.put("category","speed_control");
        extra.put("phase",inside?"enter":"approach");if(point!=null)extra.put("zone_point",point);
        extra.put("distance_m",inside?14000:800);extra.put("distance_observed_elapsed_ms",T);extra.put("distance_estimated",false);
        extra.put("native_distance_kind",inside?"remaining_in_segment":"to_segment");
        return point("AvgSpeedCheck:a2",T,latitude,longitude,T,true,"zone",extra);
    }

    @Test public void averageSpeedControlIsMarkedAtItsStartBeforeEntryAndAtItsEndInside(){
        AlertMarkers.Marker start=select(T,zone("start",false,52.3017,4.9630)).get(0);
        assertEquals("average_speed",start.icon);assertEquals("johninnl-warning-average_speed",start.image());
        assertEquals(52.3017,start.latitude,0);assertEquals(4.9630,start.longitude,0);
        AlertMarkers.Marker end=select(T,zone("end",true,52.1213,5.0228)).get(0);
        assertEquals(52.1213,end.latitude,0);assertEquals(5.0228,end.longitude,0);
        assertNotEquals("the marker moves from start to end",AlertMarkers.signature(Collections.singletonList(start)),AlertMarkers.signature(Collections.singletonList(end)));
        assertEquals("a fixed native point, kept until the state ends",1,select(T+29_999,zone("end",true,52.1213,5.0228)).size());
        assertTrue(select(T+30_000,zone("end",true,52.1213,5.0228)).isEmpty());
        assertTrue("an entry point while inside",select(T,zone("start",true,52.3017,4.9630)).isEmpty());
        assertTrue("an end point before entry",select(T,zone("end",false,52.1213,5.0228)).isEmpty());
        assertTrue("unmarked zone coordinates",select(T,zone(null,false,52.3017,4.9630)).isEmpty());
        assertTrue("never a default (0,0)",select(T,zone("start",false,0,0)).isEmpty());
    }

    @Test public void respondersNeverKeepAStalePositionEvenWhenMarkedFixed(){
        WarningEvent responder=point("early/AMBULANCE",T,52.1,5.1,T-1000,true,"moving_emergency",Collections.emptyMap());
        assertEquals(1,select(T+4000,responder).size());
        assertTrue(select(T+4001,responder).isEmpty());
    }

    @Test public void selectionIsReadOnly(){
        WarningEvent cam=point("cam",false);Map<String,Object> before=new HashMap<>(cam.fields());
        select(T+1000,cam);select(T+9000,cam);
        assertEquals(before,cam.fields());assertEquals(T,(long)cam.positionObservedAt);assertEquals(T+30000,cam.stateUntil);
    }

    @Test public void placementScalesSnapshotPixelsAndWithholdsOffscreenPoints()throws Exception{
        List<AlertMarkers.Marker> markers=select(T,point("a",T,10d,20d,T,true,"point_ahead",Collections.emptyMap()),
            point("b",T,11d,21d,T,true,"point_ahead",Collections.emptyMap()),point("c",T,12d,22d,T,true,"point_ahead",Collections.emptyMap()));
        Map<Double,PointF> raw=new HashMap<>();raw.put(10d,new PointF(50,40));raw.put(11d,new PointF(300,40));raw.put(12d,null);
        List<AlertMarkers.Placement> placed=AlertMarkers.place(markers,(lat,lon)->raw.get(lat),2f,1.5f,new Rect(0,0,400,300),20);
        assertEquals("Outside the visible rect or unprojectable",1,placed.size());
        assertEquals("a",placed.get(0).marker.warningId);
        assertEquals(100,placed.get(0).slot.centerX(),0.001);assertEquals(60,placed.get(0).slot.centerY(),0.001);
        assertEquals(20,placed.get(0).slot.width(),0.001);
        assertTrue(AlertMarkers.place(markers,(lat,lon)->raw.get(lat),2f,1.5f,new Rect(),20).isEmpty());
        assertTrue(AlertMarkers.place(markers,(lat,lon)->raw.get(lat),Float.NaN,1f,new Rect(0,0,400,300),20).isEmpty());
    }

    @Test public void signatureTracksIdentityIconAndPositionOnly(){
        WarningEvent a=point("a",true);
        assertEquals(AlertMarkers.signature(select(T,a)),AlertMarkers.signature(select(T+1000,a)));
        assertNotEquals(AlertMarkers.signature(select(T,a)),AlertMarkers.signature(select(T,point("a",T,52.2,5.1,T,true,"point_ahead",Collections.emptyMap()))));
        assertEquals("",AlertMarkers.signature(Collections.emptyList()));
    }
}
