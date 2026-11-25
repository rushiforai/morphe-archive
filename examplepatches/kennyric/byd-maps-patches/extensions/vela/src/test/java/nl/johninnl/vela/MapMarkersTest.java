package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.app.Application;
import android.content.Context;
import android.graphics.*;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.util.*;
import nl.johninnl.navigation.alerts.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Vela phone layer and car frame markers, fed from the same selection as the pills. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class MapMarkersTest {
    Application app;WarningView view;long sequence;
    public static class Renderer {
        public boolean I=false;public int snapshots;public Double q=0d,r=100d;public Paint m0=new Paint(Paint.ANTI_ALIAS_FLAG);
        public void s(){snapshots++;}public Rect u(){return new Rect(25,20,295,210);}public boolean n(){return false;}public boolean l(){return false;}
    }
    /** Stand-in for the native MapSnapshot: one fixed raw pixel for every coordinate. */
    public static class Snapshot {
        public Bitmap bitmap=Bitmap.createBitmap(160,120,Bitmap.Config.ARGB_8888);public final List<org.maplibre.android.geometry.LatLng> asked=new ArrayList<>();
        public Bitmap getBitmap(){return bitmap;}
        public PointF pixelForLatLng(org.maplibre.android.geometry.LatLng point){asked.add(point);return new PointF(30,25);}
    }
    static final class Recording implements MapMarkers.Backend {
        boolean loaded=true;final List<Object> installs=new ArrayList<>();final List<String> images=new ArrayList<>();final List<List<String>> published=new ArrayList<>();
        public boolean loaded(Object style){return loaded;}
        public Object install(Object style){installs.add(style);return "source:"+installs.size();}
        public void image(Object style,String name,Bitmap image){assertEquals(Math.round(MapMarkers.ICON_DP*RuntimeEnvironment.getApplication().getResources().getDisplayMetrics().density),image.getWidth());images.add(name);}
        public void publish(Object source,List<AlertMarkers.Marker> markers){List<String> ids=new ArrayList<>();for(AlertMarkers.Marker m:markers)ids.add(m.warningId+"@"+m.latitude+","+m.longitude);published.add(ids);}
    }
    @Before public void setup()throws Exception{
        Field reset=CarUi.class.getDeclaredField("RENDERERS");reset.setAccessible(true);((Map<?,?>)reset.get(null)).clear();reset=CarUi.class.getDeclaredField("lastWarningFrameKey");reset.setAccessible(true);reset.set(null,"");
        app=RuntimeEnvironment.getApplication();app.getSharedPreferences("vela_settings",0).edit().clear().commit();TelemetryRuntime.resetForTest();TelemetryRuntime.init(app,()->{});
        TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);TelemetryRuntime.setCarEnabled(true);
        Field field=TelemetryRuntime.class.getDeclaredField("nativeWarnings");field.setAccessible(true);view=(WarningView)field.get(null);
        field=TelemetryRuntime.class.getDeclaredField("warningPreferences");field.setAccessible(true);WarningPreferences choices=(WarningPreferences)field.get(null);choices.categories(127);choices.confirm();
        view.events(Collections.singletonList(camera("fm/SpeedCam:1",52.1,5.1,true)));
    }
    @After public void cleanup(){CarUi.markerPainter=(canvas,placement)->WarningIcons.draw(TelemetryRuntime.app(),canvas,placement.marker.event,placement.slot);TelemetryRuntime.resetForTest();}

    /** A camera ahead with a fresh native distance, so the pill selection shows it. */
    WarningEvent camera(String id,double latitude,double longitude,boolean fixed){
        long now=SystemClock.elapsedRealtime();Map<String,Object> extra=new HashMap<>();
        extra.put("sequence",++sequence);extra.put("distance_m",300);extra.put("distance_observed_elapsed_ms",now);extra.put("distance_estimated",false);
        return AlertMarkersTest.point(id,now,latitude,longitude,now,fixed,"point_ahead",extra);
    }

    @Test public void markersFollowThePillSelectionAndTheSetting(){
        long now=SystemClock.elapsedRealtime();
        assertTrue("On by default",TelemetryRuntime.markersEnabled());
        assertEquals(1,TelemetryRuntime.markers(now).size());
        TelemetryRuntime.setMarkersEnabled(false);
        assertTrue(TelemetryRuntime.markers(now).isEmpty());
        TelemetryRuntime.setMarkersEnabled(true);
        WarningEvent shown=view.current(now);android.os.Bundle b=WarningCodec.encode(shown);
        b.putString("operation","CLEAR");b.putLong("sequence",++sequence);b.putLong("revision",shown.revision+1);
        view.events(Collections.singletonList(WarningCodec.decode(b,now)));
        assertTrue("CLEAR removes the marker with its pill",TelemetryRuntime.markers(now).isEmpty());
        view.events(Collections.singletonList(camera("fm/SpeedCam:2",52.2,5.2,true)));
        TelemetryRuntime.select("");
        assertTrue("Vela's own data has no provider markers",TelemetryRuntime.markers(now).isEmpty());
    }

    @Test public void carMarkersUseTheFrameSnapshotScaleAndVisibleRect()throws Exception{
        Renderer renderer=new Renderer();Snapshot snapshot=new Snapshot();
        Rect visible=new Rect(25,20,240,210);
        List<AlertMarkers.Placement> placed=CarUi.markerPlacements(renderer,320,240,visible,snapshot,2f,2f);
        assertEquals(1,placed.size());
        assertEquals("Projected through the frame's own snapshot",52.1,snapshot.asked.get(0).latitude,0);assertEquals(5.1,snapshot.asked.get(0).longitude,0);
        assertEquals(60,placed.get(0).slot.centerX(),0.001);assertEquals(50,placed.get(0).slot.centerY(),0.001);
        assertTrue("Map-action lane and host occlusions stay clear",CarUi.markerPlacements(renderer,320,240,new Rect(100,20,240,210),snapshot,2f,2f).isEmpty());
        snapshot.bitmap=null;
        assertTrue("No map bitmap, no markers",CarUi.markerPlacements(renderer,320,240,visible,snapshot,2f,2f).isEmpty());
    }

    @Test public void carMarkersDrawClippedAndBeneathThePills(){
        Renderer renderer=new Renderer();Snapshot snapshot=new Snapshot();List<AlertMarkers.Placement> painted=new ArrayList<>();
        CarUi.markerPainter=(canvas,placement)->{painted.add(placement);canvas.drawColor(Color.BLUE);};
        Bitmap image=Bitmap.createBitmap(320,240,Bitmap.Config.ARGB_8888);
        CarUi.warningFrame(renderer,new Canvas(image),snapshot,2f,2f);
        assertEquals(1,painted.size());
        assertEquals("Marker paint is clipped to the visible map",Color.BLUE,image.getPixel(40,30));
        for(int y=0;y<image.getHeight();y++)for(int x=0;x<image.getWidth();x++)if(x<25||x>=240||y<20||y>=210)assertEquals("Outside the visible map at "+x+","+y,0,image.getPixel(x,y));
        assertNotEquals("The pill is drawn over the marker layer",Color.BLUE,image.getPixel(132,190));
        painted.clear();TelemetryRuntime.setCarEnabled(false);
        CarUi.warningFrame(renderer,new Canvas(Bitmap.createBitmap(320,240,Bitmap.Config.ARGB_8888)),snapshot,2f,2f);
        assertTrue("Car markers follow Show details on Android Auto",painted.isEmpty());
        TelemetryRuntime.setCarEnabled(true);TelemetryRuntime.setMarkersEnabled(false);
        CarUi.warningFrame(renderer,new Canvas(Bitmap.createBitmap(320,240,Bitmap.Config.ARGB_8888)),snapshot,2f,2f);
        assertTrue(painted.isEmpty());
    }

    @Test public void markerExpiryRequestsANewCarSnapshotWithoutAnotherGpsFrame(){
        Renderer renderer=new Renderer();CarUi.warningFrame(renderer,new Canvas(Bitmap.createBitmap(320,240,Bitmap.Config.ARGB_8888)));
        CarUi.warningChanged();int before=renderer.snapshots;
        TelemetryRuntime.setMarkersEnabled(false);CarUi.warningChanged();
        assertEquals("The marker set is part of the frame presentation",before+1,renderer.snapshots);
    }

    @Test public void phoneLayerPublishesOnChangeAndReinstallsOnANewStyle(){
        Recording backend=new Recording();
        MapMarkers.backendForTest(backend,(Context context,Canvas canvas,AlertMarkers.Marker marker,RectF slot)->{canvas.drawColor(Color.RED);return true;});
        Object first=new Object();
        MapMarkers.style(first);
        assertEquals(Collections.singletonList(first),backend.installs);
        assertEquals(Collections.singletonList("johninnl-warning-speed_camera"),backend.images);
        assertEquals(Collections.singletonList(Collections.singletonList("fm/SpeedCam:1@52.1,5.1")),backend.published);
        MapMarkers.refresh();
        assertEquals("Unchanged markers are not republished",1,backend.published.size());
        view.events(Collections.singletonList(camera("fm/SpeedCam:3",52.3,5.3,true)));
        MapMarkers.refresh();
        assertEquals(2,backend.published.size());assertEquals(2,backend.published.get(1).size());
        assertEquals("One image per icon key per style",1,backend.images.size());
        TelemetryRuntime.setMarkersEnabled(false);MapMarkers.refresh();
        assertEquals(Collections.emptyList(),backend.published.get(2));
        backend.loaded=false;TelemetryRuntime.setMarkersEnabled(true);MapMarkers.refresh();
        assertEquals("A replaced style is dropped, never written",3,backend.published.size());
        backend.loaded=true;Object second=new Object();MapMarkers.style(second);
        assertEquals(second,backend.installs.get(1));assertEquals(2,backend.images.size());assertEquals(4,backend.published.size());
    }
}
