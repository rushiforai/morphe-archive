/* Copyright 2026 BDCrusher. GPL-3.0. Service protocol adapted from Shaders 1.5.1. */
package app.bdcrusher.ytmusic.shaders;
import android.content.*;import android.net.*;import android.os.*;import android.util.AtomicFile;
import org.json.*;import java.io.*;import java.net.*;import java.nio.charset.StandardCharsets;import java.security.MessageDigest;import java.util.*;import java.util.concurrent.*;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;
/** Metadata only. The native player streams artwork; no retained animation-file library. */
final class ArtworkRepository {
 static final String API="https://artwork.boidu.dev";
 static final ExecutorService io=Executors.newSingleThreadExecutor();
 private static final Map<String,List<Callback>> pending=new HashMap<>();private static boolean migrated;
 interface Callback{void result(String url,String key);}
 record Track(String id,String song,String artist,String album,int duration){}
 static SharedPreferences preferences(Context c){return c.getSharedPreferences("bdcrusher_shaders",0);}
 static File mediaDirectory(Context c){return new File(c.getCacheDir(),"bdcrusher-shaders-media");}
 static File metadataDirectory(Context c){return new File(c.getFilesDir(),"bdcrusher-shaders-art-metadata");}
 static File recordingsDirectory(Context c){return new File(c.getFilesDir(),"bdcrusher-shaders-recordings");}
 static String digest(String value)throws Exception{byte[] b=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));StringBuilder s=new StringBuilder();for(byte v:b)s.append(String.format(Locale.ROOT,"%02x",v&255));return s.toString();}
 static boolean validMedia(String value){try{URL u=new URL(value);return "https".equals(u.getProtocol())&&"mvod.itunes.apple.com".equals(u.getHost())&&u.getUserInfo()==null&&u.getPath().endsWith(".mp4");}catch(Exception e){return false;}}
 static void lookup(Context context,Track track,Callback callback){
  Context c=context.getApplicationContext();String album=track.album().isBlank()?"recording|"+track.id():track.artist()+"|"+track.album();
  synchronized(pending){if(pending.containsKey(album)){pending.get(album).add(callback);return;}List<Callback> list=new ArrayList<>();list.add(callback);pending.put(album,list);}
  io.execute(()->{String result=null,key="";
   try{migrate(c);key=digest(album);File meta=new File(metadataDirectory(c),key+".json");JSONObject data=read(meta);boolean fetched=false;ArtworkToken.ensure(c);
    boolean missing=data!=null&&data.optLong("notFoundAt",0)>0&&System.currentTimeMillis()-data.optLong("notFoundAt")<7L*24*60*60*1000;
    if(data==null||!missing&&!validMedia(data.optString("videoUrl"))){
     fetched=true;data=fetch(c,track.song(),track.artist(),track.album(),track.duration());
     if(!validMedia(data.optString("videoUrl"))){String song=normalizedTitle(track.song(),track.artist()),artist=track.artist().replaceFirst("(?i) - Topic$","");if(!song.equals(track.song())||!artist.equals(track.artist()))data=fetch(c,song,artist,track.album(),track.duration());}
     if(!validMedia(data.optString("videoUrl")))data.put("notFoundAt",System.currentTimeMillis());data.put("checkedAt",System.currentTimeMillis());write(meta,data);
    }
    if(validMedia(data.optString("videoUrl")))result=data.optString("videoUrl");
    if(track.id().matches("[A-Za-z0-9_-]{11}")){File record=new File(recordingsDirectory(c),track.id()+".json");JSONObject before=read(record);if(fetched||before==null||!key.equals(before.optString("albumKey"))||before.optBoolean("animated")!=(result!=null))write(record,new JSONObject().put("videoId",track.id()).put("title",track.song()).put("artist",track.artist()).put("album",track.album()).put("albumKey",key).put("animated",result!=null).put("checkedAt",System.currentTimeMillis()));}
    FeatureDiagnostics.event("Artwork-lookup",("recording="+track.id()+" cache="+(fetched?"network":missing?"not-found":"positive")+"; ")+(result==null?"No matching animated artwork; native still retained":"Animated artwork URL available; metadata only"));
   }catch(Exception e){FeatureDiagnostics.record("Artwork-lookup","Lookup failed: "+e.getClass().getSimpleName());}
   String url=result,identity=key;List<Callback> list;synchronized(pending){list=pending.remove(album);}if(list!=null)new Handler(Looper.getMainLooper()).post(()->{for(Callback cb:list)cb.result(url,identity);});
  });
 }
 private static JSONObject fetch(Context c,String title,String artist,String album,int duration)throws Exception{return request(API+"?s="+encode(title)+"&a="+encode(artist)+"&al="+encode(album)+"&d="+duration,"GET",null,ArtworkToken.usable(c));}
 private static String encode(String value)throws Exception{return URLEncoder.encode(value==null?"":value,"UTF-8");}
 static String normalizedTitle(String song,String artist){String value=song.replaceFirst("(?i)\\s*[\\[(](?:official[^)\\]]*|music video|lyrics?|audio|visuali[sz]er)[\\])]\\s*$","").trim();if(value.regionMatches(true,0,artist+" - ",0,artist.length()+3))value=value.substring(artist.length()+3);return value;}
 private static void migrate(Context c){if(migrated)return;migrated=true;File[] old=mediaDirectory(c).listFiles((d,n)->n.matches("[a-f0-9]{64}\\.mp4(?:\\.part)?(?:\\.normalize)?(?:\\.bak|\\.new)?"));int removed=0;if(old!=null)for(File f:old)if(f.delete())removed++;if(removed>0)FeatureDiagnostics.record("Artwork-storage","Removed "+removed+" legacy animation files; lookup records retained");}
 static void invalidate(Context c,String key){if(key==null||!key.matches("[a-f0-9]{64}"))return;io.execute(()->{File f=new File(metadataDirectory(c),key+".json");JSONObject data=read(f);if(data!=null)try{data.remove("videoUrl");data.remove("notFoundAt");write(f,data);}catch(Exception e){FeatureDiagnostics.record("Artwork-storage","Could not refresh artwork URL");}});}
 static void trim(Context c){io.execute(()->migrate(c));}
 static void clear(Context c,Runnable done){io.execute(()->{for(File dir:new File[]{metadataDirectory(c),recordingsDirectory(c)}){File[] files=dir.listFiles((d,n)->n.matches("(?:[a-f0-9]{64}|[A-Za-z0-9_-]{11})\\.json(?:\\.bak|\\.new)?"));if(files!=null)for(File f:files)f.delete();}new Handler(Looper.getMainLooper()).post(done);});}
    static JSONObject request(String value,String method,JSONObject body,String token)throws Exception{
        URL url=new URL(value);if(!"https".equals(url.getProtocol())||!"artwork.boidu.dev".equals(url.getHost()))throw new IOException("Unsupported artwork origin");
        HttpURLConnection connection=(HttpURLConnection)url.openConnection();connection.setConnectTimeout(8000);connection.setReadTimeout(18000);connection.setInstanceFollowRedirects(false);connection.setRequestMethod(method);
        connection.setRequestProperty("User-Agent","BDCrusher-YTMusic-Artwork/1.0");if(token!=null)connection.setRequestProperty("Authorization","Bearer "+token);
        try{if(body!=null){byte[] data=body.toString().getBytes(StandardCharsets.UTF_8);connection.setDoOutput(true);connection.setRequestProperty("Content-Type","application/json");connection.setFixedLengthStreamingMode(data.length);try(var out=connection.getOutputStream()){out.write(data);}}
            if(connection.getResponseCode()!=200)throw new IOException("Artwork HTTP "+connection.getResponseCode());
            try(var in=connection.getInputStream();var out=new ByteArrayOutputStream()){byte[] b=new byte[8192];int count,total=0;while((count=in.read(b))!=-1){total+=count;if(total>256*1024)throw new IOException("Artwork metadata limit");out.write(b,0,count);}return new JSONObject(out.toString("UTF-8"));}
        }finally{connection.disconnect();}
    }
    static JSONObject read(File file){try{if(!file.isFile()||file.length()>256*1024)return null;return new JSONObject(new String(new AtomicFile(file).readFully(),StandardCharsets.UTF_8));}catch(Exception absent){return null;}}
    static void write(File target,JSONObject data)throws IOException{
        File parent=target.getParentFile();if(!parent.isDirectory()&&!parent.mkdirs())throw new IOException("Artwork metadata storage unavailable");AtomicFile file=new AtomicFile(target);FileOutputStream out=null;
        try{out=file.startWrite();out.write(data.toString().getBytes(StandardCharsets.UTF_8));file.finishWrite(out);}catch(Exception ex){file.failWrite(out);throw new IOException("Artwork metadata write failed",ex);}
    }
}
