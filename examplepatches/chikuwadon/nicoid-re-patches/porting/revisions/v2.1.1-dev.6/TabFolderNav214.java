package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.Toast;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import android.webkit.CookieManager;
import org.json.JSONObject;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import android.net.Uri;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Scoped routing for Mylist folder navigation and on-device playlist tabs.
 * The account Mylist network/mutation implementation is not modified.
 */
public final class TabFolderNav214 {
    private static final String TAG = "nicoid-folder-tabs";
    private static final String SAVED = "nicoid_saved_tab_id";
    private static final String LOCAL_FOLDER = "nicoid-local-folder:";
    private static final Map<String, Snapshot> MYLIST_ROOTS = new HashMap<>();
    private static final Map<String, String> LOCAL_ROOT_LABELS = new HashMap<>();
    private static final WeakHashMap<AlertDialog.Builder, GroupAction> FOLDER_ACTIONS = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Boolean> LEAVING_FOLDER = new WeakHashMap<>();
    private static final String FROM_ROOT = "nicoid_mylist_root_label";

    private static final class GroupAction {
        final Activity activity;final int index;final String id,title;
        GroupAction(Activity a,int i,String mylistId,String name){
            activity=a;index=i;id=mylistId;title=name;
        }
    }

    private TabFolderNav214() {}

    static final class Snapshot {
        final String screen, label, url, item;
        final int kind, type, folder;
        Snapshot(Object tab) throws Exception {
            screen = str(tab,"screen"); label = str(tab,"label");
            url = str(tab,"url"); item = str(tab,"item");
            kind = integer(tab,"kind"); type=integer(tab,"type"); folder=integer(tab,"folder");
        }
        void restore(Object tab) throws Exception {
            put(tab,"screen",screen); put(tab,"label",label);
            put(tab,"url",url); put(tab,"item",item);
            put(tab,"kind",kind); put(tab,"type",type); put(tab,"folder",folder);
        }
    }
    private static Field field(Class<?> cls, String name) throws Exception {
        for (Class<?> c=cls;c!=null;c=c.getSuperclass()) try {
            Field f=c.getDeclaredField(name); f.setAccessible(true); return f;
        } catch (NoSuchFieldException ignored) { }
        throw new NoSuchFieldException(name);
    }
    private static Object get(Object x,String name) throws Exception {return field(x.getClass(),name).get(x);}
    private static void put(Object x,String name,Object val) throws Exception {field(x.getClass(),name).set(x,val);}
    private static String str(Object x,String name) throws Exception {Object y=get(x,name);return y==null?"":y.toString();}
    private static int integer(Object x,String name) throws Exception {return ((Number)get(x,name)).intValue();}
    private static Object model() throws Exception {
        Class<?> cls=Class.forName("e.e.a.MultiTabs227");
        Method m=cls.getDeclaredMethod("data");m.setAccessible(true);return m.invoke(null);
    }
    private static Object selectedTab() throws Exception {
        Object m=model(); String id=str(m,"selected");
        Method f=m.getClass().getDeclaredMethod("find",String.class);f.setAccessible(true);
        return f.invoke(m,id);
    }
    private static Object host(Activity a) throws Exception {
        Class<?> cls=Class.forName("e.e.a.MultiTabs227");
        Object map=field(cls,"HOSTS").get(null);
        return ((Map<?,?>)map).get(a);
    }
    private static void save() throws Exception {
        Class<?> cls=Class.forName("e.e.a.MultiTabs227");
        Method m=cls.getDeclaredMethod("save");m.setAccessible(true);m.invoke(null);
    }
    private static void updateBar(Activity a) throws Exception {
        Object h=host(a);if(h==null)return;
        Method m=h.getClass().getDeclaredMethod("bar");m.setAccessible(true);m.invoke(h);
    }
    private static String tr(Context c,String ja,String en,String zh) {
        try {
            Class<?> cls=Class.forName("e.e.a.PanelUi");
            Method m=cls.getDeclaredMethod("tr",Context.class,String.class,String.class,String.class);
            m.setAccessible(true);return (String)m.invoke(null,c,ja,en,zh);
        } catch (Exception ignored) {
            String lang=c.getResources().getConfiguration().locale.getLanguage();
            return "ja".equals(lang)?ja:"zh".equals(lang)?zh:en;
        }
    }
    private static void log(String what,Exception e){Log.w(TAG,what,e);}

