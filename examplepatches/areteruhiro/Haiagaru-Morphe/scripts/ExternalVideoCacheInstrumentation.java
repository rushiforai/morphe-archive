package app.haiagaru.tests.externalcache;
import android.app.*;import android.content.*;import android.net.Uri;import android.os.*;import android.media.MediaPlayer;import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
public final class ExternalVideoCacheInstrumentation extends Instrumentation {
 int checks;void ok(boolean value,String why){if(!value)throw new AssertionError(why);checks++;}
 Method method(Class<?> type,String name,Class<?>...args)throws Exception{Method method=type.getDeclaredMethod(name,args);method.setAccessible(true);return method;}
 public void onCreate(Bundle args){super.onCreate(args);start();}
 public void onStart(){Bundle result=new Bundle();try{
  Context app=getTargetContext();ok(app.getPackageName().endsWith(".reporter242"),"isolated verification242");ClassLoader loader=app.getClassLoader();Class<?> cache=loader.loadClass("app.morphe.extension.chmate.ExternalVideoCache"),h=loader.loadClass("app.morphe.extension.chmate.Haiagaru");
  Field context=h.getDeclaredField("applicationContext");context.setAccessible(true);Object old=context.get(null);context.set(null,app);
  SharedPreferences prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);Map<String,?> before=prefs.getAll();String[] keys={"videoViewerEnabled","externalImgpileVideoCache","videoFrameThumbnailsEnabled","urlVideoFetchMode","videoPreviewFour"};
  File file=null;try{
   prefs.edit().putBoolean(keys[0],false).putBoolean(keys[1],true).putBoolean(keys[2],true).putInt(keys[3],1).putBoolean(keys[4],false).commit();
   String address="https://cdn.imgpile.com/f/O5cw4e6.mp4";
   Method eligible=method(cache,"eligible",String.class);ok((Boolean)eligible.invoke(null,address),"reported video eligible");
   for(String invalid:new String[]{"https://cdn.imgpile.com.evil.test/f/a.mp4","https://cdn.imgpile.com@evil.test/a.mp4","http://cdn.imgpile.com/f/a.mp4","https://cdn.imgpile.com/f/a.png","https://cdn.imgpile.com:444/f/a.mp4"})ok(!(Boolean)eligible.invoke(null,invalid),"unrelated URL unchanged");
   Intent route=new Intent(Intent.ACTION_VIEW,Uri.parse(address)).setType("video/mp4");route.setDataAndType(Uri.parse(address),"video/mp4");
   loader.loadClass("app.morphe.extension.chmate.VideoViewerActivity").getMethod("prepareExternalIntent",Intent.class).invoke(null,route);
   ok(route.getComponent()!=null&&route.getComponent().getClassName().endsWith("ExternalVideoPlaybackActivity"),"OFF routes to download preparation, not dedicated player");
   Intent explicit=new Intent(Intent.ACTION_VIEW,Uri.parse(address)).setPackage("com.example.player");ok(!(Boolean)method(cache,"prepare",Context.class,Intent.class).invoke(null,app,explicit),"explicit player selection preserved");
   prefs.edit().putBoolean(keys[1],false).commit();Intent disabled=new Intent(Intent.ACTION_VIEW,Uri.parse(address));ok(!(Boolean)method(cache,"prepare",Context.class,Intent.class).invoke(null,app,disabled),"download setting OFF keeps original route");prefs.edit().putBoolean(keys[1],true).commit();
   Class<?> cancel=loader.loadClass("app.morphe.extension.chmate.ExternalVideoCache$Cancel");Object ongoing=Proxy.newProxyInstance(loader,new Class<?>[]{cancel},(p,m,a)->false);
   file=(File)method(cache,"download",Context.class,String.class,cancel).invoke(null,app,address,ongoing);ok(file.isFile()&&file.length()==7310958,"actual video fully downloaded");
   Intent playback=(Intent)method(cache,"playback",Context.class,File.class).invoke(null,app,file);Uri uri=playback.getData();
   ok("content".equals(uri.getScheme())&&"video/mp4".equals(playback.getType()),"external player gets local MP4 content URI");ok((playback.getFlags()&Intent.FLAG_GRANT_READ_URI_PERMISSION)!=0&&playback.getClipData()!=null,"read grant provided");
   try(ParcelFileDescriptor descriptor=app.getContentResolver().openFileDescriptor(uri,"r")){ok(descriptor!=null&&descriptor.getStatSize()==file.length(),"provider exposes complete file");}
   try{app.getContentResolver().openFileDescriptor(uri,"rw");throw new AssertionError("write mode");}catch(FileNotFoundException expected){ok(true,"provider read only");}
   try{app.getContentResolver().openFileDescriptor(uri.buildUpon().appendPath("extra").build(),"r");throw new AssertionError("extra path");}catch(FileNotFoundException expected){ok(true,"provider rejects extra path");}
   MediaPlayer player=new MediaPlayer();try{CountDownLatch prepared=new CountDownLatch(1);player.setOnPreparedListener(p->prepared.countDown());player.setDataSource(app,uri);player.prepareAsync();ok(prepared.await(10,TimeUnit.SECONDS),"platform player prepares through granted content provider");ok(player.getDuration()>14000&&player.getVideoWidth()==842,"video duration and dimensions");}finally{player.release();}
   Class<?> thumbnail=loader.loadClass("app.morphe.extension.chmate.VideoFrameThumbnail"),attachments=loader.loadClass("app.morphe.extension.chmate.XMediaAttachments");method(thumbnail,"requestLocal",String.class,File.class).invoke(null,address,file);Method poster=method(attachments,"readyThumbnailPoster",String.class);String image=null;
   for(int i=0;i<80&&image==null;i++){Thread.sleep(150);image=(String)poster.invoke(null,address);}ok(image!=null,"thumbnail generated while dedicated viewer OFF");
   byte[] bytes=(byte[])method(loader.loadClass("app.morphe.extension.chmate.VideoThumbnailServer"),"registeredBytes",String.class,int.class).invoke(null,image,4*1024*1024);ok(bytes.length>1000,"thumbnail image available to native image loader");
   result.putString("result","PASS "+checks+" actual download, OFF routing, provider playback and thumbnail checks");result.putString("playbackUri",uri.toString());
  }finally{SharedPreferences.Editor edit=prefs.edit();for(String key:keys){Object value=before.get(key);if(value==null)edit.remove(key);else if(value instanceof Boolean)edit.putBoolean(key,(Boolean)value);else if(value instanceof Integer)edit.putInt(key,(Integer)value);}edit.commit();context.set(null,old);}
  finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}}
}
