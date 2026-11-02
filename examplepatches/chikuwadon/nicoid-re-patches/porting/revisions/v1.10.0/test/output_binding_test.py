#!/usr/bin/env python3
"""Run the production output helper against a queued Handler and decoder/Surface doubles."""
from pathlib import Path
import tempfile,subprocess,sys
r=Path(__file__).resolve().parents[1]
sources={
'android/os/Looper.java':'package android.os;public class Looper{static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return MAIN;}}',
'android/os/Handler.java':'package android.os;import java.util.*;public class Handler{static ArrayList<Runnable> pending=new ArrayList<>();public Handler(Looper l){}public boolean post(Runnable r){pending.add(r);return true;}public static void drain(){while(!pending.isEmpty())pending.remove(0).run();}}',
'android/graphics/SurfaceTexture.java':'package android.graphics;public class SurfaceTexture{}',
'android/view/Surface.java':'package android.view;public class Surface{public static int created,released;boolean valid=true;public Surface(android.graphics.SurfaceTexture t){created++;}public boolean isValid(){return valid;}public void release(){valid=false;released++;}}',
'android/view/View.java':'package android.view;public class View{public static final int GONE=8;public void setVisibility(int n){}public boolean isHardwareAccelerated(){return true;}}',
'android/view/TextureView.java':'package android.view;public class TextureView extends View{public boolean attached=true,available=true;android.graphics.SurfaceTexture texture=new android.graphics.SurfaceTexture();public boolean isAttachedToWindow(){return attached;}public boolean isAvailable(){return available;}public android.graphics.SurfaceTexture getSurfaceTexture(){return texture;}public int getWidth(){return 100;}public int getHeight(){return 100;}}',
'android/util/Log.java':'package android.util;public class Log{public static int w(String a,String b,Throwable t){return 0;}}',
'com/devbrackets/android/exomedia/ExoMedia.java':'package com.devbrackets.android.exomedia;public class ExoMedia{public enum RendererType{VIDEO}}',
'e/e/a/MiniSession225.java':'package e.e.a;public class MiniSession225{public static Object call(Object o,String n,Class<?>[] types,Object... args)throws Exception{return o.getClass().getMethod(n,types).invoke(o,args);}public static android.view.TextureView texture(android.view.View v){return null;}}',
'e/e/a/Playback214.java':'package e.e.a;public class Playback214{public static Object get(Object o,String f)throws Exception{return o.getClass().getField(f).get(o);}}',
'e/e/a/ModernDebug.java':'package e.e.a;public class ModernDebug{public static void record(String s){}}',
'e/e/a/PlayerCollapse227.java':'package e.e.a;public class PlayerCollapse227{public static void attach(Object o){}}',
'e/e/a/OutputTest.java':'''package e.e.a;import android.view.*;import android.os.Handler;public class OutputTest{static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("Output check "+checks);}public static class Player{public Surface surface;int binds;public void setSurface(Surface s){surface=s;binds++;}}public static class Delegate{public Player exoMediaPlayer=new Player();}public static class Impl{public Delegate delegate=new Delegate();}public static class Video extends View{public Impl videoViewImpl=new Impl();public View previewImageView=new View();public void setRendererEnabled(com.devbrackets.android.exomedia.ExoMedia.RendererType type,boolean on){}}public static void main(String[] args){Video video=new Video();TextureView first=new TextureView();Player player=video.videoViewImpl.delegate.exoMediaPlayer;
VideoOutput227.bind(video,first);VideoOutput227.bind(video,first);VideoOutput227.bind(video,first);check(Surface.created==0);Handler.drain();check(Surface.created==1&&player.binds==1);Surface original=player.surface;VideoOutput227.bind(video,first);Handler.drain();check(Surface.created==1&&player.surface==original&&player.binds==1);player.surface=null;VideoOutput227.bind(video,first);Handler.drain();check(Surface.created==2);first.attached=false;VideoOutput227.bind(video,first);Handler.drain();check(Surface.created==2&&player.binds==2);
TextureView next=new TextureView();VideoOutput227.bind(video,first);VideoOutput227.bind(video,next);Handler.drain();check(Surface.created==3);check(VideoOutput227.OUTPUTS.get(video).get()==next.getSurfaceTexture());player.surface.release();VideoOutput227.bind(video,next);Handler.drain();check(Surface.created==4);next.available=false;VideoOutput227.bind(video,next);Handler.drain();check(Surface.created==4);check(VideoOutput227.PENDING.isEmpty());System.out.println("OutputBindingTest: "+checks+" checks passed");}}'''
}
with tempfile.TemporaryDirectory() as d:
 t=Path(d)
 for n,s in sources.items():
  p=t/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
 subprocess.run(['java','-jar',str(Path(sys.argv[1]).resolve()),'-1.8','-warn:none','-d',str(t/'classes'),*map(str,t.rglob('*.java')),str(r/'src/e/e/a/VideoOutput227.java')],check=True)
 subprocess.run(['java','-cp',str(t/'classes'),'e.e.a.OutputTest'],check=True)
