package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.preference.PreferenceManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.io.File;
import java.util.*;
import org.json.JSONObject;

/** Diagnoses counts read-only; explicit recovery edits presentation preferences only. */
public final class HomeDisplayRecovery {
    private static final String STORE="haiagaru.home-display-recovery";
    private static final String[] NATIVE={"enableTabletHome2","tabletHomeAlways2Pane","favoriteExcludeList"};
    static void addSettings(LinearLayout root,Activity activity){
        Button button=new Button(activity);button.setText("表示崩れ・お気に入りが見えない場合の診断");
        button.setOnClickListener(v->show(activity));root.addView(button);
    }
    static String counts(Context context){
        File file=context.getDatabasePath("roidon.sqlite");
        if(!file.isFile())return "保存データのデータベースが見つかりません。";
        StringBuilder result=new StringBuilder();
        try(SQLiteDatabase database=SQLiteDatabase.openDatabase(file.getPath(),null,SQLiteDatabase.OPEN_READONLY)){
            for(String table:new String[]{"bookmarks","boards"}){
                Set<String> columns=new HashSet<>();
                try(Cursor schema=database.rawQuery("PRAGMA table_info("+table+")",null)){
                    while(schema.moveToNext())columns.add(schema.getString(1));
                }
                if(columns.isEmpty())continue;
                long total;
                try(Cursor rows=database.rawQuery("SELECT count(*) FROM "+table,null)){rows.moveToFirst();total=rows.getLong(0);}
                result.append(table.equals("bookmarks")?"保存済みスレ情報":"保存済み板情報").append(": ").append(total).append("件\n");
                for(String rating:new String[]{"flag","rating","star","stars","favorite"}){
                    if(!columns.contains(rating))continue;
                    try(Cursor rows=database.rawQuery("SELECT count(*) FROM "+table+" WHERE "+rating+">0",null)){
                        rows.moveToFirst();result.append("  お気に入り: ").append(rows.getLong(0)).append("件\n");
                    }
                    break;
                }
            }
        }catch(RuntimeException error){return "保存データの件数を確認できませんでした（"+error.getClass().getSimpleName()+"）。";}
        return result.length()==0?"保存データの形式を確認できませんでした。":result.toString().trim();
    }
    static boolean phoneLayout(Context context){
        SharedPreferences nativePrefs=PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences features=FeatureSwitches.prefs(context);
        try{
            JSONObject saved=new JSONObject();
            for(String key:NATIVE)if(nativePrefs.contains(key))saved.put(key,nativePrefs.getAll().get(key));
            saved.put("automaticFoldModePresent",features.contains("automaticFoldMode"));
            saved.put("automaticFoldMode",features.getBoolean("automaticFoldMode",false));
            SharedPreferences archive=context.getSharedPreferences(STORE,0);
            // Preserve the original display configuration even after repeated recovery taps.
            if(!archive.contains("previous")&&!archive.edit().putString("previous",saved.toString()).commit())return false;
            if(!features.edit().putBoolean("automaticFoldMode",false).commit())return false;
            return nativePrefs.edit().putBoolean("enableTabletHome2",false).putBoolean("tabletHomeAlways2Pane",false)
                    .remove("favoriteExcludeList").commit();
        }catch(Exception error){return false;}
    }
    static boolean undo(Context context){
        try{
            SharedPreferences archive=context.getSharedPreferences(STORE,0);
            if(!archive.contains("previous"))return false;
            JSONObject saved=new JSONObject(archive.getString("previous","{}"));
            SharedPreferences.Editor nativeEdit=PreferenceManager.getDefaultSharedPreferences(context).edit();
            for(String key:NATIVE){
                nativeEdit.remove(key);if(!saved.has(key))continue;
                Object value=saved.get(key);
                if(value instanceof Boolean)nativeEdit.putBoolean(key,(Boolean)value);
                else if(value instanceof String)nativeEdit.putString(key,(String)value);
                else return false;
            }
            SharedPreferences.Editor features=FeatureSwitches.prefs(context).edit();
            if(saved.getBoolean("automaticFoldModePresent"))features.putBoolean("automaticFoldMode",saved.getBoolean("automaticFoldMode"));
            else features.remove("automaticFoldMode");
            if(!nativeEdit.commit()||!features.commit())return false;
            return archive.edit().remove("previous").commit();
        }catch(Exception error){return false;}
    }
    private static void show(Activity activity){
        new Thread(()->{
            String info=counts(activity);
            activity.runOnUiThread(()->{
                if(activity.isFinishing()||activity.isDestroyed())return;
                HaiagaruDialog.Builder dialog=new HaiagaruDialog.Builder(activity).setTitle("表示と保存データの診断")
                        .setMessage(info+"\n\n件数は保存データから読み取っています。表示だけの問題か、登録そのものが失われたかは、この件数と普段の件数を比較してください。\n\n下の操作はスマホ表示に戻し、HOMEのお気に入り除外条件を解除します。お気に入り・履歴・スレ・板は削除しません。変更前の表示設定にも戻せます。")
                        .setNegativeButton("閉じる",null)
                        .setPositiveButton("スマホ表示に戻す",(d,which)->{
                            if(phoneLayout(activity)){FoldLayout.settingsChanged();SettingsRestart.confirm(activity);}
                            else failed(activity);
                        });
                if(activity.getSharedPreferences(STORE,0).contains("previous"))
                    dialog.setNeutralButton("前の表示設定に戻す",(d,which)->{if(undo(activity)){FoldLayout.settingsChanged();SettingsRestart.confirm(activity);}else failed(activity);});
                dialog.show();
            });
        },"Haiagaru-display-diagnosis").start();
    }
    private static void failed(Activity activity){Toast.makeText(activity,"表示設定を保存できませんでした。",Toast.LENGTH_LONG).show();}
    private HomeDisplayRecovery(){}
}