    /** Called only from native NicoidMylistGroupActivity$a when a folder is tapped. */
    public static void routeMylistTap(Activity source, Intent destination) {
        if (source==null||destination==null||destination.getIntExtra("type",-1)!=5
                ||!"NicoidMylistGroupActivity".equals(source.getClass().getSimpleName()))return;
        try {
            Object tab=selectedTab();
            if(tab==null||!"mylist".equals(str(tab,"screen")))return;
            String id=str(tab,"id");
            if(!MYLIST_ROOTS.containsKey(id))MYLIST_ROOTS.put(id,new Snapshot(tab));
            put(tab,"screen","list");
            put(tab,"kind",3);put(tab,"type",5);
            put(tab,"label",destination.getStringExtra("name"));
            put(tab,"url",destination.getDataString()==null?"":destination.getDataString());
            put(tab,"item",destination.getStringExtra("item")==null?"":destination.getStringExtra("item"));
            put(tab,"folder",destination.getIntExtra("folderid",-1));
            destination.putExtra(SAVED,id);
            destination.putExtra(FROM_ROOT,MYLIST_ROOTS.get(id).label);
            save();
        } catch(Exception e){log("Unable to reuse selected mylist tab",e);}
    }

    /** Restore the list tab identity when the Android Back stack returns to Mylist root. */
    public static void restoreMylistRoot(Activity activity) {
        if(activity==null||!"NicoidMylistGroupActivity".equals(activity.getClass().getSimpleName()))return;
        try {
            Object tab=selectedTab();
            if(tab==null)return;
            Snapshot original=MYLIST_ROOTS.remove(str(tab,"id"));
            if(original==null)return;
            original.restore(tab);save();
        }catch(Exception e){log("Unable to restore mylist root label",e);}
    }

    /** Native long-press constructs the original deletion confirmation first.
     *  Retain that builder, but display a separate action-choice dialog first. */
    public static void prepareMylistMenu(AlertDialog.Builder confirm,Object listener,int index) {
        if(confirm==null||listener==null||index<0)return;
        try{
            Activity a=(Activity)get(listener,"a");
            @SuppressWarnings("unchecked")
            ArrayList<HashMap<String,Object>> rows=(ArrayList<HashMap<String,Object>>)get(a,"z");
            if(index>=rows.size())return;
            Map<String,Object> row=rows.get(index);
            Object id=row.get("id"),title=row.get("title");
            if(id==null||title==null)return;
            FOLDER_ACTIONS.put(confirm,new GroupAction(a,index,id.toString(),title.toString()));
        }catch(Exception e){log("Unable to prepare folder action menu",e);}
    }

