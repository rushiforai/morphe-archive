package app.haiagaru.tests.opentabs;
import android.app.*;import android.content.*;import android.os.*;import android.graphics.BitmapFactory;import java.io.*;import java.lang.reflect.*;

/** Real private-process frame extraction; validates image bounds without displaying content. */
public final class VideoRangeInstrumentation extends Instrumentation {
 private String url;private boolean direct;
 @Override public void onCreate(Bundle args){super.onCreate(args);url=args.getString("url");direct="true".equals(args.getString("direct"));start();}
 @Override public void onStart(){Bundle out=new Bundle();int status=Activity.RESULT_CANCELED;File output=null;SharedPreferences health=null;boolean hadUnsafe=false,unsafe=false;try{
  Context app=getTargetContext();ClassLoader loader=app.getClassLoader();
  health=app.getSharedPreferences("haiagaru-video-decoder-health",0);hadUnsafe=health.contains("unsafe");unsafe=health.getBoolean("unsafe",false);out.putString("priorUnsafe",String.valueOf(unsafe));health.edit().putBoolean("unsafe",false).commit();
  if(url==null)throw new IllegalArgumentException("url required");
  File directory=new File(app.getCacheDir(),"haiagaru-video-frames");directory.mkdirs();output=File.createTempFile("preview-test-",".jpg",directory);
  Class<?> service=loader.loadClass("app.morphe.extension.chmate."+(direct?"VideoFrameThumbnail":"VideoFrameDecodeService"));
  Method decode=service.getDeclaredMethod("decodeRemote",Context.class,String.class,File.class,boolean.class,int.class,int.class,long.class,long.class,boolean.class);decode.setAccessible(true);
  long started=SystemClock.elapsedRealtime();boolean result=(Boolean)decode.invoke(null,app,url,output,false,0,1,24L*1024*1024,20000L,false);
  out.putString("elapsed",String.valueOf(SystemClock.elapsedRealtime()-started));out.putString("healthAfter",String.valueOf(health.getBoolean("unsafe",false)));
  if(!result)throw new AssertionError("range decode returned false");
  BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;BitmapFactory.decodeFile(output.getPath(),bounds);
  if(bounds.outWidth<1||bounds.outHeight<1||Math.max(bounds.outWidth,bounds.outHeight)>640)throw new AssertionError("invalid preview bounds");
  out.putString("result","PASS private-process bounded range preview "+bounds.outWidth+"x"+bounds.outHeight+" in "+(SystemClock.elapsedRealtime()-started)+"ms");status=Activity.RESULT_OK;
 }catch(Throwable error){StringBuilder detail=new StringBuilder();for(Throwable cause=error;cause!=null;cause=cause.getCause())detail.append(cause.getClass().getName()).append(": ").append(cause.getMessage()).append('\n');out.putString("error",detail+android.util.Log.getStackTraceString(error));}finally{if(output!=null)output.delete();if(health!=null){if(hadUnsafe)health.edit().putBoolean("unsafe",unsafe).commit();else health.edit().remove("unsafe").commit();}finish(status,out);}}
}
