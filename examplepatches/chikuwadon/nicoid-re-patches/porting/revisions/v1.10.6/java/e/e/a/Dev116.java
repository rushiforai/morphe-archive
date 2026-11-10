package e.e.a;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Pattern VIDEO_ID = Pattern.compile("(?:sm|so|nm|ss)[0-9]+");
    // Cache and pending requests share a lock so a just-completed lookup cannot be queued twice.
    private static final Map<String, Map<BaseAdapter, Boolean>> PENDING = new HashMap<>();
    private static final Map<BaseAdapter, Boolean> DIRTY_ADAPTERS = new WeakHashMap<>();
    private static boolean refreshScheduled;
    private static final Runnable REFRESH_ARTWORK = () -> {
        refreshScheduled = false;
        List<BaseAdapter> adapters = new ArrayList<>(DIRTY_ADAPTERS.keySet());
        DIRTY_ADAPTERS.clear();
        for (BaseAdapter adapter : adapters) {
            if (adapter != null) adapter.notifyDataSetChanged();
        }
    };
    private static final Map<PreferenceActivity,SharedPreferences.OnSharedPreferenceChangeListener> LISTENERS=new java.util.WeakHashMap<>();
    private Dev116(){}

    /** Use the actual playlist page and stored row identity, including wrapped adapters. */
    @SuppressWarnings({"rawtypes","unchecked"})
    public static void playlistMenu(Activity host,Object listener,Object row,Menu menu,List actions){
        if(host==null || row==null || menu==null || actions==null)return;
        try{
            Class<?> owner=Class.forName("e.e.a.LocalPlaylists");
            Object adapter=listener==null?null:Dev112.get(listener,"e");
            Map<?,?> registered=(Map<?,?>)Dev112.field(owner,"ADAPTER_PAGES").get(null);
            Object page=adapter==null?null:registered.get(adapter);
            Map<?,?> pages=(Map<?,?>)Dev112.field(owner,"PAGES").get(null);
            if(page==null && pages!=null)page=pages.get(host);
            if(page==null || Dev112.get(page,"folder")==null)return;
            List<?> visible=(List<?>)Dev112.get(page,"visible");
            String url=String.valueOf(Dev112.staticCall("e.e.a.ListActions","value",new Class<?>[]{Object.class,String.class},row,"videourl"));
            String nativeId="";
            try{nativeId=String.valueOf(Dev112.get(row,"b"));}catch(Exception ignored){}
            String identity=null;
            for(Object item:visible){
                if(!(item instanceof JSONObject))continue;
                JSONObject video=(JSONObject)item;
                if(url.equals(video.optString("url")) || (!nativeId.isEmpty() && nativeId.equals(video.optString("videoId")))){
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
            Class<?> actionType=Class.forName("e.e.a.ListActions$Action");
            Constructor<?> ctor=actionType.getDeclaredConstructor(MenuItem.class,Runnable.class);
            ctor.setAccessible(true);
            Object moveAction=ctor.newInstance(move,onMove);
            if(index<0){index=actions.size();actions.add(moveAction);}else actions.set(index,moveAction);
            MenuItem remove=menu.findItem(18105);
            if(remove==null)remove=menu.add(0,18105,101,Dev112.tr(host,"プレイリストから削除","Remove from playlist","從播放清單移除"));
            remove.setTitle(Dev112.tr(host,"プレイリストから削除","Remove from playlist","從播放清單移除"));
            Runnable onRemove=()->invokeOld(host,"confirmRemove",selected);
            remove.setOnMenuItemClickListener(i->{onRemove.run();return true;});
            boolean present=false;
            for(Object action:actions)if(((Number)Dev112.get(action,"id")).intValue()==18105){present=true;break;}
            if(!present)actions.add(index+1,ctor.newInstance(remove,onRemove));
        }catch(Exception e){android.util.Log.w("nicoid-playlist","Playlist menu binding failed",e);}
    }
    private static void invokeOld(Activity host,String method,String id){
        try{
            Method m=Dev112.class.getDeclaredMethod(method,Activity.class,String.class);
            m.setAccessible(true);m.invoke(null,host,id);
        }catch(Exception e){android.util.Log.w("nicoid-playlist","Playlist action failed",e);}
    }
    /** Route through the app's existing, obfuscated ActionBarDrawerToggle. */
    public static boolean drawer(Activity activity,MenuItem item){
        if(activity==null||item==null||item.getItemId()!=android.R.id.home)return false;
        boolean playlist=activity.getIntent().getBooleanExtra("nicoid_local_playlists",false);
        if(!playlist)try{
            Map<?,?> pages=(Map<?,?>)Dev112.field(Class.forName("e.e.a.LocalPlaylists"),"PAGES").get(null);
            playlist=pages!=null && pages.containsKey(activity);
        }catch(Exception ignored){}
        if(!playlist)return false;
        try{
            Object toggle=null;
            for(Class<?> owner=activity.getClass();owner!=null;owner=owner.getSuperclass()){
                try{
                    Field f=owner.getDeclaredField("v");
                    f.setAccessible(true);
                    toggle=f.get(activity);
                    break;
                }catch(NoSuchFieldException ignored){}
            }
            if(toggle!=null){
                Method handle=toggle.getClass().getMethod("a",MenuItem.class);
                if(Boolean.TRUE.equals(handle.invoke(toggle,item)))return true;
            }
        }catch(Exception e){android.util.Log.w("nicoid-navigation","Native drawer toggle unavailable, delegating to Activity",e);}
        // Return false so the original Activity handles Home if our shortcut cannot.
        return false;
    }

    /** The native b0$a popup is the actual creation path; only intercept playlist adapters. */
    public static boolean nativePlaylistPopup(Object listener,Object popup){
        if(listener==null||popup==null)return false;
        try{
            Object adapter=Dev112.get(listener,"e");
            if(!Boolean.TRUE.equals(Dev112.staticCall("e.e.a.LocalPlaylists","hasAdapter",new Class<?>[]{Object.class},adapter)))return false;
            Class<?> menu=Class.forName("e.e.a.ListActions");
            Method extra=menu.getMethod("extra",Object.class,Object.class);
            Method show=menu.getMethod("show",Object.class,Object.class);
            extra.invoke(null,listener,popup);
            show.invoke(null,listener,popup);
            return true;
        }catch(Exception e){
            android.util.Log.w("nicoid-playlist","Native playlist popup bridge failed",e);
            return false;
        }
    }

    public static void playlistThumbnail(View row,BaseAdapter adapter,JSONObject video){
        if(row==null||video==null)return;
        ImageView image=thumbView(row);
        if(image==null){android.util.Log.w("nicoid-playlist","Thumbnail ImageView missing in native video row");return;}
        String original=video.optString("thumbnail","").trim();
        if(!validImage(original))original=video.optString("thumbnailUrl","").trim();
        if(!validImage(original))original=video.optString("thumbnail_url","").trim();
        if (validImage(original)) {
            loadImage(safeImage(original), image);
            return;
        }
        String id = video.optString("videoId", "");
        if (!VIDEO_ID.matcher(id).matches()) {
            Matcher matcher = VIDEO_ID.matcher(video.optString("url", ""));
            id = matcher.find() ? matcher.group() : "";
        }
        final String videoId = id;
        String cached;
        boolean startLookup = false;
        synchronized (THUMBNAILS) {
            cached = THUMBNAILS.get(videoId);
            if (cached == null && !videoId.isEmpty()) {
                Map<BaseAdapter, Boolean> waiters = PENDING.get(videoId);
                if (waiters == null) {
                    waiters = new WeakHashMap<>();
                    PENDING.put(videoId, waiters);
                    startLookup = true;
                }
                if (adapter != null) waiters.put(adapter, Boolean.TRUE);
            }
        }
        // Clear stale artwork when a native row is recycled.
        loadImage(cached == null ? "" : cached, image);
        if (!startLookup) return;
        IMAGES.execute(() -> {
            String found = null;
            try { found = lookup(videoId); } catch (Exception ignored) { }
            if (found == null) found = fallback(videoId);
            List<WeakReference<BaseAdapter>> adapters = new ArrayList<>();
            synchronized (THUMBNAILS) {
                THUMBNAILS.put(videoId, found);
                for (BaseAdapter waiting : PENDING.remove(videoId).keySet()) {
                    if (waiting != null) adapters.add(new WeakReference<>(waiting));
                }
            }
            MAIN.post(() -> {
                for (WeakReference<BaseAdapter> reference : adapters) {
                    BaseAdapter waiting = reference.get();
                    if (waiting != null) DIRTY_ADAPTERS.put(waiting, Boolean.TRUE);
                }
                if (!refreshScheduled && !DIRTY_ADAPTERS.isEmpty()) {
                    refreshScheduled = true;
                    MAIN.postDelayed(REFRESH_ARTWORK, 48);
                }
            });
        });
    }
    private static void loadImage(String url,ImageView image){
        try{
            // Native b0 hides this view while its own image loader is pending.
            // ShortImages sets the bitmap but does not restore visibility.
            if(url!=null&&!url.isEmpty())image.setVisibility(View.VISIBLE);
            Method load=Class.forName("e.e.a.ShortImages").getDeclaredMethod("load",String.class,ImageView.class,TextView.class);
            load.setAccessible(true);
            load.invoke(null,url,image,null);
        }catch(Exception e){android.util.Log.w("nicoid-playlist","Thumbnail image loader failed",e);}
    }
    /** Native thumbnail ID differs between list layouts; prefer that image and
     * otherwise choose the largest ImageView from the video row, not its icons. */
    private static ImageView thumbView(View root){
        for(int id:new int[]{0x7f0800cd,0x7f0801b2}){
            ImageView direct=firstImage(root.findViewById(id));
            if(direct!=null)return direct;
        }
        ArrayList<ImageView> found=new ArrayList<>();
        collectImages(root,found);
        ImageView best=null;long score=-1;
        for(ImageView image:found){
            ViewGroup.LayoutParams p=image.getLayoutParams();
            int width=image.getWidth()>0?image.getWidth():(p!=null&&p.width>0?p.width:1);
            int height=image.getHeight()>0?image.getHeight():(p!=null&&p.height>0?p.height:1);
            long area=(long)width*height;
            if(area>score){score=area;best=image;}
        }
        return best;
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
    private static void collectImages(View v,List<ImageView> found){
        if(v instanceof ImageView)found.add((ImageView)v);
        else if(v instanceof ViewGroup){
            ViewGroup g=(ViewGroup)v;
            for(int i=0;i<g.getChildCount();i++)collectImages(g.getChildAt(i),found);
        }
    }
    private static boolean validImage(String url){
        return url.startsWith("https://") || url.startsWith("http://") || url.startsWith("//");
    }
    private static String safeImage(String url){
        return url.startsWith("//")?"https:"+url:url.replaceFirst("^http://","https://");
    }
    private static String lookup(String id)throws Exception{
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
        updateMp4Setting(activity);

        SharedPreferences.OnSharedPreferenceChangeListener old=LISTENERS.remove(activity);
        if(old!=null)prefs.unregisterOnSharedPreferenceChangeListener(old);
        WeakReference<PreferenceActivity> weak=new WeakReference<>(activity);
        SharedPreferences.OnSharedPreferenceChangeListener listener=(preferences,key)->{
            if(!"mp4_tree_uri".equals(key))return;
            PreferenceActivity a=weak.get();
            if(a!=null&&!a.isFinishing())a.runOnUiThread(()->updateMp4Setting(a));
        };
        prefs.registerOnSharedPreferenceChangeListener(listener);
        LISTENERS.put(activity,listener);
    }
    /** SharedPreferences listener must not retain the Activity through a closure. */
    private static void updateMp4Setting(PreferenceActivity activity){
        Preference mp4=activity.findPreference("mp4_tree_uri");
        if(mp4==null)return;
        SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(activity);
        mp4.setTitle(Dev112.tr(activity,"MP4の保存先フォルダ","MP4 save folder","MP4儲存資料夾"));
        String uri=prefs.getString("mp4_tree_uri","");
        String location=Dev112.tr(activity,"未指定（初回ダウンロード時に選択）","Not set (select when first downloading)","未設定（首次下載時選擇）");
        if(uri!=null&&!uri.isEmpty())try{location=DocumentsContract.getTreeDocumentId(Uri.parse(uri));}catch(Exception ignored){}
        mp4.setSummary(Dev112.tr(activity,"保存先: ","Location: ","儲存位置: ")+location+"\n"+
            Dev112.tr(activity,
                "保存したMP4は本アプリでは再生できません。外部の動画再生アプリをご利用ください",
                "Saved MP4 files cannot be played in this app. Use an external video player",
                "本應用程式無法播放儲存的MP4。請使用其他影片播放器"));
    }
}
