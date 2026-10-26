package io.github.pengusto.patches.tests;
import android.app.Instrumentation;
import android.os.Bundle;
import android.graphics.Bitmap;
public class ArtworkProbe extends Instrumentation {
 public void onCreate(Bundle args){super.onCreate(args);if(!"ranchu".equals(android.os.Build.HARDWARE))throw new IllegalStateException("Disposable emulator only");start();}
 public void onStart(){Bundle b=new Bundle();try{
 Class<?> c=Class.forName("io.github.pengusto.patches.extension.music.TrackArtwork",true,getTargetContext().getClassLoader());
 for(String p:new String[]{"/sdcard/Music/01-red.mp3","/sdcard/Music/02-blue.mp3","/sdcard/Music/red.opus","/sdcard/Music/blue.opus"}){
 Bitmap x=(Bitmap)c.getMethod("load",android.content.Context.class,String.class).invoke(null,getTargetContext(),p);
 b.putString(p,x==null?"null":Integer.toHexString(x.getPixel(10,10)));
 }
 for(String path:new String[]{"red.opus","blue.opus"}){
 Class<?> op=Class.forName("io.github.pengusto.patches.extension.music.OpusPicture",true,getTargetContext().getClassLoader());
 byte[] pic=(byte[])op.getMethod("read",java.io.File.class).invoke(null,new java.io.File("/sdcard/Music/"+path));b.putString("parser-"+path,pic==null?"null":"bytes="+pic.length);
 }
 if (!"fffc0000".equals(b.getString("/sdcard/Music/01-red.mp3")) || !"ff0000fd".equals(b.getString("/sdcard/Music/02-blue.mp3"))) throw new AssertionError("Wrong per-file artwork");
 if(c.getMethod("load",android.content.Context.class,String.class).invoke(null,getTargetContext(),"/nonexistent")!=null) throw new AssertionError("Missing path fallback");
 for(String path:new String[]{"/sdcard/Music/no-cover.mp3","/sdcard/Music/corrupt.mp3",""}) if(c.getMethod("load",android.content.Context.class,String.class).invoke(null,getTargetContext(),path)!=null) throw new AssertionError("Expected fallback: "+path);
 if(android.graphics.Color.red((int)Long.parseLong(b.getString("/sdcard/Music/red.opus"),16))<200 || android.graphics.Color.blue((int)Long.parseLong(b.getString("/sdcard/Music/blue.opus"),16))<200) throw new AssertionError("Opus artwork");
 Class<?> opus=Class.forName("io.github.pengusto.patches.extension.music.OpusPicture",true,getTargetContext().getClassLoader());
 for(byte[] invalid:new byte[][]{new byte[0],new byte[16],new byte[]{79,112,117,115,84,97,103,115,-1,-1,-1,127,0,0,0,0}}) if(opus.getMethod("fromTags",byte[].class).invoke(null,(Object)invalid)!=null) throw new AssertionError("Malformed tag accepted");
 b.putString("result","PASS: MP3/Opus per-file artwork; missing/empty/no-cover/corrupt fallback");
 finish(-1,b);
 }catch(Throwable e){b.putString("error",e.toString());finish(0,b);}}
}
