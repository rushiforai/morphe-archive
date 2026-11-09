package patches.maps.gearslip;
import static org.junit.Assert.*;
import android.graphics.Rect;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class WarningViewportTest {
 @Test public void hostNavigationBarAndStableInsetsRemainOutsideWarningBounds(){assertEquals(new Rect(40,20,780,424),ProjectionRenderer.warningViewport(800,480,new Rect(0,0,800,424),new Rect(40,20,780,424)));}
 @Test public void unspecifiedHostInsetsWithholdOnlyTheOverlay(){assertTrue(ProjectionRenderer.warningViewport(800,480,new Rect(),null).isEmpty());}
 @Test public void disjointHostAreasNeverGuaranteeAnOverlayRegion(){assertTrue(ProjectionRenderer.warningViewport(800,480,new Rect(0,0,300,480),new Rect(400,0,800,480)).isEmpty());}
 @Test public void offCanvasAreasAreEmpty(){assertTrue(ProjectionRenderer.warningViewport(800,480,new Rect(900,0,1000,480),null).isEmpty());}
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
}
