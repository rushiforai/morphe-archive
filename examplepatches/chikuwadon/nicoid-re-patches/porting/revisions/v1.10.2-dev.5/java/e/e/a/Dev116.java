package e.e.a;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.provider.DocumentsContract;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Restore the native menu and image hooks for device playlists. */
public final class Dev116 {
    private static final ExecutorService IMAGES=Executors.newFixedThreadPool(2,r->{
        Thread t=new Thread(r,"nicoid-playlist-artwork");t.setPriority(Thread.MIN_PRIORITY);return t;
    });
    private static final Map<String,String> THUMBNAILS=new LinkedHashMap<String,String>(64,.75f,true){
        protected boolean removeEldestEntry(Map.Entry<String,String> e){return size()>400;}
    };
    private static final Set<String> PENDING=new HashSet<>();
    private static final Map<PreferenceActivity,SharedPreferences.OnSharedPreferenceChangeListener> LISTENERS=new java.util.WeakHashMap<>();
    private Dev116(){}

    /** Identify the native list adapter instead of guessing from the Activity tab state. */
    @SuppressWarnings({"rawtypes","unchecked"})
    public static void playlistMenu(Activity host,Object listener,Object row,Menu menu,List actions){
        if(host==null || listener==null || row==null || menu==null || actions==null)return;
        try{
            Object adapter=Dev112.get(listener,"e");
            if(!Boolean.TRUE.equals(Dev112.staticCall("e.e.a.LocalPlaylists","hasAdapter",new Class<?>[]{Object.class},adapter)))return;
            Class<?> owner=Class.forName("e.e.a.LocalPlaylists");
            Map<?,?> pages=(Map<?,?>)Dev112.field(owner,"ADAPTER_PAGES").get(null);
            Object page=pages.get(adapter);
            if(page==null || Dev112.get(page,"folder")==null)return;
            List<?> visible=(List<?>)Dev112.get(page,"visible");
            String url=String.valueOf(Dev112.staticCall("e.e.a.ListActions","value",new Class<?>[]{Object.class,String.class},row,"videourl"));
            String nativeId="";
            try{nativeId=String.valueOf(Dev112.get(row,"b"));}catch(Exception ignored){}
            String identity=null;
            for(Object o:visible){
                if(!(o instanceof JSONObject))continue;
                JSONObject video=(JSONObject)o;
                if(url.equals(video.optString("url")) || nativeId.equals(video.optString("videoId"))){
                    identity=video.optString("id","");break;
                }
            }
            if(identity==null || identity.isEmpty())return;
            final String selected=identity;
            int index=-1;
            for(int n=0;n<actions.size();n++){
                if(((Number)Dev112.get(actions.get(n),"id")).intValue()==18102){index=n;break;}
            }
            MenuItem move=menu.findItem(18102);
            if(move==null)move=menu.add(0,18102,100,Dev112.tr(host,"別のプレイリストに移動","Move to another playlist","移至其他播放清單"));
            move.setTitle(Dev112.tr(host,"別のプレイリストに移動","Move to another playlist","移至其他播放清單"));
            Runnable onMove=()->invokeOld(host,"moveVideo",selected);
            move.setOnMenuItemClickListener(i->{onMove.run();return true;});
            Class<?> type=Class.forName("e.e.a.ListActions$Action");
            Constructor<?> ctor=type.getDeclaredConstructor(MenuItem.class,Runnable.class);ctor.setAccessible(true);
            Object moveAction=ctor.newInstance(move,onMove);
            if(index<0){index=actions.size();actions.add(moveAction);}else actions.set(index,moveAction);
            if(menu.findItem(18105)==null){
                MenuItem remove=menu.add(0,18105,101,Dev112.tr(host,"プレイリストから削除","Remove from playlist","從播放清單移除"));
                Runnable onRemove=()->invokeOld(host,"confirmRemove",selected);
                remove.setOnMenuItemClickListener(i->{onRemove.run();return true;});
                actions.add(index+1,ctor.newInstance(remove,onRemove));
            }
        }catch(Exception e){android.util.Log.w("nicoid-playlist","Native playlist action binding failed",e);}
    }
    private static void invokeOld(Activity host,String method,String id){
        try{
            Method m=Dev112.class.getDeclaredMethod(method,Activity.class,String.class);
            m.setAccessible(true);m.invoke(null,host,id);
        }catch(Exception e){android.util.Log.w("nicoid-playlist","Playlist action failed",e);}
    }
    /** A hamburger button opens the app drawer, not a playlist parent. */
    public static boolean drawer(Activity activity,MenuItem item){
        if(activity==null || item==null || item.getItemId()!=android.R.id.home
            || !activity.getIntent().getBooleanExtra("nicoid_local_playlists",false))return false;
        try{
            Object drawer=Dev112.get(activity,"u");
            if(drawer==null)return false;
            Class<?> type=drawer.getClass();
            boolean open=(Boolean)type.getMethod("isDrawerOpen",int.class).invoke(drawer,Gravity.START);
            type.getMethod(open?"closeDrawer":"openDrawer",int.class).invoke(drawer,Gravity.START);
            return true;
        }catch(Exception e){android.util.Log.w("nicoid-navigation","Cannot open main drawer",e);return false;}
    }

