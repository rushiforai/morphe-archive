package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.graphics.*;
import android.os.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import org.robolectric.shadows.ShadowCanvas;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
@GraphicsMode(GraphicsMode.Mode.LEGACY)
public class CarWarningPillsTest {
    private WarningEvent event(String type,Integer distance){
        long now=SystemClock.elapsedRealtime();Bundle b=new Bundle();
        b.putInt("protocol_version",1);b.putString("provider_session","00000000-0000-0000-0000-000000000001");b.putLong("sequence",1);
        b.putString("operation","ANNOUNCE");b.putString("warning_id","native-warning");b.putLong("revision",1);b.putLong("announcement_index",1);
        b.putString("phase","notice");b.putString("native_type",type);b.putString("category","speed_control");b.putInt("priority",1);
        b.putString("message","Long native warning text must stay available for speech, not fill the pill");b.putString("language_tag","en-GB");
        b.putString("message_origin","native_text");b.putString("relevance","point_ahead");b.putString("relationship","unknown");b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);
        b.putLong("announce_until_elapsed_ms",now+5000);b.putLong("state_until_elapsed_ms",now+30000);
        if(distance!=null){b.putInt("distance_m",distance);b.putLong("distance_observed_elapsed_ms",now);b.putBoolean("distance_estimated",false);}
        b.putInt("trigger_m",1000);b.putLong("trigger_observed_elapsed_ms",now);b.putBoolean("trigger_estimated",false);
        return WarningCodec.decode(b,now);
    }
    private ShadowCanvas draw(boolean active,Double average,Double progress,List<WarningEvent> events){
        Canvas canvas=new Canvas(Bitmap.createBitmap(400,300,Bitmap.Config.ARGB_8888));
        CarWarningPills.draw(RuntimeEnvironment.getApplication(),canvas,new RectF(0,0,400,300),1,false,false,
                active,average,100d,progress,1600,true,events);
        return Shadows.shadowOf(canvas);
    }
    private List<String> text(ShadowCanvas canvas){List<String> out=new ArrayList<>();for(int i=0;i<canvas.getTextHistoryCount();i++)out.add(canvas.getDrawnTextEvent(i).text);return out;}
    @Test public void approachShowsOnlyDistanceAndKeepsTheLineUnderTheReadout(){
        WarningEvent event=event("AVG_SPEED_CHECK",300);ShadowCanvas canvas=draw(false,null,null,Collections.singletonList(event));
        assertEquals(Arrays.asList("300","m"),text(canvas));
        assertTrue("Native speech text is preserved",event.message.contains("Long native warning"));
        assertEquals(3,canvas.getRoundRectPaintHistoryCount());
        ShadowCanvas.RoundRectPaintHistoryEvent track=canvas.getDrawnRoundRect(1),fill=canvas.getDrawnRoundRect(2);
        assertTrue("Bar starts to the right of the icon slot",track.left>55);
        assertTrue("Thin bar",track.bottom-track.top<=4);
        assertEquals(.7f,(fill.right-fill.left)/(track.right-track.left),.001f);
        assertEquals(android.graphics.Typeface.NORMAL,canvas.getDrawnTextEvent(0).paint.getTypeface().getStyle());
    }
    @Test public void unknownOrStaleDistanceNeverFallsBackToWarningProseOrZero(){
        assertEquals(Collections.singletonList("—"),text(draw(false,null,null,Collections.singletonList(event("SPEED_CAM",null)))));
        WarningEvent original=event("SPEED_CAM",300);SystemClock.sleep(6001);
        assertEquals(Collections.singletonList("—"),text(draw(false,null,null,Collections.singletonList(original))));
    }
    @Test public void activeZoneUsesOnlyAverageAndItsOwnSectionBar(){
        ShadowCanvas approach=draw(false,null,null,Collections.singletonList(event("AVG_SPEED_CHECK",300)));
        ShadowCanvas entry=draw(true,null,0d,Collections.emptyList());
        assertEquals(Arrays.asList("—","km/h"),text(entry));
        assertEquals(0,entry.getDrawnRoundRect(2).right-entry.getDrawnRoundRect(2).left,.001);
        ShadowCanvas active=draw(true,97d,40d,Collections.emptyList());assertEquals(Arrays.asList("97","km/h"),text(active));
        ShadowCanvas.RoundRectPaintHistoryEvent track=active.getDrawnRoundRect(1),fill=active.getDrawnRoundRect(2);
        assertEquals(.4f,(fill.right-fill.left)/(track.right-track.left),.001f);
        assertEquals(approach.getDrawnRoundRect(0).rect,active.getDrawnRoundRect(0).rect);
        assertEquals("Unknown section progress must not borrow the approach fill",2,draw(true,97d,null,Collections.emptyList()).getRoundRectPaintHistoryCount());
    }
    @Test public void visualApproachSpanDoesNotReplaceOrBorrowTheAudioTrigger(){
        long now=SystemClock.elapsedRealtime();Bundle b=WarningCodec.encode(event("AVG_SPEED_CHECK",300));
        b.putInt("trigger_m",500);b.putInt("range_m",1000);b.putLong("range_observed_elapsed_ms",now);b.putBoolean("range_estimated",false);b.putString("range_origin","native_ui_max_distance");
        WarningEvent nativeEvent=WarningCodec.decode(b,now);assertEquals(.7f,CarWarningPills.approachProgress(nativeEvent,now),.001f);assertEquals(Integer.valueOf(500),nativeEvent.triggerMeters);
    }
    @Test public void speedPillIsTheStacksBottomRowWithTheLimitSignAndCurrentSpeed(){
        Canvas canvas=new Canvas(Bitmap.createBitmap(400,300,Bitmap.Config.ARGB_8888));
        CarWarningPills.draw(RuntimeEnvironment.getApplication(),canvas,new RectF(0,0,400,300),1,true,false,
            false,null,50d,null,0,false,Collections.singletonList(event("SPEED_TRAP",300)),null,null,false,true,57d);
        List<String> drawn=text(Shadows.shadowOf(canvas));
        assertEquals("Warning readout first, then sign and speed",Arrays.asList("300","m","50","57","km/h"),drawn);
        assertEquals(2*CarWarningPills.HEIGHT+CarWarningPills.GAP,CarWarningPills.height(false,1,true),0);
        assertEquals(CarWarningPills.HEIGHT,CarWarningPills.height(false,0,true),0);
    }
    @Test public void speedReadoutsNeverInventZeroOrALimit(){
        assertEquals("— km/h",CarWarningPills.speedLabel(null,false));
        assertEquals("— mph",CarWarningPills.speedLabel(Double.NaN,true));
        assertEquals("0 km/h",CarWarningPills.speedLabel(0d,false));
        assertEquals("62 mph",CarWarningPills.speedLabel(100d,true));
        assertEquals("—",CarWarningPills.limitLabel(null,false));
        assertEquals("—",CarWarningPills.limitLabel(0d,false));
        assertEquals("81",CarWarningPills.limitLabel(130d,true));
        assertFalse(CarWarningPills.overspeed(55d,50d));
        assertTrue(CarWarningPills.overspeed(55.1d,50d));
        assertFalse("Unknown limit is never speeding",CarWarningPills.overspeed(200d,null));
    }
    @Test public void withoutAProviderSpanTheLineRunsFromWhereThePillFirstAppeared(){
        CarWarningPills.resetApproachForTest();
        Bundle b=WarningCodec.encode(event("SPEED_TRAP",1000));b.remove("trigger_m");b.remove("trigger_observed_elapsed_ms");b.remove("trigger_estimated");
        WarningEvent trap=WarningCodec.decode(b,SystemClock.elapsedRealtime());
        assertEquals("First drawn at 1000 m: empty",0f,CarWarningPills.approach(trap,1000),0.001f);
        assertEquals("300 m left of 1000 m: 70%",0.7f,CarWarningPills.approach(trap,300),0.001f);
        assertEquals("A farther report becomes the new start",0f,CarWarningPills.approach(trap,1200),0.001f);
        assertNull(CarWarningPills.approach(trap,null));
        Canvas canvas=new Canvas(Bitmap.createBitmap(400,300,Bitmap.Config.ARGB_8888));
        CarWarningPills.draw(RuntimeEnvironment.getApplication(),canvas,new RectF(0,0,400,300),1,false,false,false,null,100d,null,0,false,Collections.singletonList(trap));
        assertEquals("Card, track and fill",3,Shadows.shadowOf(canvas).getRoundRectPaintHistoryCount());
    }
    @Test public void mockupPackSize(){
        assertEquals(218,CarWarningPills.WIDTH,0);assertEquals(70,CarWarningPills.HEIGHT,0.001);
    }
    @Test public void postedLimitIsASpeedValueWithoutADistanceBar(){
        Bundle b=WarningCodec.encode(event("MAXIMUM_SPEED",300));b.putString("category","maximum_speed");b.putInt("road_speed_limit_kmh",100);
        ShadowCanvas canvas=draw(false,null,null,Collections.singletonList(WarningCodec.decode(b,SystemClock.elapsedRealtime())));
        assertEquals(Arrays.asList("100","km/h"),text(canvas));assertEquals(1,canvas.getRoundRectPaintHistoryCount());
    }
    @Test public void everyEventFamilyUsesTheSameOuterPillAndNumericReadout(){
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
            {"traffic_light","CITS_SPEED_ADVICE","","speed_advice"}};
        RectF expected=null;
        for(String[] row:cases){
            Bundle b=WarningCodec.encode(event(row[1],300));b.putString("native_subtype",row[2]);b.putString("category",row[3]);
            if(row[0].equals("border_nl"))b.putString("country_code","NL");
            if(row[0].equals("speed_limit_130"))b.putInt("road_speed_limit_kmh",130);
            if(row[0].equals("traffic_light")){b.putString("capture_path","vri_state");b.putBoolean("native_is_traffic_light",true);}
            WarningEvent nativeEvent=WarningCodec.decode(b,SystemClock.elapsedRealtime());assertEquals(row[0],WarningIcons.key(nativeEvent));
            ShadowCanvas canvas=draw(false,null,null,Collections.singletonList(nativeEvent));
            assertEquals(row[0].equals("speed_limit_130")?Arrays.asList("130","km/h"):row[0].equals("maximum_speed_unknown")?Collections.singletonList("—"):Arrays.asList("300","m"),text(canvas));
            RectF actual=canvas.getDrawnRoundRect(0).rect;if(expected==null)expected=new RectF(actual);else assertEquals(expected,actual);
        }
    }
}
