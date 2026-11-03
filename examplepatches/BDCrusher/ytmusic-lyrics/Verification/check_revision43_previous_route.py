"""Reproduce the actual absent-tag failure with exact published beta.4 router source."""
from pathlib import Path
import json,hashlib,zipfile,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision43/previous-route';w.mkdir(exist_ok=False);src=w/'src';src.mkdir();classes=w/'classes';classes.mkdir()
old=h/'Personal-Patches/dist/0.7.0-beta.4/ytmusic-lyrics-0.7.0-beta.4-source.zip'
base=h/'Verification/revision43/downloads-r8/src'
selected='app/morphe/extension/music/patches/DownloadsPatch.java'
files=[p for p in base.rglob('*.java') if p.name!='Check.java' and p.relative_to(base).as_posix()!=selected]
with zipfile.ZipFile(old) as z:
 b=z.read('Personal-Patches/extensions/music/src/main/java/'+selected)
 p=src/selected;p.parent.mkdir(parents=True);p.write_bytes(b);files.append(p)
p=src/'OldCheck.java';p.write_text('''import java.util.*;import app.bdcrusher.ytmusic.lyrics.ProtoWire;import app.morphe.extension.music.patches.DownloadsPatch;import app.morphe.extension.music.settings.Settings;import app.morphe.extension.shared.patches.DownloadMode;
public class OldCheck{
 static DownloadsPatch.ProtocolBufferFieldInterface command(byte[] b,String label){return new DownloadsPatch.ProtocolBufferFieldInterface(){public byte[] toByteArray(){return b;}public String toString(){return label;}};}
 public static void main(String[]a){Settings.DOWNLOAD_MODE.set(DownloadMode.IN_APP);byte[] action=ProtoWire.message(ProtoWire.blob(443434441,new byte[0]));
 Map<Object,Object> map=new HashMap<>();android.view.View opener=new android.view.View();opener.parent=android.app.Activity.decor;map.put("com.google.android.libraries.youtube.rendering.elements.sender_view",opener);
 if(!DownloadsPatch.commandResolverOnClick(command(action,"[443434441] {}"),map))throw new AssertionError("Expected beta.4 to consume the unresolved main click");
 if(!app.morphe.extension.shared.Utils.toast.contains("Could not identify"))throw new AssertionError("Expected identity error");
 byte[] menu=ProtoWire.message(ProtoWire.blob(98150882,ProtoWire.message(ProtoWire.blob(1,"zxhSyrjdnw8".getBytes(java.nio.charset.StandardCharsets.US_ASCII)))));
 DownloadsPatch.commandResolverOnClick(command(menu,"[98150882] {}"),map);
 map.put("com.google.android.libraries.youtube.rendering.elements.sender_view",new android.view.View());
 if(!DownloadsPatch.commandResolverOnClick(command(action,"[443434441] {}"),map))throw new AssertionError("Expected beta.4 to consume unresolved popup");
 if(app.morphe.extension.music.patches.downloads.LocalDownloadManager.calls!=0)throw new AssertionError("Old code unexpectedly used the menu's known recording");
 System.out.println("PASS: published beta.4 consumes both no-tag clicks without a download, including after a menu with a known recording ID");}}
''',encoding='utf-8');files.append(p)
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(classes),*map(str,files)],cwd=w,env=env,check=True)
r=subprocess.run([str(java/'java.exe'),'-cp',str(classes),'OldCheck'],cwd=w,env=env,check=True,capture_output=True,text=True)
(w/'result.json').write_text(json.dumps({'passed':True,'previousSourceArchiveSha256':hashlib.sha256(old.read_bytes()).hexdigest(),'routerSourceSha256':hashlib.sha256(b).hexdigest(),'stdout':r.stdout,'scope':'Exact published beta.4 router; UI/settings/downloader/native tag seams simulated, absent tag as in phone log. No device or media downloads.'},indent=2)+'\n',encoding='utf-8');print(r.stdout)
