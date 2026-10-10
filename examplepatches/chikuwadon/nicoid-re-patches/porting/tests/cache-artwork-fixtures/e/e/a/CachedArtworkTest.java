package e.e.a;
import android.content.*;import android.graphics.*;import android.media.*;import android.media.session.*;import android.os.*;import android.preference.PreferenceManager;import java.io.*;import java.lang.reflect.*;import java.util.concurrent.*;
public class CachedArtworkTest{
 public static class Owner{public Context A1;public String b0;Owner(Context c,String id){A1=c;b0=id;}}
 public static class Popup extends Context{public String f="sm1";Popup(File root){super(root,root);}}
 static void check(boolean b,String message){if(!b)throw new AssertionError(message);}
 static void settle(ExecutorService worker)throws Exception{worker.submit(()->{}).get(5,TimeUnit.SECONDS);}
 static void request(MediaSession s,MediaMetadata m,Object owner,String url,ExecutorService w)throws Exception{CachedMediaArtwork.request(s,m,owner,url);settle(w);Handler.flush();}
 public static void main(String[] args)throws Exception{
  Field f=CachedMediaArtwork.class.getDeclaredField("WORKER");f.setAccessible(true);ExecutorService worker=(ExecutorService)f.get(null);
  try{
   PreferenceManager.prefs=(SharedPreferences)Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),new Class[]{SharedPreferences.class},(p,m,a)->{if(m.getName().equals("getString"))return a[1];throw new AssertionError(m.getName());});
   File root=new File(args[0]).getAbsoluteFile();File folder=new File(root,"nicoid/nicoid_cache");folder.mkdirs();
   try(DataOutputStream out=new DataOutputStream(new FileOutputStream(new File(folder,"sm1.thm")))){out.writeInt(1280);out.writeInt(720);}
   Context c=new Context(root,root);MediaMetadata base=new MediaMetadata.Builder().putString("title","cached title").putString("artist","creator").putLong("duration",123000).build();MediaSession session=new MediaSession();
   request(session,base,new Owner(c,"sm1"),null,worker);Bitmap artwork=session.metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);
   check(artwork!=null&&artwork.getWidth()==640&&artwork.getHeight()==360,"offline cache image loaded and bounded");
   check(session.metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART)==artwork,"both artwork keys populated");
   check(session.metadata.getString("title").equals("cached title")&&session.metadata.getString("artist").equals("creator")&&session.metadata.getLong("duration")==123000,"existing metadata retained");
   check(FeedbackMedia.calls==0,"local hit needs no network loader even without URL");
   request(new MediaSession(),base,new Owner(c,"sm1"),"https://invalid.example/image",worker);check(FeedbackMedia.calls==0,"local image preferred over network URL");
   MediaSession popup=new MediaSession();request(popup,base,new Popup(root),null,worker);check(popup.metadata.getBitmap(MediaMetadata.METADATA_KEY_ART)!=null,"popup ownership supported");
   request(new MediaSession(),base,new Owner(c,"sm2"),"https://invalid.example/image",worker);check(FeedbackMedia.calls==1,"missing local image uses existing online loader");
   try(FileOutputStream out=new FileOutputStream(new File(folder,"sm3.thm"))){out.write(1);}
   request(new MediaSession(),base,new Owner(c,"sm3"),"https://invalid.example/image",worker);check(FeedbackMedia.calls==2,"corrupt local image falls back");
   MediaSession offlineMissing=new MediaSession();request(offlineMissing,base,new Owner(c,"sm4"),null,worker);check(offlineMissing.updates==0&&FeedbackMedia.calls==2,"missing offline artwork safely retains base metadata");
   CachedMediaArtwork.request(session,base,new Owner(c,"sm1"),null);settle(worker);
   CachedMediaArtwork.request(session,base,new Owner(c,"sm4"),null);settle(worker);int before=session.updates;Handler.flush();check(session.updates==before,"previous video cannot overwrite newer request");
   request(new MediaSession(),base,new Owner(c,"../sm1"),null,worker);check(FeedbackMedia.calls==2,"invalid video path rejected");
   request(new MediaSession(),base,new Object(),"https://invalid.example/image",worker);check(FeedbackMedia.calls==3,"unrecognized owner preserves online fallback");
   System.out.println("Cached media artwork: 12 offline/metadata/fallback/race checks passed");
  }finally{worker.shutdownNow();}
 }
}
