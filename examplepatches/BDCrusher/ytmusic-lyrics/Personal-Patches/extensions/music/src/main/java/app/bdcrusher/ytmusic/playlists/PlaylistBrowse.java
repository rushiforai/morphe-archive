/* Copyright 2026 BDCrusher. GPL-3.0. Authenticated native browse response retention. */
package app.bdcrusher.ytmusic.playlists;

import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.util.AtomicFile;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;
import app.morphe.extension.shared.Utils;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;

/** Cache exact native pages for explicitly saved playlists, preserving native order and continuations. */
public final class PlaylistBrowse {
    public interface Request {
        String bd_playlistId();String bd_playlistToken();String bd_playlistParams();String bd_playlistLanguage();String bd_playlistQuery();
        byte[] bd_playlistForm();byte[] bd_playlistGenericForm();
    }
    public record Snapshot(String browse,String token,String params,String language,String form,String genericForm) {
        String hash(){try{ByteArrayOutputStream bytes=new ByteArrayOutputStream();DataOutputStream out=new DataOutputStream(bytes);for(String field:new String[]{browse,token,params,language,form,genericForm}){byte[] value=field.getBytes(StandardCharsets.UTF_8);out.writeInt(value.length);out.write(value);}out.flush();return digest(bytes.toByteArray());}catch(IOException impossible){throw new AssertionError(impossible);}}
    }
    private record Page(String playlist,Snapshot key,byte[] bytes) {}
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static final LinkedHashMap<String,Page> recent=new LinkedHashMap<>(8,.75f,true);
    private static final Map<String,String> owners=new ConcurrentHashMap<>();
    private static final int MAX_PAGE=8*1024*1024,MAX_RECENT=24*1024*1024;
    private PlaylistBrowse(){}
    private static String value(String s){return s==null?"":s;}
    /** Take one immutable identity after native request interceptors, before transport can mutate builders. */
    public static Snapshot snapshot(Request request){
        if(request==null||!value(request.bd_playlistQuery()).isEmpty())return null;
        byte[] form=request.bd_playlistForm(),generic=request.bd_playlistGenericForm();
        if(form!=null&&form.length>256*1024||generic!=null&&generic.length>256*1024)return null;
        Snapshot key=new Snapshot(value(request.bd_playlistId()),value(request.bd_playlistToken()),value(request.bd_playlistParams()),value(request.bd_playlistLanguage()),digest(form==null?new byte[0]:form),digest(generic==null?new byte[0]:generic));
        if(key.browse.length()>160||key.token.length()>65536||key.params.length()>65536||key.language.length()>256)return null;
        if(!key.browse.isEmpty()&&(!key.browse.startsWith("VL")||!PlaylistHeaderModel.validId(key.browse.substring(2))))return null;
        return key.browse.isEmpty()&&key.token.isEmpty()?null:key;
    }
    private static String owner(Snapshot key){return key.browse.startsWith("VL")?key.browse.substring(2):owners.getOrDefault(digest(key.token),"");}
    private static File directory(){return new File(Utils.getContext().getFilesDir(),"bdcrusher-playlist-pages");}
    private static File file(Snapshot key){return new File(directory(),key.hash()+".page");}
    private static String digest(String input){return digest(input.getBytes(StandardCharsets.UTF_8));}
    private static String digest(byte[] input){try{byte[] bytes=MessageDigest.getInstance("SHA-256").digest(input);StringBuilder out=new StringBuilder(64);for(byte b:bytes)out.append(Character.forDigit((b>>4)&15,16)).append(Character.forDigit(b&15,16));return out.toString();}catch(Exception impossible){throw new AssertionError(impossible);}}
    static boolean offline(){try{ConnectivityManager manager=Utils.getContext().getSystemService(ConnectivityManager.class);NetworkCapabilities network=manager.getNetworkCapabilities(manager.getActiveNetwork());return network==null||!network.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);}catch(RuntimeException unavailable){return false;}}
    /** Entry hook returns only while offline; network/auth failures are never relabelled as an offline page. */
    public static ListenableFuture<?> cached(Snapshot key){
        if(key==null||!offline()||!file(key).isFile())return null;
        PlaylistFuture future=new PlaylistFuture(()->{
            PlaylistRuntime.awaitReady();Page page=read(key);if(page==null||!PlaylistRuntime.tracked(page.playlist))throw new IOException("Saved playlist page unavailable");
            rememberContinuation(page);return decode(PlaylistPageModel.rewrite(page.bytes,page.playlist,page.key.token));
        },null);IO.execute(future);return future;
    }
    /** Called around native futures. No waiting, parsing or disk work occurs on the native/UI callback. */
    public static ListenableFuture<?> observe(ListenableFuture<?> source,Snapshot key){
        if(key==null)return source;
        PlaylistFuture future=new PlaylistFuture(()->{
            Object response=PlaylistFuture.await(source);if(!(response instanceof PlaylistRuntime.PhoneResponse phone))return response;
            byte[] bytes=phone.bd_playlistBytes();String playlist=owner(key);
            if(!PlaylistHeaderModel.validId(playlist)||bytes.length>MAX_PAGE)return response;
            try{
                PlaylistPage.parse(bytes,playlist,!key.token.isEmpty());
                Page page=new Page(playlist,key,bytes);rememberContinuation(page);
                if(PlaylistRuntime.tracked(playlist))write(page);else remember(page);
                byte[] changed=PlaylistPageModel.rewrite(bytes,playlist,key.token);return changed==bytes?response:decode(changed);
            }catch(IllegalArgumentException unsupported){FeatureDiagnostics.record("Playlist-page","Unsupported native page kept unchanged");return response;}
        },source);
        source.addListener(()->{if(source.isCancelled())future.cancel(false);else IO.execute(future);},Runnable::run);return future;
    }
    private static void rememberContinuation(Page page){String token=PlaylistPage.parse(page.bytes,page.playlist,!page.key.token.isEmpty()).continuation;if(!token.isEmpty())owners.put(digest(token),page.playlist);}
    private static synchronized void remember(Page page){
        recent.put(page.key.hash(),page);int bytes=recent.values().stream().mapToInt(p->p.bytes.length).sum();
        Iterator<Page> it=recent.values().iterator();while((recent.size()>8||bytes>MAX_RECENT)&&it.hasNext()){bytes-=it.next().bytes.length;it.remove();}
    }
    public static void retain(String playlist){IO.execute(()->{synchronized(PlaylistBrowse.class){Iterator<Page> it=recent.values().iterator();while(it.hasNext()){Page page=it.next();if(page.playlist.equals(playlist)){write(page);it.remove();}}}});}
    private static void write(Page page){
        AtomicFile atomic=new AtomicFile(file(page.key));FileOutputStream stream=null;
        try{if(!directory().isDirectory()&&!directory().mkdirs())throw new IOException("directory");stream=atomic.startWrite();DataOutputStream out=new DataOutputStream(stream);out.writeInt(1);out.writeUTF(page.playlist);out.writeUTF(page.key.hash());out.writeInt(page.bytes.length);out.write(page.bytes);out.flush();atomic.finishWrite(stream);}
        catch(IOException failure){if(stream!=null)atomic.failWrite(stream);FeatureDiagnostics.record("Playlist-page","Native page could not be saved: "+failure.getClass().getSimpleName());}
        PlaylistArtwork.retain(page.bytes,page.playlist);
    }
    private static Page read(Snapshot key){
        File file=file(key);if(file.length()>MAX_PAGE+512)return null;
        try(DataInputStream in=new DataInputStream(new AtomicFile(file).openRead())){if(in.readInt()!=1)return null;String playlist=in.readUTF();if(!PlaylistHeaderModel.validId(playlist)||!key.hash().equals(in.readUTF()))return null;int size=in.readInt();if(size<0||size>MAX_PAGE)return null;byte[] bytes=new byte[size];in.readFully(bytes);if(in.read()!=-1)return null;PlaylistPage.parse(bytes,playlist,!key.token.isEmpty());return new Page(playlist,key,bytes);}catch(Exception failure){return null;}
    }
    /** Replaced by the exact native response/protobuf constructor bridge during patching. */
    public static Object decode(byte[] bytes){throw new IllegalStateException("Native playlist response bridge was not applied");}
}
