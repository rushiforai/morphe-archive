"""Actual Opus selection/estimation against generated production protobuf classes; no network/media downloads."""
from pathlib import Path
import subprocess,os,json,hashlib
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision44/media-policy';w.mkdir(exist_ok=False)
root=h/'Personal-Patches/extensions/music/src/main/java';actual=[root/"app/bdcrusher/ytmusic/playlists"/(n+".java") for n in ["AudioQuality","MediaSelection","RangeResume"]]+[root/"app/bdcrusher/ytmusic/lyrics/ProtoWire.java"]
proto=h/'Personal-Patches/extensions/shared-youtube/library/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes'
jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/com.google.protobuf/protobuf-javalite').glob('*/*/*.jar'))
source=w/'QualityCheck.java';source.write_text('''import app.bdcrusher.ytmusic.playlists.*;
import java.io.*;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import java.util.*;
public class QualityCheck {
 static int checks;static void check(boolean value){checks++;if(!value)throw new AssertionError("check "+checks);}
 static Format f(int itag,String mime,int rate,long size){return Format.newBuilder().setItag(itag).setUrl("https://fixture.invalid/audio").setMimeType(mime).setBitrate(rate).setContentLength(size).build();}
 public static void main(String[] args)throws Exception{
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
  var v720=f(247,"video/webm; codecs=vp9",1000000,20000000).toBuilder().setWidth(1280).setHeight(720).build();
  var v1080=f(248,"video/webm; codecs=vp9",2000000,40000000).toBuilder().setWidth(1920).setHeight(1080).build();
  var v2160=f(313,"video/webm; codecs=vp9",8000000,160000000).toBuilder().setWidth(3840).setHeight(2160).build();
  var all=List.of(mid,v2160,v720,v1080);
  var selection=new MediaSelection(MediaSelection.Kind.VIDEO,AudioQuality.Tier.HIGH,1080);
  check(selection.chooseVideo(all,x->true).getItag()==248);
  check(selection.chooseVideo(List.of(mid,v720),x->true).getItag()==247);
  check(selection.chooseVideo(all,x->x.getHeight()<=720).getItag()==247);
  check(selection.chooseVideo(List.of(mid),x->true)==null);
  check(selection.estimate(all,200,x->true)==44000000);
  check(selection.estimateBatch(all,1000,x->true)==258000000);
  check(MediaSelection.audio(AudioQuality.Tier.HIGH).estimateBatch(all,1000,x->true)==8000000);
  check(selection.estimateBatch(all,0,x->true)==-1);
  check(selection.estimate(List.of(mid),200,x->true)==4000000);
  check(MediaSelection.videos(List.of(v720,v720.toBuilder().setItag(999).setBitrate(500000).build(),v1080),x->true).size()==2);
  check(MediaSelection.width(v1080)==1920&&MediaSelection.height(v1080)==1080);
  check(!MediaSelection.video(v1080.toBuilder().setUrl("").build()));
  var resume=new RangeResume(1003,4,"251:opus");check(resume.completed()==0);
  resume.advance(0,100);resume.advance(1,400);check(resume.completed()==249);
  var restored=RangeResume.read(new ByteArrayInputStream(resume.bytes()),1003,4,"251:opus");check(restored.position(0)==100&&restored.position(1)==400&&restored.position(2)==502);
  restored.advance(0,251);restored.advance(1,502);restored.advance(2,753);restored.advance(3,1003);check(restored.completed()==1003);
  for(int cut:new int[]{0,3,12,resume.bytes().length-1}){boolean rejected=false;try{RangeResume.read(new ByteArrayInputStream(Arrays.copyOf(resume.bytes(),cut)),1003,4,"251:opus");}catch(IOException invalid){rejected=true;}check(rejected);}
  for(String changed:List.of("250:opus","251:aac")){boolean rejected=false;try{RangeResume.read(new ByteArrayInputStream(resume.bytes()),1003,4,changed);}catch(IOException invalid){rejected=true;}check(rejected);}
  boolean rejected=false;try{resume.advance(0,252);}catch(IllegalArgumentException invalid){rejected=true;}check(rejected);
  rejected=false;try{resume.advance(0,99);}catch(IllegalArgumentException invalid){rejected=true;}check(rejected);
  var tiny=new RangeResume(1,4,"tiny");tiny.advance(0,1);check(tiny.completed()==1&&tiny.position(3)>tiny.end(3));
  System.out.println("PASS "+checks+" actual Opus-policy checks");
 }
}''',encoding='utf-8')
classes=w/'classes';classes.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin')
cp=os.pathsep.join(map(str,[classes,proto,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(classes),*map(str,actual),str(source)],env=env,cwd=w,check=True)
run=subprocess.run([str(java/'java.exe'),'-cp',cp,'QualityCheck'],env=env,cwd=w,check=True,text=True,capture_output=True)
(w/'result.json').write_text(json.dumps({'stdout':run.stdout,'sources':{str(p.relative_to(h)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual},'scope':'actual pure policy + production generated protobuf; no Android/native media/phone/network execution'},indent=2),encoding='utf-8');print(run.stdout)
