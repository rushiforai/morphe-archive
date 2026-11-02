"""Actual native-command routing/storage regression fixtures. No device or real downloads."""
from pathlib import Path
import os,subprocess,json,hashlib,sys
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision42'/('downloads'+(sys.argv[1] if len(sys.argv)>1 else ''));w.mkdir(exist_ok=False);src=w/'src';src.mkdir();classes=w/'classes';classes.mkdir()
s={
'android/content/Context.java':'package android.content;public class Context{}',
'android/content/Intent.java':'package android.content;public class Intent{public void setClassName(Object a,String b){}public void setPackage(String s){}public void setData(android.net.Uri u){}}',
'android/app/Activity.java':'package android.app;public class Activity extends android.content.Context{public static class Window{public android.view.View getDecorView(){return null;}}public Window getWindow(){return new Window();}public String getPackageName(){return "fixture";}public void startActivity(android.content.Intent i){}}',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public String getResourceEntryName(int i){return "other";}}',
'android/view/View.java':'package android.view;public class View{public static final int NO_ID=-1;public int getId(){return NO_ID;}public Object getParent(){return null;}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public View getRootView(){return this;}}',
'android/view/ViewGroup.java':'package android.view;public class ViewGroup extends View{public CharSequence getContentDescription(){return null;}}',
'android/net/Uri.java':'package android.net;public class Uri{public static Uri parse(String s){return new Uri();}public static String decode(String s){try{return java.net.URLDecoder.decode(s,"UTF-8");}catch(Exception e){throw new RuntimeException(e);}}}',
'android/util/Base64.java':'package android.util;public class Base64{public static final int URL_SAFE=8;public static byte[] decode(String s,int f){return java.util.Base64.getUrlDecoder().decode(s);}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now=10000;public static long uptimeMillis(){return now;}}',
'androidx/annotation/Nullable.java':'package androidx.annotation;public @interface Nullable{}',
'app/morphe/extension/shared/patches/DownloadMode.java':'package app.morphe.extension.shared.patches;public enum DownloadMode{DEFAULT,IN_APP,EXTERNAL}',
'app/morphe/extension/music/settings/Settings.java':'package app.morphe.extension.music.settings;import app.morphe.extension.shared.patches.DownloadMode;public class Settings{public static class Setting<T>{T value;Setting(T v){value=v;}public T get(){return value;}public void set(T v){value=v;}}public static final Setting<DownloadMode> DOWNLOAD_MODE=new Setting<>(DownloadMode.DEFAULT);public static final Setting<Boolean> EXTERNAL_DOWNLOADER_MENU=new Setting<>(false);}',
'app/morphe/extension/music/shared/VideoInformation.java':'package app.morphe.extension.music.shared;public class VideoInformation{public static String getVideoId(){return "WRONGPLAYING";}}',
'app/morphe/extension/shared/Logger.java':'package app.morphe.extension.shared;public class Logger{public static void printDebug(java.util.function.Supplier<String> s){}public static void printDebug(java.util.function.Supplier<String> s,Throwable t){}public static void printException(java.util.function.Supplier<String> s,Throwable t){throw new AssertionError(t);}}',
'app/morphe/extension/shared/Utils.java':'package app.morphe.extension.shared;public class Utils{public static String toast="";public static android.app.Activity getActivity(){return new android.app.Activity();}public static boolean main=true;public static int posts;public static void verifyOnMainThread(){if(!main)throw new IllegalStateException("worker");}public static void runOnMainThread(Runnable r){posts++;boolean old=main;main=true;r.run();main=old;}public static boolean contains(CharSequence a,String b){return a.toString().contains(b);}public static boolean containsAny(String a,String... b){for(String s:b)if(a.contains(s))return true;return false;}public static void showToastShort(String s){toast=s;}}',
'app/morphe/extension/shared/patches/components/ContextInterface.java':'package app.morphe.extension.shared.patches.components;public interface ContextInterface{CharSequence patch_getPathBuilder();}',
'app/morphe/extension/shared/settings/BaseActivityHook.java':'package app.morphe.extension.shared.settings;public class BaseActivityHook{public static final String MORPHE_DOWNLOADS_INTENT="fixture";}',
'app/morphe/extension/shared/settings/preference/ExternalDownloaderPreference.java':'package app.morphe.extension.shared.settings.preference;public class ExternalDownloaderPreference{public static String id,url;public static int calls;public static void launchExternalDownloader(String i,android.app.Activity a,String u){id=i;url=u;calls++;}}',
'app/morphe/extension/music/patches/downloads/LocalDownloadManager.java':'package app.morphe.extension.music.patches.downloads;public class LocalDownloadManager{public static String id;public static int calls;public static void enqueue(String i){id=i;calls++;}}',
'app/bdcrusher/ytmusic/common/PersonalRuntime.java':'package app.bdcrusher.ytmusic.common;public class PersonalRuntime{public static boolean playlists=true;public static boolean installed(android.content.Context c,String s){return playlists;}}',
'app/bdcrusher/ytmusic/playlists/PlaylistRuntime.java':'package app.bdcrusher.ytmusic.playlists;public class PlaylistRuntime{public static String id,external;public static void external(String i,String t){external=i;}public static boolean endpoint(byte[] b){return false;}public static String url(String id){if(!PlaylistHeaderModel.validId(id))throw new IllegalArgumentException();return "https://music.youtube.com/playlist?list="+id;}public static void download(String i,String t){id=i;}}'
}
root=h/'Personal-Patches/extensions/music/src/main/java';actual=['app/bdcrusher/ytmusic/lyrics/ProtoWire.java','app/bdcrusher/ytmusic/playlists/PlaylistHeaderModel.java','app/bdcrusher/ytmusic/playlists/DownloadCommand.java','app/bdcrusher/ytmusic/playlists/DownloadStorage.java','app/bdcrusher/ytmusic/playlists/NativeDownloadContext.java','app/morphe/extension/music/patches/DownloadsPatch.java']
for n in actual:s[n]=(root/n).read_text(encoding='utf-8')
native='app/bdcrusher/ytmusic/playlists/NativeDownloadContext.java'
for name,method in [('video','video'),('playlist','playlist')]:
 old='throw new IllegalStateException("Native download '+name+' adapter not installed");'
 assert s[native].count(old)==1;s[native]=s[native].replace(old,'return fixture.NativeTag.'+method+'(tag);')
