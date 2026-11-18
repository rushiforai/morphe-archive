#!/usr/bin/env python3
"""Run Rumble's production Show video stats text (RumbleStats.lines) on Media3-shaped input, without an APK or SDK.

The format strings follow Media3's Format.toLogString and DecoderCounters.toString in Rumble 3.21.0: every key
the APK writes, in its order, including the ones the panel doesn't show (decRes, par, rotation, channel_mask),
which must not run into the values it does show. The panel's corner (RumbleStats.shownCorner) is checked on view
doubles: inside a frame that sits in its player view, and inside the shown part of one Fill screen zoomed.
"""
from pathlib import Path
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'shared'))
from host_java import STUBS, run

COUNTERS = ('DecoderCounters {\\n decoderInits=1,\\n decoderReleases=0\\n queuedInputBuffers=%d\\n skippedInputBuffers=0\\n'
            ' renderedOutputBuffers=%d\\n skippedOutputBuffers=0\\n droppedBuffers=%d\\n droppedInputBuffers=0\\n'
            ' maxConsecutiveDroppedBuffers=2\\n droppedToKeyframeEvents=0\\n totalVideoFrameProcessingOffsetUs=123456\\n'
            ' videoFrameProcessingOffsetCount=500\\n}')

PROBE = '''
import java.lang.reflect.*;
import java.util.*;
public class RumbleStatsProbe {
  static int checks;
  static void check(boolean b,String m){if(!b)throw new AssertionError(m);checks++;}
  static Method method(String name,Class<?>... types)throws Exception{
    Class<?> c=Class.forName("io.github.jordanwoodson.extension.shared.rumble.RumbleStats");
    Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m;}
  static List<String> lines(String video,String audio,String counters,long estimate,Object buffered,Object offset)throws Exception{
    return Arrays.asList((String[])method("lines",String.class,String.class,String.class,long.class,Object.class,Object.class)
      .invoke(null,video,audio,counters,estimate,buffered,offset));}
  @SuppressWarnings("unchecked")
  static Map<String,String> format(String log)throws Exception{return (Map<String,String>)method("format",String.class).invoke(null,log);}
  static int[] corner(android.view.View frame)throws Exception{
    return (int[])method("shownCorner",android.view.View.class).invoke(null,frame);}
  static void same(List<String> got,String... want){check(got.equals(List.of(want)),"got "+got+", want "+List.of(want));}
  static final long UNSET=Long.MIN_VALUE+1;
  public static void main(String[] args)throws Exception{
    String counters=String.format("COUNTERS",510,500,4);
    switch(args[0]){
      case "live":
        // An HLS live rendition with audio and video in one track: both codecs in the video format.
        same(lines("id=3, mimeType=video/avc, container=application/x-mpegURL, bitrate=1460000, codecs=avc1.4D401F,mp4a.40.2, "
              +"res=640x360, decRes=640x368, par=1.000, color=NA/NA/NA/8/8, fps=30.0, rotation=0, mirrorHorizontal",
            "id=null, mimeType=audio/mp4a-latm, codecs=mp4a.40.2, channels=2, channel_mask=3, sample_rate=48000",
            counters,21720000L,16800L,14300L),
          "Latency  14.3 s","Bitrate  1.46 Mbps, network 21.72 Mbps","Buffer   16.8 s","Dropped  4 of 504 frames",
          "Video    640x360, 30 fps","Codecs   avc1.4D401F, mp4a.40.2","Audio    48 kHz, 2 ch");break;
      case "vod":
        // A progressive MP4: no bitrate in the format, separate audio, no live offset.
        same(lines("id=1, mimeType=video/avc, bitrate=-1, codecs=avc1.64001F, res=854x480, decRes=854x480, fps=29.97003",
            "id=2, mimeType=audio/mp4a-latm, bitrate=-1, codecs=mp4a.40.2, channels=2, sample_rate=44100, language=und",
            counters,1090000L,15200L,UNSET),
          "Bitrate  -, network 1.09 Mbps","Buffer   15.2 s","Dropped  4 of 504 frames","Video    854x480, 29.97 fps",
          "Codecs   avc1.64001F, mp4a.40.2","Audio    44.1 kHz, 2 ch");break;
      case "empty":
        same(lines(null,null,null,0,null,null));
        same(lines(null,null,null,0,null,UNSET));
        same(lines(null,null,null,512000,null,null),"Bitrate  -, network 512 kbps");
        // Without codecs the sample type stands in.
        same(lines("id=1, mimeType=video/hevc, codecs=null, res=1920x1080",null,null,0,0L,null),
          "Buffer   0.0 s","Video    1920x1080","Codecs   hevc");break;
      case "format":
        Map<String,String> f=format("id=1, mimeType=video/avc, drm=[widevine, playready], res=1280x720, decRes=1280x720, "
          +"fps=60.0, rotation=90, mirrorHorizontal, labels=[en: English], roleFlags=[main]");
        check("1280x720".equals(f.get("res")),"res ran into decRes: "+f);
        check("60.0".equals(f.get("fps")),"fps ran into rotation: "+f);
        check("[widevine, playready]".equals(f.get("drm")),"drm list split: "+f);
        check(format(null).isEmpty(),"null log has values");break;
      case "corner":
        // Portrait: the frame sits inside the player view, so the panel starts at the frame's corner.
        android.view.View parent=new android.view.View();parent.w=720;parent.h=405;
        android.view.View frame=new android.view.View();frame.parent=parent;frame.w=720;frame.h=405;
        check(Arrays.equals(corner(frame),new int[]{0,0}),"portrait corner "+Arrays.toString(corner(frame)));
        // Fill screen in landscape: a 16:9 frame zoomed to a 1600x720 player view is 1600x900, centred at top -90.
        parent.w=1600;parent.h=720;frame.l=0;frame.t=-90;frame.w=1600;frame.h=900;
        check(Arrays.equals(corner(frame),new int[]{0,90}),"zoomed corner "+Arrays.toString(corner(frame)));
        // Letterboxed (Fill screen off): the frame is inside the view, offset by its bars.
        frame.l=140;frame.t=0;frame.w=1280;frame.h=720;
        check(Arrays.equals(corner(frame),new int[]{0,0}),"letterboxed corner "+Arrays.toString(corner(frame)));
        frame.parent=null;
        check(Arrays.equals(corner(frame),new int[]{0,0}),"no parent "+Arrays.toString(corner(frame)));break;
      default:throw new AssertionError(args[0]);
    }
    System.out.println("PASS: Rumble video stats "+args[0]+" "+checks+" checks");
  }
}
'''.replace('COUNTERS', COUNTERS)

