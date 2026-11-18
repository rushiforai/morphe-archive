package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.app.Application;
import android.graphics.*;
import android.os.*;
import java.lang.reflect.Field;
import java.util.*;
import nl.johninnl.navigation.alerts.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CarWarningFrameTest {
    Application app;WarningView view;
    public static class Renderer {
        public boolean I=false,drive=false;public int snapshots;public Double q=0d,r=100d;public Paint m0=new Paint(Paint.ANTI_ALIAS_FLAG);
        public void s(){snapshots++;}public Rect u(){return new Rect(25,20,295,210);}public boolean n(){return drive;}public boolean l(){return false;}
    }
    @Before public void setup()throws Exception{
        Field reset=CarUi.class.getDeclaredField("RENDERERS");reset.setAccessible(true);((Map<?,?>)reset.get(null)).clear();reset=CarUi.class.getDeclaredField("lastWarningFrameKey");reset.setAccessible(true);reset.set(null,"");
        app=RuntimeEnvironment.getApplication();app.getSharedPreferences("vela_settings",0).edit().clear().commit();TelemetryRuntime.resetForTest();TelemetryRuntime.init(app,()->{});
        TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);TelemetryRuntime.setCarEnabled(true);
        Field field=TelemetryRuntime.class.getDeclaredField("nativeWarnings");field.setAccessible(true);view=(WarningView)field.get(null);
        field=TelemetryRuntime.class.getDeclaredField("warningPreferences");field.setAccessible(true);WarningPreferences choices=(WarningPreferences)field.get(null);choices.categories(127);choices.confirm();view.events(Collections.singletonList(event("emergency_vehicle")));
    }
    @After public void cleanup(){TelemetryRuntime.resetForTest();}
    private WarningEvent event(String category){long now=SystemClock.elapsedRealtime();Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session",UUID.randomUUID().toString());b.putLong("sequence",1);b.putString("operation","ANNOUNCE");b.putString("warning_id","early/AMBULANCE:native");b.putLong("revision",1);b.putLong("announcement_index",1);b.putString("phase","notice");b.putString("native_type","INCIDENT");b.putString("native_subtype","AMBULANCE");b.putString("category",category);b.putInt("priority",0);b.putString("message","Ambulance approaching");b.putString("language_tag","en-US");b.putString("message_origin","native_text");b.putString("relevance","moving_emergency");b.putString("relationship","unknown");b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);b.putLong("announce_until_elapsed_ms",now+5000);b.putLong("state_until_elapsed_ms",now+30000);return WarningCodec.decode(b,now);}
    private Bitmap draw(Renderer renderer){Bitmap image=Bitmap.createBitmap(320,240,Bitmap.Config.ARGB_8888);CarUi.warningFrame(renderer,new Canvas(image));return image;}
    private int pixels(Bitmap image){int count=0;for(int y=0;y<image.getHeight();y++)for(int x=0;x<image.getWidth();x++)if(image.getPixel(x,y)!=0)count++;return count;}
    @Test public void browseWarningDrawsWithoutNavigationLocationSpeedOrNativeSpeedDisplay(){Renderer renderer=new Renderer();renderer.m0.setColor(Color.MAGENTA);renderer.m0.setTextSize(11);app.getSharedPreferences("vela_settings",0).edit().putBoolean("car_speed_on",false).commit();Bitmap image=draw(renderer);assertTrue("Native warning must draw on a browsing frame with no GPS/speed fields",pixels(image)>20);assertEquals(Color.MAGENTA,renderer.m0.getColor());assertEquals(11,renderer.m0.getTextSize(),0);for(int y=0;y<image.getHeight();y++)for(int x=0;x<image.getWidth();x++)if(x<25||x>=295||y<20||y>=210)assertEquals("Host control area unchanged",0,image.getPixel(x,y));}
    @Test public void warningPillStacksAboveTheSpeedPillOnlyWhenTheNativeSpeedDisplayRan(){
        Renderer renderer=new Renderer();renderer.drive=true;
        Bitmap image=Bitmap.createBitmap(320,240,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(image);
        assertTrue(CarUi.compact(renderer,canvas));CarUi.warningFrame(renderer,canvas);
        // Safe area 33..232 x 28..202 (8 dp inset, Vela's 80 dp button lane): two rows at scale 199/218.
        assertTrue("Speed pill in the bottom row",image.getPixel(132,190)!=0);
        assertTrue("Warning pill above it",image.getPixel(132,80)!=0);
        for(int y=0;y<image.getHeight();y++)for(int x=234;x<image.getWidth();x++)assertEquals("Vela's button lane stays clear",0,image.getPixel(x,y));
        Bitmap warningOnly=draw(renderer);
        assertTrue("Without the native display the warning takes the bottom row",warningOnly.getPixel(132,190)!=0);
        assertEquals("and nothing stacks above it",0,warningOnly.getPixel(132,80));
    }
    @Test public void semanticChangesAndClearRefreshTheActualRendererWithoutAnotherGpsFrame(){Renderer renderer=new Renderer();draw(renderer);CarUi.warningChanged();int arrived=renderer.snapshots;assertTrue(arrived>0);CarUi.warningChanged();assertEquals("Unchanged semantic state does not regenerate snapshots",arrived,renderer.snapshots);view.clear();CarUi.warningChanged();assertEquals("Clear refreshes the original surface without GPS",arrived+1,renderer.snapshots);}
    @Test public void distanceChangesRefreshThePillEvenWhenTheMessageStaysTheSame(){
        Renderer renderer=new Renderer();draw(renderer);CarUi.warningChanged();int before=renderer.snapshots;
        long now=SystemClock.elapsedRealtime();WarningEvent original=view.current(now);Bundle b=WarningCodec.encode(original);
        b.putLong("sequence",original.sequence+1);b.putLong("revision",original.revision+1);b.putInt("distance_m",100);
        b.putLong("distance_observed_elapsed_ms",now);b.putBoolean("distance_estimated",false);b.putLong("issued_elapsed_ms",now);
        view.events(Collections.singletonList(WarningCodec.decode(b,now)));CarUi.warningChanged();
        assertEquals(before+1,renderer.snapshots);CarUi.warningChanged();assertEquals(before+1,renderer.snapshots);
    }
    @Test public void nativeVisualRangeChangesRefreshProgressWithoutAChangedDistanceOrGpsFrame(){
        Renderer renderer=new Renderer();draw(renderer);long now=SystemClock.elapsedRealtime();WarningEvent original=view.current(now);Bundle b=WarningCodec.encode(original);
        b.putLong("sequence",original.sequence+1);b.putLong("revision",original.revision+1);b.putLong("issued_elapsed_ms",now);
        b.putInt("distance_m",100);b.putLong("distance_observed_elapsed_ms",now);b.putBoolean("distance_estimated",false);
        b.putInt("range_m",400);b.putLong("range_observed_elapsed_ms",now);b.putBoolean("range_estimated",false);b.putString("range_origin","native_ui_max_distance");
        view.events(Collections.singletonList(WarningCodec.decode(b,now)));CarUi.warningChanged();int before=renderer.snapshots;
        b.putLong("sequence",original.sequence+2);b.putLong("revision",original.revision+2);b.putInt("range_m",800);
        view.events(Collections.singletonList(WarningCodec.decode(b,now)));CarUi.warningChanged();assertEquals(before+1,renderer.snapshots);CarUi.warningChanged();assertEquals(before+1,renderer.snapshots);
    }
    @Test public void numericWarningValueChangesRefreshWithoutAChangedMessageOrRoadTelemetry(){
        Renderer renderer=new Renderer();draw(renderer);long now=SystemClock.elapsedRealtime();WarningEvent original=view.current(now);Bundle b=WarningCodec.encode(original);
        b.putLong("sequence",original.sequence+1);b.putLong("revision",original.revision+1);b.putLong("issued_elapsed_ms",now);b.putString("native_type","MAXIMUM_SPEED");b.putString("native_subtype","");b.putString("category","maximum_speed");b.putString("message","Native overspeed warning");b.putInt("road_speed_limit_kmh",100);
        view.events(Collections.singletonList(WarningCodec.decode(b,now)));CarUi.warningChanged();int before=renderer.snapshots;
        b.putLong("sequence",original.sequence+2);b.putLong("revision",original.revision+2);b.putInt("road_speed_limit_kmh",80);
        view.events(Collections.singletonList(WarningCodec.decode(b,now)));CarUi.warningChanged();assertEquals(before+1,renderer.snapshots);
    }
    @Test public void wazeUsesTheSameNativeCarWarningSurfaceWithItsOwnAttribution(){
        TelemetryRuntime.select(TelemetryStore.WAZE);WarningPreferences choices=TelemetryRuntime.warningPreferences();choices.categories(WarningPreferences.ROAD_DANGER);choices.confirm();
        Bundle b=WarningCodec.encode(event("road_danger"));b.putString("native_type","HAZARD");b.putString("native_subtype","HAZARD_TYPE_ON_ROAD_OBJECT");b.putString("relevance","point_ahead");b.putString("message","Object on road");
        view.events(Collections.singletonList(WarningCodec.decode(b,SystemClock.elapsedRealtime())));
        assertEquals("A point without any distance never draws a pill",0,pixels(draw(new Renderer())));
        assertEquals("Withheld provider text does not resurface as compact text","",TelemetryRuntime.compactCarWarningText());
        b.putLong("sequence",b.getLong("sequence")+1);b.putInt("distance_m",300);b.putLong("distance_observed_elapsed_ms",SystemClock.elapsedRealtime());b.putBoolean("distance_estimated",false);
        view.events(Collections.singletonList(WarningCodec.decode(b,SystemClock.elapsedRealtime())));
        assertEquals("De-Waze\nObject on road",TelemetryRuntime.nativeCarWarningText());assertTrue(pixels(draw(new Renderer()))>20);
        TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);assertEquals("",TelemetryRuntime.nativeCarWarningText());assertEquals(0,pixels(draw(new Renderer())));
    }
    @Test public void notificationCarVariantIsSelectedAndExplicitNativeCarExclusionIsRespected(){
        TelemetryRuntime.select(TelemetryStore.WAZE);TelemetryRuntime.warningPreferences().categories(WarningPreferences.ROAD_DANGER);
        Bundle b=WarningCodec.encode(event("road_feature"));b.putString("native_type","NOTIFICATION");b.putString("native_subtype","FEATURE_CYCLISTS");b.putString("relevance","notice");b.putInt("priority",2);b.putString("message","Phone cyclist details");b.putBoolean("native_car_available",true);b.putString("native_car_title","Cyclist ahead");b.putString("native_car_body","Use caution");
        view.events(Collections.singletonList(WarningCodec.decode(b,SystemClock.elapsedRealtime())));
        assertEquals("De-Waze\nCyclist ahead: Use caution",TelemetryRuntime.nativeCarWarningText());assertEquals(TelemetryRuntime.nativeCarWarningText(),TelemetryRuntime.compactCarWarningText());assertTrue(pixels(draw(new Renderer()))>20);
        assertEquals("De-Waze\nPhone cyclist details",TelemetryRuntime.compactWarningText());
        view.clear();b.putBoolean("native_car_available",false);view.events(Collections.singletonList(WarningCodec.decode(b,SystemClock.elapsedRealtime())));
        assertEquals("",TelemetryRuntime.nativeCarWarningText());assertEquals("",TelemetryRuntime.compactCarWarningText());assertEquals(0,pixels(draw(new Renderer())));assertEquals("De-Waze\nPhone cyclist details",TelemetryRuntime.compactWarningText());
    }
    @Test public void disabledCarCategoriesNativeSelectionAndDisplayOnlyRemainSilentLayers()throws Exception{Renderer renderer=new Renderer();TelemetryRuntime.setCarEnabled(false);assertEquals(0,pixels(draw(renderer)));TelemetryRuntime.setCarEnabled(true);Field field=TelemetryRuntime.class.getDeclaredField("warningPreferences");field.setAccessible(true);WarningPreferences choices=(WarningPreferences)field.get(null);choices.categories(0);assertEquals(0,pixels(draw(renderer)));choices.categories(127);TelemetryRuntime.select("");assertEquals(0,pixels(draw(renderer)));TelemetryRuntime.select(TelemetryStore.FLITSMEISTER);view.clear();view.events(Collections.singletonList(event("display_only")));assertEquals(0,pixels(draw(renderer)));}
}
