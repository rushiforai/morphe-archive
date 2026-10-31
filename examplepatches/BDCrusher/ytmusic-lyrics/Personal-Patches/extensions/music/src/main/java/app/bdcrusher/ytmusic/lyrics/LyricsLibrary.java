/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.content.Context;
import android.util.AtomicFile;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.concurrent.*;

/** Durable, atomic, one-winner-per-recording library. Never expires or evicts lyrics. */
final class LyricsLibrary {
    private static final ExecutorService io=Executors.newSingleThreadExecutor();
    private final Context context;
    private final File directory;
    LyricsLibrary(Context c){context=c.getApplicationContext();directory=new File(context.getFilesDir(),"bdcrusher-lyrics-library-v2");}
    private static String hash(String id)throws Exception{
        byte[] bytes=MessageDigest.getInstance("SHA-256").digest(id.getBytes(StandardCharsets.UTF_8));
        StringBuilder out=new StringBuilder();for(byte b:bytes)out.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return out.toString();
    }
    private File file(String id)throws Exception{return new File(directory,hash(id)+".json");}
    JSONObject get(String id){
        if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return null;
        synchronized(LyricsLibrary.class){try{
            File f=file(id),backup=new File(f+".bak");if(!f.isFile()&&!backup.isFile()||f.length()>5*1024*1024||backup.length()>5*1024*1024)return null;
            JSONObject entry=new JSONObject(new String(new AtomicFile(f).readFully(),StandardCharsets.UTF_8));
            if(entry.optInt("schema")!=2||!id.equals(entry.optString("videoId")))return null;
            JSONObject payload=entry.getJSONObject("payload");return candidate(payload)!=null?payload:null;
        }catch(Exception ex){return null;}}
    }
    void offer(String id,JSONObject payload){
        if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return;
        final String bytes=payload.toString();if(bytes.length()>4*1024*1024)return;
        io.execute(()->{synchronized(LyricsLibrary.class){try{
            JSONObject oldPayload=get(id);Candidate old=oldPayload==null?null:candidate(oldPayload);
            JSONObject value=null;Candidate next=old;
            for(JSONObject variant:variants(new JSONObject(bytes))){Candidate contender=candidate(variant);if(contender!=null&&(next==null||wins(contender,next))){value=variant;next=contender;}}
            if(value==null||next==null)return;
            if(oldPayload!=null&&oldPayload.toString().equals(value.toString()))return;
            if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("Library directory unavailable");
            byte[] data=new JSONObject().put("schema",2).put("videoId",id).put("saved",System.currentTimeMillis())
                    .put("key",next.key).put("quality",next.quality).put("payload",value).toString().getBytes(StandardCharsets.UTF_8);
            if(data.length>5*1024*1024)throw new IOException("Lyric library record exceeds bounded storage format");
            AtomicFile output=new AtomicFile(file(id));FileOutputStream stream=null;
            try{stream=output.startWrite();stream.write(data);output.finishWrite(stream);}catch(Exception e){output.failWrite(stream);throw e;}
        }catch(Exception ex){LyricsDiagnostics.record("Lyrics library","Could not save lyrics: "+ex.getClass().getSimpleName());}}});
    }
    private int priority(String key){JSONArray order=LyricsConfig.order(context);for(int i=0;i<order.length();i++)if(key.equals(order.optString(i)))return i;return 1000;}
    private boolean wins(Candidate a,Candidate b){
        if(a.key.equals(b.key))return a.quality>=b.quality;
        boolean sourceFirst="source".equals(LyricsConfig.preferences(context).getString("cachePolicy","quality"));
        int pa=priority(a.key),pb=priority(b.key);
        return sourceFirst?(pa!=pb?pa<pb:a.quality>b.quality):(a.quality!=b.quality?a.quality>b.quality:pa<pb);
    }
    record Candidate(String key,int quality){}
    /** Match the extension's provider envelopes before comparing independently selectable variants. */
    private static java.util.List<JSONObject> variants(JSONObject p)throws JSONException{
        java.util.List<JSONObject> out=new java.util.ArrayList<>();
        if(!"provider".equals(p.optString("event"))&&!"unison".equals(p.optString("kind"))){
            if("ttml".equals(p.optString("format"))&&p.optString("key").endsWith("-richsynced")){int q=LyricQuality.raw(p.optString("raw"),"ttml");if(q>=0&&q<2){p=new JSONObject(p.toString());p.put("key",p.optString("key").replace("-richsynced","-synced"));}}
            out.add(p);return out;
        }
        JSONObject metadata;String provider;
        if("unison".equals(p.optString("kind"))){
            metadata=p.getJSONObject("data");if(metadata.optJSONObject("data")!=null)metadata=metadata.getJSONObject("data");provider="unison";
            String format=metadata.optString("format"),key="plain".equals(format)?"unison-plain":"ttml".equals(format)?"unison-richsynced":"richsync".equals(metadata.optString("syncType"))?"unison-wordsynced":"unison-synced";
            variant(out,key,"Unison",format,metadata.optString("lyrics"),metadata);
        }else{
            metadata=p.getJSONObject("data");provider=metadata.optString("provider");JSONObject r=metadata.optJSONObject("results");if(r==null)return out;
            switch(provider){
                case "golyrics","binimum"->{String raw=r.optString("lyrics");if("golyrics".equals(provider)&&raw.startsWith("{")){JSONObject encoded=new JSONObject(raw);raw=encoded.optString("ttml");}String key="golyrics".equals(provider)?"bLyrics-richsynced":"binimum-richsynced";if("binimum".equals(provider)&&"line".equals(r.optString("timingType")))key="binimum-synced";variant(out,key,"golyrics".equals(provider)?"Better Lyrics":"BiniLyrics","ttml",raw,metadata);}
                case "qq"->variant(out,"portato-richsynced","Better Lyrics Portato","qrc",new JSONObject(r.optString("lyrics","{}")).optString("lyrics"),metadata);
                case "kugou"->variant(out,"legato-synced","Better Lyrics Legato","lrc",new JSONObject(r.optString("lyrics","{}")).optString("lyrics"),metadata);
                case "musixmatch"->{variant(out,"musixmatch-richsync","Musixmatch","lrc",r.optString("wordByWord"),metadata);variant(out,"musixmatch-synced","Musixmatch","lrc",r.optString("synced"),metadata);}
                case "lrclib"->{variant(out,"lrclib-synced","LRCLib","lrc",r.optString("synced"),metadata);variant(out,"lrclib-plain","LRCLib","plain",r.optString("plain"),metadata);}
                default->{}
            }
        }return out;
    }
    private static void variant(java.util.List<JSONObject> out,String key,String source,String format,String raw,JSONObject metadata)throws JSONException{
        if(raw.isBlank())return;int quality=LyricQuality.raw(raw,format);if(quality<0)return;
        if("ttml".equals(format)&&quality<2&&key.endsWith("-richsynced"))key=key.replace("-richsynced","-synced");
        JSONObject retained=new JSONObject(metadata.toString());retained.remove("lyrics");retained.remove("results");
        out.add(new JSONObject().put("key",key).put("source",source).put("format",format).put("raw",raw).put("sourceMetadata",retained));
    }
    static Candidate candidate(JSONObject p){
        try{
            String key=p.optString("key"),format=p.optString("format"),raw=p.optString("raw");
            JSONArray lines=p.optJSONArray("lyrics");
            if("cachedResult".equals(p.optString("kind"))){JSONObject r=p.getJSONObject("result");lines=r.optJSONArray("lyrics");raw=r.optString("raw");format=r.optString("format",format);}
            if("unison".equals(p.optString("kind"))){JSONObject d=p.optJSONObject("data");if(d==null)return null;if(d.optJSONObject("data")!=null)d=d.getJSONObject("data");raw=d.optString("lyrics");format=d.optString("format");key="plain".equals(format)?"unison-plain":"ttml".equals(format)?"unison-richsynced":"richsync".equals(d.optString("syncType"))?"unison-wordsynced":"unison-synced";}
            if("provider".equals(p.optString("event"))){JSONObject d=p.getJSONObject("data"),r=d.optJSONObject("results");if(r==null)return null;String provider=d.optString("provider");
                if("golyrics".equals(provider)||"binimum".equals(provider)){raw=r.optString("lyrics");format="ttml";key="golyrics".equals(provider)?"bLyrics-richsynced":"binimum-richsynced";}
                else if("qq".equals(provider)){raw=new JSONObject(r.optString("lyrics","{}")).optString("lyrics");format="qrc";key="portato-richsynced";}
                else if("musixmatch".equals(provider)){raw=r.optString("wordByWord");format="lrc";key="musixmatch-richsync";if(raw.isEmpty()){raw=r.optString("synced");format="lrc";key="musixmatch-synced";}}
                else if("kugou".equals(provider)){raw=new JSONObject(r.optString("lyrics","{}")).optString("lyrics");format="lrc";key="legato-synced";}
                else if("lrclib".equals(provider)){raw=r.optString("synced");format="lrc";key="lrclib-synced";if(raw.isEmpty()){raw=r.optString("plain");format="plain";key="lrclib-plain";}}
            }
            if(!key.matches("[A-Za-z-]{1,64}"))return null;
            int quality=lines!=null?LyricQuality.lines(lines):LyricQuality.raw(raw,format);
            if(quality<0)return null;
            return new Candidate(key,quality);
        }catch(Exception invalid){return null;}
    }
    JSONObject stats(){synchronized(LyricsLibrary.class){JSONObject result=new JSONObject();long bytes=0;int count=0;int[] tiers=new int[4];long[] tierBytes=new long[4];File[] files=directory.listFiles((d,n)->n.matches("[a-f0-9]{64}\\.json"));
        if(files!=null)for(File f:files){bytes+=f.length();try{if(f.length()>5*1024*1024)continue;JSONObject e=new JSONObject(new String(new AtomicFile(f).readFully(),StandardCharsets.UTF_8));int q=Math.max(0,Math.min(3,e.optInt("quality")));tiers[q]++;tierBytes[q]+=f.length();count++;}catch(Exception ignored){}}
        try{result.put("bytes",bytes).put("songs",count).put("plain",tiers[0]).put("line",tiers[1]).put("word",tiers[2]).put("syllable",tiers[3]);for(int i=0;i<4;i++)result.put(new String[]{"plainBytes","lineBytes","wordBytes","syllableBytes"}[i],tierBytes[i]);}catch(JSONException impossible){throw new AssertionError(impossible);}return result;
    }}
    void clear(Runnable done){io.execute(()->{synchronized(LyricsLibrary.class){for(File folder:new File[]{directory,new File(context.getCacheDir(),"bdcrusher-lyrics-v1")}){File[] files=folder.listFiles((d,n)->n.matches("[a-f0-9]{64}\\.json(?:\\.bak|\\.new)?"));if(files!=null)for(File f:files)if(!f.delete())LyricsDiagnostics.record("Lyrics library","Could not remove a saved lyric");}}new android.os.Handler(android.os.Looper.getMainLooper()).post(done);});}
}