    public static void playlistThumbnail(View row,BaseAdapter adapter,JSONObject video){
        if(row==null||video==null)return;
        ImageView image=thumbView(row);
        if(image==null)return;
        String original=video.optString("thumbnail","").trim();
        String id=video.optString("videoId","");
        String cached;
        synchronized(THUMBNAILS){cached=THUMBNAILS.get(id);}
        String resolved=validImage(original)?safeImage(original):cached;
        if(resolved!=null && !resolved.isEmpty()){
            try{
                Class<?> k=Class.forName("e.e.a.ShortImages");
                Method load=k.getDeclaredMethod("load",String.class,ImageView.class,TextView.class);
                load.setAccessible(true);load.invoke(null,resolved,image,null);
            }catch(Exception e){android.util.Log.w("nicoid-playlist","Thumbnail render unavailable",e);}
            return;
        }
        if(!id.matches("(?:sm|so|nm|ss)[0-9]+"))return;
        synchronized(PENDING){if(!PENDING.add(id))return;}
        WeakReference<BaseAdapter> weak=new WeakReference<>(adapter);
        IMAGES.execute(()->{
            String found=null;
            try{found=lookup(id);}catch(Exception ignored){}
            if(found==null)found=fallback(id);
            synchronized(THUMBNAILS){THUMBNAILS.put(id,found);}
            synchronized(PENDING){PENDING.remove(id);}
            BaseAdapter active=weak.get();
            if(active!=null) new android.os.Handler(android.os.Looper.getMainLooper()).post(active::notifyDataSetChanged);
        });
    }
    private static ImageView thumbView(View root){
        View area=root.findViewById(0x7f0800cd);
        if(area==null)area=root.findViewById(0x7f0801b2);
        if(area==null)return null;
        if(area instanceof ImageView)return(ImageView)area;
        if(area instanceof ViewGroup){
            ViewGroup box=(ViewGroup)area;
            for(int i=0;i<box.getChildCount();i++){
                ImageView child=firstImage(box.getChildAt(i));
                if(child!=null)return child;
            }
        }
        return null;
    }
    private static ImageView firstImage(View v){
        if(v instanceof ImageView)return(ImageView)v;
        if(v instanceof ViewGroup){
            ViewGroup g=(ViewGroup)v;
            for(int i=0;i<g.getChildCount();i++){
                ImageView child=firstImage(g.getChildAt(i));
                if(child!=null)return child;
            }
        }
        return null;
    }
    private static boolean validImage(String url){
        return url.startsWith("https://") || url.startsWith("http://") || url.startsWith("//");
    }
    private static String safeImage(String url){
        return url.startsWith("//")?"https:"+url:url.replaceFirst("^http://","https://");
    }
    private static String lookup(String id)throws Exception{
        String api="https://api.nicoad.nicovideo.jp/v1/contents/video/"+id;
        String json=read(api,128*1024);
        if(json!=null){
            JSONObject root=new JSONObject(json),data=root.optJSONObject("data");
            if(data!=null){
                String image=data.optString("thumbnailUrl","");
                if(validImage(image))return safeImage(image);
            }
        }
        String xml=read("https://ext.nicovideo.jp/api/getthumbinfo/"+id,128*1024);
        if(xml!=null){
            int a=xml.indexOf("<thumbnail_url>"),b=xml.indexOf("</thumbnail_url>");
            if(a>=0&&b>a){
                String image=xml.substring(a+15,b).trim().replace("&amp;","&");
                if(validImage(image))return safeImage(image);
            }
        }
        return null;
    }
    private static String read(String path,int limit){
        HttpURLConnection connection=null;
        try{
            connection=(HttpURLConnection)new URL(path).openConnection();
            connection.setConnectTimeout(4500);connection.setReadTimeout(4500);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("Accept","application/json, application/xml, text/xml");
            if(connection.getResponseCode()!=200)return null;
            try(InputStream in=connection.getInputStream();ByteArrayOutputStream data=new ByteArrayOutputStream()){
                byte[] buffer=new byte[4096];int n;
                while((n=in.read(buffer))!=-1){
                    if(data.size()+n>limit)return null;
                    data.write(buffer,0,n);
                }
                return data.toString("UTF-8");
            }
        }catch(Exception ignored){return null;}
        finally{if(connection!=null)connection.disconnect();}
    }
    private static String fallback(String id){
        String digits=id.replaceAll("\\D","");
        return "https://nicovideo.cdn.nimg.jp/thumbnails/"+digits+"/"+digits+".M";
    }

