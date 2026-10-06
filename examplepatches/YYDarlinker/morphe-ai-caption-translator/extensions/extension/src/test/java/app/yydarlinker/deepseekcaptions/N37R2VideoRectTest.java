package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.Activity;import android.graphics.Rect;import android.view.*;import android.widget.*;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,qualifiers="w1280dp-h1000dp-mdpi")
public class N37R2VideoRectTest {
 @Test public void clippedActualVideoNotScreenOrPlayerOverlayAndFreshSurfaceAfterSwap(){
  Activity a=Robolectric.buildActivity(Activity.class).setup().visible().get();FrameLayout host=new FrameLayout(a),player=new FrameLayout(a);a.setContentView(host);host.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);FrameLayout.LayoutParams pp=new FrameLayout.LayoutParams(450,650,Gravity.TOP|Gravity.LEFT);pp.leftMargin=70;pp.topMargin=40;host.addView(player,pp);
  TextureView first=new TextureView(a);FrameLayout.LayoutParams vp=new FrameLayout.LayoutParams(600,500,Gravity.TOP|Gravity.LEFT);vp.leftMargin=50;vp.topMargin=30;player.addView(first,vp);host.measure(1073742624,1073742824);host.layout(0,0,800,1000);
  Rect rect=CaptionSurface.renderedBounds(player,host);assertNotNull(rect);assertEquals(400,rect.width());assertEquals(120,rect.left);assertEquals(70,rect.top);long scans=CaptionSurface.renderedSearchCount;assertEquals(rect,CaptionSurface.renderedBounds(player,host));assertEquals(scans,CaptionSurface.renderedSearchCount);
  player.removeView(first);TextureView next=new TextureView(a);FrameLayout.LayoutParams np=new FrameLayout.LayoutParams(300,570,Gravity.TOP|Gravity.LEFT);np.leftMargin=90;np.topMargin=20;player.addView(next,np);host.measure(1073742624,1073742824);host.layout(0,0,800,1000);Rect fresh=CaptionSurface.renderedBounds(player,host);assertEquals(160,fresh.left);assertEquals(300,fresh.width());assertEquals(60,fresh.top);assertNotEquals(rect,fresh);a.finish();
 }
}
