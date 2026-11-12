package app.morphe.extension.chmate;
import android.app.*;import android.os.*;import android.content.*;import android.view.*;import android.widget.*;import java.util.*;import java.util.concurrent.*;
/** Real Android FrameLayout traversal, production retry controls, no network or user data. */
public final class LayoutMutationInstrumentation extends Instrumentation {
 int checks;FrameLayout root;ArrayList<Thumbnail> images=new ArrayList<>();boolean baseline;
 void ok(boolean b,String message){if(!b)throw new AssertionError(message);checks++;}
 <T>T main(Callable<T> c)throws Exception{FutureTask<T> f=new FutureTask<>(c);runOnMainSync(f);return f.get(20,TimeUnit.SECONDS);}
 final class Thumbnail extends View {
  Runnable duringLayout;Thumbnail(Context c){super(c);}
  @Override public View getRootView(){return root;}
  @Override protected void onLayout(boolean changed,int l,int t,int r,int b){if(duringLayout!=null){Runnable task=duringLayout;duringLayout=null;task.run();}}
 }
 @Override public void onCreate(Bundle b){super.onCreate(b);baseline=b!=null&&"true".equals(b.getString("baseline"));start();}
 @Override public void onStart(){Bundle result=new Bundle();try{
  Activity a=startActivitySync(new Intent(getTargetContext(),LayoutHarness.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));waitForIdleSync();
  main(()->{root=new FrameLayout(a);a.setContentView(root);for(int i=0;i<128;i++){Thumbnail v=new Thumbnail(a);images.add(v);root.addView(v,new FrameLayout.LayoutParams(80,80));}return null;});waitForIdleSync();
  for(int pass=0;pass<8;pass++){
   main(()->{for(Thumbnail v:images)VideoThumbnailRetry.bind(v,"http://127.0.0.1/video-error-test.png");return null;});waitForIdleSync();
   main(()->{ok(root.getChildCount()==256,"128 native Views have independent retry overlays");
    images.get(0).duringLayout=()->{int before=root.getChildCount();for(Thumbnail v:images)VideoThumbnailRetry.bind(v,null);if(!baseline)ok(root.getChildCount()==before,"close never mutates child array during layout");};
    images.get(0).setLayoutParams(new FrameLayout.LayoutParams(81+checks,80));root.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(800,View.MeasureSpec.EXACTLY));
    try{root.layout(0,0,600,800);if(baseline)throw new AssertionError("old code did not reproduce layout crash");ok(true,"actual FrameLayout traversal completes");}
    catch(NullPointerException e){if(!baseline)throw e;ok(true,"old code reproduces FrameLayout null-child crash");}
    return null;});waitForIdleSync();
   main(()->{ok(root.getChildCount()==128,"all controls removed after traversal: "+root.getChildCount());return null;});
   if(baseline)break;
  }
  if(!baseline){
   main(()->{
    Thumbnail thumb=images.get(images.size()-1);android.graphics.Rect area=new android.graphics.Rect();ok(thumb.getGlobalVisibleRect(area),"thumbnail visible for overlap check");
    View popup=new View(a);root.addView(popup,new FrameLayout.LayoutParams(100,100));
    root.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(800,View.MeasureSpec.EXACTLY));root.layout(0,0,600,800);
    ok(VideoThumbnailRetry.covered(thumb,root,area),"later native reply popup hides background retry overlay");
    popup.setVisibility(View.GONE);ok(!VideoThumbnailRetry.covered(thumb,root,area),"dismissed popup restores actions");
    popup.setVisibility(View.VISIBLE);popup.setX(300);ok(!VideoThumbnailRetry.covered(thumb,root,area),"non-overlapping popup does not hide actions");
    popup.setX(0);popup.setAlpha(0);ok(!VideoThumbnailRetry.covered(thumb,root,area),"transparent sibling does not cover thumbnail");root.removeView(popup);
    FrameLayout emptyOverlay=new FrameLayout(a);root.addView(emptyOverlay,new FrameLayout.LayoutParams(600,800));
    root.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(800,View.MeasureSpec.EXACTLY));root.layout(0,0,600,800);
    ok(!VideoThumbnailRetry.covered(thumb,root,area),"full-screen transparent toolbar container does not hide actions");
    View panel=new View(a);emptyOverlay.addView(panel,new FrameLayout.LayoutParams(100,100));emptyOverlay.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(800,View.MeasureSpec.EXACTLY));emptyOverlay.layout(0,0,600,800);
    ok(VideoThumbnailRetry.covered(thumb,root,area),"actual child popup inside transparent container hides actions");root.removeView(emptyOverlay);return null;
   });
   main(()->{for(Thumbnail v:images){VideoThumbnailRetry.bind(v,"http://127.0.0.1/video-error-old.png");VideoThumbnailRetry.bind(v,null);VideoThumbnailRetry.bind(v,"http://127.0.0.1/video-error-new.png");}return null;});waitForIdleSync();
   main(()->{ok(root.getChildCount()==256,"rapid rebind does not resurrect old overlays");for(Thumbnail v:images)root.removeView(v);return null;});waitForIdleSync();
   main(()->{ok(root.getChildCount()==0,"detach cleans every overlay");return null;});
  }
  main(()->{a.finish();return null;});result.putString("result","PASS "+checks+" real FrameLayout "+(baseline?"baseline crash reproduction":"mass-failure/rebind/layout/detach checks"));finish(Activity.RESULT_OK,result);
 }catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}}
}