    public static AlertDialog mylistMenu(AlertDialog.Builder deleteConfirmation) {
        GroupAction action=FOLDER_ACTIONS.remove(deleteConfirmation);
        if(action==null)return deleteConfirmation.create();
        final Activity a=action.activity;
        try{
            Context c=dialogContext(a);
            final CharSequence[] actions={
                tr(c,"名前を変更","Rename","重新命名"),
                tr(c,"新しいタブで開く","Open in new tab","在新分頁中開啟"),
                tr(c,"削除","Delete","刪除")
            };
            return dialog(c).setTitle(action.title)
                .setItems(actions,(d,which)->{
                    if(a.isFinishing()||a.isDestroyed())return;
                    if(which==0)renameMylist(action);
                    else if(which==1)openMylistNewTab(a,action.index);
                    else if(which==2)showDeleteConfirm(deleteConfirmation);
                })
                .setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null)
                .create();
        }catch(Exception e){log("Unable to create Mylist action picker",e);
            return deleteConfirmation.create();}
    }

    private static Context dialogContext(Activity a){
        try{
            Class<?> cls=Class.forName("e.e.a.PlaybackSession");
            Method method=cls.getDeclaredMethod("dialogContext",Context.class);
            method.setAccessible(true);return (Context)method.invoke(null,a);
        }catch(Exception ignored){return a;}
    }
    private static AlertDialog.Builder dialog(Context c){
        try{
            Class<?> cls=Class.forName("e.e.a.UiDialogs");
            Method method=cls.getDeclaredMethod("builder",Context.class);
            method.setAccessible(true);return (AlertDialog.Builder)method.invoke(null,c);
        }catch(Exception ignored){return new AlertDialog.Builder(c);}
    }
    private static void showDeleteConfirm(AlertDialog.Builder original){
        AlertDialog d=original.create();
        try{
            Class<?> cls=Class.forName("e.e.a.PlaybackSession");
            Method m=cls.getDeclaredMethod("showDialog",AlertDialog.class);
            m.setAccessible(true);m.invoke(null,d);
        }catch(Exception e){d.show();}
    }

    private static void renameMylist(GroupAction selected){
        Activity a=selected.activity;if(a.isFinishing()||a.isDestroyed())return;
        Context c=dialogContext(a);
        EditText input=new EditText(c);
        input.setSingleLine(true);input.setText(selected.title);
        input.setSelectAllOnFocus(true);
        int h=(int)(c.getResources().getDisplayMetrics().density*20);
        android.widget.FrameLayout container=new android.widget.FrameLayout(c);
        container.setPadding(h,h/2,h,h/2);
        container.addView(input,new android.widget.FrameLayout.LayoutParams(-1,-2));
        dialog(c).setTitle(tr(c,"マイリスト名を変更","Rename Mylist","變更我的清單名稱"))
            .setView(container)
            .setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null)
            .setPositiveButton(tr(c,"保存","Save","儲存"),(d,w)->{
                String next=input.getText().toString().trim();
                if(next.isEmpty()||next.length()>100){
                    Toast.makeText(a,tr(a,"名前は1～100文字で入力してください","Name must be 1–100 characters","名稱須為1至100個字元"),Toast.LENGTH_LONG).show();return;
                }
                if(next.equals(selected.title))return;
                new Thread(()->updateRemoteName(selected,next),"nicoid-mylist-rename").start();
            }).show();
    }

    private static void updateRemoteName(GroupAction selection,String newName){
        final Activity a=selection.activity;
        String error=null;
        HttpURLConnection connection=null;
        try {
            if(!selection.id.matches("[0-9]+"))throw new IllegalArgumentException("Invalid Mylist ID");
            String endpoint="https://nvapi.nicovideo.jp/v1/users/me/mylists/"+selection.id;
            String cookie=CookieManager.getInstance().getCookie("https://nvapi.nicovideo.jp/");
            if(cookie==null||cookie.isEmpty())cookie=CookieManager.getInstance().getCookie("https://www.nicovideo.jp/");
            if(cookie==null||cookie.isEmpty())throw new IllegalStateException("Niconico login cookie unavailable");
            connection=(HttpURLConnection)new URL(endpoint).openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(12000);connection.setReadTimeout(12000);
            sessionHeaders(connection,cookie);
            if(connection.getResponseCode()!=200)throw new IllegalStateException("Mylist information GET: "+connection.getResponseCode());
            JSONObject json=new JSONObject(readBody(connection));
            JSONObject data=json.optJSONObject("data");
            JSONObject folder=data==null?null:data.optJSONObject("mylist");
            if(folder==null)throw new IllegalStateException("Mylist metadata missing");
            connection.disconnect();connection=null;
            StringBuilder form=new StringBuilder();
            form.append("name=").append(URLEncoder.encode(newName,"UTF-8"));
            for(String key:new String[]{"description","defaultSortKey","defaultSortOrder","isPublic"}){
                if(folder.has(key))form.append('&').append(key).append('=')
                    .append(URLEncoder.encode(folder.optString(key),"UTF-8"));
            }
            connection=(HttpURLConnection)new URL(endpoint).openConnection();
            connection.setRequestMethod("PUT");
            connection.setConnectTimeout(12000);connection.setReadTimeout(12000);
            sessionHeaders(connection,cookie);
            connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
            connection.setDoOutput(true);
            try(OutputStream out=connection.getOutputStream()){
                out.write(form.toString().getBytes(StandardCharsets.UTF_8));
            }
            int status=connection.getResponseCode();
            if(status!=200&&status!=204)throw new IllegalStateException("Mylist rename: HTTP "+status);
        }catch(Exception e){
            error=e.getMessage()==null?e.getClass().getSimpleName():e.getMessage();
            log("Mylist rename failed safely",e);
        }finally{if(connection!=null)connection.disconnect();}
        final String failure=error;
        a.runOnUiThread(()->{
            if(a.isFinishing()||a.isDestroyed())return;
            if(failure!=null){Toast.makeText(a,tr(a,"名前変更に失敗しました","Could not rename Mylist","重新命名失敗")+" ("+failure+")",Toast.LENGTH_LONG).show();return;}
            try{
                @SuppressWarnings("unchecked")
                ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)get(a,"z");
                if(selection.index<list.size() && selection.id.equals(String.valueOf(list.get(selection.index).get("id")))){
                    list.get(selection.index).put("title",newName);
                    android.widget.ListView view=(android.widget.ListView)get(a,"A");
                    if(view!=null && view.getAdapter() instanceof BaseAdapter)
                        ((BaseAdapter)view.getAdapter()).notifyDataSetChanged();
                }
            }catch(Exception e){log("Rename succeeded but UI refresh failed",e);}
            Toast.makeText(a,tr(a,"マイリスト名を変更しました","Mylist renamed","已重新命名我的清單"),Toast.LENGTH_SHORT).show();
        });
    }
    private static void sessionHeaders(HttpURLConnection c,String cookie){
        c.setRequestProperty("Cookie",cookie);
        c.setRequestProperty("X-Frontend-Id","6");
        c.setRequestProperty("X-Frontend-Version","0");
        c.setRequestProperty("X-Request-With","https://www.nicovideo.jp");
        c.setRequestProperty("Accept","application/json");
    }
    private static String readBody(HttpURLConnection conn)throws Exception{
        try(InputStream in=conn.getInputStream();java.io.ByteArrayOutputStream out=new java.io.ByteArrayOutputStream()){
            byte[] buf=new byte[4096];int n,total=0;
            while((n=in.read(buf))!=-1){total+=n;if(total>2_000_000)throw new IllegalStateException("Response too large");out.write(buf,0,n);}
            return out.toString("UTF-8");
        }
    }

    private static void openMylistNewTab(Activity activity,int index){
        try {
            @SuppressWarnings("unchecked")
            ArrayList<HashMap<String,Object>> groups=(ArrayList<HashMap<String,Object>>)get(activity,"z");
            if(index<0||index>=groups.size())return;
            Map<String,Object> entry=groups.get(index);
            Object id=entry.get("id"),title=entry.get("title");
            if(id==null||title==null)return;
            Class<?> playback=Class.forName("e.e.a.CachePlayback");
            Method parse=playback.getDeclaredMethod("parse",String.class);
            Uri uri=(Uri)parse.invoke(null,id.toString());
            Intent next=new Intent(Intent.ACTION_VIEW,uri);
            next.setClassName(activity,"com.sauzask.nicoid.NicoidVideoListActivity");
            next.putExtra("type",5);next.putExtra("name",title.toString());
            next.putExtra("nicoid_mylist_longpress_new_tab",true);
            activity.startActivity(next);
        }catch(Exception e){log("Unable to launch folder in a new tab",e);}
    }

    /** Return to the Mylist folder list without triggering app exit handling. */
    public static boolean backToMylistRoot(Activity activity){
        if(activity==null||!"NicoidVideoListActivity".equals(activity.getClass().getSimpleName()))return false;
        Intent origin=activity.getIntent();
        if(origin==null||origin.getIntExtra("type",-1)!=5||!origin.hasExtra(SAVED))return false;
        if(LEAVING_FOLDER.containsKey(activity))return true;
        String tabId=origin.getStringExtra(SAVED);
        if(tabId==null||tabId.isEmpty())return false;
        try{
            Object model=model();
            Method find=model.getClass().getDeclaredMethod("find",String.class);find.setAccessible(true);
            Object tab=find.invoke(model,tabId);
            if(tab==null)return false;
            Snapshot snapshot=MYLIST_ROOTS.get(tabId);
            if(snapshot!=null)snapshot.restore(tab);
            else{
                put(tab,"screen","mylist");put(tab,"kind",3);put(tab,"type",0);
                put(tab,"label",origin.getStringExtra(FROM_ROOT)==null?
                    tr(activity,"マイリスト","Mylist","我的清單"):origin.getStringExtra(FROM_ROOT));
                put(tab,"url","");put(tab,"item","");put(tab,"folder",-1);
            }
            save();
            Intent target=new Intent();
            target.setClassName(activity,"com.sauzask.nicoid.NicoidMylistGroupActivity");
            target.putExtra(SAVED,tabId);
            target.putExtra("nicoid_saved_tab_id",tabId);
            target.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT|Intent.FLAG_ACTIVITY_SINGLE_TOP|Intent.FLAG_ACTIVITY_NO_ANIMATION);
            LEAVING_FOLDER.put(activity,true);
            activity.startActivity(target);
            activity.finish();activity.overridePendingTransition(0,0);
            MYLIST_ROOTS.remove(tabId);
            return true;
        }catch(Exception e){LEAVING_FOLDER.remove(activity);log("Unable to navigate to Mylist root",e);return false;}
    }

    /** Keep local playlist tab caption and persisted tab descriptor in sync with folder navigation. */
    public static void localToolbar(Object page,String renderedTitle){
        if(page==null)return;
        try {
            Activity activity=(Activity)get(page,"a");
            if(activity==null)return;
            Object tab=selectedTab();
            Object h=host(activity);
            if(tab==null||h==null||!str(tab,"id").equals(str(h,"currentId"))
                    ||!"playlist".equals(str(tab,"screen")))return;
            String id=str(tab,"id"), folder=strOrEmpty(get(page,"folder"));
            String label;
            if(folder.isEmpty()) {
                label=LOCAL_ROOT_LABELS.remove(id);
                if(label==null)label=str(tab,"item").startsWith(LOCAL_FOLDER)
                        ? tr(activity,"本体プレイリスト","Device playlists","本機播放清單")
                        : str(tab,"label");
                if(str(tab,"item").startsWith(LOCAL_FOLDER))put(tab,"item","");
            }else {
                if(!LOCAL_ROOT_LABELS.containsKey(id))LOCAL_ROOT_LABELS.put(id,str(tab,"label"));
                label=renderedTitle==null||renderedTitle.isEmpty()?str(tab,"label"):renderedTitle;
                put(tab,"item",LOCAL_FOLDER+folder);
            }
            if(!label.equals(str(tab,"label"))) {
                put(tab,"label",label);save();updateBar(activity);
            }else save();
        }catch(Exception e){log("Unable to synchronize local playlist tab title",e);}
    }
    private static String strOrEmpty(Object x){return x==null?"":x.toString();}

    /** Extend the existing Rename / Move / Delete list, not the dialog buttons. */
    public static String[] localMenuItems(Context c,String[] existing,boolean isGroup){
        if(existing==null||isGroup)return existing;
        String[] result=Arrays.copyOf(existing,existing.length+1);
        result[existing.length]=tr(c,"新しいタブで開く","Open in new tab","在新分頁中開啟");
        return result;
    }
    public static DialogInterface.OnClickListener localMenuListener(
            DialogInterface.OnClickListener existing,Object page,String id,String name,
            boolean isGroup){
        if(existing==null||page==null||isGroup)return existing;
        final int newTabIndex=3;
        return (dialog,index)->{
            if(index==newTabIndex){
                try{localNewTab((Activity)get(page,"a"),id,name);}
                catch(Exception e){log("Unable to create local playlist tab",e);}
            }else existing.onClick(dialog,index);
        };
    }

    private static void localNewTab(Activity activity,String folderId,String label){
        try {
            Object h=host(activity);if(h==null)return;
            Class<?> tabType=Class.forName("e.e.a.SavedTabs227$Tab");
            Constructor<?> c=tabType.getDeclaredConstructor();c.setAccessible(true);
            Object tab=c.newInstance();
            put(tab,"screen","playlist"); put(tab,"kind",2);
            put(tab,"label",label); put(tab,"item",LOCAL_FOLDER+folderId);
            LOCAL_ROOT_LABELS.put(str(tab,"id"),
                    tr(activity,"本体プレイリスト","Device playlists","本機播放清單"));
            Method m=h.getClass().getDeclaredMethod("addTab",tabType);
            m.setAccessible(true);m.invoke(h,tab);
        }catch(Exception e){log("Unable to open local folder as separate tab",e);}
    }

    /** Existing match() ignores Tab.item; independent local folder tabs must not collapse. */
    public static boolean sameLocalTab(Object candidate,Object existing) {
        if(candidate==null||existing==null)return false;
        try {
            if(!"playlist".equals(str(candidate,"screen"))
                    ||!"playlist".equals(str(existing,"screen")))return true;
            return str(candidate,"item").equals(str(existing,"item"));
        }catch(Exception e){log("Unable to compare local folder tab identities",e);return false;}
    }

    /** Called after TabRoutes228.intent fills the native playlist extras. */
    public static void localIntent(Intent i,Object tab){
        if(i==null||tab==null)return;
        try {
            if(!"playlist".equals(str(tab,"screen")))return;
            String id=str(tab,"item");
            if(id.startsWith(LOCAL_FOLDER))i.putExtra("nicoid_playlist_folder",id.substring(LOCAL_FOLDER.length()));
        }catch(Exception e){log("Unable to encode local tab folder",e);}
    }

    /** Reactivate an existing independent local folder tab without creating a second Page instance. */
    public static void localActivated(Activity activity,Object tab){
        if(activity==null||tab==null)return;
        try {
            if(!"playlist".equals(str(tab,"screen")))return;
            String item=str(tab,"item");
            String folder=item.startsWith(LOCAL_FOLDER)?item.substring(LOCAL_FOLDER.length()):null;
            Class<?> cls=Class.forName("e.e.a.LocalPlaylists");
            Object map=field(cls,"PAGES").get(null);
            Object page=((Map<?,?>)map).get(activity);
            if(page==null)return;
            Object prev=get(page,"folder");
            if((prev==null&&folder==null)||(prev!=null&&prev.equals(folder)))return;
            put(page,"folder",folder);
            Method render=page.getClass().getDeclaredMethod("render");render.setAccessible(true);render.invoke(page);
        }catch(Exception e){log("Unable to activate local tab's playlist folder",e);}
    }
}