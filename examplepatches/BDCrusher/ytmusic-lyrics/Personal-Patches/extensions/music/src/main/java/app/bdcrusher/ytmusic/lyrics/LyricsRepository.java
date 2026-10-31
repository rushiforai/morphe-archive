/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import app.morphe.extension.music.patches.lyrics.model.TrackInfo;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/** One current-track lookup, independent of views. All state and subscribers live on main. */
final class LyricsRepository {
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final List<LyricsCatalog.Sink> sinks = new ArrayList<>();
    private static final List<JSONObject> results = new ArrayList<>();
    private static LyricsCatalog catalog;
    private static String identity = "", notice = "";
    private static TrackInfo currentTrack;
    static boolean current(String id){return id!=null&&!id.isEmpty()&&id.equals(identity);}
    static TrackInfo track(String id){return current(id)?currentTrack:null;}
    private static int generation;
    private static boolean finished;
    private static Boolean definitelyNotFound;
    private static JSONObject health;

    static String identity(TrackInfo track, String id) {
        return id;
    }

    static void ensure(Context context, TrackInfo track, String id, boolean refresh) {
        String next = identity(track, id);
        if (!refresh && next.equals(identity)) {if(!track.title().isBlank()&&!track.artist().isBlank()){currentTrack=track;if(catalog!=null)catalog.refine(track);}return;}
        if(refresh&&next.equals(identity)){
            generation++;if(catalog!=null)catalog.close();catalog=null;finished=false;definitelyNotFound=null;
        }else clear();
        identity = next;currentTrack=track;
        int expected = generation;
        catalog = new LyricsCatalog(context.getApplicationContext(), track, id, refresh, new LyricsCatalog.Sink() {
            public void health(JSONObject value){main.post(()->{if(expected!=generation)return;health=value;for(var sink:new ArrayList<>(sinks))sink.health(value);});}
            public void result(JSONObject payload) { main.post(() -> {
                if (expected != generation) return;
                String key=payload.optString("key",payload.optString("kind",payload.optString("event")));
                if("provider".equals(payload.optString("event"))&&payload.optJSONObject("data")!=null)key="provider:"+payload.optJSONObject("data").optString("provider");
                final String identityKey=key;
                results.removeIf(old->{String k=old.optString("key",old.optString("kind",old.optString("event")));if("provider".equals(old.optString("event"))&&old.optJSONObject("data")!=null)k="provider:"+old.optJSONObject("data").optString("provider");return identityKey.equals(k)&&LyricsCatalog.hasLyricsPayload(payload);});
                if (results.size() < 64) results.add(payload);
                for (var sink : new ArrayList<>(sinks)) sink.result(payload);
            }); }
            public void notice(String message, boolean done) { main.post(() -> {
                if (expected != generation) return;
                notice = message; finished = done;
                for (var sink : new ArrayList<>(sinks)) sink.notice(message, done);
            }); }
            public void reconnect() { main.post(() -> {
                if (expected == generation) for (var sink : new ArrayList<>(sinks)) sink.reconnect();
            }); }
            public void completion(boolean notFound){main.post(()->{if(expected!=generation)return;definitelyNotFound=notFound;for(var sink:new ArrayList<>(sinks))sink.completion(notFound);});}
        });
    }

    static void connectionChanged() { if(catalog!=null)catalog.connectionChanged(); }
    static void rerank(Context context,String videoId){if(videoId==null||!identity.equals(videoId))return;LyricsLibrary library=new LyricsLibrary(context);for(JSONObject result:new ArrayList<>(results))library.offer(videoId,result);}

    static void subscribe(LyricsCatalog.Sink sink) {
        if (sinks.contains(sink)) return;
        sinks.add(sink);
        for (var payload : new ArrayList<>(results)) sink.result(payload);
        if(health!=null)sink.health(health);
        if(definitelyNotFound!=null)sink.completion(definitelyNotFound);
        if (!notice.isEmpty()) sink.notice(notice, finished);
    }

    static void unsubscribe(LyricsCatalog.Sink sink) { sinks.remove(sink); }

    static void clear() {
        generation++;
        if (catalog != null) catalog.close();
        catalog = null; identity = "";currentTrack=null; results.clear(); sinks.clear(); notice = ""; finished = false;definitelyNotFound=null;health=null;
    }
}
