/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.content.Context;
import org.json.JSONObject;
import org.json.JSONArray;
import java.io.*;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import app.morphe.extension.music.patches.lyrics.model.TrackInfo;

/** Native transport for the extension provider pipeline; all outcomes have bounded diagnostics. */
final class LyricsCatalog implements AutoCloseable {
    interface Sink {void result(JSONObject payload);void notice(String message,boolean finished);default void reconnect(){}default void completion(boolean definitelyNotFound){}default void health(JSONObject status){}}
    private final LyricsNetwork network=new LyricsNetwork();
    private final ExecutorService executor;
    private final ScheduledExecutorService retries;
    private final AtomicInteger remaining=new AtomicInteger(1);
    private final java.util.Set<String> requested=ConcurrentHashMap.newKeySet();
    private final AtomicBoolean resultSeen=new AtomicBoolean(),lookupFailed=new AtomicBoolean();
    private volatile boolean closed,connectionNeeded;
    private final java.util.Set<String> failedSources=new java.util.HashSet<>();
    private synchronized void failed(String source){failedSources.add(source);lookupFailed.set(!failedSources.isEmpty());}
    private synchronized void recovered(String source){failedSources.remove(source);lookupFailed.set(!failedSources.isEmpty());}
    private final Context context;private final String videoId;
    private final LyricsDiskCache cache;private final Sink sink;
    private volatile TrackInfo normalized;
    private final java.util.Set<String> connectionTokens=ConcurrentHashMap.newKeySet();
    private final java.util.Set<String> delivered=ConcurrentHashMap.newKeySet();
    LyricsCatalog(Context context,TrackInfo track,String videoId,boolean refresh,Sink sink){
        this(context,track,videoId,refresh,sink,Executors.newFixedThreadPool(4),Executors.newSingleThreadScheduledExecutor());
    }
    LyricsCatalog(Context context,TrackInfo track,String videoId,boolean refresh,Sink sink,ExecutorService executor,ScheduledExecutorService retries){
        this.executor=executor;this.retries=retries;
        this.context=context;this.videoId=videoId;this.sink=sink;cache=new LyricsDiskCache(context);
        normalized=new TrackInfo(LyricsLookup.title(track.title()),LyricsLookup.artist(track.artist()),clean(track.album()),track.durationSeconds());
        LyricsDiagnostics.record("track","video="+videoId+"; title="+normalized.title()+"; artist="+normalized.artist()+"; album="+normalized.album()+"; duration="+normalized.durationSeconds());
        task("Saved lyrics",()->{JSONObject saved=new LyricsLibrary(context).get(videoId);if(saved!=null)send(saved);});
        direct(normalized);
        if(LyricsConfig.enabled(context,"unison-richsynced","unison-wordsynced","unison-synced","unison-plain"))task("Unison",()->unison(normalized));
        connectionChanged();
        if(metadataReady(normalized))finished();else health();
    }
    private static boolean metadataReady(TrackInfo track){return !track.title().isBlank()&&!track.artist().isBlank();}
    synchronized void refine(TrackInfo track){
        if(closed)return;
        TrackInfo next=new TrackInfo(LyricsLookup.title(track.title()),LyricsLookup.artist(track.artist()),clean(track.album()),track.durationSeconds());
        TrackInfo old=normalized;
        boolean waiting=!metadataReady(old);if(!metadataReady(next)||!waiting&&(!old.title().equals(next.title())||!old.artist().equals(next.artist())))return;
        if(!waiting&&old.durationSeconds()==next.durationSeconds()&&old.album().equals(next.album()))return;
        if(!waiting&&next.durationSeconds()<=0&&old.durationSeconds()>0)return;
        normalized=next;LyricsDiagnostics.record("Metadata-refinement","recording="+videoId+"; improved metadata without clearing sources");direct(next);connectionChanged();if(waiting)finished();
    }
    synchronized void connectionChanged(){
        if(closed||!metadataReady(normalized))return;
        if(!LyricsConfig.brokerEnabled(context))return;
        String jwt=LyricsConfig.preferences(context).getString("serviceJwt","");
        if(jwt.isEmpty()||ServiceConnection.expired(jwt)){
            connectionNeeded=true;sink.notice("Additional sources are verifying automatically; Connect sources is available if interaction is needed",false);health();return;
        }
        if(connectionTokens.size()>=8||!connectionTokens.add(jwt))return;
        connectionNeeded=false;
        sink.notice("Loading additional lyric sources",false);
        task("Combined service",()->stream(normalized,jwt));
    }
    private static String clean(String value){return value==null?"":value.trim();}
    private void unison(TrackInfo t)throws Exception{
        String base="https://unison.betterlyrics.org/lyrics?v="+LyricsNetwork.encode(videoId);
        JSONObject response;
        try{
            // Recording identity first: video titles and uploader names can differ from catalog metadata.
            response=new JSONObject(network.request(base,"GET",null,null));
        }catch(LyricsNetwork.HttpFailure ex){
            if(ex.status!=404)throw ex;if(!metadataReady(t))throw new NotFound();
            String url=base+"&song="+LyricsNetwork.encode(t.title())+"&artist="+LyricsNetwork.encode(t.artist());
            if(t.durationSeconds()>0)url+="&duration="+t.durationSeconds();
            if(!t.album().isEmpty())url+="&album="+LyricsNetwork.encode(t.album());
            response=new JSONObject(network.request(url,"GET",null,null));
        }
        JSONObject data=response.optJSONObject("data");
        if(data==null||!lyricText(data.opt("lyrics")))throw new NotFound();
        String found=data.optString("videoId");boolean exact=videoId.equals(found);
        LyricsDiagnostics.record("Unison","HTTP 200; recording="+found+"; exact="+exact+"; format="+data.optString("format")+"; chars="+data.optString("lyrics").length());
        send(new JSONObject().put("kind","unison").put("data",response).put("recordingVideoId",found).put("recordingMatched",exact));
    }
    private String query(TrackInfo t){
        String q="s="+LyricsNetwork.encode(t.title())+"&a="+LyricsNetwork.encode(t.artist());
        if(!t.album().isEmpty())q+="&al="+LyricsNetwork.encode(t.album());if(t.durationSeconds()>0)q+="&d="+t.durationSeconds();return q;
    }
    private synchronized void direct(TrackInfo t){
        if(!metadataReady(t))return;
        String q=query(t);if(requested.size()>=4||!requested.add(q)||closed)return;
        String cacheKey="v2|"+videoId+"|"+q;
        if(LyricsConfig.enabled(context,"bLyrics-richsynced","bLyrics-synced"))task("Better Lyrics",()->{
            JSONObject cached=cache.migrate(cacheKey+"|ttml");if(cached!=null){LyricsDiagnostics.record("Better Lyrics","Migrating positive cache; checking for updates");send(cached);}
            String relaxed="s="+LyricsNetwork.encode(t.title())+"&a="+LyricsNetwork.encode(t.artist());
            boolean retried=false;JSONObject data;
            try{data=new JSONObject(network.request("https://api.betterlyrics.org/getLyrics?"+q,"GET",null,null));}
            catch(LyricsNetwork.HttpFailure ex){if(ex.status!=404||q.equals(relaxed))throw ex;retried=true;LyricsDiagnostics.record("Better Lyrics","Exact metadata not found; retrying title and artist without album/duration");data=new JSONObject(network.request("https://api.betterlyrics.org/getLyrics?"+relaxed,"GET",null,null));}
            String raw=data.optString("ttml");
            if(raw.isEmpty()&&!retried&&!q.equals(relaxed)){retried=true;LyricsDiagnostics.record("Better Lyrics","Empty exact result; retrying title and artist without album/duration");data=new JSONObject(network.request("https://api.betterlyrics.org/getLyrics?"+relaxed,"GET",null,null));raw=data.optString("ttml");}
            if(raw.isEmpty())throw new NotFound();
            JSONObject payload=new JSONObject().put("key","bLyrics-richsynced").put("source","Better Lyrics").put("format","ttml").put("raw",raw).put("relaxedMetadata",retried);
            send(payload);LyricsDiagnostics.record("Better Lyrics","HTTP 200; TTML chars="+raw.length());
        });
        if(LyricsConfig.enabled(context,"lrclib-synced","lrclib-plain"))task("LRCLib",()->{
            JSONObject cached=cache.migrate(cacheKey+"|lrclib");if(cached!=null)send(cached);
            String url="https://lrclib.net/api/get?track_name="+LyricsNetwork.encode(t.title())+"&artist_name="+LyricsNetwork.encode(t.artist());
            if(!t.album().isEmpty())url+="&album_name="+LyricsNetwork.encode(t.album());if(t.durationSeconds()>0)url+="&duration="+t.durationSeconds();
            JSONObject data;
            try{data=new JSONObject(network.request(url,"GET",null,null));}
            catch(LyricsNetwork.HttpFailure ex){if(ex.status!=404)throw ex;if(!metadataReady(t))throw new NotFound();data=new JSONObject();}
            if(data.optString("syncedLyrics").trim().isEmpty()&&data.optString("plainLyrics").trim().isEmpty()){
                String search="https://lrclib.net/api/search?track_name="+LyricsNetwork.encode(t.title())+"&artist_name="+LyricsNetwork.encode(t.artist());
                data=LyricsLookup.best(new JSONArray(network.request(search,"GET",null,null)),t.title(),t.artist(),t.durationSeconds());
                if(data==null)throw new NotFound();
                LyricsDiagnostics.record("LRCLib","Search recovered an exact title/artist match"+(t.durationSeconds()>0?" within 2 seconds":"; duration unknown"));
            }
            if(!data.isNull("syncedLyrics")&&!data.optString("syncedLyrics").isEmpty()){
                JSONObject payload=new JSONObject().put("key","lrclib-synced").put("source","LRCLib").put("format","lrc").put("raw",data.getString("syncedLyrics"));send(payload);
            }
            if(!data.isNull("plainLyrics")&&!data.optString("plainLyrics").isEmpty())send(new JSONObject().put("key","lrclib-plain").put("source","LRCLib").put("format","plain").put("raw",data.getString("plainLyrics")));
        });
    }
    interface Work {void run()throws Exception;}
    private static final class NotFound extends Exception {}
    private void task(String source,Work work){
        if(closed)return;remaining.incrementAndGet();health();
        new Query(source,work).submit();
    }
    private final class Query implements Runnable {
        final String source;final Work work;int attempts;boolean done,confirmedMissing,renewed;
        Query(String source,Work work){this.source=source;this.work=work;}
        void submit(){if(closed){finish();return;}try{executor.execute(this);}catch(RejectedExecutionException ignored){finish();}}
        void schedule(long delay){if(closed){finish();return;}try{retries.schedule(this::submit,delay,TimeUnit.MILLISECONDS);}catch(RejectedExecutionException ignored){finish();}}
        void finish(){if(!done){done=true;finished();}}
        public void run(){
            if(closed||done){finish();return;}
            // Recovery timers do not consume network attempts while the app/network is inactive.
            if(!"Saved lyrics".equals(source)&&!LyricsRetry.active(context)){schedule(10000);return;}
            attempts++;
            try{work.run();recovered(source);finish();}
            catch(Exception failure){
                if(closed||Thread.currentThread().isInterrupted()){finish();return;}
                if(failure instanceof LyricsNetwork.TransportBusy){attempts--;schedule(250);return;}
                if(failure instanceof NotFound||failure instanceof LyricsNetwork.HttpFailure http&&http.status==404){
                    if(!confirmedMissing){confirmedMissing=true;LyricsDiagnostics.record(source,"Not found; confirming once in 30 seconds");schedule(30000);return;}
                    recovered(source);LyricsDiagnostics.record(source,"Not found");finish();return;
                }
                long delay=LyricsRetry.delay(failure,attempts);
                if(delay>=0){LyricsDiagnostics.record(source,"Temporary failure; attempt "+attempts+" of 9 completed; retry scheduled");failed(source);health();schedule(LyricsRetry.jitter(delay));return;}
                if("Combined service".equals(source)&&failure instanceof LyricsNetwork.HttpFailure http&&(http.status==401||http.status==403)&&!renewed){
                    renewed=true;connectionNeeded=true;
                    new android.os.Handler(android.os.Looper.getMainLooper()).post(()->ServiceConnection.renew(context));
                }
                failed(source);LyricsDiagnostics.record(source,"recording="+videoId+"; lookup stopped: "+failure.getClass().getSimpleName()+(failure instanceof LyricsNetwork.HttpFailure http?" HTTP "+http.status+(http.status==401||http.status==403?" (request rejected; not a not-found result)":""):""));finish();
            }
        }
    }
    private synchronized void finished(){int count=remaining.decrementAndGet();health();if(count==0&&!closed){sink.completion(!resultSeen.get()&&!lookupFailed.get()&&!connectionNeeded);sink.notice(connectionNeeded?"Connect sources to enable or renew the combined service":lookupFailed.get()?"Some sources failed; available lyrics have been kept":"Source lookup complete",true);}}
    private synchronized void health(){if(!closed)try{sink.health(new JSONObject().put("pending",Math.max(0,remaining.get())).put("failed",lookupFailed.get()).put("connectionNeeded",connectionNeeded).put("found",resultSeen.get()));}catch(org.json.JSONException impossible){throw new AssertionError(impossible);}}
    private void send(JSONObject payload){if(!closed){
        if(payload.has("key")&&!LyricsConfig.enabled(context,payload.optString("key")))return;
        new LyricsLibrary(context).offer(videoId,payload);
        try{String hash=java.util.Base64.getEncoder().encodeToString(java.security.MessageDigest.getInstance("SHA-256").digest(payload.toString().getBytes(StandardCharsets.UTF_8)));if(delivered.contains(hash))return;if(delivered.size()<256)delivered.add(hash);}
        catch(java.security.NoSuchAlgorithmException impossible){throw new AssertionError(impossible);}
        if(hasLyricsPayload(payload)){resultSeen.set(true);if(payload.has("source"))recovered(payload.optString("source"));if("unison".equals(payload.optString("kind")))recovered("Unison");}sink.result(payload);
    }}
    private static boolean lyricText(Object value){return value instanceof String text&&!text.trim().isEmpty();}
    static boolean hasLyricsPayload(JSONObject payload){
        if("cachedResult".equals(payload.optString("kind"))){JSONObject result=payload.optJSONObject("result");return result!=null&&result.optJSONArray("lyrics")!=null&&result.optJSONArray("lyrics").length()>0;}
        if(lyricText(payload.opt("raw")))return true;
        if("unison".equals(payload.optString("kind"))){JSONObject data=payload.optJSONObject("data");if(data!=null&&data.optJSONObject("data")!=null)data=data.optJSONObject("data");return data!=null&&lyricText(data.opt("lyrics"));}
        if(!"provider".equals(payload.optString("event")))return false;
        JSONObject data=payload.optJSONObject("data"),results=data==null?null:data.optJSONObject("results");if(results==null)return false;
        for(String key:new String[]{"lyrics","synced","plain","wordByWord"})if(lyricText(results.opt(key)))return true;
        return false;
    }
    private void event(String event,JSONObject data)throws Exception{
        if("metadata".equals(event)){
            String song=data.optString("song"),artist=data.optString("artist");
            if(!song.isEmpty()&&!artist.isEmpty()){
                TrackInfo corrected=new TrackInfo(LyricsLookup.title(song),LyricsLookup.artist(artist),clean(data.optString("album")),data.optInt("duration",0));
                LyricsDiagnostics.record("metadata","title="+corrected.title()+"; artist="+corrected.artist()+"; album="+corrected.album()+"; duration="+corrected.durationSeconds());
                direct(corrected);
            }
        }
        if("provider".equals(event)){
            JSONObject results=data.optJSONObject("results");
            if(results!=null){String provider=data.optString("provider");if("golyrics".equals(provider)&&lyricText(results.opt("lyrics")))recovered("Better Lyrics");if("lrclib".equals(provider)&&(lyricText(results.opt("synced"))||lyricText(results.opt("plain"))))recovered("LRCLib");}
            LyricsDiagnostics.record("Combined service","Provider "+data.optString("provider")+" received");
        }
        send(new JSONObject().put("event",event).put("data",data));
    }
    private void stream(TrackInfo track,String jwt)throws Exception{
        String body="videoId="+LyricsNetwork.encode(videoId)+"&song="+LyricsNetwork.encode(track.title())+"&artist="+LyricsNetwork.encode(track.artist())+"&alwaysFetchMetadata=true&token="+LyricsNetwork.encode(jwt);
        if(!track.album().isEmpty())body+="&album="+LyricsNetwork.encode(track.album());if(track.durationSeconds()>0)body+="&duration="+track.durationSeconds();
        HttpURLConnection connection=network.open(LyricsNetwork.BROKER+"v2/lyrics","POST",body,"application/x-www-form-urlencoded");
        try{
            int status=connection.getResponseCode();
            if(status==403){if(!jwt.equals(LyricsConfig.preferences(context).getString("serviceJwt","")))return;connectionNeeded=true;LyricsConfig.preferences(context).edit().remove("serviceJwt").apply();LyricsDiagnostics.record("Combined service","Connection rejected; automatic normal verification requested");sink.notice("Source verification is renewing; Connect sources if interaction is needed",false);sink.reconnect();return;}
            if(status!=200)throw new LyricsNetwork.HttpFailure(status,connection.getHeaderField("Retry-After"));
            try(BufferedReader reader=new BufferedReader(new InputStreamReader(connection.getInputStream(),StandardCharsets.UTF_8))){
                String line,event="";StringBuilder data=new StringBuilder();int total=0;int providerFailures=0;
                while(!closed&&(line=reader.readLine())!=null){
                    total+=line.length();if(total>6*1024*1024)throw new LyricsNetwork.PayloadLimit();
                    if(line.isEmpty()){if(data.length()>0){providerFailures|=streamEvent(event,data.toString());data.setLength(0);}event="";}
                    else if(line.startsWith("event:"))event=line.substring(6).trim();
                    else if(line.startsWith("data:")){if(data.length()>0)data.append('\n');data.append(line.substring(5).trim());}
                }
                if(data.length()>0&&!closed)providerFailures|=streamEvent(event,data.toString());
                if(!closed){if((providerFailures&1)!=0)throw new IOException("Provider reported a temporary failure");if((providerFailures&6)!=0)throw new IllegalArgumentException("Provider parsing or authorization failure");}
            }
        }finally{network.release(connection);}
    }
    private int streamEvent(String event,String raw)throws Exception{
        if("[DONE]".equals(raw.trim()))return 0;
        JSONObject data;
        try{data=new JSONObject(raw);}catch(org.json.JSONException malformed){failed("Combined service");LyricsDiagnostics.record("Combined service","Invalid stream event skipped; other sources continue");return 2;}
        event(event,data);
        if(("provider".equals(event)&&!data.isNull("error")&&!data.optString("error").isEmpty())||"error".equals(event)){
            int status=data.optInt("status",0);String error=data.optString("error","").toLowerCase(java.util.Locale.ROOT);
            if(status==404||error.contains("not found"))return 0;
            if(status==401||status==403||error.contains("unauthoriz")||error.contains("forbidden"))return 4;
            return status==0||status==408||status==429||status>=500?1:2;
        }
        return 0;
    }
    @Override public void close(){closed=true;network.close();retries.shutdownNow();executor.shutdownNow();}
}

