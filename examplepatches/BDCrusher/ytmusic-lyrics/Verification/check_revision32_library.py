"""Run the actual durable library and quality evaluator, with only Android storage boundaries simulated."""
from pathlib import Path
import hashlib,json,os,subprocess
home=Path(__file__).resolve().parents[1];work=home/'Verification/revision32-library-r4';work.mkdir(exist_ok=False)
stubs={
'android/content/Context.java':'''package android.content;public class Context{public static java.io.File root;public Context getApplicationContext(){return this;}public java.io.File getCacheDir(){return new java.io.File(root,"cache");}public java.io.File getFilesDir(){return root;}}''',
'android/content/SharedPreferences.java':'''package android.content;public class SharedPreferences{public static String policy="quality";public String getString(String key,String def){return policy;}}''',
'android/os/Looper.java':'''package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}''',
'android/os/Handler.java':'''package android.os;public class Handler{public Handler(Looper l){}public void post(Runnable r){r.run();}}''',
'android/util/AtomicFile.java':'''package android.util;import java.io.*;public class AtomicFile{final File f;public static boolean fail;public AtomicFile(File f){this.f=f;}public byte[] readFully()throws IOException{File backup=new File(f+".bak");if(backup.exists())java.nio.file.Files.move(backup.toPath(),f.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING);return java.nio.file.Files.readAllBytes(f.toPath());}public FileOutputStream startWrite()throws IOException{if(fail)throw new IOException("fixture failure");return new FileOutputStream(new File(f+".new"));}public void finishWrite(FileOutputStream s)throws IOException{s.close();java.nio.file.Files.move(new File(f+".new").toPath(),f.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING);}public void failWrite(FileOutputStream s){try{if(s!=null)s.close();new File(f+".new").delete();}catch(Exception ignored){}}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsConfig.java':'''package app.bdcrusher.ytmusic.lyrics;import org.json.*;class LyricsConfig{static android.content.SharedPreferences preferences(android.content.Context c){return new android.content.SharedPreferences();}static JSONArray order(android.content.Context c){return new JSONArray().put("bLyrics-richsynced").put("unison-richsynced").put("yt-captions").put("lrclib-synced").put("lrclib-plain");}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsDiagnostics.java':'''package app.bdcrusher.ytmusic.lyrics;class LyricsDiagnostics{static int failures;static void record(String a,String b){failures++;}}''',
'app/bdcrusher/ytmusic/lyrics/LibraryCheck.java':r'''package app.bdcrusher.ytmusic.lyrics;
import org.json.*;import java.io.*;import java.nio.file.*;import java.util.concurrent.*;
public class LibraryCheck{
 static int checks;static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 static JSONObject payload(String key,String format,String raw)throws Exception{return new JSONObject().put("key",key).put("format",format).put("raw",raw);}
 static void flush()throws Exception{var field=LyricsLibrary.class.getDeclaredField("io");field.setAccessible(true);((ExecutorService)field.get(null)).submit(()->{}).get(5,TimeUnit.SECONDS);}
 static JSONObject normalized(String key,String a,String b)throws Exception{
  JSONArray parts=new JSONArray().put(new JSONObject().put("words",a).put("startTimeMs",1000).put("durationMs",500).put("isBackground",true)).put(new JSONObject().put("words",b).put("startTimeMs",1500).put("durationMs",500));
  JSONObject line=new JSONObject().put("words",a+b).put("startTimeMs",1000).put("durationMs",1000).put("agent","v2").put("translations",new JSONObject().put("fr","fixture")).put("parts",parts);
  return new JSONObject().put("kind","cachedResult").put("key",key).put("result",new JSONObject().put("lyrics",new JSONArray().put(line)).put("credits",new JSONArray().put("Fixture author")));
 }

 public static void main(String[] args)throws Exception{
  android.content.Context.root=Path.of(args[0]).toFile();android.content.Context.root.mkdirs();var c=new android.content.Context();var lib=new LyricsLibrary(c);String id="sN_tJ8d3c0I";
  check(LyricQuality.raw("<html>bad</html>","ttml")==-1,"HTML cannot masquerade as TTML");
  check(LyricQuality.raw("<!DOCTYPE tt [<!ENTITY a SYSTEM 'file:///x'>]><tt><body><p>&a;</p></body></tt>","ttml")==-1,"TTML external declarations are rejected");
  check(LyricQuality.raw("<tt><body><p begin='bad' end='worse'>fixture</p></body></tt>","ttml")==0,"invalid timing is never promoted");
  check(LyricQuality.raw("<tt><body><p begin='1s' end='2s'>fixture</p></body></tt>","ttml")==1,"actual timed TTML line classified as line");
  check(LyricQuality.raw("<tt><body><p begin='1s' end='2s'><span begin='1s' end='1.5s'>Hel</span><span begin='1.5s' end='2s'>lo</span></p></body></tt>","ttml")==3,"within-word timed spans classified as syllable");
  check(LyricQuality.raw("<tt><body><p begin='1s' end='2s'><span begin='1s' end='1.5s'>Hello </span><span begin='1.5s' end='2s'>world</span></p></body></tt>","ttml")==2,"separated timed words classified as word");
  check(LyricQuality.raw("not richsync","richsync")==-1&&LyricQuality.raw("broken","qrc")==-1,"malformed rich formats cannot displace saved lyrics");
  check(LyricQuality.raw("[00:01.50]Fixture","lrc")==1&&LyricQuality.raw("[ar:Fixture]","lrc")==-1,"only actual LRC text timing counts");
  check(LyricQuality.time("01:02:03.5")==3723500&&LyricQuality.time("120ms")==120&&Double.isNaN(LyricQuality.time("NaN")),"clock formats and invalid numbers checked");
  var plain=payload("lrclib-plain","plain","Fixture plain");lib.offer(id,plain);flush();check(lib.get(id).toString().equals(plain.toString()),"plain lyric is retained through fresh library instance");
  var line=payload("lrclib-synced","lrc","[00:01]Fixture line");lib.offer(id,line);flush();check(lib.get(id).getString("key").equals("lrclib-synced"),"line replaces plain");
  var word=normalized("bLyrics-richsynced","Hello ","world");var syllable=normalized("unison-richsynced","Hel","lo");
  lib.offer(id,word);flush();check(LyricsLibrary.candidate(lib.get(id)).quality()==2,"advertised rich label does not invent syllable timing");
  lib.offer(id,syllable);flush();check(lib.get(id).getString("key").equals("unison-richsynced"),"syllable outranks higher-priority word under default policy");
  lib.offer(id,plain);lib.offer(id,payload("bLyrics-richsynced","ttml","<html>broken</html>"));flush();check(lib.get(id).toString().equals(syllable.toString()),"weaker and malformed responses never erase the winner");
  check(new LyricsLibrary(c).get(id).getJSONObject("result").getJSONArray("lyrics").getJSONObject(0).getString("agent").equals("v2"),"agents survive offline rich-data round trip");
  check(lib.get(id).getJSONObject("result").getJSONArray("lyrics").getJSONObject(0).getJSONObject("translations").getString("fr").equals("fixture"),"translations survive rich-data round trip");
  check(lib.get(id).getJSONObject("result").getJSONArray("lyrics").getJSONObject(0).getJSONArray("parts").getJSONObject(0).getBoolean("isBackground"),"background vocals survive rich-data round trip");
  android.content.SharedPreferences.policy="source";lib.offer(id,word);flush();check(lib.get(id).getString("key").equals("bLyrics-richsynced"),"source-first policy is separate from timing policy");
  var refreshed=normalized("bLyrics-richsynced","Hello ","again");lib.offer(id,refreshed);flush();check(lib.get(id).toString().equals(refreshed.toString()),"same winning variant can refresh atomically");
  android.util.AtomicFile.fail=true;lib.offer("MYal8NoVQXs",plain);flush();check(lib.get("MYal8NoVQXs")==null&&LyricsDiagnostics.failures>0,"storage failure is diagnosed and cannot corrupt a winner");android.util.AtomicFile.fail=false;
  var files=new File(android.content.Context.root,"bdcrusher-lyrics-library-v2").listFiles();check(files.length==1,"exactly one payload file per recording");
  var envelope=new JSONObject(Files.readString(files[0].toPath()));envelope.put("saved",1);Files.writeString(files[0].toPath(),envelope.toString());check(new LyricsLibrary(c).get(id)!=null,"saved lyrics never expire");
  Files.copy(files[0].toPath(),Path.of(files[0]+".bak"));Files.writeString(files[0].toPath(),"partial");check(lib.get(id)!=null,"interrupted atomic write recovers the last good record");
  lib.offer("../outside",plain);flush();check(files[0].getParentFile().listFiles().length==1,"unsafe recording identities cannot write elsewhere");
  check(lib.stats().getInt("songs")==1&&lib.stats().getLong("bytes")>0,"storage statistics use actual owned bytes and counts");

  String ttml="<tt><body><p begin='1s' end='2s'><span begin='1s' end='1.5s'>Hel</span><span begin='1.5s' end='2s'>lo</span></p></body></tt>";
  String[] keys={"bLyrics-richsynced","unison-richsynced","binimum-richsynced","unison-wordsynced","portato-richsynced","musixmatch-richsync","bLyrics-synced","unison-synced","yt-captions","binimum-synced","lrclib-synced","legato-synced","musixmatch-synced","yt-lyrics","unison-plain","lrclib-plain"};
  for(int i=0;i<keys.length;i++){String recording=String.format("fixture%04d",i);JSONObject value;
   if(keys[i].contains("richsynced"))value=payload(keys[i],"ttml",ttml);
   else if(keys[i].contains("wordsynced")||keys[i].equals("musixmatch-richsync"))value=payload(keys[i],"lrc","[00:01]<00:01>Hello <00:02>world<00:03>");
   else value=payload(keys[i],keys[i].endsWith("plain")||keys[i].equals("yt-lyrics")?"plain":"lrc",keys[i].endsWith("plain")||keys[i].equals("yt-lyrics")?"Fixture plain":"[00:01]Fixture line");
   lib.offer(recording,value);flush();check(lib.get(recording)!=null&&lib.get(recording).getString("key").equals(keys[i]),"permanent round trip accepts variant "+keys[i]);
  }
  JSONObject qq=new JSONObject().put("event","provider").put("data",new JSONObject().put("provider","qq").put("results",new JSONObject().put("lyrics",new JSONObject().put("lyrics","[1000,3000]A(1000,500) quiet(1500,1000) start(2500,1500)").toString())));
  lib.offer("broker00001",qq);flush();check(lib.get("broker00001").getString("key").equals("portato-richsynced"),"QQ JSON envelope is decoded before caching");
  JSONObject kugou=new JSONObject().put("event","provider").put("data",new JSONObject().put("provider","kugou").put("results",new JSONObject().put("lyrics",new JSONObject().put("lyrics","[00:01]Legato fixture").toString())));
  lib.offer("broker00002",kugou);flush();check(lib.get("broker00002").getString("key").equals("legato-synced"),"KuGou JSON envelope is decoded before caching");
  JSONObject mx=new JSONObject().put("event","provider").put("data",new JSONObject().put("provider","musixmatch").put("results",new JSONObject().put("wordByWord","[00:01]<00:01>Hello <00:02>world<00:03>").put("synced","[00:01]Hello world")));
  lib.offer("broker00003",mx);flush();check(lib.get("broker00003").getString("key").equals("musixmatch-richsync")&&LyricsLibrary.candidate(lib.get("broker00003")).quality()==2,"Musixmatch enhanced LRC wins over line timing as in extension");
  JSONObject doubleTtml=new JSONObject().put("event","provider").put("data",new JSONObject().put("provider","golyrics").put("results",new JSONObject().put("lyrics",new JSONObject().put("ttml",ttml).toString())));
  lib.offer("broker00004",doubleTtml);flush();check(lib.get("broker00004").getString("key").equals("bLyrics-richsynced"),"double-encoded Better Lyrics TTML is retained");

  LyricsDiskCache legacy=new LyricsDiskCache(c);legacy.put("known-video-query|ttml",payload("bLyrics-richsynced","ttml",ttml));File old=new File(c.getCacheDir(),"bdcrusher-lyrics-v1").listFiles()[0];JSONObject oldEnvelope=new JSONObject(Files.readString(old.toPath())).put("saved",1);Files.writeString(old.toPath(),oldEnvelope.toString());
  check(legacy.get("known-video-query|ttml")==null&&legacy.migrate("known-video-query|ttml")!=null,"recognized positive legacy entry can migrate after its former TTL");lib.offer("legacy00001",legacy.migrate("known-video-query|ttml"));flush();check(lib.get("legacy00001")!=null,"legacy rich data enters permanent library through current validation");
  CountDownLatch done=new CountDownLatch(1);lib.clear(done::countDown);check(done.await(5,TimeUnit.SECONDS)&&lib.get(id)==null,"explicit clear removes only owned lyric records");check(!old.exists(),"explicit clearing also removes legacy entries so they cannot reappear offline");
  Files.writeString(Path.of(args[1]),new JSONObject().put("checks",checks).put("passed",true).put("androidBoundarySimulated",true).toString(2));System.exit(0);
 }
}'''
}
files=[]
for name,content in stubs.items():
 p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
src=home/'Personal-Patches/extensions/music/src/main/java';actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ['LyricsLibrary.java','LyricQuality.java','LyricsDiskCache.java']];files+=actual
jar=next((home/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));xml=next((home/'BuildCache').glob('**/net.sf.kxml/kxml2/2.3.0/*/kxml2-2.3.0.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=work/'classes';out.mkdir()
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'));cp=os.pathsep.join(map(str,[out,jar,xml]))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=work,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.lyrics.LibraryCheck',str(work/'data'),str(work/'verification.json')],cwd=work,env=env,check=True)
report=json.loads((work/'verification.json').read_text());report['sourceSha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};(work/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
