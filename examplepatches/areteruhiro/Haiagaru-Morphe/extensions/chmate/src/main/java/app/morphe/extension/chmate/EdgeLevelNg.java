package app.morphe.extension.chmate;

import android.content.*;
import android.util.SparseIntArray;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.time.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;

/** Independent, opt-in Edge visibility overlay and consented fact synchronization. */
final class EdgeLevelNg {
    static final String OBSERVED="edgeLevelObservedNg";
    private static final Map<Object,String> ORIGINS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static final AtomicBoolean queued=new AtomicBoolean(),loaded=new AtomicBoolean();
    private static volatile Map<String,EdgeLevelPolicy.Fact> facts=Collections.emptyMap();
    private static volatile long nextSync;
    private static volatile String factsSource="";
    static volatile String status="未同期";
    static Context context(){return Haiagaru.applicationContextForExtension();}
    static SharedPreferences config(){return context().getSharedPreferences(WacchoiSearchOptions.PREFS,0);}
    static boolean option(String key){return context()!=null&&config().getBoolean(key,false);}
    static String endpoint(){String s=context().getSharedPreferences(SharedNg.PREFS,0).getString("endpoint","");return s==null||s.trim().isEmpty()?SharedNg.DEFAULT_ENDPOINT:s;}
    static void bind(Object source,Object board){
        if(!option(OBSERVED))return;
        try{List<?> rows=rows(source);if(rows.isEmpty())return;ORIGINS.remove(rows.get(0));String url=ResponseArchiveEntry.snapshot(rows.get(0),board,"").url;String t=EdgeLevelPolicy.thread(url);if(t!=null)ORIGINS.put(rows.get(0),t);}catch(Exception ignored){}
    }
    static void bindLegacy(Object owner,boolean middle){try{bind(field(owner,middle?"J":"K"),field(field(owner,middle?"E":"M"),middle?"j":"f"));}catch(Exception ignored){}}
    static List<?> rows(Object source)throws Exception{if(!(source instanceof List))return Collections.emptyList();try{Object b=field(source,"mBase");if(b instanceof List)return (List<?>)b;}catch(NoSuchFieldException ignored){}return (List<?>)source;}
    static Object field(Object o,String n)throws Exception{return ResponseArchiveEntry.field(o,n);}
    static void apply(Object owner){
        if(owner==null||!option(OBSERVED))return;
        try{
            String s,m,enabled,no,id,name,date;boolean middle=false;
            switch(owner.getClass().getName()){
                case "o.m9ExternalSyntheticLambda1":s="K";m="N";enabled="p";no="o";id="h";name="n";date="q";break;
                case "o.listener":s="J";m="K";enabled="r";no="l";id="j";name="m";date="t";middle=true;break;
                case "o.zzaW":s="a";m="j";enabled="i";no="o";id="g";name="n";date="p";break;
                default:return;
            }
            if(!Boolean.TRUE.equals(field(owner,enabled)))return;
            List<?> all=rows(field(owner,s));if(all.isEmpty())return;
            if(!owner.getClass().getName().equals("o.zzaW")&&!ORIGINS.containsKey(all.get(0)))bindLegacy(owner,middle);
            String thread=ORIGINS.get(all.get(0));if(thread==null)return;
            Map<String,EdgeLevelPolicy.Fact> current=new HashMap<>();
            for(Object r:all){EdgeLevelPolicy.Fact f=EdgeLevelPolicy.parse(thread,((Number)field(r,no)).intValue(),(String)field(r,name),(String)field(r,date)+" ID:"+field(r,id));if(f!=null)EdgeLevelPolicy.put(current,f);}
            Map<String,EdgeLevelPolicy.Fact> known=factsSource.equals(endpoint())?facts:Collections.emptyMap();Object map=field(owner,m);
            Set<String> exceptions=config().getStringSet("edgeLevelExceptions",Collections.emptySet());
            for(Object r:all){EdgeLevelPolicy.Fact who=EdgeLevelPolicy.identity(thread,((Number)field(r,no)).intValue(),String.valueOf(field(r,id)),String.valueOf(field(r,date)));if(who==null||exceptions.contains(who.id)||exceptions.contains(who.key()))continue;
                EdgeLevelPolicy.Fact observed=current.get(who.key()),cached=known.get(who.key());if(cached!=null&&(observed==null||cached.at>observed.at))observed=cached;
                boolean hide=observed!=null&&option(OBSERVED)&&observed.level<=config().getInt("edgeLevelThreshold",5);
                if(hide){if(map instanceof SparseIntArray){SparseIntArray a=(SparseIntArray)map;a.put(who.response,a.get(who.response,0)|0x1008);}else if(map instanceof Map){@SuppressWarnings("unchecked") Map<Integer,Integer> a=(Map<Integer,Integer>)map;a.put(who.response,a.getOrDefault(who.response,0)|0x1008);}}
            }
            schedule(false);
        }catch(Exception unavailable){status="対象レスの情報を確認できません";}
    }
    static void schedule(boolean manual){
        if(context()==null||(!manual&&!config().getBoolean("edgeLevelAutoSync",true))||(!manual&&!option(OBSERVED))||(!manual&&System.currentTimeMillis()<nextSync)||!queued.compareAndSet(false,true))return;
        IO.execute(()->{try{if(loaded.compareAndSet(false,true))load();String source=endpoint();JSONObject feed=SharedNg.request("GET",source+"?action=edgeLevels",null);if(!feed.optBoolean("ok")||feed.optInt("format")!=1)throw new IOException("配信側が未対応です");
            if(!source.equals(endpoint()))throw new IOException("同期中に接続先が変更されました");feed.put("_endpoint",source);accept(feed);save(feed);nextSync=System.currentTimeMillis()+interval();status="同期済み：確認済み"+facts.size()+"件。スレを開き直すと反映";
        }catch(Exception e){nextSync=System.currentTimeMillis()+Math.max(interval(),30*60000L);status="同期失敗："+e.getMessage()+"（保存済みの情報を使用）";}finally{queued.set(false);}});
    }
    static long interval(){return Math.max(15,Math.min(1440,config().getInt("edgeLevelIntervalMinutes",30)))*60000L;}
    private static boolean recent(String day){try{long age=java.time.temporal.ChronoUnit.DAYS.between(LocalDate.parse(day),LocalDate.now(EdgeLevelPolicy.JST));return age>=0&&age<=7;}catch(Exception e){return false;}}
    private static EdgeLevelPolicy.Fact decode(JSONObject o){
        String thread=EdgeLevelPolicy.thread(o.optString("thread")),b=o.optString("board"),day=EdgeLevelPolicy.day(o.optString("day")),id=EdgeLevelPolicy.id(o.optString("id"));int level=o.optInt("level",-1),no=o.optInt("response");long at=o.optLong("at");
        String actualDay=at>0?Instant.ofEpochMilli(at).atZone(EdgeLevelPolicy.JST).toLocalDate().toString():"";
        return thread!=null&&b.equals(EdgeLevelPolicy.board(thread))&&day!=null&&recent(day)&&day.equals(actualDay)&&id!=null&&level>=0&&level<=9999&&no>0&&no<=10000&&at>0&&at<=System.currentTimeMillis()+300000?new EdgeLevelPolicy.Fact(b,day,id,level,at,thread,no):null;
    }
    private static void accept(JSONObject feed)throws Exception{
        if(!feed.optBoolean("ok")||feed.optInt("format")!=1||!endpoint().equals(feed.optString("_endpoint")))throw new IOException("未対応の配信形式または接続先");
        Map<String,EdgeLevelPolicy.Fact> incoming=new HashMap<>();JSONArray list=feed.getJSONArray("observed");if(list.length()>10000)throw new IOException("受信件数の上限");
        for(int i=0;i<list.length();i++){JSONObject o=list.getJSONObject(i);EdgeLevelPolicy.Fact f=decode(o);if(f!=null&&o.optBoolean("verified"))EdgeLevelPolicy.put(incoming,f);}
        facts=Collections.unmodifiableMap(incoming);factsSource=endpoint();
    }
    private static File cache(){return new File(context().getFilesDir(),"edge-level-facts.json");}
    private static void load(){try(InputStream in=new android.util.AtomicFile(cache()).openRead()){accept(new JSONObject(SharedNg.read(in,4*1024*1024)));}catch(Exception ignored){}}
    private static void save(JSONObject feed)throws Exception{android.util.AtomicFile file=new android.util.AtomicFile(cache());FileOutputStream out=file.startWrite();try{out.write(feed.toString().getBytes(StandardCharsets.UTF_8));file.finishWrite(out);}catch(Exception e){file.failWrite(out);throw e;}}
    private EdgeLevelNg(){}
}