    public static void settings(PreferenceActivity activity){
        Preference mp4=activity.findPreference("mp4_tree_uri");
        Preference progress=activity.findPreference("show_watch_progress");
        if(progress!=null)progress.setSummary(Dev112.tr(activity,
            "視聴済み動画のサムネイル下端に再生位置を示す進捗バーを表示します",
            "Show a progress bar along the bottom of thumbnails for previously watched videos",
            "在已觀看影片的縮圖底部顯示播放進度條"));
        if(mp4==null)return;
        SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(activity);
        Runnable refresh=()->{
            mp4.setTitle(Dev112.tr(activity,"MP4の保存先フォルダ","MP4 save folder","MP4儲存資料夾"));
            String uri=prefs.getString("mp4_tree_uri","");
            String location=Dev112.tr(activity,"未指定（初回ダウンロード時に選択）","Not set (select when first downloading)","未設定（首次下載時選擇）");
            if(uri!=null&&!uri.isEmpty())try{location=DocumentsContract.getTreeDocumentId(Uri.parse(uri));}catch(Exception ignored){}
            mp4.setSummary(Dev112.tr(activity,"保存先: ","Location: ","儲存位置: ")+location+"\n"+
             Dev112.tr(activity,
               "保存したMP4は本アプリでは再生できません。外部の動画再生アプリをご利用ください",
               "Saved MP4 files cannot be played in this app. Use an external video player",
               "本應用程式無法播放儲存的MP4。請使用其他影片播放器"));
        };
        refresh.run();
        SharedPreferences.OnSharedPreferenceChangeListener old=LISTENERS.remove(activity);
        if(old!=null)prefs.unregisterOnSharedPreferenceChangeListener(old);
        WeakReference<PreferenceActivity> weak=new WeakReference<>(activity);
        SharedPreferences.OnSharedPreferenceChangeListener listener=(preferences,key)->{
            if(!"mp4_tree_uri".equals(key))return;
            PreferenceActivity a=weak.get();
            if(a!=null&&!a.isFinishing())a.runOnUiThread(refresh);
        };
        prefs.registerOnSharedPreferenceChangeListener(listener);
        LISTENERS.put(activity,listener);
    }
}
