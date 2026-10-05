#!/usr/bin/env python3
"""Exercise the production loopback relay with a local file-backed SAF stand-in."""
import os,pathlib,subprocess,tempfile
ROOT=pathlib.Path(__file__).resolve().parents[2]
JAVAC=pathlib.Path(os.environ.get('JAVA_HOME','/workspace/scratch/48be16aedc6f/tools/jdk-21.0.12.1+1'))/'bin/javac'
JAVA=JAVAC.with_name('java')
with tempfile.TemporaryDirectory() as d:
 p=pathlib.Path(d)
 sources={
 'android/net/Uri.java':'''package android.net;import java.io.*;import java.net.*;public class Uri {String v;Uri(String s){v=s;}public static Uri parse(String s){return new Uri(s);}public String getPath(){return URI.create(v).getPath();}public String toString(){return v;}public static Uri fromFile(File f){return new Uri(f.toURI().toString());}public static String encode(String s){try{return URLEncoder.encode(s,"UTF-8").replace("+","%20");}catch(Exception e){throw new RuntimeException(e);}}public static String decode(String s){try{return URLDecoder.decode(s,"UTF-8");}catch(Exception e){throw new RuntimeException(e);}}}''',
 'android/util/Log.java':'package android.util;public class Log{public static int w(String t,String s){return 0;}}',
 'android/media/MediaPlayer.java':'package android.media;public class MediaPlayer{public void setDataSource(String s)throws java.io.IOException{}}',
 'e/e/a/CacheFolders.java':'''package e.e.a;import java.io.*;class CacheFolders{static File disk;static boolean virtual(File f){return f.getPath().startsWith("/@nicoid-cache/");}static File real(File f){return new File(disk,f.getName());}static String mime(String n){return n.endsWith(".m3u8")?"application/vnd.apple.mpegurl":"application/octet-stream";}}''',
 'e/e/a/CacheFile.java':'''package e.e.a;import java.io.*;class CacheFile extends File{CacheFile(String s){super(s);}CacheFile(String p,String c){super(p,c);}public boolean isFile(){return CacheFolders.real(this).isFile();}public long length(){return CacheFolders.real(this).length();}}''',
 'e/e/a/CacheInputStream.java':'''package e.e.a;import java.io.*;class CacheInputStream extends FileInputStream{CacheInputStream(File f)throws IOException{super(CacheFolders.real(f));}}''',
 'e/e/a/RelayTest.java':r'''package e.e.a;import java.io.*;import java.net.*;import java.nio.file.*;import java.util.*;public class RelayTest{
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);}
 static HttpURLConnection open(String u,String range,String method)throws Exception{HttpURLConnection c=(HttpURLConnection)new URL(u).openConnection();c.setRequestMethod(method);if(range!=null)c.setRequestProperty("Range",range);c.setConnectTimeout(2000);c.setReadTimeout(2000);return c;}
 public static void main(String[] args)throws Exception{CacheFolders.disk=new File(args[0]);Files.write(new File(CacheFolders.disk,"video.m3u8").toPath(),"#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"key.bin\"\nsegment.m4s\n".getBytes("UTF-8"));Files.write(new File(CacheFolders.disk,"segment.m4s").toPath(),"0123456789".getBytes("UTF-8"));Files.write(new File(CacheFolders.disk,"key.bin").toPath(),new byte[16]);
 String url=CachePlayback.url("/@nicoid-cache/tree/nicoid/nicoid_cache/video.m3u8");check(url.startsWith("http://127.0.0.1:"),"loopback");HttpURLConnection c=open(url,null,"GET");check(c.getResponseCode()==200&&c.getContentType().contains("mpegurl"),"playlist MIME");String list=new String(c.getInputStream().readAllBytes(),"UTF-8");check(list.contains("segment.m4s"),"HLS unchanged");String seg=new URL(new URL(url),"segment.m4s").toString();c=open(seg,"bytes=2-5","GET");check(c.getResponseCode()==206&&"bytes 2-5/10".equals(c.getHeaderField("Content-Range"))&&new String(c.getInputStream().readAllBytes(),"UTF-8").equals("2345"),"range data");
 c=open(seg,"bytes=-3","GET");check(new String(c.getInputStream().readAllBytes(),"UTF-8").equals("789"),"suffix");check(open(seg,"bytes=99-","GET").getResponseCode()==416,"bad range");c=open(seg,null,"HEAD");check(c.getResponseCode()==200&&c.getContentLength()==10&&c.getInputStream().read()==-1,"HEAD");check(open(new URL(new URL(url),"key.bin").toString(),null,"GET").getContentLength()==16,"relative key");check(open(seg+"/extra",null,"GET").getResponseCode()==404,"nested URI rejected");check(open(seg.replace("segment.m4s","%2e%2e%2fsecret"),null,"GET").getResponseCode()==404,"traversal");check(open(seg.replaceFirst("/[0-9a-f-]{36}/","/wrong/"),null,"GET").getResponseCode()==404,"token required");check(open(seg,null,"POST").getResponseCode()==405,"read only");check(CachePlayback.fromFile(new File("/tmp/normal")).toString().startsWith("file:"),"ordinary file URI");check(CachePlayback.url("https://example.com/video").equals("https://example.com/video"),"online passthrough");System.out.println("Cache relay: 13 functional checks passed");}}
'''
 }
 for name,text in sources.items():f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(text)
 actual=ROOT/'extensions/extension/src/main/java/e/e/a/CachePlayback.java'
 subprocess.run([str(JAVAC),'-d',str(p),*map(str,p.rglob('*.java')),str(actual)],check=True)
 disk=p/'files';disk.mkdir();subprocess.run([str(JAVA),'-cp',str(p),'e.e.a.RelayTest',str(disk)],check=True)
