"""Actual local-byte transport/range code; simulated Android/JNI boundary, no media download."""
from pathlib import Path
import subprocess, os, json, hashlib,sys
h=Path(__file__).resolve().parents[1]; w=h/'Verification/revision40'/('transport'+(sys.argv[1] if len(sys.argv)>1 else '')); w.mkdir(exist_ok=False)
root=h/'Personal-Patches/extensions/music/src/main/java'; pkg='app/bdcrusher/ytmusic/playlists/'
sources={
'app/bdcrusher/ytmusic/common/FeatureDiagnostics.java':'package app.bdcrusher.ytmusic.common;public class FeatureDiagnostics {public static void record(String a,String b){}}',
pkg+'LocalAudio.java':'''package app.bdcrusher.ytmusic.playlists;public class LocalAudio {record Source(java.io.File file){long length(){return file.length();}String mime(){return "audio/webm";}java.io.FileInputStream open()throws java.io.IOException{return new java.io.FileInputStream(file);}}static Source source(String id){var f=PlaylistRuntime.audio(id);return f==null?null:new Source(f);}}''',
'android/net/Uri.java':'''package android.net; public class Uri {java.net.URI u;Uri(String s){u=java.net.URI.create(s);}public static Uri parse(String s){return new Uri(s);}public String getQueryParameter(String k){String q=u.getRawQuery();if(q!=null)for(String p:q.split("&")){String[] v=p.split("=",2);if(v[0].equals(k))return v.length==2?java.net.URLDecoder.decode(v[1],java.nio.charset.StandardCharsets.UTF_8):"";}return null;}}''',
pkg+'LocalPlayback.java':'''package app.bdcrusher.ytmusic.playlists;public class LocalPlayback {public static final String ORIGIN="https://bdcrusher-offline.invalid/audio/";public static byte[] response(String id){return PlaylistRuntime.audio(id)==null?null:new byte[]{1};}}''',
pkg+'PlaylistRuntime.java':'''package app.bdcrusher.ytmusic.playlists;public class PlaylistRuntime {public static java.io.File file;static java.io.File audio(String id){return id.equals("abcdefghijk")?file:null;}}''',
}
media='com/google/android/libraries/youtube/media/interfaces/'
stub=h/'Personal-Patches/extensions/youtube/stub/src/main/java'
for name in ['HttpMethod','NetFetch','NetFetchTask','NetFetchCallbacks']:
 sources[media+name+'.java']=(stub/(media+name+'.java')).read_text()
