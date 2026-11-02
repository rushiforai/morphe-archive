package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.json.JSONObject;
import org.json.JSONArray;
import java.io.File;
import java.util.LinkedHashMap;
import java.util.Map;

/** Reversible settings preset. This does not remove bytecode hooks from an installed APK. */
final class LightweightSetup {
    private static final String STORE="haiagaru.ads-only-preset", SNAPSHOT="before";
    private static Map<String,Map<String,Object>> changes(Activity activity)throws Exception{
        SettingsProfiles.catalog(activity);
        Map<String,Map<String,Object>> groups=new LinkedHashMap<>();
        groups.put(WacchoiSearchOptions.PREFS,SettingsProfiles.adsOnlyValues());
        for(String name:new String[]{PosterHighlight.PREFS,ProgrammableNgController.PREFS,
                "haiagaru.hidden-id-ng","haiagaru_imgur_web",StringReplacement.PREFS})
            groups.put(name,new LinkedHashMap<>(java.util.Collections.singletonMap("enabled",false)));
        groups.put("haiagaru.mega-sync.options",new LinkedHashMap<>(java.util.Collections.singletonMap("automatic",false)));
        Map<String,Object> hosts=new LinkedHashMap<>();hosts.put("imageHost","native");hosts.put("videoHost","native");
        groups.put("haiagaru_upload_hosts",hosts);
        Map<String,Object> actions=new LinkedHashMap<>();
        for(String key:new String[]{"wacchoiLongPressSearch","wacchoiLongPressSuffixSearch",
                "wacchoiLongPressPrefixSearch","wacchoiLongPressSuffixNg","wacchoiLongPressPrefixNg"})
            actions.put(key,false);
        for(int id:ResponseMenuSettings.IDS) {
            actions.put("visibility."+id,2);
            actions.put("responseVisibility."+id,2);
        }
        groups.put("haiagaru_response_actions",actions);
        File[] files=new File(activity.getApplicationInfo().dataDir,"shared_prefs").listFiles();
        if(files!=null)for(File file:files){
            String name=file.getName();if(!name.endsWith(".xml"))continue;
            name=name.substring(0,name.length()-4);
            Object raw=activity.getSharedPreferences(name,0).getAll().get("toolbarSettings");
            if(!(raw instanceof String))continue;
            JSONObject toolbar=new JSONObject((String)raw);JSONArray buttons=toolbar.optJSONArray("buttons");
            if(buttons==null)continue;
            boolean changed=false;
            for(int i=0;i<buttons.length();i++){
                JSONObject button=buttons.optJSONObject(i);if(button==null)continue;
                int id=button.optInt("id",Integer.MIN_VALUE);
                boolean custom=id>=0x7e000001&&id<=0x7e000006||id==FavoriteThreads.TAB;
                for(int action:ResponseMenuSettings.IDS)if(id==action)custom=true;
                if(custom){button.put("visible",false);changed=true;}
            }
            if(changed)groups.computeIfAbsent(name,k->new LinkedHashMap<>()).put("toolbarSettings",toolbar.toString());
        }
        return groups;
    }
    static void controls(Activity activity,LinearLayout root){
        Button apply=new Button(activity);apply.setText("広告だけの設定プリセットを適用（準備版）");root.addView(apply);
        TextView help=new TextView(activity);
        help.setText("追加機能の設定をまとめてオフにします。元の設定へ戻せます。ローカル自動バックアップの設定は維持します。クラッシュ防止処理とChMate標準機能は残ります。再起動後に反映します。");root.addView(help);
        Button restore=new Button(activity);restore.setText("プリセット適用前の設定に戻す");root.addView(restore);
        restore.setEnabled(activity.getSharedPreferences(STORE,0).contains(SNAPSHOT));
        apply.setOnClickListener(v->new HaiagaruDialog.Builder(activity).setTitle("広告だけの設定に変更")
                .setMessage("設定を退避してから変更します。ログ・認証情報・NGルールは削除しません。初回の退避設定は、繰り返し適用しても上書きしません。")
                .setNegativeButton("キャンセル",null).setPositiveButton("適用",(d,w)->{
                    try{apply(activity);restore.setEnabled(true);SettingsRestart.confirm(activity);}
                    catch(Exception error){error(activity,error);}
                }).show());
        restore.setOnClickListener(v->new HaiagaruDialog.Builder(activity).setTitle("適用前の設定に戻す")
                .setMessage("プリセットが変更した項目を適用前に戻します。適用後に個別変更した同じ項目も元に戻ります。その他の設定は維持します。")
                .setNegativeButton("キャンセル",null).setPositiveButton("戻す",(d,w)->{
                    try{restore(activity);restore.setEnabled(false);SettingsRestart.confirm(activity);}
                    catch(Exception error){error(activity,error);}
                }).show());
    }
    static void apply(Activity activity)throws Exception{
        Map<String,Map<String,Object>> groups=changes(activity);
        SharedPreferences store=activity.getSharedPreferences(STORE,0);
        JSONObject before=new JSONObject(store.getString(SNAPSHOT,"{}"));
        for(Map.Entry<String,Map<String,Object>> group:groups.entrySet()){
            SharedPreferences prefs=activity.getSharedPreferences(group.getKey(),0);
            JSONObject values=before.optJSONObject(group.getKey());
            if(values==null)values=new JSONObject();
            // Preserve the first value, including absence. New options in a later build
            // need their own snapshot before being changed for the first time.
            for(String key:group.getValue().keySet())if(!values.has(key))
                values.put(key,prefs.contains(key)?prefs.getAll().get(key):JSONObject.NULL);
            before.put(group.getKey(),values);
        }
        if(!store.edit().putString(SNAPSHOT,before.toString()).commit())throw new IllegalStateException("元の設定を退避できませんでした。変更していません。");
        for(Map.Entry<String,Map<String,Object>> group:groups.entrySet()){
            SharedPreferences.Editor editor=activity.getSharedPreferences(group.getKey(),0).edit();
            for(Map.Entry<String,Object> value:group.getValue().entrySet())write(editor,value.getKey(),value.getValue());
            if(!editor.commit())throw new IllegalStateException("設定の保存に失敗しました。退避設定から戻せます。");
        }
        for(WacchoiBackgroundJob job:WacchoiSearchService.jobs().values())if(job.running)job.cancel();
    }
    static void restore(Activity activity)throws Exception{
        SharedPreferences store=activity.getSharedPreferences(STORE,0);String raw=store.getString(SNAPSHOT,null);
        if(raw==null)return;
        JSONObject before=new JSONObject(raw);
        for(java.util.Iterator<String> names=before.keys();names.hasNext();){
            String name=names.next();
            // Old preset snapshots also contain backup.enabled. Restoring a UI
            // preset must not replace the user's current backup choice either.
            if(LocalAutoBackup.PREFS.equals(name))continue;
            JSONObject values=before.getJSONObject(name);
            SharedPreferences.Editor editor=activity.getSharedPreferences(name,0).edit();
            for(java.util.Iterator<String> keys=values.keys();keys.hasNext();){String key=keys.next();write(editor,key,values.get(key));}
            if(!editor.commit())throw new IllegalStateException("設定を復元できませんでした。退避設定は保持しています。");
        }
        if(!store.edit().remove(SNAPSHOT).commit())throw new IllegalStateException("設定は復元しましたが退避情報を消せませんでした。");
    }
    private static void write(SharedPreferences.Editor editor,String key,Object value){
        if(value==JSONObject.NULL)editor.remove(key);
        else if(value instanceof Boolean)editor.putBoolean(key,(Boolean)value);
        else if(value instanceof Integer)editor.putInt(key,(Integer)value);
        else if(value instanceof String)editor.putString(key,(String)value);
        else throw new IllegalArgumentException("設定の型が不正です: "+key);
    }
    private static void error(Activity activity,Exception error){
        new HaiagaruDialog.Builder(activity).setTitle("設定を完了できませんでした").setMessage(error.getMessage()).setPositiveButton("閉じる",null).show();
    }
    private LightweightSetup(){}
}
