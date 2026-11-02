"""Reproduce the missed empty-action path using exact published beta.3 source."""
from pathlib import Path
import json,hashlib,zipfile,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision42/previous-route-r2';w.mkdir(exist_ok=False);src=w/'src';src.mkdir();classes=w/'classes';classes.mkdir();old=h/'Personal-Patches/dist/0.7.0-beta.3/ytmusic-lyrics-0.7.0-beta.3-source.zip';prev=json.loads((h/'Personal-Patches/dist/0.7.0-beta.3/verification.json').read_text(encoding='utf-8'))
selected=['app/morphe/extension/music/patches/DownloadsPatch.java','app/bdcrusher/ytmusic/playlists/DownloadCommand.java'];files=[p for p in (h/'Verification/revision42/downloads/src').rglob('*.java') if p.name!='Check.java' and p.relative_to(h/'Verification/revision42/downloads/src').as_posix() not in selected]
with zipfile.ZipFile(old) as z:
 for name in selected:
  b=z.read('Personal-Patches/extensions/music/src/main/java/'+name)
  if name.endswith('/DownloadsPatch.java'):
   compiled=h/'Verification/revision41/downloads-r2/src'/name;assert hashlib.sha256(compiled.read_bytes()).hexdigest()==prev['fullNativeModifiedSourceSha256']['extensions/music/src/main/java/'+name];assert b.decode('utf-8').replace('\r\n','\n')==compiled.read_text(encoding='utf-8')
  p=src/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(b);files.append(p)
p=src/'OldCheck.java';p.write_text('''import java.util.*;import app.bdcrusher.ytmusic.lyrics.ProtoWire;import app.morphe.extension.music.patches.DownloadsPatch;import app.morphe.extension.music.settings.Settings;import app.morphe.extension.shared.patches.DownloadMode;
public class OldCheck{public static void main(String[]a){Settings.DOWNLOAD_MODE.set(DownloadMode.EXTERNAL);byte[] command=ProtoWire.message(ProtoWire.blob(94476261,new byte[0]),ProtoWire.blob(443434441,new byte[0]));Map<Object,Object> map=new HashMap<>();map.put("com.google.android.libraries.youtube.rendering.elements.sender_view",new android.view.View());map.put("com.google.android.libraries.youtube.innertube.endpoint.tag",new fixture.NativeTag("MYal8NoVQXs",null));var c=new DownloadsPatch.ProtocolBufferFieldInterface(){public byte[] toByteArray(){return command;}public String toString(){return "[443434441] {}";}};if(DownloadsPatch.commandResolverOnClick(c,map))throw new AssertionError("old path unexpectedly handled the empty native command");if(app.morphe.extension.shared.settings.preference.ExternalDownloaderPreference.calls!=0)throw new AssertionError("old path unexpectedly handed off");System.out.println("PASS: published beta.3 reproduces native fallback for the empty tagged download action");}}
''',encoding='utf-8');files.append(p)
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(classes),*map(str,files)],cwd=w,env=env,check=True)
r=subprocess.run([str(java/'java.exe'),'-cp',str(classes),'OldCheck'],cwd=w,env=env,check=True,capture_output=True,text=True)
(w/'result.json').write_text(json.dumps({'passed':True,'previousSourceArchiveSha256':hashlib.sha256(old.read_bytes()).hexdigest(),'stdout':r.stdout,'scope':'Exact published source; Android/UI/native tag simulated. Reproduces old return-to-native; not a device run.'},indent=2)+'\n',encoding='utf-8');print(r.stdout)
