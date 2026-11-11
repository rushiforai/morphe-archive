package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/** Route gesture shortcuts through the actual native left-drawer handlers. */
public final class Dev138 {
    private static final String TAG="nicoid-gesture-menu";
    private static final String[] KEYS={
        "menu_ranking","menu_shorts","menu_video_id","menu_local_history",
        "menu_local_playlists","menu_cache","menu_mypage","menu_account_history",
        "menu_mylists","menu_watch_later","menu_following","menu_nicorepo",
        "menu_settings","menu_restart"
    };
    private static final String[] JA={
        "ランキングを開く","ショートを開く","動画ID入力",
        "本体の視聴履歴を開く","本体のプレイリストを開く","キャッシュリストを開く",
        "マイページを開く","アカウントの視聴履歴を開く","マイリストを開く",
        "とりあえずマイリストを開く","フォロー中を開く","ニコレポを開く",
        "アプリ設定を開く","アプリを再起動"
    };
    private static final String[] EN={
        "Open rankings","Open Shorts","Enter video ID","Open device watch history",
        "Open device playlists","Open cached videos","Open My Page",
        "Open account watch history","Open mylists","Open Watch Later",
        "Open following","Open Nico Reports","Open app settings","Restart app"
    };
    private static final String[] ZH={
        "開啟排行榜","開啟短片","輸入影片 ID","開啟裝置觀看紀錄",
        "開啟本機播放清單","開啟快取清單","開啟我的頁面",
        "開啟帳戶觀看紀錄","開啟我的播放清單","開啟稍後觀看",
        "開啟追蹤中","開啟 Nico 動態","開啟應用程式設定","重新啟動應用程式"
    };
    private Dev138(){}
    private static int index(String key){
        if(key==null)return -1;
        for(int i=0;i<KEYS.length;i++)if(KEYS[i].equals(key))return i;
        return -1;
    }
    /** The existing gesture mapping and defaults remain unmodified. */
    public static String[] extend(String[] existing){
        if(existing==null)return KEYS.clone();
        for(String key:KEYS)if(Arrays.asList(existing).contains(key))return existing;
        String[] out=Arrays.copyOf(existing,existing.length+KEYS.length);
        System.arraycopy(KEYS,0,out,existing.length,KEYS.length);
        return out;
    }
    public static String actionName(Context context,String key){
        int index=index(key);
        return index<0?null:Dev112.tr(context,JA[index],EN[index],ZH[index]);
    }
    public static boolean perform(Activity activity,String key){
        if(index(key)<0)return false;
        if(activity==null||activity.isFinishing()||activity.isDestroyed())return true;
        if(android.os.Looper.myLooper()!=android.os.Looper.getMainLooper()){
            activity.runOnUiThread(()->perform(activity,key));
            return true;
        }
        try{
            if(dispatchNativeMenu(activity,key))return true;
            if(dispatchKnownRoute(activity,key))return true;
            Log.w(TAG,"Gesture menu destination is not available: "+key);
        }catch(Exception error){
            Log.w(TAG,"Could not open gesture menu destination: "+key,error);
        }
        return true;
    }
    /** Build exactly the same rows used by the main drawer and invoke its click listener. */
    private static boolean dispatchNativeMenu(Activity activity,String key)throws Exception{
        Class<?> owner=Class.forName("com.sauzask.nicoid.NicoidTopActivity");
        Method build=owner.getMethod("a",Context.class,ListView.class,boolean.class);
        ListView list=(ListView)build.invoke(null,activity,null,true);
        if(list==null||list.getOnItemClickListener()==null)return false;
        AdapterView.OnItemClickListener listener=list.getOnItemClickListener();
        Field rowsField=listener.getClass().getDeclaredField("a");
        rowsField.setAccessible(true);
        Object raw=rowsField.get(listener);
        if(!(raw instanceof List))return false;
        List<?> rows=(List<?>)raw;
        for(int i=0;i<rows.size();i++){
            if(!(rows.get(i) instanceof Map))continue;
            Map<?,?> row=(Map<?,?>)rows.get(i);
            if(matches(key,row)){
                listener.onItemClick(list,(View)null,i,(long)i);
                return true;
            }
        }
        return false;
    }
    private static boolean matches(String key,Map<?,?> row){
        Object title=row.get("title");
        if(Boolean.TRUE.equals(row.get("islabel")))return false;
        Object raw=row.get("intent");
        Intent intent=raw instanceof Intent?(Intent)raw:null;
        String cls=intent==null||intent.getComponent()==null?
                   "":intent.getComponent().getClassName();
        int type=intent==null?-1:intent.getIntExtra("type",-1);
        if("menu_ranking".equals(key))return cls.endsWith(".NicoidRankingActivity");
        if("menu_shorts".equals(key))return intent!=null && intent.getData()!=null &&
                "nicoid-re".equals(intent.getData().getScheme()) &&
                "shorts".equals(intent.getData().getHost());
        if("menu_video_id".equals(key))
            return intent==null && number(row.get("type"))==2;
        if("menu_local_history".equals(key))
            return cls.endsWith(".NicoidVideoListActivity") && type==8;
        if("menu_account_history".equals(key))
            return cls.endsWith(".NicoidVideoListActivity") && type==4;
        if("menu_local_playlists".equals(key))
            return cls.endsWith(".NicoidNicorepoActivity") &&
                intent.getBooleanExtra("nicoid_local_playlists",false);
        if("menu_cache".equals(key))
            return cls.endsWith(".NicoidCacheManagerActivity");
        if("menu_mypage".equals(key))
            return cls.endsWith(".NicoidNicorepoActivity") &&
                intent.getBooleanExtra("nicoid_my_page",false);
        if("menu_mylists".equals(key))
            return cls.endsWith(".NicoidMylistGroupActivity");
        if("menu_watch_later".equals(key))
            return cls.endsWith(".NicoidVideoListActivity") && type==9;
        if("menu_following".equals(key))
            return cls.endsWith(".NicoidFavUserActivity");
        if("menu_nicorepo".equals(key))
            return cls.endsWith(".NicoidNicorepoActivity") &&
                !intent.getBooleanExtra("nicoid_my_page",false) &&
                !intent.getBooleanExtra("nicoid_local_playlists",false);
        if("menu_settings".equals(key))
            return cls.endsWith(".NicoidSetting") &&
                !intent.getBooleanExtra("login",false);
        if("menu_restart".equals(key))
            return intent==null&&number(row.get("type"))==4;
        return false;
    }
    private static int number(Object value){return value instanceof Number?((Number)value).intValue():-1;}
    /** Fallbacks reuse established native Activity classes, never a new web route. */
    private static boolean dispatchKnownRoute(Activity a,String key){
        Intent i=new Intent(Intent.ACTION_VIEW);
        String target=null;
        if("menu_ranking".equals(key)){
            target="NicoidRankingActivity";
            i.setData(Uri.parse("https://www.nicovideo.jp/ranking/fav/daily/all?rss=2.0"));
        }else if("menu_shorts".equals(key)){
            target="NicoidVideoActivity";i.setData(Uri.parse("nicoid-re://shorts"));
        }else if("menu_local_history".equals(key)){
            target="NicoidVideoListActivity";i.putExtra("type",8);
        }else if("menu_account_history".equals(key)){
            target="NicoidVideoListActivity";i.putExtra("type",4);
        }else if("menu_local_playlists".equals(key)){
            target="NicoidNicorepoActivity";i.putExtra("nicoid_local_playlists",true);
        }else if("menu_cache".equals(key)){
            target="NicoidCacheManagerActivity";
        }else if("menu_mypage".equals(key)){
            target="NicoidNicorepoActivity";i.putExtra("nicoid_my_page",true);
        }else if("menu_mylists".equals(key)){
            target="NicoidMylistGroupActivity";
        }else if("menu_watch_later".equals(key)){
            target="NicoidVideoListActivity";i.putExtra("type",9);
            i.setData(Uri.parse("deflist"));
        }else if("menu_following".equals(key)){
            target="NicoidFavUserActivity";
        }else if("menu_nicorepo".equals(key)){
            target="NicoidNicorepoActivity";
        }else if("menu_settings".equals(key)){
            target="NicoidSetting";
        }else if("menu_restart".equals(key)){
            try{Class.forName("e.e.a.ModernDebug").getMethod("restart",Context.class).invoke(null,a);return true;}
            catch(Exception err){Log.w(TAG,"Restart command unavailable",err);return false;}
        }else return false;
        i.setClassName(a,"com.sauzask.nicoid."+target);
        a.startActivity(i);
        a.overridePendingTransition(0,0);
        return true;
    }
}
