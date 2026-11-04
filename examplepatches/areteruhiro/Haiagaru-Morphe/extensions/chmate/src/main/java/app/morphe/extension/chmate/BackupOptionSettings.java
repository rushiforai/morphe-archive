package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONObject;
import java.io.IOException;
import java.util.Iterator;

/** Portable save selections; exclude cloud deletion controls, credentials and execution history. */
final class BackupOptionSettings {
    static final String LOCAL="haiagaru.local-backup.options",MEGA="haiagaru.mega-sync.options";
    static boolean store(String name){return LOCAL.equals(name)||MEGA.equals(name);}
    static boolean key(String name,String key){
        return "categories".equals(key)||MEGA.equals(name)&&("mode".equals(key)||"intervalValue".equals(key)
                ||"intervalUnit".equals(key)||"showDiff".equals(key));
    }
    static void restore(Context context,String name,JSONObject values,boolean merge)throws Exception{
        SharedPreferences prefs=context.getSharedPreferences(name,0);
        SharedPreferences.Editor editor=prefs.edit();
        for(Iterator<String> keys=values.keys();keys.hasNext();){
            String key=keys.next();if(!key(name,key)||merge&&prefs.contains(key))continue;
            JSONObject typed=values.getJSONObject(key);
            if("showDiff".equals(key)){
                if(!"boolean".equals(typed.optString("type")))throw new IOException("バックアップ設定の型が不正です");
                editor.putBoolean(key,typed.getBoolean("value"));continue;
            }
            if(!"int".equals(typed.optString("type")))throw new IOException("バックアップ設定の型が不正です");
            int value=typed.getInt("value");
            if("categories".equals(key)?value<0||(value&~HaiagaruSyncSnapshot.ALL)!=0
                    :"intervalValue".equals(key)?value<1
                    :"mode".equals(key)?value<1||value>3
                    :value<0||value>2)throw new IOException("バックアップ設定が範囲外です");
            editor.putInt(key,value);
            if("categories".equals(key)&&MEGA.equals(name))editor.putBoolean("archiveCategoriesV2",true);
        }
        if(!editor.commit())throw new IOException("バックアップ設定を復元できません");
    }
    static void restoreLegacySelection(Context context,JSONObject snapshot,boolean merge)throws Exception{
        JSONObject settings=snapshot.getJSONObject("settings");
        if(settings.has(LOCAL))return;
        // Old ZIPs have no save-selection record. Their categories are the only
        // available evidence; only seed a new installation, never overwrite one.
        SharedPreferences local=context.getSharedPreferences(LOCAL,0);
        if(!local.contains("categories")&&!local.edit().putInt("categories",
                snapshot.getInt("categories")&HaiagaruSyncSnapshot.ALL).commit())
            throw new IOException("バックアップの保存対象を復元できません");
    }
    private BackupOptionSettings(){}
}
