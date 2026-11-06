package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.util.Log;
import android.widget.CheckBox;
import android.widget.Toast;
import java.util.*;

/** User-selected threads use the native patrol/DAT transaction, without changing favorites. */
public final class RefreshTargets {
    static final String KEY="manualRefreshTargets";
    private static final Map<Object,Boolean> workers=new WeakHashMap<>();
    private static long queuedAt=-3000;
    static SharedPreferences prefs(Context context){return context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);}
    static Set<String> selected(Context context){return new HashSet<>(prefs(context).getStringSet(KEY,Collections.emptySet()));}
    private static String identity(String board,long id){return board+"\n"+id;}
    private static String version(Context context)throws Exception{return context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;}

    static CheckBox control(Activity activity,Object info)throws Exception{
        String version=version(activity);boolean old=version.contains("191"),middle=version.contains("226");
        String server=(String)NativeFields.find(info.getClass(),old?"i":middle?"g":"f").get(info);
        String board=(String)NativeFields.find(info.getClass(),old?"b":middle?"f":"g").get(info);
        Long id=(Long)NativeFields.find(info.getClass(),middle?"c":"e").get(info);
        if(server==null||board==null||id==null||id<=0)return null;
        Object nativeBoard=nativeBoard(info,version);
        String key=identity(nativeBoard.toString(),id);
        CheckBox check=new CheckBox(activity);check.setText("更新対象に含む");check.setChecked(selected(activity).contains(key));
        check.setOnCheckedChangeListener((button,enabled)->{
            synchronized(RefreshTargets.class){
                Set<String> values=selected(activity);
                if(enabled&&values.size()>=100&&!values.contains(key)){
                    check.setChecked(false);Toast.makeText(activity,"更新対象は100件までです",Toast.LENGTH_LONG).show();return;
                }
                if(enabled)values.add(key);else values.remove(key);
                prefs(activity).edit().putStringSet(KEY,values).apply();
            }
            Toast.makeText(activity,enabled?"別の板・スレで更新すると、このスレの新着本文も取得します":"更新対象から外しました",Toast.LENGTH_SHORT).show();
        });
        return check;
    }
    static Object nativeBoard(Object info,String version)throws Exception{
        if(version.contains("191"))return info.getClass().getMethod("h").invoke(info);
        return info.getClass().getMethod(version.contains("226")?"e":"b",info.getClass()).invoke(null,info);
    }
    public static void refresh(Object fragment,int action){
        if(OpenTabsRefresh.dispatching())return;
        // Pull-to-refresh and the native re-fetch command use a resource ID,
        // whereas toolbar/gesture refresh uses action 5.
        if(action!=5&&action!=2131362342&&action!=2131296861&&action!=0x7f090244)return;
        Activity activity=Haiagaru.toolbarActivity(fragment);if(activity==null)return;
        if(action!=5)try{
            String version=version(activity);
            int expected=version.contains("191")?2131362342:version.contains("226")?2131296861:0x7f090244;
            if(action!=expected)return;
        }catch(Exception unavailable){return;}
        enqueue(activity);
    }
    public static void enqueue(Context context){
        synchronized(RefreshTargets.class){
            if(selected(context).isEmpty()||SystemClock.elapsedRealtime()-queuedAt<3000)return;
            queuedAt=SystemClock.elapsedRealtime();
        }
        try{
            String version=version(context);
            String owner=version.contains("191")?"o.mdExternalSyntheticLambda0":version.contains("226")?"o.settings":"o.TTRewardVideoActivity8";
            Class.forName(owner,false,context.getClassLoader()).getDeclaredMethod("haiagaruRefreshTargets",Context.class,boolean.class)
                    .invoke(null,context.getApplicationContext(),true);
        }catch(Exception error){Log.w("Haiagaru","Registered thread refresh unavailable",error);}
    }
    // Replaced with an exact native WorkManager Data getter for each supported version.
    private static boolean marker(Object data){return false;}
    public static synchronized void mark(Object worker,Object data){OpenTabsRefresh.mark(worker,data);if(marker(data))workers.put(worker,true);}
    private static synchronized boolean active(Object worker){return Boolean.TRUE.equals(workers.get(worker));}
    public static boolean download(Object worker,boolean original){return OpenTabsRefresh.download(worker,active(worker)||original);}
    public static String keywords(Object worker,String original){return active(worker)||OpenTabsRefresh.active(worker)?"":original;}
    public static List<?> filter(Object worker,List<?> rows){
        if(OpenTabsRefresh.active(worker))return OpenTabsRefresh.filter(worker,rows);
        if(!active(worker))return rows;
        ArrayList<Object> result=new ArrayList<>();
        Context context=Haiagaru.applicationContextForExtension();if(context==null)return result;
        Set<String> keys=selected(context);
        try{
            String version=version(context);String board=version.contains("242")?"b":"c";
            String thread=version.contains("191")?"d":version.contains("226")?"b":"c";
            for(Object row:rows){
                String nativeBoard=(String)NativeFields.find(row.getClass(),board).get(row);
                long id=((Number)NativeFields.find(row.getClass(),thread).get(row)).longValue();
                if(keys.contains(identity(nativeBoard,id)))result.add(row);
            }
        }catch(Exception error){Log.w("Haiagaru","Registered thread selection unavailable",error);result.clear();}
        return result;
    }
    private RefreshTargets(){}
}
