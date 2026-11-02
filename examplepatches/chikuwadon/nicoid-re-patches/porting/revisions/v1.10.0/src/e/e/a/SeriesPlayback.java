package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.preference.PreferenceManager;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Build a series-only native queue and respect the configured tap playback mode. */
public final class SeriesPlayback {
    private static final ExecutorService WORK=Executors.newSingleThreadExecutor();
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Set<Activity> BUSY=Collections.newSetFromMap(new WeakHashMap<Activity,Boolean>());
    private static final Map<Activity,Object> CHANGES=new WeakHashMap<>();
    static final class QueueState {boolean repeat,touched;String series;QueueState(boolean repeat){this.repeat=repeat;}}
    private static final Map<Object,QueueState> QUEUES=new WeakHashMap<>();
    static boolean shuffled(Context c,String series){return PreferenceManager.getDefaultSharedPreferences(c).getBoolean("series_shuffle_"+series,false);}
    static boolean enabled(Context c,String series){return PreferenceManager.getDefaultSharedPreferences(c).getBoolean("series_continuous_"+series,false);}
    static Activity activity(Context c){for(int n=0;n<12&&c instanceof ContextWrapper&&!(c instanceof Activity);n++){Context next=((ContextWrapper)c).getBaseContext();if(next==null||next==c)break;c=next;}return c instanceof Activity?(Activity)c:null;}
    static void toggle(Context context,String series,boolean enabled){
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean("series_continuous_"+series,enabled).apply();
        Activity a=activity(context);if(a==null)return;
        Object fragment;String current;
        try{fragment=Review181.field(a,"v");current=HistoryRules.id(String.valueOf(Review181.field(fragment,"b0")));fragment.getClass().getField("C1");}catch(Exception unavailable){return;}
        Object token=new Object();synchronized(CHANGES){CHANGES.put(a,token);}
        if(!enabled){bind(fragment,null,0);return;}
        NetworkTask task=new NetworkTask();task.start(WORK,()->{try{
            ArrayList<JSONObject> videos=fetch(a,series,task);if(shuffled(context,series))Collections.shuffle(videos);ArrayList<Object> rows=rows(videos);int index=-1;
            for(int n=0;n<videos.size();n++)if(current.equals(HistoryRules.id(DetailData.target(videos.get(n))))){index=n;break;}
            if(index<0)throw new java.io.IOException("Current video is not in series");int selected=index;
            MAIN.post(()->{synchronized(CHANGES){if(CHANGES.get(a)!=token)return;}try{if(!a.isFinishing()&&!a.isDestroyed()&&current.equals(HistoryRules.id(String.valueOf(Review181.field(fragment,"b0"))))){bind(fragment,rows,selected);QueueState state=QUEUES.get(fragment);if(state!=null)state.series=series;}}catch(Exception ignored){}});
        }catch(Exception error){MAIN.post(()->{synchronized(CHANGES){if(CHANGES.get(a)!=token)return;}if(!a.isFinishing()&&!a.isDestroyed())Toast.makeText(a,PanelUi.tr(a,"シリーズを取得できませんでした","Unable to load series","無法載入系列"),Toast.LENGTH_SHORT).show();});}});
    }
    private static void bind(Object fragment,ArrayList<?> rows,int index){try{
        boolean enabled=rows!=null&&!rows.isEmpty()&&index>=0&&index<rows.size();
        boolean repeat=fragment.getClass().getField("F0").getBoolean(fragment);
        QueueState state=QUEUES.get(fragment);
        if(enabled&&state==null){QUEUES.put(fragment,new QueueState(repeat));fragment.getClass().getField("F0").setBoolean(fragment,false);}
        if(!enabled&&state!=null){QUEUES.remove(fragment);if(!state.touched)fragment.getClass().getField("F0").setBoolean(fragment,state.repeat);}
        fragment.getClass().getField("U0").setBoolean(fragment,false);
        fragment.getClass().getField("C1").set(fragment,enabled?rows:null);
        fragment.getClass().getField("D1").setInt(fragment,enabled?index:0);
        fragment.getClass().getField("U0").setBoolean(fragment,enabled);applyRepeat(fragment);
    }catch(Exception error){android.util.Log.w("nicoid-series","Unable to update playback queue",error);}}
    static void ensure(Context context,String series){if(!enabled(context,series))return;Activity a=activity(context);if(a==null)return;try{Object fragment=Review181.field(a,"v");QueueState state=QUEUES.get(fragment);if(state!=null&&series.equals(state.series)&&fragment.getClass().getField("U0").getBoolean(fragment))return;}catch(Exception ignored){}toggle(context,series,true);}
    public static void prepared(Object fragment){try{if(fragment.getClass().getField("U0").getBoolean(fragment)&&!QUEUES.containsKey(fragment)){QUEUES.put(fragment,new QueueState(fragment.getClass().getField("F0").getBoolean(fragment)));fragment.getClass().getField("F0").setBoolean(fragment,false);}}catch(Exception ignored){}applyRepeat(fragment);}
    public static void applyRepeat(Object fragment){try{Object player=Review181.field(fragment,"a0");boolean repeat=fragment.getClass().getField("F0").getBoolean(fragment);if(player!=null)player.getClass().getMethod("setRepeatMode",int.class).invoke(player,repeat?1:0);try{android.view.View button=(android.view.View)Review181.field(fragment,"p1");Class.forName("e.e.a.PlayerIcons").getMethod("background",android.view.View.class,int.class).invoke(null,button,repeat?0x7f07019d:0x7f07019c);}catch(Exception ignored){}}catch(Exception error){android.util.Log.w("nicoid-series","Unable to apply repeat",error);}}
    public static void toggleRepeat(Object fragment){try{boolean repeat=!fragment.getClass().getField("F0").getBoolean(fragment);fragment.getClass().getField("F0").setBoolean(fragment,repeat);QueueState state=QUEUES.get(fragment);if(state!=null)state.touched=true;applyRepeat(fragment);try{android.content.SharedPreferences.Editor editor=(android.content.SharedPreferences.Editor)Review181.field(fragment,"I1");editor.putBoolean("player_isloop",repeat).apply();}catch(Exception ignored){}}catch(Exception error){android.util.Log.w("nicoid-series","Unable to change repeat",error);}}
    public static boolean repeatCompletion(Object fragment){try{if(!fragment.getClass().getField("U0").getBoolean(fragment)||!fragment.getClass().getField("F0").getBoolean(fragment))return false;Object player=Review181.field(fragment,"a0");if(player!=null){player.getClass().getMethod("seekTo",long.class).invoke(player,0L);player.getClass().getMethod("start").invoke(player);}return true;}catch(Exception error){return true;}}
    private static ArrayList<JSONObject> fetch(Activity a,String series,NetworkTask task)throws Exception{
        ArrayList<JSONObject> videos=new ArrayList<>();Set<String> seen=new HashSet<>();
        for(int page=1;;page++){
            if(a.isFinishing()||a.isDestroyed())throw new java.io.InterruptedIOException();
            JSONObject data=VideoDetails.request("https://nvapi.nicovideo.jp/v1/playlist/series/"+series+"?pageSize=100&page="+page,"GET",false,task).getJSONObject("data");
            JSONArray items=data.optJSONArray("items");if(items==null)throw new java.io.IOException("Missing series items");int added=0;
            for(int n=0;n<items.length();n++){JSONObject item=CreatorData.video(items.optJSONObject(n));if(item==null)continue;String url=DetailData.target(item);if(!url.contains("/watch/")||!seen.add(url))continue;videos.add(item);added++;}
            if(SeriesPages110.finished(page,items.length(),added,data.has("hasNext"),data.optBoolean("hasNext"),data.optLong("totalCount",Long.MAX_VALUE)))break;
            if(page>=1000)throw new java.io.IOException("Series paging limit exceeded");
        }return videos;
    }
    private static ArrayList<Object> rows(ArrayList<JSONObject> videos)throws Exception{
        Class<?> type=Class.forName("e.e.a.x1");java.lang.reflect.Method put=type.getMethod("a",String.class,Object.class);ArrayList<Object> rows=new ArrayList<>();
        for(JSONObject item:videos){String url=DetailData.target(item);Object row=type.getConstructor().newInstance();put.invoke(row,"videourl",url);put.invoke(row,"title",item.optString("title"));put.invoke(row,"thumbnail",DetailData.thumbnail(item));for(String key:new String[]{"length","videoinfo","posttime"})put.invoke(row,key,new android.text.SpannableString(""));type.getField("b").set(row,HistoryRules.id(url));rows.add(row);}return rows;
    }
    static void open(Context context,String series,JSONObject selected,boolean continuous) {
        Context c=context;while(c instanceof ContextWrapper&&!(c instanceof Activity)){Context next=((ContextWrapper)c).getBaseContext();if(next==c)break;c=next;}
        if(!(c instanceof Activity))return;Activity activity=(Activity)c;
        if(!continuous){PlaylistPlayback.launchTap(activity,DetailData.target(selected),selected.optString("title"),new ArrayList<>(),0,false,false);return;}
        synchronized(BUSY){if(!BUSY.add(activity))return;}
        NetworkTask task=new NetworkTask();task.start(WORK,()->{
            try{
                ArrayList<JSONObject> videos=fetch(activity,series,task);if(shuffled(context,series))Collections.shuffle(videos);ArrayList<Object> rows=rows(videos);int selectedIndex=-1;
                for(int n=0;n<videos.size();n++)if(DetailData.target(videos.get(n)).equals(DetailData.target(selected)))selectedIndex=n;
                if(selectedIndex<0)throw new java.io.IOException("Selected series video is unavailable");int index=selectedIndex;
                MAIN.post(()->{if(!activity.isFinishing())PlaylistPlayback.launchTap(activity,DetailData.target(selected),selected.optString("title"),rows,index,true,false);});
            }catch(Exception error){MAIN.post(()->{if(!activity.isFinishing())Toast.makeText(activity,PanelUi.tr(activity,"シリーズを取得できませんでした","Unable to load series","無法載入系列"),Toast.LENGTH_SHORT).show();});}
            finally{synchronized(BUSY){BUSY.remove(activity);}}
        });
    }
}
