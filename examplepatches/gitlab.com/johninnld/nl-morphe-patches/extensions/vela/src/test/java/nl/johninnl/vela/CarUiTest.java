package nl.johninnl.vela;

import static org.junit.Assert.*;
import android.app.Application;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=32, qualifiers="en-rUS")
public class CarUiTest {
    @Before public void init() { TelemetryRuntime.init((Application)RuntimeEnvironment.getApplication(),()->{}); }
    @After public void reset() { TelemetryRuntime.resetForTest(); }

    @Test public void overlaysUseCurrentVisibleBoundsInsteadOfTheLargerStableRegion() {
        Rect visible=new Rect(420,90,1090,448),stable=new Rect(12,12,1178,448);
        Rect actual=CarUi.overlayViewport(visible,stable,1190,460);
        assertEquals(visible,actual);assertNotSame(visible,actual);
        assertEquals(new Rect(12,12,1178,448),stable);
        visible.set(12,12,1178,448);
        assertEquals("A new callback can expand up to the map-action column",new Rect(12,12,1110,448),CarUi.overlayViewport(visible,stable,1190,460));
        assertEquals("Earlier frames retain their own geometry",new Rect(420,90,1090,448),actual);
    }
    @Test public void emptyOrUnavailableVisibleAreaCannotReappearAsAFullSurfaceOverlay() {
        Rect stable=new Rect(12,12,1178,448);
        assertTrue(CarUi.overlayViewport(new Rect(),stable,1190,460).isEmpty());
        assertTrue(CarUi.overlayViewport(null,null,1190,460).isEmpty());
        assertEquals(new Rect(12,12,1110,448),CarUi.overlayViewport(null,stable,1190,460));
        assertTrue(CarUi.overlayViewport(new Rect(1300,0,1400,400),stable,1190,460).isEmpty());
        assertTrue(CarUi.overlayViewport(stable,null,0,460).isEmpty());
    }
    @Test public void overlayBoundsAreClippedOnceInSurfaceCoordinatesWithoutMutatingHostRects() {
        Rect host=new Rect(-20,-10,1300,500);
        assertEquals(new Rect(0,0,1110,460),CarUi.overlayViewport(host,null,1190,460));
        assertEquals(new Rect(-20,-10,1300,500),host);
    }
    @Test public void observedHostBoundsDoNotPermitPillsUnderTheZoomButton() {
        // Real run89 surface coordinates, rather than a host rectangle assumed safe.
        Rect host=new Rect(428,36,1154,460),zoomMinus=new Rect(1114,384,1178,448);
        Rect safe=CarUi.overlayViewport(host,host,1190,460,1f);
        assertTrue("The full warning pill and shadow clear the native button",safe.right+3<zoomMinus.left);
        Rect doubled=CarUi.overlayViewport(new Rect(856,72,2308,920),null,2380,920,2f);
        assertTrue("Reserve the control lane in host dp",doubled.right+6<zoomMinus.left*2);
        assertEquals("Do not shrink an already narrower host reservation",new Rect(428,36,1000,460),
            CarUi.overlayViewport(new Rect(428,36,1000,460),null,1190,460,1f));
        assertTrue(CarUi.overlayViewport(new Rect(1115,0,1190,460),null,1190,460,1f).isEmpty());
    }

    @Test public void nativeSelectionAndDisabledCarKeepTheOriginalRenderer() {
        Canvas canvas=new Canvas(Bitmap.createBitmap(260,220,Bitmap.Config.ARGB_8888));
        assertFalse(CarUi.compact(new Object(),canvas));
        TelemetryRuntime.select("com.waze");TelemetryRuntime.setCarEnabled(false);
        assertFalse(CarUi.compact(new Object(),canvas));
    }
    /** The fields the native renderer exposes to the hooks, with run89's real surface geometry. */
    public static final class Renderer {
        public Rect K=new Rect(428,36,1154,460),u0=null;
        public Double q=0d,r=50d;
        public boolean l(){return true;}
    }
    @Test public void nativeSpeedDisplayBecomesTheStacksSpeedPillLeftOfTheButtons() {
        TelemetryRuntime.select("com.waze");TelemetryRuntime.setCarEnabled(true);
        Renderer renderer=new Renderer();
        Canvas speedCanvas=new Canvas(Bitmap.createBitmap(1190,460,Bitmap.Config.ARGB_8888));
        assertTrue("The native display is replaced",CarUi.compact(renderer,speedCanvas));
        assertTrue("The native display hook itself draws nothing",texts(speedCanvas).isEmpty());
        Canvas frame=new Canvas(Bitmap.createBitmap(1190,460,Bitmap.Config.ARGB_8888));
        CarUi.warningFrame(renderer,frame);
        java.util.List<String> drawn=texts(frame);
        assertTrue(drawn.toString(),drawn.contains("50"));
        assertTrue("A stale speed is unknown, never zero",drawn.contains("—"));
        assertTrue(drawn.contains("km/h"));
        Canvas next=new Canvas(Bitmap.createBitmap(1190,460,Bitmap.Config.ARGB_8888));
        CarUi.warningFrame(renderer,next);
        assertTrue("Without this frame's native display there is no speed pill",texts(next).isEmpty());
    }
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void speedPillSitsBottomRightClearOfTheMapButtons() {
        TelemetryRuntime.select("com.waze");TelemetryRuntime.setCarEnabled(true);
        Renderer renderer=new Renderer();
        Bitmap bitmap=Bitmap.createBitmap(1190,460,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(bitmap);
        CarUi.compact(renderer,canvas);CarUi.warningFrame(renderer,canvas);
        Rect safe=CarUi.overlayViewport(renderer.K,null,1190,460,1f);safe.inset(8,8);
        int width=Math.round(nl.johninnl.navigation.alerts.CarWarningPills.WIDTH),height=Math.round(nl.johninnl.navigation.alerts.CarWarningPills.HEIGHT);
        assertEquals("The dark pill fills its centre",0xff20242b,bitmap.getPixel(safe.right-width/2,safe.bottom-6));
        assertTrue(Color.alpha(bitmap.getPixel(safe.right-width/2,safe.bottom-height-4))==0);
        for(int y=0;y<bitmap.getHeight();y++)for(int x=safe.right+2;x<bitmap.getWidth();x++)
            assertEquals("Nothing under Vela's map buttons",0,Color.alpha(bitmap.getPixel(x,y)));
    }
    private static java.util.List<String> texts(Canvas c){org.robolectric.shadows.ShadowCanvas s=org.robolectric.Shadows.shadowOf(c);java.util.List<String> out=new java.util.ArrayList<>();for(int i=0;i<s.getTextHistoryCount();i++)out.add(s.getDrawnTextEvent(i).text);return out;}
    private static TelemetryStore.View zone() {
        TelemetryStore store=new TelemetryStore();store.select("com.waze");
        Map<String,Object> packet=TelemetryStoreTest.packet("com.waze","test",1,5000);
        packet.put("zone_status","active");packet.put("zone_session",1L);packet.put("zone_segment_id","fixture");
        packet.put("zone_remaining_m",2000);packet.put("zone_progress_percent",30d);packet.put("zone_progress_estimated",true);
        packet.put("zone_observation_start_elapsed_ms",1000L);packet.put("zone_observed_distance_m",100);
        packet.put("zone_average_partial",true);packet.put("zone_average_speed_kmh",90d);
        assertTrue(store.accept(packet,"com.waze",5000));return store.view(5000);
    }
}
