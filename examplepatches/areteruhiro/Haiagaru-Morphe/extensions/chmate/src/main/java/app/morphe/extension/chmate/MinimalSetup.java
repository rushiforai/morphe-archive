package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.widget.*;
import org.json.*;
import java.io.File;
import java.util.*;

/** Explicit opt-in. Never clears logs, sessions, rule contents or native settings. */
final class MinimalSetup {
    static final String PROMPT="minimalSetupPromptV1",ACTIVE="minimalSetupV1";
    static void offer(Activity a){if(!SettingsProfiles.prefs(a).getBoolean(PROMPT,false))show(a);}
    static boolean toolbarDefault(int id){return id==0x7e000001&&FeatureSwitches.enabled(ACTIVE,false);}
    static void show(Activity a){
        if(a.isFinishing()||a.isDestroyed())return;
        LinearLayout panel=new LinearLayout(a);panel.setOrientation(1);
        TextView info=new TextView(a);info.setText("最低限パッチとして以下を有効にし、他のHaiagaru追加機能を無効にします。\n\n"
            +"・エッヂの記者ID表示＆NG\n・エッヂ過去ログ検索のツールバー\n・Kyodemo／必死チェッカーの専用ビューア\n"
            +"・過去ログ自動取得\n・広告削除\n・ビューア\n・URLサムネイル取得\n・過去ログ検索\n\n"
            +"ログ・認証情報・登録済みルールは削除しません。通信互換性の修正や安全対策は残ります。元のChMate標準機能は変更しません。"
            +"ビューアなどは該当パッチの導入が必要です。あとから設定を個別に変更できます。");panel.addView(info);
        Switch on=new Switch(a);on.setText("最低限構成を有効にする");on.setChecked(false);panel.addView(on);
        new HaiagaruDialog.Builder(a).setTitle("Haiagaruの初期設定").setView(panel)
            .setNegativeButton("今は変更しない",(d,w)->SettingsProfiles.prefs(a).edit().putBoolean(PROMPT,true).apply())
            .setPositiveButton("決定",(d,w)->{
                if(!on.isChecked()){SettingsProfiles.prefs(a).edit().putBoolean(PROMPT,true).apply();return;}
                try{
                    SettingsProfiles.catalog(a);
                    if(!SettingsProfiles.apply(a,SettingsProfiles.minimalValues()))throw new IllegalStateException("設定の保存に失敗しました");
                    for(String name:new String[]{PosterHighlight.PREFS,ProgrammableNgController.PREFS,"haiagaru.hidden-id-ng","haiagaru.local-auto-backup"})
                        if(!a.getSharedPreferences(name,0).edit().putBoolean("enabled",false).commit())throw new IllegalStateException("追加機能の設定を保存できません");
                    if(!a.getSharedPreferences("haiagaru.mega-sync.options",0).edit().putBoolean("automatic",false).commit()
                        ||!a.getSharedPreferences("haiagaru_imgur_web",0).edit().putBoolean("enabled",false).commit()
                        ||!a.getSharedPreferences("haiagaru_upload_hosts",0).edit().putString("imageHost","native").putString("videoHost","native").commit())
                        throw new IllegalStateException("同期・アップロード設定を保存できません");
                    updateToolbars(a);
                    if(!SettingsProfiles.prefs(a).edit().putBoolean(ACTIVE,true).putBoolean(PROMPT,true).commit())throw new IllegalStateException("初期設定を保存できません");
                    for(WacchoiBackgroundJob job:WacchoiSearchService.jobs().values())if(job.running)job.cancel();
                    Haiagaru.refreshBoardListAfterReadSortChange();
                    SettingsRestart.confirm(a);
                }catch(Exception e){new HaiagaruDialog.Builder(a).setTitle("設定を完了できませんでした")
                    .setMessage("一部は保存されている可能性があります。\n"+e.getMessage()).setPositiveButton("閉じる",null).show();}
            }).show();
    }
    private static void updateToolbars(Context c)throws Exception{
        File[] files=new File(c.getApplicationInfo().dataDir,"shared_prefs").listFiles();if(files==null)return;
        for(File file:files){
            String name=file.getName();if(!name.endsWith(".xml"))continue;
            SharedPreferences p=c.getSharedPreferences(name.substring(0,name.length()-4),0);
            Object raw=p.getAll().get("toolbarSettings");if(!(raw instanceof String))continue;
            JSONObject root=new JSONObject((String)raw);JSONArray rows=root.optJSONArray("buttons");if(rows==null)continue;
            boolean changed=false;
            for(int i=0;i<rows.length();i++){
                JSONObject row=rows.optJSONObject(i);if(row==null)continue;int id=row.optInt("id",Integer.MIN_VALUE);
                boolean custom=id>=0x7e000001&&id<=0x7e000006||id==FavoriteThreads.TAB;
                for(int action:ResponseMenuSettings.IDS)if(id==action)custom=true;
                if(custom){row.put("visible",id==0x7e000001);changed=true;}
            }
            if(changed&&!p.edit().putString("toolbarSettings",root.toString()).commit())throw new IllegalStateException("ツールバー設定を保存できません");
        }
    }
    private MinimalSetup(){}
}
