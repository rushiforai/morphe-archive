package app.haiagaru.tests.opentabs;
import android.app.*;import android.content.*;import android.os.*;import android.graphics.*;import android.view.*;import android.widget.*;import java.io.*;import java.lang.reflect.*;import java.util.concurrent.*;

/** Real error PNG/server/source mapping; synthetic failures only, no external media. */
public final class VideoThumbnailFailureInstrumentation extends Instrumentation {
 private int checks;private ClassLoader loader;private boolean ui;private Intent captured;private void ok(boolean value,String s){if(!value)throw new AssertionError(s);checks++;}
 private <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(20,TimeUnit.SECONDS);}
 private Button button(View view,String text){if(view instanceof Button&&text.equals(((Button)view).getText().toString()))return (Button)view;if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int n=0;n<group.getChildCount();n++){Button found=button(group.getChildAt(n),text);if(found!=null)return found;}}return null;}
 private Object call(String type,String method,Class<?>[] parameters,Object...args)throws Exception{Method m=loader.loadClass("app.morphe.extension.chmate."+type).getDeclaredMethod(method,parameters);m.setAccessible(true);return m.invoke(null,args);}
 @Override public void onCreate(Bundle args){super.onCreate(args);ui=args!=null&&"true".equals(args.getString("ui"));start();}
 @Override public void onStart(){Bundle out=new Bundle();SharedPreferences prefs=null;boolean had=false,previous=false;try{
  Context app=getTargetContext();loader=app.getClassLoader();prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);had=prefs.contains("videoPreviewFour");previous=prefs.getBoolean("videoPreviewFour",false);prefs.edit().putBoolean("videoPreviewFour",false).commit();
  String variant=(String)call("VideoFrameThumbnail","currentVariant",new Class<?>[0]),url="https://fixture.invalid/failure-test.mp4";
  Class<?> failure=loader.loadClass("app.morphe.extension.chmate.VideoThumbnailFailure");Constructor<?> constructor=failure.getDeclaredConstructor(int.class,int.class);constructor.setAccessible(true);Object cause=constructor.newInstance(5,403);
  String poster=(String)call("VideoThumbnailServer","failure",new Class<?>[]{String.class,failure},"synthetic-403",cause);ok(poster.startsWith("http://127.0.0.1:"),"process-owned thumbnail endpoint");
  Bitmap image;try(InputStream input=new java.net.URL(poster).openStream()){image=BitmapFactory.decodeStream(input);}ok(image!=null&&image.getWidth()==360&&image.getHeight()==240,"failure PNG served correctly: "+(image==null?"null":image.getWidth()+"x"+image.getHeight()));
  File screenshot=new File(app.getExternalFilesDir(null),"thumbnail-failure-example.png");try(OutputStream output=new FileOutputStream(screenshot)){image.compress(Bitmap.CompressFormat.PNG,100,output);}image.recycle();
  call("XMediaAttachments","setFailurePoster",new Class<?>[]{String.class,String.class,String.class},url,variant,poster);
  ok(!(Boolean)call("XMediaAttachments","hasFramePoster",new Class<?>[]{String.class,String.class},url,variant),"error does not masquerade as successful frame or block retry");
  ok(poster.equals(call("XMediaAttachments","generatedPoster",new Class<?>[]{String.class},url)),"failure used when no valid poster exists");
  ok(url.equals(call("XMediaAttachments","sourceVideo",new Class<?>[]{String.class},poster)),"failure click retains original video source");
  Intent playback=(Intent)call("VideoThumbnailRetry","playbackIntent",new Class<?>[]{Context.class,String.class},app,url);
  ok(playback.getStringArrayListExtra("links").get(0).equals(url)&&playback.getIntExtra("index",-1)==0,"play button opens source, independent of thumbnail decode");
  if(ui)buttons(app,poster,url);
  call("XMediaAttachments","setFramePoster",new Class<?>[]{String.class,String.class,String.class},url,variant,"https://fixture.invalid/success.jpg");
  ok("https://fixture.invalid/success.jpg".equals(call("XMediaAttachments","generatedPoster",new Class<?>[]{String.class},url)),"success replaces error poster");
  out.putString("example",screenshot.getPath());out.putString("result","PASS "+checks+" native failure image/server/retry/source mapping checks");finish(Activity.RESULT_OK,out);
 }catch(Throwable error){out.putString("error",error.toString()+"\n"+android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,out);}finally{if(prefs!=null){if(had)prefs.edit().putBoolean("videoPreviewFour",previous).commit();else prefs.edit().remove("videoPreviewFour").commit();}}}
 private void buttons(Context app,String poster,String source)throws Exception{
  app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(1500);
  for(int n=0;n<30;n++){if(main(()->(Activity)call("Haiagaru","toolbarActivity",new Class<?>[]{Object.class},new Object[]{null}))!=null)break;Thread.sleep(1000);}
  Dialog[] dialog={null};View[] image={null};View[] root={null};ActivityMonitor monitor=new ActivityMonitor(){@Override public ActivityResult onStartActivity(Intent intent){captured=new Intent(intent);return new ActivityResult(Activity.RESULT_CANCELED,null);}};
  try{
   main(()->{Activity host=(Activity)call("Haiagaru","toolbarActivity",new Class<?>[]{Object.class},new Object[]{null});ok(host!=null,"resumed host");String type=app.getPackageName().endsWith("191")?"o.qaf":app.getPackageName().endsWith("226")?"o.TTRewardExpressVideoActivity":"o.zzbes";
    image[0]=(View)loader.loadClass(type).getConstructor(Context.class).newInstance(new ContextThemeWrapper(host,android.R.style.Theme_Material));
    dialog[0]=new Dialog(host);FrameLayout content=new FrameLayout(host);int size=(int)(280*host.getResources().getDisplayMetrics().density);content.addView(image[0],new FrameLayout.LayoutParams(size,size));dialog[0].setContentView(content);dialog[0].show();root[0]=image[0].getRootView();
    image[0].getClass().getMethod("setImageUrl",String.class,int.class,int.class).invoke(image[0],poster,0,0);return null;});Thread.sleep(1000);
   addMonitor(monitor);
   main(()->{ok(button(root[0],"再取得")!=null&&button(root[0],"再生")!=null,"actual native thumbnail has retry and play buttons");button(root[0],"再生").performClick();ok(captured!=null&&captured.getStringArrayListExtra("links").get(0).equals(source),"play launches original video after thumbnail failure");button(root[0],"再取得").performClick();return null;});Thread.sleep(1500);
   main(()->{ok(button(root[0],"再生")!=null&&button(root[0],"再生").isEnabled(),"play remains available during/after failed retry");image[0].getClass().getMethod("setImageUrl",String.class,int.class,int.class).invoke(image[0],null,0,0);return null;});waitForIdleSync();
   main(()->{ok(button(root[0],"再生")==null,"recycled/ordinary image removes failure controls after layout-safe cleanup");return null;});
  }finally{removeMonitor(monitor);main(()->{if(dialog[0]!=null)dialog[0].dismiss();return null;});}
 }
}