ANDROID = {
    'android/os/Looper.java': '''package android.os; public class Looper {private static final Looper MAIN=new Looper();
        public static Looper getMainLooper(){return MAIN;} public static Looper myLooper(){return MAIN;} }''',
    'android/graphics/Canvas.java': '''package android.graphics; public class Canvas {
        public void drawRoundRect(float l,float t,float r,float b,float rx,float ry,Paint p){}
        public void drawText(String s,float x,float y,Paint p){} }''',
    'android/graphics/ColorFilter.java': 'package android.graphics; public class ColorFilter {}',
    'android/graphics/PixelFormat.java': 'package android.graphics; public class PixelFormat {public static final int TRANSLUCENT=-3;}',
    'android/graphics/Typeface.java': 'package android.graphics; public class Typeface {public static final Typeface MONOSPACE=new Typeface();}',
    'android/graphics/Paint.java': '''package android.graphics; public class Paint {public static final int ANTI_ALIAS_FLAG=1;
        public static class FontMetrics {public float ascent=-10,descent=3;}
        public Paint(int f){} public void setColor(int c){} public void setTypeface(Typeface t){} public void setTextSize(float s){}
        public FontMetrics getFontMetrics(){return new FontMetrics();} public float measureText(String s){return s.length();} }''',
    'android/graphics/drawable/Drawable.java': '''package android.graphics.drawable; public abstract class Drawable {
        private android.graphics.Rect bounds=new android.graphics.Rect(0,0,0,0);
        public void setBounds(int l,int t,int r,int b){bounds=new android.graphics.Rect(l,t,r,b);}
        public android.graphics.Rect getBounds(){return bounds;} public void invalidateSelf(){}
        public abstract void draw(android.graphics.Canvas c); public abstract void setAlpha(int a);
        public abstract void setColorFilter(android.graphics.ColorFilter f); public abstract int getOpacity(); }''',
    'android/util/TypedValue.java': '''package android.util; public class TypedValue {public static final int COMPLEX_UNIT_DIP=1,COMPLEX_UNIT_SP=2;
        public static float applyDimension(int u,float v,DisplayMetrics m){return v*m.density;} }''',
    'android/view/ViewOverlay.java': '''package android.view; public class ViewOverlay {
        public void add(android.graphics.drawable.Drawable d){} public void remove(android.graphics.drawable.Drawable d){} }''',
    # A view with a position, size and parent, for the panel's corner.
    'android/view/View.java': STUBS['android/view/View.java'].replace(
        'public int getWidth(){return 0;} public int getHeight(){return 0;}',
        'public int l,t,w,h; public View parent; public int getLeft(){return l;} public int getTop(){return t;} '
        'public int getWidth(){return w;} public int getHeight(){return h;} '
        'public boolean isAttachedToWindow(){return false;} public ViewOverlay getOverlay(){return new ViewOverlay();}').replace(
        'public ViewParent getParent(){return null;}', 'public ViewParent getParent(){return parent;}'),
}

if __name__ == '__main__':
    run('RumbleStatsProbe', ['rumble/RumbleStats.java'], PROBE, ['live', 'vod', 'empty', 'format', 'corner'], ANDROID)
