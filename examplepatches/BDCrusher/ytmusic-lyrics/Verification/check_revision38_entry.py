"""Actual Lyrics availability/model code; only the patch-time native replay call is simulated."""
from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision38/entry-r2';w.mkdir(exist_ok=False)
s={
'android/app/Activity.java':'package android.app;public class Activity{}',
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java':'package android.os;public class Handler{static java.util.ArrayDeque<Runnable>tasks=new java.util.ArrayDeque<>();public Handler(Looper l){}public void post(Runnable r){tasks.add(r);}public static void drain(){while(!tasks.isEmpty())tasks.remove().run();}}',
'app/morphe/extension/music/shared/VideoInformation.java':'package app.morphe.extension.music.shared;public class VideoInformation{public static String id="MYal8NoVQXs";public static String getVideoId(){return id;}}',
'app/morphe/extension/music/settings/Settings.java':'package app.morphe.extension.music.settings;public class Settings{public static final Toggle LYRICS_ENABLED=new Toggle();public static class Toggle{public boolean value=true;public boolean get(){return value;}}}',
'app/bdcrusher/ytmusic/lyrics/LyricsRepository.java':'package app.bdcrusher.ytmusic.lyrics;class LyricsRepository{static String id="MYal8NoVQXs";static boolean current(String current){return current.equals(id);}}',
'app/bdcrusher/ytmusic/lyrics/NativeLyricsHost.java':'package app.bdcrusher.ytmusic.lyrics;class NativeLyricsHost{static final String ID="music_watch_lyrics_panel";static boolean prepare(String id){return true;}}',
'app/bdcrusher/ytmusic/lyrics/LyricsDiagnostics.java':'package app.bdcrusher.ytmusic.lyrics;class LyricsDiagnostics{static void record(String s,String m){}}',
'app/bdcrusher/ytmusic/lyrics/EntryCheck.java':r'''package app.bdcrusher.ytmusic.lyrics;
import java.nio.file.*;import java.util.*;import android.os.Handler;import app.morphe.extension.music.shared.VideoInformation;import app.morphe.extension.music.settings.Settings;
public class EntryCheck{static int checks,replays;static byte[] rendered;static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);System.out.println("PASS: "+s);}static void replay(Object owner){replays++;byte[] model=(byte[])LyricsEntryButton.originalModel(owner);LyricsEntryButton.captureModel(owner,model,model);rendered=LyricsEntryButton.rewrite(owner,model);}
static byte[] at(byte[] bytes,int...ns){for(int n:ns)bytes=new ProtoWire(bytes).child(n);return bytes;}
static boolean enabled(byte[] bytes){for(var f:new ProtoWire(at(bytes,172660663,1,168777401,5,389155117)).fields)if(f.number==4&&NativeActionModel.contains(f.data,"_quote_")){ProtoWire vm=new ProtoWire(at(f.data,10,461054335));return vm.one(14)==null&&vm.one(4)!=null;}return false;}
static byte[] other(byte[] bytes,String before,String after){byte[] out=bytes.clone(),a=before.getBytes(java.nio.charset.StandardCharsets.US_ASCII),b=after.getBytes(java.nio.charset.StandardCharsets.US_ASCII);for(int i=0;i<=out.length-a.length;i++){boolean match=true;for(int k=0;k<a.length;k++)match&=out[i+k]==a[k];if(match)System.arraycopy(b,0,out,i,b.length);}return out;}
public static void main(String[]args)throws Exception{byte[] original=Files.readAllBytes(Path.of(args[0]));var entry=new LyricsEntryButton();var activity=new android.app.Activity();String id=VideoInformation.id;Object owner=new Object();entry.trackChanged(id);LyricsEntryButton.captureIdentity(owner,id);Handler.drain();LyricsEntryButton.captureModel(owner,original,original);entry.orderWhilePending(id);check(!enabled(rendered),"pending reorders the genuine native action without fabricating available lyrics");entry.update(activity,id);check(enabled(rendered),"exact-ID lyrics enable genuine action before native metadata is committed");int steady=replays;entry.update(activity,id);check(replays==steady,"equivalent availability does not re-render action row");
Object reversed=new Object();LyricsEntryButton.captureModel(reversed,original,original);LyricsEntryButton.captureIdentity(reversed,id);Handler.drain();check(LyricsEntryButton.originalModel(reversed)==original&&enabled(rendered),"model delivered before identity callback is retained and enabled");
String next="gF2KuOJLEQE";VideoInformation.id=next;LyricsRepository.id=next;entry.trackChanged(next);LyricsEntryButton.captureIdentity(owner,next);Handler.drain();check(LyricsEntryButton.originalModel(owner)==null,"track change clears previous recording model");LyricsEntryButton.captureModel(owner,original,original);check(LyricsEntryButton.originalModel(owner)==null&&LyricsEntryButton.rewrite(owner,original)==original,"late previous recording model cannot enable next recording");byte[] nextModel=other(original,id,next);LyricsEntryButton.captureModel(owner,nextModel,nextModel);entry.update(activity,next);check(enabled(rendered)&&LyricsEntryButton.originalModel(owner)==nextModel,"current recording result and model use genuine native action");
LyricsRepository.id="";check(!enabled(LyricsEntryButton.rewrite(owner,nextModel)),"cleared repository cannot replay stale availability");LyricsRepository.id=next;Settings.LYRICS_ENABLED.value=false;entry.hideButton();check(rendered==nextModel,"disable restores unmodified native model");Settings.LYRICS_ENABLED.value=true;entry.update(activity,next);check(enabled(rendered),"reenable restores current native availability");
Files.writeString(Path.of(args[1]),"{\"passed\":true,\"checks\":"+checks+",\"nativeReplayBoundarySimulated\":true,\"phoneVerified\":false}");}}
'''}
files=[]
for n,text in s.items():
 p=w/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');files.append(p)
root=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics';actual=[root/n for n in ['LyricsEntryButton.java','ProtoWire.java','NativeActionModel.java','NativePanelWire.java']]
for p in actual:
 if p.name=='LyricsEntryButton.java':
  dest=w/p.name;dest.write_text(p.read_text(encoding='utf-8').replace('private static void refreshNative(Object owner){}','private static void refreshNative(Object owner){EntryCheck.replay(owner);}'),encoding='utf-8');files.append(dest)
 else:files.append(p)
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-cp',str(out),'app.bdcrusher.ytmusic.lyrics.EntryCheck',str(h/'Inputs/native-video-actionbar-element.pb'),str(w/'verification.json')],cwd=w,env=env,check=True)
report=json.loads((w/'verification.json').read_text(encoding='utf-8'));report['sourceSha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};(w/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
