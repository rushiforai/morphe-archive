package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.preference.PreferenceManager;
import android.view.*;
import android.widget.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Real Android measure/layout tests with an inset content parent. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest=Config.NONE,sdk={28,34})
public class FullscreenLayout209Test {
 static final String[] IDS={"videoLayout","controller","commentlay","video","video_view","seekBar","bottommenulay","info","commentpostbutton","infobutton","titlebar","topmenulay"};
 static int id(String name){for(int i=0;i<IDS.length;i++)if(IDS[i].equals(name))return 0x7f080100+i;return 0;}
 static Context context(Activity activity){final Resources base=activity.getResources();final Resources resources=new Resources(base.getAssets(),base.getDisplayMetrics(),base.getConfiguration()){@Override public int getIdentifier(String name,String type,String pkg){int found=id(name);return found!=0?found:super.getIdentifier(name,type,pkg);}};return new ContextWrapper(activity){@Override public Resources getResources(){return resources;}};}
 static void layout(View v,int w,int h){v.measure(View.MeasureSpec.makeMeasureSpec(w,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(h,View.MeasureSpec.EXACTLY));v.layout(0,0,w,h);}
 static class InsetRoot extends RelativeLayout{
  int statusInset;
  InsetRoot(Context c){super(c);}
  @Override public WindowInsets getRootWindowInsets(){return new WindowInsets(new android.graphics.Rect(0,statusInset,0,0));}
  @Override public void getWindowVisibleDisplayFrame(android.graphics.Rect out){out.set(0,0,2048,955);}
 }
 static class Fixture{
  Activity activity;Context c;FrameLayout decor,content,layer;RelativeLayout root,frame;LinearLayout bar,tools,controller,bottom;TextView title;SeekBar seek;View info;t renderer;LinearLayout comments;int clicks,originalControllerIndex,originalBottomIndex;
  Fixture(boolean held){activity=Robolectric.buildActivity(Activity.class).setup().visible().get();c=context(activity);PreferenceManager.getDefaultSharedPreferences(c).edit().putString("player_controls_visibility_mode",held?"both":"off").commit();decor=new FrameLayout(c);content=new FrameLayout(c);decor.addView(content,new FrameLayout.LayoutParams(1955,919));root=new InsetRoot(c);content.addView(root,new FrameLayout.LayoutParams(-1,-1));frame=new RelativeLayout(c);frame.setId(id("videoLayout"));root.addView(frame,new RelativeLayout.LayoutParams(-1,-1));comments=new LinearLayout(c);comments.setId(id("commentlay"));frame.addView(comments,new RelativeLayout.LayoutParams(-1,-1));renderer=new t(c);renderer.setClipBounds(new android.graphics.Rect(1000,0,1500,80));comments.addView(renderer,new LinearLayout.LayoutParams(720,80));controller=new LinearLayout(c);controller.setId(id("controller"));controller.setOrientation(LinearLayout.VERTICAL);controller.setBackgroundColor(0x77000000);controller.setPadding(8,0,8,8);TextView time=new TextView(c);time.setText("00:43                                   15:24");controller.addView(time,new LinearLayout.LayoutParams(-1,32));seek=new SeekBar(c);seek.setId(id("seekBar"));seek.setMax(100);controller.addView(seek,new LinearLayout.LayoutParams(-1,40));RelativeLayout.LayoutParams cp=new RelativeLayout.LayoutParams(1955,-2);cp.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);frame.addView(controller,cp);bottom=new LinearLayout(c);bottom.setId(id("bottommenulay"));bottom.setGravity(Gravity.RIGHT);View post=new View(c);post.setId(id("commentpostbutton"));post.setBackgroundColor(0xffeeeeee);bottom.addView(post,new LinearLayout.LayoutParams(48,40));info=new View(c);info.setId(id("infobutton"));info.setBackgroundColor(0xffeeeeee);info.setClickable(true);info.setOnClickListener(new View.OnClickListener(){public void onClick(View v){clicks++;}});bottom.addView(info,new LinearLayout.LayoutParams(48,40));RelativeLayout.LayoutParams bp=new RelativeLayout.LayoutParams(-1,40);bp.addRule(RelativeLayout.ABOVE,id("controller"));frame.addView(bottom,bp);originalControllerIndex=frame.indexOfChild(controller);originalBottomIndex=frame.indexOfChild(bottom);layer=new FrameLayout(c);decor.addView(layer,new FrameLayout.LayoutParams(-1,-1));bar=new LinearLayout(c);bar.setGravity(Gravity.CENTER_VERTICAL);title=new TextView(c);title.setText("A long video title");title.setSingleLine(true);title.setEllipsize(android.text.TextUtils.TruncateAt.END);bar.addView(title,new LinearLayout.LayoutParams(0,40,1));tools=new LinearLayout(c);for(int i=0;i<6;i++)tools.addView(new View(c),new LinearLayout.LayoutParams(44,40));bar.addView(tools,new LinearLayout.LayoutParams(-2,40));layer.addView(bar,new FrameLayout.LayoutParams(-1,40,Gravity.TOP));activity.setContentView(decor);layout(decor,2048,955);}
  void update(int w,int h){FullscreenViewport209.update(root,decor,bar);FullscreenViewport209.top(root,bar,tools,tools,title);layout(decor,w,h);FullscreenViewport209.update(root,decor,bar);layout(decor,w,h);}
 }
 @Test public void barsReachPhysicalEdgesWhenContentParentIsNarrower(){Fixture f=new Fixture(false);assertEquals(1955,f.controller.getRight());f.update(2048,955);assertSame(f.layer,f.controller.getParent());assertSame(f.layer,f.bottom.getParent());assertEquals(0,f.controller.getLeft());assertEquals(2048,f.controller.getRight());assertEquals(955,f.controller.getBottom());assertEquals(2048,f.bottom.getRight());assertEquals(f.controller.getTop(),f.bottom.getBottom());assertEquals(0,f.bar.getLeft());assertEquals(2048,f.bar.getRight());assertEquals(0x77000000,((ColorDrawable)f.bar.getBackground()).getColor());assertEquals(0,((ColorDrawable)f.tools.getBackground()).getColor());assertEquals(Math.round(12*f.c.getResources().getDisplayMetrics().density),f.title.getPaddingLeft());assertEquals(f.title.getPaddingLeft(),f.seek.getPaddingLeft());assertEquals(f.seek.getPaddingLeft(),f.seek.getPaddingRight());assertTrue(f.seek.getPaddingLeft()>0);assertEquals(2048,f.seek.getWidth());f.seek.setProgress(0);int thumbStart=f.seek.getThumb().getBounds().centerX()+f.seek.getPaddingLeft()-f.seek.getThumbOffset();f.seek.setProgress(100);int thumbEnd=f.seek.getThumb().getBounds().centerX()+f.seek.getPaddingLeft()-f.seek.getThumbOffset();assertTrue(thumbStart>0);assertTrue(thumbEnd<2048);assertEquals(thumbStart,2048-thumbEnd);
  float x=2048-20,y=f.bottom.getTop()+20;f.layer.dispatchTouchEvent(MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,x,y,0));f.layer.dispatchTouchEvent(MotionEvent.obtain(0,1,MotionEvent.ACTION_UP,x,y,0));org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertEquals("Right-edge button must remain tappable outside old content bounds",1,f.clicks);f.update(2048,955);assertEquals(2048,f.controller.getRight());assertEquals(955,f.controller.getBottom());System.out.println("205 coords: content.right=1955 screen.right="+f.controller.getRight()+" controller.bottom="+f.controller.getBottom()+" seek.inset="+f.seek.getPaddingLeft()+" title.inset="+f.title.getPaddingLeft());FullscreenViewport209.restore(f.root);assertSame(f.frame,f.controller.getParent());assertSame(f.frame,f.bottom.getParent());assertEquals(f.originalControllerIndex,f.frame.indexOfChild(f.controller));assertEquals(f.originalBottomIndex,f.frame.indexOfChild(f.bottom));assertEquals(1955,f.controller.getLayoutParams().width);assertEquals(8,f.controller.getPaddingBottom());}
 @Test public void previousVersionReproducesRightAndBottomGaps(){Fixture f=new Fixture(false);FullscreenViewport204.update(f.root,f.decor,f.bar);layout(f.decor,2048,955);assertEquals(1955,f.controller.getRight());assertEquals(919,f.controller.getBottom());assertSame(f.frame,f.controller.getParent());FullscreenViewport204.restore(f.root);}
 @Test public void rendererUsesItsWholeMeasuredAreaAfterRotation(){Fixture f=new Fixture(true);f.update(2048,955);assertNull(f.renderer.getClipBounds());assertEquals(f.renderer.getWidth(),f.renderer.drawingWidth,0);assertEquals(f.renderer.getHeight(),f.renderer.drawingHeight,0);assertEquals(f.comments.getWidth(),f.renderer.getWidth());assertTrue(f.renderer.getWidth()>1500);f.update(955,2048);assertNull(f.renderer.getClipBounds());assertEquals(f.renderer.getWidth(),f.renderer.drawingWidth,0);assertEquals(f.renderer.getHeight(),f.renderer.drawingHeight,0);FullscreenViewport209.restore(f.root);}
 @Test public void rotationAndHeldControlsKeepBottomAligned(){Fixture f=new Fixture(true);f.update(2048,955);f.update(955,2048);assertEquals(955,f.controller.getRight());assertEquals(2048,f.controller.getBottom());assertEquals(f.controller.getTop(),f.bottom.getBottom());f.update(2048,955);assertEquals(2048,f.controller.getRight());assertEquals(955,f.controller.getBottom());FullscreenViewport209.restore(f.root);}
 @Test public void infoTransitionRestoresBeforeNativeSideLayout(){
  final Fixture f=new Fixture(false);f.update(2048,955);
  final View panel=new View(f.c);panel.setId(id("info"));panel.setVisibility(View.GONE);RelativeLayout.LayoutParams ip=new RelativeLayout.LayoutParams(-1,-1);ip.addRule(RelativeLayout.RIGHT_OF,id("videoLayout"));ip.addRule(RelativeLayout.ALIGN_PARENT_RIGHT);f.root.addView(panel,ip);
  f.info.setOnClickListener(new View.OnClickListener(){public void onClick(View v){
   // The new first instruction in native g/h/i removes fullscreen snapshots.
   FullscreenViewport209.restore(f.root);
   f.frame.setLayoutParams(new RelativeLayout.LayoutParams(1300,-1));panel.setVisibility(View.VISIBLE);
   // FullscreenControls.update still calls before() at the end of native layout.
   FullscreenViewport209.restore(f.root);
  }});
  f.info.performClick();assertTrue(FullscreenViewport209.side(f.root));layout(f.decor,2048,955);
  assertEquals(1300,f.frame.getWidth());assertEquals(1300,f.controller.getRight());assertEquals(1300,f.bottom.getRight());assertEquals(1300,panel.getLeft());assertTrue(panel.getWidth()>0);assertEquals(f.root.getWidth(),panel.getRight());assertSame(f.frame,f.controller.getParent());assertSame(f.frame,f.bottom.getParent());
 }
 @Test public void oldLateRestoreOverwritesNativeSideWidth(){Fixture f=new Fixture(false);FullscreenViewport205.update(f.root,f.decor,f.bar);layout(f.decor,2048,955);f.frame.setLayoutParams(new RelativeLayout.LayoutParams(1300,-1));FullscreenViewport205.restore(f.root);layout(f.decor,2048,955);assertEquals(1955,f.frame.getWidth());}
 @Test public void lowerIconsUseUpperDimensionsAndPreserveListeners(){Fixture f=new Fixture(false);f.update(2048,955);View upper=f.tools.getChildAt(0);assertEquals(upper.getWidth(),f.info.getWidth());assertEquals(upper.getHeight(),f.info.getHeight());assertTrue(f.info.getBackground() instanceof FullscreenViewport209.Glyph);f.info.performClick();assertEquals(1,f.clicks);FullscreenViewport209.restore(f.root);assertFalse(f.info.getBackground() instanceof FullscreenViewport209.Glyph);f.info.performClick();assertEquals(2,f.clicks);}
 @Test @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE) public void lowerGlyphKeepsTheUpperDrawScale(){
  final float[] mapped=new float[2];android.graphics.drawable.Drawable original=new android.graphics.drawable.ColorDrawable(0xffffffff){@Override public void draw(android.graphics.Canvas canvas){android.graphics.RectF bounds=new android.graphics.RectF(getBounds());canvas.getMatrix().mapRect(bounds);mapped[0]=bounds.width();mapped[1]=bounds.height();}};
  FullscreenViewport209.Glyph glyph=new FullscreenViewport209.Glyph(original);glyph.setBounds(0,0,44,40);glyph.draw(new android.graphics.Canvas(android.graphics.Bitmap.createBitmap(100,100,android.graphics.Bitmap.Config.ARGB_8888)));assertEquals(44*1.344f,mapped[0],0.01f);assertEquals(40*1.344f,mapped[1],0.01f);
 }

 @Test @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE) public void actionBackgroundRoundsOnlyCommentTopLeft(){
  Fixture f=new Fixture(false);f.update(2048,955);assertTrue(f.bottom.getBackground() instanceof FullscreenViewport209.Band);
  android.graphics.Bitmap image=android.graphics.Bitmap.createBitmap(2048,40,android.graphics.Bitmap.Config.ARGB_8888);f.bottom.draw(new android.graphics.Canvas(image));
  assertEquals(0,image.getPixel(1959,0));assertEquals(0,image.getPixel(1960,0)>>>24);assertEquals(0x77,image.getPixel(2003,0)>>>24);assertEquals(0x77,image.getPixel(2004,0)>>>24);assertEquals(0x77,image.getPixel(2047,39)>>>24);assertEquals(0x77,image.getPixel(2047,0)>>>24);assertEquals(0x77,image.getPixel(1960,39)>>>24);assertEquals(0x77,image.getPixel(2003,8)>>>24);assertEquals(0x77,image.getPixel(2004,8)>>>24);
  assertEquals(0x77,image.getPixel(2003,39)>>>24);assertEquals(0x77,image.getPixel(2004,39)>>>24);
  String output=System.getProperty("nicoid.test.image");if(output!=null)try{android.graphics.Bitmap strip=android.graphics.Bitmap.createBitmap(image,1960,0,88,40);java.io.FileOutputStream file=new java.io.FileOutputStream(output);android.graphics.Bitmap.createScaledBitmap(strip,352,160,false).compress(android.graphics.Bitmap.CompressFormat.PNG,100,file);file.close();}catch(java.io.IOException e){throw new AssertionError(e);}
  FullscreenViewport209.restore(f.root);
 }

 @Test public void previousVersionKeepsNativeDockHiddenState(){
  Fixture f=new Fixture(false);FullscreenViewport207.update(f.root,f.decor,f.bar);FullscreenViewport207.restore(f.root);
  f.bottom.setVisibility(View.GONE);f.bottom.setAlpha(0f);f.bottom.setTranslationX(748);f.bottom.setTranslationY(90);FullscreenViewport207.update(f.root,f.decor,f.bar);layout(f.decor,2048,955);
  assertFalse(f.bottom.isShown());assertEquals(0f,f.bottom.getAlpha(),0f);FullscreenViewport207.restore(f.root);
 }
 @Test public void previousVersionLeavesActionsTranslatedBeyondScreen(){
  Fixture f=new Fixture(false);f.bottom.setTranslationX(748);FullscreenViewport208.update(f.root,f.decor,f.bar);layout(f.decor,2048,955);
  assertEquals(View.VISIBLE,f.bottom.getVisibility());assertTrue(f.bottom.getX()+f.info.getX()>=2048);FullscreenViewport208.restore(f.root);
 }
 @Test public void repeatedInfoRoundTripsRestoreBothActionsAndTouch(){
  final Fixture f=new Fixture(false);f.bottom.getChildAt(0).setOnClickListener(new View.OnClickListener(){public void onClick(View v){f.clicks++;}});f.update(2048,955);
  for(int cycle=0;cycle<3;cycle++){
   FullscreenViewport209.restore(f.root);LinearLayout side=sideToolbar(f);
   assertTrue(FullscreenViewport209.side(f.root));layout(f.decor,2048,955);
   FullscreenViewport209.restore(f.root);f.frame.removeView(side);f.root.removeView(f.root.findViewById(id("info")));
   // Native dock hides the row, and the native fade can retain a final zero alpha.
   f.bottom.setVisibility(View.GONE);f.bottom.setAlpha(0f);f.bottom.setTranslationX(748);f.bottom.setTranslationY(90);
   android.view.animation.AlphaAnimation fade=new android.view.animation.AlphaAnimation(0f,0f);fade.setDuration(1);fade.setFillAfter(true);f.bottom.startAnimation(fade);
   f.controller.setVisibility(View.VISIBLE);f.controller.setAlpha(1f);f.update(2048,955);
   assertTrue(f.bottom.isShown());assertEquals(0f,f.bottom.getTranslationX(),0f);assertEquals(0f,f.bottom.getTranslationY(),0f);assertTrue(f.bottom.getX()+f.info.getX()+f.info.getWidth()<=f.layer.getWidth());assertEquals(1f,f.bottom.getAlpha(),0f);assertNull(f.bottom.getAnimation());assertEquals(2,f.bottom.getChildCount());
   assertEquals(f.controller.getTop(),f.bottom.getBottom());
   for(int i=0;i<2;i++){View button=f.bottom.getChildAt(i);assertTrue(button.isShown());assertEquals(44,button.getWidth());android.graphics.Rect visible=new android.graphics.Rect();button.getHitRect(visible);assertEquals(44,visible.width());assertTrue(visible.left>=0);assertTrue(visible.right<=f.layer.getWidth());assertTrue(f.bottom.getTop()>=0);assertTrue(f.bottom.getBottom()<=f.layer.getHeight());}
   for(int i=0;i<2;i++){float x=f.bottom.getChildAt(i).getLeft()+22,y=f.bottom.getTop()+20;
   f.layer.dispatchTouchEvent(MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,x,y,0));f.layer.dispatchTouchEvent(MotionEvent.obtain(0,1,MotionEvent.ACTION_UP,x,y,0));org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertEquals(cycle*2+i+1,f.clicks);f.update(2048,955);}
  }
  f.controller.setVisibility(View.INVISIBLE);f.update(2048,955);assertEquals(View.INVISIBLE,f.bottom.getVisibility());
  f.controller.setVisibility(View.VISIBLE);f.controller.setAlpha(.5f);f.update(2048,955);assertEquals(.5f,f.bottom.getAlpha(),0f);
  FullscreenViewport209.restore(f.root);
 }

 static LinearLayout sideToolbar(Fixture f){
  f.frame.setLayoutParams(new RelativeLayout.LayoutParams(1300,-1));View panel=new View(f.c);panel.setId(id("info"));RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(-1,-1);p.addRule(RelativeLayout.RIGHT_OF,id("videoLayout"));f.root.addView(panel,p);
  LinearLayout bar=new LinearLayout(f.c);bar.setId(id("titlebar"));LinearLayout row=new LinearLayout(f.c);row.setId(id("topmenulay"));View button=new View(f.c);button.setClickable(true);button.setOnClickListener(new View.OnClickListener(){public void onClick(View v){f.clicks++;}});row.addView(button,new LinearLayout.LayoutParams(44,40));bar.addView(row,new LinearLayout.LayoutParams(-1,40));RelativeLayout.LayoutParams bp=new RelativeLayout.LayoutParams(-1,40);bp.addRule(RelativeLayout.ALIGN_PARENT_TOP);f.frame.addView(bar,bp);layout(f.decor,2048,955);return bar;
 }
 @Test public void sideToolbarMovesBelowStatusBarWithoutDoubleInsets(){
  Fixture f=new Fixture(false);LinearLayout bar=sideToolbar(f);((InsetRoot)f.root).statusInset=64;
  assertTrue(FullscreenViewport209.side(f.root));layout(f.decor,2048,955);int[] window=new int[2];bar.getLocationInWindow(window);assertTrue("Toolbar is behind the visible status bar",window[1]>=64);int margin=((ViewGroup.MarginLayoutParams)bar.getLayoutParams()).topMargin;
  FullscreenViewport209.side(f.root);layout(f.decor,2048,955);assertEquals(margin,((ViewGroup.MarginLayoutParams)bar.getLayoutParams()).topMargin);
  View row=bar.getChildAt(0);assertEquals(0,((ViewGroup.MarginLayoutParams)row.getLayoutParams()).topMargin);
  float x=22,y=bar.getTop()+20;f.root.dispatchTouchEvent(MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,x,y,0));f.root.dispatchTouchEvent(MotionEvent.obtain(0,1,MotionEvent.ACTION_UP,x,y,0));org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();assertEquals(1,f.clicks);
  FullscreenViewport209.restore(f.root);assertEquals(0,((ViewGroup.MarginLayoutParams)bar.getLayoutParams()).topMargin);
 }
 @Test public void alreadyInsetSideToolbarDoesNotAddStatusHeightAgain(){
  Fixture f=new Fixture(false);LinearLayout bar=sideToolbar(f);((InsetRoot)f.root).statusInset=64;FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)f.root.getLayoutParams();p.topMargin=96;f.root.setLayoutParams(p);layout(f.decor,2048,955);FullscreenViewport209.side(f.root);layout(f.decor,2048,955);assertEquals(0,((ViewGroup.MarginLayoutParams)bar.getLayoutParams()).topMargin);FullscreenViewport209.restore(f.root);
 }
 @Test public void hidingStatusBarClearsOnlySideToolbarInset(){
  Fixture f=new Fixture(false);LinearLayout bar=sideToolbar(f);((InsetRoot)f.root).statusInset=64;FullscreenViewport209.side(f.root);layout(f.decor,2048,955);assertTrue(((ViewGroup.MarginLayoutParams)bar.getLayoutParams()).topMargin>0);((InsetRoot)f.root).statusInset=0;f.activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);FullscreenViewport209.side(f.root);layout(f.decor,2048,955);assertEquals(0,((ViewGroup.MarginLayoutParams)bar.getLayoutParams()).topMargin);FullscreenViewport209.restore(f.root);
 }

 @Test public void entryWaitsForFrameOverlay(){Fixture f=new Fixture(false);f.layer.removeView(f.bar);f.decor.removeView(f.layer);RelativeLayout window=new RelativeLayout(f.c);f.decor.addView(window,new FrameLayout.LayoutParams(-1,-1));window.addView(f.bar,new RelativeLayout.LayoutParams(-1,40));FullscreenViewport209.update(f.root,window,f.bar);assertSame(f.frame,f.controller.getParent());FullscreenViewport209.restore(f.root);}
 @Test public void replacedControlsDoNotReuseDetachedViews(){Fixture f=new Fixture(false);f.update(2048,955);((ViewGroup)f.controller.getParent()).removeView(f.controller);LinearLayout replacement=new LinearLayout(f.c);replacement.setId(id("controller"));RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(-1,72);p.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);f.frame.addView(replacement,p);FullscreenViewport209.update(f.root,f.decor,f.bar);layout(f.decor,2048,955);assertSame(f.layer,replacement.getParent());assertNull(f.controller.getParent());FullscreenViewport209.restore(f.root);assertSame(f.frame,replacement.getParent());assertNull(f.controller.getParent());}
 @Test public void detachRestoresWindowFlagsAndControls(){Fixture f=new Fixture(false);int flags=f.activity.getWindow().getAttributes().flags;f.update(2048,955);f.content.removeView(f.root);assertEquals(flags,f.activity.getWindow().getAttributes().flags);assertSame(f.frame,f.controller.getParent());}
 @Test public void normalTabletToolbarAvoidsStatusBarWithoutSidePane(){Fixture f=new Fixture(false);f.layer.removeView(f.bar);f.bar.setId(id("titlebar"));RelativeLayout.LayoutParams p=new RelativeLayout.LayoutParams(-1,40);p.addRule(RelativeLayout.ALIGN_PARENT_TOP);f.frame.addView(f.bar,p);((InsetRoot)f.root).statusInset=64;layout(f.decor,2048,955);assertFalse(FullscreenViewport209.side(f.root));layout(f.decor,2048,955);int[] where=new int[2];f.bar.getLocationInWindow(where);assertTrue("Normal toolbar window Y: "+where[1],where[1]>=64);int margin=((ViewGroup.MarginLayoutParams)f.bar.getLayoutParams()).topMargin;FullscreenViewport209.side(f.root);layout(f.decor,2048,955);assertEquals(margin,((ViewGroup.MarginLayoutParams)f.bar.getLayoutParams()).topMargin);FullscreenViewport209.restore(f.root);assertEquals(0,((ViewGroup.MarginLayoutParams)f.bar.getLayoutParams()).topMargin);}

 @Test public void tabletToolbarRepairsCollapsedHeightAndStaleTranslation(){
  Fixture f=new Fixture(false);LinearLayout bar=sideToolbar(f);bar.getLayoutParams().height=1;bar.setTranslationY(-80);layout(f.decor,2048,955);
  assertTrue(FullscreenViewport209.side(f.root));layout(f.decor,2048,955);
  assertTrue("Visible toolbar must fit its controls",bar.getHeight()>=40);assertEquals(0f,bar.getTranslationY(),0f);
  FullscreenViewport209.restore(f.root);
 }

 @Test public void fullscreenExitRestoresWholeTabletViewportBelowStatusBar(){
  Fixture f=new Fixture(false);InsetRoot root=(InsetRoot)f.root;root.statusInset=64;
  layout(f.decor,2048,955);int[] before=new int[2];root.getLocationInWindow(before);assertTrue(before[1]<64);
  FullscreenViewport209.restoreNormalViewport(root);layout(f.decor,2048,955);
  int[] first=new int[2];root.getLocationInWindow(first);
  assertTrue("Video viewport still overlaps status bar",first[1]>=64);
  assertTrue("Video bottom must remain inside content area",root.getBottom()<=f.content.getHeight());
  int margin=((ViewGroup.MarginLayoutParams)root.getLayoutParams()).topMargin;
  FullscreenViewport209.restoreNormalViewport(root);layout(f.decor,2048,955);
  assertEquals("Insets accumulated on repeated checks",margin,((ViewGroup.MarginLayoutParams)root.getLayoutParams()).topMargin);
  root.statusInset=0;FullscreenViewport209.restoreNormalViewport(root);layout(f.decor,2048,955);
  assertEquals("Stale inset survived hiding status bar",0,((ViewGroup.MarginLayoutParams)root.getLayoutParams()).topMargin);
  FullscreenViewport209.restore(root);assertEquals(0,((ViewGroup.MarginLayoutParams)root.getLayoutParams()).topMargin);
 }

}
