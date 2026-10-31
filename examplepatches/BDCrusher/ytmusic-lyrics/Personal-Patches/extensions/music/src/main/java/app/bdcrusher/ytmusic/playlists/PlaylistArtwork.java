/* Copyright 2026 BDCrusher. GPL-3.0. Static playlist artwork only; animated media is never retained here. */
package app.bdcrusher.ytmusic.playlists;

import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.*;
import android.net.*;
import android.util.AtomicFile;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;
import app.morphe.extension.shared.Utils;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Native image requests keep their normal loader, bounds and lifecycle, using an owned URI offline. */
public final class PlaylistArtwork {
    private static final ThreadPoolExecutor IO=new ThreadPoolExecutor(2,2,0,TimeUnit.SECONDS,new ArrayBlockingQueue<>(512));
    private static final Set<String> pending=ConcurrentHashMap.newKeySet();
    private static final Map<String,File> covers=new ConcurrentHashMap<>();
    private static volatile String authority;
    private static final Set<Integer> WRAPPERS=Set.of(9,10,58173949,1,58174010,4,49399797,175617300,3,13,361650780,2,153515154,172660663,168777401,5);
    private PlaylistArtwork(){}
    private static File directory(){return new File(Utils.getContext().getFilesDir(),"bdcrusher-playlist-artwork");}
    private static String hash(String text){try{StringBuilder out=new StringBuilder(64);for(byte b:MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8)))out.append(Character.forDigit((b>>4)&15,16)).append(Character.forDigit(b&15,16));return out.toString();}catch(Exception impossible){throw new AssertionError(impossible);}}
    private static String key(String url){
        try{URI uri=new URI(url);String host=uri.getHost();if(!"https".equals(uri.getScheme())||uri.getRawUserInfo()!=null||uri.getPort()!=-1||host==null)return null;
            if(!(host.equals("i.ytimg.com")||host.equals("yt3.googleusercontent.com")||host.equals("lh3.googleusercontent.com")||host.equals("yt3.ggpht.com")))return null;
            String path=uri.getRawPath();if(path==null)return null;
            if(host.endsWith("googleusercontent.com")||host.equals("yt3.ggpht.com")){int size=path.lastIndexOf('=');if(size>=0&&path.substring(size+1).matches("[whs][0-9][A-Za-z0-9_-]*"))path=path.substring(0,size);}
            return "https://"+host+path;
        }catch(Exception invalid){return null;}
    }
    private record Thumbnail(String url,int width){}
    private static Thumbnail thumbnail(byte[] bytes,int depth){
        if(depth>7)return null;ProtoWire proto;try{proto=new ProtoWire(bytes);}catch(IllegalArgumentException opaque){return null;}
        Thumbnail best=null;ProtoWire.Field url=null,width=null;for(ProtoWire.Field field:proto.fields){if(field.number==1&&url==null)url=field;if(field.number==2&&width==null)width=field;}
        if(url!=null&&url.wire==2){String text=new String(url.data,StandardCharsets.UTF_8);if(key(text)!=null)best=new Thumbnail(text,width!=null&&width.wire==0?(int)Math.min(4096,width.value):0);}
        for(ProtoWire.Field field:proto.fields)if(field.wire==2){Thumbnail child=thumbnail(field.data,depth+1);if(child!=null&&(best==null||child.width>best.width))best=child;}return best;
    }
    public static void retain(byte[] page,String playlist){if(PlaylistRuntime.tracked(playlist))walk(page,playlist,0,new int[]{0});}
    private static void walk(byte[] bytes,String playlist,int depth,int[] budget){
        if(depth>12||++budget[0]>40000)return;ProtoWire proto;try{proto=new ProtoWire(bytes);}catch(IllegalArgumentException opaque){return;}
        for(ProtoWire.Field field:proto.fields)if(field.wire==2)try{
            if(field.number==161429595){ProtoWire row=new ProtoWire(field.data);String id=new String(new ProtoWire(new ProtoWire(row.child(5)).child(48687757)).child(1),StandardCharsets.US_ASCII);if(id.matches("[A-Za-z0-9_-]{11}"))queue(id,thumbnail(row.child(1),0));}
            else if(field.number==373186255){ProtoWire model=new ProtoWire(field.data);String encoded=new String(model.child(7),StandardCharsets.UTF_8);String id=new String(new ProtoWire(android.util.Base64.decode(Uri.decode(encoded),android.util.Base64.URL_SAFE)).child(2),StandardCharsets.UTF_8);
                if(id.equals(playlist)){ProtoWire header=new ProtoWire(model.child(14));Thumbnail best=null;for(int n:new int[]{2,3}){ProtoWire.Field image=header.one(n);if(image!=null&&image.wire==2){Thumbnail t=thumbnail(image.data,0);if(t!=null&&(best==null||t.width>best.width))best=t;}}queue("p_"+hash(playlist),best);}}
            else if(WRAPPERS.contains(field.number))walk(field.data,playlist,depth+1,budget);
        }catch(IllegalArgumentException ignored){}
    }
    private static void queue(String id,Thumbnail image){
        if(image==null)return;
        try{metadata(id,image);}catch(Exception unavailable){return;}
        if(!online()||!pending.add(id))return;
        try{IO.execute(()->{try{save(id,image);}catch(Exception unavailable){FeatureDiagnostics.record("Playlist-artwork","Static artwork unavailable: "+unavailable.getClass().getSimpleName());}finally{pending.remove(id);}});}catch(RejectedExecutionException busy){pending.remove(id);}
    }
    private static void save(String id,Thumbnail image)throws Exception{
        String key=key(image.url);if(key==null)return;File dir=directory(),file=new File(dir,hash(key)+".jpg");if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("artwork directory");
        if(!file.isFile()){
            HttpURLConnection connection=(HttpURLConnection)new URL(image.url).openConnection();connection.setConnectTimeout(8000);connection.setReadTimeout(10000);connection.setInstanceFollowRedirects(false);connection.setRequestProperty("Accept","image/*");
            byte[] bytes;
            try{if(connection.getResponseCode()!=200)throw new IOException("artwork response");try(InputStream in=connection.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] buffer=new byte[8192];int size;while((size=in.read(buffer))!=-1){if(out.size()+size>4*1024*1024)throw new IOException("artwork size");out.write(buffer,0,size);}bytes=out.toByteArray();}}finally{connection.disconnect();}
            BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);if(options.outWidth<=0||options.outHeight<=0)throw new IOException("artwork format");options.inSampleSize=1;while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>512)options.inSampleSize*=2;options.inJustDecodeBounds=false;Bitmap bitmap=BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);if(bitmap==null)throw new IOException("artwork decode");
            try{synchronized(PlaylistArtwork.class){if(!file.isFile()){AtomicFile output=new AtomicFile(file);FileOutputStream stream=null;try{stream=output.startWrite();if(!bitmap.compress(Bitmap.CompressFormat.JPEG,85,stream))throw new IOException("artwork encode");output.finishWrite(stream);}catch(Exception failure){if(stream!=null)output.failWrite(stream);throw failure;}}}}finally{bitmap.recycle();}
        }
        metadata(id,image);covers.put(id,file);
    }
    private static synchronized void metadata(String id,Thumbnail image)throws Exception{
        String key=key(image.url);if(key==null)return;File dir=directory();if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("artwork directory");File file=new File(dir,id+".json");
        byte[] bytes=new JSONObject().put("image",hash(key)+".jpg").put("url",image.url).put("width",image.width).toString().getBytes(StandardCharsets.UTF_8);
        AtomicFile metadata=new AtomicFile(file);if(file.isFile()&&file.length()<=8192&&Arrays.equals(bytes,metadata.readFully()))return;
        FileOutputStream out=null;try{out=metadata.startWrite();out.write(bytes);metadata.finishWrite(out);}catch(Exception failure){if(out!=null)metadata.failWrite(out);throw failure;}
    }
    private static boolean online(){try{ConnectivityManager manager=Utils.getContext().getSystemService(ConnectivityManager.class);NetworkCapabilities network=manager.getNetworkCapabilities(manager.getActiveNetwork());return network!=null&&network.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);}catch(Exception unavailable){return false;}}
    public static File cover(String recording){
        if(!recording.matches("[A-Za-z0-9_-]{11}"))return null;File known=covers.get(recording);if(known!=null&&known.isFile())return known;
        File metadata=new File(directory(),recording+".json");if(metadata.length()>8192)return null;
        try{JSONObject info=new JSONObject(new String(new AtomicFile(metadata).readFully(),StandardCharsets.UTF_8));String name=info.getString("image");if(!name.matches("[a-f0-9]{64}\\.jpg"))return null;File file=new File(directory(),name);if(!file.isFile()){queue(recording,new Thumbnail(info.optString("url"),info.optInt("width")));return null;}covers.put(recording,file);return file;}catch(Exception missing){return null;}
    }
    /** Injected only at the verified Elements -> native Uri image-loader boundary. */
    public static Uri local(Uri original){
        try{String key=key(original.toString());if(key==null)return original;
            ConnectivityManager manager=Utils.getContext().getSystemService(ConnectivityManager.class);NetworkCapabilities network=manager.getNetworkCapabilities(manager.getActiveNetwork());if(network!=null&&network.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED))return original;
            File file=new File(directory(),hash(key)+".jpg");if(!file.isFile()||file.length()==0)return original;
            String auth=authority;if(auth==null){var info=Utils.getContext().getPackageManager().getPackageInfo(Utils.getContext().getPackageName(),PackageManager.GET_PROVIDERS);if(info.providers!=null)for(var provider:info.providers)if(provider.name.endsWith(".MusicFileProviderCompat")){auth=provider.authority;break;}if(auth==null)return original;authority=auth;}
            return fileUri(Utils.getContext(),auth,file);
        }catch(Exception unavailable){return original;}
    }
    /** Replaced with the host's exact native FileProvider adapter; no AndroidX class is injected. */
    public static Uri fileUri(Context context,String authority,File file){throw new IllegalStateException("Native playlist artwork URI bridge was not applied");}
}
