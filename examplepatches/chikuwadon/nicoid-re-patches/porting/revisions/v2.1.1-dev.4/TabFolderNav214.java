package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
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

    /** Adds a neutral option to the original long-press dialog (delete and cancel remain unchanged). */
    public static void offerMylistNewTab(AlertDialog.Builder builder,Object listener,int index){
        if(builder==null||listener==null||index<0)return;
        try {
            Activity activity=(Activity)get(listener,"a");
            final Activity origin=activity;
            final int position=index;
            builder.setNeutralButton(tr(activity,"新しいタブで開く","Open in new tab","在新分頁中開啟"),
                    (d,w)->openMylistNewTab(origin,position));
        }catch(Exception e){log("Unable to add new-tab action to mylist popup",e);}
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

    public static void offerLocalNewTab(AlertDialog.Builder builder,Object page,String id,String name,boolean isGroup){
        if(builder==null||page==null||isGroup||id==null)return;
        try {
            Activity activity=(Activity)get(page,"a");
            builder.setNeutralButton(tr(activity,"新しいタブで開く","Open in new tab","在新分頁中開啟"),
                    (d,w)->localNewTab(activity,id,name));
        }catch(Exception e){log("Unable to add local playlist new-tab action",e);}
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