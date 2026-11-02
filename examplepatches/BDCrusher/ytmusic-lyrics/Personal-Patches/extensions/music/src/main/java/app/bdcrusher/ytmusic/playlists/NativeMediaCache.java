/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;
import com.google.common.util.concurrent.ListenableFuture;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;
import app.morphe.extension.shared.Utils;

/** Native /next metadata for saved recordings, keyed by recording, original playlist and position. */
public final class NativeMediaCache {
    public interface Request {String bd_recording();byte[] bd_core();Request bd_copy(byte[] core);}
    public interface Next {byte[] bd_nextBytes();}
    public interface Client {ListenableFuture<?> bd_next(Request request);}
    private record Key(String recording,String playlist,int index){
        String hash(){try{return hex(MessageDigest.getInstance("SHA-256").digest((recording+"|"+playlist+"|"+index).getBytes(StandardCharsets.UTF_8)));}catch(Exception impossible){throw new AssertionError(impossible);}}
    }
    private static final ExecutorService IO=Executors.newFixedThreadPool(2),WARM=Executors.newSingleThreadExecutor();
    private static final Set<Key> pending=ConcurrentHashMap.newKeySet();
    private static final Map<Key,Request> waiting=new ConcurrentHashMap<>();
    private static volatile Client client;
    private static volatile Request template;
    private static long lastRecovery;
    private NativeMediaCache(){}
    private static String hex(byte[] bytes){StringBuilder out=new StringBuilder();for(byte b:bytes)out.append(Character.forDigit((b>>>4)&15,16)).append(Character.forDigit(b&15,16));return out.toString();}
    private static File file(Key key){return new File(new File(Utils.getContext().getFilesDir(),"bdcrusher-offline-native"),key.recording+"-"+key.hash()+".next.pb");}
    private static boolean exists(File file){return file.isFile()||new File(file+".bak").isFile();}
    public static boolean ready(String playlist,String recording,int index){return recording!=null&&recording.matches("[A-Za-z0-9_-]{11}")&&LocalPlayback.response(recording)!=null&&exists(file(new Key(recording,playlist,index)));}
    public static void remove(String recording){if(recording==null||!recording.matches("[A-Za-z0-9_-]{11}"))return;IO.execute(()->{File dir=new File(Utils.getContext().getFilesDir(),"bdcrusher-offline-native");File[] files=dir.listFiles((d,n)->n.startsWith(recording+"-")&&n.endsWith(".next.pb"));if(files!=null)for(File f:files)if(!f.delete())FeatureDiagnostics.record("Offline-metadata","Could not remove a deleted track's metadata");});}
    private static Key key(Request r){try{
        String id=r.bd_recording();if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return null;
        byte[] core=r.bd_core();if(core.length>256*1024)return null;ProtoWire raw=new ProtoWire(core);String actual=new String(raw.child(1),StandardCharsets.US_ASCII);
        if(!id.equals(actual))return null;ProtoWire.Field pl=raw.one(3),index=raw.one(4);
        if(pl!=null&&pl.wire!=2||index!=null&&index.wire!=0)return null;
        String playlist=pl==null?"":new String(pl.data,StandardCharsets.UTF_8);if(!playlist.isEmpty()&&!PlaylistHeaderModel.validId(playlist))return null;
        int position=index==null?0:(int)index.value;if(position<0||position>100000)return null;return new Key(id,playlist,position);
    }catch(Exception invalid){return null;}}
    public static void capture(Client nativeClient,Request request){
        if(key(request)==null)return;client=nativeClient;template=request;
        for(Key key:List.copyOf(waiting.keySet()))prepare(key.playlist,key.recording,key.index);
    }
    public static void initialized(Client nativeClient){client=nativeClient;if(template==null)template=createRequest(new byte[0]);recover();}
    /** Restart/foreground recovery uses saved identities, never the current playback queue. */
    public static void recover(){
        if(!app.bdcrusher.ytmusic.common.PersonalRuntime.installed(Utils.getContext(),"downloads"))return;
        synchronized(NativeMediaCache.class){long now=android.os.SystemClock.elapsedRealtime();if(lastRecovery!=0&&now-lastRecovery<30000)return;lastRecovery=now;}
        IO.execute(()->{
            if(PlaylistBrowse.offline())return;
            for(Key key:List.copyOf(waiting.keySet()))prepare(key.playlist,key.recording,key.index);
            File root=new File(Utils.getContext().getExternalFilesDir(android.os.Environment.DIRECTORY_MUSIC),"Morphe");File[] formats=root.listFiles((d,n)->n.matches("[A-Za-z0-9_-]{11}\\.format\\.pb"));
            if(formats!=null)for(File format:formats){String id=format.getName().substring(0,11);if(LocalPlayback.response(id)!=null)prepare("",id,0);}
            PlaylistRuntime.warmNativeMetadata();
        });
    }
    /** No network error/auth rejection is ever turned into a cached success. Offline-only entry hook. */
    public static ListenableFuture<?> cached(Request request){
        Key key=key(request);if(key==null||!PlaylistBrowse.offline())return null;
        if(LocalPlayback.response(key.recording)==null){FeatureDiagnostics.record("Offline-native","No compatible saved audio; native handling retained");return null;}
        if(!exists(file(key))){FeatureDiagnostics.record("Offline-native","Song metadata is not saved for this playlist position");return null;}
        FeatureDiagnostics.record("Offline-native","Saved native song metadata selected");
        PlaylistFuture result=new PlaylistFuture(()->decode(read(file(key))),null);IO.execute(result);return result;
    }
    public static ListenableFuture<?> player(Request request){
        Key key=key(request);if(key==null||!PlaylistBrowse.offline())return null;byte[] bytes=LocalPlayback.response(key.recording);if(bytes==null)return null;
        PlaylistFuture result=new PlaylistFuture(()->decodePlayer(bytes),null);IO.execute(result);return result;
    }
    public static android.util.Pair<ListenableFuture<?>,ListenableFuture<?>> pair(Request request){
        Key key=key(request);if(key==null||!PlaylistBrowse.offline()||!exists(file(key))||LocalPlayback.response(key.recording)==null)return null;
        ListenableFuture<?> player=player(request),next=cached(request);return player==null||next==null?null:android.util.Pair.create(player,next);
    }
    public static ListenableFuture<?> observe(ListenableFuture<?> source,Request request){
        Key key=key(request);if(key==null||source==null)return source;
        PlaylistFuture result=new PlaylistFuture(()->{
            Object value=PlaylistFuture.await(source);if(value instanceof Next next&&LocalPlayback.response(key.recording)!=null)try{byte[] bytes=next.bd_nextBytes();if(bytes.length>0&&bytes.length<=4*1024*1024)write(file(key),bytes);}catch(Exception storage){FeatureDiagnostics.record("Offline-metadata","Metadata could not be saved; native playback kept");}
            return value;
        },source);
        // Schedule only after completion. Never occupy an IO worker waiting for a native future.
        source.addListener(()->{if(source.isCancelled())result.cancel(false);else IO.execute(result);},Runnable::run);return result;
    }
    public static void prepare(String playlist,String recording,int index){
        if(recording==null||!recording.matches("[A-Za-z0-9_-]{11}")||!playlist.isEmpty()&&!PlaylistHeaderModel.validId(playlist)||index<0||index>100000)return;
        Key key=new Key(recording,playlist,index);if(exists(file(key)))return;
        Client nativeClient=client;Request original=template;
        if(nativeClient==null||original==null){waiting.putIfAbsent(key,original==null?new Unready():original);return;}
        if(!pending.add(key))return;waiting.remove(key);
        WARM.execute(()->{ListenableFuture<?> future=null;try{
            if(PlaylistBrowse.offline()){waiting.put(key,original);return;}
            ProtoWire core=new ProtoWire(original.bd_core());core.put(ProtoWire.blob(1,recording.getBytes(StandardCharsets.US_ASCII)));core.remove(2);core.remove(40);
            if(playlist.isEmpty()){core.remove(3);core.remove(4);}else{core.put(ProtoWire.blob(3,playlist.getBytes(StandardCharsets.US_ASCII)));core.put(ProtoWire.number(4,index));}
            Request request=original.bd_copy(core.bytes());if(!key.equals(key(request)))throw new IOException("Native request identity mismatch");
            future=nativeClient.bd_next(request);Object response=future.get(45,TimeUnit.SECONDS);
            if(!(response instanceof Next next))throw new IOException("Native song metadata contract missing");if(LocalPlayback.response(recording)!=null)write(file(key),next.bd_nextBytes());
        }catch(Exception failure){if(future!=null)future.cancel(true);waiting.put(key,original);FeatureDiagnostics.record("Offline-metadata","Song metadata not yet ready: "+failure.getClass().getSimpleName());}
        finally{pending.remove(key);}});
    }
    private static final class Unready implements Request {public String bd_recording(){return "";}public byte[] bd_core(){return new byte[0];}public Request bd_copy(byte[] core){return this;}}
    private static synchronized byte[] read(File f)throws IOException{
        try(InputStream in=new AtomicFile(f).openRead()){ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))>=0){if(bytes.size()+n>4*1024*1024)throw new IOException("Metadata limit");bytes.write(buffer,0,n);}return bytes.toByteArray();}
    }
    private static synchronized void write(File target,byte[] bytes)throws IOException{
        if(bytes.length==0||bytes.length>4*1024*1024)throw new IOException("Metadata size");File dir=target.getParentFile();if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("Metadata directory");
        AtomicFile atomic=new AtomicFile(target);FileOutputStream out=null;try{out=atomic.startWrite();out.write(bytes);atomic.finishWrite(out);}catch(IOException failure){if(out!=null)atomic.failWrite(out);throw failure;}
    }
    private static Object decode(byte[] bytes){throw new IllegalStateException("Native song response decoder was not installed");}
    private static Object decodePlayer(byte[] bytes){throw new IllegalStateException("Native player response decoder was not installed");}
    private static Request createRequest(byte[] core){throw new IllegalStateException("Native watch request constructor was not installed");}
}