for name,code in {
'HttpRequest':'public class HttpRequest {String uri;HttpMethod method;java.util.ArrayList<HttpHeader> headers;public HttpRequest(String u,HttpMethod m,java.util.ArrayList<HttpHeader> h){uri=u;method=m;headers=h;}public String getUri(){return uri;}public HttpMethod getMethod(){return method;}public java.util.ArrayList<HttpHeader> getHeaders(){return headers;}}',
'HttpHeader':'public record HttpHeader(String key,String value){public String getKey(){return key;}public String getValue(){return value;}}',
'HttpResponse':'public record HttpResponse(int status,java.util.ArrayList<HttpHeader> headers){}',
'QoeError':'public record QoeError(String code,java.util.ArrayList<?> details){}',
}.items():sources[media+name+'.java']='package com.google.android.libraries.youtube.media.interfaces;'+code
band='com/google/android/apps/youtube/proto/streaming/BandwidthSamplingConfigOuterClass.java'
sources[band]=(stub/band).read_text()
sources[pkg+'TransportCheck.java']=r'''package app.bdcrusher.ytmusic.playlists;
import com.google.android.libraries.youtube.media.interfaces.*;import java.io.*;import java.nio.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;
public class TransportCheck {
 static int checks;static void check(boolean b){if(!b)throw new AssertionError("check "+checks);checks++;}
 static class Callback extends NetFetchCallbacks {
  CountDownLatch done=new CountDownLatch(1);int finishes;HttpResponse response;QoeError error;boolean cancelled,direct=true;ByteArrayOutputStream bytes=new ByteArrayOutputStream();NetFetchTask cancelTask;CountDownLatch bodyGate;
  public void onHttpResponse(HttpResponse r){response=r;}public void onRedirect(String s){throw new AssertionError();}
  public void onBodyData(ByteBuffer b){direct &= b.isDirect();byte[] data=new byte[b.remaining()];b.get(data);bytes.write(data,0,data.length);if(bodyGate!=null)try{bodyGate.await(2,TimeUnit.SECONDS);}catch(Exception e){throw new RuntimeException(e);}if(cancelTask!=null)cancelTask.cancel();}
  public synchronized void onDone(QoeError e,boolean c){finishes++;error=e;cancelled=c;done.countDown();}
  void await()throws Exception{check(done.await(5,TimeUnit.SECONDS));check(finishes==1);}
 }
 static Callback run(String suffix,HttpMethod method,String... ranges)throws Exception{var headers=new ArrayList<HttpHeader>();for(String r:ranges)headers.add(new HttpHeader("Range",r));Callback c=new Callback();check(LocalNetFetch.local(new HttpRequest(LocalPlayback.ORIGIN+"abcdefghijk"+suffix,method,headers),c)!=null);c.await();return c;}
 public static void main(String[] args)throws Exception{try{
  byte[] data=new byte[200000];for(int i=0;i<data.length;i++)data[i]=(byte)i;Path file=Path.of(args[0],"audio.webm");Files.write(file,data);PlaylistRuntime.file=file.toFile();
  check(AudioRange.parse(null,null,10).length()==10);check(AudioRange.parse("bytes=2-4",null,10).length()==3);
  check(AudioRange.parse("bytes=5-",null,10).start()==5);check(AudioRange.parse("bytes=-3",null,10).start()==7);
  check(AudioRange.parse("bytes=-99",null,10).length()==10);check(AudioRange.parse(null,"2-999",10).end()==9);
  check(AudioRange.parse("bytes=1-2","5-6",10).start()==1);check(!AudioRange.parse("bytes=10-",null,10).satisfiable());
  for(String invalid:List.of("bytes=4-2","bytes=-0","bytes=","bytes=1-2,4-5","bytes=999999999999999999999-","abc"))check(!AudioRange.parse(invalid,null,10).satisfiable());
  check(!AudioRange.parse(null,null,0).satisfiable());
  var full=run("",HttpMethod.GET);check(full.response.status()==200);check(Arrays.equals(data,full.bytes.toByteArray()));check(full.error==null&&full.direct&&!full.cancelled);
  var range=run("",HttpMethod.GET,"bytes=20-35");check(range.response.status()==206);check(Arrays.equals(Arrays.copyOfRange(data,20,36),range.bytes.toByteArray()));
  var query=run("?range=100-109",HttpMethod.GET);check(query.bytes.size()==10);check(query.bytes.toByteArray()[0]==data[100]);
  var head=run("",HttpMethod.HEAD);check(head.response.status()==200&&head.bytes.size()==0&&head.error==null);
  var bad=run("",HttpMethod.GET,"bytes=999999-");check(bad.response.status()==416&&bad.bytes.size()==0&&bad.error==null);
  var method=run("",HttpMethod.POST);check(method.response.status()==405&&method.bytes.size()==0);
  var multi=run("",HttpMethod.GET,"bytes=1-2","bytes=4-5");check(multi.error!=null&&multi.bytes.size()==0);
  check(LocalNetFetch.local(new HttpRequest("https://example.invalid/abcdefghijk",HttpMethod.GET,null),new Callback())==null);
  check(LocalNetFetch.local(new HttpRequest(LocalPlayback.ORIGIN+"../abcdefghijk",HttpMethod.GET,null),new Callback())==null);
  Callback cancel=new Callback();cancel.bodyGate=new CountDownLatch(1);cancel.cancelTask=LocalNetFetch.local(new HttpRequest(LocalPlayback.ORIGIN+"abcdefghijk",HttpMethod.GET,null),cancel);cancel.bodyGate.countDown();cancel.await();check(cancel.cancelled&&cancel.bytes.size()<data.length&&cancel.error==null);
  PlaylistRuntime.file=null;var missing=run("",HttpMethod.GET);check(missing.error!=null&&missing.bytes.size()==0);
  class Delegate extends NetFetch {int called;public NetFetchTask startFetchTask(HttpRequest r,NetFetchCallbacks c){called++;return null;}public void onDefaultNetworkAvailable(){called++;}public void onDefaultNetworkChange(int t){called++;}public void onDefaultNetworkUnavailable(){called++;}public void onProxySettingsChange(String h,int p){called++;}}
  Delegate d=new Delegate();NetFetch wrapper=LocalNetFetch.wrap(d);check(LocalNetFetch.wrap(wrapper)==wrapper);check(LocalNetFetch.wrap(null)==null);wrapper.startFetchTask(new HttpRequest("https://normal.invalid",HttpMethod.GET,null),new Callback());wrapper.onDefaultNetworkAvailable();wrapper.onDefaultNetworkChange(1);wrapper.onDefaultNetworkUnavailable();wrapper.onProxySettingsChange("",0);check(d.called==5);
  System.out.println("PASS "+checks+" actual byte-transport/range checks");
 }finally{var f=LocalNetFetch.class.getDeclaredField("IO");f.setAccessible(true);((ExecutorService)f.get(null)).shutdownNow();}}
}'''
paths=[]
for name,body in sources.items():
 p=w/'src'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,encoding='utf-8');paths.append(p)
actual=[root/(pkg+n+'.java') for n in ['AudioRange','LocalNetFetch']]
classes=w/'classes';classes.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin')
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(classes),*map(str,actual+paths)],cwd=w,env=env,check=True)
run=subprocess.run([str(java/'java.exe'),'-cp',str(classes),'app.bdcrusher.ytmusic.playlists.TransportCheck',str(w)],cwd=w,env=env,check=True,text=True,capture_output=True)
(w/'result.json').write_text(json.dumps({'stdout':run.stdout,'sources':{str(p.relative_to(h)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual},'scope':'actual production transport/range with simulated native callbacks and Android Uri; generated bytes only; no Android/JNI/device/network/media-download execution'},indent=2),encoding='utf-8');print(run.stdout)
