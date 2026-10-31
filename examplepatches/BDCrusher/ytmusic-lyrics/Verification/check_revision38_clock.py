"""Actual timestamped personal clock with Android time/media boundaries simulated."""
from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];work=h/'Verification/revision38/clock';assert not work.exists();work.mkdir()
stubs={'app/bdcrusher/ytmusic/lyrics/LyricsDiagnostics.java':'package app.bdcrusher.ytmusic.lyrics;class LyricsDiagnostics{static void record(String s,String m){}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now=1000;public static long elapsedRealtime(){return now;}}',
'android/media/session/PlaybackState.java':'package android.media.session;public record PlaybackState(long position,long timestamp,float speed,int state){public static final int STATE_PLAYING=3;public long getPosition(){return position;}public long getLastPositionUpdateTime(){return timestamp;}public float getPlaybackSpeed(){return speed;}public int getState(){return state;}}',
'app/morphe/extension/music/shared/VideoInformation.java':'package app.morphe.extension.music.shared;public class VideoInformation{public static String id="first";public static String getVideoId(){return id;}}',
'app/bdcrusher/ytmusic/lyrics/NativeClockCheck.java':r'''package app.bdcrusher.ytmusic.lyrics;
import android.media.session.PlaybackState;import android.os.SystemClock;import app.morphe.extension.music.shared.VideoInformation;
public class NativeClockCheck{
 static int checks;static void check(boolean b,String m){if(!b)throw new AssertionError(m);checks++;System.out.println("PASS: "+m);}
 static long[] read(){return RendererPlayback.snapshot(VideoInformation.id,99,false,1);}
 static void sample(long p,long at,float speed,int state){RendererPlayback.sample(new PlaybackState(p,at,speed,state));}
 public static void main(String[] args)throws Exception{
  check(read()[0]==99,"before first native sample uses scoped fallback");
  SystemClock.now=1200;sample(10000,1000,1,3);check(read()[0]==10200,"delayed callback is aged from the native elapsedRealtime timestamp");
  long revision=read()[3];SystemClock.now=1400;check(read()[0]==10400,"position extrapolates continuously without another callback");
  sample(9000,900,1,3);check(read()[0]==10400&&read()[3]==revision,"out-of-order native snapshot cannot pull clock backward");
  sample(10200,1200,1,3);check(read()[0]==10400&&read()[3]==revision,"equivalent delayed sample does not create a seek revision");
  sample(10400,1400,0,2);check(read()[1]==0,"pause freezes clock and retains positive playback rate");
  SystemClock.now=2400;check(read()[0]==10400,"paused time does not advance");
  sample(10400,2400,1.5f,3);SystemClock.now=2600;check(read()[0]==10700&&Float.intBitsToFloat((int)read()[2])==1.5f,"resume uses actual playback rate");
  RendererPlayback.seek("first",5000);revision=read()[3];check(read()[0]==5000,"explicit backward seek is immediate");
  sample(11000,2500,1.5f,3);check(read()[0]==5000&&read()[3]==revision,"pre-seek callback cannot undo the requested seek");
  SystemClock.now=2700;sample(5150,2700,1.5f,3);check(read()[0]==5150&&read()[3]==revision,"post-seek native confirmation keeps the same revision");
  sample(60000,2700,1.5f,3);check(read()[3]>revision&&read()[0]==60000,"external discontinuity is an immediate revision");
  VideoInformation.id="second";check(read()[0]==99,"track change cannot reuse another recording clock");
  sample(1000,2700,1,3);check(read()[0]==1000,"new recording initializes its own native clock");
  sample(-1,2700,1,3);check(read()[0]==1000,"unknown native position cannot invalidate a good clock");
  sample(1500,99999,1,3);check(read()[0]==1500,"invalid future timestamp cannot extrapolate negative time");
  sample(2000,0,Float.NaN,3);check(read()[0]==2000&&Float.intBitsToFloat((int)read()[2])==1,"invalid native speed and missing timestamp use safe defaults");
  sample(2000,2700,1,6);SystemClock.now=3700;check(read()[0]==2000&&read()[1]==0,"buffering stops clock extrapolation");
  java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),"{\"passed\":true,\"checks\":"+checks+",\"androidSimulated\":true,\"phoneVerified\":false}");
 }
}'''
}
files=[]
for n,s in stubs.items():
    p=work/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
actual=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics/RendererPlayback.java';out=work/'classes';out.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin')
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(out),*map(str,files),str(actual)],env=env,check=True,cwd=work)
report=work/'verification.json';subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',str(out),'app.bdcrusher.ytmusic.lyrics.NativeClockCheck',str(report)],env=env,check=True,cwd=work)
d=json.loads(report.read_text(encoding='utf-8'));d['actualSourceSha256']={'RendererPlayback.java':hashlib.sha256(actual.read_bytes()).hexdigest()};report.write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')