s['fixture/NativeTag.java']='package fixture;public class NativeTag{public final String song,list;public static int calls;public NativeTag(String v,String p){song=v;list=p;}public static String video(Object t){calls++;return t instanceof NativeTag n?n.song:null;}public static String playlist(Object t){calls++;return t instanceof NativeTag n?n.list:t instanceof String s?s:null;}}'

# Real returned native commands, not reconstructed IDs or guessed promotion strings.
def fields(b):
 p=0;out=[]
 def v():
  nonlocal p
  value=0
  for shift in range(0,70,7):
   x=b[p];p+=1;value|=(x&127)<<shift
   if x<128:return value
  raise ValueError()
 while p<len(b):
  tag=v();n,wire=tag>>3,tag&7
  if wire==0:data=v()
  elif wire in (1,2,5):
   length=v() if wire==2 else (8 if wire==1 else 4);data=b[p:p+length];p+=length
  else:raise ValueError()
  out.append((n,wire,data))
 return out
def child(b,n):return next(data for number,wire,data in fields(b) if number==n and wire==2)
def at(b,path):
 for n in path:b=child(b,n)
 return b
raw=(h/'Inputs/native-video-actionbar-element.pb').read_bytes();row=at(raw,[172660663,1,168777401,5,389155117]);song=next(at(data,[10,1218,9,169495254]) for n,wire,data in fields(row) if n==4 and wire==2 and any(x[0]==1218 for x in fields(child(data,10))) )
header=(h/'Inputs/playlist-regression-20261025/header-native.pb').read_bytes();row=at(header,[13,361650780,2,153515154,172660663,1,168777401,5,373186255,14]);playlist=next(at(data,[3,9]) for n,wire,data in fields(row) if n==7 and wire==2 and any(x[0]==3 for x in fields(data)))
(w/'song-command.pb').write_bytes(song);(w/'playlist-command.pb').write_bytes(playlist)
s['Check.java']=r'''import java.util.*;import java.nio.file.*;import java.io.*;import java.nio.charset.StandardCharsets;
import app.bdcrusher.ytmusic.playlists.*;import app.bdcrusher.ytmusic.lyrics.ProtoWire;import app.morphe.extension.music.patches.DownloadsPatch;import app.morphe.extension.music.settings.Settings;import app.morphe.extension.shared.patches.DownloadMode;import app.morphe.extension.shared.settings.preference.ExternalDownloaderPreference;import app.morphe.extension.music.patches.downloads.LocalDownloadManager;
public class Check{
 static int checks;static void check(boolean v){checks++;if(!v)throw new AssertionError("check "+checks);}
 static byte[] msg(ProtoWire.Field... f){return ProtoWire.message(f);}static ProtoWire.Field b(int n,byte[] d){return ProtoWire.blob(n,d);}static ProtoWire.Field str(int n,String s){return b(n,s.getBytes(StandardCharsets.US_ASCII));}
 static byte[] command(byte[] params){return msg(b(133724106,msg(str(1,Base64.getUrlEncoder().encodeToString(params)))));}
 static byte[] identity(String song,String list){return song!=null?msg(str(1,song)):msg(str(2,list));}
 static byte[] params(byte[] id){return msg(b(5,msg(ProtoWire.number(1,9),ProtoWire.number(3,1),b(10,id))));}
 static boolean route(byte[] b,Map<Object,Object> map){android.os.SystemClock.now+=2000;return DownloadsPatch.commandResolverOnClick(()->b,map);}
 public static void main(String[] args)throws Exception{
  byte[] song=Files.readAllBytes(Path.of(args[0],"song-command.pb")),playlist=Files.readAllBytes(Path.of(args[0],"playlist-command.pb"));
  var a=DownloadCommand.target(song);var p=DownloadCommand.target(playlist);check(a!=null&&!a.playlist()&&a.id().equals("MYal8NoVQXs"));check(p!=null&&p.playlist());
  check(DownloadCommand.target(msg(b(169495254,song))).equals(a));check(DownloadCommand.target(msg(b(169495254,song),b(133724106,new ProtoWire(song).child(133724106))))==null);check(DownloadCommand.target(null)==null);check(DownloadCommand.target(new byte[65537])==null);check(DownloadCommand.target(new byte[]{(byte)255})==null);
  check(DownloadCommand.target(msg(b(133724106,msg(str(1,"bad!")))))==null);check(DownloadCommand.target(msg(b(123,song)))==null);
  check(DownloadCommand.target(command(params(msg(str(1,a.id()),str(2,p.id())))))==null);
  check(DownloadCommand.target(command(msg(str(4,"WRONGPLAYING"),b(5,msg(ProtoWire.number(1,9),ProtoWire.number(3,1),b(10,identity(a.id(),null)))))))==null);
  check(DownloadCommand.target(command(params(identity("bad",null))))==null);check(DownloadCommand.target(command(params(identity(null,"unscoped"))))==null);
  check(DownloadCommand.target(command(msg(b(5,msg(ProtoWire.number(1,8),ProtoWire.number(3,1),b(10,identity(a.id(),null)))))))==null);
  check(DownloadCommand.target(command(msg(b(5,msg(ProtoWire.number(1,9),ProtoWire.number(3,2),b(10,identity(a.id(),null)))))))==null);
  check(DownloadCommand.target(command(params(msg(str(1,a.id()),str(1,a.id())))))==null);
  check(DownloadCommand.target(command(msg(str(4,a.id()),b(5,msg(ProtoWire.number(1,9),ProtoWire.number(3,1),b(10,identity(a.id(),null))))))).equals(a));
  Map<Object,Object> map=new HashMap<>();map.put("com.google.android.libraries.youtube.rendering.elements.sender_view",new android.view.View());
  Settings.DOWNLOAD_MODE.set(DownloadMode.DEFAULT);check(!route(song,map));check(!route(playlist,map));check(ExternalDownloaderPreference.calls==0&&LocalDownloadManager.calls==0);
  Settings.DOWNLOAD_MODE.set(DownloadMode.EXTERNAL);check(route(song,map));check(ExternalDownloaderPreference.id.equals(a.id()));check(ExternalDownloaderPreference.url.equals("https://music.youtube.com/watch?v="+a.id()));
  check(route(playlist,map));check(ExternalDownloaderPreference.id.equals(p.id()));check(ExternalDownloaderPreference.url.equals("https://music.youtube.com/playlist?list="+p.id()));
  int calls=ExternalDownloaderPreference.calls;check(DownloadsPatch.commandResolverOnClick(()->playlist,map));check(ExternalDownloaderPreference.calls==calls);
  check(!route(song,new HashMap<>()));check(!route(song,null));check(!route(msg(b(123,song)),map));
  app.morphe.extension.shared.Utils.main=false;check(route(song,map));check(app.morphe.extension.shared.Utils.posts>0);app.morphe.extension.shared.Utils.main=true;
  Settings.DOWNLOAD_MODE.set(DownloadMode.IN_APP);check(route(song,map));check(LocalDownloadManager.id.equals(a.id()));check(route(playlist,map));check(PlaylistRuntime.id.equals(p.id()));
  app.bdcrusher.ytmusic.common.PersonalRuntime.playlists=false;check(route(playlist,map));check(app.morphe.extension.shared.Utils.toast.contains("Download playlist"));
  Settings.DOWNLOAD_MODE.set(DownloadMode.EXTERNAL);android.os.SystemClock.now+=2000;check(DownloadsPatch.offlineVideoEndpointOnClick(()->song,map));check(ExternalDownloaderPreference.id.equals(a.id()));
  Path root=Path.of(args[0],"files");Files.createDirectories(root);File missing=root.resolve("Music/Morphe").toFile();check(DownloadStorage.volumePath(missing,root.toFile()).equals(root.toFile()));check(!missing.exists());check(DownloadStorage.volumePath(null,root.toFile()).equals(root.toFile()));
  var empty=DownloadStorage.scan(missing,root.toFile(),null,123456789);check(empty.owned()==0&&empty.free()==123456789);check(!missing.exists());
  Files.createDirectories(missing.toPath());String[] names={"a.webm","b.m4a","c.jpg","d.format.pb","e.chapters.json","f.webm.part"};int[] size={20,30,5,7,9,11};for(int i=0;i<names.length;i++)Files.write(missing.toPath().resolve(names[i]),new byte[size[i]]);
  Path covers=root.resolve("bdcrusher-playlist-artwork");Files.createDirectories(covers);Files.write(covers.resolve("a.jpg"),new byte[13]);Files.write(covers.resolve("a.json"),new byte[17]);Path nativeDir=root.resolve("bdcrusher-offline-native");Files.createDirectories(nativeDir);Files.write(nativeDir.resolve("a.pb"),new byte[19]);Path prefs=root.resolve("prefs.xml");Files.write(prefs,new byte[23]);
  Files.createDirectories(root.resolve("external-ytdlnis"));Files.write(root.resolve("external-ytdlnis/outside.webm"),new byte[999]);
  var stored=DownloadStorage.scan(missing,root.toFile(),prefs.toFile(),-1);check(Arrays.equals(stored.bytes(),new long[]{50,18,75,11}));check(Arrays.equals(stored.counts(),new long[]{2,2,5,1}));check(stored.owned()==154);check(stored.free()==-1);check(Files.size(root.resolve("external-ytdlnis/outside.webm"))==999);
  byte[] action=msg(b(94476261,new byte[0]),b(443434441,new byte[0]));
  check(DownloadCommand.contextual(action));check(DownloadCommand.contextual(msg(b(169495254,action))));check(!DownloadCommand.contextual(song));check(!DownloadCommand.contextual(msg(b(443434441,new byte[]{(byte)255}))));check(!DownloadCommand.contextual(msg(b(443434441,new byte[0]),b(443434441,new byte[0]))));check(!DownloadCommand.contextual(msg(b(443434441,new byte[0]),b(133724106,new byte[0]))));
  map.put(NativeDownloadContext.TAG,new fixture.NativeTag(a.id(),null));
  Settings.DOWNLOAD_MODE.set(DownloadMode.DEFAULT);int before=fixture.NativeTag.calls;check(!route(action,map));check(fixture.NativeTag.calls==before);
  Settings.DOWNLOAD_MODE.set(DownloadMode.EXTERNAL);app.morphe.extension.shared.Utils.main=false;check(route(action,map));check(ExternalDownloaderPreference.id.equals(a.id()));check(!ExternalDownloaderPreference.id.equals("WRONGPLAYING"));app.morphe.extension.shared.Utils.main=true;
  map.put(NativeDownloadContext.TAG,new fixture.NativeTag(null,p.id()));check(route(action,map));check(ExternalDownloaderPreference.url.equals(PlaylistRuntime.url(p.id())));check(PlaylistRuntime.external.equals(p.id()));
  map.put(NativeDownloadContext.TAG,new fixture.NativeTag(a.id(),p.id()));check(route(action,map));check(ExternalDownloaderPreference.id.equals(a.id()));
  Settings.DOWNLOAD_MODE.set(DownloadMode.IN_APP);map.put(NativeDownloadContext.TAG,new fixture.NativeTag(a.id(),null));check(route(action,map));check(LocalDownloadManager.id.equals(a.id()));map.put(NativeDownloadContext.TAG,new fixture.NativeTag(null,p.id()));check(route(action,map));check(PlaylistRuntime.id.equals(p.id()));
  check(NativeDownloadContext.target(new fixture.NativeTag("bad",p.id())).playlist());check(NativeDownloadContext.target(new fixture.NativeTag(null,"VL"+p.id())).id().equals(p.id()));check(NativeDownloadContext.target(null)==null);check(NativeDownloadContext.target(new Object())==null);check(NativeDownloadContext.target(a.id()).id().equals(a.id()));check(!NativeDownloadContext.target("PL123456789").playlist());check(NativeDownloadContext.target(p.id()).playlist());
  Settings.DOWNLOAD_MODE.set(DownloadMode.EXTERNAL);map.put(NativeDownloadContext.TAG,new Object(){public String toString(){return a.id();}});int unchanged=ExternalDownloaderPreference.calls;check(route(action,map));check(ExternalDownloaderPreference.calls==unchanged);check(app.morphe.extension.shared.Utils.toast.contains("Could not identify"));
  map.put(NativeDownloadContext.TAG,new fixture.NativeTag(a.id(),null));map.remove("com.google.android.libraries.youtube.rendering.elements.sender_view");check(route(action,map));check(ExternalDownloaderPreference.id.equals(a.id()));
  map.remove(NativeDownloadContext.TAG);check(!route(action,map));
  map.put("com.google.android.libraries.youtube.rendering.elements.sender_view",new android.view.View());map.put(NativeDownloadContext.TAG,new fixture.NativeTag(a.id(),null));android.os.SystemClock.now+=2000;check(DownloadsPatch.offlineVideoEndpointOnClick(()->action,map));check(ExternalDownloaderPreference.id.equals(a.id()));
  unchanged=ExternalDownloaderPreference.calls;check(DownloadsPatch.commandResolverOnClick(()->action,map));check(ExternalDownloaderPreference.calls==unchanged);
  System.out.println("PASS "+checks+" actual command/router/storage checks");
 }
}'''
for n,t in s.items():
 p=src/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(t,encoding='utf-8')
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(classes),*map(str,src.rglob('*.java'))],env=env,cwd=w,check=True)
r=subprocess.run([str(java/'java.exe'),'-cp',str(classes),'Check',str(w)],env=env,cwd=w,check=True,capture_output=True,text=True)
result={'passed':True,'nativeFactorySeamsSimulated':['NativeDownloadContext.bd_video(Object)','NativeDownloadContext.bd_playlist(Object)'],'stdout':r.stdout,'sources':{str((root/n).relative_to(h)).replace('\\','/'):hashlib.sha256((root/n).read_bytes()).hexdigest() for n in actual},'fixtures':{str(p.relative_to(h)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [h/'Inputs/native-video-actionbar-element.pb',h/'Inputs/playlist-regression-20261025/header-native.pb']},'scope':'Actual production parser/router/storage with real native command bytes. Android views, settings, downloader/external-app launch and the two APK-installed native identity helpers are simulated; their concrete DEX adapters are separately audited. No phone or real media downloads.'}
(w/'result.json').write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8');print(r.stdout)
