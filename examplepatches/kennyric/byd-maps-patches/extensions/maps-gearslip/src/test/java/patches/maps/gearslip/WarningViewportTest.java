package patches.maps.gearslip;
import static org.junit.Assert.*;
import android.graphics.Rect;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class WarningViewportTest {
 @Test public void currentVisibleAreaAllowsWarningsToFollowTheNativeControls(){assertEquals(new Rect(0,0,800,424),ProjectionRenderer.warningViewport(800,480,new Rect(0,0,800,424),new Rect(40,20,780,424)));}
 @Test public void unspecifiedHostInsetsWithholdOnlyTheOverlay(){assertTrue(ProjectionRenderer.warningViewport(800,480,new Rect(),null).isEmpty());}
 @Test public void currentVisibleAreaTakesPriorityOverAnOlderStableArea(){assertEquals(new Rect(0,0,300,480),ProjectionRenderer.warningViewport(800,480,new Rect(0,0,300,480),new Rect(400,0,800,480)));}
 @Test public void recordedHeadUnitBoundsDoNotReserveSpaceForHiddenControls(){assertEquals(new Rect(12,12,1178,448),ProjectionRenderer.warningViewport(1190,460,new Rect(12,12,1178,448),new Rect(12,88,1102,448)));}
 @Test public void offCanvasAreasAreEmpty(){assertTrue(ProjectionRenderer.warningViewport(800,480,new Rect(900,0,1000,480),null).isEmpty());}
 @Test public void explicitUnknownVisibleAreaCannotReviveAnOlderStableReservation(){assertTrue(ProjectionRenderer.warningViewport(1280,480,new Rect(),new Rect(0,0,1280,480)).isEmpty());}
 @Test public void stableAreaCanBeKnownBeforeVisibleArea(){assertEquals(new Rect(40,20,780,424),ProjectionRenderer.warningViewport(800,480,null,new Rect(40,20,780,424)));}
 @Test public void configurationUsesCanvasDpiAndPreservesLocale(){android.content.res.Configuration previous=new android.content.res.Configuration();previous.setLocale(java.util.Locale.forLanguageTag("ar"));android.content.res.Configuration updated=ProjectionRenderer.canvasConfiguration(previous,1280,480,160);assertEquals(1280,updated.screenWidthDp);assertEquals(480,updated.screenHeightDp);assertEquals(480,updated.smallestScreenWidthDp);assertEquals(160,updated.densityDpi);assertEquals(previous.getLocales(),updated.getLocales());assertEquals(android.content.res.Configuration.ORIENTATION_LANDSCAPE,updated.orientation);assertEquals(640,ProjectionRenderer.canvasConfiguration(previous,1280,480,320).screenWidthDp);}
 @Test public void phoneWindowBoundsCannotOverrideTheCarSurface()throws Exception{
  android.content.res.Configuration phone=new android.content.res.Configuration();
  java.lang.reflect.Field field=android.content.res.Configuration.class.getDeclaredField("windowConfiguration");field.setAccessible(true);Object window=field.get(phone);
  window.getClass().getMethod("setBounds",Rect.class).invoke(window,new Rect(0,0,1080,2400));phone.densityDpi=420;
  android.content.res.Configuration car=ProjectionRenderer.canvasConfiguration(phone,1280,480,160);Object carWindow=field.get(car);
  assertEquals(new Rect(),carWindow.getClass().getMethod("getBounds").invoke(carWindow));assertEquals(1280,car.screenWidthDp);assertEquals(480,car.screenHeightDp);assertEquals(160,car.densityDpi);
  assertEquals(new Rect(0,0,1080,2400),window.getClass().getMethod("getBounds").invoke(window));
 }
    @Test public void warningPillsStayAboveAHostPlayerOnTheRightButIgnoreOneOnTheLeft() {
        android.graphics.Rect left = ProjectionRenderer.warningViewport(1216, 480, new android.graphics.Rect(0, 0, 1216, 480), null,
                java.util.Collections.singletonList(new android.graphics.Rect(12, 404, 276, 468)));
        org.junit.Assert.assertEquals(480, left.bottom);
        android.graphics.Rect right = ProjectionRenderer.warningViewport(1216, 480, new android.graphics.Rect(0, 0, 1216, 480), null,
                java.util.Collections.singletonList(new android.graphics.Rect(940, 404, 1204, 468)));
        org.junit.Assert.assertEquals(404, right.bottom);
        android.graphics.Rect full = ProjectionRenderer.warningViewport(1216, 480, new android.graphics.Rect(0, 0, 1216, 480), null,
                java.util.Collections.singletonList(new android.graphics.Rect(860, 12, 1204, 468)));
        org.junit.Assert.assertEquals("Pills stay left of a full player card", 860, full.right);
        org.junit.Assert.assertEquals(480, full.bottom);
        // Regression (owner capture 02:18): a compact card in the top-right pushed the speedometer left.
        android.graphics.Rect compact = ProjectionRenderer.warningViewport(1280, 480, new android.graphics.Rect(64, 0, 1280, 480), null,
                java.util.Collections.singletonList(new android.graphics.Rect(917, 12, 1268, 136)));
        org.junit.Assert.assertEquals("A compact card at the top leaves the speedometer bottom-right", new android.graphics.Rect(64, 0, 1280, 480), compact);
    }
}
