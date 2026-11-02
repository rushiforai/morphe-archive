/* Copyright 2026 BDCrusher. GPL-3.0. Uses host authenticated browse and existing Morphe downloads. */
package app.bdcrusher.ytmusic.playlists;

import android.app.Activity;
import android.content.Intent;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;
import app.bdcrusher.ytmusic.common.PersonalRuntime;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import app.morphe.extension.music.patches.downloads.LocalDownloadManager;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.patches.DownloadMode;
import app.morphe.extension.shared.settings.preference.ExternalDownloaderPreference;

/** One durable batch repository. Enumeration never reads visible rows or changes the playback queue. */
public final class PlaylistRuntime {
    public interface PhoneClient {
        Future<?> bd_playlistBrowse(String browseId,java.util.concurrent.Executor executor);
        Future<?> bd_playlistContinue(String token,java.util.concurrent.Executor executor);
    }
    public interface PhoneResponse { byte[] bd_playlistBytes(); }
    public interface CommandBytes { byte[] toByteArray(); }
    public interface Completion { void complete(String videoId,File file,String failure); }
    private static final ExecutorService STATE=Executors.newSingleThreadExecutor();
    private static final ExecutorService BROWSE=Executors.newSingleThreadExecutor();
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static volatile PhoneClient client;
    private static final Map<String,Batch> batches=new LinkedHashMap<>();
    private static final Set<String> TRACKED=ConcurrentHashMap.newKeySet();
    private static final Map<String,List<Completion>> observers=new HashMap<>();
    private static final List<Runnable> listeners=new ArrayList<>();
    private static volatile List<JSONObject> snapshot=List.of();
    private static volatile Map<String,String> states=Map.of();
    private static volatile boolean loaded;
    private static boolean enumerating;
    private static boolean resumeOffered;
    private static volatile Future<?> enumerationFuture;
    private static volatile String enumeratingId="";
    private static int activeDownloads;
    private static String storageError="";
    private static final Runnable checkExternal=()->{Activity a=Utils.getActivity();if(a!=null&&!a.isFinishing()&&!a.isDestroyed()&&a.hasWindowFocus())refreshFiles(false);};
    private PlaylistRuntime(){}
    public static void capture(PhoneClient value){client=value;}
    public static String url(String id){if(!PlaylistHeaderModel.validId(id))throw new IllegalArgumentException("Invalid playlist identity");return "https://music.youtube.com/playlist?list="+id;}
    /** Validated native download parameters can reach this without a rewritten header marker. */
    public static void download(String id,String title){if(!PlaylistHeaderModel.validId(id))return;DownloadPrompt.playlist(Utils.getActivity(),id,title,()->start(id,title));}
    /** Retain original playlist/folder tracking for native external-download actions too. */
    public static void external(String id,String title){if(PlaylistHeaderModel.validId(id))startExternal(id,title);}
    public record Preview(int count,long seconds,int unknown,java.util.List<app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format> sample){}
    /** Size preview enumerates authenticated pages without queuing media or changing playback. */
    public static Future<?> preview(String playlist,java.util.function.Consumer<Preview> success,java.util.function.Consumer<String> failure){return BROWSE.submit(()->{
        Future<?> active=null;try{PhoneClient c=client;if(c==null)throw new IOException("Native playlist client is not ready");Set<String> tokens=new HashSet<>();String token="",sample="";int count=0,unknown=0;long seconds=0;
            do{if(Thread.currentThread().isInterrupted())throw new InterruptedException();active=token.isEmpty()?c.bd_playlistBrowse("VL"+playlist,BROWSE_CALLBACKS):c.bd_playlistContinue(token,BROWSE_CALLBACKS);Object value=active.get(45,TimeUnit.SECONDS);if(!(value instanceof PhoneResponse response))throw new IOException("Playlist response contract unavailable");PlaylistPage page=PlaylistPage.parse(response.bd_playlistBytes(),playlist,!token.isEmpty());
                for(PlaylistPage.Entry entry:page.entries){count++;if(entry.seconds()>0)seconds+=entry.seconds();else unknown++;if(sample.isEmpty()&&!entry.videoId().isEmpty())sample=entry.videoId();}token=page.continuation;if(!token.isEmpty()&&!tokens.add(token))throw new IOException("Repeated continuation");if(count>100000||tokens.size()>5000)throw new IOException("Playlist limit");
            }while(!token.isEmpty());
            java.util.List<app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format> formats=sample.isEmpty()?List.of():LocalDownloadManager.options(sample).formats();Preview result=new Preview(count,seconds,unknown,formats);MAIN.post(()->success.accept(result));
        }catch(Exception unavailable){if(active!=null)active.cancel(true);if(!(unavailable instanceof InterruptedException))MAIN.post(()->failure.accept("Size preview unavailable; playlist has not been queued"));else Thread.currentThread().interrupt();}
    });}
    /** DEFAULT is left to the original native command. Other modes consume only our own marked action. */
    public static boolean command(CommandBytes command){
        try{
            ProtoWire parsed=new ProtoWire(command.toByteArray());
            ProtoWire.Field play=parsed.one(PlaylistPageModel.PLAY);
            // Native watch endpoints remain authoritative online and offline. Never start a
            // second service/player from a normal playlist row or its Play button.
            if(play!=null&&play.wire==2)return false;
            parsed=marked(parsed,0);if(parsed==null)return false;
            ProtoWire.Field marker=parsed.one(PlaylistHeaderModel.MARKER);
            if(marker==null||marker.wire!=2)return false;
            ProtoWire data=new ProtoWire(marker.data);
            String id=new String(data.child(1),StandardCharsets.UTF_8),title=new String(data.child(2),StandardCharsets.UTF_8);
            if(!PlaylistHeaderModel.validId(id)||title.length()>1024)return false;
            DownloadMode mode=Settings.DOWNLOAD_MODE.get();if(mode==DownloadMode.DEFAULT)return false;
            MAIN.post(()->{
                if(mode==DownloadMode.EXTERNAL){startExternal(id,title);Activity a=Utils.getActivity();if(a!=null)ExternalDownloaderPreference.launchExternalDownloader(id,a,url(id));}
                else{DownloadPrompt.playlist(Utils.getActivity(),id,title,()->start(id,title));}
            });return true;
        }catch(Exception malformed){app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Playlist-route","Download command rejected: "+malformed.getClass().getSimpleName());return false;}
    }
    private static ProtoWire marked(ProtoWire value,int depth){if(value.one(PlaylistHeaderModel.MARKER)!=null)return value;if(depth>=4)return null;for(int n:new int[]{169495254,133724106}){ProtoWire.Field f=value.one(n);if(f!=null&&f.wire==2){ProtoWire result=marked(new ProtoWire(f.data),depth+1);if(result!=null)return result;}}return null;}
    public static boolean endpoint(byte[] bytes){try{return marked(new ProtoWire(bytes),0)!=null&&command(()->bytes);}catch(Exception ignored){return false;}}
    private static File directory(){return new File(Utils.getContext().getFilesDir(),"bdcrusher-offline-playlists");}
    static File audio(String id){
        if(!id.matches("[A-Za-z0-9_-]{11}"))return null;
        File root=new File(Utils.getContext().getExternalFilesDir(Environment.DIRECTORY_MUSIC),"Morphe");
        for(String ext:new String[]{".webm",".m4a"}){File file=new File(root,id+ext);if(file.isFile()&&file.length()>0)return file;}return null;
    }
    public static void init(){if(PersonalRuntime.installed(Utils.getContext(),"playlists"))STATE.execute(()->{load();publish();if(!resumeOffered&&batches.values().stream().anyMatch(b->b.status.startsWith("Interrupted"))){resumeOffered=true;MAIN.post(()->{Activity a=Utils.getActivity();if(a!=null&&!a.isFinishing())new android.app.AlertDialog.Builder(a).setTitle("Resume playlist downloads?").setMessage("An interrupted batch is saved. Review it to resume; completed music is kept.").setNegativeButton("Later",null).setPositiveButton("Review",(d,w)->PlaylistSettingsPage.showBatches(a)).show();});}});}
    static void warmNativeMetadata(){if(!PersonalRuntime.installed(Utils.getContext(),"playlists"))return;STATE.execute(()->{load();for(Batch batch:batches.values())for(int i=0;i<batch.entries.length();i++){JSONObject entry=batch.entries.optJSONObject(i);if(entry==null)continue;String id=entry.optString("id");if(LocalPlayback.response(id)!=null)NativeMediaCache.prepare(batch.id,id,i);}});}
    private static void load(){
        if(loaded)return;loaded=true;File[] files=directory().listFiles();if(files==null)return;
        for(File f:files){
            if(!f.getName().matches("[A-Za-z0-9_-]{2,150}\\.json")||f.length()>8*1024*1024)continue;
            try(InputStream in=new AtomicFile(f).openRead()){
                ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buffer=new byte[8192];int count;
                while((count=in.read(buffer))!=-1){if(bytes.size()+count>8*1024*1024)throw new IOException("record size");bytes.write(buffer,0,count);}
                JSONObject data=new JSONObject(new String(bytes.toByteArray(),StandardCharsets.UTF_8));
                Batch batch=new Batch(data);if(!PlaylistHeaderModel.validId(batch.id)||!f.getName().equals(batch.id+".json"))continue;
                batch.running=false;
                for(int i=0;i<batch.entries.length();i++){JSONObject e=batch.entries.getJSONObject(i);if("downloading".equals(e.optString("state")))e.put("state","queued");}
                batches.put(batch.id,batch);TRACKED.add(batch.id);
            }catch(Exception invalid){storageError="An interrupted or unreadable playlist record was kept for recovery";}
        }
    }
    private static final class Batch {
        final String id,title;final JSONArray entries,tokens;final JSONObject pages;String token="",status="Paused";boolean complete,running,external;volatile long epoch;
        Batch(String id,String title){this.id=id;this.title=title;entries=new JSONArray();tokens=new JSONArray();pages=new JSONObject();}
        Batch(JSONObject o)throws JSONException{
            if(o.getInt("schema")!=1)throw new JSONException("schema");id=o.getString("id");title=o.getString("title");entries=o.getJSONArray("entries");tokens=o.optJSONArray("tokens")==null?new JSONArray():o.getJSONArray("tokens");
            pages=o.optJSONObject("pageOffsets")==null?new JSONObject():o.optJSONObject("pageOffsets");external=o.optBoolean("external");token=o.optString("continuation");complete=o.optBoolean("enumerated");status=o.optBoolean("running")?"Interrupted; resume available":o.optString("status","Paused");
            if(entries.length()>100000||tokens.length()>5000)throw new JSONException("size");
        }
        JSONObject json()throws JSONException{return new JSONObject().put("schema",1).put("id",id).put("title",title).put("entries",entries).put("tokens",tokens).put("pageOffsets",pages).put("continuation",token).put("enumerated",complete).put("running",running).put("status",status).put("external",external);}
    }
    private static boolean save(Batch batch){
        AtomicFile atomic=new AtomicFile(new File(directory(),batch.id+".json"));FileOutputStream out=null;
        try{if(!directory().isDirectory()&&!directory().mkdirs())throw new IOException("directory");out=atomic.startWrite();out.write(batch.json().toString().getBytes(StandardCharsets.UTF_8));atomic.finishWrite(out);return true;}
        catch(Exception failure){if(out!=null)atomic.failWrite(out);batch.running=false;batch.status="Storage unavailable; progress has not been discarded";storageError=batch.status;return false;}
    }
    public static void start(String id,String title){STATE.execute(()->{
        load();Batch b=batches.get(id);if(b==null){b=new Batch(id,title);batches.put(id,b);TRACKED.add(id);}PlaylistBrowse.retain(id);b.external=false;
        for(int i=0;i<b.entries.length();i++){JSONObject e=b.entries.optJSONObject(i);if(e!=null&&(e.optString("state").equals("external")||e.optString("state").equals("missing")))try{e.put("state",local(e.optString("id"))==null?"queued":"complete");}catch(JSONException ignored){}}
        b.running=true;b.status="Preparing playlist";if(save(b))pump();publish();
    });}
    private static void startExternal(String id,String title){STATE.execute(()->{load();Batch b=batches.get(id);if(b==null){b=new Batch(id,title);batches.put(id,b);TRACKED.add(id);}PlaylistBrowse.retain(id);b.external=true;b.running=true;b.status="Sent to external downloader; checking the selected folder";for(int i=0;i<b.entries.length();i++){JSONObject e=b.entries.optJSONObject(i);if(e!=null&&!e.optString("state").equals("unavailable"))try{e.put("state","external");}catch(JSONException ignored){}}if(save(b))pump();publish();refreshFiles(true);});}
    public static void refreshFiles(boolean force){if(!PersonalRuntime.installed(Utils.getContext(),"playlists"))return;STATE.execute(()->{load();Set<String> ids=new HashSet<>();for(Batch b:batches.values())for(int i=0;i<b.entries.length();i++){String id=b.entries.optJSONObject(i).optString("id");if(id.matches("[A-Za-z0-9_-]{11}"))ids.add(id);}ExternalFiles.refresh(Utils.getContext(),ids,force);});}
    public static void filesChanged(){STATE.execute(()->{load();for(Batch b:batches.values())for(int i=0;i<b.entries.length();i++){JSONObject e=b.entries.optJSONObject(i);if(e==null||e.optString("state").equals("unavailable"))continue;Local file=local(e.optString("id"));try{if(file!=null){e.put("state","complete");prefetch(e,file);if(LocalPlayback.response(file.id)!=null)NativeMediaCache.prepare(b.id,file.id,i);}else if(e.optString("state").equals("complete"))e.put("state",b.external?"external":"missing");}catch(JSONException ignored){}}for(Batch b:batches.values())save(b);publish();});}
    public record Local(String id,String source,String title,String artist,String artwork,int duration){}
    public static Local local(String id){File f=audio(id);if(f!=null){var t=app.morphe.extension.music.patches.downloads.OfflineTrack.load(f);return new Local(id,f.getAbsolutePath(),t.displayTitle(),t.displayArtist(),artwork(id,t.artworkFile().isFile()?t.artworkFile().getAbsolutePath():""),t.durationSeconds());}ExternalFiles.Item item=ExternalFiles.get(id);return item==null||!ExternalFiles.granted(Utils.getContext())?null:new Local(id,item.uri(),item.title(),item.artist(),artwork(id,item.artwork()),item.duration());}
    private static String artwork(String id,String existing){if(!existing.isEmpty())return existing;File file=PlaylistArtwork.cover(id);return file==null?"":file.getAbsolutePath();}
    public static Local source(String uri){
        ExternalFiles.Item item=ExternalFiles.source(uri);if(item!=null&&ExternalFiles.granted(Utils.getContext()))return new Local(item.id(),item.uri(),item.title(),item.artist(),artwork(item.id(),item.artwork()),item.duration());
        File file=new File(uri);String name=file.getName();int dot=name.lastIndexOf('.');if(dot<0)return null;String id=name.substring(0,dot);File own=audio(id);if(own==null)return null;try{return own.getCanonicalPath().equals(file.getCanonicalPath())?local(id):null;}catch(IOException invalid){return null;}
    }
    public static boolean tracked(String id){return TRACKED.contains(id);}
    /** Called only from the page-cache worker, never from native UI callbacks. */
    static void awaitReady()throws Exception{STATE.submit(()->{load();publish();}).get(10,TimeUnit.SECONDS);}
    public static int pageOffset(String id,String token){if(token.isEmpty())return 0;for(JSONObject b:snapshot)if(id.equals(b.optString("id"))){JSONObject pages=b.optJSONObject("pageOffsets");return pages==null?-1:pages.optInt(token,-1);}return -1;}
    public static String state(String id){if(local(id)!=null)return "complete";String state=states.getOrDefault(id,"");return state.equals("complete")?"missing":state;}
    private static void prefetch(JSONObject entry,Local local){if("pending".equals(entry.optString("lyrics"))||"saved".equals(entry.optString("lyrics"))&&app.bdcrusher.ytmusic.lyrics.LyricsPrefetch.saved(Utils.getContext(),local.id))return;try{entry.put("lyrics","pending");}catch(JSONException ignored){}app.bdcrusher.ytmusic.lyrics.LyricsPrefetch.enqueue(Utils.getContext(),local.id,local.title,local.artist,local.duration,(saved)->STATE.execute(()->{try{entry.put("lyrics",saved?"saved":"not cached");}catch(JSONException ignored){}for(Batch b:batches.values())save(b);publish();}));}
    public static void control(String id,String action){STATE.execute(()->{
        load();Batch b=batches.get(id);if(b==null)return;
        try{
            if(action.equals("pause")||action.equals("cancel")){b.running=false;b.epoch++;Future<?> pending=enumerationFuture;if(id.equals(enumeratingId)&&pending!=null)pending.cancel(true);b.status=action.equals("cancel")?"Cancelled remaining; completed files kept":"Paused; active files finish safely";}
            else{
                if(action.equals("retry"))for(int i=0;i<b.entries.length();i++){JSONObject e=b.entries.getJSONObject(i);if(e.optString("state").equals("failed")||e.optString("state").equals("missing")||e.optString("state").equals("complete")&&local(e.optString("id"))==null)e.put("state",b.external?"external":"queued").remove("reason");}
                b.running=true;b.status="Resuming";
            }
            if(save(b))pump();publish();
        }catch(JSONException failure){b.running=false;b.status="Playlist record is unreadable";publish();}
    });}
    private static void pump(){
        for(Batch b:batches.values())if(b.running){
            if(!b.complete&&!enumerating){enumerate(b);}
            for(int i=0;!b.external&&i<b.entries.length()&&activeDownloads<2;i++){
                JSONObject e=b.entries.optJSONObject(i);if(e==null||!e.optString("state").equals("queued"))continue;
                String id=e.optString("id");Local saved=local(id);
                try{if(saved!=null){e.put("state","complete");prefetch(e,saved);continue;}e.put("state","downloading");}catch(JSONException ignored){continue;}
                activeDownloads++;int index=i;
                Completion callback=(videoId,file,failure)->STATE.execute(()->{
                    activeDownloads--;try{JSONObject entry=b.entries.getJSONObject(index);entry.put("state",file!=null?"complete":"failed");if(file==null)entry.put("reason",failure);else{Local ready=local(id);if(ready!=null)prefetch(entry,ready);NativeMediaCache.prepare(b.id,id,index);}}catch(JSONException ignored){}
                    save(b);pump();publish();
                });
                MAIN.post(()->enqueue(id,callback));
            }
            boolean pending=false;int failures=0;
            for(int i=0;i<b.entries.length();i++){JSONObject e=b.entries.optJSONObject(i);if(e==null)continue;String state=e.optString("state");pending|=state.equals("queued")||state.equals("downloading");if(state.equals("failed")||state.equals("unavailable")||state.equals("missing")||state.equals("complete")&&local(e.optString("id"))==null)failures++;}
            if(b.external&&b.complete){b.running=false;b.status="External handoff; availability follows the selected folder";}else if(b.complete&&!pending){b.running=false;b.status=failures==0?"Complete":"Finished with "+failures+" unavailable or failed entries";}
            else if(b.complete)b.status="Downloading";
            save(b);
        }
    }
    private static void enumerate(Batch b){
        PhoneClient c=client;if(c==null){b.running=false;b.status="Open a playlist in YouTube Music, then resume";return;}
        enumerating=true;enumeratingId=b.id;long epoch=b.epoch;String token=b.token;boolean continued=b.entries.length()>0||!token.isEmpty();b.status="Reading playlist pages";
        BROWSE.execute(()->{
            PlaylistPage page=null;String error="";
            Future<?> future=null;
            try{future=continued?c.bd_playlistContinue(token,BROWSE_CALLBACKS):c.bd_playlistBrowse("VL"+b.id,BROWSE_CALLBACKS);
                enumerationFuture=future;if(epoch!=b.epoch)future.cancel(true);
                Object response=future.get(45,TimeUnit.SECONDS);
                if(!(response instanceof PhoneResponse))throw new IOException("Native playlist response contract unavailable");
                page=PlaylistPage.parse(((PhoneResponse)response).bd_playlistBytes(),b.id,continued);
            }catch(Exception failure){if(future!=null)future.cancel(true);error="Playlist enumeration incomplete ("+failure.getClass().getSimpleName()+"); resume to retry";}
            PlaylistPage result=page;String message=error;
            STATE.execute(()->{
                enumerating=false;enumerationFuture=null;enumeratingId="";if(epoch!=b.epoch){pump();publish();return;}
                if(result==null){b.running=false;b.status=message;save(b);publish();pump();return;}
                try{
                    b.pages.put(token,b.entries.length());
                    if(!result.continuation.isEmpty()){
                        for(int i=0;i<b.tokens.length();i++)if(result.continuation.equals(b.tokens.optString(i)))throw new IllegalArgumentException("Repeated continuation");
                        b.tokens.put(result.continuation);
                    }
                    if(b.entries.length()+result.entries.size()>100000||b.tokens.length()>5000)throw new IllegalArgumentException("Playlist limit reached");
                    for(PlaylistPage.Entry entry:result.entries)b.entries.put(new JSONObject().put("id",entry.videoId()).put("title",entry.title()).put("state",entry.reason().isEmpty()?(b.external?"external":"queued"):"unavailable").put("reason",entry.reason()));
                    b.token=result.continuation;b.complete=b.token.isEmpty();
                }catch(Exception invalid){b.running=false;b.status="Playlist enumeration incomplete: "+invalid.getMessage();}
                if(save(b))pump();publish();if(b.external&&b.complete)refreshFiles(true);
            });
        });
    }
    // Host future callbacks must not queue behind the worker waiting for that future.
    private static final Executor BROWSE_CALLBACKS=Runnable::run;
    private static void enqueue(String id,Completion callback){
        File saved=audio(id);if(saved!=null){callback.complete(id,saved,"");return;}
        synchronized(observers){observers.computeIfAbsent(id,k->new ArrayList<>()).add(callback);}
        try{LocalDownloadManager.enqueueBatch(id,DownloadPrompt.selected(Utils.getContext()));}catch(Exception failure){finished(id);}
    }
    /** Injected immediately after the native downloader releases an active recording, on every outcome. */
    public static void finished(String id){
        List<Completion> callbacks;synchronized(observers){callbacks=observers.remove(id);}if(callbacks==null)return;
        File file=audio(id);for(Completion c:callbacks)c.complete(id,file,file==null?"Native downloader could not save this track":"");
    }
    private static void publish(){
        List<JSONObject> list=new ArrayList<>();
        for(Batch b:batches.values())try{JSONObject o=new JSONObject(b.json().toString());o.put("storageError",storageError);list.add(o);}catch(JSONException ignored){}
        Map<String,String> nextStates=new HashMap<>();Set<String> available=new HashSet<>();
        for(JSONObject b:list){JSONArray entries=b.optJSONArray("entries");for(int i=0;entries!=null&&i<entries.length();i++){JSONObject e=entries.optJSONObject(i);if(e==null)continue;String id=e.optString("id");nextStates.put(id,e.optString("state"));}}
        for(String id:nextStates.keySet())if(local(id)!=null)available.add(id);
        for(JSONObject b:list){int count=0;JSONArray entries=b.optJSONArray("entries");for(int i=0;entries!=null&&i<entries.length();i++){JSONObject e=entries.optJSONObject(i);if(e!=null&&available.contains(e.optString("id")))count++;}try{b.put("available",count);}catch(JSONException ignored){}}
        boolean externalPending=list.stream().anyMatch(b->b.optBoolean("external")&&b.optInt("available")<(b.optJSONArray("entries")==null?0:b.optJSONArray("entries").length()));
        states=Map.copyOf(nextStates);snapshot=List.copyOf(list);MAIN.post(()->{PlaylistRows.changed();MAIN.removeCallbacks(checkExternal);if(externalPending&&ExternalFiles.granted(Utils.getContext()))MAIN.postDelayed(checkExternal,30000);for(Runnable listener:List.copyOf(listeners))listener.run();});
    }
    public static List<JSONObject> snapshot(){return snapshot;}
    public static void addListener(Runnable listener){listeners.add(listener);init();}
    public static void removeListener(Runnable listener){listeners.remove(listener);}
    public static void play(Activity activity,JSONObject batch){play(activity,batch,0);}
    public static void play(Activity activity,JSONObject batch,int requested){
        if(activity==null)return;STATE.execute(()->preparePlayback(activity,batch,requested));
    }
    private static void preparePlayback(Activity activity,JSONObject batch,int requested){
        String id=batch.optString("id");if(!PlaylistHeaderModel.validId(id))return;
        // Open the original collection. Native rows and the native player own playback;
        // this progress/settings action must not create a second playback service.
        Intent intent=new Intent(Intent.ACTION_VIEW,android.net.Uri.parse(url(id))).setPackage(activity.getPackageName());
        MAIN.post(()->{if(!activity.isFinishing()&&!activity.isDestroyed())try{activity.startActivity(intent);}catch(android.content.ActivityNotFoundException unavailable){Utils.showToastShort("Open this playlist from your Library");}});
    }
}
