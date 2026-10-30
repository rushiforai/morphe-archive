package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.Activity;
import android.graphics.*;
import android.view.*;
import android.widget.*;
import app.morphe.extension.shared.settings.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import java.io.*;
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N38RtlContractTest {
 @Test public void allRtlContracts() throws Exception {ticksAndLabelsHaveIndependentRtlOracle();opacityFillIsLogicalNotMirroredLength();touchUsesSameTravelAndValueIsNotInverted();}
 @After public void reset(){BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.DEFAULT);}
 private View row(String key){
  Activity a=Robolectric.buildActivity(Activity.class).setup().get();
  a.getApplicationInfo().flags |= android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
  BaseSettings.MORPHE_LANGUAGE.save(AppLanguage.AR);
  DeepSeekSliderPreference p=new DeepSeekSliderPreference(a);p.setKey(key);p.setTitle("slider");
  View v=p.getView(null,new ListView(a));a.setContentView(v);
  v.measure(View.MeasureSpec.makeMeasureSpec(420,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
  v.layout(0,0,420,v.getMeasuredHeight());return v;
 }
 public void ticksAndLabelsHaveIndependentRtlOracle()throws Exception{
  View root=row(DeepSeekSliderPreference.KEY_TEXT_SIZE);
  DeepSeekSliderPreference.SizeTierSeekBar s=(DeepSeekSliderPreference.SizeTierSeekBar)root.findViewWithTag("ai_size_tier_slider");
  assertEquals("Actual view must be RTL",View.LAYOUT_DIRECTION_RTL,s.getLayoutDirection());
  LinearLayout n=(LinearLayout)root.findViewWithTag("ai_size_tier_names");
  for(int i=0;i<5;i++){
   s.setProgress(i);Bitmap b=Bitmap.createBitmap(s.getWidth(),s.getHeight(),Bitmap.Config.ARGB_8888);s.draw(new Canvas(b));
   float x=s.railEnd()-i*(s.railEnd()-s.railStart())/4f;
   assertEquals("native thumb",x,s.getThumb().getBounds().exactCenterX(),1f);
   assertEquals("selected tick",x,s.tickCenterX(i),1f);
   assertEquals("logical label "+i,x,(n.getChildAt(i).getLeft()+n.getChildAt(i).getRight())/2f,1f);
  }
 }
 public void opacityFillIsLogicalNotMirroredLength()throws Exception{
  View root=row(DeepSeekSliderPreference.KEY_OPACITY);
  DeepSeekSliderPreference.OpacitySeekBar s=(DeepSeekSliderPreference.OpacitySeekBar)root.findViewWithTag("ai_opacity_slider");
  assertEquals(View.LAYOUT_DIRECTION_RTL,s.getLayoutDirection());
  s.setProgress(28);Bitmap b=Bitmap.createBitmap(s.getWidth(),s.getHeight(),Bitmap.Config.ARGB_8888);s.draw(new Canvas(b));
  int y=s.centerY(),primary=CaptionSettingsStyle.primary(s.getContext()),unfilled=CaptionSettingsStyle.sliderUnfilled(s.getContext());
  int l=Math.round(s.railStart()),r=Math.round(s.railEnd());
  assertEquals("midpoint must remain unfilled at 28% RTL",unfilled,b.getPixel((l+r)/2,y));
  int alpha=Color.alpha(primary)+(Color.alpha(unfilled)*(255-Color.alpha(primary))+127)/255;
  int actual=b.getPixel(Math.round(l+.9f*(r-l)),y);
  assertEquals("filled source-over alpha",alpha,Color.alpha(actual),1);
  assertEquals("filled RGB",primary&0xffffff,actual&0xffffff);

 }
 public void touchUsesSameTravelAndValueIsNotInverted(){
  View root=row(DeepSeekSliderPreference.KEY_OPACITY);
  DeepSeekSliderPreference.OpacitySeekBar s=(DeepSeekSliderPreference.OpacitySeekBar)root.findViewWithTag("ai_opacity_slider");
  assertEquals(View.LAYOUT_DIRECTION_RTL,s.getLayoutDirection());
  for(int value:new int[]{0,28,75,100}){
   float x=s.railEnd()-(s.railEnd()-s.railStart())*value/100f;
   s.onTouchEvent(MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,x,s.centerY(),0));
   s.onTouchEvent(MotionEvent.obtain(0,1,MotionEvent.ACTION_UP,x,s.centerY(),0));
   assertEquals("touch value="+value,value,s.getProgress());
  }
 }
}
