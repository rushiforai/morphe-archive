"""Actual Opus selection/estimation against generated production protobuf classes; no network/media downloads."""
from pathlib import Path
import subprocess,os,json,hashlib
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision40/quality';w.mkdir(exist_ok=False)
root=h/'Personal-Patches/extensions/music/src/main/java';actual=root/'app/bdcrusher/ytmusic/playlists/AudioQuality.java'
proto=h/'Personal-Patches/extensions/shared-youtube/library/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes'
jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/com.google.protobuf/protobuf-javalite').glob('*/*/*.jar'))
source=w/'QualityCheck.java';source.write_text('''import app.bdcrusher.ytmusic.playlists.AudioQuality;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import java.util.*;
public class QualityCheck {
 static int checks;static void check(boolean value){checks++;if(!value)throw new AssertionError("check "+checks);}
 static Format f(int itag,String mime,int rate,long size){return Format.newBuilder().setItag(itag).setUrl("https://fixture.invalid/audio").setMimeType(mime).setBitrate(rate).setContentLength(size).build();}
 public static void main(String[] args){
  var low=f(249,"audio/webm; codecs=\\"opus\\"",48000,0);var mid=f(250,"audio/webm; codecs=\\"opus\\"",64000,4000000);var high=f(251,"audio/webm; codecs=\\"opus\\"",160000,0);var aac=f(140,"audio/mp4; codecs=\\"mp4a.40.2\\"",256000,6000000);
  var formats=List.of(high,aac,low,mid);
  check(AudioQuality.select(formats,AudioQuality.Tier.HIGH).getItag()==251);
  check(AudioQuality.select(formats,AudioQuality.Tier.STANDARD).getItag()==250);
  check(AudioQuality.select(formats,AudioQuality.Tier.LOW).getItag()==250);
  check(AudioQuality.select(List.of(low),AudioQuality.Tier.HIGH).getItag()==249);
  check(AudioQuality.select(List.of(aac),AudioQuality.Tier.HIGH)==null);
  check(AudioQuality.select(List.of(),AudioQuality.Tier.HIGH)==null);
  check(!AudioQuality.opus(high.toBuilder().setUrl("").build()));
  check(!AudioQuality.opus(f(1,"video/webm; codecs=\\"opus\\"",100,0)));
  check(!AudioQuality.opus(f(1,"audio/ogg; codecs=\\"opus\\"",100,0)));
  check(AudioQuality.estimate(mid,200)==4000000);
  check(AudioQuality.estimate(high,200)==4000000);
  check(AudioQuality.estimate(high.toBuilder().setAverageBitrate(128000).build(),200)==3200000);
  check(AudioQuality.estimate(null,200)==-1);
  check(AudioQuality.estimate(high,0)==-1);
  check(AudioQuality.Tier.parse("bad")==AudioQuality.Tier.HIGH);
  check(AudioQuality.Tier.parse(null)==AudioQuality.Tier.HIGH);
  check(AudioQuality.select(List.of(high),AudioQuality.Tier.LOW)==high);
  System.out.println("PASS "+checks+" actual Opus-policy checks");
 }
}''',encoding='utf-8')
classes=w/'classes';classes.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin')
cp=os.pathsep.join(map(str,[classes,proto,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(classes),str(actual),str(source)],env=env,cwd=w,check=True)
run=subprocess.run([str(java/'java.exe'),'-cp',cp,'QualityCheck'],env=env,cwd=w,check=True,text=True,capture_output=True)
(w/'result.json').write_text(json.dumps({'checks':17,'stdout':run.stdout,'sourceSha256':hashlib.sha256(actual.read_bytes()).hexdigest(),'scope':'actual pure policy + production generated protobuf; no Android/native media/phone/network execution'},indent=2),encoding='utf-8');print(run.stdout)
